Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D77606A337
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 01:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ivo8BZ5F
Received: from list by lists.xenproject.org with outflank-mailman.1471109.1679733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOQGi-0003lz-3W; Wed, 04 Nov 2026 01:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471109.1679733; Wed, 04 Nov 2026 01:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOQGh-0003ls-Ve; Wed, 04 Nov 2026 01:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1471109;
 Wed, 04 Nov 2026 01:58:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xOQGg-0003lZ-DY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 01:58:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOQGf-00ALSr-P3
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 02:58:25 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6aea9132-e002-0a2a0a5209dd-0a2a4504e07a-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 02:58:25 +0100
Received: from [52.101.83.80]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6aea9141-b57f-0a2a45040019-346553508bc5-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 02:58:25 +0100
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DBAPR03MB6389.eurprd03.prod.outlook.com (2603:10a6:10:195::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 01:58:22 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 01:58:22 +0000
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
 b=v3QNo3xjTqIAdUWITT1zKa6DbVbdTVCcyEXuanqlTLq/vdSVE5WTnof7OZ0zPxpkRgmpJevyHFqWjH2KEUKYqXhjpjffTFCyAq3yCc0KFCdG3yhvRpe0tPMzmgB5ynFtCNKXbaOGv1tAkoDwMysGejFFhL0lT2kvz8WvaFoukLl1IRCg0GOHNY38GDjml7EBGViPVeD86gkDEd6iZjqUPi1ib6v4gqZjRsEKNWBp4DZ6yY1pD8fLTF5zF1UCM58NNZ/IJWc8+pDaMs8FyCTeBiFX2emyo1lqWTpMhQJh7GNGyNoFlIix1Ar2Yym8R5fKp41nSSerKT1VsCo58irx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdzA7F00btTGPUo9AWqWqiTteHQNVVO/SIwforPfgDw=;
 b=lBf+CtEMAbQtmH4abLoogJ2Dh9MtgIBQ/m3Ir1uDhqDuL/so8E4xYt6/xcMD+UuxTwe9r65eg1wP2rOc1BUsKrbRubycWoucuyRLvnqAY0UNeCShs6wPi/pbEMr/5YGdkqHCH4j4yACCU9jcL06+9A8LBlj+k6+YGQcumqqltceZtteiKymhICQgx4kdIfMQeCNdiEfhWBRgLEQ3nPBA8Xqqyc9aznl2E8Dn081VOEX+PA8juX8S5y5ifbRu8kPlbM5zD+8rFqAp1ljfxtJQZFb11ZJGh6jiHvBkXNTtZX/qUxbT7/fYoIBuhqAZ+1JJ8Xm9pg1nAOBhnuG68TvrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdzA7F00btTGPUo9AWqWqiTteHQNVVO/SIwforPfgDw=;
 b=ivo8BZ5F/6ofv8wrkML65CnrxxVCJGUfBUwABdl6Y6uf9Nte+DdYnxV29ZP7gKjIrqEwc0TG3WxRukl7p/Z9wV/yr3ocp+YxE1H1uCm1nX+l4G/KFVJbyIzYJLqbn0FXGxZIYjmoN2I1wVKJPZxNWh9LHAIEi0mOOTGvTCPdGHu/IH9yYRqYzt4Ncjzy9fxy8qBEm5CSWJI7DhyB+Tl1nvAShWjQDNbqi3TpPeX+Oh2JJuMF3mObnIrHdUblChb019mEF1DsdFPFEh4EOIBHrLnIxgO0T3af+vqlIxJqHkH4iP4gtN+FUN1IHhQwwHmFI7+qxOLFRE5rFc241Xa7Ow==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/arm: domain_build.c: Use hwdom instead of dom0 where
 applicable
Thread-Topic: [PATCH] xen/arm: domain_build.c: Use hwdom instead of dom0 where
 applicable
Thread-Index: AQHda7Lnlb+EVt5zn0Gb7X+NgRmsnA==
Date: Wed, 4 Nov 2026 01:58:21 +0000
Message-ID: <87jymtnyro.fsf@epam.com>
References: <20261103164624.195576-1-michal.orzel@amd.com>
In-Reply-To: <20261103164624.195576-1-michal.orzel@amd.com> (Michal Orzel's
	message of "Tue, 3 Nov 2026 17:46:24 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DBAPR03MB6389:EE_
x-ms-office365-filtering-correlation-id: 13fd5216-2ae3-4f86-d45b-08df3a171afe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|42112799006|38070700021|261021123027099003|261022115727099003|261022105027099003|56012099006|11063799006|261028144727099003|261026121527099003|261009223027099003|261021121427099003|261021135927099003|261026140227099003|261022075727099003|10067099003|22082099003|261102123227099003|18002099003;
x-microsoft-antispam-message-info:
 JqN7lMWaoWSrRnoKzmClsrRGaKP4H8uv2KwGwswBY1ct/YC+ACh0fTHrnclDkOiNgRM77YkAhxtyv0SaLY8sjNfXgqcuVEnUmM7PziYeCtYjn28ne7/mQnJA0/bescTTjqqe4r6dwVfxAzz7WxXLrPBdsIKsEo3jzXjQwLluj/q4R8NK9SO452hTCV7b9Z68qldRNxMnP7yqKeE+bLaRHx8ys3lLJAJJv4DiMsgg9TdagXnYSV1wGu1FBEGzM/uylPdSn8TonnJqAzZS5bS/XX3JY/LFl+ETcgQTYOv+0RkQpuE/8Gzjr382vFWMITsaqcqy2mgHYqgqFIEh+9KLCqQCWoAdVhejyMiMQ7y/34G2MHdyA8Yn0ZNbiDFlD65NM1NWY3+tRm00DB6mWbI00tvCUd6JsRJaC8h7iRvm7RObCOvK+iSe4/OQ8EIU5wZDjGwvRmYhqIFmMQYPd/cXKbX2DZqIhUBgCX2/p3CRABodTQvd6Hx2uCKwk6AfjwLT9GxKzti9h/DER0oZRegjezHN7X5R1tWtiJXT0l/BDq5BKrgGx4lQ9oP7DEkckMvi7fskWvDgyRBFU6kYp6wK1C0uW8PiLIbMR96NHLI2DWfDlmzZ+XhiXGbcI8zm0MxPGqLfhOW4u1Q87TeLcwHXCVwh7G+Ymr2ALVnBMlA1IXLtt0U9M0Skc5WH2ll097PVt/X82GQncVP6PYR3mFSPJ2DSa/98wGmAmwgZq5D+ADU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(42112799006)(38070700021)(261021123027099003)(261022115727099003)(261022105027099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261009223027099003)(261021121427099003)(261021135927099003)(261026140227099003)(261022075727099003)(10067099003)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5kE7XC6xs69hxMl4MU55/U9ELNRIb5ZXelidPZVgZkJ4u9vJ4nbFbsasPi?=
 =?iso-8859-1?Q?94qaJX+qxSqKrZZNRTqnVfdL3Aey/996TG1v0VoH8ErD03IbUn7rmXtxqD?=
 =?iso-8859-1?Q?ViaxClhRSesHAqO1EorxISNxCX9+UFkQJw4Dr8ayp/xzWDxxJNMoePPiDL?=
 =?iso-8859-1?Q?OkVIR7TEUCrObLHazTRXA+JwDmWjqaewDOZtuyIqpne/FQDRX6CAD8QUbA?=
 =?iso-8859-1?Q?aqmuRN2NsqrrEdVu2Hi3YC14/JUdOHOjw7ymhNb3rJ/d2yEJ9ve1CIXtP4?=
 =?iso-8859-1?Q?yies482+BUUbRcfeXPXRADVB4TT6R7XAy19cOAXtZzPqAseUGEm90t+Cy1?=
 =?iso-8859-1?Q?dyK2zEoLNTDrpSqGDavzF0F5kPfCPAi1uMjbTuPStp4gFXiQpHy/PvJazz?=
 =?iso-8859-1?Q?bb5qh5MJOWKCVoUZtbEJRNqy6iE28+Q8o1hhx4eXkSxYXZ54dH4LWMTzOs?=
 =?iso-8859-1?Q?E3m3HZWc4Flk5xW5OvJXeEb4ri/XUdhS0B/ttRKehMUbH0CpGb8uNV4Vjw?=
 =?iso-8859-1?Q?/nDmUmIyJYrM/JWy+29Y1AbcBHfKFNwAjenHQdWn5RG9Gvpsj+3BCtuHEz?=
 =?iso-8859-1?Q?sDmtlPMy81ec7DC1eVPy8ATI3T8X/FdGA0Vm/vpNPlvDNBwSm1FOgH+JhN?=
 =?iso-8859-1?Q?2YPWICIhbokn0CAgPMNfZi7LatWCj+Kkks9VtZpVbdyzlXFoU1xrLsEGBu?=
 =?iso-8859-1?Q?oFPjOI61YEb+pRh7N/cxlKbPqqMxmGGr/uRv43ystzJvkE+Cb8WM2+6VXv?=
 =?iso-8859-1?Q?8hIFhISouU2PTnQfwu92U5KvWFrUizEMtB0qNtk4sWW8eV1od09J6PbMTY?=
 =?iso-8859-1?Q?WVgfggd/AkoGrEOV6jLUDc2M1MwmgENdXTHyHUCy1mWyFOwiBbi5hTdNSO?=
 =?iso-8859-1?Q?DKGUjbTn2VOLBlcSlq6/YS8KlxkdfSgpbODVH7kDtaQsNPOT2dMSDL7kWl?=
 =?iso-8859-1?Q?GrXfrtipi99G8AlMldTqWqenY95P/6iLK4V4FCwdTfRxHg6M3TCNul2PQx?=
 =?iso-8859-1?Q?8Sf0sqfwuMbUpDMS3TSPJQ7pFMvtMfZw4Af2GKzUkMhs6szSVQHpWTaP4Q?=
 =?iso-8859-1?Q?powzGj7y3E5IEPJK6/VzakU4KeqZ643YT4KVxyQ+2JlNcB7OhvA4riuyCd?=
 =?iso-8859-1?Q?JA3L16BbqD1RkOIBZP14YzTZ2pxIeOAA7n9VnDN+2V2XTbuI7uVNIoxOi/?=
 =?iso-8859-1?Q?HGbPuv7B8tEMhlfLzq14UptOFQJqxZNWFiluS6dRF4Jq8i0IU9s6HCtRMh?=
 =?iso-8859-1?Q?am7rMAAYq33pOBZak7/R4Oy5tL3Z/7XfAQld8aFHSZqBIU8OlBcJ09pLbm?=
 =?iso-8859-1?Q?ziVCwxxgFvnNsF50YRmulAGvW4E8HL8kePFm6+tGzRQHzxJzqBs5GPAMF0?=
 =?iso-8859-1?Q?bFNz6TQbNgZitYEL/vTPUU0D/SrIcl5Nl79YjewvAA6inn8D2TQtPTjJWq?=
 =?iso-8859-1?Q?WAj32/3D4GXdgL4vDqLsMbl/WAQg+M1tPOvBaRzO93z8EeTpXXdsJqXOgv?=
 =?iso-8859-1?Q?jN7IwhNweZMeduYYs6RoNUJmq48Rb0oDJlGZYq60iX/Dvy8JnKo6y13EUk?=
 =?iso-8859-1?Q?Cst88U8ZbGEaK4dcBcC1FJPo8PStJKL7HYVn3N4bylrIuejRJHUIEa63fs?=
 =?iso-8859-1?Q?pS0mEx/krmrSH6SMP9aWBvMdL6kRq1+H1OXcM1GMd8yplqn/jGEAzkyqG3?=
 =?iso-8859-1?Q?HDV8P6KSuVXD6TpM3pjVgK+M71aON+UyeQIzA0ZncBWn7NT4EB7o409wiM?=
 =?iso-8859-1?Q?raXG08jORoU2kodtp7NknsJPESa3jpwkO55swYZarj1/u3fPmbL5xZ7Hu8?=
 =?iso-8859-1?Q?lr9E1TePG3o7cBsTjn4SfQTimRC9jbg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fd5216-2ae3-4f86-d45b-08df3a171afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 01:58:22.0910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSilJWXl0v/p5sIHjv28EHbTpefSdZCgh8IEcfLmoMcbkMYKhkxTqC2xBFCIt3qwrCranM7Axza38rrZWVGor7fMfHIoHbzrJkprHpZMcBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6389
X-purgate-ID: tlsNG-ebf023/1793757505-585C7B50-98E41AD2/0/0
X-purgate-type: clean
X-purgate-size: 8672
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

Michal Orzel <michal.orzel@amd.com> writes:

> Since commit 52cb53f1816a ("xen/arm: dom0less hwdom construction"),
> construct_hwdom() and the helpers it relies on (allocate_memory_11(),
> prepare_dtb_hwdom(), handle_node(), find_gnttab_region(), etc.) are used
> not only for the regular dom0 but also for a hardware domain created by
> dom0less. Many comments and names on this path still refer to dom0, which
> is misleading.
>
> No functional change other than the panic messages.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> This is just the cleanup for one file with the most number of occurences =
that
> I decided to do in the free time after reviewing latest DOM0_BOOT changes=
. Other
> files also need such cleanup on Arm.
> ---
>  xen/arch/arm/domain_build.c | 44 ++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1ee1f1f6a733..606e85818eb4 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -100,7 +100,7 @@ int __init parse_arch_dom0_param(const char *s, const=
 char *e)
>  #endif
> =20
>  /*
> - * Amount of extra space required to dom0's device tree. This covers
> + * Amount of extra space required to hwdom's device tree. This covers
>   * nodes generated by Xen, which are not directly copied from the host D=
TB.
>   * It is calculated as:
>   *  - Space for /hypervisor node (128 bytes).
> @@ -111,15 +111,15 @@ int __init parse_arch_dom0_param(const char *s, con=
st char *e)
>   *    plus the appendage to the main /memory node (NR_SHMEM_BANKS * (160=
 + 16)
>   *    bytes). This overhead is dropped when CONFIG_STATIC_SHM is disable=
d.
>   */
> -#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
> -                             (NR_MEM_BANKS * 16) +                    \
> -                             (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
> -                              (NR_SHMEM_BANKS * (160 + 16)) : 0))
> +#define HWDOM_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
> +                              (NR_MEM_BANKS * 16) +                    \
> +                              (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
> +                               (NR_SHMEM_BANKS * (160 + 16)) : 0))
> =20
>  paddr_t __init hwdom_get_fdt_alloc_size(void)
>  {
>      if ( acpi_disabled )
> -        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZ=
E;
> +        return fdt_totalsize(device_tree_flattened) + HWDOM_FDT_EXTRA_SI=
ZE;
> =20
>      return ACPI_DOM0_FDT_MIN_SIZE;
>  }
> @@ -175,7 +175,7 @@ static bool __init insert_11_bank(struct domain *d,
> =20
>      res =3D guest_physmap_add_page(d, _gfn(mfn_x(smfn)), smfn, order);
>      if ( res )
> -        panic("Failed map pages to DOM0: %d\n", res);
> +        panic("Failed map pages to %pd: %d\n", d, res);
> =20
>      kinfo->unassigned_mem -=3D size;
> =20
> @@ -245,19 +245,19 @@ fail:
>   *
>   * Requirements:
>   *
> - * 1. The dom0 kernel should be loaded within the first 128MB of RAM. Th=
is
> + * 1. The hwdom kernel should be loaded within the first 128MB of RAM. T=
his
>   *    is necessary at least for Linux zImage kernels, which are all we
>   *    support today.
> - * 2. We want to put the dom0 kernel, ramdisk and DTB in the same
> + * 2. We want to put the hwdom kernel, ramdisk and DTB in the same
>   *    bank. Partly this is just easier for us to deal with, but also
>   *    the ramdisk and DTB must be placed within a certain proximity of
>   *    the kernel within RAM.
> - * 3. For dom0 we want to place as much of the RAM as we reasonably can
> + * 3. For hwdom we want to place as much of the RAM as we reasonably can
>   *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-=
bit).
> - * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
> + * 4. Some devices assigned to hwdom can only do 32-bit DMA access or
>   *    even be more restricted. We want to allocate as much of the RAM
>   *    as we reasonably can that can be accessed from all the devices..
> - * 5. For 32-bit dom0 the kernel must be located below 4GB.
> + * 5. For 32-bit hwdom the kernel must be located below 4GB.
>   * 6. We want to have a few largers banks rather than many smaller ones.
>   *
>   * For the first two requirements we need to make sure that the lowest
> @@ -293,7 +293,7 @@ fail:
>   * to be allocated in the low mem. Then for subsequent allocation, we
>   * initially allocate memory only from low mem. Once that runs out out
>   * (as described above) we allow higher allocations and continue until
> - * that runs out (or we have allocated sufficient dom0 memory).
> + * that runs out (or we have allocated sufficient hwdom memory).
>   */
>  static void __init allocate_memory_11(struct domain *d,
>                                        struct kernel_info *kinfo)
> @@ -311,7 +311,7 @@ static void __init allocate_memory_11(struct domain *=
d,
>      unsigned int bits;
> =20
>      /*
> -     * TODO: Implement memory bank allocation when DOM0 is not direct
> +     * TODO: Implement memory bank allocation when hwdom is not direct
>       * mapped
>       */
>      BUG_ON(!is_domain_direct_mapped(d));
> @@ -409,8 +409,8 @@ static void __init allocate_memory_11(struct domain *=
d,
> =20
>      if ( kinfo->unassigned_mem )
>          /* Don't want format this as PRIpaddr (16 digit hex) */
> -        panic("Failed to allocate requested dom0 memory. %ldMB unallocat=
ed\n",
> -              (unsigned long)kinfo->unassigned_mem >> 20);
> +        panic("Failed to allocate requested %pd memory. %ldMB unallocate=
d\n",
> +              d, (unsigned long)kinfo->unassigned_mem >> 20);
> =20
>      for( i =3D 0; i < mem->nr_banks; i++ )
>      {
> @@ -516,7 +516,7 @@ static int __init write_properties(struct domain *d, =
struct kernel_info *kinfo,
>           * * remove bootargs, linux,uefi-system-table,
>           *   linux,uefi-mmap-start, linux,uefi-mmap-size,
>           *   linux,uefi-mmap-desc-size, and linux,uefi-mmap-desc-ver
> -         *   (since EFI boot is not currently supported in dom0).
> +         *   (since EFI boot is not currently supported in hwdom).
>           */
>          if ( dt_node_path_is_equal(node, "/chosen") )
>          {
> @@ -1544,7 +1544,7 @@ static int __init handle_node(struct domain *d, str=
uct kernel_info *kinfo,
> =20
>      /*
>       * Even if the IOMMU device is not used by Xen, it should not be
> -     * passthrough to DOM0
> +     * passthrough to hwdom.
>       */
>      if ( device_get_class(node) =3D=3D DEVICE_IOMMU )
>      {
> @@ -1695,7 +1695,7 @@ static int __init prepare_dtb_hwdom(struct domain *=
d, struct kernel_info *kinfo)
>      kinfo->phandle_intc =3D dt_interrupt_controller->phandle;
>      fdt =3D device_tree_flattened;
> =20
> -    new_size =3D fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
> +    new_size =3D fdt_totalsize(fdt) + HWDOM_FDT_EXTRA_SIZE;
>      kinfo->fdt =3D xmalloc_bytes(new_size);
>      if ( kinfo->fdt =3D=3D NULL )
>          return -ENOMEM;
> @@ -1764,7 +1764,7 @@ static void __init find_gnttab_region(struct domain=
 *d,
>          gnttab_resource_max_frames(d, XENMEM_resource_grant_table_id_sha=
red);
> =20
>      /*
> -     * The region used by Xen on the memory will never be mapped in DOM0
> +     * The region used by Xen on the memory will never be mapped in hwdo=
m
>       * memory layout. Therefore it can be used for the grant table.
>       *
>       * Only use the text section as it's always present and will contain
> @@ -1776,7 +1776,7 @@ static void __init find_gnttab_region(struct domain=
 *d,
> =20
>  #ifdef CONFIG_ARM_32
>      /*
> -     * The gnttab region must be under 4GB in order to work with DOM0
> +     * The gnttab region must be under 4GB in order to work with hwdom
>       * using short page table.
>       * In practice it's always the case because Xen is always located
>       * below 4GB, but be safe.
> @@ -1941,7 +1941,7 @@ int __init construct_hwdom(struct kernel_info *kinf=
o,
>              return rc;
>      }
> =20
> -    /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
> +    /* Map extra GIC MMIO, irqs and other hw stuffs to hwdom */
>      rc =3D gic_map_hwdom_extra_mappings(d);
>      if ( rc < 0 )
>          return rc;

--=20
WBR, Volodymyr=

