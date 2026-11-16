Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA728606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=VtsAJq+l
Received: from list by lists.xenproject.org with outflank-mailman.1490269.1691210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsGE-0006ND-Lc; Mon, 16 Nov 2026 08:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490269.1691210; Mon, 16 Nov 2026 08:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsGE-0006Mj-Fa; Mon, 16 Nov 2026 08:40:22 +0000
Received: by outflank-mailman (input) for mailman id 1490269;
 Mon, 16 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xSsGD-0006IZ-AU
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsGC-0070BM-N2
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:40:20 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6afac171-8faa-0a2a0a5109dd-0a2a4502a3ca-8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:40:20 +0100
Received: from [52.101.72.113]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6afac174-6ca4-0a2a45020019-34654871f831-4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:40:20 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by AS8PR03MB6839.eurprd03.prod.outlook.com (2603:10a6:20b:29a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:40:18 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 08:40:18 +0000
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
 b=uYsQALnDTFIrPbgxODpYQd/E/Gqe5cGBTJddOMpRJB51RhesEB9abUbnutLiCda912C08kM64NpPpwljaa+JzA9cgDz7x7nN/3VIDvPG2f0fGu8Ev+c8ynsIU81nw/pDi4mijS7ljb1sX1jvlG6gEk9rgeCskVwfatzA/jmTGyHgzakChOruLigld2Abz021hc9xxxQflJptrUAM/YFz2jNwkxcTeNKw0K0iftfxRClPpMLzafccGWRfec+12r1TtEFL8GkCYv+UQ6FmgPBCCP+9C1QLuxPQBzF1WMiRu2v5QPesLR1jO3lhX6UQLxsi01c3UybvONQpKa9CWcC5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTC4Kbf9BUgl381k/GRvc5K9WNs6Ec7uhoj57kiaqYc=;
 b=P6EYULJsH7YDPw5oDVnAgwBMatpWGQzhNrRZqQte4jc7TJVoG6RpPpguUirpBtSxAMT4mpjQ186fKegk2aZct9J9xpY1Hb3Hu4W3WSUHwQUdX+RCbk8p+meBcfa/8K685gn2st/M/CgacfKOlVg7Bkt9M+7XEyiQvly12rKnNEeICMGzjiK9rOF90RmeSIk7ZTVPbDG+782HIuENTbJnYNsoKOUpAq9ZQoEMYddwty/L8V6V8DB5z9u9wrHpiVUk/n3Zg/npG1D72g5Wqg7kunfa8FvjSi9kNES7cxSLVWvz0RKYAxemSFlkcZcdMlrGbtOjz286bHObBinFVCaK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTC4Kbf9BUgl381k/GRvc5K9WNs6Ec7uhoj57kiaqYc=;
 b=VtsAJq+lF4ZDSnvtyownrQ/xDLJFOE9kUlpk/edUZJHh+Fmh1qNT4f/6l1G/T9Qro4bJ+EOa2mHMlvXrOQIuT9Mxg0VeHra5dfDQvTwYU6/7m1LOMM/M6huK/D4fPr4je6TW7u7NQz7cG0L8IOCLLF8ncS5iJy8jUdd06GXlAqOjAJfzX+IXCyjHXNXxa6KMetEFlXdmoe3RWtlB287O3zdSOGskhZK+97gTyntX1UkCjYLEbGzPLrMFMyD4HYoGUpZNsPOgNS3ipuWmLrUBwatWfVJ2VuFR1qdlr6MrprUhlZ2T+rL2wUyph+kct4xfgC3by4/FX/xfEd7xwlVs5Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/2] pci/rcar: Rename PCI host rcar4 to rcar
Thread-Topic: [PATCH v1 1/2] pci/rcar: Rename PCI host rcar4 to rcar
Thread-Index: AQHddaYc6eZdGHOG+0CvwE7hVZlwWw==
Date: Mon, 16 Nov 2026 08:40:18 +0000
Message-ID:
 <350d08bb0f494f96c02cedc4fa5e40673d512236.1794817300.git.mykyta_poturai@epam.com>
References: <cover.1794817300.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1794817300.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|AS8PR03MB6839:EE_
x-ms-office365-filtering-correlation-id: 5c76da37-bc4c-419d-b2cf-08df43bd3e97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|11063799006|56012099006|10067099003|38070700021;
x-microsoft-antispam-message-info:
 ePZBvsJDoVqohdNkTA6dGwf0mej8IiTqNELYW07cCsikEugCN4sri0osLuoFRmQ3tG5hfWAcNK2vdbn8Q6JEgXAryjjjFQGcWpvPfSXoqOnnFPqhqb6TzXUnl4dVZ2+rJ21h/+Kag3LGhWpTazzYKrrGNFm1nrz22LVYgdg43tP0mXNS4U1bbVhRtpo+If0dMoh0Nb5AuGFjfaJtr37YF9tWeg8RQV2ZRuh8zSNmLPM+msXKxLt8ogB67dR3D3gMFwEBH6L4PRTlR8cZinQrEGAAyDOMand3lzSCWpoYNpqvOLuvjR7CRUgYn9hp5pOpI7PjJTCOwN+1DHKUH6muQYEgfZ/ZznMxsBgiKyI833+uKHo7vqhMt1WweyTV04vPWecSsPkP+de6tFyoVpOxGjxV5I10a9jGokKbLqxhujuB/8bRKI+rvHsOip4haVBW0xMnymgBw/y1MLc4cg+itCly1G4i9QMJCHXXC4Jg773Q5X30Qbr4Q5OE2ZrZYZIBhKhxmaGLtM0nhHh7XOg20EPF07BX9ZIpRSzCthBDICQTcbG4lsdNKsWdqBOTnUrMkmnmQevkI5F95TqWmXIU3ZHkIhkriYg1ly9F1B4GLihiGG0MpfMjyDlQrZx2/uOm55xzSeO2se2J818hCJ7M+tJVNzwqzmdCkcGcnxxozS8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fYCqR9A0QbP2WxXL7F/7tJ98aVzD+2jHla1PSNwZ2eyR6rAJ/wkWuwTz6Z?=
 =?iso-8859-1?Q?/rz4x5G5NreTBSbwHD2pS8301mAc/oUc0utZZBL4KJEHW8PD4IVNDxyVd7?=
 =?iso-8859-1?Q?TuDcfWY30IHwaTEx7/8rTVnO655/Aq5rB3UaVJqgIfHR3tTWe4BdlqINu5?=
 =?iso-8859-1?Q?SHBNomNVjG8htoJrx8BkI2IKeZtdlXHL23q4Fh9nc7YuzYATJSRgJqj4iT?=
 =?iso-8859-1?Q?j+btAOO7kOLdTTmBRUFMnZVfPSGuoSOvTQrqiFGOoXxnR4lzcoltJ93WhY?=
 =?iso-8859-1?Q?tb9YAL9pcqz122HkEgvAVLebjq0IPQHRUO0QF7+9+iqs5sqW4lBGUYG05E?=
 =?iso-8859-1?Q?OkAp9NkGGrWA5pXXrAbXMcxYZooWamDB7BKSg/gauN+q4nhMKirlwOfM16?=
 =?iso-8859-1?Q?/b/14uZL9PeAwrf8QjUpT7Y4bSiK0KPo9ye/iq9hM8+P8ihenc/RHYj82G?=
 =?iso-8859-1?Q?byNupqTti4an2CqzYKqCKUc205wwS7qit0UdXZsLNg7DDkutI7TH1WHDN/?=
 =?iso-8859-1?Q?qUe8iP5W+mcTzQGTJbsh0PCgNNnzlgnhHBlToNcn7ZlylWLsUChLiwy/PD?=
 =?iso-8859-1?Q?HKGUSWW+bDuLy8TF1liA5cG0i0fTt8MBmebYm+9NvBMCXGTdpw0wvbu7Fy?=
 =?iso-8859-1?Q?G4uJN/iDkF3d0S2WZ5J9om5g9YVBioStQs/z4dOCDYfSx0yvdNa9gT34g4?=
 =?iso-8859-1?Q?d9XHIH8TF8cHwtZmkNG831AblfIV+BEf14hD2HBI4lHpGZy8oqoq49btC+?=
 =?iso-8859-1?Q?X+4oxW7ugcpj4r56J3EbBWujb1ryY0wf3h6/hvnP+5L2+8ZiaSCW5JEsIg?=
 =?iso-8859-1?Q?+3AJt09jUrpCWx23pyUpKpnI3g30y7U1oJEgPJxjgOUjJ52rp200yjfi2D?=
 =?iso-8859-1?Q?FwWFArQBwRHsT4gA59qzi/Lq1zbYLn2QT6++1upFmm5Wzo+QGcPBNqHWRh?=
 =?iso-8859-1?Q?xsqqdbF6qwR6N2UOhaj1ecxmuUqjbzsNjzyFwdMHieycNypnvfw9+e0MHC?=
 =?iso-8859-1?Q?Z100bTtgm0dh3r4p51uMNFUzJKxKYMYPbNobKbTXcaDom41DFXEe7Ochqo?=
 =?iso-8859-1?Q?4rpfbxtfL3RmLqFDYLxvCe85cVo7Y0HWdQsWppIiDobeopWpGBrg5riT0J?=
 =?iso-8859-1?Q?rDaQc64OPNUC37nzg2u5V7qpUgHUY7I8biuGF41WHV8VsHjMMaKyPDKgNv?=
 =?iso-8859-1?Q?DiFqQJpPHmJ6g4YcRYLQyQ6n4k9r1yoE473glzGo3Lm0p7Bf95nWx9UNnX?=
 =?iso-8859-1?Q?7t0e0cF6ETXAxzNPPHWc/l24UtP2jBcxj0+snfBtAGGs89fB281hY3G8a+?=
 =?iso-8859-1?Q?/z/b38swTjYkYLo8G/vLDWC0W8oKF86/9xUEvQHqTcj8eXfbcttmz5d/kY?=
 =?iso-8859-1?Q?cCwaLTdHeVlOTQzqFgwHBCRCTP7xEHKp9l36lSzhQ40/nDP5SX3mXGGM3U?=
 =?iso-8859-1?Q?Sz/loAhDG8oCI4iiBn4Sc4Vd/mF/SJiLg4r0eKzSz7S7ZpEd8if/hGxDP7?=
 =?iso-8859-1?Q?L0er7CkU6kixN6H4h3Jd1l5eookaSuzrTp9+9Ianka+9ll0xjW2SEFy1Md?=
 =?iso-8859-1?Q?AHuzYil+R6wSwB82e3JyHytTPNI9FH9ePVW7H7XY6d+jl+M97CetlRYZIo?=
 =?iso-8859-1?Q?1zzKDDYQvTd/x0jTmFGZV4cwP7OIdDS1QrKW70kGFwvi/5r+XC4ZQgrYUj?=
 =?iso-8859-1?Q?Tv9zke+5BBMgeRQPNczHwZUmy4DiLTrw7QTdUyUC5ZYP5clVlk1EZPb3E2?=
 =?iso-8859-1?Q?an/QsrPwtFkMc+o7VDltZzKdVFX9mA1T7PhPLyv0OVXWlGUVCjfpNF4AhU?=
 =?iso-8859-1?Q?c+5ygVRbAQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c76da37-bc4c-419d-b2cf-08df43bd3e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:40:18.7689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q//FhYr3ty1G6S2axyOGE3xYQaOAj54g8jUG3rvjBDDAEpUKUsZJ92sSqcJuun3CAFKahcRs8Shm1+JvzuBCmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6839
X-purgate-ID: tlsNG-720697/1794818420-F22A92AC-5B8E24C8/0/0
X-purgate-type: clean
X-purgate-size: 6785
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Gen5 mostly reuses the same DesignWare integration and register layout
as Gen4, so one driver covers both. Drop the generation number from the
file and symbol names.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 MAINTAINERS                                   |  2 +-
 xen/arch/arm/pci/Makefile                     |  2 +-
 .../pci/{pci-host-rcar4.c =3D> pci-host-rcar.c} | 32 +++++++++----------
 .../pci/{pci-host-rcar4.h =3D> pci-host-rcar.h} |  6 ++--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c      |  2 +-
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename xen/arch/arm/pci/{pci-host-rcar4.c =3D> pci-host-rcar.c} (88%)
 rename xen/arch/arm/pci/{pci-host-rcar4.h =3D> pci-host-rcar.h} (88%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b804434d52..68b47adf81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -504,7 +504,7 @@ T:	git https://xenbits.xenproject.org/git-http/qemu-xen=
.git
 RCAR PCI
 M:	Mykyta Poturai <mykyta_poturai@epam.com>
 S:	Supported
-F:	xen/arch/arm/pci/pci-host-rcar4.c
+F:	xen/arch/arm/pci/pci-host-rcar.c
=20
 REMUS
 S:	Orphan
diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index ca6135e282..431a91c46d 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -5,4 +5,4 @@ obj-y +=3D pci-host-common.o
 obj-y +=3D ecam.o
 obj-y +=3D pci-host-zynqmp.o
 obj-y +=3D pci-designware.o
-obj-y +=3D pci-host-rcar4.o
+obj-y +=3D pci-host-rcar.o
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar.c
similarity index 88%
rename from xen/arch/arm/pci/pci-host-rcar4.c
rename to xen/arch/arm/pci/pci-host-rcar.c
index e1e8eb0ee1..5f184d5ebc 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar.c
@@ -13,9 +13,9 @@
 #include <asm/pci.h>
=20
 #include "pci-designware.h"
-#include "pci-host-rcar4.h"
+#include "pci-host-rcar.h"
=20
-#define RCAR4_DWC_VERSION       0x520A
+#define RCAR_DWC_VERSION     0x520A
=20
 /* PCIE BDF-OSID assignment */
 #define CNVID(n)             (0x700 + ((n) * 4))
@@ -51,20 +51,20 @@ struct rcar4_pcie_priv {
  *   "config": child's configuration space
  *   "atu"   : iATU registers for DWC version 4.80 or later
  */
-static int __init rcar4_cfg_reg_index(struct dt_device_node *np)
+static int __init rcar_cfg_reg_index(struct dt_device_node *np)
 {
     return dt_property_match_string(np, "reg-names", "dbi");
 }
=20
-static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
+static int __init rcar_child_cfg_reg_index(struct dt_device_node *np)
 {
     return dt_property_match_string(np, "reg-names", "config");
 }
=20
 /* ECAM ops */
-static const struct pci_ecam_ops rcar4_pcie_ops =3D {
+static const struct pci_ecam_ops rcar_pcie_ops =3D {
     .bus_shift  =3D 20,
-    .cfg_reg_index =3D rcar4_cfg_reg_index,
+    .cfg_reg_index =3D rcar_cfg_reg_index,
     .pci_ops    =3D {
         .map_bus                =3D pci_ecam_map_bus,
         .read                   =3D pci_generic_config_read,
@@ -74,9 +74,9 @@ static const struct pci_ecam_ops rcar4_pcie_ops =3D {
     }
 };
=20
-static const struct pci_ecam_ops rcar4_pcie_child_ops =3D {
+static const struct pci_ecam_ops rcar_pcie_child_ops =3D {
     .bus_shift  =3D 20,
-    .cfg_reg_index =3D rcar4_child_cfg_reg_index,
+    .cfg_reg_index =3D rcar_child_cfg_reg_index,
     .pci_ops    =3D {
         .map_bus                =3D dw_pcie_child_map_bus,
         .read                   =3D dw_pcie_child_config_read,
@@ -86,7 +86,7 @@ static const struct pci_ecam_ops rcar4_pcie_child_ops =3D=
 {
     }
 };
=20
-static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] =
=3D {
+static const struct dt_device_match __initconstrel rcar_pcie_dt_match[] =
=3D {
     { .compatible =3D "renesas,r8a779f0-pcie" },
     { .compatible =3D "renesas,r8a779g0-pcie" },
     {},
@@ -179,8 +179,8 @@ void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bri=
dge, unsigned int reg_id,
     rcar4_pcie_writel_app(priv, CNVIDMSK(reg_id), val);
 }
=20
-static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
-                                       const void *data)
+static int __init pci_host_rcar_probe(struct dt_device_node *dev,
+                                      const void *data)
 {
     struct pci_host_bridge *bridge;
     paddr_t app_phys_addr;
@@ -191,8 +191,8 @@ static int __init pci_host_rcar4_probe(struct dt_device=
_node *dev,
     if ( !priv )
         return -ENOMEM;
=20
-    bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
-                                &rcar4_pcie_child_ops);
+    bridge =3D dw_pcie_host_probe(dev, data, &rcar_pcie_ops,
+                                &rcar_pcie_child_ops);
=20
     app_idx =3D dt_property_match_string(dev, "reg-names", "app");
     if ( app_idx < 0 )
@@ -219,7 +219,7 @@ static int __init pci_host_rcar4_probe(struct dt_device=
_node *dev,
            app_phys_addr + app_size - 1);
=20
     dw_pcie_set_priv(bridge, priv);
-    dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
+    dw_pcie_set_version(bridge, RCAR_DWC_VERSION);
=20
     return 0;
 err:
@@ -228,8 +228,8 @@ err:
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
-.dt_match =3D rcar4_pcie_dt_match,
-.init =3D pci_host_rcar4_probe,
+.dt_match =3D rcar_pcie_dt_match,
+.init =3D pci_host_rcar_probe,
 DT_DEVICE_END
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-rcar4.h b/xen/arch/arm/pci/pci-host-=
rcar.h
similarity index 88%
rename from xen/arch/arm/pci/pci-host-rcar4.h
rename to xen/arch/arm/pci/pci-host-rcar.h
index 31ef9d2d40..ffd49e3c1c 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.h
+++ b/xen/arch/arm/pci/pci-host-rcar.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __PCI_HOST_RCAR4_H__
-#define __PCI_HOST_RCAR4_H__
+#ifndef __PCI_HOST_RCAR_H__
+#define __PCI_HOST_RCAR_H__
=20
 #include <asm/pci.h>
=20
@@ -17,4 +17,4 @@ void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bri=
dge,
 int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
 #endif
=20
-#endif /* __PCI_HOST_RCAR4_H__ */
+#endif /* __PCI_HOST_RCAR_H__ */
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index 0648f9b407..bfb9df238a 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -51,7 +51,7 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
-#include "../arch/arm/pci/pci-host-rcar4.h"
+#include "../arch/arm/pci/pci-host-rcar.h"
=20
 #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
=20
--=20
2.56.1

