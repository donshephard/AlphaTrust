namespace AlphaTrust.Utility
{
    public static class StringExtensions
    {
        public static bool IsEmpty(this string value, bool trimBefore = true)
        {
            return string.IsNullOrEmpty(value) && !trimBefore || trimBefore && string.IsNullOrEmpty(value?.Trim());
        }
    }
}