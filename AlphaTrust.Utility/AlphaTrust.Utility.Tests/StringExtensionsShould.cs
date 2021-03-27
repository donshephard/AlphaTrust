using FluentAssertions;
using Xunit;

namespace AlphaTrust.Utility.Tests
{
    public class StringExtensionsShould
    {
        [Theory]
        [InlineData("", true, true)]
        [InlineData(" ", false, false)]
        [InlineData(" ", true, true)]
        public void DetermineIfStringIsEmpty(string value, bool trimBefore, bool expected)
        {
            // Arrange

            // Act
            var sut = value.IsEmpty(trimBefore);

            // Assert
            sut.Should().Be(expected);
        }
    }
}