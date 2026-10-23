Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE8606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 01:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=coVDb+kK
Received: from list by lists.xenproject.org with outflank-mailman.1458730.1670789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3n8-0003tQ-Su; Fri, 23 Oct 2026 01:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458730.1670789; Fri, 23 Oct 2026 01:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3n8-0003tJ-Pr; Fri, 23 Oct 2026 01:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1458730;
 Fri, 23 Oct 2026 01:09:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xK3n6-0003tB-JB
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 01:09:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK3n6-006UnM-06
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 03:09:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6adab3de-bab6-0a2a0a5309dd-0a2a45068f38-2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:09:51 +0200
Received: from [40.107.130.105]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6adab3df-195a-0a2a45060019-286b82697665-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:09:51 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AM7PR03MB6611.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 01:09:49 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 01:09:48 +0000
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
 b=yfPDdgdatgDFo7ob40dMv6c8K2AGww59ea7QXrz0MjvNj9QKPn5sQgzt7097J/2ws+m/LB3pW44aXFtas9SB16qVUQKaiS5g+xOR4gsjystKPaGLEslyG64Nq7rAXqX5aoH3HswwaLlF2DxH73T0JAV1R8ZwyJcDofkcxZJUiz3LwRc2nloqUK/yIcNklhv5283JmYLcZT7IrahMrsc8bb7Lm8+c+MCZaywuL4EhTbwqntJoji5qDbVRVXt9fQK0AYk+kdgTbmls94Uhd2mNEDFK75VW7iepNSLQvAQ1DcooCb7KEFffw6SAeWcfgRw2fkRG9pnEzl6rwdeQm7MS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGj4dnDvYKWplnNAwD1KsBbSXv0yNeTxXKrFUFyfYJ0=;
 b=TRHm7OfeyEDXozJhhkAWkJvRW6RSV2JWkvjhLPRkOOkQ3K4c0fTfm0c71htM1045PwsZz/xfjOx6xFbCpt8TBvwIDW5kym5IMFTPTtchlc5QG3TOP9rCmROwZ8J/+UgkYNmNTjeLB1s5E2QKbPsosm6XKgBsv4wRm2L1JLnYfb5NU8tsTjP+bY7RG/8pLqxfsn72RxbH+zpSajNuM+iKBc8UcNanhviuKLnzGMltGlHrSi2u5JlUm44t4lqvKFNNnYoH6RzXov7nww3VMxASJFlHvWFg9x0qliVq+8HVxqSAsn3s6g1FYDSYnVrTnjk1W1ttGOrpw1NklL0JdYQpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGj4dnDvYKWplnNAwD1KsBbSXv0yNeTxXKrFUFyfYJ0=;
 b=coVDb+kKvErAlnkMpmT5/UzGTXvB0d6GBaUjIo/MpYkcqC1BcJUmsopxFlDodULUCSbyqdA1NIL3Ww3Tp23ppkS+Egb4KHDZW5PXiwYR79VOuT17ItJuSiwbcWxNfWAj8Ac7MRfPCUTzv/1UO5HmKInkWuR7Y+p7j79CFNn/IRzyQBRzb14LxiUdvvfKGfHbWaM9k3+jQLDByyVEsWzOsd2HvlOhYF9wMeNTEnUzot68TrSlIP5aAHJ4IAmhe0NxBIZT8lxaprHVkQ1botxtSwSE5Wliipq+xZsggcV585sy1ytLiiP+TbIkO1sn5b1AXO/Ad4MmKl5r6oI9YuoPlA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v10 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v10 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHdYHbv9KB0zIuWzEeIKs1XLwNTMw==
Date: Fri, 23 Oct 2026 01:09:48 +0000
Message-ID: <87y0bpte78.fsf@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
	<2fb71ea8cfe221f25b1dbbb50bdc5a74be09194c.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To:
 <2fb71ea8cfe221f25b1dbbb50bdc5a74be09194c.1792480416.git.mykyta_poturai@epam.com>
	(Mykyta Poturai's message of "Tue, 20 Oct 2026 09:39:31 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AM7PR03MB6611:EE_
x-ms-office365-filtering-correlation-id: 2d08fe34-9c81-4f27-2f7f-08df30a2555d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|42112799006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 emwU69X+ricIwUPgc4fTOOoI7IwvjBmNM5AF5UJ3mo9OfVgPtQ1W4xpyCaQmtYBbO8sw0rj9kLLG5N7yhx+cdgsYrMWeymsrU46kjw7sLzgRdV4gAx1Q9MYUn80DZqbyKiO9+9VZdyJazD/6IsOLXUz2rGZVBfQ5/tj4UkQl9HW94j3oePvmY3iKKqgw7JS7DQ9tH7NQYLnXeWXlhJg4ZMJEFfLsO7MQTOTHT5nEG4MgNLWrtf65kM1ZAxUXyIQB7Pu6/P61OkiO7MiBqeNGundQiVrRX2qY8Mx6/UFeJYrUzLDNq3ppy86I/2YW7H4bzv4PqeAJUqBI/nq8V4tzhX5W43Y/EhZIgaL6i+x1kPrXoGHT147E4xGYWw7vwgxKmUt2iq5Tlke6u/pYWRX66m4y/cDLJ2SsMBkmxL+sZXjjOcJ8TLD5scfcSaMx06OKXYoJOzg9e/3w4cGC/XM6eMFM/OxddGeyMZxRfE7NRMcSq6vgyohAgzKUzUT1+lnp3DyqA4FaVd0mFLXMu6MP6GgLpYOIGZPPDXOKvkwvfQvSLqckmkCKRn18Wv/Y98d5wTxDgJZqfJeMAWXpQE7hnl4JVekoaMyjUc+0WtdMhbuOUGnMJMPB+qki8/wYRmeCeEYBKsY82em677bjrbVBDMqMogBIDG2IdShqvjF5HGFhqHc+xM6RinPeou9AM3dZfiA8Si/1Q4V3GuFVbyEAmXe5rHr1HqrcddvzKiWZdMU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(42112799006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PCBhYC1Yqsz6KWyWhWWQg4Vtc6ivhz1zrrXhGojX1415fC2U7W0RovTSOo?=
 =?iso-8859-1?Q?9BrRk/y0yKDRiNvWGJlAR1pwQqKfekXa6FXvzHTTjcr+S5+FtfH1KUzqP1?=
 =?iso-8859-1?Q?xxqe04okEKZcCl3DdFQTIQcwn9KTWaKiU9zib7rhkcQurlg2aLRnbfag63?=
 =?iso-8859-1?Q?bj9GlfvP0p40M7lemN5S0BCCXpUQGXSnGEL1dOymX5FaB7LfUpVLnvovEB?=
 =?iso-8859-1?Q?gks88ndXzxuYbAt2HMGr3gZjJUoVKFa/ZDWnxEymSVcfcfOJcTWJY2/PTf?=
 =?iso-8859-1?Q?M4JrANslT1fSTparLdLYj78j37/KKJ7rYBucEjOw0Ad0dH9AfMiEL7augo?=
 =?iso-8859-1?Q?LVjRfia9sJuBSaW7q6hZ7JbnmPNAhgl1kehFJDhlafOYUwN0AWNEfQVYXE?=
 =?iso-8859-1?Q?kyvuGF+ZhtQdN9LfpzPPLBnHShoBaByXvpV0WX6CQxVsqa4ibYecdroyxR?=
 =?iso-8859-1?Q?i3P7ODeKcohucRxSf3zW9mwZ8E7yKs/dz87ETiz93njiIoY0Jg3RJ27iZJ?=
 =?iso-8859-1?Q?jlERVTATafTSIxHMDRXMRHVEhb9WWrkHwrw059yea4qV5EaH3Nm0P+7+2s?=
 =?iso-8859-1?Q?GqZAFbUFf3wijQ+A4sx8+KceTCd97hKOubCNh0jIbbCHIL9GLBShiWWDex?=
 =?iso-8859-1?Q?uiP/D0V5APPPwDjaQAF6GPPLkOPYTds4BLeRFk/ZL3x9UvIGDQWKPyfWq3?=
 =?iso-8859-1?Q?5RGVLVT/0wd84tlrw8wzxmtGvAPYstE0flkOeQoGcfH+5htHZwK5QFwSlt?=
 =?iso-8859-1?Q?OXZ7GJEdShtff2cRTC1NxWuqX2mh1GkAme3Wa1WxtTBswRd3vYYwPJfAoI?=
 =?iso-8859-1?Q?/IB/HjiqjjGvLUBVlHc6x7tx810V2zZGZhG414pbvHspp9kIQoRe9/lJ5X?=
 =?iso-8859-1?Q?FU2wEkH0mRSTL4GPUAa5XDpFAtOl3109MTVwJfmw/O42fUwLO0MvIydSuj?=
 =?iso-8859-1?Q?RYI8c4/aOiIpDkQkrMb8il8jdDSbxywt7ODlEGA1C+Lb/POfJ0dl99gtd9?=
 =?iso-8859-1?Q?hHnBWqDYp5GTA964QLtUGeybSf9LlsZHxmglLpA153mgdtkokDnQStZbMZ?=
 =?iso-8859-1?Q?bUobk+zwIlaoarZxvF5EQxKXB3y5kSRjlmV9rtOVh+C0hUfg1nlpD4pdo9?=
 =?iso-8859-1?Q?uSy/jndra2t9DYfcLxnHbbB4xv4MLNe5KkBFfto1gg9jMe9qWr+7Qo6h51?=
 =?iso-8859-1?Q?hYSZUrORzC9BwqiakvJHF2rLhYpk4LT6kEgeYdBDwVCYb7ayRZYtS/lKJc?=
 =?iso-8859-1?Q?DfMCoRke4xlNGyrpVHUwL6nWib3qsp5EQvebItdQkkcRsjzS4/ANiZ2O4U?=
 =?iso-8859-1?Q?OQj1Qcq3yqEiaiycZNhoRM8EkiFL/LidJMuGDf6qhvd6QZ3vgnWn7nwJ8o?=
 =?iso-8859-1?Q?ZzmSIvAYXgjRhQYX8JTcPDfd6YcoGrhmpc94qMbOpktKqBUPjDZ7y2aCkA?=
 =?iso-8859-1?Q?cuVYvOrGoFmTYzFAsvK8z1cZohqYDKZPRUpuIngoTmMdJUXEK96BHkK+zu?=
 =?iso-8859-1?Q?8eE9Ksbu/YQFJMC8BsdnpDOIEjt83S97hm/2s9n1CbdpIiqiBzZkXMVWfw?=
 =?iso-8859-1?Q?Tnm6fxVaaaeXgf129QiBNQNgY5joBiS1egL2iEJqzq7W+uDTwyQqzacweb?=
 =?iso-8859-1?Q?fOzDeUek6CbAKyI8kj1WpQclodDIL88lBvHrN0vHFVwWujaq/hddxU5iEb?=
 =?iso-8859-1?Q?pTkJ++rsJXyD9a/FSotJGACd81wCfLN4Pji3gEdk6j7HvZreZqeTrvZpo+?=
 =?iso-8859-1?Q?E/d8pdZrO78afBoNOfBaAicPmtKhFWRec4rH+JRqLgGdRvSa1OLP5JAaWI?=
 =?iso-8859-1?Q?Rwq+cpNJHiR2qscK6pujWzHR1DRkGzQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d08fe34-9c81-4f27-2f7f-08df30a2555d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 01:09:48.4337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkYZbjkYFYboUUI0bnntVhM33udoPIOjmYbz6oHYQ1D7XesdH+0CI6Z11HCkkarMU+XMFvCy6cycJCo1avyh86CeFvvnucKLO7SUdpMAKrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6611
X-purgate-ID: tlsNG-16d1c6/1792717791-FC20077B-76C905AB/0/0
X-purgate-type: clean
X-purgate-size: 7615
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Mykyta Poturai <Mykyta_Poturai@epam.com> writes:

> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
>
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
> and partially supported FFA, or TEE is enabled, as they use non-static
> IRQ actions.
>
> Remove ifdef guards for x86 in flask, as cpu hotplug is now
> supported on more architectures.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v9->v10:
> * rename arch_cpu_can_stay_online to arch_cpu_keep_online
> * drop the single-use hp_op and hcpu variables
> * make CPU_ONLINE_OFFLINE depend on !TEE, as FFA and TEE use non-static
>   IRQ actions
>
> v8->v9:
> * simplify dependencies of config CPU_ONLINE_OFFLINE again
> * rebased ove XSA-499
>
> v7->v8:
> * simplify dependencies of config CPU_ONLINE_OFFLINE
>
> v6->v7:
> * use IS_ENABLED istead of ifdef in more places
> * remove unneded variables
> * more explicit fallthrough in do_sysctl
>
> v5->v6:
> * fix style issues
> * rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
> logic
> * use IS_ENABLED istead of ifdef
> * remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
> from the common handler
> * fix flask issue
>
> v4->v5:
> * move handling to common code
> * rename config to CPU_HOTPUG
> * merge with "smp: Move cpu_up/down helpers to common code"
>
> v3->v4:
> * don't reimplement cpu_up/down helpers
> * add Kconfig option
> * fixup formatting
>
> v2->v3:
> * no changes
>
> v1->v2:
> * remove SMT ops
> * remove cpu =3D=3D 0 checks
> * add XSM hooks
> * only implement for 64bit Arm
> ---
>  xen/arch/arm/smp.c             |  9 +++++++++
>  xen/arch/ppc/stubs.c           |  5 +++++
>  xen/arch/riscv/stubs.c         |  5 +++++
>  xen/arch/x86/include/asm/smp.h |  3 ---
>  xen/arch/x86/smp.c             | 34 +++------------------------------
>  xen/arch/x86/sysctl.c          | 11 ++++-------
>  xen/common/Kconfig             |  4 ++--
>  xen/common/smp.c               | 35 ++++++++++++++++++++++++++++++++++
>  xen/common/sysctl.c            | 32 +++++++++++++++++++++++++++++++
>  xen/include/xen/smp.h          |  4 ++++
>  xen/xsm/flask/hooks.c          |  2 +-
>  11 files changed, 100 insertions(+), 44 deletions(-)
>
> diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
> index b372472188..039577ad02 100644
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
>      }
>  }
> =20
> +/*
> + * We currently don't support SMT on ARM so we don't need any special lo=
gic for
> + * CPU disabling
> + */
> +bool arch_cpu_keep_online(unsigned int cpu)
> +{
> +    return true;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index 82a289af85..2c2e9412ad 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -101,6 +101,11 @@ void smp_send_call_function_mask(const cpumask_t *ma=
sk)
>      BUG_ON("unimplemented");
>  }
> =20
> +bool arch_cpu_keep_online(unsigned int cpu)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
>  /* irq.c */
> =20
>  void irq_ack_none(struct irq_desc *desc)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 3a7953593d..2307408c6c 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -65,6 +65,11 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
>      BUG_ON("unimplemented");
>  }
> =20
> +bool arch_cpu_keep_online(unsigned int cpu)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
>  /* irq.c */
> =20
>  void irq_ack_none(struct irq_desc *desc)
> diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/sm=
p.h
> index 572b39b01c..6c33567cb5 100644
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -44,9 +44,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_=
t pxm);
> =20
>  void __stop_this_cpu(void);
> =20
> -long cf_check cpu_up_helper(void *data);
> -long cf_check cpu_down_helper(void *data);
> -
>  long cf_check core_parking_helper(void *data);
>  bool core_parking_remove(unsigned int cpu);
>  uint32_t get_cur_idle_nums(void);
> diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> index e3c4c0d5e0..b56d8dfd36 100644
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -417,37 +417,9 @@ void cf_check call_function_interrupt(void)
>  }
> =20
>  #ifdef CONFIG_CPU_ONLINE_OFFLINE
> -long cf_check cpu_up_helper(void *data)
> +bool arch_cpu_keep_online(unsigned int cpu)
>  {
> -    unsigned int cpu =3D (unsigned long)data;
> -    int ret =3D cpu_up(cpu);
> -
> -    /* Have one more go on EBUSY. */
> -    if ( ret =3D=3D -EBUSY )
> -        ret =3D cpu_up(cpu);
> -
> -    if ( !ret && !opt_smt &&
> -         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
> -         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
> -    {
> -        ret =3D cpu_down_helper(data);
> -        if ( ret )
> -            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
> -        else
> -            ret =3D -EPERM;
> -    }
> -
> -    return ret;
> -}
> -
> -long cf_check cpu_down_helper(void *data)
> -{
> -    int cpu =3D (unsigned long)data;
> -    int ret =3D cpu_down(cpu);
> -
> -    /* Have one more go on EBUSY. */
> -    if ( ret =3D=3D -EBUSY )
> -        ret =3D cpu_down(cpu);
> -    return ret;
> +    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
> +           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
>  }
>  #endif
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 10d485e633..a4254beabb 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -121,13 +121,13 @@ long arch_do_sysctl(
> =20
>      case XEN_SYSCTL_cpu_hotplug:
>      {
> -        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
>          unsigned int op  =3D sysctl->u.cpu_hotplug.op;
>          long (*fn)(void *data);
>          void *hcpu;
> =20
>          if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
>          {
> +            ASSERT_UNREACHABLE();
>              ret =3D -EOPNOTSUPP;
>              break;
>          }
> @@ -135,13 +135,10 @@ long arch_do_sysctl(
>          switch ( op )
>          {
>          case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> -            fn =3D cpu_up_helper;
> -            hcpu =3D _p(cpu);
> -            break;
> -
>          case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> -            fn =3D cpu_down_helper;
> -            hcpu =3D _p(cpu);
> +            /* Handled by common code */
> +            ASSERT_UNREACHABLE();
> +            ret =3D -EOPNOTSUPP;
>              break;
> =20
>          case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5713dc1f9c..329bb07ae9 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -648,8 +648,8 @@ config SYSTEM_SUSPEND
> =20
>  config CPU_ONLINE_OFFLINE
>  	bool "CPU online/offline support" if EXPERT
> -	depends on X86
> -	default y
> +	depends on !ARM || (!HAS_ITS && !TEE)

I don't think this is correct, unless RISC-V also support this.

Maybe introduce HAS_CPUONLINE_OFFLINE as we do for similar features?


[...]

--=20
WBR, Volodymyr=

