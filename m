Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCCDCA5FA1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 06:22:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436277.1655009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRE1-0002Zt-RR; Tue, 29 Sep 2026 06:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436277.1655009; Tue, 29 Sep 2026 06:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRE1-0002Zm-Nx; Tue, 29 Sep 2026 06:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1436277;
 Tue, 29 Sep 2026 06:22:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xBRE0-0002ZM-2L
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 06:22:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBRDz-000vp8-FC
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 08:21:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb58f5-2eae-0a2a0a5409dd-0a2a450b9f52-42
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:21:59 +0200
Received: from [52.101.66.125]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb5906-b7e8-0a2a450b0019-3465427dc72b-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:21:59 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by VI1PR03MB6253.eurprd03.prod.outlook.com (2603:10a6:800:138::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 29 Sep
 2026 06:21:56 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:21:55 +0000
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
 b=vUX13hoopzTd4onzv+KNexUunsvBtNy9r+V2VD1dnKiiLxq4af20zivWEavTdAGiFzSBjJ430cZbrxE1woVlr7K44qHv+GfcSRrxW0yVWjTawWR8wPWtMNfedY6IRyE6qqo2VQNxMvDZNycsZnZDbyaFD3z4nPwGRWdLiCib68HHoQUrYpsLK9DuEGgBJRwM7739A2ycwfkc80AhylaEsLfnnuhlFGQ626G8my0F7mhh08vdz2Jz6tC1jPTJFtrdO2SaFQLBVNAcFgsQi6y00aJZe4gVALjoyQaQc3H5DVXrH790MQtIAc4L7+wm0qzdZC/A3ljouJkMF2Ie54kIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EVP2BLAq1P0kBJcETbjis/DX6E2TDig0OTKrH6M1b0=;
 b=G+xIojSC46I4IpBwx2StqyQrVtQIM+aJDpJn550YR4p0NoVEOnrlRQN77Cr3aDVKrn8uyzV01tmNmA3YX2A/sFPlo2rDo+qhJ8XXZkpwRpOtclu1F0fmSZC9fdfVVNiifF+AX0KrU8uFe64KHKRua0ltqnW7zbBqpms+J5w7L5Och5mO4DUOiIDsrh+6mEYvdp1Rr4T1DoELyzfmUSXnGBJ/RfkUxT6DF8HZo11Ty34IJXEgbbIyuUnvNn6hkROTcQV8O6nMCInasqA6XdZEM43TH8HuyGIVwtUaP6tJKZBJFx3WrDt/oghe6aj8P8WzLsnD4J+M7e/zCBxClFPfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EVP2BLAq1P0kBJcETbjis/DX6E2TDig0OTKrH6M1b0=;
 b=AfC5sEXqRMJ9BJ7Dw/qdf/upGYFU52PfgXXH6IKXk1IRsmq6tOT7GA4Z7ey9DKQY3GFLyUztA8eOixgBeiRTRwVoIAgeA422c3h4faGLNwFekTw9U27Emxj4OW+ifZo0sEsWb4UMPkGhpFPDjFBUKyKIp9oNFA17k2pip6eunzEc8Db1iv2LMef/umxEkAUKxfbrlYtuyW/36/GytKgKQM3aAY0yN0i2fCCZTXllVdCIx/5F67KgpekTcJsMudipuLHyl3eOf7ZMymB5zlI+mL7Ej/AbQo2QI68pExvV1Cpzaudp3U4UzAj7spwGMHSlMuPQuvf7Cl9dkm/gGONaBQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH v3 1/3] misra: deviate MISRA C Rule 5.5 for
 hypfs_alloc_dyndata()
Thread-Topic: [PATCH v3 1/3] misra: deviate MISRA C Rule 5.5 for
 hypfs_alloc_dyndata()
Thread-Index: AQHdT9rTfImszTnnlUOCzNpmeO1RUQ==
Date: Tue, 29 Sep 2026 06:21:55 +0000
Message-ID:
 <8867e4624ebd8c75afb93565782513c3b35baf1f.1790661461.git.dmytro_prokopchuk1@epam.com>
References: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|VI1PR03MB6253:EE_
x-ms-office365-filtering-correlation-id: fad88242-feaa-405e-d1b2-08df1df1f5de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|42112799006|376014|7416014|38070700021|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 gmHBOLefwQ0wY6v+35v1T5VPBIAsiIKf8cdnZyE2JHMjzypUnritJZ+nn4YWVB4fWnvMheedIRfBvZoWYjFS7IA7dkr4LSTLTQpAtSQEVlssx4VCNtSc7iLgC5ZtnDxz4ZNVpHePn/Uf154iIH3n8Sqtyw/ngCAmFNRP5L9o22AG6SfcrRoGG0OU4iaMtkDyC8VYa8GFX8Srs2eyYKTpis4bLBBcHln76xZ0DIVa0tz1MhRY15x5hGn4U1mpkSSyxDUiqFJjpOQwS0zuL/ARbDX9Gd1iwI/IXY+SatTj5jABoJdwoGzJ0PVZmvIvROUh+BEjTd6onrqrQe+kmb6QLJIgZ8X7qu9/HeVrstHNXgUdxaa9sQU5yb5I5PjdvX6ZsppdItfdWfnP8CiHi7PWRHqEaxrZo/eesrI1IsS98SQURwdSRde9XUUhpEQMTFZ43j9vuurI6pxxc/Ky+EUwso4gH5inhnzFIbmteJmDr/C1EvNhqx3gwO6riZH6cXm3RK8skh9UgiEtU0p5w9MvtsRzLBan6FBzGQQdMUR85bJXlAXF+Yx0WFqTztvbXijL3YZdY2+cDOWy0HdrZAZxmKIuLMaQYOxFXfn2Gm6fwXNZ0TPJ4s+8vtIA7r1EaKEBCOAD2+z8FvJ6PSnU/03/8lFenuaonBYWY0JfcRfg2HaS7X4EFDyeUuUwNWjzgc+dz560BWZgrQflsEHesS6pTZG47Pu7tg3JobPZi93m0FE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700021)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gYRDgaLHJtu3R53Ra8gnaSfAkBwunAnVZCApRO7tlSeUIplTDQLUs2AuB3?=
 =?iso-8859-1?Q?TtQ0gt5do2ha77BlzEiqXDwztA9WIzi8udhxxI6NP9weOMreQ1q64HN3ai?=
 =?iso-8859-1?Q?adS0MD8S4fGAdIIpdLwcfMY6c8WNgquyq4WAD8rUHc9DaBCaweSLhHZhyD?=
 =?iso-8859-1?Q?PxKN6eJW/mNhtYo5jSvjALBa+W901/QCoyBTcd04EUe5H8FMdvQ5K1Eizp?=
 =?iso-8859-1?Q?lN6KfU/wWPXge6p4eiONl6PQPdqjSeuA/l8FZTDAkKZFQxBcLcvuSWOOk9?=
 =?iso-8859-1?Q?CCCrqtmYGB5cNqVW5zkUVUwhXbhggRb1odgSIjem7HQZ7G5xu3mr5pE0c3?=
 =?iso-8859-1?Q?cz+7f52JDAp0hPeio53ARsfnd8OxAnJnHnzNg4YujSyzSp29qT/CZmW9RA?=
 =?iso-8859-1?Q?7C+DZSabVtmgKuxiz7V69QW5+/NVZcy0kftcld/sal95tu0KN4UDWL6lMr?=
 =?iso-8859-1?Q?tMWrLeaSFK9PN8hYC2LuSWuSVEay49uzIeOvPd0g/9G3VDyrmhbQ53M0pt?=
 =?iso-8859-1?Q?OaxwhRt+7xPOEOSfDZ/aTBqypTviqvX6F+o3Va1e4cJ2QvgR3AbftyL1px?=
 =?iso-8859-1?Q?xFX6ouV/TkdHNH/bArZ/AYNQFSf5sW0rpTDVQV+XUQ71+HGM6rfqaEwyuY?=
 =?iso-8859-1?Q?Z1u6lNqEefDMR1AVKQ1W1SOHbwih0PwKhfRMtZtsIKFBa6JPlAOE/JZWSz?=
 =?iso-8859-1?Q?63sfX/cqRmYnSovCubjId3ifBdrwkW0pnajMXawyy+Ep/Ncr+0w12L3X3k?=
 =?iso-8859-1?Q?5pmGkThonJWnNWj355otbzd+BlRPBJMt0Ive2yNcDr+EqgabjOBwGQL5pB?=
 =?iso-8859-1?Q?vLytwcO6XQNaKv+rotiq+El1emyYFCer2sEmDp8H1wzHjAE9FmGP16BqIz?=
 =?iso-8859-1?Q?0qqYCo4ZQ2qWQOWlo25X04RS9q8buKFBC4mQDcyPIFJI70TctX25kMffD7?=
 =?iso-8859-1?Q?tlnTd7CeqzAZkh1FVm2s530z/rgB2ybCvAW4TVKOGeeXx8+5UuSxESRU0g?=
 =?iso-8859-1?Q?A3tFAgipoYJZaTuKsdSOPUfrsLcdFnkw129lqYBhq7aVAqXxSAUHpxBqZd?=
 =?iso-8859-1?Q?VJPfZis+HiERxvaQ2Nhz5988spxJPjcRv1NDRACS6udaD4nmOB8Gs5bSGT?=
 =?iso-8859-1?Q?GYZ5oyMA9pfj1JKRPYKaF7oYZC7flg+upCpaaNWCXt0aInzAOa6JJ7e8cu?=
 =?iso-8859-1?Q?SWkxGmpkc6wV29kJC2eyuieNbww29vFFV9VQldNkymHarzU6k+B+rQHyfo?=
 =?iso-8859-1?Q?kuJjdVkWA4ktsIRK3VHFMoOgSX9ekroX5Nt8weCoYPKu67OgFsYHj5i8W7?=
 =?iso-8859-1?Q?BIp9LABSsfA3wFB/xJMzC1QCcdwse/t+DKmERJtm3wzNNsiL4Ghj2U2MlQ?=
 =?iso-8859-1?Q?kAL8587jyt4chD7/lWqUfEGYlTNUJFpV/oOI0JBV1N/jYA1HNU6hoetkBu?=
 =?iso-8859-1?Q?AH3X2fb9fR/fZzCO2C4vpA6OkeEGPNYrdpEbrpIbi8XPv8h3+0x+TNaI9+?=
 =?iso-8859-1?Q?0vHFhMICh0IXy1tvhJMXcEJxsXamJC2/5jsSBLOiNf9rSZ6z6U2IIAe/Ez?=
 =?iso-8859-1?Q?Cqh4VlbpUeusu4p3umltFWA9r6Q7N8ANJ74evxaVSLPZHDNhOQnp3SJQ7c?=
 =?iso-8859-1?Q?ypt5IYFWDs8TcMhNGcMvO4+RmgyxO2zWXZigl5WBERjRDQAzoTYUsZjdEX?=
 =?iso-8859-1?Q?F9gPrs4m2tkCDG6sZlcgLSP0iEk8GomXpLcHfAMeX7eS3RFMIeqCGMb9AE?=
 =?iso-8859-1?Q?/ePuV7yqGwOXLeM7xTxkYctGzzusLeCQ49KlHTOSjsoSxyebhNUiUhkG2o?=
 =?iso-8859-1?Q?dzjOox8i4FsYj2fl2tIxB+8wQ5cHvFU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad88242-feaa-405e-d1b2-08df1df1f5de
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 06:21:55.8890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rWOkd6MLkIlebwojqvkyc7SnkFnXn9mUXg5QjZcjFXKZr4ipAgsHDLow3voUfPuYiE862XnMvqP7AqSnUnpHik1uMqwkud81fvOGYnqwszE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6253
X-purgate-ID: tlsNG-42698a/1790662919-1B8D19EA-C01A6A61/0/0
X-purgate-type: clean
X-purgate-size: 3631

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate identifier and macro name
clashes by specifying the macros that should be ignored.
This includes hypfs_alloc_dyndata(), where the real function takes
an allocation size and the same-named macro is a typed convenience
wrapper that expands calls using sizeof(type).

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 9 +++++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 33d508a2fb..400413f8f5 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -133,6 +133,10 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(update_gnttab_par||parse_gntt=
ab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
 -doc_end
=20
+-doc_begin=3D"Clash between hypfs_alloc_dyndata() function and macro name =
in xen/include/xen/hypfs.h is deliberate."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(hypfs_alloc_dyndata)&&loc(fil=
e(^xen/include/xen/hypfs\\.h$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b048309596..6bcc2adf95 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -176,6 +176,15 @@ Deviations related to MISRA C:2012 Rules:
        unused 2nd and 3rd parameters to avoid warnings or errors related t=
o them.
      - ECLAIR has been configured to ignore these macros.
=20
+   * - R5.5
+     - Clash between the hypfs_alloc_dyndata() function and macro name in =
the
+       file xen/include/xen/hypfs.h is deliberate. The function is the all=
ocator
+       taking a size in bytes, while the macro is a typed convenience wrap=
per used
+       by dynamic hypfs nodes to allocate per-request traversal data with =
the
+       correct size and return type. The implementation explicitly undefin=
es the
+       macro before defining the real function, so the name clash is contr=
olled.
+     - ECLAIR has been configured to ignore this macro.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index c9bbab6c08..a59cf1782e 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -223,6 +223,10 @@ maintainers if you want to suggest a change.
        Clashes between grant table functions and macro names are allowed
        because they are used for discarding unused parameters.
=20
+       Clash between hypfs_alloc_dyndata() function and macro name in the
+       file xen/include/xen/hypfs.h is allowed because the macro is a type=
d
+       convenience wrapper around the size-based allocation function.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

