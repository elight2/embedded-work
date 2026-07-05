#include <8051.h>

// freq: 500Hz

// adjust buttons
#define DOWN_BUTTON P2_4
#define DOWN_OK 0
#define UP_BUTTON P2_5
#define UP_OK 0

// LCD seg controls
#define LED_G1 P2_7
#define LED_G2 P3_2

// PWM output
#define PWM_CTRL P2_6

// leds
#define FLOW_1 P2_3
#define FLOW_2 P2_2
#define FLOW_3 P2_1
#define FLOW_4 P2_0
#define FLOW_5 P1_7
#define FLOW_6 P1_6
#define FLOW_7 P1_5
#define FLOW_8 P1_4
#define FLOW_9 P1_3
#define FLOW_10 P1_2

// duty
volatile unsigned char duty = 50;
// 10ms tick
volatile unsigned char tick10ms = 0;

unsigned char pwmCount = 0;
unsigned short tick10msCount = 0;
void timer0Callback(void) __interrupt(1) {
  if (pwmCount < duty)
    PWM_CTRL = 0;
  else
    PWM_CTRL = 1;

  pwmCount++;
  if (pwmCount >= 100) {
    pwmCount = 0;
    tick10ms = 1;
  }
}

unsigned char adjustTickCount = 0;
unsigned char adjustFastTickCount = 0;
void adjustDuty(void) {
  if (DOWN_BUTTON == DOWN_OK && UP_BUTTON != UP_OK) {
    if (DOWN_BUTTON == DOWN_OK) {
      if (adjustTickCount == 0) {
        if (duty > 0)
          duty--;
      }
      if (adjustTickCount <= 100)
        adjustTickCount++;
    }

    if (DOWN_BUTTON != DOWN_OK && adjustTickCount > 0) {
      adjustTickCount = 0;
      adjustFastTickCount = 0;
    }

    if (adjustTickCount > 100) {
      adjustFastTickCount++;

      if (adjustFastTickCount > 10) {
        adjustFastTickCount = 0;
        if (duty > 0)
          duty--;
      }
    }
  } else if (UP_BUTTON == UP_OK && DOWN_BUTTON != DOWN_OK) {
    if (UP_BUTTON == DOWN_OK) {
      if (adjustTickCount == 0) {
        if (duty < 100)
          duty++;
      }
      if (adjustTickCount <= 100)
        adjustTickCount++;
    }

    if (UP_BUTTON != DOWN_OK && adjustTickCount > 0) {
      adjustTickCount = 0;
      adjustFastTickCount = 0;
    }

    if (adjustTickCount > 100) {
      adjustFastTickCount++;

      if (adjustFastTickCount > 10) {
        adjustFastTickCount = 0;
        if (duty < 100)
          duty++;
      }
    }
  } else if (DOWN_BUTTON != DOWN_OK && UP_BUTTON != UP_OK)
    adjustTickCount = adjustFastTickCount = 0;
}

void timerInit(void) {
  TMOD = 0x02;

  // 20us
  TH0 = 0xec;
  TL0 = 0xec;

  ET0 = 1;
  EA = 1;
  TR0 = 1;
}

// led
unsigned short dutyState = 0;
unsigned short flowState = 0;
unsigned short setFlowState = 0;
void syncDuty(void) {
  dutyState = 0;
  for (unsigned char i = 0; i < 10; i++) {
    if (duty >= ((i + 1) * 10))
      dutyState |= (1U << i);
  }
}
void flowControl(void) {
  flowState = (flowState << 1) | 1;
  if (flowState >= ((dutyState << 1) | 1))
    flowState = 0;

  setFlowState = flowState & dutyState;

  FLOW_1 = (setFlowState >> 0) & 1;
  FLOW_2 = (setFlowState >> 1) & 1;
  FLOW_3 = (setFlowState >> 2) & 1;
  FLOW_4 = (setFlowState >> 3) & 1;
  FLOW_5 = (setFlowState >> 4) & 1;
  FLOW_6 = (setFlowState >> 5) & 1;
  FLOW_7 = (setFlowState >> 6) & 1;
  FLOW_8 = (setFlowState >> 7) & 1;
  FLOW_9 = (setFlowState >> 8) & 1;
  FLOW_10 = (setFlowState >> 9) & 1;
}

// seg
__code unsigned char segTable[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66,
                                   0x6D, 0x7D, 0x07, 0x7F, 0x6F};
unsigned char nextDisplay = 0;
unsigned char p0State0[2] = {0};
void lcdControl(void) {
  if (DOWN_BUTTON == DOWN_OK || UP_BUTTON == UP_OK) {
    p0State0[0] = segTable[duty / 10];
    p0State0[1] = segTable[duty % 10];
  }

  if (duty == 0) {
    LED_G1 = 0;
    LED_G2 = 1;
    P0 = segTable[0];
  } else if (duty == 100) {
    LED_G1 = 1;
    LED_G2 = 1;
    P0 = 0xbf;
  } else {
    LED_G1 = 0;
    LED_G2 = 0;
    P0 = 0;

    if (nextDisplay == 0) {
      P0 = p0State0[0];
      LED_G1 = 1;
      nextDisplay = 1;
    } else {
      P0 = p0State0[1];
      LED_G2 = 1;
      nextDisplay = 0;
    }
  }
}

void main(void) {
  // init
  p0State0[0] = segTable[duty / 10];
  p0State0[1] = segTable[duty % 10];
  syncDuty();
  // vars
  unsigned char flowTimer = 0;
  unsigned char syncDutyTimer = 0;
  // timer
  timerInit();

  while (1) {
    if (tick10ms) {
      tick10ms = 0;

      // lcd
      lcdControl();
      // button
      adjustDuty();

      // flow led
      flowTimer++;
      if (flowTimer >= 10) {
        flowTimer = 0;
        flowControl();
      }

      // global sync duty
      syncDutyTimer++;
      if (syncDutyTimer >= 100) {
        syncDutyTimer = 0;
        if (DOWN_BUTTON == DOWN_OK || UP_BUTTON == UP_OK)
          syncDuty();
      }
    }
  }
}
