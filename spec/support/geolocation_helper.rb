module GeolocationHelper
  def set_browser_geolocation(latitude, longitude, accuracy: 100)
    page.driver.browser.execute_cdp(
      'Emulation.setGeolocationOverride',
      latitude:,
      longitude:,
      accuracy:
    )
  end

  def set_failure_browser_geolocation
    page.driver.browser.execute_cdp('Emulation.setGeolocationOverride')
  end
end
