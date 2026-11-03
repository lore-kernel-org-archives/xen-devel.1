Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83418606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=RC1s0ZIv
Received: from list by lists.xenproject.org with outflank-mailman.1470349.1679130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILB-0001BA-Bh; Tue, 03 Nov 2026 17:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470349.1679130; Tue, 03 Nov 2026 17:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILB-0001Ao-3V; Tue, 03 Nov 2026 17:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1470349;
 Tue, 03 Nov 2026 17:30:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIL8-0000o5-Iz
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIL7-004K6F-Vh
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:29 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a35-2eae-0a2a0a5409dd-0a2a4506cece-2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:29 +0100
Received: from [40.107.159.82]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a35-195a-0a2a45060019-286b9f52ebb6-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:29 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:28 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:27 +0000
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
 b=BhUGCqIZScnX5gXaUjksGapKCcwt+h3wbOJ8TWEh1vZHTVD3ZPyTBht2E8wgdjnvSNf5BFa0Cilui7NsUbAVz0CH1ZbSd9Qy04yepKNzYIpRsBlXM354RPPPH+HlHiunRIMta3T5taOQu5YmyGd3baeB12NMDZJffsjtaXr8LeFXP74s3qSo5X944CWvFrSGNe7ehj64SaYDqIbxfTANLf2P68GBzGTPc6SFjKxAKBfgxZe4GIL6TAoulJi+GrjmTHiqV2sIn0Z+e5ziaJ1DBR9NAq7GGhTN0LMPpSWXCehfS0t1JPXSgk5habJASNRjUOslwT7ZWJewSzwmtD2Rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOEHTlDZMlXhOyrTw/69mQbvtQMKvo3ej5gCMpOCdIc=;
 b=mVLXF2gaaZAHOw4zbpxgy0OoIjjbYRN/mnMdLv/rFdVIJrur41LBJ6PU5vXin5AsDZZy6zpsD8gPAwm9/yJF4Z9VF8YBEkRCj9R3sSk1DOdSvsFxymYihiU1jhAHmGLhGuulbcBsHGgWpi8K+nLesZOq7VIrpgdvIjF+m2FU4ehLEW4Qtl8kgDes4PZVUfTQbEiYAReCAyPDxS2XVQedGYsh0PGwc3R8cvMHFa6k6O7/iKY/tDm93q7yu6SKSt8XcTKni0+TFlya3wnNm9E2E+fPJsCHLA2ZXPZSGQAdAwbEFS7g3LuIMhZaL3uQLRQyMP2MD3PEfSl+13DtqtUCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOEHTlDZMlXhOyrTw/69mQbvtQMKvo3ej5gCMpOCdIc=;
 b=RC1s0ZIvO1vSqrBROMjOnMvxTNB6pxRpAfWXRmJfObdmt7QYs6bYfvMDNjVp4lvUJiN3z+YY1RHmof0/Xj8Qqw43VWH9MVgExJ0qf2KSdfM4mItXWu7WkSzHUtMRO5+HAV+asG2hpU8LAHHNewRVdXFbp+yLoz3r986xpLTGKoA1YdQVa0WFAMbJyGj5IXPmigMcFi1k5c2iMe7vJPtpWlgUF1tHnR3aFk1yezk6zE/fTXOoFtM5flXZi0e0Yc0Ky3jp6HUB5SmfMUJLp8K/ku6VRMaE/5yBKRdx/g5Q0PXiJTrW/IWlRZ/IdrV/CM4HarADoBxy7QNUH0PynZFXHw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 08/22] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Topic: [PATCH v5 08/22] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Index: AQHda7kEfjyU8g9/U0W6seOCh9dclQ==
Date: Tue, 3 Nov 2026 17:30:27 +0000
Message-ID:
 <4f7bd0e5cbe5e46f3ba12a7276ca9a49635d6b95.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 7f0ca6ea-56df-45b8-ad16-08df39d026f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 7f3Mwi2WF8Vb6DgtlslGxdizZOHK5UcKATLzLzFtXB4C6FApLwBzfwvoDvUaZlvBrtKt9x+yIQ8vRu/50/lY/BwAaqbUyBDdhSsA/XMthlFciBbFbB25aKbht9U+CgXVqyxnnAjWY79twx15J50ds8gdn84KUd9hOw9V0CJAla2A4zjln3V4v/iVnjnLWa9R3W39zuzUm8WuXpnDX63cOmyjfN84Qo8+r2HwiRu4qU/FxjR+bNyYY43kL1jmbOxTEy0GfB2ql0cFKRNviWML45kSo79GN0+E9alskNRDAVYfWq3TDMrf0KeOHlkl+1KZtxBjAYBow03HyRDx+c4bxVBUWWNq928cNHcNoPvUj0H+BshI2tKF2dbvXqGSkTmAta3CCeZ1d2vmyyHQnsReVpgBGR3or1fSEs/rd8umlgialA2pRh7Q3uiksvJtLxEkhb/CL0moe/C9clnVzObRO7SV/hpScfdhUH1lyKlCZd8y8NmjXLmWmVaUiiuovtay76YUye5nO+rnV/spxpkyvRN3/OKeyhdFOyutQ/FyCKIOmRDul0ghGV69jqEkfefogmAjiVumbafdJFeuWAU8H8iEetmpOGqHRSTnZ8OgQbsKbgrOZUg2ZlkjzfW4LJOYHkck65w7640KGYCPzZMq5MMjEmxqzbijxbU5YcL8vqeVVt13epTqgCKNVBwF15L4Sw49vv69OODIGuX6MOGxvg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UCe/vye+4D8+AAxxIEkOsrmhRfA9nHrEbOjU2OtlRptJgnizt+nbeKwehN?=
 =?iso-8859-1?Q?1bldR/3ydCPXgPVjnMGyihTrMy75+yZe+Ly6RM0cGNE6ngAFpE8lwZOsZh?=
 =?iso-8859-1?Q?I9421f1e859YANAGL0Qy3/uY/Zge5omuwAzAdkjSFRhdrhFu+/fgM36NEG?=
 =?iso-8859-1?Q?3x0Bv3WsBriJ5vYGgpUaqqJp374xVHPq0B5Qx3CiUm12V7xb4S4il+vBNa?=
 =?iso-8859-1?Q?9KOPuacMD8FqDYiJUc1/qYbKjlUbc3ETUTYZDTt9DJs+Z+Hf7PJzNQjDMg?=
 =?iso-8859-1?Q?lLOotAO7uX3tQa4YMwHmS54RMLkwfxhcp3EwKOBYl2fxHzwaPrx1NxsliL?=
 =?iso-8859-1?Q?jOAtByPu9lZ7iD3n9L2qvYJcu5XJPfBX8MsH17dDXYucAee2P0u86FOZ0O?=
 =?iso-8859-1?Q?Cq+JfBE8aaNVRsbddn98OJI+IR1m3UOmkcJY5Jfe8VI0yve5sRxD0R582b?=
 =?iso-8859-1?Q?6o9AEjQFgeZvbMA5qzZc0gvlUrCv/gEsiImQjdZviueG1ZCD3wnaTOhAq6?=
 =?iso-8859-1?Q?4Iw2M+QrqpoMHBiW286WDMVocCZy2pea+6ONRES4jANOUBWzQKieEXFbnV?=
 =?iso-8859-1?Q?dOyMBqUxxRAjwnttNcB7avUoxycJAO2D91yALnmv2v880E8scwLyazcjog?=
 =?iso-8859-1?Q?bxs4hve8ELVU+1R9RsZcC8vY3kPueh7XFoIi3i8kP9O5GLRRK1UImxHdPZ?=
 =?iso-8859-1?Q?fA+RKPDmIYfsOTgYnzRdCqXCdRVP6zVB2l3e2LPiENE0e1LJK2P0axR4vM?=
 =?iso-8859-1?Q?zX8Gnu/BZrOcQyXsy+k1si3l9jHC3bGaA0TTYY/deJINWxo5lc+zI2jqq3?=
 =?iso-8859-1?Q?VK39VJSq1Nfp51Xg05S/fYdkI15R7YFuHrbqj6kSbQ/Bu5Kh/DttIz0F1N?=
 =?iso-8859-1?Q?AAEgnd8bt8X6iVIga6YoB/llD+A7cijZ0gl4jd1HTm4SwYR8PY/+D+B2VD?=
 =?iso-8859-1?Q?rdBTQwCVKruf2DtVeBpAcU3oPEXVyCih7Z75GbeH1Jl1wKTbmmQR5x8GiU?=
 =?iso-8859-1?Q?fQ7xm+ILJ5KBN6ItYmQ/zyjQECuqPyn/DOxR6hNb9Rqzm213gpfcU0i/Y8?=
 =?iso-8859-1?Q?Bx+2f1D01tuKxEkfTWvTKQ8q7SJsQ5PT0B+6ayC5ykVIJgrOFp6aRFTatx?=
 =?iso-8859-1?Q?D/t1lbiA8Ao6mADlBDPdFGpebv+G3I+9NauamMkrMv7A+InCtkHXJ0DMmF?=
 =?iso-8859-1?Q?4ES96m6YBzXHLJRk+Q1/dE+vIxKtlwsGurWHsw2ovJ2Y50I6S/LoWbwPHE?=
 =?iso-8859-1?Q?e+ScKeAgH6CUAhEVTAtkBtMHT+ETsp9iRAPCRBOInJV0FoYkRSTgU/wexx?=
 =?iso-8859-1?Q?0grgsfD0jz6y4KgqwzDAVvWn1Tsh5QA8tzVVm4LiVsAlySShv9n2s29e5w?=
 =?iso-8859-1?Q?VRRNTTR319xFVDNj5eq01lQe7wwc9E+JJYYbDAwRIBJKUEO/hRZ93lngol?=
 =?iso-8859-1?Q?0wwOF/FlO2Zj0JeyfoQvwTOYe55GDCQN0f6mAQIiPLkYEcMvalc5N/2HE4?=
 =?iso-8859-1?Q?KsGg3TFtGUUGq9izBCvgVBjIqFzF/BLgDRfu8axRI6hOQYf1pA4fvcE+bh?=
 =?iso-8859-1?Q?gDo8Wp5e6hFdCsHB2vVQJgu1rMU7wOoQZGxXHAFMcEFyozAx+JhMb0TO4Z?=
 =?iso-8859-1?Q?qAs8LGnDXNEFj9vbxd08CMgLgIPnFPTinG69RuTaLATAX+43hmrGaQZEiC?=
 =?iso-8859-1?Q?T2U21U0+dW+McQ5goUvIWp9946y29HQFdlEJWV5VTRQI/Pp2y/m+7+L3Vx?=
 =?iso-8859-1?Q?z8gi8XkKuxvYan4ygswAL0cfCJx85o7rxkyJQFSnxQTOBc0j3EVuOn+tdA?=
 =?iso-8859-1?Q?6L9YLMCI2g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0ca6ea-56df-45b8-ad16-08df39d026f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:27.9326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VJcF/ymvqL6tpX50pZxpkWG7zfkO3xrCkV0MBDy1r6nthf6iVYLzn8d0Wo+oX5ZjYQTefGnN+PkaaCfkEuGS0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-16d1c6/1793727029-F560A77B-6D5E1728/0/0
X-purgate-type: clean
X-purgate-size: 24134
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Add initial support for various emulated registers for virtual SMMUv3
for guests and also add support for virtual cmdq and eventq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 573 ++++++++++++++++++++++++-
 1 file changed, 571 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index e3ef68d193..070fe7af79 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -1,31 +1,589 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
=20
+/*
+ * IOMMU stage-1 emulation for ARM SMMUv3.
+ *
+ * TODO: Using ARM generic implementer/product/variant to avoid activating
+ * errata workarounds in the guest driver due to emulation layer.
+ * This needs to be fully handled in the future.
+ */
+
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/domain-layout.h>
 #include <asm/mmio.h>
+#include <asm/vgic-emul.h>
 #include <asm/viommu.h>
+#include <asm/vreg.h>
=20
 #include "smmu-v3.h"
 #include "vsmmu-v3.h"
=20
+/* Register Definition */
+#define ARM_SMMU_IDR2       0x8
+#define ARM_SMMU_IDR3       0xc
+#define ARM_SMMU_IDR4       0x10
+#define IDR0_TERM_MODEL     (1 << 26)
+#define IDR3_RIL            (1 << 10)
+/* Only CMDQ, EVENTQ and SMMUEN supported */
+#define CR0_RESERVED        0xFFFFFFF2U
+/* TODO: Right now only 16-bit SID size is supported */
+#define SMMU_IDR1_SIDSIZE   16
+/* The CMDQ/EVTQ sizes are currently set to the architectural maximum. */
+#define SMMU_CMDQS          19
+#define SMMU_EVTQS          19
+#define DWORDS_BYTES        8
+
+/* virtual smmu queue */
+struct arm_vsmmu_queue {
+    uint64_t    q_base; /* base register */
+    uint32_t    prod;
+    uint32_t    cons;
+    uint8_t     ent_size;
+    uint8_t     max_n_shift;
+};
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
     uint32_t    features;
+    paddr_t     addr;
+    uint32_t    cr[3];
+    uint32_t    cr0ack;
+    uint32_t    gerror;
+    uint32_t    gerrorn;
+    uint32_t    strtab_base_cfg;
+    uint64_t    strtab_base;
+    uint32_t    irq_ctrl;
+    uint64_t    gerror_irq_cfg0;
+    uint64_t    evtq_irq_cfg0;
+    struct      arm_vsmmu_queue evtq, cmdq;
+    spinlock_t  cmd_queue_lock;
+    spinlock_t  evt_queue_lock;
+    spinlock_t  gerror_lock;
+    spinlock_t  cr0_lock;
+    spinlock_t  cr1_lock;
+    spinlock_t  cr2_lock;
+    spinlock_t  strtab_cfg_lock;
+    spinlock_t  irq_cfg_lock;
 };
=20
+/* Helper functions */
+static inline bool smmu_get_smmu_enabled(struct virt_smmu *smmu)
+{
+    bool enabled;
+
+    spin_lock(&smmu->cr0_lock);
+    enabled =3D FIELD_GET(CR0_SMMUEN, smmu->cr[0]);
+    spin_unlock(&smmu->cr0_lock);
+
+    return enabled;
+}
+
+static inline bool smmu_get_cmdq_enabled(struct virt_smmu *smmu)
+{
+    bool enabled;
+
+    spin_lock(&smmu->cr0_lock);
+    enabled =3D FIELD_GET(CR0_CMDQEN, smmu->cr[0]);
+    spin_unlock(&smmu->cr0_lock);
+
+    return enabled;
+}
+
+static inline bool smmu_get_evtq_enabled(struct virt_smmu *smmu)
+{
+    bool enabled;
+
+    spin_lock(&smmu->cr0_lock);
+    enabled =3D FIELD_GET(CR0_EVTQEN, smmu->cr[0]);
+    spin_unlock(&smmu->cr0_lock);
+
+    return enabled;
+}
+
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
-    BUG_ON("unimplemented");
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+    uint32_t reg32;
+    struct hsr_dabt dabt =3D info->dabt;
+    uint64_t offset =3D info->gpa - smmu->addr;
+
+    if ( offset & 0x10000 )
+    {
+        /* page 1 */
+        switch ( info->gpa & 0xffff )
+        {
+        case VREG32(ARM_SMMU_EVTQ_PROD):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            /*  Write allowed only when SMMU_CR0.EVTQEN =3D=3D 0 */
+            if ( smmu_get_evtq_enabled(smmu) )
+                break;
+            spin_lock(&smmu->evt_queue_lock);
+            reg32 =3D smmu->evtq.prod;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->evtq.prod =3D reg32;
+            spin_unlock(&smmu->evt_queue_lock);
+            break;
+        case VREG32(ARM_SMMU_EVTQ_CONS):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->evt_queue_lock);
+            reg32 =3D smmu->evtq.cons;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->evtq.cons =3D reg32;
+            spin_unlock(&smmu->evt_queue_lock);
+            break;
+        default:
+            printk(XENLOG_G_ERR
+                "%pd: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
+                v->domain, info->dabt.reg, (unsigned long)info->gpa & 0xff=
ff);
+            return IO_HANDLED;
+        }
+    }
+    else
+    {
+        /* page 0 */
+        switch ( info->gpa & 0xffff )
+        {
+        case VREG32(ARM_SMMU_CR0):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr0_lock);
+            reg32 =3D smmu->cr[0];
+            vreg_reg32_update(&reg32, r, info);
+            smmu->cr[0] =3D reg32;
+            smmu->cr0ack =3D reg32 & ~CR0_RESERVED;
+            spin_unlock(&smmu->cr0_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CR1):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr1_lock);
+            reg32 =3D smmu->cr[1];
+            vreg_reg32_update(&reg32, r, info);
+            smmu->cr[1] =3D reg32;
+            spin_unlock(&smmu->cr1_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CR2):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr2_lock);
+            reg32 =3D smmu->cr[2];
+            vreg_reg32_update(&reg32, r, info);
+            smmu->cr[2] =3D reg32;
+            spin_unlock(&smmu->cr2_lock);
+            break;
+
+        case VREG64(ARM_SMMU_STRTAB_BASE):
+            /*  Must only be written when SMMU_CR0.SMMUEN =3D=3D 0, otherw=
ise ignore */
+            if ( smmu_get_smmu_enabled(smmu) )
+                break;
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->strtab_cfg_lock);
+            reg =3D smmu->strtab_base;
+            vreg_reg64_update(&reg, r, info);
+            smmu->strtab_base =3D reg;
+            spin_unlock(&smmu->strtab_cfg_lock);
+            break;
+
+        case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+            /*  Must only be written when SMMU_CR0.SMMUEN =3D=3D 0, otherw=
ise ignore */
+            if ( smmu_get_smmu_enabled(smmu) )
+                break;
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->strtab_cfg_lock);
+            reg32 =3D smmu->strtab_base_cfg;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->strtab_base_cfg =3D reg32;
+            spin_unlock(&smmu->strtab_cfg_lock);
+            break;
+
+        case VREG64(ARM_SMMU_CMDQ_BASE):
+            /*  Must only be written when SMMU_CR0.CMDQEN =3D=3D 0, otherw=
ise ignore */
+            if ( smmu_get_cmdq_enabled(smmu) )
+                break;
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->cmd_queue_lock);
+            reg =3D smmu->cmdq.q_base;
+            vreg_reg64_update(&reg, r, info);
+            smmu->cmdq.q_base =3D reg;
+            smmu->cmdq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->cm=
dq.q_base);
+            if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
+                smmu->cmdq.max_n_shift =3D SMMU_CMDQS;
+            spin_unlock(&smmu->cmd_queue_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CMDQ_PROD):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cmd_queue_lock);
+            reg32 =3D smmu->cmdq.prod;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->cmdq.prod =3D reg32;
+            spin_unlock(&smmu->cmd_queue_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CMDQ_CONS):
+            /*  Must only be written when SMMU_CR0.CMDQEN =3D=3D 0, otherw=
ise ignore */
+            if ( smmu_get_cmdq_enabled(smmu) )
+                break;
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cmd_queue_lock);
+            reg32 =3D smmu->cmdq.cons;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->cmdq.cons =3D reg32;
+            spin_unlock(&smmu->cmd_queue_lock);
+            break;
+
+        case VREG64(ARM_SMMU_EVTQ_BASE):
+            /*  Must only be written when SMMU_CR0.EVTQEN =3D=3D 0, otherw=
ise ignore */
+            if ( smmu_get_evtq_enabled(smmu) )
+                break;
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->evt_queue_lock);
+            reg =3D smmu->evtq.q_base;
+            vreg_reg64_update(&reg, r, info);
+            smmu->evtq.q_base =3D reg;
+            smmu->evtq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->ev=
tq.q_base);
+            if ( smmu->evtq.max_n_shift > SMMU_EVTQS )
+                smmu->evtq.max_n_shift =3D SMMU_EVTQS;
+            spin_unlock(&smmu->evt_queue_lock);
+            break;
+
+        case VREG32(ARM_SMMU_IRQ_CTRL):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->irq_cfg_lock);
+            reg32 =3D smmu->irq_ctrl;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->irq_ctrl =3D reg32;
+            spin_unlock(&smmu->irq_cfg_lock);
+            break;
+
+        case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->irq_cfg_lock);
+            reg =3D smmu->gerror_irq_cfg0;
+            vreg_reg64_update(&reg, r, info);
+            smmu->gerror_irq_cfg0 =3D reg;
+            spin_unlock(&smmu->irq_cfg_lock);
+            break;
+
+        case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->irq_cfg_lock);
+            reg =3D smmu->evtq_irq_cfg0;
+            vreg_reg64_update(&reg, r, info);
+            smmu->evtq_irq_cfg0 =3D reg;
+            spin_unlock(&smmu->irq_cfg_lock);
+            break;
+
+        case VREG32(ARM_SMMU_GERRORN):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->gerror_lock);
+            reg32 =3D smmu->gerrorn;
+            vreg_reg32_update(&reg32, r, info);
+            smmu->gerrorn =3D reg32;
+            spin_unlock(&smmu->gerror_lock);
+            break;
+
+        default:
+            printk(XENLOG_G_ERR
+                "%pd: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
+                v->domain, info->dabt.reg, (unsigned long)info->gpa & 0xff=
ff);
+            return IO_HANDLED;
+        }
+    }
+
+    return IO_HANDLED;
+
+ bad_width:
+    gprintk(XENLOG_G_ERR,
+            "%pd: vSMMUv3: bad write width %d r%d offset %"PRIpaddr"\n",
+            v->domain, dabt.size, dabt.reg, info->gpa & 0xffff);
     return IO_HANDLED;
 }
=20
 static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
                              register_t *r, void *priv)
 {
-    BUG_ON("unimplemented");
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+    struct hsr_dabt dabt =3D info->dabt;
+    uint64_t offset =3D info->gpa - smmu->addr;
+
+    if ( offset & 0x10000 )
+    {
+        /* page 1 */
+        switch ( info->gpa & 0xffff )
+        {
+            case VREG32(ARM_SMMU_EVTQ_PROD):
+                if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+                spin_lock(&smmu->evt_queue_lock);
+                *r =3D vreg_reg32_extract(smmu->evtq.prod, info);
+                spin_unlock(&smmu->evt_queue_lock);
+                break;
+
+            case VREG32(ARM_SMMU_EVTQ_CONS):
+                if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+                spin_lock(&smmu->evt_queue_lock);
+                *r =3D vreg_reg32_extract(smmu->evtq.cons, info);
+                spin_unlock(&smmu->evt_queue_lock);
+                break;
+
+            default:
+                printk(XENLOG_G_ERR
+                    "%pd: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n=
",
+                    v->domain, info->dabt.reg, (unsigned long)info->gpa & =
0xffff);
+                return IO_HANDLED;
+        }
+    }
+    else
+    {
+        /* page 0 */
+        switch ( info->gpa & 0xffff )
+        {
+        case VREG32(ARM_SMMU_IDR0):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            /*
+             * Emulated SMMU capabilities.
+             *
+             * Some architectural capabilities are currently not implement=
ed
+             * by the stage-1 emulation layer or underlying Xen SMMU suppo=
rt,
+             * therefore they are not advertised atm even if supported by =
the HW
+             */
+            reg  =3D FIELD_PREP(IDR0_S1P, 1) |
+                /*
+                 * TODO: Coherent access not supported by the emulation at=
m.
+                 * Guest must perform explicit cache clean
+                 */
+                FIELD_PREP(IDR0_COHACC, 0) |
+                /* Transaction stall on fault not implemented */
+                FIELD_PREP(IDR0_STALL_MODEL, 1) |
+                /* Terminating a transaction with RAZ/WI behavior not impl=
emented */
+                FIELD_PREP(IDR0_TERM_MODEL, 1);
+
+            /* HW reflected capabilities */
+            reg |=3D FIELD_PREP(IDR0_ST_LVL,
+                            smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB ?
+                            1 : 0);
+            reg |=3D FIELD_PREP(IDR0_TTF,
+                            smmu->features & ARM_SMMU_FEAT_TTF_AARCH32_64 =
?
+                            IDR0_TTF_AARCH32_64 : IDR0_TTF_AARCH64);
+
+            reg |=3D FIELD_PREP(IDR0_ASID16,
+                            smmu->features & ARM_SMMU_FEAT_ASID_16 ? 1 : 0=
);
+            if ( (smmu->features & ARM_SMMU_FEAT_TT_LE) &&
+                (smmu->features & ARM_SMMU_FEAT_TT_BE) )
+                reg |=3D FIELD_PREP(IDR0_TTENDIAN, IDR0_TTENDIAN_MIXED);
+            else if ( smmu->features & ARM_SMMU_FEAT_TT_LE )
+                reg |=3D FIELD_PREP(IDR0_TTENDIAN, IDR0_TTENDIAN_LE);
+    #ifdef __BIG_ENDIAN
+            else if ( smmu->features & ARM_SMMU_FEAT_TT_BE )
+                reg |=3D FIELD_PREP(IDR0_TTENDIAN, IDR0_TTENDIAN_BE);
+    #endif
+            *r =3D vreg_reg32_extract(reg, info);
+            break;
+
+        case VREG32(ARM_SMMU_IDR1):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            reg  =3D FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
+                FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
+                FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
+            *r =3D vreg_reg32_extract(reg, info);
+            break;
+
+        case VREG32(ARM_SMMU_IDR2):
+            goto read_reserved;
+
+        case VREG32(ARM_SMMU_IDR3):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            reg =3D 0;
+            *r =3D vreg_reg32_extract(reg, info);
+            break;
+
+        case VREG32(ARM_SMMU_IDR4):
+            goto read_impl_defined;
+
+        case VREG32(ARM_SMMU_IDR5):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            reg =3D 0;
+            if (smmu->features & ARM_SMMU_FEAT_GRAN64K)
+                reg |=3D IDR5_GRAN64K;
+            if (smmu->features & ARM_SMMU_FEAT_GRAN16K)
+                reg |=3D IDR5_GRAN16K;
+            if (smmu->features & ARM_SMMU_FEAT_GRAN4K)
+                reg |=3D IDR5_GRAN4K;
+
+            if (smmu->features & ARM_SMMU_FEAT_OAS_32_BIT)
+                reg |=3D IDR5_OAS_32_BIT;
+            if (smmu->features & ARM_SMMU_FEAT_OAS_36_BIT)
+                reg |=3D IDR5_OAS_36_BIT;
+            if (smmu->features & ARM_SMMU_FEAT_OAS_40_BIT)
+                reg |=3D IDR5_OAS_40_BIT;
+            if (smmu->features & ARM_SMMU_FEAT_OAS_42_BIT)
+                reg |=3D IDR5_OAS_42_BIT;
+            if (smmu->features & ARM_SMMU_FEAT_OAS_44_BIT)
+                reg |=3D IDR5_OAS_44_BIT;
+            if (smmu->features & ARM_SMMU_FEAT_OAS_48_BIT)
+                reg |=3D IDR5_OAS_48_BIT;
+            if (smmu->features & ARM_SMMU_FEAT_OAS_52_BIT)
+                reg |=3D IDR5_OAS_52_BIT;
+
+            *r =3D vreg_reg32_extract(reg, info);
+            break;
+
+        case VREG32(ARM_SMMU_IIDR):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            /* Use generic ARM IIDR value to avoid activating errata worka=
rounds */
+            reg  =3D FIELD_PREP(IIDR_IMPLEMENTER, IIDR_IMPLEMENTER_ARM) |
+                FIELD_PREP(IIDR_REVISION, 0) |
+                FIELD_PREP(IIDR_VARIANT, 0) |
+                FIELD_PREP(IIDR_PRODUCTID, 0);
+            *r =3D vreg_reg32_extract(reg, info);
+            break;
+
+        case VREG32(ARM_SMMU_CR0):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr0_lock);
+            *r =3D vreg_reg32_extract(smmu->cr[0], info);
+            spin_unlock(&smmu->cr0_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CR0ACK):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr0_lock);
+            *r =3D vreg_reg32_extract(smmu->cr0ack, info);
+            spin_unlock(&smmu->cr0_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CR1):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr1_lock);
+            *r =3D vreg_reg32_extract(smmu->cr[1], info);
+            spin_unlock(&smmu->cr1_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CR2):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cr2_lock);
+            *r =3D vreg_reg32_extract(smmu->cr[2], info);
+            spin_unlock(&smmu->cr2_lock);
+            break;
+
+        case VREG64(ARM_SMMU_STRTAB_BASE):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->strtab_cfg_lock);
+            *r =3D vreg_reg64_extract(smmu->strtab_base, info);
+            spin_unlock(&smmu->strtab_cfg_lock);
+            break;
+
+        case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->strtab_cfg_lock);
+            *r =3D vreg_reg32_extract(smmu->strtab_base_cfg, info);
+            spin_unlock(&smmu->strtab_cfg_lock);
+            break;
+
+        case VREG64(ARM_SMMU_CMDQ_BASE):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->cmd_queue_lock);
+            *r =3D vreg_reg64_extract(smmu->cmdq.q_base, info);
+            spin_unlock(&smmu->cmd_queue_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CMDQ_PROD):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cmd_queue_lock);
+            *r =3D vreg_reg32_extract(smmu->cmdq.prod, info);
+            spin_unlock(&smmu->cmd_queue_lock);
+            break;
+
+        case VREG32(ARM_SMMU_CMDQ_CONS):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->cmd_queue_lock);
+            *r =3D vreg_reg32_extract(smmu->cmdq.cons, info);
+            spin_unlock(&smmu->cmd_queue_lock);
+            break;
+
+        case VREG64(ARM_SMMU_EVTQ_BASE):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->evt_queue_lock);
+            *r =3D vreg_reg64_extract(smmu->evtq.q_base, info);
+            spin_unlock(&smmu->evt_queue_lock);
+            break;
+
+        case VREG32(ARM_SMMU_IRQ_CTRL):
+        case VREG32(ARM_SMMU_IRQ_CTRLACK):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->irq_cfg_lock);
+            *r =3D vreg_reg32_extract(smmu->irq_ctrl, info);
+            spin_unlock(&smmu->irq_cfg_lock);
+            break;
+
+        case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->irq_cfg_lock);
+            *r =3D vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
+            spin_unlock(&smmu->irq_cfg_lock);
+            break;
+
+        case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+            if ( dabt.size !=3D DABT_DOUBLE_WORD && dabt.size !=3D DABT_WO=
RD )
+                goto bad_width;
+            spin_lock(&smmu->irq_cfg_lock);
+            *r =3D vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
+            spin_unlock(&smmu->irq_cfg_lock);
+            break;
+
+        case VREG32(ARM_SMMU_GERROR):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->gerror_lock);
+            *r =3D vreg_reg32_extract(smmu->gerror, info);
+            spin_unlock(&smmu->gerror_lock);
+            break;
+
+        case VREG32(ARM_SMMU_GERRORN):
+            if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            spin_lock(&smmu->gerror_lock);
+            *r =3D vreg_reg32_extract(smmu->gerrorn, info);
+            spin_unlock(&smmu->gerror_lock);
+            break;
+
+        default:
+            printk(XENLOG_G_ERR
+                "%pd: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
+                v->domain, info->dabt.reg, (unsigned long)info->gpa & 0xff=
ff);
+            return IO_HANDLED;
+        }
+    }
+    return IO_HANDLED;
+
+ read_impl_defined:
+    printk(XENLOG_G_DEBUG
+           "%pd: vSMMUv3: RAZ on implementation defined register offset %"=
PRIpaddr"\n",
+           v->domain, info->gpa & 0xffff);
+    *r =3D 0;
+    return IO_HANDLED;
+
+ read_reserved:
+    printk(XENLOG_G_DEBUG
+           "%pd: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
+           v->domain, info->gpa & 0xffff);
+    *r =3D 0;
+    return IO_HANDLED;
+ bad_width:
+    gprintk(XENLOG_G_ERR,
+            "%pd: vSMMUv3: bad read width %d r%d offset %"PRIpaddr"\n",
+            v->domain, dabt.size, dabt.reg, info->gpa & 0xffff);
     return IO_HANDLED;
 }
=20
@@ -45,6 +603,17 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size,
=20
     smmu->d =3D d;
     smmu->features =3D features;
+    smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
+    smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
+
+    spin_lock_init(&smmu->cmd_queue_lock);
+    spin_lock_init(&smmu->evt_queue_lock);
+    spin_lock_init(&smmu->gerror_lock);
+    spin_lock_init(&smmu->cr0_lock);
+    spin_lock_init(&smmu->cr1_lock);
+    spin_lock_init(&smmu->cr2_lock);
+    spin_lock_init(&smmu->strtab_cfg_lock);
+    spin_lock_init(&smmu->irq_cfg_lock);
=20
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
--=20
2.43.0

