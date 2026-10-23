Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C685606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=va6Z2fz9
Received: from list by lists.xenproject.org with outflank-mailman.1459471.1671375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKHTp-0006Fe-PV; Fri, 23 Oct 2026 15:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459471.1671375; Fri, 23 Oct 2026 15:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKHTp-0006FX-Mi; Fri, 23 Oct 2026 15:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1459471;
 Fri, 23 Oct 2026 15:46:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xKHTp-0006FR-1O
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 15:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKHTo-00Ffvh-EJ
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 17:46:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adb813d-bab6-0a2a0a5309dd-0a2a450b94da-42
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 17:46:52 +0200
Received: from [52.101.193.4]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adb816b-b7e8-0a2a450b0019-3465c104d2b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 17:46:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5663.namprd03.prod.outlook.com (2603:10b6:a03:27b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 15:46:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 15:46:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKSOnl+7sN4Jbpwys2XVMAy0rFGOxL/AK50oJYTWyoS8mJFt/rP4fpQu/BJTufgRP4cknLCmis6mMRefmyWUyObQKX1cDDqPN38iZT+JJtd2aUjcHiLR5LsS5spzJYcnyIAxFttX40FUrop0av0HKnL+fPF4V8lVCZ9709to6baZITEhq/wTF0bNUEGcx9CaXHuvql40IjB3/N1Xzp6uEyUmZc/5FF+Q0OspKoP/q3ST1qX8u7qw6S/VlaTSmr8uyqbP8cj2b+vRwkKO3UvrA7F3xm67ByhV47TYYFuVaM9PPJ5bFx6/CmTRX0l5jdWSylb4zP0OEHJYHBWF/YVKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sbn44joTs0DGvlSdbu8SyIdJZJ22F2VeNJN6Amc+Vog=;
 b=FFc6Uoba2/m4R4PAJ4DXmMwsV5YmClUkWuNlNTvQ0CK9/deVpJrhb2e5SZiR1kOc+zrhQngFBKkxZ1CUmnVXGeoipV/CpXh/DAWyLgMmEtUVnhgnycvaEDw7zAuB+1bjkBhHFW8T75UFJ739q0M9Q7VnOs9W9C92FoXwtb4mkPiDKv82hN4RFFeh+RvDcG2jbVMyAZCFLiNkNUqBLyERFO0Mu2WoW+Lay42yavbSHlKATTYIymUmX0ApyYZDXi5gZGe6Y9SmShFiumKb6yXwnZfKLRiq3aPIajULupJ/R7lmZZZURdVDdTYrxJkDGBTYRQm7VtWbU4NIH9yZnZkRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sbn44joTs0DGvlSdbu8SyIdJZJ22F2VeNJN6Amc+Vog=;
 b=va6Z2fz9uhl/5VZJYDQiONdcn/CewZIE6hdRAL5YulSD2o3AY63vlOelJoYoWk8lC0jUv2rFZPAmluUE4cV+mUjNYiQYDxjf80nj9030DSayM5PZfj7LzkZehpDV2DV0Q8kA8R62Dar1661uv5fZhpy5duVNBxANHXgbf04+cTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f9ec6214-8c1e-4418-af5d-86d64e940f9e@citrix.com>
Date: Fri, 23 Oct 2026 16:46:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/vcpu: ensure no write when runstate handler is NULL
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261023133316.64204-1-roger@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261023133316.64204-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e848e3-12d5-4984-ef9d-08df311cd829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261013131602099003|261009223027099003|261022105027099003|261022075727099003|261021121427099003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rl8MD/WZf9V++InM+LVK+hRfntnX0KesRlsfdYBmK9usHqwYMmrq512wDfIKHIHWMzBzw2eZNq/YyXrVvH5VedS41MSywhp1UmcWh5N8iMskhbNpNWmVAL6xsjUQGKU1+My+lnX02xnZn8yJB7fAZrD0woL+D1JGY1z4RKMTAGM1V/CVssPXUjxAXemWH5dTctIEq0IGJelBP7e93sZBjclCVlagbnnp1kBYlCplZz7vaocanhC4HmSnETtAhGD0JbP0PSiqFA3SzKBKqGe5G9qSAwc3aW06XA11hJ4+FeTPPGbleg+mamJH4jWzwhamCkOD7Y67GYrFHRm1G82hv4DNOsb8dK9fGcwKETpPwRm65B/IoTJk2lJXqxKVI2re9YIQ5e5CCcY8m/0Qoa4UsCxyVJXHbBfDqVesVAocLyfDJyl4G0mEc7xhHb8/UeVDWBJNpwjvyeXp2q86C0a+OBC+NfLQcWjIH/rwcChiDDmaXKUP/04wlZxj915R/iryHW7jf5fF7x1phjCAJErfuhOk58ECbZlViJ1DBDxcUe10WQPm8Rbg+oke1Krq54pUc66EnPBgmv5EIQlQsAFEUWm7VJP1nhMKXBOwW0YF17TjJNS90FMSnFrwgEGnkBiCjaVFmMrBWL0ZyIogsB6fRYCsM/hHgpRQofknPBZfArA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261013131602099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UENsL1RGUGtnVDIyWTZwallLY01wakxTTkN6QVFUSFMzMGFjdy8xa3dFRmhI?=
 =?utf-8?B?K0Qyd25iNkF0dWk0RlMwVktIdFpHaUxkdVl5UzJHQXBaY3hOcTZncDhXVy84?=
 =?utf-8?B?SWUzNFJCZ3ZjSzJIYkNaRGlZWTZjT3ZJWklQSlYxcjRxeXRTbFVQYXVobnV0?=
 =?utf-8?B?ZUZhRkoxcnVZRzhmTFRaVHBKakJseWxZVkFzeC9mL01lUDhQcExZbk01bE1E?=
 =?utf-8?B?NHo4M3Ywc2pDTEVSY3lIckk3VGJYWnJZM1V1RWhvbUVIQ1hrVEVvWmZSSUVX?=
 =?utf-8?B?OFlRbjBhektaWnJyNmNsdEJtN0U3OXNCZjNsMjhVUitjUjlEejAwaUlYS2Q5?=
 =?utf-8?B?Qjg4aklqY2pLS0paUHdCY0p3SWhSRHNvU3hRRjZISk9TM1djZHZQSnFlWjlo?=
 =?utf-8?B?bEhncm5vOWExcDZSb0Z4SGN3cmdVME5vUW5RMGZkOGt4b2x3eWh2NTFJWnE2?=
 =?utf-8?B?QnR2ek9QTkMxbEF0SW9hZ0dFYmcvVWMrbU92Z0hWdUpnOE8rN1BqU01ockhz?=
 =?utf-8?B?bjVDNlJCY3N1dlJRVjhoZloxclRWdlE0YTZueFUvYWpvZnBlQUFtWTBmaEM3?=
 =?utf-8?B?NlkxWWY5UC9Bb25VbnhaaStpSWw1bE9QeXFRSkFmVlVKQVJXOTR6QWk5Q1d6?=
 =?utf-8?B?MHhlVnJ2QVBCYVY3SU1TN0dCS3lBNkZuUXhjSUh2Rzh1Q3VIUXpRb2h3dHJy?=
 =?utf-8?B?Si9QcWlqTTQ0cTI5bjBIa1A2Um45VGpPQjZHeC83WERlVm0yeXBYcS9vWjM0?=
 =?utf-8?B?WUNFN3UxYzhXMXRZTi9tYWNXQXhWYVBPUnA0MmJuVjFidDNWVUVsUTVCQ0w1?=
 =?utf-8?B?TGd1ZDJyb2Z6UElpVTY0WWY2ZVFuZzJIVndOMStEbHo2bFlLK1hCT2dZMnNk?=
 =?utf-8?B?Skh5ZDVNY29aNm9TdWZmU0kyYlQyMnRvRWhVTHorOGJ5V1Byajh1cEV2QzU3?=
 =?utf-8?B?RVRDSGVRSS9BNzdZWWpQb3R3QmFoMy9VUXhXajVocE42L0RNSHhWVlRvMHd2?=
 =?utf-8?B?MHZBOUVtTm9ObXVVZDdOQnFiVytHRGJoaUxmc2JyVG5vYndYSXVKdDB6QmRM?=
 =?utf-8?B?c2psZEhIK0NNMkRwdzJMa3pTRFVlNERGS21CanpUL3pSK2Qxdit6cHJlbkxU?=
 =?utf-8?B?TFhQbDR2VzhuWXRZekZvZG1XK0lCRWFBallLamJIRzFKODdXVUtHMUNVY0gy?=
 =?utf-8?B?TGhNTjIwcjlRRnd3a000Mm01Y3VnT1doZFBiVFdRcjlUU2tHYmJvRHhEZHF6?=
 =?utf-8?B?anVkS2JZU2FUcUQvUzlFT3crNHpEZHlKa1VRWmJwaDg2dWpTaUVaQ1A2OWU5?=
 =?utf-8?B?V0xYL2V3NHhuYm91c3NzUlJ2Y0hxN2tMSTROUEVuUjNIYTVoeHlYVEJEaEsr?=
 =?utf-8?B?MHc4ZUZ5aStpVDliT25hdkFHQmZBa2dkYmwyNUhrZ1F3L0wwWll6dUR5bGc4?=
 =?utf-8?B?TzBYams2elRLc0hKMzZDUWVGWXFRSUphazNQNWlSQ3hERCt4U3hrQkZ4eDlo?=
 =?utf-8?B?TEhsdkl1TVhHOW5DT0lid3lEOVFUSHVhdUVhREdrdXJ6T2FOVUhjVnRiV0Fu?=
 =?utf-8?B?MERJK0FjbUdObW83SG9CRGxjWURmRFBuVHZONjhqaHRSQnQ0U253QkZLZWdj?=
 =?utf-8?B?VlRSeWp6MHpTZHZWT01XWTBZUjl1a2VZcVRxNGwwbXRweUdrTmdQNXFBbjNt?=
 =?utf-8?B?Q3FES0xBOUpRaGZDbWRKajI0UXo0WlY0WHJkSDYreGM4eUIwclMvL2wwamJQ?=
 =?utf-8?B?QVFwT21LZGo2a2pNTXNHWDk1UWVFZjMrWWRPYURwY2wrMW5aNjFzQStISlF4?=
 =?utf-8?B?TmRyYTlSK1lTZVcyN3B4TzdRY0QraGdnb2FkUlBvUytyNEcyOER4RXdJQldx?=
 =?utf-8?B?Z2lwd1FxSlBmRzQ2NVVxMXIrMkI2Wi9Bb0x5M0ZDL3F3YTFaRXYzK0hJZ0V6?=
 =?utf-8?B?NUsxNXlJMm5LUExBQURtWnpGM3E2MHJ1dk1pdUswNjFERytKU2hmTVFWUHc5?=
 =?utf-8?B?WFJ0dmQwT2tONlozRHd5N0tIOU12OHhMUmtlWGU1SkllR2FZbXYxdzVMaGRk?=
 =?utf-8?B?cUhVc2NtR252VHpLUkhIRWVmbXM0TFVGZ1JXOSs1SGx6NDhtS0RINloxYnhQ?=
 =?utf-8?B?Q2tKL0VsK1MxeTVmaDlHYnJFenRST3RkYXVFTHpPeFBCVFlLREF6QmNvK3cv?=
 =?utf-8?B?NThKQXZZZVVNT2QwOW1SSzUzMWluMXBlYmpRQXJVK0lhbkZIVllObDFTQXZ3?=
 =?utf-8?B?UFQyek5hNnI5UERYeDk0ZVlsOG90V2MxS3Y5MTVvZktTNlVrRnVXOGNWWHRi?=
 =?utf-8?B?ZjhuWktPcWF5dG5NaVdpZ3h3M2Q3TlFiTDZQclZKcWtYUkJ4Z2JtcTRsTzli?=
 =?utf-8?Q?9Q2cmswuSZz6vKUs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e848e3-12d5-4984-ef9d-08df311cd829
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:46:46.7203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgZTYgV6Cjd6rTzOLh0AlydO3lVELTe+T726kz+t2Umywe21g+YzrCayFihMLwDSKLVLhWvIXvXBNuTJJBJ8OhclSijhtXtZXMgchvO0JgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5663
X-purgate-ID: tlsNG-42698a/1792770412-AA4DB9EA-27E964D3/0/0
X-purgate-type: clean
X-purgate-size: 3210
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 2:33 pm, Roger Pau Monne wrote:
> Both the normal and the compat versions of
> VCPUOP_register_runstate_memory_area allow registering a NULL handler as a
> way to signal deregistration of the previous area, and
> update_runstate_area() will skip the update when the handler is NULL.
>
> However when handling the VCPUOP_register_runstate_memory_area hypercall
> itself there's an unconditional attempt to update the newly registered
> runstate area, without taking into account whether it points to NULL.  Skip
> such update if the user-provided handle is NULL.
>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> ---
>  xen/arch/x86/x86_64/domain.c | 4 ++++
>  xen/common/domain.c          | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
> index a02d4f569ee5..e4d49cbbfeb6 100644
> --- a/xen/arch/x86/x86_64/domain.c
> +++ b/xen/arch/x86/x86_64/domain.c
> @@ -58,6 +58,10 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = 0;
>          guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
>  
> +        /* NULL handle is deregistering the address. */
> +        if ( compat_handle_is_null(area.addr.h) )
> +            break;
> +
>          if ( v == current )
>          {
>              XLAT_vcpu_runstate_info(&info, &v->runstate);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6b52713518da..30a17b8b7edb 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2330,6 +2330,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = 0;
>          runstate_guest(v) = area.addr.h;
>  
> +        /* NULL handle is deregistering the address. */
> +        if ( guest_handle_is_null(area.addr.h) )
> +            break;
> +
>          if ( v == current )
>          {
>              __copy_to_guest(runstate_guest(v), &v->runstate, 1);

This is all horrible.

I think you ought to add /* Update the newly-registered runstate area,
best-effort */ to both of these hunks.

I also think it would be easier to follow with the commit message
structured in a different order.  I suggest:

--8<--
The VCPUOP_register_runstate_memory_area hypercall tries to update the
newly registered area, even when NULL is being registered.  If the guest
happens to have memory mapped at 0 in the address space, this write will
succeed.

Ever since it's introduction in Xen 3.0, NULL is the initial state of
the pointer, and guards the update of the runstate area in
context_switch().  NULL has also been accepted as an input to the hypercall.

It is unclear whether de-registration of the area was considered at the
time, but the behaviour of the hypercall has always supported. 
De-registering using NULL is a common pattern for other hypercalls, so
formally make this the case for VCPUOP_register_runstate_memory_area by
skipping the update if the area has been de-registered.
--8<--

I think you also want an adjustment to the public header file to say
that NULL can be used to de-register.

Thoughts?

~Andrew

