Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C0C982FE
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 00:14:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429562.1652368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9AcX-0001K6-E0; Wed, 23 Sep 2026 00:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429562.1652368; Wed, 23 Sep 2026 00:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9AcX-0001Jz-Ax; Wed, 23 Sep 2026 00:13:57 +0000
Received: by outflank-mailman (input) for mailman id 1429562;
 Wed, 23 Sep 2026 00:13:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9AcV-0001Jt-Ry
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 00:13:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9AcU-00BM4m-MJ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 02:13:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab319a0-2eae-0a2a0a5409dd-0a2a450a83da-12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:13:54 +0200
Received: from [40.107.159.139]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab319c0-f2d2-0a2a450a0019-286b9f8b31aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:13:54 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DB4PR03MB8659.eurprd03.prod.outlook.com (2603:10a6:10:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 00:13:50 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 00:13:50 +0000
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
 b=o/HqS3cEugsMW18ijR3vcnd8C3K8FZmMqa0rhm2iyXQUEsf2330+lAQUqoWdXfdFkfWE1+WuvgKBEFrYgGnkKeikmlZEF3ZmcIh0XPWEFpv2z2gjOMouaDJdYJnz07rYHNm/1XplAba2qdkXNrRF+uHjxP2pCyRg6rCfBcZzuVaVg25sbhxHPSygurEzD6cIzeUM9SJ85qVTVPcHVAbyrwCLwTjksDwpfKWlJY1LQLwx1kwSGj8guSSe0wVKKw8Loy0ZABiDpfStIjE/aL56GiTDs2CS0AMIgXGKSZ5096Qks621fi56nt8l8LWlNKF9BoQ5tHtKEzfdOt3yXFIUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHje+FgnWMBnxY8dSHDD9k//cdxgZlIDyNO4Txzw55s=;
 b=wjrw+MUHw5EkzWYdXSydjIDCIYdRgn6QSzKzZGVIvkIpTyYkFyC8gtlmaBzwBgfXB5V7J68WDbVgkTF17E7yq0L8a7eCToGsOIB7C6OJi1xaqZOwUayLLpCyJIK0f2am8wNkXLw1f4DA2kN9IqJGK/Dvy5TGxjbjuJ+PMdW1fMOuvd0yB/WmsqMbA9C58vDX3KNiss4AScn9wzRnp1PWpJ0r/PPFgGWE9ajb7uS1HCQyEQcFcrH35AgAexhN2xE7yLtU2NOMVX2TWfV1QSH+a7ZVNFWqXMiFOKBXaP3i7ZMTJ6tTLAwhV4yOE4QqzlMo/KcZTfHu89z1LEijwb8N9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHje+FgnWMBnxY8dSHDD9k//cdxgZlIDyNO4Txzw55s=;
 b=B4NvOJUqjlws2Usov+eFdxiraKpyPp6Mz7OTAl7QO18bvQGfMnPPrHSPJYa+4Jh4cSDsvGZBXl6iMR1C4oRXQl2bq7dYRnsFsyszooEGI2MtZo7j8mtnhCdnmvCViryFHwnJO6oAr7WWyb2XdSCu45k9wzlnFTsRhxZSz8HhTEj2B7IHa9p2yDQzJ472p5A2aYZr2ZP1x6Mc/+irSgqe2b5BeNrgJKWKom8X6Y6AlbGOx5aJ/bb1u4227j+JZj28ml1XBHY8tTIqUj2Lwgx1I2d8LCyhgrKIT4CF4V6IDs1veEd8ysn+kfXC6zLEjmLMX6pwSB0X+kyM9i6K/6MxBg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
Thread-Topic: [PATCH v3 2/4] xen/arm: its: separate ITS and host LPI quirk
 scopes
Thread-Index: AQHdSqtLrSlEtqKp7ka3WfHuuRD+Ew==
Date: Wed, 23 Sep 2026 00:13:49 +0000
Message-ID: <87qzik4yf6.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<9de733816d356161c8bfa45171e0ddbba68021f2.1790089161.git.mykola_kvach@epam.com>
In-Reply-To:
 <9de733816d356161c8bfa45171e0ddbba68021f2.1790089161.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 22 Sep 2026 18:58:40 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DB4PR03MB8659:EE_
x-ms-office365-filtering-correlation-id: ea74afee-5897-4c00-fad1-08df19078b33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|23010399003|4143699003|22082099003|18002099003|38070700021|56012099006|11063799006|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info:
 jlYsf9XmMunZs2DPN6wKRYadJT7Ot/OjE+8VGNvm7gvAU9bWdU5E7KIbw+AlFIHEy74PXhaAfBjwtLZfS72fEWk3pDWEww9MfdUiPJ11V0xNzTSYWgF2spkTZ+r8t/9S7sDUvyEcF2/XhJhI+v/s5mBJKEL8ba53TLZSRTJAO3MAQiP046NsQzmertDtIRh8IXPOTUl2fMLftSW+oqqjev3lSEMXIxNN4kMYuYJMgL33Z+FiVUmcQ/HUJWkzHTxxqwr3/fFQdUbAot+V5sfmLUV1D5B0uuQ3hmqbphaNUBGuG/EWaTGWRuY8Y2UVK36xQHltweNXarj9NPZJfRY2zcLU083vcJCOLUTGsNWaiiddMnMU63E/hEpmPU7/V1YCbPA7/8nL/Mud4ZllFQI9xD6ezUMudDQAa6Faq8zdDn+QaVlMOoajhPGGKOQv0LaQwMAZt+xdWoV69p7qzzQtoy3Fa1oZEnbM6D2ttJAvw1Sq4ZthsRciGWPg/TULrfHUrFi33EGqFl25mrNZaAo44bgQ+n1HSWElEUoz//JZe0cUE/62Z8e4KEe4LdtJqiWJ+xybVgcfvCppRQKPpm+bnhD/UsM1Ylh8Fxa1FodbwhOxOXuQUw5CgjgNKD34j0pzhcJioWRj30ISlDMN2rT/4xjbVIgwOc3zg47bJM+Nz8lk/FzJneVUdz2Efcn/xJ3eg2q5FMIjiMYvytpTeDq071z5elwGDuKfBxbYvyfBvVI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(23010399003)(4143699003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Q34IPsTqy5ddTymcJ2ijqgnnqdQ2Zb5BbiYRKBdQtT37WuwO7SOnQmIMJf?=
 =?iso-8859-1?Q?UYLyGxRr6M1+nFbCsqGpa1JZymqDEQbp4zFXZB+PmlyjkB1/1Zfr17lz9P?=
 =?iso-8859-1?Q?Ed3ovB8CLQzx2jLjhYLQjlBJLphVPzdvdPcIKmwq8fh2G6luObhVH/T47K?=
 =?iso-8859-1?Q?qv4tc8Dl9yxeN3HO2tvIVRa5472eBQ0IRUZXFRFOb8yEf9MxGLFU6y6mbS?=
 =?iso-8859-1?Q?asiINa6KJaSneVBHP16pCrL4tUleDwxCECNge81aPSCGNN56QHZony9rQ7?=
 =?iso-8859-1?Q?fidVELyqu1IR01XsjQ5GdkRS9g/D0U/UQEjzc5JAfsHf05Jfi8QbYxFHpq?=
 =?iso-8859-1?Q?sATNnbBnyHJxCeKCouQjj7omUxcvjRsuAM1m9NaW2YaGFgWiTdJIKUWawq?=
 =?iso-8859-1?Q?twomEozEwyA8ZPTc6HsstHovNddeExDiZaiEUEnP/wy/QCYKRQ/sbo/Vwn?=
 =?iso-8859-1?Q?LBXTSAIyBEKiQfpIzqHB0RupiBAzFZlhZeYhnwS3WMzOaCW9gQk9Uy6O4H?=
 =?iso-8859-1?Q?yrGm6Q4gJqmoURKj82YpOw/eUmBcOGE0S3LXNX4IrnOupdcKxfxVsd5vmN?=
 =?iso-8859-1?Q?n/fejOKOZkyWnzfSzoFhKYDvuT1maI1vv6S7XRZW2qu0lnpSHg9H3tXP4H?=
 =?iso-8859-1?Q?5VHJtc5P+uBKI31N/0fcVxwFgu32T3JivAzShQaQj+ty+BVfaq8pULXBwj?=
 =?iso-8859-1?Q?tqWBRAfOAnf7T5jOzRDu2sp0XH2LeCiuaHJKdrc4bquKRJP5m+yfkR9Eok?=
 =?iso-8859-1?Q?ZlYQO9LQDkQEtHklFEwa24vV93kaAczvgHoIMiNfPTp9HKhDDhalMtf1Nl?=
 =?iso-8859-1?Q?rlNjRjodcxAqfm0W0UDkWVyaKApEbHhV7lQOsSn4KB5hvpG6yKyJjR81JP?=
 =?iso-8859-1?Q?B7FVFZxyJfPLeyjoRiwmLun+CsXd5YH5A1eZlsV7R6NS04WFewQ1jDUwPm?=
 =?iso-8859-1?Q?2X752VScqWXbzFWkVF1V7f1voAnDinRTJPM4NwXJtE5mxtvJHq+TXsj+OY?=
 =?iso-8859-1?Q?mazQ64dY6YCoasj+0d4wHQXZOzsqcuIcK8m0CEoKIGMzv/76XOBa33qLkw?=
 =?iso-8859-1?Q?EUm/5fM8FfvwaxS38pkRDqWFsjuHphRU5KWmqOfUQhOzMrjsYzVD88vG1d?=
 =?iso-8859-1?Q?UB7AjlLTRNSXe1/6d1rqBFhG6iT6rsagAJqcq3dKrfozGJlyI0OByDPW1C?=
 =?iso-8859-1?Q?3M3b8UwMvJxYNJaRGzwoOQua6DmRzMmYZ4QPDztEkUSHYfaxgfuj9mmPk0?=
 =?iso-8859-1?Q?knRcZ/TB4YS6SJLZIJuiRkcaT9b1bA6KTWgAkcVW7lOR78PGNqK74aEqHo?=
 =?iso-8859-1?Q?5IUcnxAHPKAZTog4h/dPDdwGPPtY8V6EhkJGnLfAfz3BiM1/agNR3dPzFR?=
 =?iso-8859-1?Q?calljWi4oRCD/tgYcDF0dU+7VU9jWR1euxRsz78DSXEg/qaC6Kjd8LWdAR?=
 =?iso-8859-1?Q?z1cjkKKZ3lJNqjCmAi/uRukZVk6LX+qkWuEZO2M5BqVGiKXTG63rLqlqA8?=
 =?iso-8859-1?Q?b46FulnW4sodqEhHLVYSNLt1GMCdGdRKc6h4SEINPDWQa2FWFizinGkDus?=
 =?iso-8859-1?Q?A7V9ANag1JCQhXkhwrKdnEpWfK90tzF1pOA4sz75vCKenOv2xg0dxtvxKN?=
 =?iso-8859-1?Q?5cm5HYfuAwyOR+UI2m5KdLbm5s1HX26u5RVySVVDEjF/9jJVFq62ZN/Thk?=
 =?iso-8859-1?Q?h/BYKeSJUoynxoQKVqPJ17vfWdirmfA56ZMHzIIbjew1TH+KL5VLoAk6oQ?=
 =?iso-8859-1?Q?aMdb53HqA9xYntaSQGyb2GHPXp/Z9FYM2TzKPDc8RBeMgctVEZ/Da5Vn9o?=
 =?iso-8859-1?Q?J1VyOLi1cVbI6CJaeL1PQn5H8QQWMzc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea74afee-5897-4c00-fad1-08df19078b33
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:13:50.0448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a5c2J1huSJGZFgPDh/9qBK/bKsA3buU82qK9tliz0nVEYX4s0ftX9T9qzL56NoTySTSu2aCceT8ugXKWV5kEqz7m2jiMAEvJ1LJvvcCx6j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8659
X-purgate-ID: tlsNG-4011c0/1790122434-4B4D7CFC-96E05DB0/0/0
X-purgate-type: clean
X-purgate-size: 20550

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> ITS quirks can impose restrictions on memory accessed by the ITS itself
> and on shared host LPI/Redistributor state. These scopes are not
> identical, so a single global ITS quirk state makes the host LPI policy
> depend implicitly on the quirks seen while initializing host ITSes.
>
> Add per-ITS quirk_flags to struct host_its and keep a separate
> host_lpi_flags state in the LPI code. The quirk table now records the
> ITS-private and host LPI scopes explicitly through its_flags and
> lpi_flags. The R-Car Gen4 quirk applies the same memory restrictions to
> both scopes, preserving the existing R-Car memory policy without relying
> on an implicit aggregation step.
>
> This also removes the assumption that all host ITSes must expose the
> same quirk state. ITS-derived host LPI restrictions are accumulated only
> from quirk entries that explicitly set lpi_flags.
>
> Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n>, and ITT
> allocations. Use host_lpi_flags when allocating the property and pending
> tables and when programming GICR_PROPBASER and GICR_PENDBASER.
> Memory-related quirk bits are named GICV3_QUIRK_MEM_* and are translated
> by shared gicv3_mem_get_*() helpers.
>
> Collect both scopes during the ITS preparation pass, before host LPI
> state is allocated. Keep init-only annotations and includes in the
> implementation files rather than the public header.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - Collect quirk flags during the ITS preparation pass added earlier.
> - Keep init-only annotations and includes in implementation files.
>
> Changes in v2:
> - Replace v1's single global ITS quirk flags and same-quirk validation
>   with explicit per-ITS and host LPI quirk scopes.
> - Drop the v1 ITS pre-initialization approach from this patch. In v2,
>   host LPI allocation was moved after ITS initialization by a separate
>   patch.
> - Drop DT dma-noncoherent handling from this patch; firmware-provided
>   non-coherency is handled separately with explicit ITS-node and
>   GIC-node scopes.
> - Keep host_lpi_flags owned by gic-v3-lpi.c and update it only with quirk
>   flags that explicitly apply to host LPI/Redistributor state.
> - Rename the current memory-related bits to GICV3_QUIRK_MEM_* and use
>   shared gicv3_mem_get_*() helpers for register attributes and allocation
>   flags.
> ---
>  xen/arch/arm/gic-v3-its.c             | 111 ++++++++++++--------------
>  xen/arch/arm/gic-v3-lpi.c             |  45 +++++++++--
>  xen/arch/arm/include/asm/gic_v3_its.h |  18 +++--
>  3 files changed, 100 insertions(+), 74 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 972825bf06..454fd0e0ef 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -52,43 +52,40 @@ struct its_device {
>      struct pending_irq *pend_irqs;      /* One struct per event */
>  };
> =20
> -/*
> - * It is unlikely that a platform implements ITSes with different quirks=
,
> - * so assume they all share the same.
> - */
>  struct its_quirk {
>      const char *desc;
> -    bool (*init)(struct host_its *hw_its);
>      uint32_t iidr;
>      uint32_t mask;
> +    uint32_t its_flags;
> +    /*
> +     * lpi_flags are ORed into the global host LPI policy and must only
> +     * contain additive restrictions. Non-additive LPI quirks need expli=
cit
> +     * handling.
> +     */
> +    uint32_t lpi_flags;
>  };
> =20
> -static uint32_t __ro_after_init its_quirk_flags;
> -
> -static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
> -{
> -    its_quirk_flags |=3D HOST_ITS_WORKAROUND_NC_NS |
> -        HOST_ITS_WORKAROUND_32BIT_ADDR;
> -
> -    return true;
> -}
> -
>  static const struct its_quirk its_quirks[] =3D {
>      {
>          .desc	=3D "R-Car Gen4",
>          .iidr	=3D 0x0201743b,
>          .mask	=3D 0xffffffffU,
> -        .init	=3D gicv3_its_enable_quirk_gen4,
> +        .its_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADD=
R,
> +        .lpi_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADD=
R,
>      },
>      {
>          /* Sentinel. */
>      }
>  };
> =20
> -static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> +static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr=
)
>  {
>      const struct its_quirk *quirks =3D its_quirks;
> =20
> +    /*
> +     * The first matching quirk wins. More specific quirks must be liste=
d
> +     * before broader IIDR-only entries.
> +     */
>      for ( ; quirks->desc; quirks++ )
>      {
>          if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> @@ -98,53 +95,38 @@ static const struct its_quirk *gicv3_its_find_quirk(u=
int32_t iidr)
>      return NULL;
>  }
> =20
> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>  {
>      uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
>      const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
> =20
> -    if ( quirk && quirk->init(hw_its) )
> -        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
> -}
> -
> -static void gicv3_its_validate_quirks(void)
> -{
> -    const struct its_quirk *quirk =3D NULL, *prev =3D NULL;
> -    const struct host_its *hw_its;
> -
> -    if ( list_empty(&host_its_list) )
> -        return;
> -
> -    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);
> -    prev =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_=
IIDR));
> -
> -    list_for_each_entry(hw_its, &host_its_list, entry)
> +    if ( quirk )
>      {
> -        quirk =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + =
GITS_IIDR));
> -        BUG_ON(quirk !=3D prev);
> -        prev =3D quirk;
> +        hw_its->quirk_flags |=3D quirk->its_flags;
> +        gicv3_lpi_update_host_flags(quirk->lpi_flags);
> +        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
>      }
>  }
> =20
> -uint64_t gicv3_its_get_cacheability(void)
> +uint64_t gicv3_mem_get_cacheability(uint32_t flags)
>  {
> -    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
> +    if ( flags & GICV3_QUIRK_MEM_NC_NS )
>          return GIC_BASER_CACHE_nC;
> =20
>      return GIC_BASER_CACHE_RaWaWb;
>  }
> =20
> -uint64_t gicv3_its_get_shareability(void)
> +uint64_t gicv3_mem_get_shareability(uint32_t flags)
>  {
> -    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
> +    if ( flags & GICV3_QUIRK_MEM_NC_NS )
>          return GIC_BASER_NonShareable;
> =20
>      return GIC_BASER_InnerShareable;
>  }
> =20
> -unsigned int gicv3_its_get_memflags(void)
> +unsigned int gicv3_mem_get_alloc_flags(uint32_t flags)
>  {
> -    if ( its_quirk_flags & HOST_ITS_WORKAROUND_32BIT_ADDR )
> +    if ( flags & GICV3_QUIRK_MEM_32BIT_ADDR )
>          return MEMF_bits(32);
> =20
>      return 0;
> @@ -391,13 +373,17 @@ static void *its_map_cbaser(struct host_its *its)
>      uint64_t reg;
>      unsigned int order;
>      void *buffer;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(its->quirk_flag=
s);
> +    uint64_t shareability =3D gicv3_mem_get_shareability(its->quirk_flag=
s);
> +    unsigned int memflags =3D gicv3_mem_get_alloc_flags(its->quirk_flags=
);
> =20
> -    reg  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHI=
FT;
> -    reg |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILIT=
Y_SHIFT;
> -    reg |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILI=
TY_SHIFT;
> +    reg  =3D MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
> +    reg |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                     GITS_BASER_OUTER_CACHEABILITY_MASK);
> +    reg |=3D MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK)=
;
> =20
>      order =3D get_order_from_bytes(max(ITS_CMD_QUEUE_SZ, SZ_64K));
> -    buffer =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    buffer =3D alloc_xenheap_pages(order, memflags);
>      if ( !buffer )
>          return NULL;
> =20
> @@ -438,8 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
>  /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
>  #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
> =20
> -static int its_map_baser(void __iomem *basereg, uint64_t regc,
> -                         unsigned int nr_items)
> +static int its_map_baser(struct host_its *its, void __iomem *basereg,
> +                         uint64_t regc, unsigned int nr_items)
>  {
>      uint64_t attr, reg;
>      unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(regc);
> @@ -447,10 +433,14 @@ static int its_map_baser(void __iomem *basereg, uin=
t64_t regc,
>      unsigned int table_size;
>      unsigned int order;
>      void *buffer;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(its->quirk_flag=
s);
> +    uint64_t shareability =3D gicv3_mem_get_shareability(its->quirk_flag=
s);
> +    unsigned int memflags =3D gicv3_mem_get_alloc_flags(its->quirk_flags=
);
> =20
> -    attr  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SH=
IFT;
> -    attr |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILI=
TY_SHIFT;
> -    attr |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABIL=
ITY_SHIFT;
> +    attr  =3D MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
> +    attr |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                      GITS_BASER_OUTER_CACHEABILITY_MASK);
> +    attr |=3D MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK=
);
> =20
>      /*
>       * Setup the BASE register with the attributes that we like. Then re=
ad
> @@ -464,7 +454,7 @@ retry:
>      table_size =3D min(table_size, 256U << BASER_PAGE_BITS(pagesz));
> =20
>      order =3D get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(p=
agesz), U)));
> -    buffer =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    buffer =3D alloc_xenheap_pages(order, memflags);
>      if ( !buffer )
>          return -ENOMEM;
> =20
> @@ -562,7 +552,7 @@ static int __init gicv3_its_prepare_single_its(struct=
 host_its *hw_its)
>      if ( ret )
>          return ret;
> =20
> -    gicv3_its_enable_quirks(hw_its);
> +    gicv3_its_collect_quirks(hw_its);
> =20
>      return 0;
>  }
> @@ -592,18 +582,19 @@ static int __init gicv3_its_init_single_its(struct =
host_its *hw_its)
>          case GITS_BASER_TYPE_NONE:
>              continue;
>          case GITS_BASER_TYPE_DEVICE:
> -            ret =3D its_map_baser(basereg, reg, BIT(hw_its->devid_bits, =
UL));
> +            ret =3D its_map_baser(hw_its, basereg, reg,
> +                                BIT(hw_its->devid_bits, UL));

You are passing hw_its now, so there is no need to pass the last
argument, because its_map_baser() can calculate it by itself.

>              if ( ret )
>                  return ret;
>              break;
>          case GITS_BASER_TYPE_COLLECTION:
> -            ret =3D its_map_baser(basereg, reg, num_possible_cpus());
> +            ret =3D its_map_baser(hw_its, basereg, reg, num_possible_cpu=
s());
>              if ( ret )
>                  return ret;
>              break;
>          /* In case this is a GICv4, provide a (dummy) vPE table as well.=
 */
>          case GITS_BASER_TYPE_VCPU:
> -            ret =3D its_map_baser(basereg, reg, 1);
> +            ret =3D its_map_baser(hw_its, basereg, reg, 1);
>              if ( ret )
>                  return ret;
>              break;
> @@ -738,6 +729,7 @@ int gicv3_its_map_guest_device(struct domain *d,
>      struct its_device *dev =3D NULL;
>      struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
>      int i, ret =3D -ENOENT;      /* "i" must be signed to check for >=3D=
 0 below. */
> +    unsigned int memflags;
>      unsigned int order;
> =20
>      hw_its =3D gicv3_its_find_by_doorbell(host_doorbell);
> @@ -801,8 +793,9 @@ int gicv3_its_map_guest_device(struct domain *d,
>      ret =3D -ENOMEM;
> =20
>      /* An Interrupt Translation Table needs to be 256-byte aligned. */
> +    memflags =3D gicv3_mem_get_alloc_flags(hw_its->quirk_flags);
>      order =3D get_order_from_bytes(max(nr_events * hw_its->itte_size, 25=
6UL));
> -    itt_addr =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    itt_addr =3D alloc_xenheap_pages(order, memflags);
>      if ( !itt_addr )
>          goto out_unlock;
> =20
> @@ -1214,8 +1207,6 @@ int __init gicv3_its_init(unsigned int host_lpi_bit=
s)
>              return ret;
>      }
> =20
> -    gicv3_its_validate_quirks();
> -
>      if ( list_empty(&host_its_list) )
>          return 0;
> =20
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 9ee338edc2..accfd48a74 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -8,6 +8,7 @@
>   */
> =20
>  #include <xen/cpu.h>
> +#include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
> @@ -78,9 +79,29 @@ struct lpi_redist_data {
> =20
>  static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
> =20
> +/*
> + * Host LPI flags are scoped to shared LPI/Redistributor state, not to a=
n
> + * ITS instance. Arm IHI 0069H.b section 5.1.1 says "LPI configuration i=
s
> + * global". Section 12.11.33 (GICR_PROPBASER) makes mismatched values
> + * UNPREDICTABLE for Redistributors that share an LPI Configuration tabl=
e
> + * while GICR_CTLR.EnableLPIs =3D=3D 1. Section 12.11.32 (GICR_PENDBASER=
)
> + * similarly makes mismatched OuterCache, Shareability or InnerCache val=
ues
> + * across Redistributors UNPREDICTABLE while GICR_CTLR.EnableLPIs =3D=3D=
 1.
> + *
> + * Keep this policy in the LPI code and accumulate only explicit LPI/RD
> + * restrictions into it. Per-ITS restrictions stay in host_its::quirk_fl=
ags
> + * for GITS_CBASER, GITS_BASER<n> and ITT memory.
> + */
> +static uint32_t __ro_after_init host_lpi_flags;
> +
>  #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
>  #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
> =20
> +void __init gicv3_lpi_update_host_flags(uint32_t flags)
> +{
> +    host_lpi_flags |=3D flags;
> +}
> +
>  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
>  {
>      union host_lpi *block;
> @@ -228,6 +249,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int =
cpu)
>  {
>      void *pendtable;
>      unsigned int order;
> +    unsigned int memflags =3D gicv3_mem_get_alloc_flags(host_lpi_flags);
> =20
>      if ( per_cpu(lpi_redist, cpu).pending_table )
>          return -EBUSY;
> @@ -239,7 +261,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int =
cpu)
>       * physically contiguous memory.
>       */
>      order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (u=
nsigned long)SZ_64K));
> -    pendtable =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    pendtable =3D alloc_xenheap_pages(order, memflags);
>      if ( !pendtable )
>          return -ENOMEM;
> =20
> @@ -262,6 +284,8 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdis=
t_base)
>  {
>      const void *pendtable =3D this_cpu(lpi_redist).pending_table;
>      uint64_t val;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(host_lpi_flags)=
;
> +    uint64_t shareability =3D gicv3_mem_get_shareability(host_lpi_flags)=
;
> =20
>      /*
>       * The memory should have been allocated while preparing the CPU (or
> @@ -275,9 +299,10 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdi=
st_base)
> =20
>      ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
> =20
> -    val  =3D gicv3_its_get_cacheability() << GICR_PENDBASER_INNER_CACHEA=
BILITY_SHIFT;
> -    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEAB=
ILITY_SHIFT;
> -    val |=3D gicv3_its_get_shareability() << GICR_PENDBASER_SHAREABILITY=
_SHIFT;
> +    val  =3D MASK_INSR(cacheability, GICR_PENDBASER_INNER_CACHEABILITY_M=
ASK);
> +    val |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                     GICR_PENDBASER_OUTER_CACHEABILITY_MASK);
> +    val |=3D MASK_INSR(shareability, GICR_PENDBASER_SHAREABILITY_MASK);
>      val |=3D GICR_PENDBASER_PTZ;
>      val |=3D virt_to_maddr(pendtable);
> =20
> @@ -304,10 +329,13 @@ static int gicv3_lpi_set_proptable(void __iomem * r=
dist_base)
>  {
>      uint64_t reg;
>      unsigned int order;
> +    uint64_t cacheability =3D gicv3_mem_get_cacheability(host_lpi_flags)=
;
> +    uint64_t shareability =3D gicv3_mem_get_shareability(host_lpi_flags)=
;
> =20
> -    reg  =3D gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEA=
BILITY_SHIFT;
> -    reg |=3D GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEAB=
ILITY_SHIFT;
> -    reg |=3D gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY=
_SHIFT;
> +    reg  =3D MASK_INSR(cacheability, GICR_PROPBASER_INNER_CACHEABILITY_M=
ASK);
> +    reg |=3D MASK_INSR(GIC_BASER_CACHE_SameAsInner,
> +                     GICR_PROPBASER_OUTER_CACHEABILITY_MASK);
> +    reg |=3D MASK_INSR(shareability, GICR_PROPBASER_SHAREABILITY_MASK);
> =20
>      /*
>       * The property table is shared across all redistributors, so alloca=
te
> @@ -317,9 +345,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rd=
ist_base)
>      {
>          /* The property table holds one byte per LPI. */
>          void *table;
> +        unsigned int memflags =3D gicv3_mem_get_alloc_flags(host_lpi_fla=
gs);
> =20
>          order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids, (u=
nsigned long)SZ_4K));
> -        table =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +        table =3D alloc_xenheap_pages(order, memflags);
> =20
>          if ( !table )
>              return -ENOMEM;
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index e1322b94f8..9230705181 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -110,8 +110,9 @@
>  #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
>  #define HOST_ITS_USES_PTA               (1U << 1)
> =20
> -#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
> -#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
> +/* GICv3 memory-related quirk flags. */
> +#define GICV3_QUIRK_MEM_NC_NS           (1U << 0)
> +#define GICV3_QUIRK_MEM_32BIT_ADDR      (1U << 1)
> =20
>  /* We allocate LPIs on the hosts in chunks of 32 to reduce handling over=
head. */
>  #define LPI_BLOCK                       32U
> @@ -128,6 +129,11 @@ struct host_its {
>      unsigned int itte_size;
>      spinlock_t cmd_lock;
>      void *cmd_buf;
> +    /*
> +     * Workaround flags scoped to this ITS instance, including memory
> +     * accessed through GITS_CBASER, GITS_BASER<n> and ITT memory.
> +     */
> +    uint32_t quirk_flags;
>      unsigned int flags;
>  };
> =20
> @@ -157,6 +163,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
>  /* Initialize the host structures for LPIs and the host ITSes. */
>  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
>  int gicv3_its_init(unsigned int host_lpi_bits);
> +void gicv3_lpi_update_host_flags(uint32_t flags);
> =20
>  /* Store the physical address and ID for each redistributor as read from=
 DT. */
>  void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
> @@ -199,10 +206,9 @@ struct pending_irq *gicv3_assign_guest_event(struct =
domain *d,
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>                                   uint32_t virt_lpi);
> =20
> -/* ITS quirks handling. */

Maybe leave the comment? Just change "ITS" to "ITS/LPI" ?

> -uint64_t gicv3_its_get_cacheability(void);
> -uint64_t gicv3_its_get_shareability(void);
> -unsigned int gicv3_its_get_memflags(void);
> +uint64_t gicv3_mem_get_cacheability(uint32_t flags);
> +uint64_t gicv3_mem_get_shareability(uint32_t flags);
> +unsigned int gicv3_mem_get_alloc_flags(uint32_t flags);
> =20
>  #else

--=20
WBR, Volodymyr=

