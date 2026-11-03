Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C374606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=aYojk+1D
Received: from list by lists.xenproject.org with outflank-mailman.1470373.1679183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILP-0003Vs-WC; Tue, 03 Nov 2026 17:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470373.1679183; Tue, 03 Nov 2026 17:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILP-0003Va-QT; Tue, 03 Nov 2026 17:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1470373;
 Tue, 03 Nov 2026 17:30:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILN-0003HO-RB
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILN-004KAj-7v
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:45 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a35-2eae-0a2a0a5409dd-0a2a4506cece-38
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:45 +0100
Received: from [52.101.83.79]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a44-195a-0a2a45060019-3465534f39e8-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:45 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:43 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:43 +0000
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
 b=ohFp/r7g0wssCKKS+6ToQzrvhnjyommBpUwez+7pW1bDPMMdbQ1Bp7uxUqWrX/G/TpJD3MV5DRudMBhgr01H0HjQ/3G+N/E/DMNlSt7p25CBBLJSAL4bP/VA6kEQHFLpK1lmDIXTs1pU9ULjq6kdPd5Qmpl24MqUOHnfqddvPIfgRV1Dv8iEosaBiveeES+DM1dWwz+V9jgCGBey+YqsVRew1NT02Kz2mxo4skegRUZNcXqCAiCgrxRk68kx5/Iu5wPytpnjwmyTulBrR6HFfmyABT/VhkHjFE3SMEp8mfwa0d3yGkt5tlZAt+A11OPshoOKDfCqdtMYVdv9WLcVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjDSPoDGSwSf3EnJMno/U3AlTZYLqnC/gCvJuJ4a6lU=;
 b=qpnyHtfYfLfQ/pkN6vUH19La1H8vgVVVgwf8sKUvGL2R2vv/RyjbaSKT34zepyahQTtJJZEUKAxvW/Jw1jYfWjbgoyW+XyJrz3CCsjCrlHUEaF+V/bmlaf63N970Lvl84+NqP5JB4YG13dxDiU6PN618MkJ75pDvRCnaqaDTrNBHeLEBv5XIsQeR6KHYzXhpOCvmSE6pRR8MNcVGEq2yaUtwcd3u91G4V0B/CfOMNvSGpURgzJX1JFnZuynEn6jCxb6+f0Cfr/l+howjUZL5l2Nft+wfrg0B1aZypbegGLfySlJz4Ix77U+o/3x5NT9Q3ilI7ITUW8/qohJX9fS3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjDSPoDGSwSf3EnJMno/U3AlTZYLqnC/gCvJuJ4a6lU=;
 b=aYojk+1DgmeO0jn/9JeAoASPDeLUDBLUa3QjE8athQ5pOZ5RTAUTaNAuHTGHVsi+geoYAgphyFBPBjoNqYCseTqASR927TYLq7J2X6tOHZQYNNTG0b5rCLqoVBgG0H3xvObdN0UjgBMcgtBMkixY0DrKOt53SNTsyv4UxQzjcmrwtB8dWwNgz5dZsJqUUjnJd0K7IjNdx+ilREEubO9qC/Kq5cMq4Pm+IHfV+DS80/G1dP0/wgkA4qA1l1Lkq+yKg6AzHXJHinDdW3vHYj8bo2Pj7/ROXdDN/DlxRXFOZNJCQTmOt6uL7btPxC3WHDvIzipgHAIBCfYsc449LvA0MQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Milan Djokic <milan_djokic@epam.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v5 14/22] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node
 for dom0less
Thread-Topic: [PATCH v5 14/22] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Thread-Index: AQHda7kNdMT5x1BE9UuSem23a2jAMA==
Date: Tue, 3 Nov 2026 17:30:43 +0000
Message-ID:
 <d9ebebace7bce6e058f0dc9534dabfff7993e6eb.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: e665fffa-330d-40e1-4b54-08df39d0300a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 u3b8TBOyLuE74aHsr8wucBgkFkODJgWghZZvLM7/KpgAieYXYtfWnHhbzT79LDUVdDpzspWYILMjXqAOYpjVrJYJYziBcxVKQZV9HhsCoa9KXzB64XgEQ3fHQMIb72nqm1+k9Dbi7ThTP+TwFxhj4lkyzai8N5uHWZc3Ik4+tecm+0YK/gfi1l46DABFAfTA42PcnNETE4XiJF2+mHwTR/sxWDOk5eWNmGHzuPE7PJMTRKfaL2OKXD3UGTFx3Xqa3ZHDr6YcezSjpto0gqelLNwp2XQFFElNSJvD5UJt6pAyXirC9wdXubvTRnolSzoxYd2DBEBm3prIR8jwCBtN7QTzyRpfXo5gPcw7f3WkVctDIKyv6qYZn1ZrMxbIhhWjgSHkeKH+Vqtdpq6oIeVvrn8iDdT8Suqhp066brCa9utwQhOmXNVobEPjHnekfuDm+GFs+ZmHeHph2HG2NJ9u3IJXzTCgq0/28Rf7Gd2ZXnLbQbngR3QYfIQZBiy1MiYwGVIn6bfonXqaoiIkizEo3bKrgjWeItox49FHLAn7+5ZRVvNEyr61CGFNmS7ZUdbkdKbUtWEIpQSqTcFkc/u8HtRb+fAU4JBdpdI0fc81zP+G0nis+dSQMlKny8DqOtIHRi5vMaCDyaY4y9FGFwzF1u0oOrN3cDCmRQPsuxk8gadmPHrb0ebAtwVGPKSEdZ5MqGhokVQU1qTYe2MVryFMVFwU2foIEg/MbafJXFdeQSQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MGGYhKz7i1P9d7C6WAiQIopynD45iqaJzh1xAKeS+XJkpBFQHJsrfglkKK?=
 =?iso-8859-1?Q?jPq6AWlzCIB8SIe83RwATRNnQ7s7x/tH49QqHrCFAlVc/yMcVXtmNn3RcU?=
 =?iso-8859-1?Q?0Bdq8O5/KSVYhLH1pf7puSa3+xs44D7iVa/JvRlitcBXm5EnSC8aFbRLe+?=
 =?iso-8859-1?Q?8fhgQnBOPfaiSYGLjaUuYq3GLoo97wOBIPk32LDh3QtIurZCjuxc5DAxsx?=
 =?iso-8859-1?Q?3gqwsF4GNBNHCFDxEMO/v+zbASZnE7ULVIPK29vZgBkT//KBSt8gjnrJxF?=
 =?iso-8859-1?Q?xVpYka6SfYA55W2n2wymlb0FRBysS7eoDvdOG/UJkVS3+lCPjie0Fgjt/w?=
 =?iso-8859-1?Q?Td7is3opKOrnDcKd0Df8/ulh8fxqDH+mzSNktXGsqybhednuNmp7ALEN1s?=
 =?iso-8859-1?Q?j5z+7+NT3CX/eh0ByH45/jmBUOGONr3GzBtwdC+xwg+f2/l/H51u2XzpPb?=
 =?iso-8859-1?Q?8bhReeRU6vlJZ02Vytn9qpD/RtifEIw4i1mdyicJ2JpYmfaNsz5NKlkpry?=
 =?iso-8859-1?Q?aO+fnKwOxy2A2jmL+pLJ2V9WPAP0V0r0h3gjnK0U4MBJKwRcBb5Tgs/nxs?=
 =?iso-8859-1?Q?ozUsLq595aUoN+AHmkpvBaSMrhTG37D102tlrGubKtSwT+qHagPty4n9VN?=
 =?iso-8859-1?Q?nWyYCnIHzStY5HrP4CYlQRFjdAwEfgJ2oC5uEAPYJNSz6xu6qmI6jbXb7/?=
 =?iso-8859-1?Q?ygMyKdqgo2fCLs83IN+dtrop20gRM3chUA4uGC/B41ICccjgqifGa+TwPx?=
 =?iso-8859-1?Q?8vD4sRpWwWsoxcwzQDHh7Ex32zJP66aX6LkFuzleJrsT/9j93PlHdjLLlf?=
 =?iso-8859-1?Q?jRwnFhJX5ldl4i83yxL20GPF4kZmb+Xj+invoO1rbo0nIBFehKmz1q2p2S?=
 =?iso-8859-1?Q?xITiOgpJXzpTFc6CNN70sxBLoVlPSSx72IyHc88MOld4zg1Z9xeHJJ2rgR?=
 =?iso-8859-1?Q?eiJkc7LnvJKQQK+dSLy3N0+ftYOOa51Tn+rkPu/r9mrdpyEvqNmvWuBjbJ?=
 =?iso-8859-1?Q?lPGFoV8mc2pSic7VnUGhteC/5L2TELQHq8lHCnfPpstfD0s/fdxnlsSazT?=
 =?iso-8859-1?Q?RJx2JQF/TtUN382VJEmEiIJZe/KRS5yeTO25BTBPbvpMPwrFPOYiBfzjoo?=
 =?iso-8859-1?Q?7PQSqGbBqK06HgdV9IE7R5snck0e+DNZ+LyvgIsomqVHGTJomUPllF4Z8j?=
 =?iso-8859-1?Q?30gkH0nubDfjosEdg1a6zJdMZ6Z6kelzcljWCnkc8GC0xOcvYWhRkfVx5P?=
 =?iso-8859-1?Q?Iu8mt7iTOQteE8TY7u9hgu/AYFcMTsZ52dIB5rYjt1cLX78OtEBv5bNDzm?=
 =?iso-8859-1?Q?GM9lDpAwCylXgbgXUZctwScAeVL0vXBCiJCW499ehowXNUloXpAG1fkMYC?=
 =?iso-8859-1?Q?miIBmP9L5VPFbf1vUm/tGrjDOhCrUKtz4fTol5NOhU9Ls/LtlDatYiWf4w?=
 =?iso-8859-1?Q?rePhNuryh6iVNyCcd9jzAwy7YkZz2uYHkc7iKj94QMVinq6nhkrAUwokuW?=
 =?iso-8859-1?Q?Q1GQz2eOzWoSDJ5KQhGjU6W2JAk/LGs0YAXHmEaVCdXkNJA75HU/c5SCtV?=
 =?iso-8859-1?Q?aum1YfzToLcdpu23uBMSg3WRAQQqqWep8icYIjzAbe+NP6C09xYWt8jk8q?=
 =?iso-8859-1?Q?BWBumHaFveAFUwQCwkFp4f49PfTGkTW7RzMKdnGV+bFSfPT7XKwP2eKj1z?=
 =?iso-8859-1?Q?UYSES17f7VHNFJhLTQqxjR4oFu1gSdvk78uoHTasMRUmdI/Ay4w57ISjMD?=
 =?iso-8859-1?Q?t11mRe5jWjwq9IVHs7apleZKzXVgHL6Jb/cjBpeNJaxXGqDbWJaSLCHxl3?=
 =?iso-8859-1?Q?NO+oHH2Rvw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e665fffa-330d-40e1-4b54-08df39d0300a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:43.1314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSF+AEp6uaLv/ZNZaaXZhptT+at0OngCtKi0P74DRRYwdzyO+OwW/Vav71Th6HnIJDQlw6Y8AWd4iJryQrzcFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-16d1c6/1793727045-FD40B77B-BF2F351A/0/0
X-purgate-type: clean
X-purgate-size: 3017
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an Emulated SMMUv3 device tree node in the device tree
to enable the dom0less domains to discover the virtual SMMUv3 during
boot. Emulated SMMUv3 device tree node will only be created when cmdline
option vsmmuv3 is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/dom0less-build.c         | 53 +++++++++++++++++++++++++++
 xen/include/public/device_tree_defs.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 6ad2a1b745..6bd705102f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -219,10 +219,63 @@ static int __init make_vpl011_uart_node(struct kernel=
_info *kinfo)
 }
 #endif
=20
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
+{
+    int res;
+    char buf[24];
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+    void *fdt =3D kinfo->fdt;
+
+    snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "arm,smmu-v3");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
=20
+
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+    if ( viommu_get_type() =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 )
+    {
+        ret =3D make_vsmmuv3_node(kinfo);
+        if ( ret )
+            return -EINVAL;
+    }
+#endif
+
     ret =3D make_psci_node(kinfo->fdt);
     if ( ret )
         return -EINVAL;
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h
index 9e80d0499d..7846a0425c 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_VSMMUV3 (GUEST_PHANDLE_IOMMU + 1)
=20
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
--=20
2.43.0

