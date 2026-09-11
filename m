Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA4C79FA1
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:26:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415786.1645016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veS-0003FN-Kj; Fri, 11 Sep 2026 07:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415786.1645016; Fri, 11 Sep 2026 07:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veS-0003EM-FH; Fri, 11 Sep 2026 07:26:24 +0000
Received: by outflank-mailman (input) for mailman id 1415786;
 Fri, 11 Sep 2026 07:26:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x4veR-00036T-IE
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:26:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4veQ-001KmU-UL
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:26:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad17-e002-0a2a0a5209dd-0a2a4507c276-20
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:22 +0200
Received: from [52.101.70.117]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad1d-b4ea-0a2a45070019-3465467530e0-5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:22 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB8025.eurprd03.prod.outlook.com (2603:10a6:20b:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:26:20 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 07:26:20 +0000
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
 b=tZEGvXD53Jo1RdSsy9s8JKQwSQm/FOCAO3Zq6LsLPYJZ9quTeqZptEqHzkHgTuEFngsgPRPw49lXV2Nu0RJOvc6bzV9qUz2wo+muDtcmEZjoNJdlKoEGD0xU3hh1UjHZeE60mwhH7usdHwm0nciJxLkBxNnRd9N1RXdJh6bKHrEn8nU6x816yD/4GI77jtXy3FIJj0zHDLn2fQYLhJtiWixobXdCMPBbxskLv7BWVaouxRLTjz1J1li4YvZ+HMzQiMsIIet4aszklolmJi/nuxff5QEPqsh6QdLI9sLOpTebF2TMl626dAezTlqeC6jiOZ4ZeqrS3gcTyAEHfSZPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej35jXrH9F2Cgm3HWS9Pvfb26eAYGC6ez9jDhksRBPQ=;
 b=kB3zgg5b1QpukN6CjWGVMPVIgD0vvIh/ua2cpXhscZh/I4jizEWQGFvSFkoNhIePcbkS+lJTYtuXELEOIumgxoU2mJnQaCuiQnrt2eaLSjsa43A0UbxnJ/iVI3rxpOWldXd0P3uIyUO/zK+3o2ttCAjCNtUWW6TkEF7GkdF7tpXNXwCEfJ9xHUX4Y910DFpqmcxExvc4adCKYMdq1T/QVY58NjUB5bXQe5fx/Ktih5Qf1FYLzgrvcZKk8UWvGmDgdSLUeBgrY0dxIacH4WdpD0w7zQNCJN0JVw8KsgIdnHmrmVLvZjdwmOqjv8B4eK2EUSbGrxi/A+vA6NHrc2hTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej35jXrH9F2Cgm3HWS9Pvfb26eAYGC6ez9jDhksRBPQ=;
 b=swIhuMvI7gLAQCfaxRF2iu6xNdjTsXDFa6QCuMGlvob67UTlVQu9KVbp6wvyqHiv3viVsMfdD8K6cw1tzn9lu7mJ4V8ZFGFO4JbWilUOGrkVDuEPoZVVlJUmHMuLJE/Z6ySZWp0WXn8Ex7Uzah+261o29qLh7Mf2kaYKsp2IxH+8QLyCRDwhjP0FJJRN3F3kVRtd8SeL9hjFJhQGHAlyiatqt6DDA3yNpldDmCtapUEq/vkH1PynCeOwaGL1HqxXvCfnfH0dpRlgcloL15gpUKCdc3diFpPSRRfS3UkobzBqm378rQLOoVbaS7IKlCfUeQtHj0ZgNrJ8e87brqSkzA==
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
Subject: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHdQb7XwQvbnxLqDEGK19PLXXgaew==
Date: Fri, 11 Sep 2026 07:26:20 +0000
Message-ID:
 <6bf8f9dd61da4d0fbea096b863f51db08df46c56.1789055542.git.oleksii_moisieiev@epam.com>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1789055542.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB8025:EE_
x-ms-office365-filtering-correlation-id: 14479ef4-56a3-43f6-d369-08df0fd5f9ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 /Any2wm0K3F1eSgh7+5mLMMrtKTeWulnGxApORo+9NBD+T7p66AV0ojwc6SWlAIRTygefuvhKCFCByFb7bnAQampp7hUSn2vdRRe5oik9+X50+cwNwdpe74JFEjERJ8DJnRWcOwQ9QNPYpdwIv5OtlWSyFw1J7dYcFx4Mz5+UMGRnul3sgRAojz83MQt8Dy6tXkZ0ax2/qHQCqo1+W5dmkgQ3wlCzlCM1IaLoubaalrvDxGt0ILX0kYZMU2TB9UIhf4xxLE5zxOYV3jj7e+QdCedpQ6D8b/cuO4V2n69whZgX9HaLvGVLDRdyB2kI5gJ0M6ec8ufUtj58rt06/NS5N0sGBgZHK2yETV7eFEDD5RL7kEcBWxKVAFbsfU/fJr8t4Gyn1JubZ9oc5RnjoluDRq8aHAQHoM047FeCU+6NbPL5AoirnpkR0ruwuKt1j1WRdH+OtxRZ983jRMkuha6+QUwqmN+mIGh7F3MhTRSydEhH5qetJ3QPLalQiSD86tf2habqP2frmp255pM3uM7QwbE4vMdn0D68L4Y3eIZYHVQhE1z5+pqNa1VkDk0lg7XzJsvR3uwgTcc3LfjMsV/t3WMz9WCmqaX/tlk3TfCizjSYcFF055T3yf+Cxwr/QOThlGmNA3cdlbQEkaCIVZF4yAYzuHbHAN222N9S8KyPShsIPfhxiHFl1IkKn6LfnROccXwOoV0eZaVRVRuuQmq9nQ3M575rT/KsyYEQLLaliA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?emnrZ+LMu2WA2ElvjGAdfurkPE+3oIkwN0Ye59NXFn9bOxhiNpZ+2B2Ujp?=
 =?iso-8859-1?Q?t6FylnA3OW/ELhiFNh0bmFL18+iGsZmvaYkDCxIg2OUzNCsw33Bwzs+2FE?=
 =?iso-8859-1?Q?ddERfNXVCiLl7sE+WsV4trjPX1nRgryd3n6hulXtT50CCgq9pSAPyoWfRI?=
 =?iso-8859-1?Q?8nOdrST0mFXnHYD4tYJdvX9snC0tMe+4ewxnq0GMDfw4FhnM645m6/yzrN?=
 =?iso-8859-1?Q?GhnUVWfnJkEkzc9Pqgpbcrqts0ErKTqmHwO57VLmljrueZ6soNa4M9QVRB?=
 =?iso-8859-1?Q?EY2tqZ91ysOVi1wVQMeBS4s+P0w4PwFamTvlQKRvDEYQfOvPuf4M0JeCXU?=
 =?iso-8859-1?Q?gXrv7KHUByvAaMJleazMim5U03IMsTUEnXiMXX0dVs3EPfPSYcFSM5ApJU?=
 =?iso-8859-1?Q?XQqhi0100j+CrVsrIW9JDK0rL6Gk8WoOWH5CMPrnY9P0KPhzjShnCthaX0?=
 =?iso-8859-1?Q?hYG+1vFzJMJTfcWK6FxFazwDAQuGEFdHY4ERdGJ1UL2yDt35LGsyYeASUd?=
 =?iso-8859-1?Q?p9TVN3cHwIXG4DDyWB2dnRbkcOFaKQeyMS82wIX/Tq7Q5TsUxzlfKL9WaJ?=
 =?iso-8859-1?Q?ty0gJpkggs4C5wAsiSuVF/O34Gqk9Hu1BNYIwMrZPPeDy8FfVUWd4s9J3R?=
 =?iso-8859-1?Q?V8AWE5lPZvmJlDtFQeDivEruL2l3X99QCZm/D/38n7bonDp0iI4AWMpeMb?=
 =?iso-8859-1?Q?gm/SxOiZa3aXIIXHexEdYal6XBb1xo3Z2nfTU79ljGgte7zE19KeOHrJX2?=
 =?iso-8859-1?Q?4KmWm1PnleXNyX6WkE//JXaTA64uBrY7iP++zzWic2cubr+4dLxZW9eQVT?=
 =?iso-8859-1?Q?zO+u0o9vw+sWyOv/k8xjLDErWAgNclQN24qcBr5gxcTjQcht9mSNFdiv5b?=
 =?iso-8859-1?Q?iZmDiv9IziAVgQr7cmyleE5YtoxFCm2xcPakDtr7ezlGgJFRFqLe+s4gnb?=
 =?iso-8859-1?Q?RLvWwI/m28LtkW3q0LrXIKYhMVJfXSsqCXQ9ye/hENDyDZiYauQyb0Ee6D?=
 =?iso-8859-1?Q?1BIrAsNVcjyMFcrkvDRxbulZB93b9XPw66zHYGTAlRPRniVon5MBI52596?=
 =?iso-8859-1?Q?lb3eCKGsdVoYJ++0DWom8OfudqgQSFiWy09lYKEutgxWvvhA6V+LVCnu9X?=
 =?iso-8859-1?Q?59r+Vt6Z7jEJWfKKBw3+z89rl+SWDWeVcMms6Z8quHU0GuSiWBcbsjszzt?=
 =?iso-8859-1?Q?B5xKZSoktgh/z9R0iVrcdTMspfvJt1Ecw6QtVQSrNoBsLSwDlxIQV/EhuY?=
 =?iso-8859-1?Q?V2r54tcQ1hdo69D0rETtsdR/NAmUNeaIzaLYj19mGidCFKaIOdZOhmyrv0?=
 =?iso-8859-1?Q?hwHO9/BHvDE78E9N1QnB80u5tCFIv1HIY9CnXFl8ECXnRiLQoaTZjEmRYK?=
 =?iso-8859-1?Q?GdNUXYa3fZMoKKXodn0atikKnbrVEzoTXuSVvXAW5ay3+b7qx3nKS/5wKo?=
 =?iso-8859-1?Q?gNPoM+8HnWo/GdsnIZEhiiyHjRizckVIzZUH25stIIvMJnKSG2AdBH26n4?=
 =?iso-8859-1?Q?rkZdeRH8a50583cJNtxERhbPi7EsCkomzG/eFPyEtNYtOYmKL2d2NN3gAo?=
 =?iso-8859-1?Q?AEq0lvdQuvtub08/6k5KeATZfpM7u9Zzcht3x3GefaqAZCBADOFySgEvLb?=
 =?iso-8859-1?Q?nfSKUZ4WlzdGvym8opV1YY/BcMmkKCGMCXZX0H77C0FQSyvBJsyo7XezbE?=
 =?iso-8859-1?Q?06ku1JK+h0rzqk4Wns0qc1yGaqrPwEOmErSWF81YPs+4qwgDp/DUbTRD0P?=
 =?iso-8859-1?Q?5HZtlPx5yzuRiPrTRPusOVJfC0bNJM8tOAkxGxdS2DMpDeIIDJgoNra4/B?=
 =?iso-8859-1?Q?dUuT6B5n7nMpikLbuGKK7P8bOZtg2xI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14479ef4-56a3-43f6-d369-08df0fd5f9ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 07:26:20.2723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Su+lf2zuaHt0ltVyvyQtf3Sf29oQtQ7nnJwQWlWr9N8ot6MH2eTcg7TVwPC0PhfVeQENEAgc6KXlgbvpHmtjvtUIWegCjP7I2ZLONlM/u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8025
X-purgate-ID: tlsNG-ef75cf/1789111582-3C610AE4-7128A54C/0/0
X-purgate-type: clean
X-purgate-size: 8704

Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
regular memory and MMIO space on Arm. The generic prototypes live in
io.h so other architectures can provide their own implementations.

These helpers handle alignment safely by using ordered byte accesses for
any leading/trailing unaligned bytes and ordered 32-bit accesses for the
aligned bulk transfer. Using the ordered `readb/readl` and
`writeb/writel` accessors avoids unintended endianness conversion while
respecting device ordering requirements on ARM32/ARM64 hardware that may
not support 64-bit MMIO atomically.

The interface lives in the generic header so other architectures can
provide their own implementations (as macros or functions). The ARM
implementation is placed under `arch/arm/lib/` (mirroring the x86
reference layout) and is split into separate compilation units added via
the architecture-specific lib Makefile.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

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
 xen/arch/arm/lib/memcpy-fromio.c | 55 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 55 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 10 ++++++
 6 files changed, 124 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index b7afd3e58c..e448e69014 100644
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
index 0000000000..d8d6a5f557
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+
+/*
+ * Arm implementation notes / limitations:
+ * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
+ *   32-bit accesses for the aligned bulk; no wider accesses are issued.
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
+ *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
+ * - MMIO must be mapped with appropriate device attributes to preserve
+ *   ordering; no extra barriers beyond the ordered accessors are added.
+ * - If source or destination is misaligned, leading bytes are copied
+ *   byte-by-byte until both sides are 32-bit aligned, then bulk copy uses
+ *   32-bit accesses.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
+                      !IS_ALIGNED((unsigned long)to, 4)) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(uint32_t *)to =3D readl(from);
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
index 0000000000..5115489326
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+
+/*
+ * Arm implementation notes / limitations:
+ * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
+ *   32-bit accesses for the aligned bulk; no wider accesses are issued.
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
+ *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
+ * - MMIO must be mapped with appropriate device attributes to preserve
+ *   ordering; no extra barriers beyond the ordered accessors are added.
+ * - If source or destination is misaligned, leading bytes are copied
+ *   byte-by-byte until both sides are 32-bit aligned, then bulk copy uses
+ *   32-bit accesses.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)to, 4) ||
+                      !IS_ALIGNED((unsigned long)from, 4)) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(*(const uint32_t *)from, to);
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
index 164a20c5d7..1bb164b6ef 100644
--- a/xen/include/xen/io.h
+++ b/xen/include/xen/io.h
@@ -67,4 +67,14 @@ static inline bool write_mmio(volatile void __iomem *mem=
, unsigned long data,
     return true;
 }
=20
+/*
+ * Copy between regular memory and MMIO space.  Implementations are
+ * architecture-specific and must use appropriate MMIO accessors for
+ * their memory and I/O models.
+ */
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count);
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count);
+
 #endif /* XEN_IO_H */
--=20
2.43.0

