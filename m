Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AEE606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=dVnLZmbN
Received: from list by lists.xenproject.org with outflank-mailman.1455151.1668707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RQ-0005yX-2R; Tue, 20 Oct 2026 08:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455151.1668707; Tue, 20 Oct 2026 08:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RP-0005xb-SK; Tue, 20 Oct 2026 08:43:27 +0000
Received: by outflank-mailman (input) for mailman id 1455151;
 Tue, 20 Oct 2026 08:43:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xJ5RN-0005XV-QI
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 08:43:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ5RN-00EVzr-6b
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:43:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ac-e002-0a2a0a5209dd-0a2a4503caa8-14
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:25 +0200
Received: from [52.101.84.117]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ab-fae8-0a2a45030019-3465547526e8-5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:24 +0200
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by AS8PR03MB8395.eurprd03.prod.outlook.com
 (2603:10a6:20b:527::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:43:22 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 08:43:21 +0000
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
 b=WWLEbNFvHsvyTzY+BxmQi+u8B+cqiRuy6ZfXN9BSOrS2Zd7otsnjz4sf0rzihBNzfA2z763/RP4TMuJs1Elnr6B7yH5VeuMRnLcNyZHpZJinZ5sosN2lzdzOIyamHOGbLzYs82Mhj0IuUdYLbFhHUqPSKUi2LapNJ62wH/EV77pS8+rXTIvF77Ib4L6QornHqbPhnraOsWI5xp3Pp1CdJBda7KJnxPTGfDVKxEnHVfzS1SReRX1AVJ+ALQQxTTTmUM3OI1phaOEJV2jFAiXesgzK3OpwvT/hQjoQfMxyp7GLwLycGRCGbRrsVssSDP5NAUmaZqvA24JxLN4IqDaTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fgg9cHMriHhGOg+Y24vzMOHf2dI+HJEpVRu9jm6g36M=;
 b=kTFC7mIPmbOXDfn/1SdpaLRxG6B+x8HeJdDU3Yl4J8UsGjgezpJ7gnlOWB1PMglj7kqSZ0hly9gs786FXfJhYUtYfXcp4ytz7SlbdXDWYyFnewmxp3zic1bjCpDqiPGQ0vLXhNa9A9LlJdT2kVZwgcCiJ4DNDdyHxDbN12nCmRKvqLhSekF47TxTMuUWc1gVlN8ehnln62hY0jih5MIhUVm2q6oOSAUMVIi0fo0f9dxkgTQAvDszJgY0LcVIdHTvZHtT853lXnSiXOIScikIXKMQB55KpZ4Ajp1hxs0J97QMDp7aF93V3kVbilwS3ST0uYfAjNEj0w0jnJzG/vEfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgg9cHMriHhGOg+Y24vzMOHf2dI+HJEpVRu9jm6g36M=;
 b=dVnLZmbNNYHJnehvAR1QAbFQFVwEbmLZ4WdCscWRqcGD7fPL9qQOFfQN0JGElwnDeLLqK+up9A7w6X2Z/itCrKyt9l9/B/ed3yL1wyYvbUnnOaT/J2uJ0KdJ8WX81MLHny4nwK5Lk9oFwEtuGKF/D2qmf6R8fenlJF1/N3hDQt8f4xrMRg1Z7huOgzTz9OS1CiJI3l1Um92qN0P2ymeM+XRFxkU5F8FBshNW43T3rzZNNrYT4pxd0AfM7D/vO1F9jwgwbmLXvCyBqTLMsv+APVQWGE/DyO5IudJMlatT6hfdDVevfZPb3LB4UUoZDBicXjE2kmRXSpbupwp8rHptoQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v14 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v14 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHdYG8PNqq9SzC3aUiu3lmAtwvgnQ==
Date: Tue, 20 Oct 2026 08:43:20 +0000
Message-ID:
 <31deb8be49033aa8d2f1940f69ad4cba362f6e91.1792485704.git.oleksii_moisieiev@epam.com>
References: <cover.1792485704.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1792485704.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|AS8PR03MB8395:EE_
x-ms-office365-filtering-correlation-id: 29e2f592-4d6d-4065-6431-08df2e863295
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|7416014|18002099003|22082099003|3023799007|260925022911599003|38070700021|260925021911599003|11063799006|10067099003|261009223027099003|260925021311599003|56012099006;
x-microsoft-antispam-message-info:
 Q7jh2HbBsIizKlQUcDivvRHw5oORzPCIWY1uXZ7hNJUq6BHYScLdpqqm7UNOD7ggTU1tsUxYhAHn8R6xf9F/bqCGuJ//XLCyJuxrJQSCUw9FTbOiNsG6cADKTEU9/gwqIYqaq6kM6oO7aHrhaQvEkBjt/OUC8X2flh72wl0HeKDwjKJ+P0T16kekr8+WmZhqHtRakyvBdxXYkJbaOuzkpJr5MOWuHV+mncZGSU7uaKrskwf6Ld996z1czlrfv9TR0xMinikVoNE0qHZyADAyU6+nRjlWSBkf8R5FTUBSP3o3rtIkQ2zcmbq/YONGaWuq6/sAjhCsTwkvtAgQUXgunaR6xPCq92/ZhwhqjxZ7owJnA4P6orRoySejfBqdB2I+WcqdOnpWcTqdpK6SLgTNhwPAciJZWxe7/SXPIT3I2zKy8j5t8gPqzoLx8AgEFvHmzO+0AGHlRxLeCcSSgQ94CfwGg4m91f8RCgzzsBlevYnHv7LXNx9yL2RDAFxqzLw37jXpAIQZiiMKEmMvIPE7HueFLrjNEC4E9EU9wVoaXYliHp/DNBoJEm3WiUbrDxyDctoVoH7DW+Pbkbwk2koGKYxP0/6oyHJvDXKPlaRku/UmmdmwTducaYJuTWA+ojKTgNghOkP578baJ7iqQmYnDHb4KMOJPFEAjPxiEO7Os1Pl1aP6P2ORIS9YE4xGATktE9ZqjIU+USMyzYlf2d0W0ZFRUDTEbzuMtGboLsbv0tk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(7416014)(18002099003)(22082099003)(3023799007)(260925022911599003)(38070700021)(260925021911599003)(11063799006)(10067099003)(261009223027099003)(260925021311599003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xD508+bxmvAtzqrKuLZYnvPItC4wjksPnpGxmaTW9zeXOEMRvpZRNzMjKQ?=
 =?iso-8859-1?Q?A4kvLvESgXOEasX9eDMjiatmL9DMOUQg3vvsPiOLvdv45HEbwF/COM4mB0?=
 =?iso-8859-1?Q?903a1Vi5wzgQ+lHNGGfB0WPdfLDV3+XyPU+5ZDnXl5zFPT7TYIcTAhdJFl?=
 =?iso-8859-1?Q?ziFLR63Q5Eo32UBbvnggX7WpRNoMZaOX4oTq2R7w8JFFoJ3PDeutOdiWp2?=
 =?iso-8859-1?Q?83fvgDET4smI98GQoWkNVWJWhtTKHwYHXDG3W6Yj32rP4TTUOd6KaIyvtx?=
 =?iso-8859-1?Q?OyAuDYM/GK7CK4JAupsg8Jrn3FJFR9O41AC41NzVo1qPK1BUdgFvtlxqrN?=
 =?iso-8859-1?Q?KiEvROcFwnhYce2u29PxqFOijlHpqNMkXOFj6KX3PnN3+34mzIJiWJ1Gjd?=
 =?iso-8859-1?Q?uemPvO/tL8MAH/X7Kpnt5PLTahd1dEjcqjITnYRqvKNSLGRkho7A//4SKH?=
 =?iso-8859-1?Q?126yR9h6ITD/PS02AVtmfM96d+Dgu+KTydNIHkNe32l23uUai7SFdS2YIc?=
 =?iso-8859-1?Q?cCljL3jdWApJxR/3y0sq2YUim/09w6zJVQ2nnmgdm3bNIyP23w+xd3lOWO?=
 =?iso-8859-1?Q?6mHF1wkb4turtYUtDLjMRQGY9R+vHjwV/3RoGo/f7m09bEU+fANbui3TtO?=
 =?iso-8859-1?Q?hoU/4WdFu+DKA83QeG7Y+Mt0lPvItgs7LyDVfQ4LSIdIussp/Z2exMCr7Y?=
 =?iso-8859-1?Q?6KxlzjbNdlcXZkR6/tmmXYNeyUNQlQsJH0c9Tc83A8lzE4JRAa76nQUFCn?=
 =?iso-8859-1?Q?iDpM812lXgNHrBNj9NTvfJVPJFntYRsnNPEnHwD3olOx2bCpPCXB+3SUPC?=
 =?iso-8859-1?Q?NeHtRPnD75+DaXBJErBqJIxQ+0vxTGbfAZKeghuidXlBJVzQszkvv9lz9P?=
 =?iso-8859-1?Q?19620RGMNNhB92HpT6kX0pgWsTiJ0huAjF1lv1i8v6tMlXysd1JLETQllu?=
 =?iso-8859-1?Q?gy3hOSWM4JbvtXZh81j1HlRIWP966Z7+WvaMUXTMoggRDzZzobMwKbGAdT?=
 =?iso-8859-1?Q?gX8Z0OBZpxmC7eTOlvTEA7gcktmnfwEatHK7VGCl+Bit7CKg9RTytc8eFN?=
 =?iso-8859-1?Q?DsmV15Fnptf0Nmg75HuGsdPgy6X5VYwCeqtumYCcuCV9JuyE/mTG0M44LC?=
 =?iso-8859-1?Q?rTkl6yUEW9vt4u5rgee94ZYFSrwtkuKK/6EzfjCXBnmkqef1lAwaug5g0L?=
 =?iso-8859-1?Q?yBh8qCqeg0M9gaWe/GsSMLp6d4ZV2hrr/oHpM+DKPNjkYUC3zSRG6YgwVY?=
 =?iso-8859-1?Q?1dMN9EcxOT1uHHPqesBRkhorfd9lNdK6sHZTl0KzyN9A5jAhPZK2OZ/REM?=
 =?iso-8859-1?Q?FH6uJnXgaGEE+hh0pai5ZocTgAco32X8htlO/jf6ACYDzYi1gbZOamFGl2?=
 =?iso-8859-1?Q?LPxBWQv6ax2Hm0AJQSZv0aR8TslBOjfdU9Ucj/J0yj+PStIeKDliDuM6Oe?=
 =?iso-8859-1?Q?jnfJsUr2dKcG9bsWRO9tQNkEn81i7VofJ5KuiD4YR0Vg5q7LLWlBFjOX7E?=
 =?iso-8859-1?Q?vpLAxDwCX22J0scPEnhTExqW+wz5Arhi4SlO3TA6S8xLH8GdeyKac6r0A4?=
 =?iso-8859-1?Q?ALcRTLXPdJIWRt7jhgJ+WALM/JuCU1n5MmdnzM/5FCXZXCQi4Hth6tkTpp?=
 =?iso-8859-1?Q?E9Yt8jPjx7AiAiQUS/x78Rn+YGS4MyUzO75LvSmHu81M0Cj9dkIpWmeWWZ?=
 =?iso-8859-1?Q?JZALFJiXP3DUQbUvbLJIvOO9hKijFKA7sdyiSffavZI7j8u7zyWrbIdXDb?=
 =?iso-8859-1?Q?FCPrevN0yZuLC/QeZ11Oh1DS11wc8xFfxIRQ8U2tGid5RMdFS2bdX2J/Ub?=
 =?iso-8859-1?Q?zmRS6yngGTnR8Cggid9MYOzC/oHURbA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e2f592-4d6d-4065-6431-08df2e863295
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 08:43:20.4236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQiimm0RlmdcHH6lj1nrex9Gy6DDnBP8NU9y4YWn/dCunyEVrOYlmVQwdKCL5DzY4RIvHQwtgtgxTMcuY8eJqGl8UclB5ybayCIhgtdgPyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8395
X-purgate-ID: tlsNG-33051d/1792485804-75EFF4E9-FBAFD980/0/0
X-purgate-type: clean
X-purgate-size: 10172
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
regular memory and a memory-like I/O region on Arm. The generic
prototypes live in io.h so other architectures can provide their own
implementations.

The helpers copy a byte sequence: byte accesses are used until the I/O
pointer is 32-bit aligned and for the trailing count % 4 bytes, the
aligned bulk uses 32-bit accesses. Only the I/O pointer is aligned, the
regular memory side is accessed through get_unaligned_le32() /
put_unaligned_le32(), so the access widths issued on the I/O side do not
depend on the alignment of the memory buffer. These _le32 helpers pair
with readl()/writel(), which are little endian accessors, hence the byte
sequence is preserved on either CPU endianness.

The constraints on the I/O region are documented next to the
declarations in xen/io.h, the arch-specific access pattern next to the
implementation.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

(no changes since v13)

Changes in v13:
- memcpy_{from,to}io(): align only the I/O pointer and access the
  regular memory side through get_unaligned_le32()/put_unaligned_le32().
- document the contract of the helpers in xen/io.h
- reword the Arm implementation notes to state the concrete access
  pattern
- drop the incorrect claim about avoiding endianness conversion from the
  commit message; note instead that the _le32 helpers pair with
  readl()/writel() so the byte sequence is preserved on either endianness

Changes in v12:
- Add missed R-B
- correct the Emacs footer of both files, which asked for 8 column
tab indentation while the code is in 4 column Xen style

Changes in v10:
- removed extra include in memcpy-{to/from}io.c files

Changes in v9:
- reword commit description to refer to memcpy_fromio and memcpy_toio
- ordering obj-y in Makefile
- rename ALL_LIBS to ARCH_LIBS
- drop io.h and move definitions to the common header, fix comments to
be arch neutral
- update comments for memcpy_{from/to}io implementation

Changes in v8:
- switched to ordered accessors to address the ordering and barrier
concerns.
- updated the documentation to match the implementation and explicitly
state the supported access sizes and granularity.
- rename memcpy_* implementation files to memcpu-* to follow naming
convension
- fix indentation to match Xen style
- fix intendation to match Xen style
- move memcpy-{from/to}io to more convenient library place

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/lib/Makefile        |  2 ++
 xen/arch/arm/lib/memcpy-fromio.c | 56 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 56 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 25 ++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index cdcec8cd03..ba61f9e5fd 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y +=3D platforms/
 endif
 obj-y +=3D firmware/
+obj-y +=3D lib/
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..009bb22c45 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
=20
 ARCH_LIBS-y +=3D arch/arm/$(ARCH)/lib/lib.a
+ARCH_LIBS-y +=3D arch/arm/lib/lib.a
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/lib/Makefile b/xen/arch/arm/lib/Makefile
new file mode 100644
index 0000000000..07a0d9186c
--- /dev/null
+++ b/xen/arch/arm/lib/Makefile
@@ -0,0 +1,2 @@
+lib-y +=3D memcpy-fromio.o
+lib-y +=3D memcpy-toio.o
diff --git a/xen/arch/arm/lib/memcpy-fromio.c b/xen/arch/arm/lib/memcpy-fro=
mio.c
new file mode 100644
index 0000000000..98339a5cfa
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+#include <xen/unaligned.h>
+
+/*
+ * Arm implementation notes:
+ * - Byte accesses are issued until the I/O pointer is 32-bit aligned and
+ *   for the trailing count % 4 bytes; the aligned bulk uses 32-bit
+ *   accesses. No wider accesses are issued.
+ * - The access widths on the I/O side depend only on the alignment of the
+ *   I/O pointer and on count. The regular memory side is accessed through
+ *   put_unaligned_le32(), so its alignment has no influence on them.
+ * - put_unaligned_le32() pairs with readl(), which is a little endian
+ *   accessor, so the byte sequence is preserved on either CPU endianness.
+ * - The I/O region must be mapped with device attributes; ordering is
+ *   provided by the accessors themselves, no extra barriers are added.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        put_unaligned_le32(readl(from), to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/lib/memcpy-toio.c b/xen/arch/arm/lib/memcpy-toio.=
c
new file mode 100644
index 0000000000..c0be79586d
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+#include <xen/unaligned.h>
+
+/*
+ * Arm implementation notes:
+ * - Byte accesses are issued until the I/O pointer is 32-bit aligned and
+ *   for the trailing count % 4 bytes; the aligned bulk uses 32-bit
+ *   accesses. No wider accesses are issued.
+ * - The access widths on the I/O side depend only on the alignment of the
+ *   I/O pointer and on count. The regular memory side is accessed through
+ *   get_unaligned_le32(), so its alignment has no influence on them.
+ * - get_unaligned_le32() pairs with writel(), which is a little endian
+ *   accessor, so the byte sequence is preserved on either CPU endianness.
+ * - The I/O region must be mapped with device attributes; ordering is
+ *   provided by the accessors themselves, no extra barriers are added.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(get_unaligned_le32(from), to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
index 164a20c5d7..0b60be27c1 100644
--- a/xen/include/xen/io.h
+++ b/xen/include/xen/io.h
@@ -67,4 +67,29 @@ static inline bool write_mmio(volatile void __iomem *mem=
, unsigned long data,
     return true;
 }
=20
+/*
+ * Copy a sequence of bytes between regular memory and a memory-like I/O
+ * region, e.g. shared memory placed in RAM or SRAM mapped with device
+ * attributes.
+ *
+ * The I/O region must behave like byte-addressable storage: it has to
+ * accept 8-bit accesses at any byte address and naturally aligned 32-bit
+ * accesses, with plain byte-storage semantics in both cases (no side
+ * effects, no dependency on the access width). An implementation may use
+ * any of these widths, but never wider ones. The helpers are therefore
+ * not suitable for device registers with access-width requirements.
+ *
+ * Neither pointer needs to be aligned. The access widths issued on the
+ * I/O side depend only on the alignment of the I/O pointer and on count,
+ * never on the alignment of the regular memory pointer.
+ *
+ * Implementations are architecture-specific and may impose further
+ * constraints; see the respective arch/<arch>/lib/memcpy-{from,to}io.c
+ * for the exact access pattern.
+ */
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count);
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count);
+
 #endif /* XEN_IO_H */
--=20
2.43.0

