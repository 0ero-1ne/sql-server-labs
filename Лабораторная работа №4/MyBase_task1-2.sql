use VOLK_MyBase;

-- first task
SELECT details.sku as [Detail], providers.title as [Provider]
FROM details
INNER JOIN providers
ON details.provider_id = providers.provider_id;

-- second task
SELECT details.title as [Detail], providers.title as [Provider]
FROM details
INNER JOIN providers
ON details.provider_id = providers.provider_id
WHERE providers.title LIKE '%Do%';