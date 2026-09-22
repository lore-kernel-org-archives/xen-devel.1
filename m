Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D242C982ED
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 01:02:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427950.1650645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8otQ-0007AT-Sk; Tue, 22 Sep 2026 01:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427950.1650645; Tue, 22 Sep 2026 01:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8otQ-0007AM-Q0; Tue, 22 Sep 2026 01:01:56 +0000
Received: by outflank-mailman (input) for mailman id 1427950;
 Tue, 22 Sep 2026 01:01:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8otO-0007AB-Vr
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 01:01:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8otO-0083LZ-Cl
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 03:01:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d35b-bab6-0a2a0a5309dd-0a2a4501cf8a-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:01:54 +0200
Received: from [52.101.70.104]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d382-5984-0a2a45010019-3465466853ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:01:54 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB6983.eurprd03.prod.outlook.com (2603:10a6:20b:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:01:52 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:01:52 +0000
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
 b=V6jFh3FUxHD6JtragXCT163sn0ZDeP57TS22uxq3DgduXerMAsXVeww45jA+g1GBwCTJGfguYX7K/b/QcjTL0LJBlZ6jgQhF8o1QgwMnB7eTPSx3xo13jV3xq12b8vdbazmBK8Gg8XCVJJVWJRzeknL/8eAvgZvacw37JzQECaksHJp7NjXFUPVgXXf3fT3NTMKZuIoIVOBtt6pSBB/wPfxCclWPt9jCGQC2MYuxH/LBeBzqmKpYLov35FE1kvmYgt6wdSPWHSayftyZZOSZnQK2D5Ms232agPIw0CoDdkquzZ1o7Dp6wWlXTDQCgbcDuQjkGNlzHMtjM5xZ5yVNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQzKRBWF6B2CBNr6xD6cAOpWpwOvRDBT5Kxk16BgexQ=;
 b=x033st7BJ3RIi3sAIcKxY6hUV80F+Hwy3hNDuLByByfKNtEYUgFVtVt0eCBtbV0+RoknsiqvJ9xT21ZsZ3uive8yw5AP9f/txBSUtxgl5juoXeV55HnNRcbssyy4R2A+8uJQ1I06x5buJmqZup+VXVu8iot2sfUUvXWs75axIZrm1oo6bjohcDTKexjf31Hitgfw9po1GIAyMticHqexCO7uXaLcovnHV25b7xtAKbomxWV3Pz2GTpPOVv06jI1TQ0r4q9fYZMpWQUHOtv9+gCF21rjYJ98ABUQk/Vs3np6fvgXHEWs+JER2/AB1jU1Ux7y7d28+71qnf96jexGWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQzKRBWF6B2CBNr6xD6cAOpWpwOvRDBT5Kxk16BgexQ=;
 b=BKPC/Ur9Y5env3JNrpbwUozy/I8bSRbcGQ9H6NK+iDwKAfo8Uvb4Q0M0ug+XwrwDD0Jzh375Ve3+LwYXIchVATASAwWls2s/qkLkculvGuBoe819VPE9l/vlc1IyXjtbflTyr0lKuEFLGVrbRsr4irzso2NPmJy9sDRjpwYc0Qw1jDt4poreSd0/xWMFAl82wkYLVFiyrX3w+0DsdBUgk5RSuRuWH1fxhj6AVGBQAHFqfVN+epZW1kp4SlHRfIgPxKnWZ+wXliJA7B/UQlx27GU617ZiuIFvpOZMc/kgxvTOoQQkWQaCWYyUzvGe+keU1zBzjKV4bpfgGhfkyEF7jQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v9 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v9 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdLu5Yaco3oEokpUOTU00/bV2IRA==
Date: Tue, 22 Sep 2026 01:01:52 +0000
Message-ID: <87jyoe85fk.fsf@epam.com>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
	<55f4839f427df6675a621bb61bfbdac4fb089382.1787042017.git.mykyta_poturai@epam.com>
In-Reply-To:
 <55f4839f427df6675a621bb61bfbdac4fb089382.1787042017.git.mykyta_poturai@epam.com>
	(Mykyta Poturai's message of "Tue, 18 Aug 2026 08:48:29 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS8PR03MB6983:EE_
x-ms-office365-filtering-correlation-id: 741de943-639a-4e67-4838-08df18451700
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|23010399003|38070700021|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Y3w64xKjYoaZcIGxrZ8OUvTeCsPB09JpOUcQYFVkm4xdYS5eL19Vj60fEP69sSJdpgrwZdCPz7r5r6l4ded/8ctgSAa0l1zS5skuF2Z+MVytsM1pfdMwKMTviDA7BVLtO0vtE6JxQMwtvIp54f64caNZjZNUYdc0uQgYxdyPvPD344NssLBnyuk0kNsgbggewZ5sKZoEHjWbNvplmT3AVcLNculSWc7kQ2c0daa69jA3/rc2Zww44MmMznx5URgQ3DWowCVMkO0PcfnS36ZlXfpxZsA0Gj6XCWBgF98MisH9n58bJDQdEXq/N5uu7rnoxVOWcenYggIee3OQ8cpawGtRzLjzRbURGkl00itQquJP/Uf2T/kF1rOxcrVoTzmjAIvYCX1xnHO9b/EiW4T5W4LT6Gs1vaMnKwnRpJITd+oIDbI5iHQ0W8lktxCI7sdY+Rq2Kj2fLUhg7oeuAT3PTOEoTudPQX8OMJDhzfiMqEWFMJMzjM0xRKQgHh8TKYlN+jVYJ9YPahslI04fvCGZjSwNEOWynYV8cq/CGAaHyzcYjvAcJCGB8am8JI12LXdviVGliKs3Wg3NlGkiLTQdcnEEmqUrKewUUowadzJPs8hT3tsjC6n3QjsjP8PAhvrf6t1emxdJyF8be6lA8w2fHQSjRtLz16SubvRMHo8BbLGrHsOVFBFzvxDYHAI3qmdcVlUERUvQUIm8bMZJhDQAuTGW0ndqM9JNPpeGF2ddeAU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(23010399003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oFtBzJOMCnt+akzESWkyKoQV/P5/PIc9DUqlIW/DJccNSQCyG2+sPbn0JS?=
 =?iso-8859-1?Q?8oudXew5aovdzKI63ng9v8IDQIoqFq+kDukdhkHlhaqKqN67ufxzKNdT5U?=
 =?iso-8859-1?Q?Kn1ww5Ch5qwEWx+g9Z1n6oJtHbeV/PaziWQdfM13dXKTltSYshYUUOdWnD?=
 =?iso-8859-1?Q?RFd90dGFsQrrrSP08jIpy1fROnRSomlEDlmczRG59/hCcMOfLIZ2IPx3Lx?=
 =?iso-8859-1?Q?EhJlzI0DZIvgM2/Xwu5Hdnpn7+QK+GJLDcK8WsrGGLozrnWM6ZD5jIIagH?=
 =?iso-8859-1?Q?ihU0ei8J4z82ZcTiqV2uKaK6QqkAbsJRYp7gdb1hVIDD98jSfqCFj21+sD?=
 =?iso-8859-1?Q?IHN69W3VDecFnAZE9HfldUyw87pB2dt4OOroEb/oConl7A2BBbkpw7KNqh?=
 =?iso-8859-1?Q?fmsuOTzFoQYnvqVXwfVaF6NFnsfyFEdBgNQUGn7G8iR+RtyXhuskyiyGdR?=
 =?iso-8859-1?Q?N3/Ar7qFwR75SbuBcZ8K6mLHQXEEPQ01dIwPxMgp3sK1kDY0JauLBEXk/Z?=
 =?iso-8859-1?Q?2j2ueGkUjshMxtXGKpcWeoF49A7jVu2eUiNUZHHc49ARvZZ2po17+1qXN9?=
 =?iso-8859-1?Q?YtXM5OUNyOWztOdUGkc9s68ZuMFcT/kHsLOVvTrmkIfdyWS3Y9nbjfIwk/?=
 =?iso-8859-1?Q?WmgpQCCKxYCJV9N6u4gl1AQGLx8wV/tLoNcxzE7mXHCO3W3CGCs4EMIUi+?=
 =?iso-8859-1?Q?4zgN62MjGYP46B0kn1DBo/K4h9kSF8jHQyBEoj14CHXQUvoDUIyEQsf7xF?=
 =?iso-8859-1?Q?gWuJWuf/OohscquLf2TqpNQgqSN9Zcj+P8uiyCPs1NZdSQNXQgHNNfC77+?=
 =?iso-8859-1?Q?1MWxcCW8FBdeL1DguU2O5Wdevm9ZrKwcqOvq8HvR6z9lqE0aC44EVnIejJ?=
 =?iso-8859-1?Q?Y0PR8d9RWgDXT75T2s3cvJh9Xu7QUNWl4rH1j8bv5HO92/474pauhBNuTB?=
 =?iso-8859-1?Q?oKg1z5gWWCEY/e+O+jkhjS4pUk5S54j+E4KcEzCt3m8f9oiIgZ/vDSW2c0?=
 =?iso-8859-1?Q?r+vaLjIUkjOfbO7LwDRIanP3APDgaZgNFzZpLhPdJ5axPOXrrkmkx9VzXn?=
 =?iso-8859-1?Q?gOY09qusvMH4YnAHreSzeJvCGFY1jXyM0DzU6ybznyf9Y5mMk1PR8dl/2u?=
 =?iso-8859-1?Q?FOxsnEuxIPCPEfTt1jxrlaueE3kmL73pJK5dQmSMmW2bJhneFdsl4HZe9e?=
 =?iso-8859-1?Q?UTQItua9yQJK4ihav6zI98/QCzWusi3SkvfyNJ+++7IanWgcuyNX2KE38Y?=
 =?iso-8859-1?Q?f3t5L4KKtPeTsdVr7Zdw1OU9/3cRxP1Tn6sD41TrB3pEJvt09zx62an52Z?=
 =?iso-8859-1?Q?PGGqf4qngewfY3CoK6Y7Wcz4qz6zCyfgjTKoOJ5L/x/cvdW4AR4UhfWYlx?=
 =?iso-8859-1?Q?oXtfBy2QZNBnvhCDhFNjrixa3RuQGUl5JUkabFim/gA+szlSXGueMweXL0?=
 =?iso-8859-1?Q?rvydesKYwjWpYxiuLpBwX05YJDbzh7hb7ID6OF0Rdptd/Dkc4K2dA60Lc8?=
 =?iso-8859-1?Q?Ujj8DRyktiop2hXrComnCS8gtFQDtgSJsyXK94Mx1hdtgWoYxBOy5e02OX?=
 =?iso-8859-1?Q?eWu03Ne66ou9FIxhz30p03L6E0fKj5xjU5WOR8n+MVN6U1IrA2fARNvD9q?=
 =?iso-8859-1?Q?cue6J/7mxTXmcQdcYlJQzkAq42amwGwQ74koM4777ZcGlou5NWWhyvRzKY?=
 =?iso-8859-1?Q?HcVh93SnE6kwdOGhAXEg2/sUHhJz+IqflhGAcTLAwYBkjQW8eaOOpVIh0v?=
 =?iso-8859-1?Q?zSHL2gxjn6nMgeEyJtq/KaC0mTklR9h/bwwJSK71KwxEFd7XSzGDmWPlHl?=
 =?iso-8859-1?Q?1uBWJWuumpRGWV7Z7zSQMfFOoMxi2yc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741de943-639a-4e67-4838-08df18451700
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 01:01:52.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfFwIrllRJs69p5c8xeQd8hCMB7yCJnZwTzkeMnT7IeSirQ6Z70sAiD8mO6BHAEginwUguhXvBKfn/Cu1F32TBCw/UsWB6FKLZFEJOiUPEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6983
X-purgate-ID: tlsNG-d62444/1790038914-BCD44757-97E60B74/0/0
X-purgate-type: clean
X-purgate-size: 5493


Sorry, forgot to comment one more thing...

Mykyta Poturai <Mykyta_Poturai@epam.com> writes:

> Move IRQs from dying CPU to the online ones when a CPU is getting
> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v8->v9:
> * replace CONFIG_CPU_HOTPLUG with CONFIG_CPU_ONLINE_OFFLINE
>
> v7->v8:
> * check only existings ESPIs
>
> v6->v7:
> * replace ifdef with IS_ENABLED
>
> v5->v6:
> * don't do any balancing on boot
> * only do balancing when cpu hotplug is enabled
>
> v4->v5:
> * handle CPU onlining as well
> * more comments
> * fix crash when ESPI is disabled
> * don't assume CPU 0 is a boot CPU
> * use insigned int for irq number
> * remove assumption that all irqs a bound to CPU 0 by default from the
>   commit message
>
> v3->v4:
> * patch introduced
> ---
>  xen/arch/arm/include/asm/irq.h |  6 ++++
>  xen/arch/arm/irq.c             | 60 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/smpboot.c         |  7 ++++
>  3 files changed, 73 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 09788dbfeb..d043360135 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -126,6 +126,12 @@ bool irq_type_set_by_domain(const struct domain *d);
>  void irq_end_none(struct irq_desc *irq);
>  #define irq_end_none irq_end_none
> =20
> +#ifdef CONFIG_CPU_ONLINE_OFFLINE
> +void rebalance_irqs(unsigned int from, bool up);
> +#else
> +static inline void rebalance_irqs(unsigned int from, bool up) {}
> +#endif
> +
>  #endif /* _ASM_HW_IRQ_H */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7204bc2b68..6445183f5c 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -158,6 +158,61 @@ static int init_local_irq_data(unsigned int cpu)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_CPU_ONLINE_OFFLINE
> +static int cpu_next;

This variable is used only in balance_irq(). Maybe make it static for
that function? No need in keeping it global.

> +
> +static void balance_irq(int irq, unsigned int from, bool up)
> +{
> +    struct irq_desc *desc =3D irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    ASSERT(!cpumask_empty(&cpu_online_map));
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    if ( likely(!desc->action) )
> +        goto out;
> +
> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> +        goto out;
> +
> +    /*
> +     * Setting affinity to a mask of multiple CPUs causes the GIC driver=
s to
> +     * select one CPU from that mask. If the dying CPU was included in t=
he IRQ's
> +     * affinity mask, we cannot determine exactly which CPU the interrup=
t is
> +     * currently routed to, as GIC drivers lack a concrete get_affinity =
API. So
> +     * to be safe we must reroute it to a new, definitely online, CPU. I=
n the
> +     * case of CPU going down, we move only the interrupt that could res=
ide on
> +     * it. Otherwise, we rearrange all interrupts in a round-robin fashi=
on.
> +     */
> +    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
> +        goto out;
> +
> +    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
> +    irq_set_affinity(desc, cpumask_of(cpu_next));
> +
> +out:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +}
> +
> +void rebalance_irqs(unsigned int from, bool up)
> +{
> +    int irq;
> +
> +    if ( cpumask_empty(&cpu_online_map) )
> +        return;
> +
> +    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> +        balance_irq(irq, from, up);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_BASE_INTID + gic_number_es=
pis();
> +          irq++ )
> +        balance_irq(irq, from, up);
> +#endif
> +}
> +#endif /* CONFIG_CPU_ONLINE_OFFLINE */
> +
>  static int cpu_callback(struct notifier_block *nfb, unsigned long action=
,
>                          void *hcpu)
>  {
> @@ -172,6 +227,11 @@ static int cpu_callback(struct notifier_block *nfb, =
unsigned long action,
>              printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n"=
,
>                     cpu);
>          break;
> +    case CPU_ONLINE:
> +        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) &&
> +             system_state >=3D SYS_STATE_active )
> +            rebalance_irqs(cpu, true);
> +        break;
>      }
> =20
>      return notifier_from_errno(rc);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 1806c47a08..239d4a7a25 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -433,6 +433,13 @@ void __cpu_disable(void)
> =20
>      smp_mb();
> =20
> +    /*
> +     * Now that the interrupts are cleared and the CPU marked as offline=
,
> +     * move interrupts out of it
> +     */
> +    if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
> +        rebalance_irqs(cpu, false);
> +
>      /* Return to caller; eventually the IPI mechanism will unwind and th=
e=20
>       * scheduler will drop to the idle loop, which will call stop_cpu().=
 */
>  }

--=20
WBR, Volodymyr=

