USE VOLK_MyBase;

SELECT details.title as [Detail], providers.title as [Provider]
FROM details
CROSS JOIN providers;