Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAD0C5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 00:35:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398997.1635232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyf8A-0001ru-Ma; Tue, 25 Aug 2026 00:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398997.1635232; Tue, 25 Aug 2026 00:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyf8A-0001rn-Jl; Tue, 25 Aug 2026 00:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1398997;
 Tue, 25 Aug 2026 00:35:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wyf89-0001rh-C5
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 00:35:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyf88-00GArl-Eo
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 02:35:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce2e2-2eae-0a2a0a5409dd-0a2a45099d0a-34
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:35:08 +0200
Received: from [40.107.162.134]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce33c-be1a-0a2a45090019-286ba286365f-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:35:08 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AMCPR03MB911348.eurprd03.prod.outlook.com (2603:10a6:20b:783::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Tue, 25 Aug
 2026 00:35:04 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:35:04 +0000
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
 b=yA6tEdzl+yk+nhHu9/uohAN1JOCiLWTFYKraKz2r7FqnjnFECeavhXIeFYiXlqYhn4HV4yvb3qDqjr+UZsQNhmBNQ0XQxm6n3UwlHltaz47Xp/QL68RuHcVPgdXsbS0iYMdCt1m9aYZCWKbCvSXLB98tIUhyGTKPyNRdK1wHMgoiueuqFNVEobC4E4PH7B8hYxjO94GVwpLZBB/hpknXBE7uI4VDTwOPuCCZMwG4aQrEncXyj5fZ+mSgIRKk9frDAMGSXAFH82+JMJQJkIb0UhuOY6RznlvdF5nvGTLOYQSmXf+zp1Gisy1QJASjzL+14Xmj9Kb3LY9lhCtvQ093vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sfnGUn9sk2ypzeOnAxwvAMGBuBXq4UJKhuzevtahgk=;
 b=lfkSEEXCgYdNSL/zl4p3eHUvpQ65eo/VoHb7T7URGzualAsfvUPFQRW3EiI+FDwverd0QgOwL/mbtV9f7Uq3KL1H/v8ZcfTIUNVOcTbW98WCHNDdMt//FhHX4lRnzRYcMmM7EM/X2yH/6ZCjMfLJdLnjMBj41GqzwDXCBn4ZbUobht2D+vlmMs1ODXkKW0heYHX1MCsQOYNyCJQEUmOfHo66SO3SJbEv07W5ITXDFY9Tt4xPzF3SroYDWm1KRtoiwmO6TA4LGVW4JWtSP8GNCDg8RJJc/LTK6HIuTTRmAM7wzQnyj+rDbxrWcrPpuHZZqhStEEnrUFJQda4Ma8MPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sfnGUn9sk2ypzeOnAxwvAMGBuBXq4UJKhuzevtahgk=;
 b=EWeNjwyhG5+AlCiFQU7B1WWt1AQFOJp68J76CBvBp7lfulIoZy0JgC2zRw5cIABv1l9g7UDnpJWCVn2dWa83De5xivSXNn4UB12HBBf6HnaXq2pV61yJyg5J+u3WZgUVsSYy6EfuAjwNOQRiYD38833J034DPg8pXXy6EEgizoAGXwIZ0ETgwOULZyYH1RglYu/pvWqR+7KHhSubH3mP+GjJFsmsM8Csr+vWm45wGCyx1u3UF8nwLBX7F5uZVQa2gxeZcbxyMh3WtInegZYYgQTGDf+6pR6iDGMVAL7S0zZwPKbbtRv83eul7osVd5uDnIBnJEH3hlxAlviXs40I4w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 3/4] xen/arm: vgic: free eSPIs using the bitmap index
Thread-Topic: [PATCH v3 3/4] xen/arm: vgic: free eSPIs using the bitmap index
Thread-Index: AQHdLwVeXVghDArU/UODCEwm7oqaSQ==
Date: Tue, 25 Aug 2026 00:35:04 +0000
Message-ID: <874igjxcjs.fsf@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
	<d359777c9fe4c4e1a53b93dea14e36adc4f39e00.1787050437.git.mykola_kvach@epam.com>
In-Reply-To:
 <d359777c9fe4c4e1a53b93dea14e36adc4f39e00.1787050437.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 18 Aug 2026 14:33:01 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AMCPR03MB911348:EE_
x-ms-office365-filtering-correlation-id: 863033fd-c07a-4b80-2ff6-08df0240b4e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|23010399003|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 pt6eygrtYW0kawf+l9400unZF6Nc7P6uw9BdTD/3MENft+jM9n9QEHxvQeLKJuou+0Xj4W9nWDoJcqQ+wZqWQOzTFCCjm8ICHGVs1Gr1T2BBcH189cpftn7DVZaXSbOo6HhnaD31qLK7F+MUMqtbrkU23By61LHrUYwNuclz+FMD22HKoG+fO+JAqlwEVT5fzMVcMf8eXqAh5M7PotzpEbv3RPTcH29zqLvEoR9b5obAvtSpnrB55WJkKaatq5i1L3YYtacfdFLZkRUebmE8Nb96GisBA+K362tmAexTI+9wyHV4NW4p9QeY7lYiElwnJ6QJveeTjbQIE8gdub2iNdYgleMfbZPhhB/2fDFd77Ru6wv10pPim/BmEXyEMmQ+Ey5SmO/O7gQc1MmvkfvmdK1nkBXVIFIHNgsTu0BB09I+VldAyKK6xS/uaWIvvF4AHuyKSTGlX8GwmWOJ7p052xRMrDirXDvc1iGRJkqFGCMb0ujceMVebvSukdveX+TmK2M+tIu/WUsAObsj4fVLQ+A4gvkURyElVlaViGvUz5dHP/R+/d/ILy+xdZEcxxyyJ42NcrELgXwSmclezhnnDC0NsvsEtVPQD/H6ck3IXYiV5wxYGefZwErxJdHS4lRTGOniQCScTQi/S0fj9D81xFt2oN25grmzSqaR4YwPBClskOkVh/2nGVHwvPzDqKSVJ/9XO6we3cgrp9BoDEbA4hkSDy9YzXYltbFnZgOjHEc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(23010399003)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lawlTcAPjfaTckxAuaBNi1TkSqw4zwnF9uH7hHUyFS1jUpp6EvA47dWjXB?=
 =?iso-8859-1?Q?SOwWvMZdrEw4IV/bohVg/LvuAl7pj2zciCr6ykr+HPPrS3YSwuLtAwOgM9?=
 =?iso-8859-1?Q?qyCg7IB9MU4/k93WjXGDINJZ+9GrMBn1ZW4jJrNIDc2SuaHfYVS97M/t8U?=
 =?iso-8859-1?Q?KVchw2UUy9iry8IKNB3VNGmEEPCwJOXGkDGEyG9JFMBkXI5Ax1GWaplAsg?=
 =?iso-8859-1?Q?13JmV0453ClCPYxkJjJiKwAZpGd0M1QUDq6hXihxx/yGVaodcK2wu1O3q5?=
 =?iso-8859-1?Q?GtAHAf5y6WPQIa5UG1AQNJrpyuq20mut37XkjMvMyQWexvT36tg+wBQFLf?=
 =?iso-8859-1?Q?gg2k6FelKF9YXMcSB4lUvFECT+h9egcinmTgmReYs7ROBgqtHCJYdCuw96?=
 =?iso-8859-1?Q?25TqDjQZQ17OYP1shVuA1UH8VvvNu0+1RPLLRlffJUfMiPer+vF/f5nSLD?=
 =?iso-8859-1?Q?v40nBj5jTRH+rrltCL2aIiu9rlxhFrESu8zD42fyrVB73ao7+c0GuwCWEa?=
 =?iso-8859-1?Q?9W4o+jrkKBHwv1ZNpQ/49K+9QxxW8x8qSO+2ZVnxvJSnFDRmyHr+EmYOQW?=
 =?iso-8859-1?Q?zRO5stC7id4vItrjdyuAobM4UC/zGc8zIH7LmLUzYUyOop2W9QzWAM/v3Z?=
 =?iso-8859-1?Q?e9iQrZBRD912gu0r6KVAKamwtPHO5QlX4G/KXe7oLBxy3wq0qEtuwiW5kI?=
 =?iso-8859-1?Q?bFfOQo28qeT33TIxr8g6sxF+YfuK1tYtGYlSZigGqNmbQpAU4XRGsx5rVt?=
 =?iso-8859-1?Q?typdUXA2mzW9Rv+2fGtsRVemgFEKyKO/3EAyZ9ZZ7A6nGT+IyHMWim9sgt?=
 =?iso-8859-1?Q?6dCxujjMPird+/uANmeRTPGj96QQE3izGkWGzYjjSXGKD2cWrBtb+IrxBr?=
 =?iso-8859-1?Q?7NRQsv7Tkv3Gy7+kr7BHp1yPoe3TZry8Gd7glYT700/HQVnuvD7puNtBXs?=
 =?iso-8859-1?Q?Jrg878yepWqG5azFWV9E10qvlmqpBRZw9cKA5jGRplfpmZ23UY2w4R1HmB?=
 =?iso-8859-1?Q?kcUFVNM1kA6BLWGjep6YvLYaXcb4fuli4Ec3773WNntU4T0n3vq1QNFhUq?=
 =?iso-8859-1?Q?n4D2A7H2ELeqd3cdkNMjmTScw+Oyy5mIuCow4PE58OVnuv344neVkbUiJd?=
 =?iso-8859-1?Q?3dJ6Q0w/reMJ0e/q5/IAEGtgu7cDxVvMt9pCmDqWJP1GNtaJhpsiMWW03g?=
 =?iso-8859-1?Q?yQrYBRgJqAg98UHmvi6CLqaygMpT/89ZwXqxGSjQM9rNx34TISn/jVESEs?=
 =?iso-8859-1?Q?2Z607wkZjDvvHqurRifJ03YY8GtCguRjJueju+BPoOQoJlH49tWy2AjjOr?=
 =?iso-8859-1?Q?7dZrwRpJlGn+xDlGzNvxPFPfHFBy9hE9qw7SBwREE7+x32nCELk0sXUUG9?=
 =?iso-8859-1?Q?MsiEgOEL7voPElcPp9gTFgwONoctKlZHa0HnfSUoMr61brfyeUd0Xj+4Xz?=
 =?iso-8859-1?Q?7EOdty5OMz7oDJPsgFmWnYmw8rADiGMzfObxwNUC1v3bs454Wu22mqdb7d?=
 =?iso-8859-1?Q?0JPIpgTbMXuHj1ZI3Wq5i951G4moWz29cjO4jjkPqNHnhKdrQghj5F7ML4?=
 =?iso-8859-1?Q?WpLVbSbQsmLR5j7CZwxOOSOp43OZRp6mXBFGkc7hm4Ll+qZB8yON5TdPAY?=
 =?iso-8859-1?Q?cyiK3tymdTxNAZG4NOmV6vIjVmTTya7lxo2Boif9lzlkPDy6vzXSoc/oFT?=
 =?iso-8859-1?Q?qIgzBKm7r7ufCjsEJj2NUAhQoXCl7cgvT1zqVt9EjMwTLR/pzza2MF9LvG?=
 =?iso-8859-1?Q?3soRKGF2pf5ESonqizqUeRSVYJCpodMUUctqzzKnfwkcFyqnV3PXp3Cd7o?=
 =?iso-8859-1?Q?PbIBnuFT6KqhXtCtPOPQ/Jrr+fhITwE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863033fd-c07a-4b80-2ff6-08df0240b4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 00:35:04.5256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QykTCO1yIhQGwxpI/OHDETtz47NvrrjelgRdE6mg8Ngjz4lP3PleI+TkcrAxQ6GZt7EfgPle7WEMZ4GNU6vjkHgg8LdwUJCyVm3drOSqIkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR03MB911348
X-purgate-ID: tlsNG-bad1c0/1787618108-3B8D1034-DA6193A8/0/0
X-purgate-type: clean
X-purgate-size: 3186

Hi,


I have only one small question to this patch. Please see below.

Mykola Kvach <mykola_kvach@epam.com> writes:

> The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
> allocation bits immediately after the regular vIRQ bits.
> vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap inde=
x,
> but vgic_free_virq() used the raw INTID.
>
> Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bi=
t.
> This writes beyond allocated_irqs and leaves the intended eSPI bit set.
> Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind=
,
> and during vPL011 teardown.
>
> Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reservin=
g
> and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.
>
> Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended=
 SPIs")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - Adapt virq_to_idx() to the configuration-neutral is_espi() helper.
>
> Changes in v2:
> - Call is_espi() without a configuration guard.
> ---
>  xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index e14123a30a..e541348a5c 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain *=
d, unsigned int idx)
>      return idx;
>  }
> =20
> +static inline unsigned int virq_to_idx(struct domain *d, unsigned int vi=
rq)
> +{
> +    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(virq));
> +
> +    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(virq) )
> +        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
> +
> +    return virq;
> +}
> +
>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>  {
>  #ifdef CONFIG_GICV3_ESPI
> @@ -849,19 +859,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union=
 hsr hsr)
> =20
>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>  {
> -    unsigned int idx =3D virq;
> -
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> -    if ( is_espi(virq) )
> -    {
> -        unsigned int num_regular_irqs =3D vgic_num_irqs(d);
> -
> -        idx =3D espi_intid_to_idx(virq) + num_regular_irqs;
> -    }
> -
> -    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
> +    return !test_and_set_bit(virq_to_idx(d, virq),
> +                             d->arch.vgic.allocated_irqs);
>  }
> =20
>  int vgic_allocate_virq(struct domain *d, bool spi)
> @@ -898,7 +900,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
> =20
>  void vgic_free_virq(struct domain *d, unsigned int virq)
>  {
> -    clear_bit(virq, d->arch.vgic.allocated_irqs);
> +    if ( !vgic_is_valid_line(d, virq) )

Is this really can happen during normal runtime?

> +        return;
> +
> +    clear_bit(virq_to_idx(d, virq), d->arch.vgic.allocated_irqs);
>  }
> =20
>  unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)

--=20
WBR, Volodymyr=

