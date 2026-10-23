Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE6606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 01:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=NT6ME5EY
Received: from list by lists.xenproject.org with outflank-mailman.1458723.1670781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3jH-0003Cz-DC; Fri, 23 Oct 2026 01:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458723.1670781; Fri, 23 Oct 2026 01:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3jH-0003Cs-AQ; Fri, 23 Oct 2026 01:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1458723;
 Fri, 23 Oct 2026 01:05:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xK3jF-0003Cl-Qu
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 01:05:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK3jF-00DSjn-3w
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 03:05:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6adab2e3-8faa-0a2a0a5109dd-0a2a450a8e4c-40
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:05:52 +0200
Received: from [40.107.159.96]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6adab2f0-f2d2-0a2a450a0019-286b9f6037bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:05:52 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AM7PR03MB6611.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 01:05:50 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 01:05:50 +0000
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
 b=chdNeMXwAJRLilKC1tackzLIUp7TCmogkKdwPBd0a+dW3BzF9Vq1depPJP4Nv3YFpsnMntG7uG3MJ1HbEbEM7OcAnCqXSGPSLnpbnD1dDTfdQjAYrZqWwAyIENLtgx8FJpOmj5savBoGRDWAuQlKT8/Ui3ibLvTMOhFDUpSb1EVt6zHegbQ0AWRlNEzlpqINrKAAYd8fbNIkLpxXuGYv/o1KKhhpoAeUbaan+PH8UL9RbwHVD9naTI4RZeR5E/mAsLmU1a2RxrTJt6qOkCI1f98gcOPjw7cJnVZ3tcDM37bhetfqRwIa8k13E6zQU2cYdAFlbFkVe4OKYq9LRfRPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rtz+fASszqVVsZR66/MhDDBBqFxZVLmOlGsqIYpI+8=;
 b=lNhpzcBsZXNdWsd9rD1p/N7NUlU3DKN3fcy4hRsPVldDnlx1qLV0iFAybKuPHt9Y24OZmSBvX8POaGQpwwAcxnuRWSxCBOhLaD7Q5p6TQ1JtqczxeSJKfe/bvABUF7ykKjljNe7x+Uyl2LVzMGuQfZnbKACNgPxm1UaUhw5aYDnuu3b+52T+46FS3QS8qVtYQBtgGGZ7MVwZXkdBxQTttgW48nR3UV9WealZ5ox260MsfLvstYHDudsqDzOQFyDlcSrznf0ydfhWixL3vlo93t5D6aokmfuvCeiuhn1EAKrbgdETNBeFk/ABzNNF6CmotWZn+JRycn7VVcAdmlq4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Rtz+fASszqVVsZR66/MhDDBBqFxZVLmOlGsqIYpI+8=;
 b=NT6ME5EYw/+BmufWSwcvtdNvgZgo/H8geXOO5tknU307J5GKP5Lwj3fbmuX51+1Rze9k1+MwLX1c+qP7qxz0xTxa/9/DdskRdViO3XVyMTVNJrg9vvShWhYG8F3qWkzzi0zboiqwgsU/Ue52lDQt1Zt9EastkqHohAMS55s0XW/+ird3P69xJgFB1j9qCcC9uuq2TzQBTWLUVUd59PsFwsdDv3hf8HD6oB3ZNsiE50iIJYMrYdwllumCVKAbu0OH4K1SU4RYIr45vTvP36Q/aeVWI3arE6yCt9GwwbNBxI1Gr1njznHRNA0iRlG1vGIuiZu2DMkb61W8MD6T4W1wsw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v10 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v10 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdYHbuWxOoSM3qDECYUmtGRYf7WA==
Date: Fri, 23 Oct 2026 01:05:50 +0000
Message-ID: <877bj9usy9.fsf@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
	<3a880578d558388ab6d033ccc1f89aa4efecdc81.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To:
 <3a880578d558388ab6d033ccc1f89aa4efecdc81.1792480416.git.mykyta_poturai@epam.com>
	(Mykyta Poturai's message of "Tue, 20 Oct 2026 09:39:30 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AM7PR03MB6611:EE_
x-ms-office365-filtering-correlation-id: c98b170d-8044-4454-3b99-08df30a1c7b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|42112799006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 M2Tt/sd0/oxag6PKJR8tjQdENKdZ/i7r/3x8niJ/IZ/41m3mfiZDDikwLtsr4uGCvN/O3rHfpsDWXcOpVE2MQk/3x3lN9dLnCY+OGzCoiqeh+BBmbXg9Z3DW3Ulo7dI7WYUcW8eZ7f/LMZINDuwdypQtCh979PE+i7YG8Glhee8XQb3WIsFPOEaNZWzbnmYGs90RKJ6lL/azwg9PPFVrGYSiZwwns5d/jgXy2/9IvvMC1kfKo8e35MndNsF9PyfMZkmx3mhfCBrZh+exPAvtF+bmXE+nwQh5218Ie4LnHxdWywsO1FY7oUbnjiLCOd7TUECHhoDCkV4O1NF++cxs5BygPmmngH6L7mnkRiIyVkvQPh63jgzK5XZVT+qu7pSAvGWEUd3kVGOnbsWVwIVNVyinKQcwvJ4MyJ9xk/6GCsGEKjk3HGUYop4kmFqkjFVMNAIqBGe7+I7pZKlArEKb0E6rBNRDwb7EDnH35SWL9SCsnAhk1sn+BT/F8DnMEuZGD/VS4PIyvdem1cOVV1H5uXyu7PR8x2mCLYF6Yc8V4eaqsK0u1kns0UDrsr2n1svjUMAxJT4RlUvgbc5QnmCfgr3zeNTmWFuWHvmOrF8cPH5hiD3BxJT4pBaOIT6hQyB1iQ9TJUgCR3JT3CwIE1lgx7EtW7HEdLIzQ0c9C/+qmFmYau6c+KL50L6ufjtIpLXM2ehI5h1cniEZVCMbak1qlsukYBdkCqdK3yk4w/u1qB0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(42112799006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gaJQ/AXo2GBUrJF7dogSJPff6PU/uHv/EA+OmpVMNXDIaZER83IebZxvPb?=
 =?iso-8859-1?Q?LgizeFupksEpDIhWYYntj2gaxOjg8xjbZ5plC+gUqoG4FxKXVc4pvfki9q?=
 =?iso-8859-1?Q?3arU3lGn3hknAJNOjAAhBtQ4DbEkukmudOTDAK88W9w70fgxKB3HYE81rp?=
 =?iso-8859-1?Q?wAjQo1/dOu8D4Y7G+65rRLPBcWJQ222uWkUhOUeIe9Kis0yN3zlgsEtbdc?=
 =?iso-8859-1?Q?0qwfKYtC6NOTmIs9j0eUtBxZxbPXnshZr8G4lsshHOX7qgHBoef3LmZrB4?=
 =?iso-8859-1?Q?BaisBFABcpnu2jXru89UVgs9UDA0xR6fzcWU+g9YvhY5yloQSdHugT3oku?=
 =?iso-8859-1?Q?hHEWCzzmLs0rzMgLIAANOcS/l2KmbbPb6dlmhRzBO1Tc4zrOnsT6Z6P+Pw?=
 =?iso-8859-1?Q?btindlVWEuiY1m58emMrTQl7oYVN0gt7R+wgToBKqo6RYdZ/QLDepyv9qs?=
 =?iso-8859-1?Q?3Ylx1P+0tcrq/q9eFK5OtxM33p97Dcn8M3FyoQIlBd+QHIBJsMUV68Xhr6?=
 =?iso-8859-1?Q?rqJCce0J8W4mWgOsDejdu0Yy/UkWRACejpYZWOtSJ82OwMg9hSIS/qdzaW?=
 =?iso-8859-1?Q?Grsm1KRzcBXnoEo99U2a0N3HyH4ddoKL76D6HW1RqzDyeR+iRlnIbHfN8q?=
 =?iso-8859-1?Q?tnWCSkca1pQ2Oj87Q3+KfK8AZC5dVD1eBYNg+51re8u2Iwt+ygphUzTj0K?=
 =?iso-8859-1?Q?ET4/PJwZ6UgG/3R9vOoa754GZ6Tfi1+gSOWd5TALobNBiPpweici0cgfdB?=
 =?iso-8859-1?Q?kfr5xEmFj9jHUBRJit3ErFELKO9xKE1O6ADFwQVGV95WRC4G5n2BIkWEO9?=
 =?iso-8859-1?Q?ahLaRwpIKg0UukxptD4u/M0T8BwK9xpEr4INcZrlrUdGSTY9VX4kCwd9rD?=
 =?iso-8859-1?Q?2UJjqWhZZr6jdlsVUhNUFNNO9mQ/B9q04FHuYsTxR/+ly3n5j9Pfu1EVgb?=
 =?iso-8859-1?Q?KckQFJxMJ+Bol55ak68Pk5XsgmCVyb5mzE/HuYhTJGbdhuAzolkmjZXxA8?=
 =?iso-8859-1?Q?e7UYJ98eY5ONNZl+FgXxGuJwLt6MlxJbjtTKm9P+ntCVfO9GEaivFIvyoW?=
 =?iso-8859-1?Q?KX+a1+FTsGnGe6kb6TzBndtYf2zp2C+LZhx7EAqXZ7L8zFLkjGbAfZb9d3?=
 =?iso-8859-1?Q?3D0+sf66oQvljyutu+BpVAe2lKOVhUitv+T3o2lDWQIGrag7nA1k7tAVor?=
 =?iso-8859-1?Q?UNM2dQ30Kwi6ueQPAMMETwcn4eaBt/OOvOwBRfJa6BIXuIK2PvaymXqMoi?=
 =?iso-8859-1?Q?wjhDkY+R53uUU+T6M7P9lC58Qsdtv8tdh2Hc1aZUi1lIG4DluAu4niuYv2?=
 =?iso-8859-1?Q?JDA2QD760eZv7OnbkWRk4BpRjXJI1AGCsNay18/Vc9Q59h8iE6bgk+Kkzp?=
 =?iso-8859-1?Q?LMmKesTgY+IU6qWvB4o66uFkm/lVAm2DLP45sGi6IPyW5vr/9Zynpx1F2k?=
 =?iso-8859-1?Q?VGx0NuQ6tb/Q17P0+Y/ZdT7PNIjFoOq9OwzXhAfSbLmY/fNrOgb7E2+kLK?=
 =?iso-8859-1?Q?ij1n/HtK5yI1csT/bK1xgCE/c7awjBGzry/YUTcaJsNh5tVSpCle/x/GnB?=
 =?iso-8859-1?Q?4tUFA1l220vx6hO4ScdMY4/OyrNh/z/P+Rybf6/+4p+A5gw1Wd1mhEXcM6?=
 =?iso-8859-1?Q?/LfaXvgB6RVolprm3TfFrfGiWYj61b4nawajrkDxoyoNL3BYUaTHrX3ckQ?=
 =?iso-8859-1?Q?4wAbZ2kMehiqUB009DCCzw+mr4jXItCxl6H5VcXgmGk8XQ/TujrvzpLhar?=
 =?iso-8859-1?Q?9SCU+rUBJDj5yvclIZu+Gu2Q03yMUzz0DxmFq/GWsPZM/ZBNThuMD3gNNN?=
 =?iso-8859-1?Q?omwnW4rfL00HwNFnKoqQUGY3U+Zf1GE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98b170d-8044-4454-3b99-08df30a1c7b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 01:05:50.7418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbhkLEocECdogF5TpK6v6fRouRkK+0j7qUxpiO1RgN0G8Cl1pgItiKnWrs6936DO0zFlxsTmqa3sQqUc2JmTZBhYjqai4V4mVP90+tQAcds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6611
X-purgate-ID: tlsNG-4011c0/1792717552-59BC0CFC-80772C39/0/0
X-purgate-type: clean
X-purgate-size: 4245
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mykyta,

Mykyta Poturai <Mykyta_Poturai@epam.com> writes:

> Move IRQs from dying CPU to the online ones when a CPU is getting
> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> v9->v10:
> * make cpu_next static to balance_irq
> * move the offline path to the CPU_DEAD notifier
> * make rebalance_irqs static
>
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
>  xen/arch/arm/irq.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 594aaedd22..d5145a4723 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -166,6 +166,58 @@ static int init_local_irq_data(unsigned int cpu)
>      return 0;
>  }
> =20
> +static void balance_irq(int irq, unsigned int from, bool up)
> +{
> +    static int cpu_next;
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
> +static void rebalance_irqs(unsigned int from, bool up)
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
> +
>  static int cpu_callback(struct notifier_block *nfb, unsigned long action=
,
>                          void *hcpu)
>  {
> @@ -180,6 +232,15 @@ static int cpu_callback(struct notifier_block *nfb, =
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
> +    case CPU_DEAD:
> +        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
> +            rebalance_irqs(cpu, false);
> +        break;
>      }
> =20
>      return notifier_from_errno(rc);

--=20
WBR, Volodymyr=

