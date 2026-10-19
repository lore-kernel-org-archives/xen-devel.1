Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F8CCCF2DB
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 10:41:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454071.1667553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIkoA-0003bP-El; Mon, 19 Oct 2026 10:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454071.1667553; Mon, 19 Oct 2026 10:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIkoA-0003bI-Br; Mon, 19 Oct 2026 10:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1454071;
 Mon, 19 Oct 2026 10:41:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xIko8-0003bA-Vg
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 10:41:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIko7-0011Wn-Ri
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 12:41:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad5f3d2-2eae-0a2a0a5409dd-0a2a4507e26e-18
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 12:41:31 +0200
Received: from [52.101.83.116]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad5f3db-b4ea-0a2a45070019-34655374eaef-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 12:41:31 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by DU2PR03MB10161.eurprd03.prod.outlook.com
 (2603:10a6:10:49a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 10:41:23 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 10:41:23 +0000
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
 b=Ckh9JZp3HuYDz9qkxEaEbr0Jscyh76QwLJECNZ14o4OyRrqsum9mH1aPRi53iwOWR/aw9uki+yajprPvhzgaSYziX1Pk4/v6UUhXz0fQQZeK4Vq3dHyxteYn864VIp5Mn8ptabMcQuD19J0Mf14SEqQwIuorW8HIRdz8nSBt4+BmM8kdedMYoniZuf+AtG4zvvHg1TIotJBoEDvHvc6+n7ivxk+IiYjVGae2/s/fsGl9Zb32/yT1r4hzwvHEU96V5DOMOc2GxtcTOgIZLO20SB1kdAG3HOUQEOfV5zaHUQIWdwTxPirT51G3FL5fwejUtQSVCbPt/rt9CB6cU+EX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgZc7DRmoJl8SDlcWc+E0yzmzdlMB6ChBn2PXiXvisQ=;
 b=ymcAOTy/fJOoUhmYZYsnFnLPaqv9zrtqlWcwQ5hoG0TxQ/ayNEFkPTLqde5agTIQyUj6NgzEAFM/vRQVD9d0DwsnTOgjbA3zYOpK4f6WNQ0EuOuc2Dy6tPcRmLFPxVtr2x4ZZ1jjLVmEDsNqVtPM0+WaPpSHlU8Y2x91LGA9KQh94ZOxLve9NoXFDzy6iWYoNTyU/9qRTl826UxqVJpRhvtxTOLmSfTUMsE5KEi/SWfeHjMVK/vZtsP4KzY3JUCVM+jKuWQru4zu8IkQE0eLsDEPOHO8xvzVDv9+uDdQ9ty55T7S+smR1eLu+/eLZRNloL1UgjvPvJXexLZIWMD8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgZc7DRmoJl8SDlcWc+E0yzmzdlMB6ChBn2PXiXvisQ=;
 b=eHovzT/anvZHh7F23XYkABAt2xKfvPJ4fmGppL65ouhGmHFeBJVfEoUb7S+ZjOfg2r2p9EcldShrxguXzfg7l0qjmCZleAZpJTwUtzvyuzzqL4NwIxd4G9VI67Vmr7JZpLTjYPsltMqsljd/hHPEwO69MVxn3M0dtkNeO2IiXhW70OYTVqHNWG3pQzbkLruXNRhcljWmQ2kqMGVvtTwjkP4ye9d7JCGaKldurS46AkzXbEpd6n3+Jsr2yHKIMxLG1896XHzEqaQmfsoK6cAWUSslD6e6MyjZvRcK34y0xAVWzfjqernRg0wyYKK4YAEPD6yVK9rePtb250BNfG+H5g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH v2] misra: deviate C library-style functions from Misra C:2012
 rule 11.8
Thread-Topic: [PATCH v2] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
Thread-Index: AQHdX7Zi+4hiEmHl+0GmwOZnmakMGA==
Date: Mon, 19 Oct 2026 10:41:23 +0000
Message-ID:
 <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|DU2PR03MB10161:EE_
x-ms-office365-filtering-correlation-id: e0f6e066-b9e9-4b74-d22c-08df2dcd84e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|42112799006|1800799024|376014|7416014|6133799003|18002099003|10067099003|3023799007|38070700021|260925021911599003|260925021311599003|260925022911599003|261009223027099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 ujBhuybGdrMwAHuA+4tp/Iu/LF7oj7XwdlmdfLCfNBgTxZh36kd7Blwv/HuXszaV9Zd0WYDmOeUniD9bGys6h6cEIyZM2/exOcADOZXcp4ml64LvZVaMl8Ub9jU7GmFAMc8GXjAda5VTNiKLcrLbw/1p69ZJ8bvKN737t9NFeVwy7nTgsUSGvfLAAqJyi51VsS2yquQdkvhpdrMwHEPnraKmJJSibCEpw/voKeFlCXt0JoTXTyzZ1rN/nNzTZ272UR4MBhtZW31FggPNbfnqKez0RctclFWP2bkdtu+7dUaAX1IuD+eq5sMdCwC8D/VYKZfOTDwVjZ5Hyi20FfeXyae7xzbCuqKqjM/8GU1pvG6anMDg9lKVVCmZQqi3T8VN4ddcNAqNwTGvy54OPZ7l+MV4nIi9F7v/7mLZCvqZ8b3Ko6/oRlQeJGpe6IPSWRjGcGdG8ct7/OvsRaTy/yWdZJ9KvBW7wpe5IaSSNWlXaZb92sQ0Tvg7bDQD+8RhcTzAz6V5q81P1MN7nCPrnqJIkFl6uRkxsdclaX/79woHN3gA2homUlJqUbUHiXp6HjTMIgQyRXxJQ2+z8HBRcBkDmojwv3rwMROg7VrcMPDeqE5wyeJ/cAr/4qLyrN04bwfhovzRbJSn6wNAnlhq3PfVIZ/PJXkYLw6floOS3pZzgVY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(42112799006)(1800799024)(376014)(7416014)(6133799003)(18002099003)(10067099003)(3023799007)(38070700021)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?go6fMDjxn4xizDGxLkEn62c49ka9096C99uBZ/H1NwdqxkiFjm+P+4R6xv?=
 =?iso-8859-1?Q?zeye0l7Vk+y4vKpkFc9HMzLLk//wppiIROs/88xtC6BovXsJ5DTl15mmuF?=
 =?iso-8859-1?Q?0DP4h9DIDB9rZMTIdDaw67hBrjp7aXqqAzsg6rDsGcdnKTCAvUaBpjdFyv?=
 =?iso-8859-1?Q?r8LQ0D5/QZI5GG1vktRHu/GX4zEOWSSsKZYJjQN3qtSFA03coeSLHapXTv?=
 =?iso-8859-1?Q?dIdYm/DqY9Z9t0/3mFSqWKLeArWlCM8UI6AQN+Xyyq/LP7zxq54rOE2ETy?=
 =?iso-8859-1?Q?ylOKTWfwcOeVlME2cSxSD3ZJcoNEOEeP26xSaBKnARXCXHATwrvSj75noB?=
 =?iso-8859-1?Q?xK4MCkXwG6JM/DMF98XP5vObl+h0qhCkRQxfmSuEXwp6jEJWIyLZoJu9kz?=
 =?iso-8859-1?Q?RXoapmUy1Xc1zcK/rjgEiDicdFGAMCYLq0jJ7HmTY+mKFDi2/yUhKsLfdM?=
 =?iso-8859-1?Q?shgFQhWXwSTBDGbv+uej3AcPjfBdfOjFYJMxwFyAsF7bJb9+S93hoV+FFZ?=
 =?iso-8859-1?Q?el6deiivknpXOAU8PzN76a8CFYcuJDzp6C3HZl2JAKPLnizr5v/bBdP6K9?=
 =?iso-8859-1?Q?NQUV257GplY0SVe4RjH0d1Q57Z1o4WvoQdITiYB4rukOWToqSsS/eVZ13x?=
 =?iso-8859-1?Q?s+sTolzHNzRJaIaHijrejBygGQHGtUfxQ1BdBRWvEwM/qZk8SjoHi/a7h5?=
 =?iso-8859-1?Q?NDOeBN8NpGB3yMUHCNPz09XxSwWU43+Pp0V2eZjBh3Oir/W4xj6TBUQ47F?=
 =?iso-8859-1?Q?5I8QXJ1Nfq8fwxja99LQQa4wdTNrsM7yhoiLyTYbcJlG1NkiUMOoMUGunU?=
 =?iso-8859-1?Q?01LC3nC2p36A8S8nkUScQjV9FmDcI+TygZSMCc0DwsB66wSNcGo7B2CaR/?=
 =?iso-8859-1?Q?CNO/U4yPf9zIq+17eUzdLpJls8TlERryKuTRcfg/iNvGmxtJSpddb6qPu+?=
 =?iso-8859-1?Q?5kIQWUv/HABJT075iWkTvUQ7iZU/z58/J1PKLkoCBzFhGtC4WLziiaIqhr?=
 =?iso-8859-1?Q?LjHGqoGQy+MZKvd7mpYCih4ASLTxZySBES2M1B2gx4gM+FlOqYcagUjZI5?=
 =?iso-8859-1?Q?0oZNAS8/fKUArq8ygtvtFfHbxcgIKgFoKrNlVbb9DkbvyiQTIciCpWBz1L?=
 =?iso-8859-1?Q?X7TEBISY19P+edwkA1Kgd9U3EqiJZlFsMxOsMG2E4+tKOnzOw6XkS3dokq?=
 =?iso-8859-1?Q?14CF5cSu7CyAY7BVKRd4QWIz26/H0wolpExLWe0xQNo+hQm4qDZ9DslPva?=
 =?iso-8859-1?Q?N4rOXgXUlfzYDAaYFXRUNmpkCF7xbU/q05ry8ul745lsWXJZrWjQ/6EPTX?=
 =?iso-8859-1?Q?yy+za1XeTRhdv3nbfb+VTkFhiret+hDE5mimjBx9PRuwp/OihAOfqrEikH?=
 =?iso-8859-1?Q?TR9DZouExQ2//crlCaGpr+kFgy6Dycg57gXtsmBtPQX/6XRRU5BJKZTVGV?=
 =?iso-8859-1?Q?Fz/kGmZSXJWfCmFjD5zoSnK4/rhZinZ6rGLjv0oVyGgo0CbM009dEbrI2M?=
 =?iso-8859-1?Q?o2UhJc5DShvOD0l98703QSkmJlEoIm5GwJy4DuOVzQTmGvLTmCt0M5p062?=
 =?iso-8859-1?Q?MCt8aj50pd0Fns6gYSe9umrKuYPNXWsA1KADny/2PL93xtVnxV7j68HZt4?=
 =?iso-8859-1?Q?ekMBfcp4JZ2qX5ghtxOBHkAKT9Ad+jhuU3Y07jiPN8rVSpIvDVh7kuCmXw?=
 =?iso-8859-1?Q?d9WMlkT0WpRNCib3MAJ/mgYlSTbgUMpVkmaBNn6Te0x0ybpQlpdvayx2+R?=
 =?iso-8859-1?Q?c0jRygpRaG+dd/wu7RULYWiL8QohydyFurSuc/Atv1j2MrzIyXDYRBc8fz?=
 =?iso-8859-1?Q?rsW0xnb73/ZysS/M4lTW22rm9jRsIMg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f6e066-b9e9-4b74-d22c-08df2dcd84e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 10:41:23.0468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3J9wF3tCmiDrrlvBg2U3wq1ZZzqtu73kyJDqEkkAenF/wBK1ttb1FknzVuru3oFzxJpTp7RG2l0FiA3t9MRj1O+982shinWCc3rR/aortgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10161
X-purgate-ID: tlsNG-ef75cf/1792406491-35CC7AE4-D22EE28F/0/0
X-purgate-type: clean
X-purgate-size: 4385

bsearch(), memchr(), strchr(), strpbrk(), strrchr() and strstr() all
accept a const pointer/object but return a non-const pointer to the
matched element or byte, matching their standard C library interfaces.
The casts in these implementations strip const so that callers searching
a non-const object get back a mutable pointer. Fixing this would require
changing the public API, so document these uses as deviations instead.

Update docs/misra/rules.rst to note that this class of double-use
library functions is deviated on a per-function basis.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- dropped memchr_inv() from the deviation (not a standard function)
- anchored the file patterns and grouped the xen/lib files, as
  suggested by Nicola
- narrowed the justification to the casts in the function bodies

Link to v1:
https://patchew.org/Xen/4abcb11ef287170ced74935cbee60c90058c1307.1790671787=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 docs/misra/deviations.rst                        | 9 +++++++++
 docs/misra/rules.rst                             | 6 +++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 6cdb10a129..ed8bad0cb0 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -450,6 +450,14 @@ write or not"
 -config=3DMC3A2.R11.8,reports+=3D{safe,"any_area(any_loc(file(hvm_guestcop=
y)&&text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
 -doc_end
=20
+-doc_begin=3D"Functions bsearch(), memchr(), strchr(), strpbrk(), strrchr(=
) and
+strstr() accept a const pointer/object and return a non-const pointer to t=
he
+matched element or byte, matching their standard C library interfaces. The
+casts in these implementations strip const so that a search of a non-const
+object yields a mutable pointer. This use is deemed safe."
+-config=3DMC3A2.R11.8,reports+=3D{safe,"any_area(any_loc(file(^xen/include=
/xen/bsearch\\.h$||^xen/lib/(memchr|strchr|strpbrk|strrchr|strstr)\\.c$)))"=
}
+-doc_end
+
 -doc_begin=3D"This construct is used to check if the type is scalar, and f=
or this purpose the use of 0 as a null pointer constant is deliberate."
 -config=3DMC3A2.R11.9,reports+=3D{deliberate, "any_area(any_loc(any_exp(ma=
cro(^__ACCESS_ONCE$))))"
 }
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6bcc2adf95..68de2d8dd1 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -436,6 +436,15 @@ Deviations related to MISRA C:2012 Rules:
        readability.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.8
+     - Functions bsearch(), memchr(), strchr(), strpbrk(), strrchr() and
+       strstr() accept a const pointer/object and return a non-const point=
er
+       to the matched element or byte, matching their standard C library
+       interfaces. The casts in these implementations strip const so that =
a
+       search of a non-const object yields a mutable pointer. This use is
+       deemed safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.9
      - __ACCESS_ONCE uses an integer, which happens to be zero, as a
        compile time check. The typecheck uses a cast. The usage of zero or=
 other
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a59cf1782e..00378c474e 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -473,7 +473,11 @@ maintainers if you want to suggest a change.
    * - `Rule 11.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_08.c>`_
      - Required
      - A cast shall not remove any const or volatile qualification from th=
e type pointed to by a pointer
-     -
+     - Some standard C library-style functions are inherently double-use,
+       accepting a const argument and returning a non-const pointer into
+       it so that callers searching a non-const object get back a
+       mutable pointer. The casts that implement this are deviated per
+       function.
=20
    * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_09.c>`_
      - Required
--=20
2.43.0

