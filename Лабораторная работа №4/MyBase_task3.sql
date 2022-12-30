use VOLK_MyBase;

-- first task
SELECT details.sku as [Detail], providers.title as [Provider]
FROM details, providers
WHERE details.provider_id = providers.provider_id;

-- second task
SELECT details.title as [Detail], providers.title as [Provider]
FROM details, providers
WHERE details.provider_id = providers.provider_id
AND providers.title LIKE '%Do%';