USE VOLK_MyBase;

SELECT details.title as [Detail], providers.title as [Provider]
FROM details
FULL OUTER JOIN providers
ON details.provider_id = providers.provider_id
WHERE details.provider_id IS NULL AND providers.title IS NOT NULL;

SELECT details.title as [Detail], providers.title as [Provider]
FROM details
FULL OUTER JOIN providers
ON details.provider_id = providers.provider_id
WHERE providers.title IS NULL AND details.title IS NULL;

SELECT details.title as [Detail], providers.title as [Provider]
FROM details
FULL OUTER JOIN providers
ON details.provider_id = providers.provider_id
WHERE details.title IS NOT NULL AND providers.title IS NOT NULL;