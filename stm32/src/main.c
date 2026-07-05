#include <stdint.h>
#include <string.h>
#include <zephyr/device.h>
#include <zephyr/drivers/adc.h>
#include <zephyr/drivers/uart.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>
#include <zephyr/usb/usb_device.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

int main(void) {
  const struct device *usb_dev = DEVICE_DT_GET(DT_NODELABEL(my_label));
  const struct adc_dt_spec adc1 = ADC_DT_SPEC_GET(DT_PATH(zephyr_user));

  int err = 0;
  uint16_t buff = 0;

  if (!adc_is_ready_dt(&adc1)) {
    LOG_ERR("e1");
    return 1;
  }

  err = adc_channel_setup_dt(&adc1);
  if (err < 0) {
    LOG_ERR("e2");
    return 2;
  }

  struct adc_sequence sequence = {.buffer = &buff, .buffer_size = sizeof(buff)};
  //
  err = adc_sequence_init_dt(&adc1, &sequence);

  char data[] = "hello\r\n";
  int len = strlen(data);

  usb_enable(NULL);
  k_msleep(1000);

  while (1) {
    err = adc_read(adc1.dev, &sequence);
    uart_fifo_fill(usb_dev, (const int8_t *)&buff, 2);
    // uart_fifo_fill(usb_dev, data, len);
    k_usleep(1);
  }
}
