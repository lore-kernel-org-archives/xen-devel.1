Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C745C982F0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 00:59:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427942.1650636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8or5-0006LS-E9; Tue, 22 Sep 2026 00:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427942.1650636; Tue, 22 Sep 2026 00:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8or5-0006LL-Am; Tue, 22 Sep 2026 00:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1427942;
 Tue, 22 Sep 2026 00:59:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8or4-0006LF-Bq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 00:59:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8or3-005z60-LT
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 02:59:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d2ec-e002-0a2a0a5209dd-0a2a4501db2e-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 02:59:24 +0200
Received: from [52.101.65.89]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab1d2ec-5984-0a2a45010019-34654159cabb-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 02:59:24 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB6983.eurprd03.prod.outlook.com (2603:10a6:20b:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 00:59:22 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 00:59:21 +0000
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
 b=gfa256eFZ1FOCcE+3D8x5OrE8JxyFpw3k0VKM+wTMbNsCdJ3d7zLV67/UBz7qGw5uqDe7eLg7gabhv+1zDW+W+ZlKt4uWmxD4wP91XvuuyHIqHE7z2Dozt8ILtDFtTJA0vtNthRzS3N3JPENztiYQE9HkYPiJg87N2dxSqg8B3YldaJLiDy7+pDlEhZbYq6ETcCXpo+uH9SxGWWRxsaJQm4miGXnEVGyZ3N76j7sfIhbCfG+0VPwj4opfbv7iDSSdU4lg0JNsyhcT1VhSHB4Lsn6gyCKER46eIbYBtau7EE3TxZIEfMOV9QvUeHM3alcnxCjo4zcIJQluCBvG20N4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T58ry/DBgQKEZ7zfvIu9jQc53/jaEQ7W+BUtqbBmDpY=;
 b=Zae/xFnkQqA0+5CAbEdsE11ioMCOF4HPCrLmcF1HwkLp5fooqBMotidJ6j5rnfR5CvGNPPZ4devJrSIxIBlKLiUm7+EZeOcLbiw1IZoYiaaBaWopVst6Klm2TukvBP4qHpAZG0vuXzlKZ3e4fISVcsAp8WeBDjpb93IjP3KFBzNOCwSvfA9r2vpObWb8Spq0HpgFdSDO3Cn6GiNuVbQbLPRJ0HiZ0GdG82eal8vHm4FeSvfa2Hq3/S997IzGwg6YGHTSe+DDkYf6/S+UINY4S3XdMIXTrzOm1MlZXahMp+C6zsnCyrVsN5XnkxCkJHx8vcIeockfeNQcJD4bxatZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T58ry/DBgQKEZ7zfvIu9jQc53/jaEQ7W+BUtqbBmDpY=;
 b=OHxg5Ml4jh891Pw5XonTmFyWwogCozLgQEApVVUk4Ih7uXTwTD6HbT9evg/XDBrRJ5pLsCHup7Ek6PFqCTLVfLEHzEzeBN1Q/VQOCEd9OyOmKmQYo1pn1LvdViYijwj432e7gaqoWiSNBq50wtBIzXRGKleKxHyNge3k6PU/lw7FikYo6PV+zC9iK97ZdHWtfT7FYos5R7Qj/bwr3i/ACwjYDvYBUAfr10r1fPBOyNdF9iH5E6nswvbPpx4RWpNM3oV73qGB9M26zQOj9nh/gr1oUEpWXinG5aZ6VX4uq52hsdaFsEG2Y8HHnMT5F4cW+JQUR+qS/DqxaaP/mDbRQw==
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
Date: Tue, 22 Sep 2026 00:59:21 +0000
Message-ID: <87se3285jr.fsf@epam.com>
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
x-ms-office365-filtering-correlation-id: 29752742-92dc-4443-2574-08df1844bd06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|23010399003|38070700021|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5cmUGc0tuaNYmecftMfrokGRzzj3dwSbTquLOwmbVvjaBut8JTtYkBH8f0yzT8pLVeimuLuueCwKTP0M8wlsYswj5Aw38JqccEjKQIcRINd4Gwh/h/5n6gC5GoYf69fw3DWR7IVKk2/g5C6x+Xo6VYAfawoBsDqX+tgm2h+7BX5mVPx1f8m+QfJ/V1hb3rMZWvy99NFDdsdOi/qBTp030Ac+H2p+BD9aj+bWUI5WWNORNMDW7tqPHX2d4yqYRe/Sizgou60k570xJ60iP0y3czp5kXQVgOQ+VqcaeYzp5LxIW+XjEVKLxbE4tTi3DkCD+/piKk6eQiG18FvgM0oRLYw4M7LbBT7btTi8XE38i+1ETufXUNdhLErw7v/qOW7LfCZ5LMzrLaut+3eyX6LF/dvOvdtRPi/A77O8KewSvETJbS9LYgHMU7OQ1dGJ/yqJ5eJLT42JHlr2+5oPOzdX7p+A49uTHkS/b6BV5tsDC1uiXqP0ZaumqmompqR6ILnpe/IQdnQTHauak8VuYHQIqIuAKPLza8C+AFVobNP/etHr5/HlJs4MpPsQcjj/GxDUSCvf1whTw25gGdDQl9/neh0yFzY5T4FqTRhHVZXJhF8rJr3+l2xYYi1nNUE0LVGI4KwOmN0fQ9p2xVOeAGwDHlr5mNqAGUP1wKoiLPYL/Fe8q70sICVgwvqIhI40Ggy7218WebwVBrx030u93RIQ4m9+9SXJil7MGntKdd/ZOKo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(23010399003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?M/MagcjHs43vQtDxLf7at4N+3mP+rYQYX01j/mHzcJJbYB+sAAxqLaBCrN?=
 =?iso-8859-1?Q?2E9QlAG+MQIuLusuuFiE3vX21FJlPg4ZOoQhsRTwcvdimoFqKmg6MR0ssw?=
 =?iso-8859-1?Q?XPknAPgMJorRzmuiOo2xpi+0nvL4lubix/Hss1B3kUKLnzkQlYtCikOqW8?=
 =?iso-8859-1?Q?h6zPCIJytEuYcQRsv3h25SdycF8YaisDglacTT4EZa+lrdE0oCR0eI8/z8?=
 =?iso-8859-1?Q?JDN6wJQpdAHUJeDyn+vYuvpN0Ea1zkjHLcNtZXJBBo6goZOWi6lM0XZ58W?=
 =?iso-8859-1?Q?4QtqZ9GPkjF1/BB5rOQXs0TGlmnp00s8t2CbK7d75s0ES+AFN6peghw32x?=
 =?iso-8859-1?Q?Rqq9aFe81/UqZvDHh/WE22WpflmxfrwAPJ6SB6svbh6hMK+eakVfL3LxqK?=
 =?iso-8859-1?Q?dt9ErGuUamdnSRwlEGX6Y8G6Lrhd2zL6mo/fSYWlM7txZQxvMWp0+sLZy4?=
 =?iso-8859-1?Q?JiA+icJw+j/i2g+dRcNry5CsTYRu56AD2YSgKpx2HLdfxVE+tmfTYNZhSD?=
 =?iso-8859-1?Q?kwen6SG8LkcMdlkurOyni6W+ugkzYMEpkJugct/N7qvi84CTy79RM4Rxg0?=
 =?iso-8859-1?Q?55RyzWNf1Pti45XBnRt99wYobj/yZ9FMYUcReFLS+kHo7okrflamh3sB2b?=
 =?iso-8859-1?Q?knvLoYAu5UEjyvHckm/JbMmQ86Rcrs+7sTruZjwOGl/9I/QzJgroXpN8y+?=
 =?iso-8859-1?Q?nu5PrHZxy1BWJrMoi1dgFF8PfZC5dA8juRb6WBfXOkG0HPW4Iellrf1+++?=
 =?iso-8859-1?Q?z3muZvYZO6t1Xg0n/Y6UQsg0Y9sMA8RqwVhmCUDPsCEZudPwfl57EiqpIx?=
 =?iso-8859-1?Q?O6na/7zfb2n7X8mz6QtUGVVrAQvLz9+svXK50ZjqpTXDTTZ3lQeOs65LBs?=
 =?iso-8859-1?Q?zShcU0jVR+BFy6fbrpEKV3gk/MTgm9Bn/haKQ8SL5B/jrva309SGG93Ha9?=
 =?iso-8859-1?Q?dsOJRBy+Ed5BkHvqs9bmyCTP5aenTnLJb+B7sU1Zw+G/Njq5NJtgeY3ffr?=
 =?iso-8859-1?Q?pZiXJYsEFNBsmOWIWPH/bR3ARipt5ZDkZHE508Prb/bmm6NZ+FI6U0BZsD?=
 =?iso-8859-1?Q?ELVA5T+2hNVfaV/tbh9z0+F8W2rEW3gBloV72nGo4DKngELjmwlh0aZlTd?=
 =?iso-8859-1?Q?fpGQg0Nfc4S3/KP+4GaWdRH5Yjqng1Y2XIsGcpdahPmccwzQ2Im3yMfPbc?=
 =?iso-8859-1?Q?D2CTujcbRYF/1shdYWKAXIWMB/LwSvYKr6uJ+5Y4MW/ilRielEmQnD0Mrb?=
 =?iso-8859-1?Q?h/cv5Cgi2JqY7542j2KMgJ6/y4loMvX0j9RoNZm2MfQ6DWpaYcsZn6/3vQ?=
 =?iso-8859-1?Q?gGKZu/EsGYtLIuGTxeP4X5SIPln4vPhvE1+DjI7eCmbi1BaMc/Zin9L0dk?=
 =?iso-8859-1?Q?QZOMQ+D/hB+vi2e3npOYeK1KNJspkieIfo9tg10H21VWcUc+qECyCvmw1Y?=
 =?iso-8859-1?Q?ZMfr3w0dh9Xn+5LU7vNcN2DqPmpoARpUDKeRlVw05qfpBD4fp8i5bH5Yh1?=
 =?iso-8859-1?Q?U00/MTCQTl9Jwxlwmy/02bZjn1DHf/EeGLCaVUOVNGGzMYa0EzycHOe442?=
 =?iso-8859-1?Q?UBhFEJXvcwUuuQY8WANemyncEMNUOcnoyC50t864WvvkPqEPXr0K32J2fm?=
 =?iso-8859-1?Q?ayK2TNUdO7OtiK1+uj14VsKWCp4HfnIHL66nHSgcfG+yewXHmPKIxyFVPf?=
 =?iso-8859-1?Q?c3rOEMqvJ8rmCG/2lqM2JRkKiNFo0cLOKLtTbFitkFN5l/sFRL4NSVk14l?=
 =?iso-8859-1?Q?tT2khCpAnIY/U4iCu0BcgtAYlF7it/zcznt+0BX/wTj0gZL3QPM/QUPnHj?=
 =?iso-8859-1?Q?3pzZEJCwf3XtAQ+A+FvnS5pDrkNevLU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29752742-92dc-4443-2574-08df1844bd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 00:59:21.7908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PG56hwps7zZ2+mglwmAKX6nw6/O1k95Y3H3Pwbia5BDBYfUrnUBAx4K58+pbTo0+D8AWaxhi/W4n2mRETL8N1Mo9+S9lMuXGqWkYsUrh8BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6983
X-purgate-ID: tlsNG-d62444/1790038764-1E867757-CD6C4A72/0/0
X-purgate-type: clean
X-purgate-size: 5588

Hi Mykyta,

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

You are using CPU notifier for "up" path, but calling rebalance_irqs()
directly in "down" path. Is there a particular reason for this? Cursory
check of set_affinity() does not show need for alive CPU, unless I am
missing something of course.

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

