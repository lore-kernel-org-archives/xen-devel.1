Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F467606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=GYVxu0wa
Received: from list by lists.xenproject.org with outflank-mailman.1470408.1679232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILc-0005sT-CS; Tue, 03 Nov 2026 17:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470408.1679232; Tue, 03 Nov 2026 17:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILb-0005rN-Tf; Tue, 03 Nov 2026 17:30:59 +0000
Received: by outflank-mailman (input) for mailman id 1470408;
 Tue, 03 Nov 2026 17:30:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILZ-0005Hj-9k
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILY-0082xo-MV
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:56 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a39-e002-0a2a0a5209dd-0a2a4508a990-22
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:56 +0100
Received: from [52.101.84.86]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a50-f659-0a2a45080019-346554567180-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:56 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PA1PR03MB11410.eurprd03.prod.outlook.com (2603:10a6:102:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:54 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:54 +0000
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
 b=y+u8XSYzkNn7OxrWiQoA6fr3QAZAFkRwG4DMRAyRCB5UMPGfzIKNmTF3rkHkOOQdkxp08/bYO+AM4gYtrN+YvbuCEKHwWp2NbcnIGrtgSdHKCaE5fnTvgdIWP4H1sHUwaFZZdukw9+D6jPTzIF9I5CLlVint8xjjPbONoF0UeBgmiW5UD8kjDk//go0TsDlFJBp14h0wwoN5nSHUgqVO9+kEY65VjUf1ZP7rzT5GqUQBqUk80QokCOxT0i5/7JQ3nBkI+ybLVWTThgHJelhDtSfPPrHxxvb3Hy5dlNT4qUNAvE0+M2SNHNgRmibHqkPSJB/F/YwJokIXKymTwbRxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvAF21OjdmFjCHyccckotEKJx0kKkFQ9Xrm9Yb5MyWM=;
 b=L9BubjP0PrZnd+LWmk4rDSZNrX26LnfYfRW/eWiPcwzVVKsDCeobYLHm0Kio6cyKHZxSJpOvCwIH2+38pi0bH+jjH13+fZpTj8kiI6DxyTYbDWHOp0Fl9U2RkjfjtJkg0VkPwcVg1+u7X1Fa3Uv848003bKm4OSIX8LBRj0AQMqve9TOzDsjxPmYH/sepbm630aOxzlANvhL46LwVpzIxtR18stCsPLS/h7EPJVieLrVTlUYk9Tc9ehrF1gUBUrL0i2wvLsT/zM+hYJAHjVp8D1oPV37EId7U9BQSBNPKatuQsaO3RYC7AvZzO6xekK3ni+hFdvs9mngbThnoTwMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvAF21OjdmFjCHyccckotEKJx0kKkFQ9Xrm9Yb5MyWM=;
 b=GYVxu0waZRyznJ+TpOCD7oUcJPnMIAauOi2p4/VfnVG7bfhFCS3UJRfjvWpyqnTYYKN2DWy2375WY9ooMMC4/yHI4rEk75YZNqC66wFWV6qAGxqXmSpVZnqflVUp1681tFgGnpNM4fqrxsws7s513/G9pVy2isirSQKzdJ8uljmBtw58JbCUJSbzqcX4aBNoctJY0erFyCIwzFMeml86zPttQ/DASR8jmYzXdtWx905KeAslNMGU3qchgHsape9sGjcsKHqNHApc20MKUhvQA3b8JU0fpnk5A8tGLxSeG8UKsH7GGThxLVY14zgIy6jFUeaUxvoBb+o7scVPvxdx9A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.com>
Subject: [PATCH v5 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Topic: [PATCH v5 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Index: AQHda7kULYxXGnfVkUmCgWLI1RRaWg==
Date: Tue, 3 Nov 2026 17:30:54 +0000
Message-ID:
 <112c09580e509dd89db411fd61e556d8637582d4.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|PA1PR03MB11410:EE_
x-ms-office365-filtering-correlation-id: 67bc4053-7b3c-4d1d-64c4-08df39d036c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|261022075727099003|56012099006|11063799006|261009223027099003|261022105027099003|261102123227099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 TFYBAzknEbyp0+914ps2ML0eFkzCm0noPCweU41KKuQHncmaVcsqJfllHMj2Q7/8PENqPS5R/u1fkQy9cvN66JiIVD1gzx07ogiH7Yut730aHS96CPhuufwhmW2EW53Qx0HVg5LtFfMSJxPepEbgQIr0rSCHuFpLKj31YvAAJqcLp4E5zjhZnWSw0rIO1XCjR7GY9Hip5iZtcJz7rWGPvH4W9e/ENuGDPpyjWQRRBI9depTN3hTWGV5AnDl8cBh3FKfXzu8gj7nrTz9XK4pdpIOL+dtrsB/gr/J8ma68wAJaks8pejm08+NiyT9E6PhlP0UkmTnOdbid1gm7XOcQslwoxcOIyBJVn5IN5WTeWYAD1JpzW1Z2uOhrVEccvt+N+zvFpvBLglAbV4OacLiPIj33lNdRRB1dU64VGs0rH2tPooBUTjrcupYQiZRapk5V198Onpu/v9/KwCEUjkfcJg1VHXfGxHU8/HoyfPTnMNrAsEFnCRuAsAf6Lo2sN/CUJi7e7QcDWftAW9eEPdLHItrlSrA8XhTjqPsMhLiWaeQuiQoHRJTckgeJpRYjQCj+a4MJgKiPORF0x2Rqn35Rz5V97dFhHqrnvuBDKbml0jH7+StD4t9ECXkffAAcJDYDyp6O2uvXS5bPfKZd0Xlza7DqFw1Dxg7Q7alHLn33BxWelMsMyTWW3z8uf+cFg9J63i+BzM2gibswbicdi1Hqe+WJN2KNCrxOJWMb9sang8U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sfs7H3lX4zlulIxPK0Q582MxjKyUJf4h66d6uVEUVnfbFYm5yQI2hT8xoK?=
 =?iso-8859-1?Q?YCzqlB90Qs3HRVxNrKr8sI6M0/hdsbZvEtEMlD4EU/1a85OL0M+Vlqzzod?=
 =?iso-8859-1?Q?gU3j5W9LVwoHJdAPCrZA77OnH7hiUpGpFmVJYQm31Wi6Q/BetIVPB9RarG?=
 =?iso-8859-1?Q?mew5dBYfwu2z//fBSVOyIrL61VvgrBRwANDBAZERp9GGHh+rNPvhX5mDrP?=
 =?iso-8859-1?Q?kv+e2H8A25Z0wYvmP1rYtSFAQCT7rup3zXqOKHPRIq3MspvpO/jWNf5Pfr?=
 =?iso-8859-1?Q?QcDD+tL4TJFM1G8XX/2wmfuPNIKOyw+lZF1LhGnzmoljfNySln1m/Ox1gO?=
 =?iso-8859-1?Q?YUBPcp2E2BuXmP20oQTQv12CvCVR1tvDGFp1kQs5DpKrVUHrap1Z2IHO0l?=
 =?iso-8859-1?Q?yDJpOaYEJSzUbGwSmOJv0yAWmc6v6P+Np1yNyQI8+ho/r+NHothw2VCZq/?=
 =?iso-8859-1?Q?erulGMdqa/U1PN28NICaMYQ4frgL+VpAjnJ9stunKeLx/GAveHYFQHz0Cl?=
 =?iso-8859-1?Q?jCrLhOdHdD/RpUxW+0OVmneEgv45NB+CB5M1SdRnfo9WkOrpbyMhEL1WyT?=
 =?iso-8859-1?Q?cARkq0u4HC7nMCithAs0hBD6//BJQdb62+TEIsWhmvFdgEiJjgtoYiAX7s?=
 =?iso-8859-1?Q?WVhauL6ip6PSb9bQdC/nuJuxjSaP2gaSFO9RqOxZLGFsVbmKVzBAXibSAg?=
 =?iso-8859-1?Q?nX6jz5rO7EcEV9BW0/R6NSqRWWfikfQsdJq02vszKpESniqptzYuE5b+tG?=
 =?iso-8859-1?Q?Mm+yI2dFKp6qcjjIuANZKyi/KI8OjDOkO6YCdfrRoWomGDmuDo7RINIltQ?=
 =?iso-8859-1?Q?6aSX3yDWxUX9YxQYiEgBK4Fzvj7mo/mC+dELWNSRT2wD25VQs8iUFdUQF9?=
 =?iso-8859-1?Q?Sa+l5BHvuirFBTtEw37mUGMtU7nvj8HWOqWJCJ8BQ4O6ClZL9ZvUr/CKxG?=
 =?iso-8859-1?Q?a3yYto8zC02ZMMvqU29x1imjhP2MfBQ20XWyPtE1LMax6S48ofMDrysmYf?=
 =?iso-8859-1?Q?NAkIXTxHy1N0AFdj6s1zuEqpdAerPR2DNuJoj53TadYAAk6teqcf2GDRc3?=
 =?iso-8859-1?Q?0vmftoMbh1XQzY7ubk5BitC1QJtiIGB3xL3xcU51poPsDZr0+rEfUc8YXO?=
 =?iso-8859-1?Q?LHaLJ+OYOPVH315F6dJIBv6wO8BOMRrIujGd9AmeWomCn77d4esgSCVY9X?=
 =?iso-8859-1?Q?IkBOgBxglG0xCMu5f9NEG2KSbkXYJPeab0ARXqTyr4p/3aoark280u47sb?=
 =?iso-8859-1?Q?DTIZhL8g2D7DLVASr2geqHBV9H3vVNaVVzmiG8ef/0iZ4Wnrk39eWbDl1y?=
 =?iso-8859-1?Q?oEXlpEgI/cXc6ReP7LovSUONp4JaRox4OVHfRRBilp8IPczDwWBFTdC7KV?=
 =?iso-8859-1?Q?AQoUSWmBRAAKJNKkdxinFwuuAYO63fFR/crJ4OPjYbTXO9PlsiM29xfdR9?=
 =?iso-8859-1?Q?F6XBpQVZL6QQR+Bf9rB7t1U+Y1cq2iNEhutmybl2eQmxpeFpm+ky4SeAMm?=
 =?iso-8859-1?Q?sodgjVDT1Yh5iCZ+BTdaTomuPsocADvW1tg6j8RBcuJMgupdyX1/c86soI?=
 =?iso-8859-1?Q?eepkz04zuYHztIIQ7SG8YSppUnPJNIed4m8Eft3Dv9GH/Jpr8C0/LB2Le/?=
 =?iso-8859-1?Q?hL0Dytb/pWDe9F30j/ewim6M1IqE0BwkeBHZPWc+ThYHP+igVwCLfltmdP?=
 =?iso-8859-1?Q?WjzXaU21T4cgLv6e18tqtK1+EF0NOvvGlmLyAo86n6QjHQOGcDD4vjYGTe?=
 =?iso-8859-1?Q?QcKUPs9kQFm5jGFL1WE3wxJUCWZDwz6iHZVh7Mq3sYR5seKvGL05HP8kuh?=
 =?iso-8859-1?Q?X54rJfl2bg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bc4053-7b3c-4d1d-64c4-08df39d036c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:54.4688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9deS5gQszm/i02y+vLJaQI1nnRf/XmIYibIwMqgNW4BAdDj4Q07kIdEQ+KYdynvNJF5NSI+wKWMa5aUbM6LN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11410
X-purgate-ID: tlsNG-c1860d/1793727056-CF35D87B-4C83D20E/0/0
X-purgate-type: clean
X-purgate-size: 18392
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce a vIOMMU mapping layer to support passthrough of IOMMU devices
attached to different physical IOMMUs, including devices with the same
Stream ID.

Add a new generic vIOMMU API, viommu_allocate_vsid(), which allocates a
guest vSID and maps it to the input pSID and the backing physical SMMU.

Once the mapping is established, the guest uses the vSID for stage-1
commands, and Xen translates the vSID to the corresponding pSID before
processing the command on the physical SMMU.

Implement usage of the new API for dom0less guests. Allocate vSIDs when
creating the guest device tree and replace the original pSIDs with vSIDs
that are subsequently used by the guest driver.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/include/asm/viommu.h       |  12 ++
 xen/common/device-tree/dom0less-build.c |  35 +++--
 xen/drivers/passthrough/arm/smmu-v3.c   |  10 +-
 xen/drivers/passthrough/arm/viommu.c    |   9 ++
 xen/drivers/passthrough/arm/vsmmu-v3.c  | 184 +++++++++++++++++++++++-
 xen/include/xen/iommu.h                 |   6 +-
 6 files changed, 242 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 5ae21042f0..3d0eb92655 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -34,6 +34,16 @@ struct viommu_ops {
      * Called during domain destruction to free resources used by vIOMMU.
      */
     int (*relinquish_resources)(struct domain *d);
+
+    /*
+     * Allocate free vSID/vRID for the guest device and establish vID->pID=
 mapping
+     * Called during domain device assignment.
+     * Returns 0 on success and sets vsid argument to newly allocated vSID=
/vRID
+     * mapped to physical ID (id argument).
+     * Negative error code returned if allocation fails.
+     */
+    int (*allocate_vsid)(struct domain *d, uint32_t id, uint32_t phandle,
+                         uint32_t *vsid);
 };
=20
 struct viommu_desc {
@@ -54,6 +64,8 @@ extern struct list_head host_iommu_list;
 int domain_viommu_init(struct domain *d, uint8_t viommu_type);
 int viommu_relinquish_resources(struct domain *d);
 uint8_t viommu_get_type(void);
+int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
+                         uint32_t *vsid);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
                             const struct dt_device_node *node,
                             const void *iommu);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 970f89ef68..3b2a888698 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -32,6 +32,10 @@
 #include <xen/static-memory.h>
 #include <xen/static-shmem.h>
=20
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+#include <asm/viommu.h>
+#endif
+
 #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
=20
 static domid_t __initdata xs_domid =3D DOMID_INVALID;
@@ -333,11 +337,12 @@ static int __init handle_prop_pfdt(struct kernel_info=
 *kinfo,
 }
=20
 #ifdef CONFIG_ARM_VIRTUAL_IOMMU
-static int __init modify_pfdt_node(void *pfdt, int nodeoff)
+static int __init modify_pfdt_node(void *pfdt, int nodeoff, struct domain =
*d)
 {
     int proplen, i, rc;
     const fdt32_t *prop;
     fdt32_t *prop_c;
+    uint32_t psid, phandle, vsid;
=20
     prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
     if ( !prop )
@@ -347,10 +352,23 @@ static int __init modify_pfdt_node(void *pfdt, int no=
deoff)
     if ( !prop_c )
         return -ENOMEM;
=20
+    /*=20
+     * Assign <vIOMMU vSID> pairs to iommus property and establish
+     * vSID->pSID mappings
+     */
     for ( i =3D 0; i < proplen / 8; ++i )
     {
+        phandle =3D fdt32_to_cpu(prop[i * 2]);
+        psid =3D fdt32_to_cpu(prop[i * 2 + 1]);
+        rc =3D viommu_allocate_vsid(d, psid, phandle, &vsid);
+        if ( rc )
+        {
+            dprintk(XENLOG_ERR, "(DOMID=3D%u) Failed to allocate vSID for =
"
+                    "pSID: %u, pIOMMU: %u", d->domain_id, psid, phandle);
+            goto out;
+        }
         prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
-        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        prop_c[i * 2 + 1] =3D cpu_to_fdt32(vsid);
     }
=20
     rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
@@ -365,7 +383,8 @@ static int __init modify_pfdt_node(void *pfdt, int node=
off)
     return rc;
 }
 #else
-static inline int __init modify_pfdt_node(void *pfdt, int nodeoff)
+static inline int __init modify_pfdt_node(void *pfdt, int nodeoff,
+                                          struct domain *d)
 {
     return -EOPNOTSUPP;
 }
@@ -374,7 +393,7 @@ static inline int __init modify_pfdt_node(void *pfdt, i=
nt nodeoff)
 static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cel=
ls,
-                                 bool scan_passthrough_prop)
+                                 bool scan_passthrough_prop, struct domain=
 *d)
 {
     int rc =3D 0;
     void *fdt =3D kinfo->fdt;
@@ -397,12 +416,12 @@ static int __init scan_pfdt_node(struct kernel_info *=
kinfo, void *pfdt,
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
-        rc =3D modify_pfdt_node(pfdt, node_next);
+        rc =3D modify_pfdt_node(pfdt, node_next, d);
         if ( rc )
             return rc;
=20
         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_=
cells,
-                            scan_passthrough_prop);
+                            scan_passthrough_prop, d);
         if ( rc )
             return rc;
=20
@@ -489,7 +508,7 @@ static int __init domain_handle_dtb_boot_module(struct =
domain *d,
             res =3D scan_pfdt_node(kinfo, pfdt, node_next,
                                  DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 false);
+                                 false, d);
             if ( res )
                 goto out;
             continue;
@@ -499,7 +518,7 @@ static int __init domain_handle_dtb_boot_module(struct =
domain *d,
             res =3D scan_pfdt_node(kinfo, pfdt, node_next,
                                  DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 true);
+                                 true, d);
             if ( res )
                 goto out;
             continue;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index f213b3de12..b0ec004960 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -3103,7 +3103,7 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(co=
nst struct device *dev)
 }
=20
 static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
-				u32 sid)
+				u32 sid, const struct arm_smmu_device *smmu)
 {
 	int i;
 	unsigned long flags;
@@ -3119,6 +3119,9 @@ static struct iommu_domain *arm_smmu_get_domain_by_si=
d(struct domain *d,
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
 		smmu_domain =3D to_smmu_domain(io_domain);
=20
+		if (smmu_domain->smmu !=3D smmu)
+			continue;
+
 		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
 		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
 			for (i =3D 0; i < master->num_streams; i++) {
@@ -3347,7 +3350,8 @@ static void arm_smmu_iommu_xen_domain_teardown(struct=
 domain *d)
 }
=20
 static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
-		const struct iommu_guest_config *cfg)
+				const struct iommu_guest_config *cfg,
+				const struct arm_smmu_device *smmu)
 {
 	int ret =3D -EINVAL;
 	unsigned long flags;
@@ -3357,7 +3361,7 @@ static int arm_smmu_attach_guest_config(struct domain=
 *d, uint32_t sid,
 	struct iommu_domain *io_domain;
=20
 	spin_lock(&xen_domain->lock);
-	io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
+	io_domain =3D arm_smmu_get_domain_by_sid(d, sid, smmu);
 	if (!io_domain) {
 		ret =3D -ENODEV;
 		goto out;
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
index b4b91ab1cb..e476567b49 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -76,6 +76,15 @@ int viommu_relinquish_resources(struct domain *d)
     return cur_viommu->ops->relinquish_resources(d);
 }
=20
+int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
+                         uint32_t *vsid)
+{
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    return cur_viommu->ops->allocate_vsid(d, id, phandle, vsid);
+}
+
 uint8_t viommu_get_type(void)
 {
     if ( !cur_viommu || host_iommu_list_incomplete ||
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 24588affe9..5d225ccc08 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -86,6 +86,8 @@
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
=20
+#define MAX_VSID   (1 << SMMU_IDR1_SIDSIZE)
+
 /* event queue entry */
 struct arm_smmu_evtq_ent {
     /* Common fields */
@@ -133,6 +135,14 @@ struct arm_vsmmu_queue {
     uint8_t     max_n_shift;
 };
=20
+/* vSID->pSID mapping entry */
+struct vsid_entry {
+    struct list_head entry;
+    uint32_t    vsid;
+    uint32_t    psid;
+    struct arm_smmu_device *smmu;
+};
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
@@ -157,6 +167,8 @@ struct virt_smmu {
     spinlock_t  cr2_lock;
     spinlock_t  strtab_cfg_lock;
     spinlock_t  irq_cfg_lock;
+    spinlock_t vsids_lock;
+    struct list_head vsids;
 };
=20
 /* Helper functions */
@@ -379,8 +391,31 @@ int arm_vsmmu_handle_evt(struct domain *d, struct devi=
ce *dev, uint64_t *evt)
     }
     else
     {
+        uint32_t sid =3D FIELD_GET(EVTQ_0_SID, evt[0]);
+        struct vsid_entry *vsid;
+        bool found =3D false;
+
         smmu =3D list_entry(d->arch.viommu_list.next,
                           struct virt_smmu, viommu_list);
+
+        spin_lock(&smmu->vsids_lock);
+
+        /* Translate pSID->vSID */
+        list_for_each_entry(vsid, &smmu->vsids, entry)
+        {
+            if ( vsid->psid =3D=3D sid && vsid->smmu->dev =3D=3D dev )
+            {
+                evt[0] &=3D ~EVTQ_0_SID;
+                evt[0] |=3D FIELD_PREP(EVTQ_0_SID, vsid->vsid);
+                found =3D true;
+                break;
+            }
+        }
+
+        spin_unlock(&smmu->vsids_lock);
+
+        if ( !found )
+            return -ENOENT;
     }
=20
     ret =3D arm_vsmmu_write_evtq(smmu, evt);
@@ -558,6 +593,71 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
     uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
     struct iommu_guest_config guest_cfg =3D {0};
+    struct arm_smmu_device *phys_smmu =3D NULL;
+    struct host_iommu *host_iommu;
+    uint32_t psid;
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STREAMID,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
+
+    /* vIOMMU->pIOMMU identity mapped for HW domain */
+    if ( domain_use_host_layout(d) )
+    {
+        psid =3D sid;
+        list_for_each_entry(host_iommu, &host_iommu_list, entry)
+        {
+            if ( host_iommu->addr =3D=3D smmu->addr )
+            {
+                phys_smmu =3D (struct arm_smmu_device *) host_iommu->iommu=
;
+                break;
+            }
+        }
+    }
+    else {
+        struct vsid_entry *vsid_entry;
+        bool entry_found =3D false;
+
+        spin_lock(&smmu->vsids_lock);
+        /* vSID out of range or no vSIDs allocated */
+        if ( sid >=3D MAX_VSID || list_empty(&smmu->vsids) )
+        {
+            spin_unlock(&smmu->vsids_lock);
+            arm_vsmmu_send_event(smmu, &ent);
+            return -EINVAL;
+        }
+
+        /* get vSID entry corresponding to passed vSID */
+        list_for_each_entry(vsid_entry, &smmu->vsids, entry)
+            if ( vsid_entry->vsid =3D=3D sid )
+            {
+                entry_found =3D true;
+                break;
+            }
+
+        /* vSID not mapped */
+        if ( !entry_found )
+        {
+            spin_unlock(&smmu->vsids_lock);
+            arm_vsmmu_send_event(smmu, &ent);
+            return -EINVAL;
+        }
+
+        psid =3D vsid_entry->psid;
+        phys_smmu =3D vsid_entry->smmu;
+        spin_unlock(&smmu->vsids_lock);
+    }
+
+    /* vSID mapped to invalid physical SMMU */
+    if (!phys_smmu)
+    {
+        arm_vsmmu_send_event(smmu, &ent);
+        return -EINVAL;
+    }
=20
     ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -578,7 +678,7 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *=
smmu, uint64_t *cmdptr)
     else
         guest_cfg.config =3D ARM_SMMU_DOMAIN_S1;
=20
-    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    ret =3D hd->platform_ops->attach_guest_config(d, psid, &guest_cfg, phy=
s_smmu);
     if ( ret )
         return ret;
=20
@@ -1189,6 +1289,13 @@ static int vsmmuv3_init_single(struct domain *d, pad=
dr_t addr,
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
+    /*
+     * vSID->pSID mapping layer is only used in the context of domains tha=
t
+     * are not direct-mapped
+     */
+    if ( !domain_use_host_layout(d) )
+        INIT_LIST_HEAD(&smmu->vsids);
+
     spin_lock_init(&smmu->cmd_queue_lock);
     spin_lock_init(&smmu->evt_queue_lock);
     spin_lock_init(&smmu->gerror_lock);
@@ -1197,6 +1304,7 @@ static int vsmmuv3_init_single(struct domain *d, padd=
r_t addr,
     spin_lock_init(&smmu->cr2_lock);
     spin_lock_init(&smmu->strtab_cfg_lock);
     spin_lock_init(&smmu->irq_cfg_lock);
+    spin_lock_init(&smmu->vsids_lock);
=20
     ret =3D vgic_reserve_virq(d, virq);
     if ( !ret )
@@ -1317,8 +1425,16 @@ static int vsmmuv3_relinquish_resources(struct domai=
n *d)
     if ( list_head_is_null(&d->arch.viommu_list) )
         return 0;
=20
-    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list =
)
+    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list)
     {
+        struct vsid_entry *vsid, *vsid_temp;
+
+        list_for_each_entry_safe(vsid, vsid_temp, &pos->vsids, entry)
+        {
+            list_del(&vsid->entry);
+            xfree(vsid);
+        }
+   =20
         list_del(&pos->viommu_list);
         xfree(pos);
     }
@@ -1326,8 +1442,72 @@ static int vsmmuv3_relinquish_resources(struct domai=
n *d)
     return 0;
 }
=20
+static int vsmmuv3_allocate_vsid(struct domain *d, uint32_t id,
+                                 uint32_t phandle, uint32_t *vsid)
+{
+    uint32_t i =3D 0;
+    struct virt_smmu *smmu;
+    struct host_iommu *host_iommu;
+    struct arm_smmu_device *phys_smmu =3D NULL;
+    struct vsid_entry *entry;
+    struct list_head *vsid_head;
+
+    /* vSID->pSID mapping layer not used for direct-mapped domains */
+    if ( domain_use_host_layout(d) )
+        return -EOPNOTSUPP;
+
+    if ( list_head_is_null(&d->arch.viommu_list) )
+        return -ENODEV;
+
+    smmu =3D list_first_entry(&d->arch.viommu_list, struct virt_smmu, viom=
mu_list);
+
+    /*
+     * Find the physical SMMU corresponding to the device-tree phandle.
+     */
+    list_for_each_entry(host_iommu, &host_iommu_list, entry)
+    {
+        if ( host_iommu->dt_node->phandle =3D=3D phandle )
+        {
+            phys_smmu =3D (struct arm_smmu_device *) host_iommu->iommu;
+            break;
+        }
+    }
+
+    if ( !phys_smmu )
+        return -ENODEV;
+
+    spin_lock(&smmu->vsids_lock);
+    /* Get first free vSID index */
+    list_for_each(vsid_head, &smmu->vsids)
+        i++;
+
+    /* Max number of vSIDs already allocated? */
+    if ( i =3D=3D MAX_VSID )
+    {
+        spin_unlock(&smmu->vsids_lock);
+        return -ENOMEM;
+    }
+
+    entry =3D xzalloc(struct vsid_entry);
+    if ( !entry )
+    {
+        spin_unlock(&smmu->vsids_lock);
+        return -ENOMEM;
+    }
+
+    /* Establish vSID->pSID mapping */
+    entry->vsid =3D i;
+    entry->psid =3D id;
+    entry->smmu =3D phys_smmu;
+    *vsid =3D entry->vsid;
+    list_add_tail(&entry->entry, &smmu->vsids);
+    spin_unlock(&smmu->vsids_lock);
+    return 0;
+}
+
 static const struct viommu_ops vsmmuv3_ops =3D {
     .domain_init =3D domain_vsmmuv3_init,
+    .allocate_vsid =3D vsmmuv3_allocate_vsid,
     .relinquish_resources =3D vsmmuv3_relinquish_resources,
 };
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 253f8bb6cb..c94ee4f08e 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -312,7 +312,10 @@ static inline int iommu_add_dt_pci_sideband_ids(struct=
 pci_dev *pdev)
 #endif /* HAS_DEVICE_TREE_DISCOVERY */
=20
 struct page_info;
+#ifdef CONFIG_ARM
 struct iommu_guest_config;
+struct arm_smmu_device;
+#endif
=20
 /*
  * Any non-zero value returned from callbacks of this type will cause the
@@ -391,7 +394,8 @@ struct iommu_ops {
=20
 #ifdef CONFIG_ARM
     int (*attach_guest_config)(struct domain *d, uint32_t sid,
-                               const struct iommu_guest_config *cfg);
+                               const struct iommu_guest_config *cfg,
+                               const struct arm_smmu_device *smmu);
 #endif
 };
=20
--=20
2.43.0

