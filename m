Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7DA606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=s15gs2hF
Received: from list by lists.xenproject.org with outflank-mailman.1470342.1679092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL3-0008UW-LM; Tue, 03 Nov 2026 17:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470342.1679092; Tue, 03 Nov 2026 17:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL3-0008UP-Hg; Tue, 03 Nov 2026 17:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1470342;
 Tue, 03 Nov 2026 17:30:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIL1-0008Gc-MG
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIL1-00F76l-2r
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:23 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a1c-bab6-0a2a0a5309dd-0a2a4506cffc-42
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:23 +0100
Received: from [52.101.84.135]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a2e-195a-0a2a45060019-346554879b92-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:23 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:21 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:21 +0000
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
 b=GpBsMHKOn9gLduNV/XKdXCRoNfTHhxzjRlomJ5kqEtL8QRJQrpMCC/1R8jCgjLJXHt2jdKVA0SPrulMOuciPaRr2y1rrPoMTb9OpO0jUgpI8u1ksrv3lAacmq119EadLOygaxK0XTArLh4LlAfCmwO0gA2he+3LvYVukj+L9sOd37KyROnRDDDqsYaAaBVMbQCxJn5irJoVyX5tqTFnUknjEE35M81c7qXOSJjDvG9MlcmfOnNbM+xQI7arnJ/1BKoFMqiZr0STZzDmuDVKS6tlphT4K6bOaqyGY86QCwxMxmK4Sm+ukbXjmZa8MHGUyn4H/Fv3NRoF1BvLOwlXOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyHd0C7JIy9GyS6K+VSUFZspP9Ioi+FTaWRGsBeIlhQ=;
 b=e8Tg+MeBKjSNUMrem9E2emMpFPxz42zCcsQNSZ+JB3SLZJ+m04USGc9H5JVmwPub25gd9ZxPMsVZjyeU1ldhe9eDkuX5Dlkc99aLp3sYqNU1pfBtXadj3a+WfNSaqaAcj/MMpYVXEK28sWkGJ2snW0eCcGKj349ibF8K1XQthUPgOWE0HuiEAli6up5S+vMgeEd5AbGK26IL9+lf7ZJh57+lyANL7dIEIDYCZ+nmKEBEQAeq24aBVhdPqbXvqA/o/Ia62f0//6n0Kqxdwg40FgRefgdZ9eK6Wa/Q7eoMDL5wCO7Vhov2l2dR4ptfILbnrD8ZlACQ2SGmYxJqtYTs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyHd0C7JIy9GyS6K+VSUFZspP9Ioi+FTaWRGsBeIlhQ=;
 b=s15gs2hFq5JUYDMWXTZlTa+33QUmszFto5Mt/PFevQZNhEmo88wfl8+GDM/HTdSrdOYcLP6iRKaHCIruQxFqtb8JjIGJgDiF0WqkilqyKlgHeE7ywdi1hKGw6d936Bw7ffYSfkMp2h2YIWKZh0vxX/tM2Vdn+SYMMKmaR6jUpmu1pR5TOx+drB/J03bVcgvvHhBSLtmMdsqzYpJSIoz9tDTYvTBm9C1dUb0qR2Z5vPKf7Vz7CucGpHzp9X2uetkBye/0VGVdvtyBkFUO3g62s3FQngUCcJZlAFom9kkmtg6SNuJvfOYBpdiGAILidcmn1OElju5AxrebpI1Zf0upQg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v5 04/22] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [PATCH v5 04/22] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHda7kAdEtBXg2WyEmfGpH0dbiJbw==
Date: Tue, 3 Nov 2026 17:30:21 +0000
Message-ID:
 <28ea15da6f8b3d85e6d068b9ecd96bcd76d556f1.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 839f700b-311a-4040-79d0-08df39d022ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|260925021911599003|260925022911599003|260925021311599003|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 NSA6Wy7V5jCJLK67qwgYun8Rxi0dmHNfF1tdHZVrjAfuOTYwMVCCNUSiU159dEvtY6l9otc7ucQwDkuYV0+UaVLihKtsPM6MpsrLkFPevdBhjLYm/FEydfse1SRLCBfz+0o/K+mVwi2c5/qMhNIuLF5szoIr38HWumED0zalXJCJIcptBQkrn+dhkmjjdwcgZoYP/LRLondtpXZrxYMHRUc6MLQjKvy9bZefPdgEkANgRc5ZqFrAPl5o+35CZGnHdOrF5hWh8ZaqbJ+/NSQWZ6OZEJUWqPhM3So0KxThXk2rruyQ/cTfql2PFf458tR9DblakCO+d2JN/p3a7Jerkk03RDvhtfarz1wF2LsWFMisfujp70BC+QA0RaMsUkpppS+t7FWpWryFFD+6uQwQoOFRbZ2WmEXRkOWLL+188wGTRkoQ7aCndc8Qa8O504YT1TgIsqSf44n6fSGQR308b3JNfcx4lvmnh6+OBLj+ybd9CxjFrV+rMljaCTpyVCc5+QVh2nIbj4EjMhLzfn1BWsvXPIywVj1cbJAYOVcHkUvE18bsqLT/0G/rYmiIsFIocLj5X1DV8q6qGV7wrlQzeqO8yfv+blFaeoK0FjV76k00RE7EdDWGLNfxLeVQeymAHmWjbK0JRsZ184Od9J5IFAuGAvm8as969jfCo3Kp9Mjf9rukysCAJbN6cGUiX+rf2Bn88QKC9tUNvv7HmOXVAfPMa43jEy/iAY3drotI5A8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(260925021911599003)(260925022911599003)(260925021311599003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kRSA3K+OgOFS3XgnOVKbW+QWcyY629zvMIBwP3wv75GEaVh6oeW/UK85T7?=
 =?iso-8859-1?Q?8DgASC/qDJuBp6on+bUeSqnygdepULWcPf2P4dfHGaWQmR9IYJfk3+4TKj?=
 =?iso-8859-1?Q?J+JD2sEhh4BlEZ4raGYoLkeQV9IEL8cLYztOXhkQkGqSiqaI235pzlj/b/?=
 =?iso-8859-1?Q?4QkCRsVZ5pgip+VIo6ONqB9h1YWaCcrmUc3RpijcR1Zh7E0sClFEbpcFR8?=
 =?iso-8859-1?Q?M0D+/WC4cUlvk0HKeZAhaAhl+5QRIsWl9x7z745NJ6Vvi4UsdzCClkv6M1?=
 =?iso-8859-1?Q?R3QeAOBZ3nWpSBd+72LZ7sm1MKJnjybr5JBThUb7yjs76wdBkO0vFNIpCV?=
 =?iso-8859-1?Q?NPNvjYLdclQRD+OR9LZBiLmUYa/936adYdZ02cM8AJvgo2rXYlxL4THbAA?=
 =?iso-8859-1?Q?FVxvU+zLvZzXTNDUC35qz0ZzACTBTQWU2Y0qkbpbWmDgGodxygwPE0HUcv?=
 =?iso-8859-1?Q?SrDuvy6Jhx2hJP6SuGA4ZAH2j1otD285KsSv5tdlIg+eqZ0KArNXhUoISH?=
 =?iso-8859-1?Q?9phb+Hvta4BfPnU14/HV2yLcyHG1p7t6tupnxsxmkhEaveUtvQYKd6Pe9P?=
 =?iso-8859-1?Q?BZIAC9TF6Ef5GeoEQV1fW7qQzxnxcgMFuIA0DhsX/0sGTUB+9LWFzQcK5J?=
 =?iso-8859-1?Q?kcJPQEEaYLsPkcYKUHuVS7AZfGs+hdKBHWf8EUTwDAH1RDG88Zgdt/kCGz?=
 =?iso-8859-1?Q?XW44gSgC/S1Eprdf6ShQq8NaHUNSkU/pAGOCJd6J4pMkLk4036InbxPIc4?=
 =?iso-8859-1?Q?HltIVYHw1ikYW1FGaVjDuE8TwWDE62YPNCqb8/ONWLNjF+Dpw8HtM3TytY?=
 =?iso-8859-1?Q?+OXGWTvV/grRg6lFdaEdDzY0mrDgerKs7t1BtX2+MWDJBHZnj7c+aITxaL?=
 =?iso-8859-1?Q?NJ5f6bgT6Oyap81CUdvuG50VGjYgppNygIHtqX6fhX5jOL77Dz6PqVSulk?=
 =?iso-8859-1?Q?+2Qlrze3tUcecgf4OeOv1vJzxBSbFT63bXeN9euE8fGaR8xvYTU2nHtvPt?=
 =?iso-8859-1?Q?+fzKEXhB6+Zjf1mpGSleyQM040bI8BZ1amScG0D6uBkLl56Ope14mQIIDq?=
 =?iso-8859-1?Q?ubnnhnkTt2PHebEXjDjoKqPMGn+Z8Kjg/OdOo3TkzT3InZUe9RLEHPNSB/?=
 =?iso-8859-1?Q?RigZ/br9i2RS7yMEBKAjuoKi4RTDv1bDP3T6tbOHeF4xzTAPpGNc+6pmnC?=
 =?iso-8859-1?Q?m66dTk588U4UF1vST8nmw5YuS6CtI7Ne6I/067uzrJuW+gPHwV3rAmieFX?=
 =?iso-8859-1?Q?R3TUbapj/TGy5m7YCA6osAYI/BuupFqQMM9OwVYiyN/QV8X2gdiDao6gMt?=
 =?iso-8859-1?Q?i+RPnSSF5TKx+n83fDrYligWUQTv5rVXYPe/ebFDCFF24+OSNC+AX4EpHg?=
 =?iso-8859-1?Q?axduKeh4P6r4Iwgoshx3UirxPjTnS1MXmv3/IrjcOcPQNhr1cPLd4uetEU?=
 =?iso-8859-1?Q?LFjPYUV4/Uw83BJOI8+58ZwP1ga0NeQEqvHnWwAycpylxKgrGi7C1/UTub?=
 =?iso-8859-1?Q?erE/xDGH8JOSY6U04jkh3Kv0zE0GY2e4fYttTEe8Cd4GrriKKW2cenWilo?=
 =?iso-8859-1?Q?3xhAHt9iVevXeiUkI7r+oJ/Vnb8Qj3YxOXzO6/pNWm5tMuqZag/ixGDARj?=
 =?iso-8859-1?Q?59a181oGg83AbsXEkeMDjPVQnbjW4MGjNGMOq/X2E/JdtOvoAr7SKapst9?=
 =?iso-8859-1?Q?oe/Dq1hWtb+pgapwf4XOAUN8XPA2rW6ikYFN5mf64ggmjb5G/ZedJPv2qg?=
 =?iso-8859-1?Q?MYUR95N2KM5Hx4GnA8TA8fawBwfyz0TmhxEmREhWi9Em/3fdhuXd+Y+zQJ?=
 =?iso-8859-1?Q?73VIyMPzJA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839f700b-311a-4040-79d0-08df39d022ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:21.1842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cAn6ImQD4jOgyB3qry2MRFNGWR5IzMxWYHE2I6MVeYBOYvggSZDjBh2TLS6nrRzdHGGEyXIAV3vMA+Zc47DOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-16d1c6/1793727023-1F6C877B-A3B6F04D/0/0
X-purgate-type: clean
X-purgate-size: 9893
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

This patch adds basic framework for vIOMMU.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c        |  5 ++
 xen/arch/arm/domain.c                | 31 +++++++++++-
 xen/arch/arm/domain_build.c          |  2 +
 xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
 xen/drivers/passthrough/Kconfig      |  5 ++
 xen/drivers/passthrough/arm/Makefile |  1 +
 xen/drivers/passthrough/arm/viommu.c | 49 +++++++++++++++++++
 xen/include/public/arch-arm.h        |  6 ++-
 8 files changed, 167 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/viommu.h
 create mode 100644 xen/drivers/passthrough/arm/viommu.c

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 7bbb2eafb6..b55218d920 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -24,6 +24,7 @@
 #include <asm/domain_build.h>
 #include <asm/firmware/sci.h>
 #include <asm/gic.h>
+#include <asm/viommu.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -370,6 +371,10 @@ int __init arch_parse_dom0less_node(struct dt_device_n=
ode *node,
     uint32_t val;
=20
     d_cfg->arch.gic_version =3D gic_domctl_hw_version();
+    /* Set detected vIOMMU domain type only if IOMMU is enabled for the do=
main */
+    d_cfg->arch.viommu_type =3D d_cfg->flags & XEN_DOMCTL_CDF_iommu ?
+                              viommu_get_type() :
+                              XEN_DOMCTL_CONFIG_VIOMMU_NONE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( domu_dt_sci_parse(node, d_cfg) )
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 34b5a85f9f..950163a927 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -33,6 +33,7 @@
 #include <asm/vgic.h>
 #include <asm/vpci.h>
 #include <asm/vpsci.h>
+#include <asm/viommu.h>
 #include <asm/vtimer.h>
=20
 #include "vuart.h"
@@ -659,6 +660,21 @@ int arch_sanitise_domain_config(const struct xen_domct=
l_createdomain *config)
         return -EINVAL;
     }
=20
+    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
+         config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU requested while iommu not enabled for domain\n");
+        return -EINVAL;
+    }
+
+    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU type requested not supported by the platform or Xe=
n\n");
+        return -EINVAL;
+    }
+
     return sci_domain_sanitise_config(config);
 }
=20
@@ -758,6 +774,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
         goto fail;
=20
+    if ( (rc =3D domain_viommu_init(d, config->arch.viommu_type)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -818,7 +837,8 @@ static void resume_ctx_reset(struct resume_info *ctx)
 void arch_domain_destroy(struct domain *d)
 {
     resume_ctx_reset(&d->arch.resume_ctx);
-
+    if ( viommu_relinquish_resources(d) )
+        printk(XENLOG_ERR "%pd: Domain vIOMMU teardown failed\n", d);
     tee_free_domain_ctx(d);
     /* IOMMU page table is shared with P2M, always call
      * iommu_domain_destroy() before p2m_final_teardown().
@@ -1054,6 +1074,7 @@ static int relinquish_memory(struct domain *d, struct=
 page_list_head *list)
  */
 enum {
     PROG_pci =3D 1,
+    PROG_viommu,
     PROG_sci,
     PROG_tee,
     PROG_xen,
@@ -1101,6 +1122,14 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
 #endif
+    /*
+     * PCI devices may rely on the vIOMMU, so its resources
+     * should be relinquished only after the PCI devices are released.
+     */
+    PROGRESS(viommu):
+        ret =3D viommu_relinquish_resources(d);
+        if (ret )
+            return ret;
=20
     PROGRESS(sci):
         ret =3D sci_relinquish_resources(d);
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1ee1f1f6a7..f749f9ae10 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -37,6 +37,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <asm/viommu.h>
 #include <xen/event.h>
=20
 #include <xen/irq.h>
@@ -1988,6 +1989,7 @@ void __init create_dom0(void)
     dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
+    dom0_cfg.arch.viommu_type =3D viommu_get_type();
=20
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
new file mode 100644
index 0000000000..95f82d9cf5
--- /dev/null
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __ARCH_ARM_VIOMMU_H__
+#define __ARCH_ARM_VIOMMU_H__
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <public/xen.h>
+
+struct viommu_ops {
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * vIOMMU support.
+     */
+    int (*domain_init)(struct domain *d);
+
+    /*
+     * Called during domain destruction to free resources used by vIOMMU.
+     */
+    int (*relinquish_resources)(struct domain *d);
+};
+
+struct viommu_desc {
+    /* vIOMMU domains init/free operations described above. */
+    const struct viommu_ops *ops;
+
+    /*
+     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
+     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
+     */
+    uint8_t viommu_type;
+};
+
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+
+int domain_viommu_init(struct domain *d, uint8_t viommu_type);
+int viommu_relinquish_resources(struct domain *d);
+uint8_t viommu_get_type(void);
+
+#else
+
+static inline uint8_t viommu_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+}
+
+static inline int domain_viommu_init(struct domain *d, uint8_t viommu_type=
)
+{
+    if ( likely(viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
+        return 0;
+
+    return -ENODEV;
+}
+
+static inline int viommu_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_VIRTUAL_IOMMU */
+
+#endif /* __ARCH_ARM_VIOMMU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kcon=
fig
index b413c33a4c..a92cfbea98 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -35,6 +35,11 @@ config IPMMU_VMSA
 	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage=
 2
 	  translation table format and is able to use CPU's P2M table as is.
=20
+config ARM_VIRTUAL_IOMMU
+	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
+	help
+	  Support virtual IOMMU infrastructure to implement vIOMMU.
+
 endif
=20
 config AMD_IOMMU
diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough=
/arm/Makefile
index c5fb3b58a5..c3783188e3 100644
--- a/xen/drivers/passthrough/arm/Makefile
+++ b/xen/drivers/passthrough/arm/Makefile
@@ -2,3 +2,4 @@ obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
 obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
 obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
 obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
+obj-$(CONFIG_ARM_VIRTUAL_IOMMU) +=3D viommu.o
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
new file mode 100644
index 0000000000..0c0efd668e
--- /dev/null
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/viommu.h>
+
+/* Struct to hold the vIOMMU ops and vIOMMU type */
+static const struct viommu_desc __ro_after_init *cur_viommu;
+
+int domain_viommu_init(struct domain *d, uint8_t viommu_type)
+{
+    if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+        return 0;
+
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    if ( cur_viommu->viommu_type !=3D viommu_type )
+        return -EINVAL;
+
+    return cur_viommu->ops->domain_init(d);
+}
+
+int viommu_relinquish_resources(struct domain *d)
+{
+    if ( !cur_viommu )
+        return 0;
+
+    return cur_viommu->ops->relinquish_resources(d);
+}
+
+uint8_t viommu_get_type(void)
+{
+    if ( !cur_viommu )
+        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+
+    return cur_viommu->viommu_type;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 5d15f572c7..a7d456be08 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -334,6 +334,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
 #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
=20
+#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
+
 struct xen_arch_domainconfig {
     /* IN */
     uint8_t gic_version;
@@ -347,7 +349,9 @@ struct xen_arch_domainconfig {
     uint8_t arm_sci_type;
     /* IN */
     uint8_t v8r_el1_msa;
-    uint16_t pad;
+    /* IN */
+    uint8_t viommu_type;
+    uint8_t pad;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.43.0

