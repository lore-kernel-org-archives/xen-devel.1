Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60571CA5FAE
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 06:22:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436279.1655022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRE4-0002qn-Cq; Tue, 29 Sep 2026 06:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436279.1655022; Tue, 29 Sep 2026 06:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRE4-0002qb-8h; Tue, 29 Sep 2026 06:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1436279;
 Tue, 29 Sep 2026 06:22:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xBRE2-0002hE-EZ
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 06:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBRE1-001sCD-RM
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 08:22:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb58fb-8faa-0a2a0a5109dd-0a2a450ae5ca-30
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:22:01 +0200
Received: from [40.107.130.117]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb5909-f2d2-0a2a450a0019-286b8275afcf-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:22:01 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB8414.eurprd03.prod.outlook.com (2603:10a6:10:3ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 06:21:58 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:21:58 +0000
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
 b=C8UBlTEhGOxhuLL2Uz+8XaSUEWSVKrrovAixQUwmPRYFi/rLAGGwS7xyvXkEwqX8Lk2ec/wzGcUDOZeJOMCaMGS7ePMHBKeEAgWeUPxsysY1SGMEe0O05zVQrKJ53x4h010vnlVdGHE0wbBSXsQApC3YbQLpYqPhrzkYSFGsNrBO7mKSEsLAHyOjyOX0gjGeQ3FI6yNKSZQxBagECea33o+d1MoZLhBUiQOJXCZAMHMDtBj1h+mBlJa5dpEatqEJZQAZJF4xqjDcVOpRKVcFA/tEJXH4IGMG0jCOvHlwZbyXWUnr2sisCeEV20Eu1M0MZej235ctpA9uejPRHQpB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsoAb8FCpgxA3aZlyueleY3qgq+eWhjyCigo1phCNYI=;
 b=EV2/finj43iTC/XR/0srGX+BCyvPBgagJPq2zo+u1z+0rafZxU0M+0aMK5BJHvq4kUes69hs0AyL6EVlkBBioogIt5y82i+YGI4vdVALmfy+5URtxXabSCPtNYN/3DsBFhT7/8ACmYgJ5CHzzhIrnoSTWb+9iAr7URZRCpyAbXlHkok63mBtP8L8r/B29E6bYNFMebn459V7psLsGAmiqVHZR5z8C/JSEn0NPT2S1LzflnohE/b+IzuNqz5q1VQoKy6hS15VLV9HxHLb1YZtyuKOM+j+hJdu80enzqmCOwKIaHjzmj1Wi39StI45RAYs7NVjXiFeUAbxR/lgECpDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsoAb8FCpgxA3aZlyueleY3qgq+eWhjyCigo1phCNYI=;
 b=JG0zwigLmJUY7Qgz/JU7Zeh/u892vDo835PVZ7HnIMkhyYVsJBa1lc9nBMB3a1jte7OeiG7k4wFJtINT0Rl/do3G817SVFngYMF1D98/LbuVHF5IeRxwWtyjLvb3fs/nk7f5tUGAvdA2GBFsfBZwjhkJ06WQmXeNRlMsfMXq1x5XOXaIaLp39feH1OocBLymcXn5pu21UasIihye8jnCVii9ZddufTz7KMRF8xkXk9xW4hMng3R3YFp45F2bLIU55d8RJmcpDIHHlFKh+qMZepEQ7YdRlkgI+zlAStQTuTwXUaGHK28aTaVVY5YOc46q4u82RRGQRjJt1KkTIYOzXg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH v3 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU fault
 handlers
Thread-Topic: [PATCH v3 3/3] misra: deviate MISRA C Rule 5.5 for ARM SMMU
 fault handlers
Thread-Index: AQHdT9rU29h6GSd+j0KhBztsfBZSuA==
Date: Tue, 29 Sep 2026 06:21:58 +0000
Message-ID:
 <c1df252a85c1c1beb4665de61187f86cb45059b9.1790661461.git.dmytro_prokopchuk1@epam.com>
References: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB8414:EE_
x-ms-office365-filtering-correlation-id: 959b2af7-6766-4ea0-067c-08df1df1f751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|42112799006|38070700021|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 iYT4QNOZwbIKqjkV5Y+JuoX1iL1e8EZPRLntaQuddA/Acam6lNX/I8cEBBXYQodMuLY5zlJqbOcHMR7ZHEMiInsMQ3xMDLMiXNK8izkeUIdjc/6O9tRTeXLLD3cgyYBmfVGAIrjazm6qsATNuhPfaj+9+C+2RJVNQ93J4mHm+ZN2aiwXSBPYg8uvay+h2ujDSfRB84WlVnzTLmCS4C03Y+UX6OlHcakBpKrZejAiXton/LM6HE09hQy1JKGQgsRS6zWdgqTpNf4tbsqBEEVfwe2ODuI/t7T8/ykyFgKRIfu0HmtIVyxu8Xcy+oB3SxPnv6kx8f+AIxjKLQffdxT7P2BkhfGIBakjj0HZ/pZYRukzRH1h0TixqALyL6E5bZi/9hnkaoqkYj90qvGUbb+FXThZDimUELHtKRkcpucOLKL1w+iP6gRs3C9kgxT8b4jpkL35buqOu7svwgBW22FuX9b2mywholJU1MA/Dxy49tmrtRAn2IcOEyofwG9JKErelaHNrvRXvWOG6tOw9HvcdjS9jlVxknVWCbJkGJYQRqlvSkbu/5b1evlyMsDBwdZotY9KbGEP6csNnOd9Zu4+1JKhVSWTok5dXF9sJoGVPnle966zzmcufa/7MTCQzVa5kbi5Ujgoh/Z6w6ff7R4Z22LbkmcTqoMCuC4UeXz72sgNIZ0+6GcIhGXK4gGggY8e2xgxq8jR642R58gyTrQOrH7uaAQv2tptiQbpnijMKIQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(42112799006)(38070700021)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zFJ61OMSx6M1Fxrcsho3kwbfgn2eAJnDgco/yBHftG15QrYMBvIksrztHp?=
 =?iso-8859-1?Q?qh+UPygI1RzM0vi+fW5RUDrja219nXlGXgQ3XiUMwhdT+gc3s+Ms69DEHu?=
 =?iso-8859-1?Q?0LIcjxMrDol/7zxgO9UWi4gkIHXkEnlJIHuKAmotcXse0/YNVKowaz3SN0?=
 =?iso-8859-1?Q?KxH1kjyCWuRf0p180eQpGeHQLSHbVEczIGoAejtkgZoXyAjFI3CijnMCuA?=
 =?iso-8859-1?Q?1Ngtnp4k84e3HXSQQpNzsGblNF8s3ea1Ei8jhvYGLkY++gsIY/SjHyFQbT?=
 =?iso-8859-1?Q?wzFRSbY6w88BvFi/g8cXPt8VPSrJPCspw5xrPWYoDj/mVP/ecPTSnmqcQl?=
 =?iso-8859-1?Q?xeqFGmIC0DWvBLzNV9GXUupTrNbbECMW78woLDUPDzmm/mCGyXgBxAm8tI?=
 =?iso-8859-1?Q?hQ6qunUVK9Zlwf9cSHH+tvhhjGd6x6QjcTl8sisLt0DAfpxQ3xJUtB/gYm?=
 =?iso-8859-1?Q?ZawUPPiDtaK+o4IL/hyrSREuazN/vOON1cuuKyQxK7cx8kw7PhidFGV0a9?=
 =?iso-8859-1?Q?MSV3+YXursKkvzJQ46ndGLhxaghILeufd+SNd0ptWF5Yli7AFjBVMRioup?=
 =?iso-8859-1?Q?MmEEtFYibD2BLCZJxjcm5rFCP7tbtPmN6Hlh0Q34S2yyx9BAoCDNbJoErK?=
 =?iso-8859-1?Q?hWVcOFu7bPxM7Zo5JoU1R2kvnq8XiA/ic13cH+ZLo6E7oP7U9+FrZ7SSYT?=
 =?iso-8859-1?Q?uoMa/D0vo98eGwYcSmMdovUP4BcchV+PLzSfGUGgZuB7m7iByy+9uIaH4Y?=
 =?iso-8859-1?Q?mUIfWyUF7srdX7lY2Q0ngJf6B0sUnmRHXfJ8T0M0Y8N562mswDZO4/B9WW?=
 =?iso-8859-1?Q?M6otocBb4bgxpEoNGPxgOjZejeWWAP++RuuqfojHAVVCf/60zKgRdKe75E?=
 =?iso-8859-1?Q?nY9uhCFj+Q6eK56M+u0c2ppzUTQlL+CS8CS7EpDIwt+q5FvY9SSB/fgfvA?=
 =?iso-8859-1?Q?vYBT6Wdehw4TpFPbM900BVdzRKawct2zoo71euEHO2fj53mbfj5yhES6Nk?=
 =?iso-8859-1?Q?L8oK+w/5G6CypBrhBBKzG+vtWVHG8er8hto2R+NRCmC2hYs3KBo5s/gTQr?=
 =?iso-8859-1?Q?O1IMx3aFOKfeDbx3D04GSQG4zQ20+vs/fl4bpL5B14KJgMdWZAz1CPvI7P?=
 =?iso-8859-1?Q?w2OBKK8daK0FTEgPhb0Vp9uTg/eVyvPHMawhLtGQV6xwOr9QBbsycjy2SA?=
 =?iso-8859-1?Q?ODTgQSXs2lYhhrKWR4JZZ23VIte5xK3Z8lA7bkdNfuU/SLStTA/yP1BuX6?=
 =?iso-8859-1?Q?a7gE3FaOTiYL9CUHETtSVnn6b9BD1G0Z1t0OEzG3954TOupzNS+20nd72I?=
 =?iso-8859-1?Q?d/Q98DzzWAucz3JmPwiKgMT20yyy/hat5wisz3rKSrYaKDTej0sPp7WOnE?=
 =?iso-8859-1?Q?JaEneCQYaKQD010mMBG/eY1HV2DwO6OcC/X13Im403zOhzAE9HL4q8MmVX?=
 =?iso-8859-1?Q?nVrjA3EjNQ/nQ0SQazlQ5E9cDWpIXX1FxYtzJjwj9l5pwO3SGuwReTrhyA?=
 =?iso-8859-1?Q?wkEdqzfhHMF0bwLJe6EpQLWNao6hTeaTj89aQ8okd1vp8NScG6Nm2DZ7cg?=
 =?iso-8859-1?Q?HhWA4/UxuvBwcZH469+h6t3sNkVTuqYRbiujvFtxktJMZ05TcP+OHI+lrd?=
 =?iso-8859-1?Q?Ce89nM4FJHVMedEGnGFD5/T+f/57qcoIy1PrMfVKo0BPNoogLQtF6ejs3Y?=
 =?iso-8859-1?Q?nKaE+YC4JkCr2CjcsQGXSiL+hAtqwcknb19/moDP5vRaHhu9VRXXen578z?=
 =?iso-8859-1?Q?ycbSZIvTF4orXFnmHMxliB2qhjEU+w9YWFSEhPLRjyd0VfaL+QmOdkc492?=
 =?iso-8859-1?Q?Xs5bLd6bVTFRcEXzMcrjzKb5FGoaZAM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959b2af7-6766-4ea0-067c-08df1df1f751
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 06:21:58.3166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLpMjcLu9asr7ClK/DEvNnKrHHEPwrx8hYOgGYnszFOBry0XLi3jc/HuT78QTj0+n0y3DbtcCcWQLEMu0arN7qkPr4b2gG5kxxkrv2J5nPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8414
X-purgate-ID: tlsNG-4011c0/1790662921-516C6CFC-13C231A9/0/0
X-purgate-type: clean
X-purgate-size: 3664

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate identifier and macro name
clashes by specifying the macros that should be ignored.
This includes arm_smmu_global_fault() and arm_smmu_context_fault(),
where the original ARM SMMU handler returns irqreturn_t, while the
same-named macro redirects later uses to a Xen wrapper with the
void interrupt-handler signature expected by request_irq().

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 9 +++++++++
 docs/misra/rules.rst                             | 5 +++++
 3 files changed, 18 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index d62f339103..d65966f4e0 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -141,6 +141,10 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(request_irq)&&loc(file(^xen/d=
rivers/passthrough/arm/smmu\\.c$))"
 -doc_end
=20
+-doc_begin=3D"Clashes between ARM SMMU fault handler functions and macro n=
ames in xen/drivers/passthrough/arm/smmu.c are deliberate."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(arm_smmu_global_fault||arm_sm=
mu_context_fault)&&loc(file(^xen/drivers/passthrough/arm/smmu\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 1524895dd2..43a538938e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -192,6 +192,15 @@ Deviations related to MISRA C:2012 Rules:
        SMMU driver that adapts calls by reordering the handler and flags a=
rguments.
      - ECLAIR has been configured to ignore this macro.
=20
+   * - R5.5
+     - Clashes between the ARM SMMU fault handler arm_smmu_global_fault(),
+       arm_smmu_context_fault() functions and macro names in the file
+       xen/drivers/passthrough/arm/smmu.c are deliberate.
+       The original ARM SMMU handler returns irqreturn_t, while the macro
+       redirects later uses to a wrapper with the void interrupt-handler
+       signature expected by request_irq().
+     - ECLAIR has been configured to ignore these macros.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 497e393d4f..6c7f0ed7dc 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -232,6 +232,11 @@ maintainers if you want to suggest a change.
        local compatibility wrapper that adapts ARM SMMU driver's request_i=
rq()
        argument order.
=20
+       Clashes between arm_smmu_global_fault(), arm_smmu_context_fault() f=
unctions
+       and macro names in the file xen/drivers/passthrough/arm/smmu.c are =
allowed
+       because the macros redirect ARM SMMU driver uses to a interrupt wra=
pper
+       with the handler signature expected by request_irq().
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

