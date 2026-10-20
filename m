Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE4606A335
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=s1h4hTuT
Received: from list by lists.xenproject.org with outflank-mailman.1455219.1668813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Ju-0001lX-2R; Tue, 20 Oct 2026 09:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455219.1668813; Tue, 20 Oct 2026 09:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jt-0001l6-Rc; Tue, 20 Oct 2026 09:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1455219;
 Tue, 20 Oct 2026 09:39:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xJ6Js-0001Go-2d
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jr-00228c-Fu
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-2eae-0a2a0a5409dd-0a2a4503a702-10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:43 +0200
Received: from [52.101.66.96]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-fae8-0a2a45030019-346542601808-6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:43 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8671.eurprd03.prod.outlook.com
 (2603:10a6:10:3eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:41 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:40 +0000
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
 b=Y1tGMxrIJP88P4gjOMCO4+swm8OEVHJmbWGPdHmL5vJrXBPrbHMewaiYHPKhWMGNbqwsL6HzEv2jhtTznrZNLJ0xd7jQow05PSzs9K5u1w1eGxxaW1+H3+YVHYv0I1UBlrHMZRjvxAsNAiBEvMKpuM15epJF9wKTIBBW3Pite76EfniSJ3DbXK53p8JJ2Wifr1oSkthAa+9A9BqoDO/aRkEygA+db14j3cc1vEFUcUBkgUOm14R7Stb1zBXY+PCsBLItmhpyLdP6xeFhF6X8WM0tfciGk9mAVXhBhXJnPUsZbk6ZmKTEn4f7cCJpzhGFJ4hDNvrJB8uC9uBCHXUA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8Vqp7IgRH5ASACw2BY0rPnCZbIROisRLWI9droQYbY=;
 b=EtuCjox+bWUUtkiPuMZ0v9hwYdO+CQjiywq1rYCHmXdoQRsGR1YSpD1ELYQZsZzFnKWpqu+zzRftKKGcBXC+ozYiDoXdjf4ULHZt/RU+CcqQM8pPmq/mWM7FLm/9V6368tHbsnY8F4Hp4ZbHBPpY42sArt0lV84KCwvusDrE4DKABnGZywExnNAbybmrVhDxEto+KuKzKmSMKQKwhy4S8IMuyvJnLkz0q3i4jjIM44ibob7PEo6O3oxcYrkB2revSF5vWiWhdPWS92su5F3SIHTLC9UwmjkYt1iKTj4ZuzYxxFHUgkTnbQ7VpczlizdTSAbjFN6HOeQFVOQ0UkqQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8Vqp7IgRH5ASACw2BY0rPnCZbIROisRLWI9droQYbY=;
 b=s1h4hTuTjHGkz7BYZfwLaLzqq5kyiohYU/HUBPVNJLobru9Yith/816PgSgUQlWNO/eUwZG7jXbZA+eRtMIbu+sblp/rgJ2BKBCinUp5J55eHtDCDL1JhsMv7RHFsHpY/vuWtAB1KqxYwKLrKoKq0vPQNYIQ/L966H7R1N6gfINFWVkWMo3+FBMSXXXceFsfqxxso9QdwMixXeeuSSNhnktFqqdmpRWszq/oRE/ej2RuL78T5VdL13gFQZUSdCxzOOHrrd80LtQffApmXow+DcBGSkkvHmP4NdOWpr7DUpx+baqY+IOfRWxXaOgr5awNORBezw7ivmUk/nLYLAMmyw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Teddy
 Astie <teddy.astie@vates.tech>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v10 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v10 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHdYHboqAxeQuFbP0CPmTz/IKkt0g==
Date: Tue, 20 Oct 2026 09:39:31 +0000
Message-ID:
 <2fb71ea8cfe221f25b1dbbb50bdc5a74be09194c.1792480416.git.mykyta_poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8671:EE_
x-ms-office365-filtering-correlation-id: 45da5fe9-be6e-4a80-c886-08df2e8e10a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10063799003|18002099003|10067099003|22082099003|11063799006|38070700021|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 xvvKk5zGv+RGx2o8VxudvIPTNpTCanvfeGdjs49i6saQT6DkuRv/oeF1oM05Ep11JNWs/w5z7+9mPJpYdx/ZrVTsTh5id/SYR6IRhxUGg2/4Tel31ViNq//LiSSDqfuDW5EtLxAqJcstxezohDp8nVempw7YPfQ0RfCPXG28/K/etxSCoAVtwLqEHZNTvrWUyBnoc2kijtxvPVFF8xft0JYEImtGDp3vM34j85bu4PAS7JD7QMt4jLByVK2a12lCzkCmCH8TL7S2br+wddFbjb+gVIJvfWsWIRDxfZkNL4pYsbIAG6+C4O0ute1qlF4d8NacfV56M4j4+vYHA45Vw5iQtEH/2uz/JDUEB8zdFvN50fOF50/gROQGUUbqrSMXS0A+JO/bNPpkkr7ht5FlxgB+UE5dl6mTgkGr4yB9d8/6ykBsXsrpQCr7zpI2t0cYrNCQ3EJZRU1cqoHaKBF56CCt+PwtBDLi+XECUjAIugLub59k/JhoBu30lugXn1qAr526NFKrTPoZlGJlbVJEx5JitDMXM4QVnSYIJOGq3pU/fJ2/g8qdQvP333F9QrHFGCkk2KqnwkPH+BYLpXg5/1KKWGvXgeRhZkdzn+HjdHVlFTlMp5WjT4TjvCjdc4BdboyoDlP7zeV/t8Ymmu5yEmlzEWxa+zliccVedVEIeJt7JWEzmoQ+jpT6HsplpsbXvJxE3L7xjPPNsyiZx2CLZAWR/S7uvloIKR+dt2y8sAw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10063799003)(18002099003)(10067099003)(22082099003)(11063799006)(38070700021)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iO1RTeOuGdTkh5+/2aAza5V3wenrLnAzbJkfwzG0XTHseDUILVhBksxTSC?=
 =?iso-8859-1?Q?MDnWOb140qiVtkGk6+SEZ5xS9c7k0YCmArMAlJW40K2txDzZkgq4O8ISsM?=
 =?iso-8859-1?Q?HYiiMKvMl/GrDblPE9+toY4XSrR3GTfH3kVttX2+5X3DSg0rm4OnH7yKCd?=
 =?iso-8859-1?Q?WzieaHpX9ATCRdPBSemAqZbMdyQVH3rHVVYxdC3CglqWoS/Yhly2D6osp0?=
 =?iso-8859-1?Q?tVm0JfalVcnBjonT2va2w9bCVjdJBokG3GiYqA6wyI/WXcPWv1WzqHNN8Y?=
 =?iso-8859-1?Q?NxhZ3+qYtP4ZWvLar0Heg8wOeOS2sMtddpizAsSNfgGOq463kgt0WhF/hI?=
 =?iso-8859-1?Q?9N3/NoYlPfPGS/xX1RjkQCA3tqJLm44cgP7MtlEKvmEgEvlG3Ms71VCjL9?=
 =?iso-8859-1?Q?wo/NnUSOFcCYjTaCZdo+SUvirIQYAzDrrDAGBbisp+7kvKfGAhvb8c+vES?=
 =?iso-8859-1?Q?/s/HF45FSmfU0Y9fesEV1jikX3Xqx+mYa20CuedfKLUV1cz8lwNGSneXd+?=
 =?iso-8859-1?Q?tB7ukhfiLbUCtVA4lHbAmRo43djqr5uJcu1Kln9sNE1bkQXDcKuqe2aO0F?=
 =?iso-8859-1?Q?4AfXDtKs11gWmurmIdjdXYUGpwQzknySeV8pLLrxH8MYkIJB0IosU07Lkz?=
 =?iso-8859-1?Q?HNlvneIkuL2/pPenLUT6x3Bb01fhnEqIuDkfjmpGSs0IrphEYlASeCFpPw?=
 =?iso-8859-1?Q?0g9DX3U8I7OFaEgHBIp5HtnKsMnxK2eVRp5555Brj1kU+yqjihyyZkbwJM?=
 =?iso-8859-1?Q?IY7Dwp6koHq4XQ4IyKCpLY5DfUXG+8yh7xfTKE6rBK8AoG5jpbvenaWszw?=
 =?iso-8859-1?Q?Pl9fJiC9C44RaNC9Mla/sp4dnrCs4LHQczi/gMySVMs1TTbqk1PwRq7jrd?=
 =?iso-8859-1?Q?aeAuLH7Iqr8zOoURyLIpmEpRFs30MWBEeTgGZ0uIbCrEJD7jKbiwRCmI4g?=
 =?iso-8859-1?Q?QLMl+POE+HQkoAD3mmMz/FsNIpxgfTj8CKNfSk5OocK1+dJ5p2sEiqPTbN?=
 =?iso-8859-1?Q?1STmR+Ln8b0d1WBwI0PLGCsP/IHN/kt2bCip4DwHlnE6hUbJlddG+hP2of?=
 =?iso-8859-1?Q?R+jjf2lXvk8hqUh3HiPLpVbxTnWYGQcV1h9XIc9rF4ura7KOUJBpGyD1yL?=
 =?iso-8859-1?Q?uuKM7nLk1bt2NXlZ7AAezPehxQWPQD+EI0zI0QTloBW0NSTamaLc+GCwpx?=
 =?iso-8859-1?Q?X3XS+JK80H5q9Drzov87HEBzENyqNba62dkM6uB/WuG70TiaJXWGzjxP72?=
 =?iso-8859-1?Q?Nl/B6G9RxPgNmhlkjPPfUOq4kZeqIOqh7SUWJb2cCwzJ4kmn6eiMnQTui4?=
 =?iso-8859-1?Q?esTsm/J/fRcL8+uHm0rGVCXMxtzgwRq+uh5DN+7Fd3BoR1ZP8aRWzxD0XW?=
 =?iso-8859-1?Q?L+46Hn9WeS8uxlHLXj+/Qyy3Ufe9sP12hvw+vjPKxuEa4nudrJXZiR8vwx?=
 =?iso-8859-1?Q?nfRaYg6wmvGuTs6YP48TsrGXPo3ZNVxQS09Lf+IxmH3Bwk/xQGQwzKBPiE?=
 =?iso-8859-1?Q?r7OdxWJddwKXTyTg+2YzWRUaEBWmrdi9pW97vK5cQSZPw2fE+9cNrja0uG?=
 =?iso-8859-1?Q?60kzNXJnyV1uYCP2YMXI/dkNzp1Vzj+W9p5/gMaTgCUQ0g70YDVxhRqOl2?=
 =?iso-8859-1?Q?YkwotTVxwjRMOClrNcDSkcRzEijenruto+E8aSM7I5ZqSizvTAlnwsD8bn?=
 =?iso-8859-1?Q?YPPWsF9RwsqnUNt6vs4YRgC/U2Em+NnIoI3x01jRz9EH0FA22kj43bcHFA?=
 =?iso-8859-1?Q?lvnwij5tTndf+y0k48Ah9g1sZYsERoBDfchk61NqFYGKUoY2nqk/V4ISDe?=
 =?iso-8859-1?Q?sNbm3jipyw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45da5fe9-be6e-4a80-c886-08df2e8e10a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:31.6825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3R6UH0nLvF2ylHRYnscjCo+9tCN2N+1Qslltjxeu1GYDjDDYnC3dw+bhHJF9yk2M9begBNYUmKAsGdeiNIBHnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8671
X-purgate-ID: tlsNG-33051d/1792489183-6DCD34E9-405638AA/0/0
X-purgate-type: clean
X-purgate-size: 10479
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
and partially supported FFA, or TEE is enabled, as they use non-static
IRQ actions.

Remove ifdef guards for x86 in flask, as cpu hotplug is now
supported on more architectures.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v9->v10:
* rename arch_cpu_can_stay_online to arch_cpu_keep_online
* drop the single-use hp_op and hcpu variables
* make CPU_ONLINE_OFFLINE depend on !TEE, as FFA and TEE use non-static
  IRQ actions

v8->v9:
* simplify dependencies of config CPU_ONLINE_OFFLINE again
* rebased ove XSA-499

v7->v8:
* simplify dependencies of config CPU_ONLINE_OFFLINE

v6->v7:
* use IS_ENABLED istead of ifdef in more places
* remove unneded variables
* more explicit fallthrough in do_sysctl

v5->v6:
* fix style issues
* rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
logic
* use IS_ENABLED istead of ifdef
* remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
from the common handler
* fix flask issue

v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/smp.c             |  9 +++++++++
 xen/arch/ppc/stubs.c           |  5 +++++
 xen/arch/riscv/stubs.c         |  5 +++++
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 34 +++------------------------------
 xen/arch/x86/sysctl.c          | 11 ++++-------
 xen/common/Kconfig             |  4 ++--
 xen/common/smp.c               | 35 ++++++++++++++++++++++++++++++++++
 xen/common/sysctl.c            | 32 +++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  4 ++++
 xen/xsm/flask/hooks.c          |  2 +-
 11 files changed, 100 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..039577ad02 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+bool arch_cpu_keep_online(unsigned int cpu)
+{
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 82a289af85..2c2e9412ad 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,11 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_keep_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 3a7953593d..2307408c6c 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -65,6 +65,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_keep_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 572b39b01c..6c33567cb5 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -44,9 +44,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index e3c4c0d5e0..b56d8dfd36 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -417,37 +417,9 @@ void cf_check call_function_interrupt(void)
 }
=20
 #ifdef CONFIG_CPU_ONLINE_OFFLINE
-long cf_check cpu_up_helper(void *data)
+bool arch_cpu_keep_online(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
 }
 #endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 10d485e633..a4254beabb 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -121,13 +121,13 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         long (*fn)(void *data);
         void *hcpu;
=20
         if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
         {
+            ASSERT_UNREACHABLE();
             ret =3D -EOPNOTSUPP;
             break;
         }
@@ -135,13 +135,10 @@ long arch_do_sysctl(
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
-            break;
-
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5713dc1f9c..329bb07ae9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -648,8 +648,8 @@ config SYSTEM_SUSPEND
=20
 config CPU_ONLINE_OFFLINE
 	bool "CPU online/offline support" if EXPERT
-	depends on X86
-	default y
+	depends on !ARM || (!HAS_ITS && !TEE)
+	default X86
 	help
 	  Enable support for bringing CPUs online and offline at runtime. On
 	  X86 this is required for disabling SMT.
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..af532d4873 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && !arch_cpu_keep_online(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_ONLINE_OFFLINE */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 8fb5ff0af3..dd21b6ff7e 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -475,6 +475,38 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        long (*fn)(void *data);
+
+        ret =3D -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+            break;
+
+        switch ( op->u.cpu_hotplug.op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            fn =3D cpu_up_helper;
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            fn =3D cpu_down_helper;
+            break;
+
+        default:
+            fn =3D NULL;
+            break;
+        }
+
+        if ( fn )
+        {
+            ret =3D continue_hypercall_on_cpu(0, fn, _p(op->u.cpu_hotplug.=
cpu));
+            break;
+        }
+    }
+
+        /* Use the arch handler for cases not handled here */
+        fallthrough;
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..525099e182 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_cpu_keep_online(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index d65ba0aeae..a1eed309b4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -957,7 +957,7 @@ static int cf_check flask_sysctl(const struct xen_sysct=
l *op)
     case XEN_SYSCTL_getdomaininfolist:
         return flask_getdomaininfo(dom_xen);
=20
-#ifdef CONFIG_X86
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
     case XEN_SYSCTL_cpu_hotplug:
         switch ( op->u.cpu_hotplug.op )
         {
--=20
2.55.0

