Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E37C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:58:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416636.1645612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50pI-0001mB-5K; Fri, 11 Sep 2026 12:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416636.1645612; Fri, 11 Sep 2026 12:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50pI-0001m0-2X; Fri, 11 Sep 2026 12:57:56 +0000
Received: by outflank-mailman (input) for mailman id 1416636;
 Fri, 11 Sep 2026 12:57:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x50pG-0001lJ-Gf
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:57:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50pF-00EA3k-TY
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:57:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3fac4-8faa-0a2a0a5109dd-0a2a4506e3fa-44
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:57:53 +0200
Received: from [52.101.85.55]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3facf-195a-0a2a45060019-34655537d099-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:57:53 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA6PR03MB060200.namprd03.prod.outlook.com (2603:10b6:208:5ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 12:57:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 12:57:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbgGARKv6SNXGUvr4GHU5U7C5RbrD/83xpegKuridb6mTzq/ao0j8XdU0jxWEn90BiXtWTvOxRZVojALVpaXHr5NPa9dYsCvQYz6v9GmX2rvqZhIjJgrGZe5IPgof6tQuvPvbIbgEuyYnMenD2UI+e8riKMGbKz5tz2Gl1txkR1KS6ULdMS0KjbHDICIMlKDTR7+7xlmDBvw3q4TqejJ1ZmiOwr/o3Z4PI+HmsVj3Z5Yhh2BwbrmDZh5nb9kDvKNhs0YEGyhbz9QVfygSDNFGoUMgDN0OpJTjKEg7TW2RD/MaB3lhzI0P3WEDY2GE4P03iamzSqYsXWN2H4n0ZQuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaSpI75vANXUIHNFNH11hgxx/Xjouu6tt3l28Xhfy4g=;
 b=xxKqzYJEmR6CMozfcORU9Oc+l1flRah0hfDUBafUWqUKr5A+AT1tEvnilacAVubidZS/a4qRf7oMl6VNM3uI7zXYGK6cXoWNv/fBYGK+MxilOyxOQLiRILzRc05DC6dZ69KW5SWEOUk+ULwxzmruWXqoIva0jEd7/N6TAfYDCjf9+4ZmO5caH68mOnfnU06rdNuCPcJvsmtPHZ/nsGfoeCDBgUJ+JCKaTbhtuHhL+N8JJbUFP6t2Qt5OFKr65XO1cfSif61Gdsl0SLAO7n5coBtDJpc+DYDuoMjN0h2cwaAQZPv97cE3aPSE+OBD1dRPi9joawFfowPwhavi6BNEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaSpI75vANXUIHNFNH11hgxx/Xjouu6tt3l28Xhfy4g=;
 b=ls/GPnDjkGL8kumAatCNR2GMt5oYdQfsrL3w24rw7/L3KZmil8EKri20VjZV4DfB0e7J/rO4W1WL3876ML5q4gWy8cVflszIda/3ghVPYIrQNq+x1ZFpyUiNNfco0iO0sa1LVjnfC/aEe59je6TqXeqhec4dzows4HjULzoEfF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
Date: Fri, 11 Sep 2026 13:57:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 teddy.astie@vates.tech
Subject: Re: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-4-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260910203113.462943-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA6PR03MB060200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e94f8da-d4ae-459a-b045-08df10044654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v/dQgkB/4/jgqdka2grXVr81jg3OJuQEIG8LlMtwmF+0PmublktQoSO+oiEBD6MB+HaBa9JGCsh0u8aVNNmGQdouGvfv/Demng/cmWpWdhk+WNAEelnyTjR8mMZVv42NX37DsPcCS1SC94emGu9BWRV5JIYXMsYDZwmUwie35kg61BLyTQeGUi7Ge9nQbUtRSBpRVf+lgASRfNA6abQFE5GrL9rn9B/aBvPyonvN8U1kMfsCF6vzk1QtiUz1HO9fIif3pxuQScSWmLkIWAa8z7tGcOD1ZJHoB9NlCQBl/JfKJRSrptwleROBwbEMbUpOiLsaS5NTx7Zt1pDg3ml9msxEPRQhj1OUSgpZcXzdaWiMS/oAxPYe17FF2Xle833KgjhNvPKSwP0fO+/ip+R9Ngr9fk64bBHVjUqQJeh6ajXbMrbwWEWJ6nYAGxMF5BjT8dJec3v0A7OSG7Z/Oau+6iBc/ZwVBWs4eC4PctwswybX8FUjS5SgmvLQhTzZqw3GqwyCTPcam0suwchUb8+cLGMVcpQNZxaLH0g6u84ip/vl+pDCxW7EKKqUJ36S9kv2RtJ9OVBnI0shozsfC6uGSFoDW0+F6QxdWSSXEGvQeRchArQpUEq7xR7zI9VoHtLpdy9LMadXHaYHmugvdWW1KyQVw8ZQXEPHq22GKN/GLvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE5PR2pPOTdmc2o2TWNXNUM3eUgwWWg1UmtCdHI2Sko3VnZXM3JDYko4Vk9J?=
 =?utf-8?B?SE13ZjhSMmVmTGVkYjdhV1Nydjg0UjBOdzhpWTdqYTlrdC9pV0FLc0dlT3ZO?=
 =?utf-8?B?elJkVkJVclhFS2E1SmtrNFc1NTI4QXhKdERGSEw5eTZ6OTV0N3FqRE5neVdn?=
 =?utf-8?B?R0gwdjFnb0tZM0JldlVGYjN0NU1aZ3R1ZG5Mc3NBRzZwODZMS0Z3aW9uaWVQ?=
 =?utf-8?B?ZUl1aDcrb1lWZ1E5WFE0RGM1aG9ZRWFaUW1NLzgvY2FLQ0lkTGJHdThvU0dC?=
 =?utf-8?B?Y1Rtd3VYYm1hTXJXZHh3REYwemwrRDltVVhrV2M5VTdTZFlIQ1ZBSlVxcGNt?=
 =?utf-8?B?eU9PaGszY0xSa2ZKU1JncXE1N3Ird2xuOGtUTHYwRDBYMEpQcXkraUFkMFB6?=
 =?utf-8?B?WVNXcmQ0bEdONmxnUkt3SkJxTzVJTU9pZ20rT1VNbWo3aEVIOXduT2pGcWxw?=
 =?utf-8?B?ejZlZ2sxNkp5bitHNkdxSlVaZkpoMkxPN01XTEp6Ukx1d0lrZFowOXkxS3hh?=
 =?utf-8?B?aE56OXduZXZlYzJiWm1xK2ZMbmRTNlFFVHk5K0VFQmluWEdHdTRyNnlkdlBG?=
 =?utf-8?B?VUhVSktoKythVDNOY090WXBHL0RDaFVacHNYaHBBU3R5L3VUMmZjTkViNGcr?=
 =?utf-8?B?SFNEb3lqT25JUXdzaDUrWjVqUnU2U2Z3SGlDdThsU29CM3pmcUZIOUNWT3Ur?=
 =?utf-8?B?dVZrVVZ3dHBuNEdqQXdTS1pyN3JrcThieDZHMkdBSVAyMUUvN3RZY0pXTm9i?=
 =?utf-8?B?N3UyUHBVYzE0UG0xNEd1Y3hYNnNBZWlFYVhUQzBBUlVFdlBpd0NIcVFWZGpH?=
 =?utf-8?B?M2tLMFh2ZTlwS0Q4SHlOQW5wejVYS05kNmcrR1dpVkdNUVVMM3pHd0hHNzlm?=
 =?utf-8?B?SmUySkx6eWxsbFhiM3NnZFlJVWpmMWQ4cUd6UktiTTZ4MGFKNG9xU3FMYW5J?=
 =?utf-8?B?VmVPWFIwKzR2WXBBelFaYUxpcUM5VzdreWtMcHB6bVRrRUh3eVRYVzN3VVUw?=
 =?utf-8?B?OTZqYkNrb01Hanc0VDhFV05mVm9yUFd4dGhESkVBQkFkNVc3eGg1cVh5ajlB?=
 =?utf-8?B?bW9aSmMzWGNNbUlxd2hMaTM2OCtvdDI1M09FR0NJRit2K3FEMHdWM1QzL0tZ?=
 =?utf-8?B?Vm9yWXhYQVN5WkhJOW13M2sxd081VUtGRTVEMlJXUWxCZTd6cVFqallld3Vl?=
 =?utf-8?B?Q014NE0xNVJtSWpCZVUzdGpMT21hMTNMMDk4VjdtOEdMR28ydTRHbGZpaW9w?=
 =?utf-8?B?ODE4NWRQZHU3WkpLYWZTektxdmJyMnAwU2gwdzhVNnhlWVl3M3gvbzRFcmFh?=
 =?utf-8?B?bEdUNE11dWwrM2lvZVJMU3czUGYycXUxMXhRY0dlTGdOTXVjN0dKUkNDVGwz?=
 =?utf-8?B?YStTYmZxNHFmdjA4ZTBYWmhOSG9MdU1KVSs1N3h3ZWNkdUlDclMzWWozQ0xl?=
 =?utf-8?B?OGZHYSthZUsweDB2RXVOeitLTUUwQU9KbHFpbnM3eTBIaklUREVWZG1EMVNE?=
 =?utf-8?B?UWpXcFRVWk5vZSttMnM4QzJaRUE5RHFadS9RVXJtYWpZTnRyRnAvbGZyY2xt?=
 =?utf-8?B?S093M0EreEE4WWxtUXphYzFuMFBwbkxLTkEvUFUwcDh3cnM2V2NSTW5DZmUw?=
 =?utf-8?B?UjhZanVNMFJkOUFyVEJ1Ukw0YzdwVmk1a0xsQUk0aGQ4YkZZa3FVYW1oc2E0?=
 =?utf-8?B?WkN3VkxiU1QyaG0vb01adFEraU5TZWNFMitTMkJNdEJMaHBvLzRhTlhUeTZF?=
 =?utf-8?B?TDcxQmJ3bGVxQ1lZaDB3L3U4NHJWVzE5RzVZQ1VVQ2NicWROQ3RpbnZjTmdz?=
 =?utf-8?B?ZlZmdDd3cDUzQ3hUR2dLY0p5a3BRaU4xRDBoT0U0cTRHRG9xNzB5NFdNYWoz?=
 =?utf-8?B?V1VuZXhjV3FwYnlRZ3lRbzhMTkp5YmxvUUhBRlNadCtUVnFFbE16QTNWUW9C?=
 =?utf-8?B?ZDZrenFQNExNTmpCTEIwNEtiL3FLTXUrT05HYS9JYlNTVGhHKzh3eWViVGZZ?=
 =?utf-8?B?UlBnSmpJUm9BSndMNjYwTmROeHUzWno5NFVJNW9PbGMrVWdsSjA2M1hIdFZp?=
 =?utf-8?B?TUhGc3JHU2ZvVzJWR3YxTFBmaHkwU2g3RUlISnllN3BWa2c1cnpuTFVJaldD?=
 =?utf-8?B?MU80ZVFIMm1ZZmZGMlFOQUl3NkpZS1ZXcVUrN0lZWSttbnc5bnBIWUxDT0pj?=
 =?utf-8?B?OXQ3UmpFa2tKZ0hUbjZ1TE85NG0xM2tUcEp4cXJJcEd1NVVKTlVldVdXNDJZ?=
 =?utf-8?B?MGh3UEN2UFVFbHQ2MnlNa1g1OHA4K1M5bEJUSW16c1BKSktsdklGeGluS3I1?=
 =?utf-8?B?OEo1azFEaUlCWEppcEZ1TGc3d0pCMnpWbXpIb09pWndCLzVaNFhpZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e94f8da-d4ae-459a-b045-08df10044654
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 12:57:45.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sr07cyHPItyxvuyxcKAhnrTsy3m+yMdaYMNb7XS+Kl16posaWZBE/S0bqNYNF9CdkSYxtA9gQSP2u37prNt5pH0Vt5AaMSaBcC/KgHt/jcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR03MB060200
X-purgate-ID: tlsNG-16d1c6/1789131473-F560A77B-AC4B22B1/0/0
X-purgate-type: clean
X-purgate-size: 2397

On 10/09/2026 9:31 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
> index bfee0feb7b21..f2bb26aef5b3 100644
> --- a/xen/arch/x86/pv/mm.h
> +++ b/xen/arch/x86/pv/mm.h
> @@ -64,15 +64,18 @@ static inline intpte_t paging_cmpxchg_guest_entry(
>  
>  #define PTE_UPDATE_PRESERVE_AD  (1u << 0)
>  #define PTE_UPDATE_NO_TRANSLATE (1u << 1)
> +#define PTE_UPDATE_SWAP         (1u << 2)
>  
>  /*
>   * How to write an entry to the guest pagetables.
> + * Returns the old PTE value.
>   */
> -static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
> -                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
> +static inline intpte_t update_intpte(intpte_t *p, intpte_t old, intpte_t new,
> +                                     mfn_t mfn, struct vcpu *v,
> +                                     unsigned int flags)
>  {
>  #ifndef PTE_UPDATE_WITH_CMPXCHG
> -    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
> +    if ( !(flags & (PTE_UPDATE_PRESERVE_AD | PTE_UPDATE_SWAP)) )
>          paging_write_guest_entry(v, p, new, mfn);
>      else
>  #endif
> @@ -95,15 +98,16 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
>              old = t;
>          }
>      }
> +    return old;
>  }

This seems unwise.  I think you want a return 0 in the
paging_write_guest_entry() case because returning the input cannot
possibly lead to anything good.

In turn, the comment needs adjusting.

>  
>  /*
>   * Macro that wraps the appropriate type-changes around update_intpte().
>   * Arguments are: type, ptr, old, new, mfn, vcpu
>   */
> -#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
> -    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
> -                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
> +#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                 \
> +    update_intpte(&_t ## e_get_intpte(*(_p)),                     \
> +                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n), \
>                    _m, _v, fl)

This delta is only moving the \'s I think.

However, you want to wrap the expression in _t ## e_from_intpte(...) to
hand back the type safe version.  In turn, this lets you remove the
'.l1' part of the assignments in the following patch.

~Andrew

