Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDFC606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=hQ1mYDZx
Received: from list by lists.xenproject.org with outflank-mailman.1479828.1683721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIx-0003qU-LK; Mon, 09 Nov 2026 11:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479828.1683721; Mon, 09 Nov 2026 11:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIx-0003qN-Id; Mon, 09 Nov 2026 11:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1479828;
 Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQNIv-0003pv-UG
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIv-003aoG-3d
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:49 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aaa3-e002-0a2a0a5209dd-0a2a4507d888-24
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:49 +0100
Received: from [52.101.83.89]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab0-b4ea-0a2a45070019-34655359e23e-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:49 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by BESPR03MB911570.eurprd03.prod.outlook.com (2603:10a6:b10:147::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:47 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:12:46 +0000
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
 b=d+SyKMeyqwGTum1O25e0NBhMXJNCn4T/JeiR5zqL2V9omk2ggceBE13OygDR8R7HqjFZS/aExBYy13Y9wcQllwCHX9QmvNHvRF7ZNmE8S6s0kEv5424VjXdJ/s7juUbghuNfBquAl2za0TivoDKv3/rNYWhGmoqlNBB0ajbpoiUb+GlzwQJSuhxAFq43MeNlMAkM8ehsF5Swbc6IQNwHZzEVD3UCDrD++7+zAIFD/BiUuAjBoDjt10uXEMH8Ahq4xlv/bv/7s3clujmqhCFDtirF+tx441n7f8AlhdTnMmmsY1W/PCjOyghxiVavUw6ikdz2iY0jwprURAUxMHy66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEUJK0n0r4jFVIg24kf1eT1auDpZUOkBBLTVjRAU6ko=;
 b=wxL1rbObf3Or5Euvht8NPAhzt2vBWARAr5qD0wasgdAQdUfq4pwl3hTxIV+/Cheju7ghxcowSA7AfIP7i+LB2xr2WWXFUXX5HPJHRpJZ+ExEy69CzLkns/j6LdFrY0EXXNDJDQJuOQzPyUPqPuMoHjf4KhlrsB+L3EFAiL8JWEsyX5lWmngm54A03p9xg3GOGv4YdV9hEIs577MDFaHCDQQHBLofe8/oRk6R/OTFhEf7caEL0z9J7sHkjNutswN/mTPG/O2oxx16tG3LjiD7nC3D+5EqY9jKf5hUk0rHr+A/d9erAHjLRSw+8P54L2/Fx8KqS140MmD4RP1Cn6XJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEUJK0n0r4jFVIg24kf1eT1auDpZUOkBBLTVjRAU6ko=;
 b=hQ1mYDZx0oKZ9+OTWWGU3DfgkhwuhJ1K9a/CApd2/F7w5BXn96XoC1mw+D5Ik59D1He7VcdVDGd5jetIKvSnpUKKQC7G5uaHs7KtV/9VvHBAd2ywPsntd/egtBkeKYdo9COYvvVUg9WNUW1VectVeNhGxp4DnLz9uDunWnzUY6slwujZMG6zNta6yHVZvyU9yCpw3MEJC4I7+XmXYK+f7eVL/aTItnIH3qIzU4gpbIZp5Ym2NTUTFO3xkZDJG5wr4/DBSWJL0Yk85w1GU+fU3zIjcZRXOv092LsOYPeV5wyQFxwURT7zKvK3h+Tc+bENg4FAqOYKk7NXxdeu/QuwSg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v11 0/6] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v11 0/6] Implement CPU hotplug on Arm
Thread-Index: AQHdcDs/VyoaD8po20CRDf6/YgiIPQ==
Date: Mon, 9 Nov 2026 11:12:46 +0000
Message-ID: <cover.1794222015.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|BESPR03MB911570:EE_
x-ms-office365-filtering-correlation-id: 9f2e45d9-81f6-40f6-63d9-08df3e526257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|6133799003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021123027099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003;
x-microsoft-antispam-message-info:
 oBCYA1vKO3YiZyl8G4NpFUvkAhon65uF2hRqjWhX/GMmq9fo0HN0QzD6gLlJyXVyjnuMmYizfdSShGrUtrusQfeMSlVguLQjMKaDz8Ft/gDvXbGv5QNldA0Si0/kkLtBg5SM8Xh6Z69DU/2fxnoht4H13qVDnx+mx7f3y/rfbaP9HYcfRMC61x+7sdoZDEPRseSQ7cn0nv94+C+J6u/6yxJeBdtB8QR/Zt3Lh3FgB5b04DsHrBfii57TrD4yI+Wq9bqJvN3vGkRZNixIU+H/1VZFfUZqZM1EHA15/5DYU86k7UOFeRR88BT3MMqAxxVPopm3F00uJA71vcnFmtHllg9YmtQaz1qO8ki9yxrAqPLMxNPvJRV2LBKyf9YtPW2SxWAWsdtbUFIgbaww8QKXS5W0cVCDZh6DmZ2SI5CYo3mjwXaMQfk2JHS1UAm1aHyi6UHIPXumvxLnM7CjGSHGq2GhXTFSrTQnqzgTBbHVE5xAm1qut4Tt+9eKEKbN4+dKo7z0WiU+JIG/rXiAQx4Q4IIz8BhO5m2b7wjL+8sbQfHnIsMJU6B5DQvEWNTcA6mYSruKeqoY6jrISi6Pqnvz5TFizR2lY1hVmo/OitvmEastlNm4HdV2Ew00aCxrrzkg6EtQ+VRlWPVGZ6FGivzVWxcDb7pZ1PCFwWHcllCHfkUa+HcWePIe/RfoKpFxgtm45IAJVuJmOL+GFkj78Qr63U/6wk6dpaY5N9nNfqW54Z8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(6133799003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021123027099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7gdOG4FJGtmgzq7GTQEg4GMauONJUtSfBYuMn/iFIv3C0dy5NoFl6jS8XH?=
 =?iso-8859-1?Q?X470On2NYGUtRbtaCu6gOegmuGcaFCSP5Z5yLGxSPKxsvHwpYR0jtGbG8H?=
 =?iso-8859-1?Q?6TokW3XQWRyQD0f3T/riuuVqQr0my6OutfQdirlKPy/io2e2MNK1h+IpIV?=
 =?iso-8859-1?Q?KJ6zt6sQDyiz2ftQYsILgFoDFvQJLbaF9gExlJyrDVEix8PaVOqrGoEY07?=
 =?iso-8859-1?Q?n9X2625qkAC+Gz1QX8t3BzTdgzV2b/htSRAQ0p6j+XpUFyAyE3UH3p2PEY?=
 =?iso-8859-1?Q?RkDz8Vxy5Fif5U8PApQMC+RU7ySv3YiCxNrohIF+lvGg3/FTan6yy2dWg+?=
 =?iso-8859-1?Q?GAm+/z2nKHsd3aLRuj94rCtXHPDpvQ1tXdod28w1ll0VqWYDwxAy/IbvGq?=
 =?iso-8859-1?Q?xGhOlTP20QRSDW5aGqcVei6oDwltXQKsxDb3ZBe0NAsJNP7drY7UdcsEuQ?=
 =?iso-8859-1?Q?kA9vQtFm+QHqFr3V37O+42eI8eMbK1KyJgb48ca5trMh7RYR/Ud8FvCKhd?=
 =?iso-8859-1?Q?XDravIH6TtB7wHsXRnbg6uZ49+PvetnCQMVRgZWm4CxnAqiM0e6kiTLUSW?=
 =?iso-8859-1?Q?x+kUvwbYg50LWGdEphhp0I/1E9vjmePfTn1PRd5X2HHKRUGgES2SqTLcPs?=
 =?iso-8859-1?Q?bsa94o2IW6sTTsqYYjdjD5TigDDRt6kvbQpltERV1s8C2i5KAAFlrQbm41?=
 =?iso-8859-1?Q?sgpCwuVOmcrVxGXteU95I2A4Asm93U+94bm3BCghHaVRXqNgpoO7PYs+m+?=
 =?iso-8859-1?Q?agTwiWwDRfYpkUs0Cca5okPhIvJLvlhMkrXYQgFXCK/f+pKxGcxeIGznfV?=
 =?iso-8859-1?Q?C6auQLiosNIHW9M0YQgUaLo4c0Zbe30KyruEl8OaYWtXMtaT3G9HoV8Jb5?=
 =?iso-8859-1?Q?DOANI/96DoV7RPD8Zg7oKwuj0AQYTd6JweTmDoCfuCqjvgcYzqZsSPzqLx?=
 =?iso-8859-1?Q?UqMOPrcoq0OC4KxLcmTuuxj5/uMjWxElPRGxMjaYQF0g1K/zloRzvultXI?=
 =?iso-8859-1?Q?KGxqF3ZIOwZvR8PH8a7eqlwP70DTg1KBjCsl82+t+OWvnTJ7XPWOe10JSz?=
 =?iso-8859-1?Q?1A/r3NudlN9vW6aI3LcgthbYGQsQdwlZaHnaeqZHYaZn8vpCyrxqcs9207?=
 =?iso-8859-1?Q?o1cUh07+8pDvREu/Ray78XQC+8ma0BqJDb46P3JW+mczvfDFVqn3TVibdI?=
 =?iso-8859-1?Q?l7ekXlR7wwah15c/a9a4JcHPgeWFprzXzp4rnv/s9Qu4iPKlnJwvOKqIdl?=
 =?iso-8859-1?Q?g1+RIYh/louX4GYlkXw7qfzBFGFpeSMwBoS5FMzIfLU761qIFlvu692X07?=
 =?iso-8859-1?Q?bgv7DoryFJXgk1FXp53PnPALorm8gXpDwFgIPmygK53fc+wOjViRS/CdOg?=
 =?iso-8859-1?Q?D3IseFC5SPVvJejsAFzxLOS4nQCUtf82RQZpDj6HvH2pOH1oWYrxsDzYxs?=
 =?iso-8859-1?Q?Y1KkBpGohBstNZTgRqUSxT3DIQEhuOIFcpT4KRJtz0hHpt5TkFuVg8wfV9?=
 =?iso-8859-1?Q?dyC9oxr4easwIYAHythOuvqLe/gBr0mmQdqS2U0J6TlZYn4JEGqQh32q7y?=
 =?iso-8859-1?Q?Iq+FjQH9m3nhEkTQsDMURpcD5HO6EYr5nJA9bo4uUqo+sVxXGDp8fsn+qV?=
 =?iso-8859-1?Q?+KqEJXUGT0nEHgx2sm+13QId7fXVenYrm8Gm+wTlj+Zfl3YmWG3/U9X0qX?=
 =?iso-8859-1?Q?jX90IcrajDg2bvZFtmFCVgzKN5uWBhZ5gJEUViPJiiIf5xsItZnMKColzZ?=
 =?iso-8859-1?Q?Msfj5zK4m4QguiGLA1CtSqHoxtrGlBDIGYFUvLRjbv2s548mLrhfsMMVsU?=
 =?iso-8859-1?Q?u+1f0+HViw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2e45d9-81f6-40f6-63d9-08df3e526257
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:46.7968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GkUU1Dlg3gFPLZX7wa6k1y4xUMGFnH8hl0nSNHVKz45Lg/F8cx1uhp3I2A9jLVFE4PMmIGEN0rc+mQEHREH49g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-ef75cf/1794222769-36AD8AE4-DB2EDCD9/0/0
X-purgate-type: clean
X-purgate-size: 2441
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

v10->v11:
* rebase
* see individual patches

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

 docs/misc/cpu-hotplug.txt         | 102 +++++++++++
 tools/misc/Makefile               |   9 +-
 tools/misc/xen-hptool-x86.c       | 278 ++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c           | 293 ++----------------------------
 tools/misc/xen-hptool.h           |  15 ++
 xen/arch/arm/Kconfig              |   1 +
 xen/arch/arm/gic-vgic.c           |   2 +
 xen/arch/arm/irq.c                |  70 ++++++-
 xen/arch/arm/smp.c                |  11 ++
 xen/arch/arm/vgic.c               |  14 +-
 xen/arch/arm/vgic/vgic-mmio-v2.c  |  11 +-
 xen/arch/arm/vgic/vgic.c          |  21 ++-
 xen/arch/x86/Kconfig              |   1 +
 xen/arch/x86/include/asm/smp.h    |   3 -
 xen/arch/x86/platform_hypercall.c |  12 ++
 xen/arch/x86/smp.c                |  35 +---
 xen/arch/x86/sysctl.c             |  23 ++-
 xen/common/Kconfig                |  11 ++
 xen/common/smp.c                  |  35 ++++
 xen/common/sysctl.c               |  32 ++++
 xen/include/xen/smp.h             |   6 +
 xen/xsm/flask/hooks.c             |   2 +-
 22 files changed, 647 insertions(+), 340 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

--=20
2.56.0

