Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC0C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:26:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415787.1645032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veV-0003mf-4s; Fri, 11 Sep 2026 07:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415787.1645032; Fri, 11 Sep 2026 07:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veV-0003mQ-1j; Fri, 11 Sep 2026 07:26:27 +0000
Received: by outflank-mailman (input) for mailman id 1415787;
 Fri, 11 Sep 2026 07:26:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x4veT-0003Nb-3e
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:26:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4veS-001KmU-G8
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:26:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad17-e002-0a2a0a5209dd-0a2a4507c276-26
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:24 +0200
Received: from [52.101.70.117]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad1d-b4ea-0a2a45070019-3465467530e0-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:23 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB8025.eurprd03.prod.outlook.com (2603:10a6:20b:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:26:20 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 07:26:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwYuMYDJ3VIiuHK0KW8jUZoHFYksSVPeCJlEVT0MjdTIAErlL+iq/tVikfSgN/bq7Gmqe7gp09hVZDrqsDpRIIh7iZUsN7RP50TDcBBLqdhsg/8ras2Pa6b38aQC7aQxWcCSMKVjIL7Y2rByrVulp3f0XQJ/VgSbJCJEPWKWmpE7sliOXBNUNSpYWrmek3L96EArnc8079Vpx/jei29HN6AuS6e/IMkGu+SAOEy1lfsPfs4vTPCtJ4np7GdjFjMsVyaQTfs6HmvG2wgfN44Koi3I3kfNYyqyUbbnppwNANIuJVNN/zOeoLrZ/i70IlpL2cscDJ/b6hTYEGOtugFRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUepeKXD3++9PTwq/nksHuSuVKPdsx05C4MGlKaWS6A=;
 b=mE2VwdBhgFpKinJ9Szr+XOBkeNqNNeuKUDgxXrwYcs8fB8n88T3bhIMq2TjaCx/PdOy21aryLPISCjryx//uWp1cUvR9GjBBVwIecMNISlcqe+tEw9YZi6okQo6UBdc9siid3kKvg7/xluEzI8y/cw10vmwqtX/7PqV8F/Xr9Gls4xudd+IIJh+hLgP6YfgTjJyf8ZY6LugqQ1Nc+UMbvnC1fvG6XZsWqrSrRM6vveWcB8QLvGDiDqybiLZS9gmBDKEcaK4GQtS64yDu+dMYmBLwA3klDjYNhufqvr12QxrIfeugEsd58p3X+6C2hfwK1po43O1SZS+58HeyEpWgqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUepeKXD3++9PTwq/nksHuSuVKPdsx05C4MGlKaWS6A=;
 b=OfPoPOuGNtXZPibn8pY3Rd90XGsXerJjGYa1sPtfmeX8b8v79Vs7eJZJL4/saOkg07qkaDOHfjMWnT+SHWzJyRegjgSIiLOYi5caGcYnko9IRUkL2ccdXA6urxRYogXf16DiS75rIPwnerzYDdvsCSPu27Ri+2P7ZuYdKw/Doaw+uk8eFnnEuleKqRqJwxGvgk5oVPpe85O2NmqBGiG+KEd5ge8k0V69irj4ZeoOaGC0naPd700Jg9+rQ+ARTgv0478TXZAkAk9Q3NmIQy3PALHUPUUp990bJCw7/NJ526n3L/P+u8IyWNIJ6toVrz2utMquNJYmYAVZ5lAe4YdB7Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v12 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v12 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHdQb7XatT4szy+tkiSRBw2OFmymQ==
Date: Fri, 11 Sep 2026 07:26:19 +0000
Message-ID:
 <f58a4999c04a270559af23b275bd8eec3ce699fa.1789055542.git.oleksii_moisieiev@epam.com>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1789055542.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB8025:EE_
x-ms-office365-filtering-correlation-id: fb363054-e952-4deb-03d7-08df0fd5f99a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|3023799007|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 aOUa/ORrh0Vk5xq0rJYhFssKJEBMMkLtLhZNkcRK57iD13kSa37lSrF7t6tykR186HlFk6erQ12WdWRnR3wmqnugYo7B330UU6Ce8lMLxK78/t7n+E82LV+DvaT+sVbqUcHHaOo9GWEHlO4NSvVoY4+3UgRLDi8P5HG4wAK4xdBZmdZG8BfMC0feQtDryUo92+CVN+MCmplydr696aO01XPvtdtbSpb4cRR2R4LmiAjclsAxaawt8UOda6E9vpsLrZnd4XFSDjLYzbySSmhCXj7/EsbO4IwwSZ7fa6jNQEykE5hLIuy37w3wNfHDaeVee05qmBwe/8biG+rL5JLHlcBEJM+33l2r6Q3WOlpHG1qXLESNqK6KAOdeK8ph70ZwEamqlAe63E730u8cqq6f0pbQDFFevXS5QXCGQtwHU4jM3vqPT8JVnxbicGJp0miG3DnvQodkF6G2CXcg3qXYQr4BLOm9MeGpwbXKl/7qU294oy3MLsFs4dZkNFm08PSz4sm7CptIO4emam1zszvdoXn7BUhGyIUgyojH/7MmuZNG2D7nJgaz6gH8+C6TYdOar3mQr8mgELZojnt2WrHclY1scRMjgNkfQD3WkXYvYv0ZwhoOROuXKWM1oG/BibHE0mP91SnvdKCkx95l53jcGkc66PCVbpbuHc4BTfbkj//jugNREYSnBtgwikyAtkxZ91XTmXU9Cwa2q+/aVMuQ5IBr2XYv3Q/VfFKS8j2q3hw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?810q+4701PJtekmlnOc2C2e6X8H9xDo1Y3Yz/k42u0UTVgQHKCjb2DFeVW?=
 =?iso-8859-1?Q?IplmMl/b3z4lsO6cDkmX3QpBxTorderIfkAbYHMa+VO3N5+v+ZkmBJdLxM?=
 =?iso-8859-1?Q?9CjNqJappvcmHgfvBummDER0xnncoBtLSG+ipI/mu3yf4rZaXd3YRNZINm?=
 =?iso-8859-1?Q?LhaNnxijMMo5T147f8nAfozbDicERRaJL7j6ZHU3hXBK0dGjg6xQFTskxA?=
 =?iso-8859-1?Q?jiLcgg++akbqd5Ledu/3HZ5DI0s3EfIGC45iIUBTEQ7VKvRKfedy3iLhek?=
 =?iso-8859-1?Q?/KVP3EggoJ6dDboeh34u0X24K9inezKNd56abNP5gp6QIUrcMPrK3lwey2?=
 =?iso-8859-1?Q?3HbJyX3mn90DgR2j0hD3MvhXfow6LVOjOFikGm57pqtNbgKLOOjOhouDHc?=
 =?iso-8859-1?Q?Xl12unPUclGDy/XnYMmFv56UAIYiHAdBV0YrS3s4Q0p6j2hO+7FOFJiq0f?=
 =?iso-8859-1?Q?YlxaWVIroN9DzAkoTVGUnKQsatI38uyLnd+EO3ONfAlKfz6zttoWTbIuyx?=
 =?iso-8859-1?Q?XnkIrG/IAX+qA1xhg54U+CZk68yeUQOWhMYcAsj8z7PA1Ngynv+C0MfvmH?=
 =?iso-8859-1?Q?w/Icqb5KS3atgDshr5dUwZfG2ess82d1SfHbo6YXXebXsrqWwDjMGahE74?=
 =?iso-8859-1?Q?kRA+5Y/hQEXf1HQvlcoCub16vQj7rWNKVUixtWAGGk2jVXPT/R72TC3iaz?=
 =?iso-8859-1?Q?zBaGJISgFRFFFC/R/x4V1RtCsUVOSRRcgwc4k0783y3pJXSJEUQu5p98zw?=
 =?iso-8859-1?Q?+ssK28gxleyzxnvYXoarwElFXH1uIwShqM3XaoUeCV5T/0nEic0+NKR4NF?=
 =?iso-8859-1?Q?6+JuETmE5ONHq1vZDpglmVH3AyFJWWra+SNQ4mlSI3+A6E9FKIeRGz91cA?=
 =?iso-8859-1?Q?mr1iHX/8+SexoE4qY1vcvk842oYOyvdOUyWAolnnRsnxi/lVBgB0imAuZn?=
 =?iso-8859-1?Q?97WMM9+m+3CQz8aul1t6q9CBQ2jjE4NTB+t7RAPpVlL9ravDGnYcOl7Xor?=
 =?iso-8859-1?Q?wlbKyX3+YP3WkOeJJ3oYSQdTTGSxZqg5FTeAHIum/nbbBwFMevZz15+rO3?=
 =?iso-8859-1?Q?fyM24OG2yp1kHs7XN7pG8aYZROu8H4E8PXPYE94nyTaTMqmfhJWmapETVO?=
 =?iso-8859-1?Q?bqKw0TYpDWz0iW+UurZ7gAyhWQ0rwefP+lOwDrcSYuxDmBkIeBECelAkqz?=
 =?iso-8859-1?Q?1odUYeOvPpkTyIaoHeSVUxwKZadWYZeBzA7oqaVpRYKAnuQq9mL3Uqm8+o?=
 =?iso-8859-1?Q?959Zzt4hoOIFC8m8y2tX4fN4YgRaDONPmHfB8sAoCbRR61a07J8gIm3D7F?=
 =?iso-8859-1?Q?cP7MmMssxW2AYa29AfK9IrjXUnsCHCYWLO0Qeae/b/LtKzeG/tg7UZWADE?=
 =?iso-8859-1?Q?0XOuA2bHhTiPv9jjeK9/s9EHmIy76c35/wfNXCsgk8Re57m+Nj/cRDtT4v?=
 =?iso-8859-1?Q?lkVqW4s3NF+ieXGPAjXITXkg4VHceGwOhXveh26grRNXtQbA5vLdRRjKhD?=
 =?iso-8859-1?Q?T9l2TUBFE7Dub9DM5E8cBASuh9HEp10KeWscttCGCJKom5AS194Kg0omxc?=
 =?iso-8859-1?Q?uui0zKaN49qBw4zxqo8uYQxQuw+UA+9yADUAtMCJEM472P+IGPnUtOPBfp?=
 =?iso-8859-1?Q?NMwyuVBFMiCI6OPvUoiRbjWKqYMQuHeqfXODwqK9oSV8Fb3+AbrRgNmC7o?=
 =?iso-8859-1?Q?BhY+Lb513Y0eHgWs0lzuXftXOybZd9oIlJWbFe6Ywcq3HQCt+ktzECnzmO?=
 =?iso-8859-1?Q?yqWn1aggHEWw/f7A8yNst8mj+YeUB2f2CemprWfGHAyidblZdKwLbl7zfO?=
 =?iso-8859-1?Q?lkxRxeDE96wZjwQkzSXkKkQo+gQsv/E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb363054-e952-4deb-03d7-08df0fd5f99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 07:26:19.9384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuvuerbcaM0+a79ji2GDPssoUEzFQP11hVbWVbbM66KseqQ/0Y+umTJxTB3/rQxJSZ7CSaQINO24EFryufsDmEDSiq9vz23y3XFEmObxhtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8025
X-purgate-ID: tlsNG-ef75cf/1789111584-A72DCAE4-911FF115/0/0
X-purgate-type: clean
X-purgate-size: 1092

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v12:
- add missed Ack.

 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index c7763acd7f..91c9bc1186 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.43.0

