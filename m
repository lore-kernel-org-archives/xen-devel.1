Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C0606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Qh0A5nFV
Received: from list by lists.xenproject.org with outflank-mailman.1470340.1679084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL1-0008Eu-CE; Tue, 03 Nov 2026 17:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470340.1679084; Tue, 03 Nov 2026 17:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL1-0008El-8G; Tue, 03 Nov 2026 17:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1470340;
 Tue, 03 Nov 2026 17:30:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIKz-00085d-Lb
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIKz-004K23-23
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:21 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a2a-8faa-0a2a0a5109dd-0a2a450bb73c-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:21 +0100
Received: from [52.101.84.141]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a2c-b7e8-0a2a450b0019-3465548dff7a-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:20 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:19 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeeXNnlvSLVpiEo/GoQBsIEV7BF8Ko8nzxvNbgUQ0Qpogc/5m+2psG9nLVcQQXMapE1uzN+BnJ2jisN9SSomlbNShGhWevqKEK1jdqPSBgO7uTx8+M3HvwQV9END5lvI4iUeZ5RGtFCXL8cn7CgSr+F00h4Ua7tO9GpAc18HSbMapHw9RYFgvN5ZPFmBpQa8wBA9j9UqdxU9V7swJ5bV/FAAgsvcKAtrCflde/mCprHXo5qoocJiZfpy494nK8ETWYj5M9uNxPVIbenQaozkzdFyU8AqoBmaUxoGfoOdf/COxCP6L7aEJyNqitL3a2kZRb4kmocKgOm51Wbm6ePpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvp1JWtva9GSj9u2UUvi+2LXnPzddQcdT6wGm2JaJXk=;
 b=I7liL18Bv/JeApexuH4k67bAOnnXA+jXiSmoimVNu0cQQbUp6DWzRiLu+Zz1du5g/aZpB/4H+o0HdMkhV2CIUMVnPBIXQVQTrn8m3tDofTPLkNoX+hLYVNNyfEmX199QoCzr3BhmBaUU59ZAbpakIAB9slFz7GDxHfK+yZNtKUmhck2TnOHIGTfLvs4qUfB36FUbo1m4ty90bH6GPRpqOGasgGq1gXRlE0ctZrDPXKIjRi7Z/OJFQl4soynkFPNnU6qw2Hn+4qj3hQ7EWRDHRUE+G/UVFrReKdcs6cNze/2uZTzY51kGybXvDzqoG4ooe7qeDMPwQ4mdm4Kjk5ju0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvp1JWtva9GSj9u2UUvi+2LXnPzddQcdT6wGm2JaJXk=;
 b=Qh0A5nFVfJ7wBsvB70EhHp0v+7Qr70IO/eGxPbyQhd6ZluC3cwHKsmQ/VryUUYApxTJP4L5ccrSnLMdZ+a7JQfYXKAENxwZzd6g8/nVqmTVFEvs+JCZfz9kKNm+Qy8D8AENdoBJT03Uja81R4YfRG9z2dJjy5a+ykVQV7UsuBT4cyZTiP0YgoxngB8Pq3+itEiYC7nhllPCwGQ/oHl1f8O7RMUvg+NjYPy+bk8vkrgoAGJKOknnzZ4gMc8fd5kxkHbx6QJjgPnSmiqaTCNTDCLBT9Um4DXJRItlEeKGOpxIpxh/oCpLb6mlXd+mhLdT6HOYuaiIuvtz2ji7q1Keqqg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 03/22] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Topic: [PATCH v5 03/22] xen/arm: smmuv3: Alloc io_domain for each
 device
Thread-Index: AQHda7j/29wcCkNzHUuJF/zFPrPhCQ==
Date: Tue, 3 Nov 2026 17:30:19 +0000
Message-ID:
 <6340fb19c3067df38d9d5e82fe60ea8deba27700.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|DBBPR03MB10511:EE_
x-ms-office365-filtering-correlation-id: 1ad0fc14-6345-4130-9e6b-08df39d021ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 5BdYudiEuYhwkGVmDhCJvqjx1y/czAII8FWsYfps8eotYTxtEX9jYNTas2Am1q6kBpJXaOKrAjDx5/sZWArXO1+pdi34LV9cS3w7Qs91CWoFrkNySGh4ngsPiMCyTuQ1jy5QryFemC+1ytD6e85IENKowkZ9FNENZ6PwmrdTeBb5RWb1s0KqKFA/OiEzmglokXX/BVdp9LJRqhtbTMpyXS5gYI32hMcYRFndoXhViPw8tdiCAM9lc+0fn8d3+R32CnuNwrK9/0Ax/IA21FTFAyuXOmb7WJlmOF605k0dPRSTHowUUbZhzpEIx3PsBPrk8FIS6iJ2JsW60TEzNEwRlz+GmaUef5fdNS7UfqzB6OJtxOErEgjM0dbm203W/7rp+ghScHM1YUyKBixEz4qFtOI9sNmzZEiAwibXaXt+7gkrPDaAqxwOgj6sxg13zMWvKJXAVL7XCEvThwq5vn/Xf+PcCQvnb+xWihWHtf2zQbEFqgyc7A8QLgUQh8z4DDTXc+N1StQFfVLtIekYb4KcFPFvM8gFVC948e/HvlUOsAK9IWuEqb+BUKUjXSsbD1D8UoKuR/ZN1jDz6PD0jmFEj/QdOoV9X+xFIupN/gmPuyYhXPxRG547xBFp8xL5x74pt3xM+XDAFqtLWefDXmomsrQPoAQi5RtiVXYLDYvy2ry9MG4VwZ8gTSDots3e46GhFeCqiY65uV40vcbEfTEVLZEK68hpLeT7j1Qi2+uyzbs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xlCokqxiaqAv9hZAn3CJORafKbF4EG9NygvleeyW1JAGt4UUGgVXK1cPty?=
 =?iso-8859-1?Q?T01B4+EbfnaDf0TGvrSv0UGbEDRkyawwBzH3jZtedg6Ntmk/FypHRZVv6a?=
 =?iso-8859-1?Q?LBPESBMCUFnoXdODj4Y+Q1+YazZ0qXZ/gBx6Zvk6PwVzbvYhEkwTbcU+lR?=
 =?iso-8859-1?Q?H30ztPtUVSWhCMfFJ6DAVvptpAuBs+ezGXHcn6ibS+pCtyOoJVeNN5yBGV?=
 =?iso-8859-1?Q?2uFxu6O8MEJ3GsOr9ZE/Swq8LVhX/c0kX7ZA0o5UG0s3C0Avs2cGMYpUPJ?=
 =?iso-8859-1?Q?aphpObYeDwIFQio68IYXbRMdkdw0yU3Zah0lstSfqleah12xYL8ULRA7hj?=
 =?iso-8859-1?Q?hG2mbb+dUs7SeOX5FdtPOrVbuDjGDlRxTyTvHu4HuDvh5XX13UvTMK/n43?=
 =?iso-8859-1?Q?povQJ/SnXp442ia3WCYBpNv/+cbyO/8mTOGcpYIQDFIoDbUibjMhYFegAg?=
 =?iso-8859-1?Q?XOOzt4XVagAcFw3JtmN4zTcNNw+tjSrReqDqP5g5QRNEEPRZTmy57OIauQ?=
 =?iso-8859-1?Q?qMgFcA7drmka7/xvYTU7pk3qp0F6ZNGD3aKw3ZLCF5810RYQJ4QKKTRg04?=
 =?iso-8859-1?Q?HbYug1AyJwe9Kszi34wX/hEWg74RGHqTSZ0peoQYRhVXumAFf4nhTVRlsI?=
 =?iso-8859-1?Q?vrr7qRHAxmK1Loi/yonivoWEQ8oHyRoCxhx/1PQObOeVJRk2f6Un6tlRN7?=
 =?iso-8859-1?Q?EWDKr495ld0rHacP8Oj7go1KZqfM5RSs39GveJYJrNa7FkPqtCr2+mxM1c?=
 =?iso-8859-1?Q?D68HOP30WUX4kvFn0266WqfKQhHlck/YxVam7gyTEFVyA2YFOVof2rH5qh?=
 =?iso-8859-1?Q?E23Oe6uR3BjCuqQEKrJNFeFoPM3uyMcreMb+yyKLePlTTgwI4qx9vIGKSj?=
 =?iso-8859-1?Q?waMkS7KtAEe3OETqA5ya5tE8c9xu6mTYQvQc05P88z7G0RXwSjGMQ/NPbD?=
 =?iso-8859-1?Q?yH6fW6cdDgPjrPifa3G+Y7ni8XwS2jsRk3QXT3Dj49x57FtmMvCqXunQb0?=
 =?iso-8859-1?Q?NJ36WI9Ri5DCsPR3SCfZ6TU7QHBf5VFOVhzj0KSGORN/JYxSXeC9duI30u?=
 =?iso-8859-1?Q?XA/fwJvNq/bc0kP+jOGOl72AubrwBTwnZulLmxBY+sdQGz1m0oK1wCT7qH?=
 =?iso-8859-1?Q?1gveZ5OJJmKkbyVIVFZs+0fwRk0EJ0KqPgZ/arb+RXWcg6znPoHUuWOXEE?=
 =?iso-8859-1?Q?WHfxQQF4wG6WPodQtPdTHDnLGj+6gvXnvOT9gB18pDwS7A7ne06kLJfABd?=
 =?iso-8859-1?Q?dE8II9La+yhyyxUJW850tjl4dAyOCCOddD92iymREeh7kGH5G12PHd3DJ1?=
 =?iso-8859-1?Q?ztczBAOc3kqDbtFa+0SqqizxkIfJnxYSJKuVkdgUyP5F29lAohrPeCcFMk?=
 =?iso-8859-1?Q?NK/Pptvvopk++wKVmfqZsQ7JYgXnf+SKCJmH5H6wX3Zn8JCtaPx+1hYl+6?=
 =?iso-8859-1?Q?h/5i9HRXH4Ec3hWoZ7Aawj7gW4R5IbLtKdQubwU/sSE3Wnl+6LO45qw7Y8?=
 =?iso-8859-1?Q?SyImzh7VH6O0OsKM4SdQZisd3q7om66T+ZGW1dqrPbKr0mQdatB77XEeee?=
 =?iso-8859-1?Q?mYh0XVTHDyCMUsDJ7YryKyaumQSEey7eYaW83rA7YBqFZhdnvXw7+H4JuA?=
 =?iso-8859-1?Q?4hQ026WVW+TOIVire3l3z9up3SKmxUhX4wM0ePRLIxybc1Jjp/asDiqp/M?=
 =?iso-8859-1?Q?k7IfADnNh/BgpBoSHeEap0rmbAvBh8YXJpmyR8DcAW6yAwb9yIMwT/Mgfs?=
 =?iso-8859-1?Q?DVyIxmAsdfFVu7X/cj7nQMNWfgyxQYDb4Sovzsem+Ux+QFrV9VKKRwWc/6?=
 =?iso-8859-1?Q?rTYE4oWJzw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad0fc14-6345-4130-9e6b-08df39d021ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:19.2526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXzX4oxoXSYpyFcgNboJWkxYFsUa2BoZk2zCREZy4lplfvL+q+XqaCzA80oMhphIP1fRn597+9YaFrIvNbHP6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-42698a/1793727021-1B4D39EA-022A4BE8/0/0
X-purgate-type: clean
X-purgate-size: 6391
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

In current implementation io_domain is allocated once for each xen
domain as Stage2 translation is common for all devices in same xen
domain.

Nested stage supports S1 and S2 configuration at the same time. Stage1
translation will be different for each device as linux kernel will
allocate page-table for each device.

Alloc io_domain for each device so that each device can have different
Stage-1 and Stage-2 configuration structure.

The stage-2 configuration is now shared between devices belonging to
the same domain. Update io_domain initialization to create a new stage-2
configuration only if a VMID has not already been allocated for the
target Xen domain. Similarly, update io_domain teardown to free the
VMID only when no other devices are assigned to the target domain.
Also optimize the IOTLB flush procedure to invalidate each VMID only
once.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 102 ++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index ecfa7e4723..0b26bb27a2 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1229,14 +1229,49 @@ static void arm_smmu_bitmap_free(unsigned long *map=
, int idx)
 	clear_bit(idx, map);
 }
=20
+static struct arm_smmu_domain *arm_smmu_get_domain_s2(struct domain *d,
+				struct arm_smmu_device *smmu)
+{
+	struct iommu_domain *io_domain;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+
+	if (!smmu)
+		return NULL;
+
+	/*
+	 * Loop through the &xen_domain->contexts to locate a context
+	 * assigned to this SMMU
+	 */
+	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		smmu_domain =3D to_smmu_domain(io_domain);
+		if (smmu_domain->smmu =3D=3D smmu &&
+			smmu_domain->s2_cfg.vmid !=3D INVALID_VMID)
+				return smmu_domain;
+	}
+
+	return NULL;
+}
+
 static void arm_smmu_domain_free(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
+	struct arm_smmu_domain *existing;
=20
-	if (cfg->vmid)
-		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
+	if (cfg->vmid) {
+		/*
+		 * VMIDs are shared across contexts belonging to the same
+		 * Xen domain and SMMU. The current domain has already been
+		 * removed from the domain list, so this lookup only finds
+		 * remaining users of the VMID.
+		 */
+		existing =3D arm_smmu_get_domain_s2(smmu_domain->d, smmu);
+
+		if (!existing)
+			arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
+	}
=20
 	xfree(smmu_domain);
 }
@@ -1316,6 +1351,7 @@ static int arm_smmu_domain_finalise(struct iommu_doma=
in *domain,
 	int ret;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+	struct arm_smmu_domain *existing;
=20
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2)) {
 		smmu_domain->stage =3D ARM_SMMU_DOMAIN_ABORT;
@@ -1329,6 +1365,26 @@ static int arm_smmu_domain_finalise(struct iommu_dom=
ain *domain,
 	 */
 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
=20
+	/*
+	 * Look for an already initialized stage-2 configuration for this
+	 * Xen domain and SMMU.
+	 */
+	existing =3D arm_smmu_get_domain_s2(smmu_domain->d, smmu);
+
+	if (existing) {
+		/*
+		 * Reuse the stage-2 configuration.
+		 */
+		smmu_domain->s2_cfg.vmid =3D existing->s2_cfg.vmid;
+		smmu_domain->s2_cfg.vttbr =3D existing->s2_cfg.vttbr;
+		smmu_domain->s2_cfg.vtcr =3D existing->s2_cfg.vtcr;
+		return 0;
+	}
+
+	/*
+	 * If no existing stage-2 configuration for this
+	 * (Xen domain, SMMU), create it
+	 */
 	ret =3D arm_smmu_domain_finalise_s2(smmu_domain, master);
 	if (ret < 0)
 		return ret;
@@ -2865,20 +2921,40 @@ static uint32_t __ro_after_init platform_features =
=3D ARM_SMMU_FEAT_COHERENCY;
 static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
 {
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
-	struct iommu_domain *io_domain;
+	struct iommu_domain *io_domain, *prev;
=20
 	spin_lock(&xen_domain->lock);
=20
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(io_domain);
+
 		/*
 		 * Only invalidate the context when SMMU is present.
 		 * This is because the context initialization is delayed
 		 * until a master has been added.
 		 */
-		if (unlikely(!ACCESS_ONCE(to_smmu_domain(io_domain)->smmu)))
+		if (unlikely(!ACCESS_ONCE(smmu_domain->smmu)))
 			continue;
=20
-		arm_smmu_tlb_inv_context(to_smmu_domain(io_domain));
+		/*
+		 * Skip contexts that share the same SMMU and VMID with an
+		 * earlier context.
+		 */
+		list_for_each_entry(prev, &xen_domain->contexts, list) {
+			struct arm_smmu_domain *prev_domain =3D to_smmu_domain(prev);
+
+			if (prev =3D=3D io_domain)
+				break;
+
+			if (prev_domain->smmu =3D=3D smmu_domain->smmu &&
+				prev_domain->s2_cfg.vmid =3D=3D smmu_domain->s2_cfg.vmid)
+				break;
+		}
+
+		if (prev !=3D io_domain)
+			continue;
+
+		arm_smmu_tlb_inv_context(smmu_domain);
 	}
=20
 	spin_unlock(&xen_domain->lock);
@@ -2924,12 +3000,22 @@ static struct iommu_domain *arm_smmu_get_domain(str=
uct domain *d,
=20
 	/*
 	 * Loop through the &xen_domain->contexts to locate a context
-	 * assigned to this SMMU
+	 * assigned to this device
 	 */
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		unsigned long flags;
+		const struct arm_smmu_master *master;
+
 		smmu_domain =3D to_smmu_domain(io_domain);
-		if (smmu_domain->smmu =3D=3D smmu)
-			return io_domain;
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			if (master->dev =3D=3D dev) {
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 	}
 	return NULL;
 }
--=20
2.43.0

