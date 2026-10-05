Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BB4CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 18:56:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441119.1658724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDnrR-0000aF-Cb; Mon, 05 Oct 2026 18:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441119.1658724; Mon, 05 Oct 2026 18:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDnrR-0000a8-9n; Mon, 05 Oct 2026 18:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1441119;
 Mon, 05 Oct 2026 18:56:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xDnrQ-0000a2-5O
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:56:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDnrP-003dqx-IU
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 20:56:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac3f2d1-8faa-0a2a0a5109dd-0a2a4505ddca-6
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 20:56:27 +0200
Received: from [52.101.66.72]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac3f2da-4cb1-0a2a45050019-346542486dd2-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 20:56:27 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by VI2PR03MB10810.eurprd03.prod.outlook.com
 (2603:10a6:800:27a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 18:56:23 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 18:56:23 +0000
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
 b=GqmCEllBiFRyH6NQarpH73fcSgQaBnf6oTS8dvT9365ggspaQHar8QZtzSSK1JGNo6UqILIhuJkXfSC90nsITLtFKzx+22KlG7gOCjMvlHATnqqdMB5206tma81vCkac9wW/ADeenpEjmT9bSu0+sLjS+Cbe7MkPd8wxBQMF9hq+oIEiXJztuQV5vmXGMe/HWl7r2HAcSSt0lHidAmtn1K2AT2nrczEYxnTE9+Ox7fvBUeucamfNEhiAgiw8DPGlEjpSS3uWEtsN2/35dl8R7ZbHSnpAgmeMBHxAFuR+/3kX+UGgDKK8Xyv5eYIJl+J96UambM1S86mOUU9Jlx6ZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjpIctBI4RmCZYIcG2V/Hs4Wow7IW5zTz4571QN429E=;
 b=EN0ZxzhzcxOsqSmvGth5y18KReVPtYvaLIY3yZxnBwZM0q7LkZhlQX08aL/R+7yB6eZIpN8PaHlRhOJnLrzNhEtWLvgLACRv9IRbgLsdWb+Sku6DT6VOMcWx/587ng7IBAkaozIo3hqrDsItIMQCjLgwfS5TXyo7oyItgy0+U8yTBkbEAqQUSAYWNn9hJeTKmzUNpray64vWiAJydBTg5Squxj3nR8G4c6bATRvpQDRb0vuU4TscTU5UNgB4q5ldrZudVCFvUQPdCuniTOnmfEk+Lo9516awPZKTcgXqNfaCAG0/uvTMu77HZF0YgXrQ14TgEpgShl7uxnyLVgUDAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjpIctBI4RmCZYIcG2V/Hs4Wow7IW5zTz4571QN429E=;
 b=eV2VbOdRxoLdPgcyZfeieltTe5Olfh0MmKjAanyQvMWnZ/CcqWtmQsYZ4TxcryjGVh53ImMO7ev6zWYiGpmwoAJSbdWjvXu5s0CDTl1LnEqJ+uV60QZV4daGlQoWoKE0tetx7SXdVqKpZfybt00aAEm/C0l+DkhcDodfTVcIwIuTR0GyKwQk2aIO2G++90Ljf6vq5nznKgCWQh0CwAS4e8t0CJagO3bG8FqVY7xbdHSh2swLtFKDcymAsFNdvgl/SmM1lgWUI3DumndtgLuEPj8NfCT6GVd7SLQR+f15CqZJPsn3V16peKzlwWICON+lCUiseAVhDK2/5U1Q3xE3GA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH] automation/eclair: generalize the noreturn function-pointer
 deviation
Thread-Topic: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Index: AQHdVPs3la7Yb/mPXkSleujSDB++zQ==
Date: Mon, 5 Oct 2026 18:56:23 +0000
Message-ID:
 <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|VI2PR03MB10810:EE_
x-ms-office365-filtering-correlation-id: 9098d65e-c6de-4302-f656-08df231259ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|42112799006|1800799024|366016|18002099003|10067099003|3023799007|38070700021|260925021311599003|260925022911599003|260925021911599003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 EqQEn/k6Hm1kFI+9LCQZLYMhSY3Kqb7Zmw0HdNmbLIizsBjIptEbzjjbTQyFIrxS7ovgO01unClb1533VL/qicsPNTFzCFMUsR1IvDvky2K/atIEToTO1lrtstfMvNhAy2AablyP3jCaZqjGmlBW+WcwmNyLip/IoRHRElx8nsuImLIA9mqxomEKRiaieuNGYw851lF7NY0PthBJlTxUskqTG3/6DMSBiqDeni9lRe0x4X/6npzsF5/052Zx689T7savBwVHyGx7i3azBKkozz0/Yg3NRXvAx6Z05/6mRIJbly41zsTbXoelWMIZVsUJU+lGSQPHMqwjdhzkvEjWWc0/1aPHD0VniCkRSSOqcsiMr1/c3DlRXvXokRoYt/SZdGMQPHzFgTgUws68aIayuByDPpFsg9W/sOdHs1VZlOvRnCAz+MGf2dbMkUtQi3oi/vOS/b1UPLcK6GFOPJGzitqim3pDB6ej3QJ9KbK4vvwxTI7hvZh5HjqaUcPqr11o98b6/nPNXXsjSimLlnbXhpF+6hlQeYPifv8eFsk13Y+IaI2ry5IFDlKtSn4DCIE+NkwvOBO4f+p82VjsATFybFSZXseCpTdFEiWUalIlO1RvNarNMHcB6htulgkRqG1j02eYYsV/pqrIvF7gzylw2aa2zmMFD3vMXLYxvHuaPlQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(42112799006)(1800799024)(366016)(18002099003)(10067099003)(3023799007)(38070700021)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sI1fsRXNqGOrmdV4pMfpUb7hM1bSyvH++IWKxMdGIAUHmx2jTpy5Xfia8h?=
 =?iso-8859-1?Q?7sjJiJQbeqbtyjFUnfVwRPtzBlRFPb82zMtdyQ68t5NaFm6YzhTqyiN+Zy?=
 =?iso-8859-1?Q?1kyC4oQBJdhiswDTzQCo/OICmW/GUVJ9FL6v4IaiBuWQvR8WBpqKVOjaGa?=
 =?iso-8859-1?Q?5eyJOeAknpc9zZNOtqj9oDgEBOzJkJ1JnTBJAwDN5BynCmwMyfeYn7I6OW?=
 =?iso-8859-1?Q?kD32p/7U+tXltaOzEUViXrt7FQC6acV5OGWSFH+Px9MvKKsOAmLLL94jW8?=
 =?iso-8859-1?Q?wjtqvKiHkdG4T+JH+T1kqOiv0n7M4UMODUtF/Kca0vWAhip80OYN1oZkwr?=
 =?iso-8859-1?Q?+6OUTYYhs/wT7R9h3ecVqaaVe7GJIxYiKVGrn9W4Hdm+pn5zTywf6DSvDy?=
 =?iso-8859-1?Q?zEkpPQ+wiriInV8X3bKonmHD6yGp2F56jGpxE9Q+p8TSab94bBf+HUzHP5?=
 =?iso-8859-1?Q?GpokRVp12yhoAdbbXWUINC/khHpkZt71XZvlb0aN62gemxl10D+6Qqlaey?=
 =?iso-8859-1?Q?KLCfyV82Qk1k4jrcYQN6ZF6myqAZQCTwU559NfeIqJpenTbdYeWBFdpOu+?=
 =?iso-8859-1?Q?0l8DppsB2M1nxQVM2GWAX7O7us/67iSYj/QfbZVGfoNRUtAbPnYTgqVCHt?=
 =?iso-8859-1?Q?MdUtMt5fHr0hJVd1idVq5swfVIDfPKnufC/k/8oo1JIyqnm8E1JSfNxIqO?=
 =?iso-8859-1?Q?VOVvgEqTBEmP/k4ojDXAwfgYfs82Fx1M4FBklFas4OuB1lYy30tdyPrhw8?=
 =?iso-8859-1?Q?DVRY70ephh1/Lh4NsvRAUoIlzWuWFAU6dp92qqEI/D96cluQIridI7Tedh?=
 =?iso-8859-1?Q?ihDTwfW/zAbkDn9XKU0SXdSidNSXYJTCNcuscWBgTrMWuF55Hd0Xaj40hH?=
 =?iso-8859-1?Q?LXE5MEhJUtDoR/fENAPANgQ3JasRzs4GynW/EvgxfSyLv0K6v9en6rHeYv?=
 =?iso-8859-1?Q?xAaCoBleJIrAONch55v3R3ct6oL0mHVcI0SReDmMnjAqIj6/0mR8Q7iI8z?=
 =?iso-8859-1?Q?8WLO/DhvaDTYZfNDCQlbfDCkUiPqabsuuUcbPL6l6eRoMoh0PY3QrM1Mum?=
 =?iso-8859-1?Q?gSc+jQF5pzIOuMgTueaWD2zE0m/lst1sgqb9ULIfcq3qaP6Q8VmkKG1/RC?=
 =?iso-8859-1?Q?28hN3meFcsPS6lNwIX2c2G62SZ5f3EZcM3FuDRLY6IDvhjy8QvEet3C7kX?=
 =?iso-8859-1?Q?M+KbD+PvPK1zpYTkhYZpyxQaKw7l5kJrfkHhdABiwBW5Evx3nHImRgy7xD?=
 =?iso-8859-1?Q?GNiaJ4MBsrel4tal/rtiqx5QfmSWq34ASVIxP0A3Q/DPhkGwTGctiOD+cm?=
 =?iso-8859-1?Q?f5TIFeKgMAxH7r/M+XNvq7I5D5fbdyVsZh1E7Cr0l3nrW9APzyOlDto9Ug?=
 =?iso-8859-1?Q?oUJrG+qfAnqqbNb/UZTSWa+Q0s93lOfdcbWobnJ4ftbZ80i8nOeDa0BI5O?=
 =?iso-8859-1?Q?qCje2yGYbwcIzt9gzCz1xApV4dqG83qWH9zIiVn16zBjQQjAJ2PZnb6QgO?=
 =?iso-8859-1?Q?HDdpG1WO/ytiks4ynLosWp2gLO2JHCX7woaoczIdJPILnMoAKZGf1MF038?=
 =?iso-8859-1?Q?tgaST6VlWUEfAzAq7nXoGbnTeUfCpaAnc4JOrnVSjcHR48q9rUJQNGjF+Z?=
 =?iso-8859-1?Q?CHht2vCmoEU26l/lPubl/Y9v2rOQfBg7P++42MibFV4OrG6wXY/St5UoAz?=
 =?iso-8859-1?Q?dzynAIrQcqq2KNL1qJyU7mq9cq6NBQXzqQrwRhaqOImXKhF+DaxiHOMcN2?=
 =?iso-8859-1?Q?Vb3L3Irc/NBusfdfsKtB+LHMyQLyBVSZG808iuCwIJYmkObDebB4E+8S4T?=
 =?iso-8859-1?Q?8fFnCnFZJz/Ykxa9EA7c05bjOLF5ECs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9098d65e-c6de-4302-f656-08df231259ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 18:56:23.0589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Vk99inkUEKw63l4CEYpE6xoKGD85aqhfAhDcP7BPiKzgchcJ6HSgHqGw1QU10h44prpd1egVXYXeIQHOs9sbZxZPBQ74LJhsuNGzgu+ijg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10810
X-purgate-ID: tlsNG-c201ff/1791226587-F46A52A1-54BD38C3/0/0
X-purgate-type: clean
X-purgate-size: 4534

The R11.1 safe cast only matched void noreturn (*)(void *). Accept any
noreturn function pointer converted to a compatible function pointer.
canonical() covers typeof destinations, and compatible_deep_unqualified
keeps the parameter and return types aligned.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---

This patch tries to cover both of these:

1. eclair: widen R11.1 noreturn cast deviation
https://patchew.org/Xen/c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358=
.git.dmytro._5Fprokopchuk1@epam.com/

2. Eclair: relax "noreturn" function-pointer conversion deviation
https://patchew.org/Xen/6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com/4cca5=
8b6-b555-4064-aa26-5204dc4b99cc@suse.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2914802667

The only one Rule11.1 violation remains, which is covered by this Jan's pat=
ch:
x86/kexec: address Misra rule 11.1 violation in machine_kexec_load()

---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++----
 docs/misra/deviations.rst                        | 8 ++++----
 docs/misra/rules.rst                             | 7 ++++---
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 6cdb10a129..d89976a894 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -394,11 +394,12 @@ constant expressions are required.\""
 }
 -doc_end
=20
--doc_begin=3D"The conversion from 'void noreturn (*)(void *)' to 'void (*)=
(void *)' is safe
-because the semantics of the 'noreturn' attribute do not alter the calling=
 convention or behavior of the resulting code."
+-doc_begin=3D"The conversion from a noreturn function pointer to a functio=
n pointer
+with a compatible signature is safe because the semantics of the 'noreturn=
'
+attribute do not alter the calling convention or behavior of the resulting=
 code."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
-  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
-   ref(property(noreturn)))))"}=20
+  "kind(bitcast)&&to(type(canonical(__function_pointer_types)))&&from(expr=
(skip(!syntactic(),
+   ref(property(noreturn)))))&&relation(compatible_deep_unqualified)"}
 -doc_end
=20
 -doc_begin=3D"The conversion from a pointer to an incomplete type to unsig=
ned long does not lose any information, provided that the target type has e=
nough bits to store it."
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6bcc2adf95..ed7129b8dc 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -392,10 +392,10 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `safe` for ECLAIR.
=20
    * - R11.1
-     - The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' is =
safe
-       because the semantics of the 'noreturn' attribute do not alter the =
calling
-       convention or behavior of the resulting code, parameters handling r=
emain
-       consistent.
+     - The conversion from a noreturn function pointer to a function point=
er
+       with a compatible signature is safe because the semantics of the
+       'noreturn' attribute do not alter the calling convention or behavio=
r
+       of the resulting code.
      - Tagged as `safe` for ECLAIR.
=20
    * - R11.2
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a59cf1782e..bd288bba29 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -435,9 +435,10 @@ maintainers if you want to suggest a change.
        and any other type
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
-       and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted. Conversions from [unsigned] long
-       or '(void *)' to a function pointer are permitted.
+       and void* are permitted. Conversions from a noreturn function point=
er
+       to a function pointer with a compatible signature are permitted.
+       Conversions from [unsigned] long or '(void *)' to a function pointe=
r
+       are permitted.
        Example::
=20
            unsigned long func_addr =3D (unsigned long)&some_function;
--=20
2.43.0

