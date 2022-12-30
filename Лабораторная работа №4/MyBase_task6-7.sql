USE VOLK_MyBase;

-- task six
SELECT details.title as Detail, providers.title as [Provider]
FROM details
LEFT OUTER JOIN providers
ON details.provider_id = providers.provider_id;

-- task seven
SELECT details.title as Detail, providers.title as [Provider]
FROM details
RIGHT OUTER JOIN providers
ON details.provider_id = providers.provider_id;