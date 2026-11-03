Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D19606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=gYhkVrxy
Received: from list by lists.xenproject.org with outflank-mailman.1470363.1679174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILI-0002gF-Ht; Tue, 03 Nov 2026 17:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470363.1679174; Tue, 03 Nov 2026 17:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILI-0002fC-Al; Tue, 03 Nov 2026 17:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1470363;
 Tue, 03 Nov 2026 17:30:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILH-0002Sk-EE
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILG-004K6F-R7
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:38 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a35-2eae-0a2a0a5409dd-0a2a4506cece-24
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:38 +0100
Received: from [52.101.83.109]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a3c-195a-0a2a45060019-3465536dc8b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:38 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:34 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:34 +0000
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
 b=m8T2ztvcC86B07iAj7zFlqx7uXPMubmkTyhotziZGM0ih38FGKAJl3Fx6MGz5gusUXPeXJ2dEhcEGj+KbJ2SjvMxdtpQBQn4D723vef44ogzLuh61Uffhyjl8YXEpT2egqfi12odhjPzSmPzS16YoPnLUQSDOSfJJxyCavcSYnnGdHARzqbTmQ+XJv3vGcXplWBOvVfyddGH+HGOkbsGecWAZX2OAwwA9qEoGVix3aWBBCLCTTmNOxAFOSos1p98MOy91RhLZ/gSdddn+CLW/5PrvkQLZoIsjw3UrCk+0DTrm12GXl3Bh06Cg7LDLRUBOPE0cPN4QJsWJZyBaMrGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4aMPVR5bzl2+OAgq9I6OJ3Sq9zqxs7HTPitN6DAzrk=;
 b=rNVEYwKY9UvzO+6UYT1o4/IkZNrshhhM6Gdtr7ohEq/NehTkwODmvJwr0zwkN32aEayhl05xaMxbtwiwmUy5v4y7g5i2rbl5J9dc/i/huhWC/12Jggapl73NDJo1geg2oBusAErQaZbkDvmJD8fnwtslbCYJOdEAJS+9qK/o5XfdPhVsCPcovdJWQ/t+SlvM/gDzAq+7Z2rjDjlRVx/sNCqfip1RU+opnILjHo/QVFvWULxq/CH4wkgW76Aqt7CQzvg2AvBqswWbe/3HeeqNLbXQfVfrYL4z6OkOOKyYm8ubO1vRcnKcEfegQ2FZNktH3v/wzjOBgF+W8gB+wLfJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4aMPVR5bzl2+OAgq9I6OJ3Sq9zqxs7HTPitN6DAzrk=;
 b=gYhkVrxyMqOeY06C7x5xGJ1WLrAX9BfKCXhkXOEyNCf6Drt8ssYHGpXVjK15OcPC/IVEFUiErPXKqx3wDwfcn9RDAGyHRoRtjuaA112bt8X+2D8GzUdI2gyYmGo8kn4Jfq4gqfllbnv5cIS8ehbvNM7+XuntXHCdQreNM4DtMiIcrQDu9i1u2r3QfZzqEx7ksQ8gaHHDMUu61mnTDE6ILYc/0zUr5cOcRvg+ea5vEkcRK8t/nuzFDgbm6o5bMSvhhIzQRsdvu6S87Yj5R+DPly+iY4Byi4HGEFyZMNMZShtcQfGHD1YJH9xaUrKvA1DfwFTQhjorI6swc8RLxmhbnA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 13/22] xen/arm: vsmmuv3: IOMMU device tree node for dom0
Thread-Topic: [PATCH v5 13/22] xen/arm: vsmmuv3: IOMMU device tree node for
 dom0
Thread-Index: AQHda7kISK4xhrpTV06T0DJpXA828w==
Date: Tue, 3 Nov 2026 17:30:34 +0000
Message-ID:
 <4f88272d7a7d8c46dffffc688cb92ba2ac47d5ce.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: abcc8502-6bc6-4ae0-4e53-08df39d02b0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 QOOmPOuX0sXW7y/IoXjYvdEUKD9dw8qavAWC/rW6GIW8YgiyKaM88IZTLkQQyyYYpW4Ayjf04rOg5fxHcD/AHqpCwUa4t+qkUSIPWq91vIRqi8SKEHwCwnsYUs/Vbvv3m9MfHc5zVbEf5mKMdHVlBUGrQYFWouk7MisW48xBjZmzitT1l4qKUAxgnbjKQnerXlRRbRs2GjLtGKlhyPRzKH8J2RB9VzYgFKzv7vstBNZ97S3Q7MUjUxw/CeMboBiaAIqZWk7tY0UPyDZuGWAGNWYIsBciYxla5mKz5NdRSDe99JgUpsq6mKw79Pjq+VzQG0jtbmK9vLOMxssI2/u1vSZEW2PJDXD7rPoIibtT1skm1PSpXAE0bbxy3RuK2MjurmQUdIidvBfW11TbEYlL2NgBJ7E6QU1QePPySdlZLxMBvBxGcASotv5Jx3oFfP7NQEnvEpSNVlJrar4OeXLenUAwARsPnqDDRPqDkNBiv9bYLEedmP8R9nD3+hLUmaO+J0oO1jUbAuRzhzosouqrW2lbAlJO4M1JPjfacRxFyAxlSjFswrKYF7nO54izPtSYV8slH8ffoIGPL0PPKL1wqmQw7RLJPRVsurAP8bDdsjstavw2CrKm9I0atGbWAHOAJUaRml/DV1NxGAp+ci6MX19de7hpjPV5cPrgPZA0XpDxiHPJ2sThYqJY/8LU6lFBR2lQQPoMSeZZmzDxKd/S4j5M8D1f+9Hj63kKeq/X3BY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ekKjAeCR+2PJhzqo0Bf0JAOQByK4QYjT+v+AyIzC5SOXfMtqQB4tAoYOsp?=
 =?iso-8859-1?Q?uCB8drCZ/R4G89B7emqmS8fDRx+MXoi5rLxmEjvhFA+kyamABzF9mgAQYt?=
 =?iso-8859-1?Q?26Rz15V7KCnsP3YfxGkU40e6xO1wpgwteAx+4mmslzOp4VWN96RB6el3bp?=
 =?iso-8859-1?Q?gNp7RQlBImxNAEYmj0855D9sVNk6FPmFJ5rNg8Dlvnvy7Q9HAm54jQAkjA?=
 =?iso-8859-1?Q?dfj2iIgMq0SQAqx78JYMGxfjyJl68bP7cq+5n+0ZmUWO2E7aFFZQojTSkz?=
 =?iso-8859-1?Q?GrCfyF/x7pZiCEOfxPsTJJheiG7ZWm/ZZyqwXJ1huaJLKq1FfDyZOsX6GR?=
 =?iso-8859-1?Q?D91IZxHY5i7rrqSoPKcE0IMxD76pq24tOF7xHfeYn5J8T6s9vyjoEOQWfe?=
 =?iso-8859-1?Q?rBTYc/Atd8FI02zi3LP5Nr/ga+QFZKMPOiNNTDVLzO7R2VmdCtMyTe6vDQ?=
 =?iso-8859-1?Q?QkikOX70odkw9UktVJbi1NqTRXFKe1LaRIaRUi03tRSJb5IeJoxm8Ah/Nh?=
 =?iso-8859-1?Q?LQKAfIjwT1mnl9n2UcfgcsXYgA3SWuchO7+fUmUEjfqYP2JfSn/27j/Wdh?=
 =?iso-8859-1?Q?ImIqzsZ4miOaSmtUDhME0RKLC7B9RLEtjsAtiGIVE0dry7PlrfAm+Fhfgb?=
 =?iso-8859-1?Q?ddaqo8zo86xib9atDsMC9vfpcxfN70mYBPC4THniOG2Yonztlxzc3J/Zc4?=
 =?iso-8859-1?Q?S6zDwTZOEC2vQqAGmMeaAa48oD3zVcvktSxFzFr91IyKw/17m6o+KGf5nF?=
 =?iso-8859-1?Q?jwAMjt/2/R1AyoiS+1pZRBWPClcUjoaZn2XGmMVO0er4L79H4zHs6cgo1Z?=
 =?iso-8859-1?Q?qWnp/4su7ex5MNZr9CyqG2YhzdvvwfOCmtDYNQ5+QJOhlXj8ScODnbBevT?=
 =?iso-8859-1?Q?8lnFm/SqcGBkvvU3aHJKx0LAHqHDeVUzVeeRtnmhG28acMXA3qSGxCab44?=
 =?iso-8859-1?Q?3raSu/Nu52tEEbL56QR6q6PDKLkwEkKU7LRPq0aLrNN7BQ1uXjn01pVyGv?=
 =?iso-8859-1?Q?XAt/7k8+TOnmEhrYXypINhgurnhk4mE7ocbRGMwWhM4fhqrGL7BWiKdFJy?=
 =?iso-8859-1?Q?+njE6ue+M88z1OnCKD4BlmFcYqYsTwKFlfXIyIjEPY/LkBWw/BsHZsx+oK?=
 =?iso-8859-1?Q?PVChjz6935Hi6vW2zfc9o0dCupub6UwolbNx1xnpAsmiiRnawVLp19RA4/?=
 =?iso-8859-1?Q?9pmF/26jfE0WaUk54CR6+cgVo7JCEIN0X6Q9xaj9G292q3ilK1PmMLFgvM?=
 =?iso-8859-1?Q?SacCeK4wUbp5gNRB3TEIXTslMKJxtI36ivlsyHcmUJCV9Ds4rP9aBRqHd0?=
 =?iso-8859-1?Q?bnhYTm7CoNlmrHWD/ZtsGmzOfldcZ09xDbl3bvWwn0TmtDmYZpvbSNX6+K?=
 =?iso-8859-1?Q?UVqI5tnB8W1cGwYc6PihSgidEtgdETUsYZ4LnbYWwo9acM8aP85LOd9+1/?=
 =?iso-8859-1?Q?7lFsBkGhE6zNW0SkxTds3KluhiOi9PD7sGx44/KqqCRPSJ9uL81NVH4UTA?=
 =?iso-8859-1?Q?ctt4GKGD7FC5oVZ9buPOt1MpiJZYUsFMZhknSzKOUoVtdooXa66C5ROUyd?=
 =?iso-8859-1?Q?Xv/DDfkBnQAjBktpaSHVwD8nq1TplZ75IWMIyqlRM7uopqL9he6I82zOJj?=
 =?iso-8859-1?Q?KeJky/S/lqjglH6v5kGmOgM3fIYplWVcrUCcVU4xMlgPxMJeTWY8icMxE5?=
 =?iso-8859-1?Q?BDXN3AKCrbVgAff0JesVzL5HpZFsW496Dr6MfpMEE68plxRghMk8r/oj8v?=
 =?iso-8859-1?Q?ScYin89IyZhtTkdegKeQUiLMMVz56O+9Z2GztyAZklyBwzT3sr2t74u0Tp?=
 =?iso-8859-1?Q?kyOhBCpXZw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcc8502-6bc6-4ae0-4e53-08df39d02b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:34.8187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1viSIoUAVTJGXDT7wJqeASFLFjg/6N38k+Izv3nUVf7LtRmAqtbUbtpS/nfXqiJ/e0SIKB920eakUh7NtDHSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-16d1c6/1793727038-F6A7477B-51551D85/0/0
X-purgate-type: clean
X-purgate-size: 5241
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an IOMMU device tree node in the device tree
to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
IOMMU device tree node will only be created when viommu is enabled
via Kconfig build options.

"iommus" property will be added for dom0 devices to virtual
IOMMU node to enable the dom0 linux kernel to configure the IOMMU.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c       | 104 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/viommu.h |   1 +
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f749f9ae10..79727ce206 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -558,9 +558,12 @@ static int __init write_properties(struct domain *d, s=
truct kernel_info *kinfo,
             continue;
         }
=20
-        if ( iommu_node )
+        /*
+         * Expose IOMMU specific properties to hwdom when vIOMMU is
+         * enabled.
+         */
+        if ( iommu_node && viommu_get_type() =3D=3D XEN_DOMCTL_CONFIG_VIOM=
MU_NONE )
         {
-            /* Don't expose IOMMU specific properties to hwdom */
             if ( dt_property_name_is_equal(prop, "iommus") )
                 continue;
=20
@@ -1468,6 +1471,97 @@ int __init make_timer_node(const struct kernel_info =
*kinfo)
     return res;
 }
=20
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+static int __init make_hwdom_viommu_node(const struct kernel_info *kinfo,
+                                         struct dt_device_node *node)
+{
+    uint32_t len;
+    int res;
+    char buf[24];
+    void *fdt =3D kinfo->fdt;
+    const void *prop =3D NULL;
+    const struct dt_device_node *iommu =3D NULL;
+    struct host_iommu *iommu_data;
+    gic_interrupt_t intr;
+
+    if ( list_empty(&host_iommu_list) )
+        return 0;
+
+    list_for_each_entry( iommu_data, &host_iommu_list, entry )
+    {
+        if ( iommu_data->hwdom_node_created ||
+             iommu_data->dt_node->parent !=3D node->parent )
+            continue;
+
+        iommu =3D iommu_data->dt_node;
+
+        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
+
+        res =3D fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "compatible", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "compatible", prop, len);
+        if ( res )
+            return res;
+
+        if ( iommu->phandle )
+        {
+            res =3D fdt_property_cell(fdt, "phandle", iommu->phandle);
+            if ( res )
+                return res;
+        }
+
+        /* Use the same reg regions as the IOMMU node in host DTB. */
+        prop =3D dt_get_property(iommu, "reg", &len);
+        if ( !prop )
+        {
+            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "reg", prop, len);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "#iommu-cells", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "#iommu-cells", prop, len);
+        if ( res )
+            return res;
+
+        res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+        if ( res )
+            return res;
+
+        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+        res =3D fdt_property_interrupts(kinfo, &intr, 1);
+        if ( res )
+            return res;
+
+        iommu_data->hwdom_node_created =3D true;
+
+        fdt_end_node(fdt);
+    }
+
+    return res;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1536,6 +1630,12 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
     if ( dt_match_node(timer_matches, node) )
         return make_timer_node(kinfo);
=20
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+    if ( device_get_class(node) =3D=3D DEVICE_IOMMU &&
+         viommu_get_type() !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+        return make_hwdom_viommu_node(kinfo, node);
+#endif
+
     /* Skip nodes used by Xen */
     if ( dt_device_used_by(node) =3D=3D DOMID_XEN )
     {
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 844cf34d56..5ae21042f0 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -20,6 +20,7 @@ struct host_iommu {
     paddr_t size;
     /* Used for dom0 EVTQ and GERROR interrupts (1-1 IRQ mapping) */
     uint32_t irq;
+    bool hwdom_node_created;
 };
=20
 struct viommu_ops {
--=20
2.43.0

