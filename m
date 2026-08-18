Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A22C5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393698.1632523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUq-0007nC-11; Tue, 18 Aug 2026 08:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393698.1632523; Tue, 18 Aug 2026 08:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUp-0007mb-TR; Tue, 18 Aug 2026 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1393698;
 Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUo-0007eo-08
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUn-008KNP-D3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:33 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:33 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVUPR03MB11425.eurprd03.prod.outlook.com
 (2603:10a6:150:362::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:48:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:48:29 +0000
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
 b=EokPi8gvXEpmR1NZdzLo3h8Tj1Oozwt3FD3VmJFZltcqdyywscUVHoN7UZnGGjn6RQG6IPjc4SH69UI/8F/ypYgbNVfEhpwHypfrSgJjVP3HjxxbenEXTerUfMsiDinUNAvzlOGfc1EsKr8lDnIl+Yo2knBTLYpwuKnKevWNZWJ/TWFWu4QKzPdWX9cP15Mmct29j1D/ST7HYrun+xgE1U4glp6GJ5y7ysKvw3va8ceG9RIMxGDs+nyJcJDwuEDNv8i9XOHEhktm0Ve0odVmZYgUZEgiQ6d2/PdW7/ffAXTOJdkHgJQp+Fwpdwd/ZE4wnhS1imiGALAOEMQ7xvq/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isjpLrgeDc/7t9NzHLhmfoXOeBmp97fvsmTC4cCrND8=;
 b=keTaaUy4uZwdIO8+3Q61c0a/yud41MW0knPxzegKdHp8CZYeefI7Kcai/w2I0lyxyhRvkdI9WZQ5AbaP6ESRwQzPTZeJFWhN5SGqusKy64xGhf/8kHfQWhQWf6vE1gwS78iRWziAiv5yKh1UZ4qTpbNckrZwY/OtCJII/UH3mGV6D2cvtslH8Nf0mB5puUQZURzIqa9YsO+z8Hq5RjYckKv7Ycz5rLdnHqKGcGK3ID4ZJD4Kr1bY+241WJycX3IMoFxMSr+9WaSC371ewgUnZ9IuzC96rSAK8Ct2S0GOr+7cSmaIXsWngQcrpfbk7GySG1oqBxdKlI34yzRh/8ZoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isjpLrgeDc/7t9NzHLhmfoXOeBmp97fvsmTC4cCrND8=;
 b=LCwnMbYDODiRop9+01QMlVVjSM2HcxkziiQdGlVJ22INCSoKb9xX53PegNqguXu6nwboq+uJ46VTXeaR9SSm0CnyzdFG/hPUMStLjy/qmJ8W/INvzms2sAY5v8vt27Fc13dMBH1bRKjGAaDQYWU/IcPtAnJWozfo3xIX1BnAV4iURdrw228Po1bB7IPTnQ9vJuMeKrRZDCVPq42PVUrZQBfQ9lrz3XNH6LracQs+TXd/XumeRHvqpUeGlqSSULwGXE3K2kBWnctqcTnQUUfdKiE95cDx8gZNeoDWIt3Yvsq6UZBtZSwfjrD9Es3FTzXlkhQ5mEV8AVXAmn+Z76GrDw==
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
Subject: [PATCH v9 0/6] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v9 0/6] Implement CPU hotplug on Arm
Thread-Index: AQHdLu5XTX2wVWAf/0WnWqy3wZ0dQA==
Date: Tue, 18 Aug 2026 08:48:28 +0000
Message-ID: <cover.1787042017.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVUPR03MB11425:EE_
x-ms-office365-filtering-correlation-id: bc66cc7c-eada-494d-e49c-08defd0579a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|56012099006|6133799003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 t99q6yPgpznvuNdzvbMX7ogkpQoJAejuYNsTHKblEeIr3Sjp8rH7xRBfXlvr5ih0tN9dotyECK1sp5irVbQvJXgGrdzr2kvJw/Pw1Dyfi7LtLwOeIuveYb5wrSNgQfaOvc/o7NNX8C1WD1oiMLYf5J547KCbzIP8hxNmhO32CosLAj9HGY/cwAeKdOPejJ6flQbI1I9vy9lCXvuyIefYAPpmcVVWYDOBWDJLOoK9S5ZHmbKASeCrbGU5EQc0aPV4qk8urxZRpfJ0JQOe0qJzTR9Tv+bWSEtKsh5AlLNSWBtJJCkG6MF6uwJYNIaIKIjD7chYhavRYNTeiT8w1Dy5S7G8hlx+BcVFe0rGpkxoGIvk2vu1sQIsfKcux4RlA9ZpeCEgk7QsYb2n9Fszl83qgy0oUYqy1z0JMOzWVgb+neWbhXtcPlR4LiiEAZU79+rPpkJBuk8FpRSywGvM0JclW4mw7DRktl3OgOuGqvCPJ/mZTVmobBFcbgrjn9tnkFp9y5h+ZdQh8Q4yhxaRddSakgl/ETGxJTXTyqV15LAkMK05pn7kfg/YnswVfWwK3wSvkT06s8mgx18K4mwGxeZKEz+RDFwkAIPdnduhtLXmbJmdgyN9SOsfwikoL2D3Wvr3ZLrGFhMs3LxQ4npJYRY9r4B3gmn8fFyopYxio/vug6adPg2z8cAGHzW5DJEuL4jHVO1Jksid/FJTuali+VK0MJQNo39IUEFJetfgIuTsKkY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cXOLpD3STbjA/B5vp1Z/m3OOUreEujvanqvsYZrm9C8MF2bKNDY/Gq9hgX?=
 =?iso-8859-1?Q?/4Jny3V8zcpYulImC4T4q8BHzft0R9tWAiHrXBSxspXsF0qJpKoHG1DwsG?=
 =?iso-8859-1?Q?/bEe4r+ftViPVXFo/bu50CYOozMqM7OwnA5g+IPYKf3D4BAOQG/sl4RE29?=
 =?iso-8859-1?Q?tx6qWzPCKzNin1T+t4HdYhSZ6RHyZJqhsz4Gv5B6N7MJwde8jxBfuOofHP?=
 =?iso-8859-1?Q?HmdPP2XD3a5TAH7FA+gjCjeVahpcrrzLOlfQLTzrIfNlj+78pa7bwM8I+U?=
 =?iso-8859-1?Q?DTBJg7d51J6lHoyRrxveIx2Wiu0RWE1VJdf+szYx2jLm7bGoN0AgKkVZTL?=
 =?iso-8859-1?Q?okVGQip+9YrYzwNZTnzhXajbRCtcwtfAJH3P2tDDK4xeV8zN6YZMOc6zO2?=
 =?iso-8859-1?Q?+dsdYvE9ldKa7npG1Q2AlsKWkvGZ+G3IpkIucgRdWZcETreaC+Z1kx0sjn?=
 =?iso-8859-1?Q?8mwnjSEgQgBbQV+P++FPZaaLEKSYWEvoFwP9/NEKGRdI/BheLaStM96mbL?=
 =?iso-8859-1?Q?47p5vVaPImGOf0GGPaU3qjDvdXMgzLHBISfqttg4gpExriJxLTTPjJ1YJX?=
 =?iso-8859-1?Q?xhXC2BDyjiNPSOwcr//H2cb2zfdqR+urLLUPVD/zQpDl/wLxFuCwIHpHQ7?=
 =?iso-8859-1?Q?SAL0peCT5YnJLSs8l85Rvhaad6us+Ho5Jk9Kg89v7GSQtg/pBloIhPpyFj?=
 =?iso-8859-1?Q?FE3ZXhlLatVVsvoSVc+PtkOfyvo/DmSBfxJMF7QAPvz/XxcFtwJVRbFZh/?=
 =?iso-8859-1?Q?3g9AGHWEifk2wIwU4ddl9oyl7VaIym/gcAdRs8CZlMTwSIs2apyvGuT5Kh?=
 =?iso-8859-1?Q?znEqM8hd/paugtuAkbjz3nzlbhONVnQKI8WIwMzeGyNNT4js/Ge0IEr593?=
 =?iso-8859-1?Q?3dR//c9SoARoJMjvoYvq5051iGmn0bJqipEcR0sAQjWOXtHW8G005peS5g?=
 =?iso-8859-1?Q?wAyLC2FtDA88pPLGOfjeFAzpJ0sHKrJN2MBatzJjlai5RPIYUE4NShsLMl?=
 =?iso-8859-1?Q?JjXwgAytOKPro1XrcEZAXM3RsiOJNfS9IfoJHLKOQYQe4Ktx3PgKPqQxlC?=
 =?iso-8859-1?Q?Jtt/ooGfltTlAo6sByx0gjK1vkIQui11r4SZPaZYdJFng9qBk4n5iPhrBy?=
 =?iso-8859-1?Q?XBJ8YTAwVKB72upyRrsvV4vc5Ev/szXPUCS6qCvsMfI9Wm/nM0b+ZJ3+9E?=
 =?iso-8859-1?Q?Sgg7EfhVwn7bNIiD8d81Z6cx/5BtTlAHjIx1EZR2i2JFOHgjFyl9WyuTBf?=
 =?iso-8859-1?Q?6oyJORosHCgoBIXddwyzwP6fuqbrDjmQ77vk0h9ExwUDViSayJaOo9we2i?=
 =?iso-8859-1?Q?a0eXf/KAl3v5NcOV/zlSYXA6JhUp4iXN7clquseuuexkeJ2LBec3+FCrF6?=
 =?iso-8859-1?Q?VUcscrSKUjIwRxn9nRC7rYKZh1VVnz6YBg1ouAeec5yhxenspU5yzXnfyG?=
 =?iso-8859-1?Q?xDwdZB1zSFeHp48ogm3BxHeSwmMAzybLORMRnE6eU7oK6ssNVgiZKgSdUZ?=
 =?iso-8859-1?Q?yBDa9g6g6NHfgKM9KSFF2s/fkFEVaPo1X7SST2a7R56K4zYBV3PxwNttLH?=
 =?iso-8859-1?Q?4LuVmgkaopC7zvSfQDUFqjEVMrcDVxH/Snop4LKyJyVXE1vDZRgD6EgTO7?=
 =?iso-8859-1?Q?5gFSfpuiNAyKJmcjgd0HhNgRmRepFbwKVMpkI7xF02EyTe641mm1IfKNZR?=
 =?iso-8859-1?Q?sfOFE2+QZE/dyQsjFSp6q6heBvky3nhow/EJj7OJO5m+iQWshkNXOysJ5o?=
 =?iso-8859-1?Q?fSqG0g4we9FyF1eY8LxFE3PsnfgvIw0Cf6bvBOk4oSi80ZpZjkYFsFlMke?=
 =?iso-8859-1?Q?5mNjKzeUSG68fYT64/0iknSpOhuzFqM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc66cc7c-eada-494d-e49c-08defd0579a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:29.0659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxW5S4wQ7r1ID2SgNaCeCDWiwF6gZm2BhDtgtN2EXda5NSlY7s8Wg7pqnqvtEfvFVaTQjXQxx96vB58cKmzPNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042913-662A92AC-5B29AA9B/0/0
X-purgate-type: clean
X-purgate-size: 2429

This series implements support for CPU hotplug/unplug on Arm. To achieve
this, several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
2. Enabled building of xen-hptool.
3. Migration of irqs from dying CPUs implemented.

Tested on QEMU and R-Car Gen5 HW.

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

 docs/misc/cpu-hotplug.txt         |  98 ++++++++++
 tools/misc/Makefile               |   9 +-
 tools/misc/xen-hptool-x86.c       | 278 ++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c           | 293 ++----------------------------
 tools/misc/xen-hptool.h           |  15 ++
 xen/arch/arm/gic-vgic.c           |   2 +
 xen/arch/arm/include/asm/irq.h    |   6 +
 xen/arch/arm/irq.c                |  69 ++++++-
 xen/arch/arm/smp.c                |   9 +
 xen/arch/arm/smpboot.c            |   7 +
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
 xen/common/sysctl.c               |  34 ++++
 xen/include/xen/smp.h             |   4 +
 xen/xsm/flask/hooks.c             |   2 +-
 24 files changed, 658 insertions(+), 340 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

--=20
2.55.0

