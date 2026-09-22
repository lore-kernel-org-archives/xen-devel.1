Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0134DC98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:40:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429021.1651991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fd-0006Ms-6t; Tue, 22 Sep 2026 14:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429021.1651991; Tue, 22 Sep 2026 14:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fc-0006Js-T3; Tue, 22 Sep 2026 14:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1429021;
 Tue, 22 Sep 2026 14:40:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x91fb-0005db-56
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:40:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91fa-00AHxl-HW
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:40:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2934d-bab6-0a2a0a5309dd-0a2a4506e4aa-40
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:30 +0200
Received: from [40.107.159.85]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2935b-195a-0a2a45060019-286b9f557f3a-9
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:30 +0200
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 (2603:10a6:800:33d::10) by GV2PR03MB11837.eurprd03.prod.outlook.com
 (2603:10a6:150:36e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:40:27 +0000
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04]) by VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:40:27 +0000
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
 b=WfbKos80XznyDPftf5KiWMIFnD44jddZg6S9jzGUYUNN+Lvv5X3WxAi2r81oEURcFFlg/wZgJXLnWwa7AMgeMaEEikEFgNXg2GjRjQnjRDGsucFIkdTtiMfm/QF99ZPTALneJI8jG76m1y5ioQk1GXA/RFQZA2Xttl6OyZo0H+jhirmaQ6AfIhHkcrDSu63OWi4SYH1BAbFbzUEqQrylHODFc4B+hSHfK4XdJ1Y1eWI8sPUlBCKNnC0bifoxz5W4PtMLhjI5LqnS7MGtrE3y6TQe6Cc23FDvtvdndtexk3LBNEjqKVSRyGLDmGLs4ooOft2bCLSdgVqJxEQyP5JBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5VLDzjGdXZ3fBMESadikUu6melFUxWISeZNonumRnY=;
 b=oCxA9gPh4YM2vBjrHBYBKIpsvFOL4GQ1RU0yYqk0yZJ+QvNzExMLUUSEDfRO+qT44H1WamwYVmvwqx4qXR4l+WOHAFdXnBEI6R4nnIXrdA2qSTnFnDGUPNMv2kevxZdcxWlDQEg32mo/TNjElrO+hXdvEv6DRJI0/6S8qujD59HLdQA3ZD0nGEPSJggH1zbBny/PTwgyUx9fgX9EPfFnWr1YaLbLgOCeemXJfJ10D/5qUD7zKK3JqL2CYZPoiMdZRSotYfQUYxFZp00Kv9j6gcBGGu8x/snnNx9yTgq2PYaGKr/JHQwSdGI/VM8blN2+vmssWN+qdZQ2GCjmhSm1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5VLDzjGdXZ3fBMESadikUu6melFUxWISeZNonumRnY=;
 b=M9XH9tGxluEF7odKkTVRTPVsK3IMro5mWiR+0AzT9rCvFe9ArQmsByRk5Bbq6HtIvBxQP1eADT54yWWQRhAT2j+s8FPnD2i0ru3lIoNX7TOjU/3UlRKkyX/ReZt6si9NT4JuUMOUFmWW4I6K6glbEfFG3Mgc2OU5Y15I1OKCGkHLICw0mkADfsaHomMSNVFeqpagI9xasT02VxJmC1Nd3UNpwEOnjqOFH0lNwuDBMipfkxONF03mrw3sGEmScwlYC7AeNvb5r8RvG2CqDI1kCinFIJg4UrH1Bc8Q83TuDPkHwnJ7vmpYsY61QSdSgsMqYqDsyhzUgEZmHrKWKh3WtQ==
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
Subject: [PATCH v13 6/6] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v13 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHdSqBOmL4tbK2mIUKon1saCe3zLg==
Date: Tue, 22 Sep 2026 14:40:26 +0000
Message-ID:
 <08f10459d0877e9960fe00182a5b7c1ba0551f64.1790087968.git.oleksii_moisieiev@epam.com>
References: <cover.1790087968.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1790087968.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB11419:EE_|GV2PR03MB11837:EE_
x-ms-office365-filtering-correlation-id: 7c2ef69b-ace9-40c8-1770-08df18b77175
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|38070700021|3023799007;
x-microsoft-antispam-message-info:
 vC5s5T6uhZ8+wFtlbfGl7gHQWrzmNxDSrWxwOzHEZPGo+dI4ra2B/YBE+BYIrPyQ+x9vqFdPuRaZE7FjAnDzKQ8wGo2d8lJY6WDqJAwq6A5pJ0xsi6rAc2cJjQLw6QpAxkZus0pcxn7dNUFSz+ophGzzGhGuR05CSqNpipWJBp8Wo3BEBDStvsStYnZOPWyl3pqgdyU/Hfzeaku8n97wTcaGUmSeq84GjCxBzmfoctzOuoBIdfnP3JG7JqLgYMaZYkiXqLfD3SirXOkORYQXrgdGSE9Hnf5a/yUBn3DUKB9AWa6V0NeH2yYL+qav16HB70RjXL0uUxLv+9HCdakvORdw7MtFGKwQWrMLQzmKs1wgSJkDe/yiO5gtAFBkUj9KAU97j7+KvJjMvHNjbmYkhSzvYMrSTLVpM3JdARTg9YBZV1IIbd5YoyWH8TlKvvf6/GH7bAOHcnmmhJmiDBIdgkjDoJvCyAzvcQy8P2jo5MHg/Zm3Ot+s56ltDuO9kTD/Gb0IqQYpRQ6I6g4FsoqzJcAHKy2D5CjoJDFOxUysd4SpzL/8wMvM2rn6A5W9qw5QVXDh2cY3bElQgstx3gSgAdoaViwXWary3XD9GOLBTpRWVK22smKW1AQa8T+mI9kAIef4uH4PSP5SOUDoYfQj4avr+zapDxSXnHC4XT1LuiM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB11419.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(38070700021)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NkRj1jRmd5D2m/aimZY45rlJ286LToamC2EYjMdDCwgUUKpXeBOXVCObKF?=
 =?iso-8859-1?Q?zjsfQ5Btm5bWxHn74JFr9D0ybH9UAR30u7JsZBIjOJKw0nexfTbCU7r/Ba?=
 =?iso-8859-1?Q?8oxFTqLiu0o9++5x83vkQ9aW67imEXQfcgBCm2aqH5bvC81/g2uNSYUszx?=
 =?iso-8859-1?Q?MI194+nygzk8rPADnWwShI5Gn5gwgTzo2jRF0D260o+CFtri63W93AMjpP?=
 =?iso-8859-1?Q?iKUShsIZiMd6AeRRpFa06Wb/n286wwEoD+BxaMAndoFXSt4fELVU9UI6PS?=
 =?iso-8859-1?Q?9eW9vM8yGMU9CWv1U7HcFT0lmRDBDDp5McaqEcugDUROSR9WyjK9pTiual?=
 =?iso-8859-1?Q?QZIGL0sZUM93754rQ3WwbnVAyP0YgOBdB7eBAT9miU0n9qp4OM4ayGUrGa?=
 =?iso-8859-1?Q?rOb3+edR8HaiPyplEUHXsZRFS00lO0rYkdj9N8bKQL7Dp+bLFfmnyGEdIg?=
 =?iso-8859-1?Q?LMjtdGYYSbsBs+erVtubBfS4VBUDHm+Sx0QkRoL5X8C7w4KvVJdZmJxqPo?=
 =?iso-8859-1?Q?OuR3ls53wjSMVnyr++mip5dlE8pH8wNEjoUPPpNbup63Hq/xIEkw2LGRIB?=
 =?iso-8859-1?Q?34M+W0CtDhJNSqfeBdOoprxghg8U0ZsJ55JYYW2/rdLqepXmoyvhySW3wq?=
 =?iso-8859-1?Q?emD4FNOtC5rPFUsfhKOoTUmtFSNJSoUdD2Mf/RLBXM1vw5IhkNVzKN0dMK?=
 =?iso-8859-1?Q?xNF83Lp9PX6FsZ43r/rYMARAmNLZNAfHrCMLP5RhvpErXuht2WSJ2HhKtM?=
 =?iso-8859-1?Q?mgBBDLCp0XLXcvTKU5DQi0EtFKoGWDdYkRWiKgav8OTLTUh29geltZGBxg?=
 =?iso-8859-1?Q?pgPdb5NV3D/LKtVh4k4f7AMkN4SnMfw6xSCSMCZk1ttiBS3Lr7ad5zDoYP?=
 =?iso-8859-1?Q?NTr30km3V9l5hzKsh3sxXjTOoS9Hy0oHHTjOuFRKsCCesUcvB4dfXNUzRG?=
 =?iso-8859-1?Q?TYl9CID2JLgzvAPmRlL9KXqM470F5s9fmTZOsLm1fwKRHFs0yXx/scYsUJ?=
 =?iso-8859-1?Q?cUqlCT3v8GVBVCSezTiHbnr285682pJAonzME0vOgQNcr+EiumKBtOXivQ?=
 =?iso-8859-1?Q?vi/uCEMFJv9G3ErpBr9+UK/2F2wcLAwodNLvjvT8Yq00u3oFqJFEJyrf+C?=
 =?iso-8859-1?Q?3n3rRbJAUx0ypPPPsorausXtSYw5lvOTcKbdpJ/FZx92/jevSTVdBVAn3Q?=
 =?iso-8859-1?Q?ee6PsjG8dLV1iK+3i88+nGH/EfNpdaSEZXkQP9QBf3ABykW0f4VgDwbPiz?=
 =?iso-8859-1?Q?wNa9Xm7e+z3xrKapw+8TATL0jqd5u7DR9bYrj1QEe/bJapaZBtWqt4FjNI?=
 =?iso-8859-1?Q?aPD7IdmJCh9yY/lByWKKUrn2dY0LTQ0x9AAeB1TcqQIrbkWs0dOt4uGC3K?=
 =?iso-8859-1?Q?svgtRp1LptRKEoVZT8ELS2Ys5Ql1rhl2nP0RZilVC1OveGMANT7Oi4IMl1?=
 =?iso-8859-1?Q?EzF2gtQBN8s1QHX8IK29+3T/5jT/U4plJqHWP+bETzTJTP1hZIw0htfxxg?=
 =?iso-8859-1?Q?qu6fAj6oLhzUF3mpDj7TlxBHcvwEkY7wnhO+QbBZihBIBnWgr6QMM28GsX?=
 =?iso-8859-1?Q?hFrRisBRDDU+58PvIdTyS16o/IOgD+WLuXmqBwfhkq9Jn8Z4bnWkt3LXmk?=
 =?iso-8859-1?Q?2JJER0xbDsXh9Ln0W61u6MG1rV4hgO4NcwiAjw323wbY/GzXqqYz369DIH?=
 =?iso-8859-1?Q?/Wn4kDKV/b91WgOhsC5ZzO4Nozwn1FMS1rjtJDCdCb70erFvSk/OMPAns0?=
 =?iso-8859-1?Q?ZWY42QR2eVeLgxbXHRqnXAYkpAsjh2bkMg4m867qqE1SyfoQ2sLM1b7oup?=
 =?iso-8859-1?Q?Zgna+/ZaF/QEQh321OpTxGTAvqSDyTg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB11419.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2ef69b-ace9-40c8-1770-08df18b77175
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:40:26.3616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwfTR8s44I5LGoLx4zHECICcFEf764lw0gG3ItyHxoQJQYd0Rm/hyvTCo8WuUXsaNU4pkZHAvvVY5rIKLjpTHU9CA/kfIVhU+bS7CdvhfEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11837
X-purgate-ID: tlsNG-16d1c6/1790088030-F460277B-8AAD7747/0/0
X-purgate-type: clean
X-purgate-size: 18936

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add SCI SCMI SMC multi-agent driver documentation.
It includes a detailed description of the SCMI multi-agent driver.
This document explains the driver's functionality, configuration,
and the compilation process. The Xen SCMI multi-agent driver is
designed to provide SCMI access to system resources from different
domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v10)

Changes in v10:
- rephrase section about /firmware/scmi. Mentioned that this node is
taken from Host DT and copied unmodified.
- fix xen,reg address for secondary domains for Dom0less configuration

Changes in v8:
- update documentation to match the last DT format
- fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
- update documentation with dom0less configuration example
- update documentation with new param xen,dom0-sci-agent-id
instead of the command line parameter

Changes in v7:
- update documentation in section of the xen_scmi configuration which
is matched by "xen,sci" compatible instead of the direct path.

Changes in v6:
- remove all HVC mentions from the multi-agent doc
- update sci-agent-id parameter description in the documentation
- add missing Sign-of
- minor fixes across the document

Changes in v5:
- rework multi-agent driver to leave Host Device-tree unmodified

 .../arm/firmware/arm-scmi.rst                 | 422 ++++++++++++++++++
 1 file changed, 422 insertions(+)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..8791bc665e 100644
--- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -36,6 +36,8 @@ The below sections describe SCMI support options availabl=
e for Xen.
=20
 | [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
 | [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetr=
ee/bindings/access-controllers/access-controllers.yaml>`_
+
=20
 Simple SCMI over SMC calls forwarding driver (EL3)
 ------------------------------------------------------
@@ -189,3 +191,423 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
 option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC multi-agent driver (EL3)
+-------------------------------------
+
+The SCMI SMC multi-agent driver enables support for ARM EL3 Trusted Firmwa=
re-A (TF-A) which
+provides SCMI interface with multi-agent support, as shown below.
+
+::
+
+      +-----------------------------------------+
+      |                                         |
+      | EL3 TF-A SCMI                           |
+      +-------+--+-------+--+-------+--+-------++
+      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
+      +-----+-+  +---+---+  +--+----+  +---+---+
+    smc-id1 |        |         |           |
+    agent1  |        |         |           |
+      +-----v--------+---------+-----------+----+
+      |              |         |           |    |
+      |              |         |           |    |
+      +--------------+---------+-----------+----+
+             smc-id0 |  smc-id2|    smc-idX|
+             agent0  |  agent2 |    agentX |
+                     |         |           |
+                +----v---+  +--v-----+  +--v-----+
+                |        |  |        |  |        |
+                | Dom0   |  | Dom1   |  | DomX   |
+                |        |  |        |  |        |
+                |        |  |        |  |        |
+                +--------+  +--------+  +--------+
+
+The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared-m=
emory transport
+for every Agent in the system. The SCMI Agent transport channel defined by=
 pair:
+
+- smc-id: SMC function id used for Doorbell
+- shmem: shared memory for messages transfer, **Xen page aligned**.
+  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _P=
AGE_DEVICE, indicating that this
+  memory is mapped as device memory.
+
+The following SCMI Agents are expected to be defined by SCMI FW to enable =
SCMI multi-agent functionality
+under Xen:
+
+- Xen management agent: trusted agents that accesses to the Base Protocol =
commands to configure
+  agent specific permissions
+- OSPM VM agents: non-trusted agent, one for each Guest domain which is  a=
llowed direct HW access.
+  At least one OSPM VM agent has to be provided by FW if HW is handled onl=
y by Dom0 or Driver Domain.
+
+The EL3 SCMI FW is expected to implement following Base protocol messages:
+
+- BASE_DISCOVER_AGENT (optional if agent_id was provided)
+- BASE_RESET_AGENT_CONFIGURATION (optional)
+- BASE_SET_DEVICE_PERMISSIONS (optional)
+
+The number of supported SCMI agents and their transport specifications are=
 SCMI FW implementation
+specific.
+
+Compiling with multi-agent support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+To build with the SCMI SMC multi-agent driver support, enable Kconfig opti=
on:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements following functionality:
+
+- The driver is initialized from the Xen SCMI container ``xen_scmi_config`=
`
+  under ``/chosen/xen`` (for example ``/chosen/xen/xen_scmi_config/scmi``)=
.
+  Only one SCMI interface is supported. The SCMI configuration must live u=
nder
+  the Xen SCMI container ``xen,sci`` beneath ``/chosen``.
+  The Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is =
a child of
+  this "xen,sci" container; any other "arm,scmi-smc" nodes (for example un=
der
+  "/firmware") are ignored to avoid stealing the host's SCMI OSPM instance=
.
+
+.. code-block:: dts
+
+        scmi_shm_1: sram@47ff1000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+        scmi_xen: scmi {
+          compatible =3D "arm,scmi-smc";
+          arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-id
+          #address-cells =3D < 1>;
+          #size-cells =3D < 0>;
+          #access-controller-cells =3D < 1>;
+          shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+        };
+
+.. note::
+   This layout keeps the Host DT unchanged for Dom0 and baremetal Linux by
+   using func_id 0x82000002 / shmem 0x47ff0000 for Dom0, while Xen uses a
+   separate privileged channel func_id 0x82000003 / shmem 0x47ff1000. EL3
+   firmware enforces permissions per agent_id, so there is no conflict bet=
ween
+   Dom0 and Xen channels.
+
+- The driver obtains Xen specific SCMI Agent's configuration from the Host=
 DT, probes Agents and
+  builds SCMI Agents list. The Agents configuration is taken from "scmi-se=
condary-agents"
+  property where first item is "arm,smc-id", second - "arm,scmi-shmem" pha=
ndle and third is
+  optional "agent_id":
+
+.. code-block:: dts
+
+    chosen {
+      ranges; <--- set default ranges so address can be translated when pa=
rsing scmi_shm node
+      xen {
+        ranges;
+        xen_scmi_config {
+          compatible =3D "xen,sci";
+          #address-cells =3D <2>;
+          #size-cells =3D <2>;
+          ranges; <--- set default ranges so address can be translated whe=
n parsing scmi_shm node
+          scmi-secondary-agents =3D <
+                        0x82000002 &scmi_shm_0 0
+                        0x82000004 &scmi_shm_2 2
+                        0x82000005 &scmi_shm_3 3
+                        0x82000006 &scmi_shm_4 4>;
+          #scmi-secondary-agents-cells =3D <3>; <--- optional, default 3
+          xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
+
+          scmi_shm_0 : sram@47ff0000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+          };
+
+          scmi_shm_2: sram@47ff2000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+          };
+          scmi_shm_3: sram@47ff3000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+          };
+          scmi_shm_4: sram@47ff4000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+          };
+
+          // Xen SCMI management channel
+          scmi_shm_1: sram@47ff1000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+          };
+
+          scmi_xen: scmi {
+              compatible =3D "arm,scmi-smc";
+              arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-i=
d
+              #address-cells =3D < 1>;
+              #size-cells =3D < 0>;
+              #access-controller-cells =3D < 1>;
+              shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+          };
+        };
+      };
+    };
+
+    /{
+        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI ena=
bled for it
+        scmi_shm: sram@47ff0000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+
+        firmware {
+            scmi: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000002>; <--- Host OSPM agent smc-id
+                #address-cells =3D < 1>;
+                #size-cells =3D < 0>;
+                shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem
+
+                protocol@X{
+                };
+            };
+        };
+    };
+
+  This approach allows defining multiple SCMI Agents by adding Xen-specifi=
c properties under
+  the ``/chosen`` node to the Host Device Tree, leaving the main part unch=
anged. The Host DT
+  SCMI channel will be passed to Dom0.
+
+  The Xen management agent is described as a ``scmi_xen`` node under the `=
`xen,sci`` compatible node,
+  which is used by Xen to control other SCMI Agents in the system.
+
+  All secondary agents' configurations are provided in the ``scmi-secondar=
y-agents`` property with
+  an optional ``agent_id`` field.
+
+  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to =
identify the agent in the
+  system and can be omitted by setting ``#scmi-secondary-agents-cells =3D =
<2>``, so the Secondary
+  Agents configuration will look like this:
+
+.. code-block:: dts
+
+    chosen {
+      xen {
+        xen_scmi_config {
+          compatible =3D "xen,sci";
+          scmi-secondary-agents =3D <
+                        0x82000002 &scmi_shm_0
+                        0x82000004 &scmi_shm_2
+                        0x82000005 &scmi_shm_3
+                        0x82000006 &scmi_shm_4>;
+          #scmi-secondary-agents-cells =3D <2>;
+        };
+      };
+    }
+
+  In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to disc=
over the ``agent_id``
+  for each secondary agent. Providing the ``agent_id`` in the ``scmi-secon=
dary-agents`` property
+  allows skipping the discovery call, which is useful when the secondary a=
gent's shared memory is
+  not accessible by Xen or when boot time is important because it allows s=
kipping the agent
+  discovery procedure.
+
+.. note::
+
+    Note that Xen is the only one entry in the system which need to know a=
bout SCMI multi-agent support.
+
+- The driver implements the SCI subsystem interface required for configuri=
ng and enabling SCMI
+  functionality for Dom0/hwdom and Guest domains. To enable SCMI functiona=
lity for guest domain
+  it has to be configured with unique supported SCMI Agent_id and use corr=
esponding SCMI SMC
+  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_=
id.
+
+- Once Xen domain is configured it can communicate with EL3 SCMI FW:
+
+  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
+  - the guest triggers SMC exception with agent "smc-id" (doorbell);
+  - the Xen driver catches exception, do checks and synchronously forwards=
 it to EL3 FW.
+
+- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen manag=
ement agent channel on
+  domain destroy event. This allows to reset resources used by domain and =
so implement use-case
+  like domain reboot.
+
+
+Configure SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^
+Set the Dom0 SCMI agent ID in the device tree using the Xen SCMI container=
 under ``/chosen``.
+Add ``xen,dom0-sci-agent-id`` to the ``xen,sci`` node. If the property is =
absent, SCMI stays
+disabled for Dom0 and the SCMI nodes are removed from Dom0 DT.
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
+        /* scmi-secondary-agents and scmi_xen as shown above */
+      };
+    };
+  };
+
+The Host DT ``/firmware/scmi`` node is copied to the Dom0 DT unmodified. H=
owever, for Dom0 SCMI
+configuration, Xen actually relies on ``scmi-secondary-agents`` and ``xen,=
dom0-sci-agent-id``
+properties from the ``xen,sci`` container under ``/chosen``. If the ``/fir=
mware/scmi`` node is
+missing or disabled, or if ``xen,dom0-sci-agent-id`` is not provided, the =
Dom0 SCMI agent will not
+be configured.
+
+.. note::
+
+  The ``xen,dom0-sci-agent-id`` value must match the ``func_id`` and ``shm=
em`` pairing provided by
+  the EL3 firmware for Dom0 (for example in the ``/firmware/scmi`` node).
+
+Configure SCMI for for guest domain with toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which shou=
ld correspond
+  assigned "agent_id" for the domain, for example:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example.
+  The "arm,smc-id" should correspond assigned agent_id for the domain:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000004>;  <--- smc-id for agent_id=
=3D2
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+**Device specific access control**
+
+The XEN SCMI SMC multi-agent driver performs "access-controller" provider =
function in case
+EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and p=
rovides the
+BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agent=
s have access to.
+The Host DT SCMI node should have "#access-controller-cells=3D<1>" propert=
y and DT devices should
+be bound to the SCMI node using Access Controllers bindings [3].
+
+For example:
+
+.. code-block:: dts
+
+    &i2c1 {
+            access-controllers =3D <&scmi 0>;
+    };
+
+Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from =
toolstack to the guest:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    xl.cfg:"dtdev" need contain all nodes which are under SCMI management =
(not only those which are
+    behind IOMMU) and passed-through to the guest domain.
+
+Configure SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* add "xen,sci_type" and "xen,sci-agent-id" properties for required DomU (=
"xen,domain") node
+
+::
+
+    xen,sci_type=3D"scmi_smc_multiagent"
+    xen,sci-agent-id=3D2
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above (toolstack case) and
+  enable access to the "arm,scmi-shmem" according to the dom0less document=
ation. For example:
+
+.. code-block:: dts
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff2000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
+
+* For SCMI device access control configure pass-through devices in the gue=
st partial DT according to
+  the dom0less documentation and ensure that devices SCMI management has "=
xen,path" property set:
+
+Example (dom0less, multi-agent):
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        #address-cells =3D <2>;
+        #size-cells =3D <2>;
+        ranges;
+
+        /* Xen management channel shared memory */
+        scmi_shm_1: sram@47ff1000 {
+          compatible =3D "arm,scmi-shmem";
+          reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        scmi_shm_domu: sram@47ff2000 {
+          compatible =3D "arm,scmi-shmem";
+          reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+
+        scmi-secondary-agents =3D <
+          0x82000004 &scmi_shm_domu 2>;
+        #scmi-secondary-agents-cells =3D <3>;
+
+        scmi_xen: scmi {
+          compatible =3D "arm,scmi-smc";
+          arm,smc-id =3D <0x82000003>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          #access-controller-cells =3D <1>;
+          shmem =3D <&scmi_shm_1>;
+        };
+      };
+    };
+
+    xen,domain@1 {
+      compatible =3D "xen,domain";
+      xen,sci_type =3D "scmi_smc_multiagent";
+      xen,sci-agent-id =3D <2>;
+      /* other domain properties here */
+    };
+  };
+
+.. code-block:: dts
+
+		i2c@e6508000 {
+            ...
+			reg =3D <0x00 0xe6508000 0x00 0x1000>;
+    ->        xen,path =3D "/soc/i2c@e6508000"
+    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+    ->        xen,force-assign-without-iommu;
+        };
--=20
2.43.0

