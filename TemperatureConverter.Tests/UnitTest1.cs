using Xunit;
using TemperatureConverter;

namespace TemperatureConverter.Tests
{
    public class TemperatureTests
    {
        [Fact]
        public void CelsiusToFahrenheit_ReturnsCorrectValue()
        {
            Assert.Equal(32, Temperature.CelsiusToFahrenheit(0), 3);
            Assert.Equal(212, Temperature.CelsiusToFahrenheit(100), 3);
        }

        [Fact]
        public void FahrenheitToCelsius_ReturnsCorrectValue()
        {
            Assert.Equal(0, Temperature.FahrenheitToCelsius(32), 3);
            Assert.Equal(100, Temperature.FahrenheitToCelsius(212), 3);
        }
    }
}