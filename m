Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8A606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=lwe0kIOg
Received: from list by lists.xenproject.org with outflank-mailman.1470412.1679239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILd-0006BE-S4; Tue, 03 Nov 2026 17:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470412.1679239; Tue, 03 Nov 2026 17:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILd-00067S-9f; Tue, 03 Nov 2026 17:31:01 +0000
Received: by outflank-mailman (input) for mailman id 1470412;
 Tue, 03 Nov 2026 17:30:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILa-0005Ru-6R
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILZ-004KAj-IW
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:57 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a4a-2eae-0a2a0a5409dd-0a2a45059e90-24
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:57 +0100
Received: from [52.101.84.105]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a51-4cb1-0a2a45050019-346554693e91-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:57 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PA1PR03MB11410.eurprd03.prod.outlook.com (2603:10a6:102:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:55 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:55 +0000
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
 b=xRrY4Wg2UKnU01vc9uC0tfIqwTJoIn7Sxu9JWxnH4PE6vQccdwJtTC/zFCxuFrzNY4WjBbwAoh8YD5fH3St/RdsqlVOOZGCS0YsKkN/2UFhTSdRnuLsDBoLYE2w7/qqU5i0RaHZRKOXLnoc+y+5llCH1EbwyQV9P6CaLXiM4IKfRObniC+rIlcRXX8MBxgH0nXD60pJHXPdOuFd8itDxlmmAuaKNGJhbxF6YuhM0sjKZ4gWXZrIbKr0BrFpWat2RDZInnCKpZWmO4A87MCcoUhILMZKQLP100Ar9HCRNSVIAbmumjTglqkUgpR1njFXLYFnlGmxFXmPEdErDcpnPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSSW6Rh05HRwOVKFxSjU37HdLhmlspzyOfCyNjR9daw=;
 b=UGpYeJTmw7MGZmo7rn9r+psqp9/mjftE+KaxIOYJFqeKFdAA+D55aowTkg4tzRvupB5EE2YU6/eVmnI53/iw8mec7XgZbERRQ0BSyFaAW079sDeWH+4YjMvyJYHDTZud7A+vx5nK0YCn6cES4hcp1d+XUFPLlrjNoj73yKJg2eZSwkI6YuW4dwprkxlYCVMhRUPKwbZBF6QH2E4j99eW4FIFECprwCg7xEDlqELNetRaa0ANv5w6r5DsdIX3n2WPg2RgCVKVwalv7LjumPRhtbKPiEvwEEX6cdbayCjEVBra+OmV13gpfgl6pxsDw1kzXNp8Z+JtTLuIcit/KBKgSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSSW6Rh05HRwOVKFxSjU37HdLhmlspzyOfCyNjR9daw=;
 b=lwe0kIOgI3XOyUyhVe5LbuKah6m5rvisUh26SS8Cc3jDF9dgteTSWzpSy71xu+g1hW2aXLQQXoIQ2pR65a6fGrbabQiOY99ICsiVxx+FqJiO2xEdwOy1foMqREkETdzDV4hCQIpggiejl5Djdnx/agWSlmDdJmmzqN49LHttxzd9otX0AbqUnAeUXi8LPEHrtBlZSvHFufnVWHFaxeOFGDCpTWcv+DG9tu+TPXjzSsqv/S03wy82mdWdCtmDF9TthJpxhDLoj8zeyHJtNcaARyAhQqHajsDEhXbqflN4Zq0US4APp8zW2bjJx8AUasm184mTxjYgIWPkVfpAl9FVjA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v5 21/22] libxl/arm: Introduce domctl command for IOMMU vSID
 mapping
Thread-Topic: [PATCH v5 21/22] libxl/arm: Introduce domctl command for IOMMU
 vSID mapping
Thread-Index: AQHda7kUl64qHI1HEUqmUhPAf5r8zA==
Date: Tue, 3 Nov 2026 17:30:55 +0000
Message-ID:
 <ee5fcdb5f74ab0c367e3006310b556bc4f5250da.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: ba07bec5-0d56-4bec-565a-08df39d03761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|261022075727099003|56012099006|11063799006|261009223027099003|261022105027099003|261102123227099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 O7OH/v2j99Fy25fmEUrc94pITuoLEYyQZX8MjBYlDx4cKMg1jKjbdLv9P1U6PC17i8Cr6VpFh0L7glLyMA2TgvPHtD/Lbe/v1mdUiz5r+6WdnO10W2KYdS+xCuVrElF+G44nEGJ6iL3njwABvw17IyLPvnhj3y50yXKSlTeXn7lCbc22KtBCR848W4L6Zv/0E+DLlQ6DfuvItcgcbdNqcds8LakcCV1ZDb7RA394+wQHV2AFaoBxvDzyaXrAFPgQxzNbMn4R2lv936HWFVeF5PVUlYss/9yhXnwCuOdtTR1mK2TT8PH+SPtCu1HEIv9MYW1CM8S560roEAOBGoyjnP1+ZNO7c05xhvWdLkS8nRoFlUDNIBgL2lyU8NVQlu1jPlSvs07O6+Isl3FKGyX5PddooUEZjI+mW4LM06zy9A8xGz+Cxw9wCIG9zFBZ2QPteih25kTZDj3IObOGfCbMoEdVQuDbLpn+kpmoGE4TiN5XAZtuuLkwHFPLjw85cuVInt1E/k0ZcAyw5UO/Mx7lmXPX8petVQKFlukfpaGgz+9WM9UiFvw23QpreZYPAKYmG0G1UCkMCNekZ6Yyq4J2r179CfLRbwGdyLiIb5gfKYP3I4eLwj5WSvUf1BALU8w2Kcz/WR1tbIpnqTX6yV16+O8UWyjw1RauGJ/9qQF4sBhXBOYFQyoMRb3CEdW1wTREqhQkOplm9OpeSxISBTpeD/6RIbDXZy3Og42whdaU15k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UuZrV0oXi+nmDckBTyfzvMc+XS9IQJF4+2Ze2WsO2lNzP6SeceYmf1bWKU?=
 =?iso-8859-1?Q?05sNN4hxmDwT36C1+0hn+VOWi8MLBsoQi2c/WFmxNvCa8EVcakXgn8zcN4?=
 =?iso-8859-1?Q?RJQx6WPCo/32qli7Ensb4UDja8NK80KsoOUbMsR0ZD7gOG/EDD/ABarA0O?=
 =?iso-8859-1?Q?tcCJz0vCAuzvv/SCoszbH3l4NlXwRe3D/TvCFJsPeubIDW5ADVteb1Vb3I?=
 =?iso-8859-1?Q?dBkbRmBLyPnHQ3MTIKqdU2O1zL0S4eLlkw1tABCptnnxjJ2fOWdnF7XRXg?=
 =?iso-8859-1?Q?PJgITo+MdypI72Uo7HPSU9PKjLMXqMkzU4skHP7NI/2CWLG57WoLEZHDC5?=
 =?iso-8859-1?Q?e3f7iDq495DWElz0PgmvdQOGbBSIHrwyVr5Y9JTXdXL8lB4K4+FSVGbEvR?=
 =?iso-8859-1?Q?iivbD3FUnFcpDela1WyW8YmMOXYg9Vm2Y5J/XEOraaBfL55WbxPHH1tcA9?=
 =?iso-8859-1?Q?RInWD9CgEDfoUbDLbkU0FfpY+HxJJ7epW+Lgi9+IUylPfdXYuw9VCG2DEI?=
 =?iso-8859-1?Q?t7HhiLamtOp0eiQkF8bE+pAdt+JqQBrd2XUyIk3fHvEwli4Edh7dHBAFY/?=
 =?iso-8859-1?Q?rGlVd6ll+D291lxcn4paSOEixFO2NIWY1G0UIwYtgLlvFMMT6bmAMVMw3i?=
 =?iso-8859-1?Q?i8DcDFEzw5QVn37CPPz2LohAnRQTz/m5bpDWZiDMPjQ46s4rWZuZqUfPUx?=
 =?iso-8859-1?Q?+yS1+EvSjBScHc4IxuWQIOJIpOTiI8ciegQPvrorbexscBSGPwsTMX7Ksw?=
 =?iso-8859-1?Q?w/Q1W2i1m8EyNXxgPj0dKbVT1UGmsbyz+e/divuq1VvxABQViLj9uwCF/o?=
 =?iso-8859-1?Q?CYr8Au8n6LAlqb88NecGCXGhLZ3SCctuyyEN7BvWpE6E9fH9kOjQdQwT2S?=
 =?iso-8859-1?Q?GNIQcYb/zVjvuEbFv9kE6V3CG6+MnqSkYwKqtcljLmzLZo3ARPKVpfdzwi?=
 =?iso-8859-1?Q?arUiOrBXzfs5tLl6mQirkxPV4/gPRfZgJx7Grc5pnyBzsVu+Lr84B0Y8fg?=
 =?iso-8859-1?Q?atm3GHpk7g0ryqtM7nuvaaI9E7zxyZ6xWY4jlH9snGq/1ZVFOD/OrUETpR?=
 =?iso-8859-1?Q?5qNKJ/ifWd885T4Og3daMFRZ4Fbyj15vThfb7Z4MI9LwmadsAlVqPBp3YE?=
 =?iso-8859-1?Q?RdIrXsNTQkJ90lIbBdxAg3mjAEGf/ruj9xezeXICQTD6sAT38wy/kH2z60?=
 =?iso-8859-1?Q?E+svfIdu/412YM9sU/qz9ZAHisUmnA0wkeGBAho16is5MioOx2HANSvlTX?=
 =?iso-8859-1?Q?phHCtNXUkhmTSUxo+J93YCcr8IgL2LCQS03/RzMkWAxRYIxlib5p5UcI9S?=
 =?iso-8859-1?Q?i9U+BB70pGMJKn7ut/OS0upZS0LAr8iphYEJeWvp9q9gAuWYaSCLthuwu5?=
 =?iso-8859-1?Q?eOpUMsUhEVGFITuX/+cAgDaxyGr5OSfuhQUq22q57uVDlMTnzsC08mBX6H?=
 =?iso-8859-1?Q?3M1jFKGrJR+PmLX6A4OOAsfnBzL29Rr/4OxjcZJUhOlzQYCFkpV7q0qPUu?=
 =?iso-8859-1?Q?IYdncfnT2xysyESm8z7Qlm3uFDCqQwxNufDt+8jYFX7iFD9Ho36fqPR83f?=
 =?iso-8859-1?Q?C0A7QKsHUe2eFJi6oVAQJyIUog4xZw7xc7G/GUDlv86nl6Hzv76UtuzlBV?=
 =?iso-8859-1?Q?HLuhdySev+Wbb0gHoq+OqJwbFsD6w6VSo+CruKwZ+cqSmyi05XIEMcIit/?=
 =?iso-8859-1?Q?8ZSn9b6CwBAO7PvoKofNyt9GSRBnkSwvs/vQNsf30hCuml3ExUH9ZmXSdS?=
 =?iso-8859-1?Q?3bGYuLnGXLmSpNk0B2DP0tN+QI7YwaKFp8Iu2y5AFvlkqyP9+7aM5txVzs?=
 =?iso-8859-1?Q?uJzMQU3bnQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba07bec5-0d56-4bec-565a-08df39d03761
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:55.4792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FGUJg8DUfWEU5vnoJ3g8cgMneryWlPowqyoJR8396N24SUODW6qbaHvC/9Um/90elGsK1kI37dYjOv+FungWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11410
X-purgate-ID: tlsNG-c201ff/1793727057-F68B62A1-C0433D42/0/0
X-purgate-type: clean
X-purgate-size: 13881
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For guests created via the control domain (xl, Zephyr xenlib), a partial
device tree is parsed and loaded on the control domain side.

SIDs in the guest device tree have to be replaced with virtual SIDs that
are mapped to the corresponding physical SIDs. To do this, the control
domain requests Xen to allocate a new vSID and map it to the original
pSID for each IOMMU stream ID associated with a guest device.

Introduce a new domctl command (XEN_DOMCTL_viommu_allocate_vid) that
allows the control domain to request a new vSID mapping and replace the
original pSID with the allocated vSID in the guest device tree.

Implement vSID allocation in libxl using this interface for devices
configured behind an IOMMU.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/include/xenctrl.h             |  13 ++++
 tools/libs/ctrl/xc_domain.c         |  25 +++++++
 tools/libs/light/libxl_arm.c        | 112 +++++++++++++++++++++++++---
 xen/arch/arm/domctl.c               |  38 ++++++++++
 xen/include/public/domctl.h         |  22 ++++++
 xen/xsm/flask/hooks.c               |   4 +
 xen/xsm/flask/policy/access_vectors |   2 +
 7 files changed, 207 insertions(+), 9 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 6f4ea7ca62..7075e54a27 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2670,6 +2670,19 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint=
32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
=20
+/*
+ * Allocate guest IOMMU vSID and establish its mapping to pSID.
+ * It can only be used on domain DT creation.
+ * Currently used for ARM only, possibly for RISC-V in the
+ * future. Function has no effect for x86.
+ */
+int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
+                                         uint32_t domid,
+                                         uint16_t nr_sids,
+                                         uint32_t first_psid,
+                                         uint32_t phandle,
+                                         uint32_t *first_vsid);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 94cfab0fa1..0bd3e45fbd 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2222,6 +2222,31 @@ out:
=20
     return ret;
 }
+
+int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
+                                         uint32_t domid,
+                                         uint16_t nr_sids,
+                                         uint32_t first_psid,
+                                         uint32_t phandle,
+                                         uint32_t *first_vsid)
+{
+    int err;
+    struct xen_domctl domctl =3D {};
+
+    domctl.cmd =3D XEN_DOMCTL_viommu_alloc_vsid_range;
+    domctl.domain =3D domid;
+    domctl.u.viommu_alloc_vsid_range.first_psid =3D first_psid;
+    domctl.u.viommu_alloc_vsid_range.phandle =3D phandle;
+    domctl.u.viommu_alloc_vsid_range.nr_sids =3D nr_sids;
+
+    if ( (err =3D do_domctl(xch, &domctl)) !=3D 0 )
+        return err;
+
+    *first_vsid =3D domctl.u.viommu_alloc_vsid_range.first_vsid;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 0dc3789d08..c1e41ed7fe 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1342,11 +1342,101 @@ static int copy_partial_fdt(libxl__gc *gc, void *f=
dt, void *pfdt)
     return 0;
 }
=20
-static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+/*
+ * Store virtualized 'iommus' properties for every node attached to IOMMU
+ * and passthroughed to guest.
+ * Used as a lookup table for mapping <phandle pSID> -> <vhandle vSID>
+ */
+struct viommu_stream {
+    XEN_LIST_ENTRY(struct viommu_stream) entry;
+    char path[128];          /* DT path, stable across resizes */
+    uint32_t domid;
+    fdt32_t *iommus;         /* fully virtualized iommus property */
+};
+
+static XEN_LIST_HEAD(, struct viommu_stream) viommu_stream_list;
+
+/*
+ * Helper function which creates mapping of dt node to
+ * to virtualized 'iommus' property
+ * Mappings stored in a global 'viommu_stream_list' to
+ * make it reusable for every fdt resize
+ */
+static int viommu_get_stream(libxl__gc *gc,
+                             uint32_t domid,
+                             const fdt32_t *prop,
+                             int proplen,
+                             const char* path, fdt32_t **iommus)
 {
-    int nodeoff, proplen, i, r;
+    int i, r;
+    uint32_t vsid, psid, phandle;
+    struct viommu_stream *viommu_stream;
+
+    /* Lookup if stream for target device is already allocated */
+    XEN_LIST_FOREACH(viommu_stream, &viommu_stream_list, entry)
+    {
+        if (!strcmp(viommu_stream->path, path) &&
+            viommu_stream->domid =3D=3D domid) {
+            *iommus =3D viommu_stream->iommus;
+            return 0;
+        }
+    }
+
+    /* Allocate new viommu stream */
+    viommu_stream =3D malloc(sizeof(struct viommu_stream));
+    if (!viommu_stream)
+        return ERROR_NOMEM;
+    memset(viommu_stream, 0, sizeof(struct viommu_stream));
+    viommu_stream->iommus =3D malloc(proplen);
+    if (!viommu_stream->iommus) {
+        free(viommu_stream);
+        return ERROR_NOMEM;
+    }
+    memset(viommu_stream->iommus, 0, proplen);
+
+    LOG(DEBUG, "Creating vIOMMU stream for device %s",
+        path);
+
+    /*
+     * Virtualize device "iommus" property
+     * (replace pIOMMU with vIOMMU phandle and pSIDs with mapped vSIDs)
+     */
+    for (i =3D 0; i < proplen / 8; ++i) {
+        /* Allocate new vSID mapped to pSID and physical IOMMU */
+        phandle =3D fdt32_to_cpu(prop[i * 2]);
+        psid =3D fdt32_to_cpu(prop[i * 2 + 1]);
+        r =3D xc_domain_viommu_allocate_vsid_range(CTX->xch, domid, 1, psi=
d,
+                                                 phandle, &vsid);
+        if (r) {
+            LOG(ERROR, "Can't allocate new vSID/vRID for guest IOMMU devic=
e");
+            free(viommu_stream->iommus);
+            free(viommu_stream);
+            return r;
+        }
+        viommu_stream->iommus[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV=
3);
+        viommu_stream->iommus[i * 2 + 1] =3D cpu_to_fdt32(vsid);
+        LOG(DEBUG, "Mapped vSID: %u to pSID: %u", vsid, psid);
+    }
+
+    strcpy(viommu_stream->path, path);
+    viommu_stream->domid =3D domid;
+    *iommus =3D viommu_stream->iommus;
+
+    XEN_LIST_INSERT_HEAD(&viommu_stream_list, viommu_stream, entry);
+
+    return 0;
+}
+
+/*
+ * Used to update partial fdt when vIOMMU is enabled
+ * Maps dt properties of IOMMU devices to virtual IOMMU
+ */
+static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t d=
omid)
+{
+    int nodeoff, proplen, r;
     const fdt32_t *prop;
     fdt32_t *prop_c;
+    char path[128];
=20
     nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
     if (nodeoff < 0)
@@ -1360,11 +1450,16 @@ static int modify_partial_fdt(libxl__gc *gc, void *=
pfdt)
         if (!prop)
             continue;
=20
-        prop_c =3D libxl__zalloc(gc, proplen);
+        r =3D fdt_get_path(pfdt, nodeoff, path, sizeof(path));
+        if ( r < 0 ) {
+            LOG(ERROR, "Can't get passthrough node path");
+            return r;
+        }
=20
-        for (i =3D 0; i < proplen / 8; ++i) {
-            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
-            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        r =3D viommu_get_stream(gc, domid, prop, proplen, path, &prop_c);
+        if (r) {
+            LOG(ERROR, "Can't get viommu stream");
+            return r;
         }
=20
         r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
@@ -1376,7 +1471,6 @@ static int modify_partial_fdt(libxl__gc *gc, void *pf=
dt)
=20
     return 0;
 }
-
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1395,7 +1489,7 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt,=
 void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
-static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t d=
omid)
 {
     LOG(ERROR, "partial device tree not supported");
=20
@@ -1527,7 +1621,7 @@ next_resize:
         if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
             if (pfdt)
-                FDT( modify_partial_fdt(gc, pfdt) );
+                FDT( viommu_modify_partial_fdt(gc, pfdt, dom->guest_domid)=
 );
         }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index b76af56fad..40f1582891 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -16,6 +16,7 @@
 #include <xen/types.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
+#include <asm/viommu.h>
=20
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info)
@@ -186,6 +187,43 @@ long arch_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
     }
     case XEN_DOMCTL_dt_overlay:
         return dt_overlay_domctl(d, &domctl->u.dt_overlay);
+
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+    case XEN_DOMCTL_viommu_alloc_vsid_range:
+    {
+        int rc =3D 0;
+        uint16_t i;
+        uint32_t vsid;
+        struct xen_domctl_viommu_alloc_vsid_range *vsid_range =3D
+            &domctl->u.viommu_alloc_vsid_range;
+
+        if ( vsid_range->pad || vsid_range->nr_sids =3D=3D 0 )
+            return -EINVAL;
+
+        for ( i =3D 0; i < vsid_range->nr_sids; i++ )
+        {
+            rc =3D viommu_allocate_vsid(d, vsid_range->first_psid
+                                          + i,
+                                          vsid_range->phandle,
+                                          &vsid);
+            if( rc )
+                return rc;
+        }
+
+        if ( !rc )
+        {
+            /* Calculate first vSID from allocated range */
+            vsid_range->first_vsid =3D vsid -
+                vsid_range->nr_sids + 1;
+            rc =3D copy_to_guest(u_domctl, domctl, 1);
+            if ( rc )
+                rc =3D -EFAULT;
+        }
+
+        return rc;
+    }
+#endif
+
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4ca8a2d7ca..739a0cd68a 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1279,6 +1279,26 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
=20
+/*
+ * XEN_DOMCTL_viommu_alloc_vsid_range
+ *
+ * Allocate guest vSID range and
+ * establish pSID->vSID mapping for target range and physical IOMMU (phand=
le).
+ * Allocated range is continous
+ */
+struct xen_domctl_viommu_alloc_vsid_range {
+    /* IN: Range first pSID  */
+    uint32_t first_psid;
+    /* IN: Physical IOMMU phandle behind which the target device streams a=
re configured */
+    uint32_t phandle;
+    /* IN: Number of vSIDs to allocate */
+    uint16_t nr_sids;
+    /* padding, must be 0 */
+    uint16_t pad;
+    /* OUT: Mapped range first vSID */
+    uint32_t first_vsid;
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1371,6 +1391,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_viommu_alloc_vsid_range       91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1439,6 +1460,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_viommu_alloc_vsid_range viommu_alloc_vsid_range;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index d65ba0aeae..6321b4308b 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -881,6 +881,10 @@ static int cf_check flask_domctl(struct domain *d, str=
uct xen_domctl *op)
     case XEN_DOMCTL_set_llc_colors:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLO=
RS);
=20
+    case XEN_DOMCTL_viommu_alloc_vsid_range:
+        return current_has_perm(d, SECCLASS_DOMAIN2,
+            DOMAIN2__VIOMMU_ALLOC_VSID_RANGE);
+
     default:
         return avc_unknown_permission("domctl", op->cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/acc=
ess_vectors
index bbb9c117ec..35acbefab2 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -253,6 +253,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_viommu_alloc_vsid_range
+    viommu_alloc_vsid_range
 }
=20
 # Similar to class domain, but primarily contains domctls related to HVM d=
omains
--=20
2.43.0

