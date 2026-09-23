Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64694C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 00:30:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429577.1652387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Aru-0003uc-3t; Wed, 23 Sep 2026 00:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429577.1652387; Wed, 23 Sep 2026 00:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Aru-0003uV-0I; Wed, 23 Sep 2026 00:29:50 +0000
Received: by outflank-mailman (input) for mailman id 1429577;
 Wed, 23 Sep 2026 00:29:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9Ars-0003uP-Cu
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 00:29:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Arr-005tZy-7s
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 02:29:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab31d54-8faa-0a2a0a5109dd-0a2a4508acba-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:29:47 +0200
Received: from [40.107.159.104]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab31d7a-f659-0a2a45080019-286b9f682f76-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:29:47 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB9722.eurprd03.prod.outlook.com (2603:10a6:20b:61e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 00:29:42 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 00:29:42 +0000
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
 b=jY1BuutTHrOXanck5yd38LBM/2QibLwOadC4sDRwjR0xMG43mlmGvJbSitfddi3P411XOb5xMiD68SAM2qfaKMr4dlKYAsXRzFKf1zKqHUea+bVwpBoJJrxp0bfuKZSigESUSAoxBe+w/UCF9C9hHD9qWltqInh0u5L1eVMMeXBWKGydJSxVbaEVoRy7D5K5Ii+MyKKOpAtWZpIrWJzcV9UrDsavee/atHYVu2HyOQvCO6OME8NWqNdL2eFnT5JBOGF8eYEAL+/XWzKkYn3K2ga4pT/gauVL2wmGWH0pTJGs4FOCdIOEBlplFr2tp/Wqm45RHNpCepYAcuuA7bJBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPMzW6Xow40ZOnlzOKr0ty5B8RH0cA/iIO6XNEixvhI=;
 b=q2RFzck0kZ5fpBowXhSZ76kC5XbS314u73SVPVZsaINorJr5K3KPTps98FatzwpY4Q5Mcunuh2GpmWyrIXYD6J565iswFXSFhvxiLGe/ibHrGOn1lPYevBlXpuXDuspOJXSgvWK4yFfnaZohpUqRmvtnfocA3M8yhskU+6Bkabnd9KDFjDV17+NEvpNWZR2krdUQU53gdPAkgc5JvhLULW7Epv+FnC28nhAL0k7hrwRM8lJEid2qnNBg8VM++rH36KQGlI/abnoLoD1NL42YJC2lx4/Ys/AY3kUPMPAa9KmY5v10TGbn9cZWiwrycjYaMaWqUn3EBNP0JgKSjMVOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPMzW6Xow40ZOnlzOKr0ty5B8RH0cA/iIO6XNEixvhI=;
 b=spGUjFhAlpwIOXz/+l84n62OiuK8lUiddF3m6S4iJ3khKigLPwEgr6+wdRJKhTPZwJDs/hweuP9245kSELh0SIu5cqw+9cuCyRh59ANDJpaaoul2RgLTb/5JSOlWl8OEy/cY47H2i517M1ZjQJwc/vRLOYMRgzuk51Dx8qBMcDGsb9hYL2KD52JodGYaKT9wVR9TM3pzMd8yHXCzRSG3QyEINgpoefMSSeaq8dYy12StwEPgTRHgohfjQJp1MYQi5Qc7Ze9s4m3WExzsG8TS4LizMKAmLiZKQ4Nxll62FTT+DXPVHcA19lkvxNvhkvmDLzo1ZkmZGnq1iE7WqZJdzA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
Thread-Topic: [PATCH v3 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
Thread-Index: AQHdSqtNhuAYUgdtlEG2grNEEh5N0w==
Date: Wed, 23 Sep 2026 00:29:41 +0000
Message-ID: <874ifg4xoq.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<cefba96267535739ecb851e6080da51a3d745e3f.1790089161.git.mykola_kvach@epam.com>
In-Reply-To:
 <cefba96267535739ecb851e6080da51a3d745e3f.1790089161.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 22 Sep 2026 18:58:42 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS8PR03MB9722:EE_
x-ms-office365-filtering-correlation-id: 23ef156c-b3f5-4574-79a5-08df1909c2b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|23010399003|376014|11063799006|10067099003|6133799003|22082099003|18002099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 XZ7BcVbUn+oFq3p191wLIVBWUm1ztytiuj2TBa5VbqeF8VF3/hYPGLamP9XDhwEdF51bSzsnCwmntWjBuRCuALEe0xZ0/0yfV+Vl84KUPGLN/h69JGav6aiUrYRkJFhfMPAE/9ijyNG6xjhPKUD+JRfGATQuay2SsD59wXkYftfU93uL03hBBwYYoHJDqukIR06x3U4bYTvzFHx/tXvNirE27vFPs2WV6bUwANnXgAHKwZKRFjXH0Yl0U0d6S6cCV/ELVzxhwpADW4//Fvi2KUDgyNV8rPk9JSKRxnTR1zvPgWbzTxzxeA/P3qETfOVkX8c/9AqXZyr3hvB9Lo5cCFoLEk+fYKqwoYmhRaq5r2svguWwXJbwgw1dC9S0742OchAhIHmgev0dRsO4ANB16KdDXHZDdyOWQplck0ENQAyX5woTakEcuv3cBCClinzwHYD8nTjO5/NFQy02uOo3KIO6hRjLXuaylAV7z+7T6GxNH0kKphiwj9DaCaHD/Yn1RcB+cmND8MeGAmKEvDLyJVBRpLUM6gaw766M0xu11kLDj4RdP+wG95NO4l/jWRGuf46J5W9QY3iWm1qMuavMrLn33lBbZdfycqfzYTBl12PGQZ2zUXGUgC6Gi9rC5Yw/kt3MxX4WrptJveYUKUBbm2cQA+StLF6nMUI+3vMlgWefjOoGq6+7Ov/9sk5WTr+yKD2e8ijIpJEjEvENmo/OJXx51dAgxQB4toJVMg9RwVU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?29M2ZIu+TIHcW/pUvjMSIMHr4/zHEWTryFvhKy/Wp/9+FETedQa3S8EKyP?=
 =?iso-8859-1?Q?oCYxl+uXUyIT2xq+k3GPKT6ksgWevkBrRAIgJdfKWz/JUgRhEM8Xf1bf/y?=
 =?iso-8859-1?Q?aUCmGfbjw/LNhydi7k8EXTVwqIhpZMKJbU1Ir6gCA/2NRy9CYon/E3wKYs?=
 =?iso-8859-1?Q?jArJhw/cDjMohV6ygac8Ao4+DOP3lDhMOOZZXwxyRdBtaXWkdvmOr4gQD+?=
 =?iso-8859-1?Q?WA1ZuGJkDNWzBlSFuXcILYW3YWBEe5J2sGjdIrC2Z23Gsir/+DAFTSDn5N?=
 =?iso-8859-1?Q?4sorfigfCqaXZmFQFwdEO2A16cPUMyn8rvXooRNQArXoRckF3qBtEJIetD?=
 =?iso-8859-1?Q?gH7QInmOQ7SqQPaWeAprfgYEtFq9Xk24hMIrfjETEO6xUfTzBcXYgkfudi?=
 =?iso-8859-1?Q?pni+psoLTcLlYRkxlJ5BICWY//habtrHNWCltM5phGeR6OFIRHgnLLNWqE?=
 =?iso-8859-1?Q?zfvEDFWGBsdq9f9nvLffanCygTB8/u/wBQxuMZVQlIOppSAKmWQ2XFPWy7?=
 =?iso-8859-1?Q?jrRdp+lLdW7NTILh8oONDsyF/qhNGdh180H/iKsuXbtxkGP8HS3bEWRdJj?=
 =?iso-8859-1?Q?Ab5DJjrtmUEECoTb0Uvn7olNgMk8nC6qP7fpxCCdX2ZNbAOIW6YHCiyngh?=
 =?iso-8859-1?Q?kVC9cWRUhjL2q1OB/7TK9wBIPQ2eTveuuA1B8Fh4Zy+TmRA0ecdQbfixPp?=
 =?iso-8859-1?Q?XvipHqvOlN+rGOHRc9j8lfMaQQu3e0TNekOlzBk6XLh/L1S+BfgDnfwejh?=
 =?iso-8859-1?Q?ZFo6uQZ9GxB+A1tw3g0V5sPlOj6Z06tgPVtPPJeZvZN3vdUcV2YFxe8byp?=
 =?iso-8859-1?Q?WarIJM93a7Obu2hoKFBJNquWkkLJot1pxYZwZgMkHMrU29RjzqaIWmC6eW?=
 =?iso-8859-1?Q?2t+abdjAGhxVz8hMTxL9S34YhFchjf5Q3DL7Jrwq67lIPZCC0U7f8X0QZJ?=
 =?iso-8859-1?Q?u2OrzSkdrHjDGB4AZEE1s/byxsy0p6aIH9C178BoroBfnwmcRWEsSruiaW?=
 =?iso-8859-1?Q?PZFr9jO+fku6OBQu+aGVArBOTRaQI9B2vkUO6zSng7Sbj7VQgMvi51KGKD?=
 =?iso-8859-1?Q?dwDma9dh/0TJdLHvFRVj2BJS84BqPgyGnSbYswbhklOpL6L+cnJIGL5YHX?=
 =?iso-8859-1?Q?kodYS8CpafKoPZbk+Fc2a/coz0K+HOu2i7qwdqXh7m2KqLjRkH7u4vhrVN?=
 =?iso-8859-1?Q?ffy68YzWOz/Xn6GLWegTQgevfNES/mWjGluDJMZxZDZK6A82mKSnQUPXIA?=
 =?iso-8859-1?Q?GsLZpnVTvDN/UdYylusb1Oa/WD1OAo+UHBAgILYYg44S57pW+EluIP+97J?=
 =?iso-8859-1?Q?vBSZuKAKIzEIcwsTPaPY4jMQaZnb2sqxgnV1JDES5+zDKOZNZgltA6OSXS?=
 =?iso-8859-1?Q?NgfLijXf1FC97URBnib8ccFE+kmjDM8NpqR2KpBDHHMFaCdBUywxdjDsLI?=
 =?iso-8859-1?Q?8SSBvZJE4mqW8eb6qDl0F7/8WzdGhUrxS3jrX9iPnKA3djxlWqvXzWIg2s?=
 =?iso-8859-1?Q?kUuXIzGvUp4wLsZH0PedYkx0xF4jg3wt0qdDqmfHbWNlH3akq2XOMQB2EP?=
 =?iso-8859-1?Q?L7yrTEQ2NOXkKRL9atLGQ7VUk95hd2WgTdk7btOqiJ8sZ4wR4TOXshChoQ?=
 =?iso-8859-1?Q?uD+f2ROPE5/+fhCHA3W6saCSnW+zSbyq/iPYV6XXzDCd/+KHbHWPeKrSs2?=
 =?iso-8859-1?Q?qBZtf4B0IxeUTtN2d8QCRj9CgJ3wMOH8WCffsQw0/N1Yekys5GaFhxb1Oj?=
 =?iso-8859-1?Q?HyXGj+Ufpm9Va//s49bU+vzftRkU3B1t8TVMuCpduYH+v9qLOiJVrJThC8?=
 =?iso-8859-1?Q?rhkGDh+xJyMovKFx32ByrC6vvzIao1M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ef156c-b3f5-4574-79a5-08df1909c2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:29:42.1468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dcm7wefXw8ySKTdYRFBIpBhqjpoLX4sIJqYJsSqhXbTxcfqbk0ZGEVD5AVU6EsIMlQUCQwDnCNoFf0Q4G5NM8ap1rmqWXCSS25NxDM6imw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9722
X-purgate-ID: tlsNG-c1860d/1790123387-D6D4087B-A12D9E76/0/0
X-purgate-type: clean
X-purgate-size: 5084

Hi,

Mykola Kvach <mykola_kvach@epam.com> writes:

> The DT dma-noncoherent property describes the bus coherency of the
> device represented by the node. On an ITS subnode, that is memory
> accessed by that ITS. Add GICV3_QUIRK_MEM_NC_NS to the corresponding
> host_its and use it when programming GITS_CBASER and GITS_BASER<n>.
>
> On the top-level GIC node, the property describes the Redistributor side
> of the LPI path. Collect it in gicv3_lpi_init_host_lpis() and apply it
> only to the host LPI policy used when allocating the property and
> pending tables and when programming GICR_PROPBASER and GICR_PENDBASER.
> Mark the function init-only because firmware attributes are collected
> only during boot.
>
> Do not inherit the property between parent and child nodes: ITS-node
> non-coherency does not change the global host LPI policy, and GIC-node
> non-coherency does not change per-ITS quirk_flags.
>
> ACPI is unchanged; this patch only consumes the DT dma-noncoherent
> property.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - Keep the ITS init annotations with the earlier initialization patch.
> - Drop the redundant aggregate host-LPI-flags message.
>
> Changes in v2:
> - Split v1's dma-noncoherent handling into explicit ITS-node and GIC-node
>   scopes.
> - Apply an ITS subnode property only to the matching host_its
>   quirk_flags.
> - Collect the top-level GIC property from gic-v3-lpi.c before host LPI
>   allocations use host_lpi_flags.
> ---
>  xen/arch/arm/gic-v3-its.c | 17 +++++++++++++++++
>  xen/arch/arm/gic-v3-lpi.c | 20 +++++++++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index f52232ca40..6734f94e7c 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -139,6 +139,21 @@ static const struct its_quirk *__init gicv3_its_find=
_quirk(
>      return NULL;
>  }
> =20
> +static void __init gicv3_its_collect_fw_attrs(struct host_its *hw_its)
> +{
> +    /*
> +     * An ITS subnode property describes memory transactions made by tha=
t ITS.
> +     * Do not inherit it into the global host LPI/Redistributor policy.
> +     */
> +    if ( !hw_its->dt_node ||
> +         !dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> +        return;
> +
> +    hw_its->quirk_flags |=3D GICV3_QUIRK_MEM_NC_NS;
> +    printk("GICv3: ITS @%#"PRIpaddr" marked dma-noncoherent\n",
> +           hw_its->addr);
> +}
> +
>  static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>  {
>      const struct its_quirk *quirk =3D gicv3_its_find_quirk(hw_its);
> @@ -149,6 +164,8 @@ static void __init gicv3_its_collect_quirks(struct ho=
st_its *hw_its)
>          gicv3_lpi_update_host_flags(quirk->lpi_flags);
>          printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
>      }
> +
> +    gicv3_its_collect_fw_attrs(hw_its);
>  }
> =20
>  uint64_t gicv3_mem_get_cacheability(uint32_t flags)
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index accfd48a74..1cf49430ea 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -7,7 +7,9 @@
>   * Copyright (C) 2016,2017 - ARM Ltd
>   */
> =20
> +#include <xen/acpi.h>
>  #include <xen/cpu.h>
> +#include <xen/device_tree.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
> @@ -102,6 +104,20 @@ void __init gicv3_lpi_update_host_flags(uint32_t fla=
gs)
>      host_lpi_flags |=3D flags;
>  }
> =20
> +static void __init gicv3_lpi_collect_fw_attrs(void)
> +{
> +    /*
> +     * A top-level GIC node property describes the Redistributor side of=
 the
> +     * LPI path. Do not inherit it into per-ITS policy.
> +     */
> +    if ( !acpi_disabled ||
> +         !dt_property_read_bool(dt_interrupt_controller, "dma-noncoheren=
t") )
> +        return;
> +
> +    gicv3_lpi_update_host_flags(GICV3_QUIRK_MEM_NC_NS);
> +    printk("GICv3: Redistributors marked dma-noncoherent\n");
> +}
> +
>  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
>  {
>      union host_lpi *block;
> @@ -443,7 +459,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
>   * to the page with the actual "union host_lpi" entries. Our LPI limit
>   * avoids excessive memory usage.
>   */
> -int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> +int __init gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)

Spurious change?

>  {
>      unsigned int nr_lpi_ptrs;
>      int rc;
> @@ -451,6 +467,8 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bi=
ts)
>      /* We rely on the data structure being atomically accessible. */
>      BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
> =20
> +    gicv3_lpi_collect_fw_attrs();
> +
>      /*
>       * An implementation needs to support at least 14 bits of LPI IDs.
>       * Tell the user about it, the actual number is reported below.

--=20
WBR, Volodymyr=

