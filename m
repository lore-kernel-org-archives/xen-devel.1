Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46570606A333
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=NPUfHls7
Received: from list by lists.xenproject.org with outflank-mailman.1498170.1696093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUONZ-0007Eo-6s; Fri, 20 Nov 2026 13:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498170.1696093; Fri, 20 Nov 2026 13:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUONZ-0007Eh-3M; Fri, 20 Nov 2026 13:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1498170;
 Fri, 20 Nov 2026 13:10:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xUONX-0007EZ-67
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 13:10:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUONW-00Ba4i-Er
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 14:10:10 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b0046a8-2eae-0a2a0a5409dd-0a2a450ad5e8-44
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 14:10:10 +0100
Received: from [52.101.69.129]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b0046b2-f2d2-0a2a450a0019-346545816489-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 14:10:10 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PA4PR03MB7037.eurprd03.prod.outlook.com
 (2603:10a6:102:ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:10:06 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:10:06 +0000
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
 b=e+3iuVw64u2W/ss26u+qmKM+v1bL/QPqP39CPp8y8HLdOzsc33Ib1cfrpj65l+bXB9Mhhv66IqqV7KboldmQMCEt923U2iUDLg4BWC5LLDz7Z+bpZ6PMNQpODbuCQL+65keA3ju47o/rctftZIIXH6EQhA2BpBj2RPZBW2pVpBMzujPTRQBAwJ9OphNTSnXTomV9sVJt1VxD9rmF07NYLUM7YYM1rDXd5oVDurgMEFdyMWdaL5xjk02fva7g2uL1sWODIL24L8wdnhIpMF8bVRCoEH6Sbz9ZC0g4y2HytpyVSK2qLqh0IOo23GQlV/hc9tQgTr3EYMAOBKTuWZIm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD5lBB0ZpAV64e88c1g7mftre55scD27aceQBDCahjY=;
 b=e6e3xcedMvBT5wEeTYxuRZ/hyo2V5ykk5fbWpOea+bvOt4nak61+1n3tQZTKV4nOujMW6rPNwhXP6eSDrczp72EDsoHV6qyTftFvqcbJEWq1RiPJgdLTLr9XyPrEKUsKumc9HCYBPzvXPqqB+h8s04Navy6zrJBY7TSJVx2TgwWE99HZ/TgC0nASlPBsslTCEKm59bu6OZbKyee8B4S0fzSg67hfAuSyZ+Ok/UoLxLy/8spZ8w/PtF2VfSHKsnch6nQx03aD8Pc9q/oIclalK/nzS0UI+pKF6kxLplEp9vhB/szHuuq0cFFc3sQfka5ANSyoKSYnLV6mFRpZmTK4/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD5lBB0ZpAV64e88c1g7mftre55scD27aceQBDCahjY=;
 b=NPUfHls7xqeoddsgDzDzTgZp0ICGX+UnNCuE9GSZqFaQOSXLYzFEn9ZsQDkJWde7vpbV4c6xgAO0HW9jpKdnxiRgbS3hKcvd5Lj+gsu5h1nFAMIJdW2R0oXzFEZD2rHP1x7XOYk1fkwmrRHtzIajnIeZLx4i51kG6qU9RnV1HdTar8cIrefHU0QNMVujCHEPqdssoYA3feMkNCKkjFGqKzJo9oPYY9ENhSzwoc3hIh52CaV7BXlQDx+OCCKiU3NuuCmcj4VlFnS4MZSZ1wctbRLh7ifD8gzRt12J0IP8nM20rcRH8ToN9Tq6rT6izpiO8saBV06QihziERy0IDdrxQ==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "ayan.kumar.halder | Guest"
	<ayan.kumar.halder@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [RFC PATCH v2] xen/arm: select GIC interrupt priorities at boot
Thread-Topic: [RFC PATCH v2] xen/arm: select GIC interrupt priorities at boot
Thread-Index: AQHdePB27tWQxiUixUiSX1M4ufH8Rg==
Date: Fri, 20 Nov 2026 13:10:06 +0000
Message-ID: <20261120130933.102952-1-mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|PA4PR03MB7037:EE_
x-ms-office365-filtering-correlation-id: 8d651612-bba4-47eb-97d7-08df470798b5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|261021123027099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|38070700021|11063799006|56012099006|10067099003|260925021311599003|260925022911599003|260925021911599003|261009223027099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 MCSHucI/5oA8yqPSS5SW2qAVZ9tKEKUD6DVEGu1Ug1x3IusSfC2xdkak892uLSd8czA/pSZxZejvBXZv95KpYGPETthUkGvYFByqCQ5a/9pbfeOJv4c6dNn7Q2Ws9MsGWEctLTPiykTDceVa8kfaJ0GuRL97ahrvFeioLavJSQGmO5Jr8ILCfEvGjCSeQoWPIGM+vXKmKrS3S1Kwy2JEgB51ypVslut81BOxn8/2dxSWhsTTSErylQCrAhg6OxGaHy0P/24BGQH7ecF+2IYaVBkMKf2+MfgDGs7mur443jLZ6YhMRNuKQzrgWPhbsyNRWAgEvPxyulfo7HNQN1i707q5t/zU2LWSJ/2Ogo+1M3KhY+0sceztN/KCEVmisJ8wcYYRyp540/K4hBfIGSzZBlNgFpYk3k3tGtmkG1U5nptcScEl2cSc+6MTlGWX/rhcyUZuZ7cos2776w5zFTcjP52WhORDhjKGJUXmSuAP3qyDt4GLGb1/917xANt51a2TKOo2d1gP50OMLewvp9YdmigPlHpg03eX0zkAH935uSqhWa9jl2PxYMjT2xZUMFpQ4h7RVUOYYOUNC2NR/cymqgNzro6ZJEAiePKVxXK4FYS9MpF2FrXdz6df3hmArW48R7nB5nZNl6hutrzhe1l9lgehv8fXUY95X28bBAWPlqM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(261021123027099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(38070700021)(11063799006)(56012099006)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YKJY8Y9dZumCMC0uy35ikiAJxloT7joR1oHeQsopdjK/rR35knClKBeGDa?=
 =?iso-8859-1?Q?7wvMwNW9dffhvWXB8ZqlRD4EZ0EoC54OTGgZuFQSaV2Mzt9OwFsTK1cRQC?=
 =?iso-8859-1?Q?AuFJ7Sg3I4dYW/HF1jYDoWqy4o1vJe56G34x2kCfAibZJvnbk+3w+Lek6g?=
 =?iso-8859-1?Q?PBn7NiR4C0auMIOz1LGIRBrskX0FhiR/UqQcQCrUt2pTD3GOLyNcd04GxP?=
 =?iso-8859-1?Q?KKPvSlFffbyFHWIjF85F4rQAV3ZTofYlOhH//o9Bq1xUwIS4AXMd6FVjBX?=
 =?iso-8859-1?Q?AV54W8edmJX9Ir1aaZcMMHtf/DFtHvZQVHq319BUVzPsY/PR7iRDrRW6F4?=
 =?iso-8859-1?Q?bMCJSdEm7kIEnlJxC615McBHSczqZD+Rnc+E4DKg1YRUwQUVe+x5DUDL6C?=
 =?iso-8859-1?Q?VACyllfDnP/q9oWZhrChg54WJH1jzf2wVLL2wm5glaYEQhiuLQtAXicv2D?=
 =?iso-8859-1?Q?2RzTwxenwb5ISYswAEexTDcLCZEmSy8lXV965uJ0Cwket5Z6gw+1njyzox?=
 =?iso-8859-1?Q?2XWYdGOnfgPf3Fg210aqIIqUCY8YvpGwx29po+l6tjl7MlPtbXXDrbOZK4?=
 =?iso-8859-1?Q?M00RC60s+og53iaafsRphR9CcWZ5bnJBbNM9ZP5dyQQAfugAz5tFS+BxO/?=
 =?iso-8859-1?Q?VuAFQBm12ICWN4OrLT/fOpIzJQrfyaZQSfyjnn++h056u6Jw9w0cYnXfU6?=
 =?iso-8859-1?Q?dii1hWFXVVozhKTNlVFpezhU3EU//tos/3XpA+N0lvtZgjwIQQUAfoLcWH?=
 =?iso-8859-1?Q?ATo8l6hEIWRto/ZOk7NnT7OzdhxI2VP4tH/oSIJ3Ubxy3jLJnxFNz2Wdjk?=
 =?iso-8859-1?Q?cGw9dAsbhJcc1HkHtB7lpnj2e2VLWp8HlYMY4gb1l3Gp+YyJG+tbRIwZuB?=
 =?iso-8859-1?Q?W6/sgFFKBrABQ6E+x/S9usgwlULROHduEjds5OKIyfXBmTzEB6Vx6XQ0X6?=
 =?iso-8859-1?Q?bgXn9R8ruAPYIZQRLCMuTHfdjscbhzQv5fQTMQnbCX9a2Z95sK5N8u2OEJ?=
 =?iso-8859-1?Q?yef3JHEiVAZ7jEEQZ7+d6B8pWQJ3AMfkWFKjXgVQSKozZ8hgunAJni7s4h?=
 =?iso-8859-1?Q?O6WhCIaKNlh/oVZOrRB4bukWetIm5pLcLCClVOGYV4DAHDAmaNAiGpWie6?=
 =?iso-8859-1?Q?wxhoRydYHA2lKhMSIXi9oiq0Dh6afkCgMCSiB4VWkGZPGVJkaqEzHDpNFV?=
 =?iso-8859-1?Q?kz+h27JuG8ZrnczPh4jZeU4DD5uJsS1VM5oTz7xo67g9a96RBt7nvoOJQU?=
 =?iso-8859-1?Q?noFyBctBSNc7fTgj+OrCNqq8s1OvBvSFC6ji7Bax9XnRCv/bRqlVRJya1c?=
 =?iso-8859-1?Q?jaUqAEOkVt3XgyFphNV9QM2buFZxnpmeFLVTq2CWPr/tesr1xEgn7ip+B8?=
 =?iso-8859-1?Q?AdxC1QW8NPHIhmmNbiFjmBg+GoaRFGlL1a7b3TS3zp9LgOTBkRPk3mD70d?=
 =?iso-8859-1?Q?SvvBBYQnTlK9oqZiYExjjWimNvTJBI+t1d8C2SA9g/bhwYhqjk4zxKXyu0?=
 =?iso-8859-1?Q?Pvd2stV4a29nv8x4X3F6178eBXf2PXDAx3yvSgKZJQEPBjkeMqNQ8hqAqf?=
 =?iso-8859-1?Q?20XLYMJFsWYiP9dp93tfAHgO4znFAecV2wOrqxhk5IoBeTAa0vSiRzLQhK?=
 =?iso-8859-1?Q?+9wB0ElwXdRVTYPDT+O4+Noq8VpW+TWbl++ecIXG2/Dp9k77EUczP/74IB?=
 =?iso-8859-1?Q?cqa22fNtrQhClum8jMjiWVSJ01MmgHpGQH9ddWYNbqzMTQtLLHyb2rLwgk?=
 =?iso-8859-1?Q?7T6j3ruqqlcXf5f72pjSCElU+n/4rVYQZq7kqt9S9KujVrfebM5cofqGbp?=
 =?iso-8859-1?Q?NPr5KTBetA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d651612-bba4-47eb-97d7-08df470798b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 13:10:06.1474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UDi3NBj4r9IWOJSxbDYqZjsDhaeW3vmibXV4t3fARxO4epC3h0oQVMMjtJTiKh4hsnTb3UP6URT28RyQ5S9CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7037
X-purgate-ID: tlsNG-4011c0/1795180210-58DC7CFC-5CED02C7/0/0
X-purgate-type: clean
X-purgate-size: 7625
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add boot parameters for ordinary IRQs, dynamic SGIs and Xen IPIs so
platforms can give an FF-A notification SGI higher priority than device
IRQs. Keep the defaults of 0xa0 for IRQs and dynamic SGIs and 0x90 for
IPIs.

An IRQ handler can wait for an IPI in on_selected_cpus(), so internal
IPIs must be able to preempt ordinary IRQs. Warn when a dynamic SGI is
registered at IPI priority or higher.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Keep dynamic SGIs at 0xa0 by default. v1 used 0x90.
- Add boot parameters for all three classes, as Bertrand suggested.
- Warn once for a dynamic SGI at IPI priority or higher.

Original patch and review:
https://lore.kernel.org/xen-devel/f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.=
1756867760.git.mykola_kvach@epam.com/

Would these three priority classes cover the real-time use case, or does
an individual interrupt need its own priority?

Level 0 programs 0xf0. With four effective priority bits, this can mask
the whole class, including timer PPIs for gic-pri-irq=3D0. Should Xen
expose level 0 on these systems?

If EL3 selects a common binary point, different IRQ and IPI levels can
share a preemption group. Should Xen check the effective groups?
---
 docs/misc/xen-command-line.pandoc | 16 +++++++++++++
 xen/arch/arm/gic.c                | 38 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h    | 23 +++++++++++++------
 xen/arch/arm/irq.c                | 14 +++++++++++-
 4 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index a6f08463d177686cddd718437b29013273bf0468..0d2fb5ef6379a3d5d6f7814c7c3=
b72863e2c4803 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1283,6 +1283,22 @@ available on Intel Panther Lake and Diamond Rapids C=
PUs, and AMD Zen6 CPUs.
 FRED is fully supported on AMD hardware.  On Intel hardware it is still te=
ch
 preview, and in particular not security supported.
=20
+### gic-pri-irq, gic-pri-sgi, gic-pri-ipi (arm)
+> `=3D <integer>`
+
+> Default: `gic-pri-irq=3D5 gic-pri-sgi=3D5 gic-pri-ipi=3D6`
+
+Set the physical GIC priority for ordinary IRQs, dynamically requested SGI=
s
+and Xen's internal IPIs, respectively. Ordinary IRQs include Xen's timer
+PPIs, physical SPIs routed to guests and physical LPIs. Choose levels
+that let internal IPIs preempt ordinary IRQs.
+
+Levels 0 (lowest) through 7 (highest) program GIC priorities from `0xf0`
+to `0x80`, in steps of `0x10`. The GIC delivers an interrupt only
+if its priority is higher than the effective priority mask. Depending on
+the implemented priority bits, the mask can block level 0. This can stop
+Xen's timer interrupts when `gic-pri-irq=3D0`.
+
 ### gic-test (arm)
 > `=3D <boolean>`
=20
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index c4bda435bd61f696ff3170ed1d9e5ec3b4a0f5de..99dc5eb8254d13452a4aca717cf=
787e0c078bfa4 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -14,6 +14,7 @@
 #include <xen/irq.h>
 #include <xen/sched.h>
 #include <xen/errno.h>
+#include <xen/param.h>
 #include <xen/softirq.h>
 #include <xen/list.h>
 #include <xen/device_tree.h>
@@ -35,6 +36,43 @@ DEFINE_PER_CPU(uint64_t, lr_mask);
=20
 const struct gic_hw_operations *gic_hw_ops;
=20
+#define GIC_PRI_LEVEL(level) (GIC_PRI_LOWEST - ((level) * 0x10U))
+
+unsigned int __ro_after_init gic_pri_irq =3D GIC_PRI_LEVEL(5U);
+unsigned int __ro_after_init gic_pri_sgi =3D GIC_PRI_LEVEL(5U);
+unsigned int __ro_after_init gic_pri_ipi =3D GIC_PRI_LEVEL(6U);
+
+static int __init parse_gic_pri(const char *s, unsigned int *priority)
+{
+    const char *end;
+    unsigned long level =3D simple_strtoul(s, &end, 0);
+
+    if ( end =3D=3D s || *end || level > 7 )
+        return -EINVAL;
+
+    *priority =3D GIC_PRI_LEVEL((unsigned int)level);
+
+    return 0;
+}
+
+static int __init cf_check parse_gic_pri_irq(const char *s)
+{
+    return parse_gic_pri(s, &gic_pri_irq);
+}
+custom_param("gic-pri-irq", parse_gic_pri_irq);
+
+static int __init cf_check parse_gic_pri_sgi(const char *s)
+{
+    return parse_gic_pri(s, &gic_pri_sgi);
+}
+custom_param("gic-pri-sgi", parse_gic_pri_sgi);
+
+static int __init cf_check parse_gic_pri_ipi(const char *s)
+{
+    return parse_gic_pri(s, &gic_pri_ipi);
+}
+custom_param("gic-pri-ipi", parse_gic_pri_ipi);
+
 static void __init __maybe_unused build_assertions(void)
 {
     /* Check our enum gic_sgi only covers SGIs */
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 7ceae49774bf29e1dedc6c223c30a16265b53275..0883d5c66133cd198f6281dc6bb=
4968698f642ff 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -153,7 +153,8 @@
  * GICC_BPR to 0 but we must expect that it might be 3. This means we
  * can rely on preemption between the following ranges:
  * 0xf0..0xff
- * 0xe0..0xdf
+ * 0xe0..0xef
+ * 0xd0..0xdf
  * 0xc0..0xcf
  * 0xb0..0xbf
  * 0xa0..0xaf
@@ -165,13 +166,7 @@
  * A GIC must support a minimum of 16 priority levels.
  */
 #define GIC_PRI_LOWEST     0xf0U
-#define GIC_PRI_IRQ        0xa0U
-#define GIC_PRI_IPI        0x90U /* IPIs must preempt normal interrupts */
 #define GIC_PRI_HIGHEST    0x80U /* Higher priorities belong to Secure-Wor=
ld */
-#define GIC_PRI_IRQ_ALL    ((GIC_PRI_IRQ << 24) | (GIC_PRI_IRQ << 16) |\
-                            (GIC_PRI_IRQ << 8) | GIC_PRI_IRQ)
-#define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
-                            (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
=20
 #define GIC_PRI_TO_GUEST(pri) ((pri) >> 3) /* GICH_LR and GICH_VMCR only s=
upport
                                               5 bits for guest irq priorit=
y */
@@ -180,6 +175,20 @@
 #define GICH_LR_ACTIVE          2
=20
 #ifndef __ASSEMBLER__
+
+extern unsigned int gic_pri_irq;
+extern unsigned int gic_pri_sgi;
+extern unsigned int gic_pri_ipi;
+
+#define GIC_PRI_IRQ        gic_pri_irq
+#define GIC_PRI_SGI        gic_pri_sgi
+#define GIC_PRI_IPI        gic_pri_ipi
+
+#define GIC_PRI_IRQ_ALL    ((GIC_PRI_IRQ << 24) | (GIC_PRI_IRQ << 16) |\
+                            (GIC_PRI_IRQ << 8) | GIC_PRI_IRQ)
+#define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
+                            (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
+
 #include <xen/device_tree.h>
 #include <xen/irq.h>
=20
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 8d3517e761621c4930c9440ebd060762b8369e4e..29f21224ffdde620307e4f58fd7=
dd247d975ba82 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -453,7 +453,19 @@ int setup_irq(unsigned int irq, unsigned int irqflags,=
 struct irqaction *new)
     /* First time the IRQ is setup */
     if ( disabled )
     {
-        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
+        unsigned int prio =3D GIC_PRI_IRQ;
+
+        if ( desc->irq >=3D GIC_SGI_STATIC_MAX && desc->irq < NR_GIC_SGI )
+        {
+            prio =3D GIC_PRI_SGI;
+
+            if ( prio <=3D GIC_PRI_IPI )
+                printk_once(XENLOG_WARNING
+                            "SGI %u priority %#x at or above IPI %#x\n",
+                            desc->irq, prio, GIC_PRI_IPI);
+        }
+
+        gic_route_irq_to_xen(desc, prio);
         /* It's fine to use smp_processor_id() because:
          * For SGI and PPI: irq_desc is banked
          * For SPI: we don't care for now which CPU will receive the=

