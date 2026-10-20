Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A139606A329
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ZmRhBv8x
Received: from list by lists.xenproject.org with outflank-mailman.1455213.1668763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jj-0000YT-67; Tue, 20 Oct 2026 09:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455213.1668763; Tue, 20 Oct 2026 09:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jj-0000YM-3A; Tue, 20 Oct 2026 09:39:35 +0000
Received: by outflank-mailman (input) for mailman id 1455213;
 Tue, 20 Oct 2026 09:39:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xJ6Jh-0000YG-Oh
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jg-0067sn-Ue
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736d4-bab6-0a2a0a5309dd-0a2a4509a464-2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:32 +0200
Received: from [52.101.65.131]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736d4-be1a-0a2a45090019-34654183b1c5-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:32 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by MRWPR03MB11467.eurprd03.prod.outlook.com
 (2603:10a6:501:7f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:30 +0000
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
 b=mu6fm0b9Vy2c35YKPu6Y30irjGBg1RSs83UpOaaNep0fgGv9d2DYQTg1qRP/e8t8Q6xWQjhiJkhWt9lugxox7RlRA31YExC+OcisurJIIa1o8NMcDZFfNIgqHqenmYQk0MLPlEXKSGdGJ3jv3R2hb/DNvHoMdm6fd44++cP0ma0Jaf2HeEpMsrzsR/0PNtqXnFvyO4cdqDPQLFo4ptcu2OdjN0eE47SiR0ZiOzHI4WeV2p7tpgBCm6QxrPTMx1syevLf16MKFEB4AO9k8pTsRhycbuOTFOywogw8jiUml3TibZhB+Vd3QXuR8GUUvNKbsBks4+skeHOcEUuaeEzfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTpEl0e6T6L52zpNiymwiLPpq0S1h+7UVL5YSn7HJOo=;
 b=IUFjQGStO7hfJvACLlo9Kvq1R32DMWchxKyzRdJYsfzwryiDCL9v33pgTOj+BIyglFRXE0uq+8bsbZNQnkkYn3FLvrZ2h2pc/bOTgwXyNmeNMJNpUPf+f1De9svZQOlO1I8jCgXESxUBsrIhYHQz0WaUgCzN8SYN8VuSWTtjayMKeBhvdv4VkEZc60JyEFkgl47PwQfe2LDtx45XKKGoL1lbga/WzX3Nrx9uiCHkzfLAxoGy9p0464C0DYEuZMGbpqiGNdyDti6cbyn/dFjfMwkWvHtqs2R/VA5B/BTjfQmQcFCjq+UhdKo4N36YrxV3CzWpqZv9fq77WKlcRic5Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTpEl0e6T6L52zpNiymwiLPpq0S1h+7UVL5YSn7HJOo=;
 b=ZmRhBv8xBZ1kO/Mn6wSDC2/5TjFk11yQ6Hfkc2Kk3BgT3QnZJ6jHh4FRPUJSGQHuy+h9SWdbjnaRAbUDOsim17HYBTte/1eOXh+3h+b0LRd6gQlvis8BfiA9dQYQccRcx7ijCToeFt5CTlbTzVr3YL+QS1JuBldb76GKWg+KFtgPehDu21kz5Nk4qWJb80GFc2mc3IAUbO9KiU8kFLMXL8aTxI1eZM3e10PgZZH7dvqGPtzWqJ+EVklZp8Zct1VGOObtUU/3hJImwXUrtYkwcCVKWbbWR2VLw5LatJq8KictKwNpZAUH3lsbsfNpL63w2mOpdJ42yMwb655LtRq2kA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v10 0/6] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v10 0/6] Implement CPU hotplug on Arm
Thread-Index: AQHdYHbnoKYmN5snA0uGKDQEmLPurQ==
Date: Tue, 20 Oct 2026 09:39:30 +0000
Message-ID: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|MRWPR03MB11467:EE_
x-ms-office365-filtering-correlation-id: 2c96a9b7-b0e3-430b-0d5a-08df2e8e0a33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 YEJ1EmcoYGPrCoPfepiwK+0NRsKqU5ZhFoglLQco8RrLNsJk0IQmZN8vEHeNRWhBUAegfohVTorib3ZDyTXc3gDRZ95k3umXuWJZjt7xnj2AS/3aWBQHmcbIlyA3uWgr7lB43+Y87uuVU2X2BDhCr/bhO5ZiKmV065IhP79HsOvCX2pj5j0ky8qsJVlxpPggJ/TZdj9TO6dTYmqwnIyBAUFIW3rcFDP14VJO6lZFAAimcA4Gml/CDRGkn0wQ3ONhVORy26QgtEz1qGXBffZwmGdnNoadv9fEdf5gV8VFBfQz0vrDn5lm59TguO4L4WuxfdiDmBrdrEP4VjAZJjUEEdUbwTs1lWf3mbQtYhPTQNeV8n4HhqYMXZJkurQ67j9VtA021KpR1G+KABTJ0vi+aVaCSWzp7G+7r7cUaNwiNceVfrYlxokvn+OJ1AeGpqEk/TenrMkLeY3cTiKP+Bn6LYA3AY9w59XHRs+LOAXhgdKuxCB7vm1ZIsHfbIZdMsD9N7Cz9fsc0x2HCfzpuzeadnCWsOcE9LqnAYZC6T4rITzn5NTwhJCN8mrWcifmUpqy/93MIvFzZK0WPPu4FHfqkFlC9X+ZI6MjgauTUIVwg0OBog8hnkimAOMrygrKJ0lSmDRgXSorZSOFYru7IwYXDw7H+2HOW3LWdiHHnP2I99O4nKs4wFI/zPirP32KEJlj01laQ9vJMhahFq4A53/WxdWyU8T0NqcL+7NmSouyh1I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PbxxMjbH5DO1XAo0GXyxWtSUFAebICvVtuLro8evucqyroZmEJvL40W6DB?=
 =?iso-8859-1?Q?3RG5ly3WxaCrIDR6cLi6RfAqWLFuf0h8b7acR3hfQyZdCNe/NqllfEeXZO?=
 =?iso-8859-1?Q?baFCNJM4tfZjw1HnoOpnJL0YG9Fss2ocKhrq5ROZ2uEwJmsaIKklfrXvJe?=
 =?iso-8859-1?Q?xlKWL3gNQviktZxfS3n/RtmJd54HmXa6dWOqKjBN5DDBW1G2uoDrYxDeVG?=
 =?iso-8859-1?Q?xAh5D/Wf/nkUMZPYI0/2c5TXeutprA3pNGpVjJtupCi4YfOwvaz8yiRJkk?=
 =?iso-8859-1?Q?Wn+anrCKMUsHRVqTvGQth0IS/rlf4svxgfXIfQAHErD7V4QjRcc6OSY20j?=
 =?iso-8859-1?Q?KQHUXcKnhdLVPtkaDuYcw0olS8PueUnx0q8ip8g23yvHaTJXRXH1ynckTp?=
 =?iso-8859-1?Q?9wBKA94AUZ5kOXIbfCPNyiYzqs8t+9FyBmSavLfbqvVt06aivZk4/aUXE2?=
 =?iso-8859-1?Q?1f5P7i0qgcXlbaEX+p9KlqoxPz3oTpSwFHVNQss8qji+wKwn7NOJIhAQDu?=
 =?iso-8859-1?Q?Lejw8sAlsvwI8d2v3P1NdR8V4TR7FT0kvb7rMLMzL0fFzfb6rsHaOtx0Tc?=
 =?iso-8859-1?Q?PN4ME76r8BUqDW+7X2Vd1MXEy3A4fRFTpnfAqLU2NvSTUGxFlPCe3OWVMP?=
 =?iso-8859-1?Q?S/UKUNguTdMpF05Czhq4mOdBcrw2jYrjU+loDKSNvmiINAPak51Ci/D81q?=
 =?iso-8859-1?Q?y0xHaNeOi4/YsS+AnlMpKM/CgoDW76vIiSz+zAMVWcGwRaLCS0Q0Ctsa0F?=
 =?iso-8859-1?Q?J+7jrZ0Tvt2QJV+B4Ey9DibTjS0wgMnoAURtpCRM2Tv2YL++NpUK40lVxb?=
 =?iso-8859-1?Q?4cG5HJOL+B68sxyi9JleOs+mixOGIKeSQAq2vLyd2IncJ0MZi1R3ogAyJS?=
 =?iso-8859-1?Q?jjfo3DYSB/Yj9Xxo2fGQOyhBWcwNGpAY0bdyxgbM7TYR6JXm7B0h4aR3zX?=
 =?iso-8859-1?Q?uQWKj19d5Lwlajwl0632vkuPwOQtYquUDbWokeuU8kF08cvuOrCDBFzPe7?=
 =?iso-8859-1?Q?8aFvbpmfIzxgEN6+RS6chRl5cvpUbRNfKxihPRgZA7QnZJfyPNmDBFdo99?=
 =?iso-8859-1?Q?aJpm+UgsectjXyync3qb25EyxscMWmrmQjNXfga+Ck00e0uy6WL6xzcsFD?=
 =?iso-8859-1?Q?OIFnAvQIL3WNfHYpwLjp4Fo7gYY9i5OR3G4+bjkSjm29BKhrEdq0/Gbnfv?=
 =?iso-8859-1?Q?xID7q6xxXQYxDp33/aqpWnKQdhu4dYQZHlg0g55Uu1ZaJpZuI3Br4F6QfP?=
 =?iso-8859-1?Q?QxTAlOBcLY/fRIGtpPW0oYYh4rp9hUj/ViVChxP13AGTXi6Iyt1lnSuoth?=
 =?iso-8859-1?Q?SLA2ZYtX+uUG4AIBCwkowbqERIQn13hXSJlzlxejqCQCoyo8dtQfx90edn?=
 =?iso-8859-1?Q?YwItWcyp6UrSk/HtD9bG9zfCwRrgXHJ04wG1dMnmywqfJ9qjqlaEKTeJlM?=
 =?iso-8859-1?Q?n971WyMd1QBiI5fa0gYme+4mMWX8iy5npT6wkEKYYT+zkHuJsvOKlwzEcP?=
 =?iso-8859-1?Q?XJqFg+PUMNfopTwvHytrXUBEjLwO2Pl3SKIYK012dyOppo/VboUWXW+bzp?=
 =?iso-8859-1?Q?SgDhRnZuQSykW0PvrIIiOjJUll2Jw6iXAaNtk3HixSobGFsyMpHr85nR51?=
 =?iso-8859-1?Q?PVvT/ag+ER4BJxsxA99rtmszftq050zFGbhqnLR58OZ0PWUYHAtuxDo6qK?=
 =?iso-8859-1?Q?PoCkKBqIJWWkLj1r+JquEfYXg8eDTQV5hCzpdcLovhsYKBoR3aZJ6V6wSm?=
 =?iso-8859-1?Q?uSfKfzRC2qUfYoYTbpY9IhDY1dVLLueRlnKa4snHl3e+nZKQ4ifmuMTRwC?=
 =?iso-8859-1?Q?D7Ud7MF6GA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c96a9b7-b0e3-430b-0d5a-08df2e8e0a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:30.0819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Crj4e60G3P6uuWnm2DExr6PErxhEXCMfAWHdL40MEQOvNd3KGHocyxxIO6HxYBhXxI+PxFe0m/I/6j7j4KsHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11467
X-purgate-ID: tlsNG-bad1c0/1792489172-BE4DB034-0C96CF6D/0/0
X-purgate-type: clean
X-purgate-size: 2389
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series implements support for CPU hotplug/unplug on Arm. To achieve
this, several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
2. Enabled building of xen-hptool.
3. Migration of irqs from dying CPUs implemented.

Tested on QEMU and R-Car Gen5 HW.

v9->v10:
* rebase
* see individual patches

v8->v9:
* rebase
* see individual patches

v7->v8:
* see individual patches

v6->v7:
* new patch "Kconfig: Make cpu hotplug configurable

v5->v6:
* see individual patches

v4->v5:
* drop merged patches
* combine "smp: Move cpu_up/down helpers to common code" with=20
  "arm/sysctl: Implement cpu hotplug ops"
* see individual patches

v3->v4:
* add irq migration patches
* see individual patches

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (6):
  arm/irq: Keep track of irq affinities
  arm/irq: Migrate IRQs during CPU up/down operations
  Kconfig: Make cpu hotplug configurable
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 docs/misc/cpu-hotplug.txt         |  99 ++++++++++
 tools/misc/Makefile               |   9 +-
 tools/misc/xen-hptool-x86.c       | 278 ++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c           | 293 ++----------------------------
 tools/misc/xen-hptool.h           |  15 ++
 xen/arch/arm/gic-vgic.c           |   2 +
 xen/arch/arm/irq.c                |  70 ++++++-
 xen/arch/arm/smp.c                |   9 +
 xen/arch/arm/vgic.c               |  14 +-
 xen/arch/arm/vgic/vgic-mmio-v2.c  |  11 +-
 xen/arch/arm/vgic/vgic.c          |  21 ++-
 xen/arch/ppc/stubs.c              |   5 +
 xen/arch/riscv/stubs.c            |   5 +
 xen/arch/x86/include/asm/smp.h    |   3 -
 xen/arch/x86/platform_hypercall.c |  12 ++
 xen/arch/x86/smp.c                |  35 +---
 xen/arch/x86/sysctl.c             |  23 ++-
 xen/common/Kconfig                |   8 +
 xen/common/smp.c                  |  35 ++++
 xen/common/sysctl.c               |  32 ++++
 xen/include/xen/smp.h             |   4 +
 xen/xsm/flask/hooks.c             |   2 +-
 22 files changed, 645 insertions(+), 340 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

--=20
2.55.0

