Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37931606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=on6k3/Nz
Received: from list by lists.xenproject.org with outflank-mailman.1480320.1684279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTLN-0004wk-DU; Mon, 09 Nov 2026 17:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480320.1684279; Mon, 09 Nov 2026 17:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTLN-0004wd-Ag; Mon, 09 Nov 2026 17:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1480320;
 Mon, 09 Nov 2026 17:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQTLL-0004wO-Mc
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 17:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQTLK-00AJgw-Qw
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 18:39:42 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af20538-e002-0a2a0a5209dd-0a2a4507deaa-36
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:39:42 +0100
Received: from [52.101.48.49]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af2055b-b4ea-0a2a45070019-346530317718-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:39:42 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PPFCDEAADB6B.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::21a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 9 Nov
 2026 17:39:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 17:39:37 +0000
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
 b=FQyD0l+zPPwV9pA4CqUCcx19NR8bj3hNRgdGnddA4h6pQJpDUdQror1s3AI1znc1gbQQkFtUo8mL38wPqEOhBElFgCSBKIJFj7P5Gb2skPKM19t6BPVviGsvlRht11kr7q6mGbtyWpyO1fqqWthJomBysACiK805dsWwqybntwEo0tJ+M0+fGJW3D3eDJG/VQAJgi8pRonLYIFmBbiDkLkPeIvcbCjviIXfBfqaeApT5Xos6epohdoRKZr4McY1ldHB42rZlGOtuyJDudst1k3vHaANxtiTLAFAqCSFE194fWWmGNLDVB6bPQvU9SLdCqVF6m+XIG0W0UxCV27SPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s3pdATWxJcyXwwoyb22xBD4nf5oF77Eurm584jQ85U=;
 b=huapEtd5fB2dWSz03YlL0Mwaa/82ys2L00eg1Y8ifritDoAfeVmUVnxRfkO5oH6TWEAIGfgb3vjnO4HZg3obHKw7t2rTZ2Ie4iHqF9cKglzG7c8q/NeacaCBMoLcobYC0TAQ7kpdtIHsR8Uvsnc3RVD1mcIKcdXszuZ5NRlEIdCuLvSR5RW/lE4T7nlNUQYYDnpXGIKCzvH0/dvt3yL0Tlmw5MAl+MbgqPYesgeN9AIk3K5DKk5NwNtcz6ELY/V0uyRqLdlqmB87kavh6HDMAkXsSVa9BIV5IiI//PRX24TpqTJFiZnvP7yN1/rWFVuLrC3GAtGJG3mjXhZ605IepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s3pdATWxJcyXwwoyb22xBD4nf5oF77Eurm584jQ85U=;
 b=on6k3/NzOv2+78boLXLNijn2BHGifdpZZVMYA+SURC0tdu9aY05fMPkpFIEZlaT3KBQxONf6DpAK6PGpCQJiii6K9IhJOvV3+d6VOorRnDh6149IfzorqWS+54xyrs1YGHpWDPjlm5rkd/w8D+v5rkMS5RLpva/bo/FUZWCU0N4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d1bde892-c515-4272-bea0-7350a79eb621@citrix.com>
Date: Mon, 9 Nov 2026 17:39:33 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v4 3/5] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
 <20261016164815.3109065-4-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261016164815.3109065-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PPFCDEAADB6B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a43909f-fa46-4e47-272a-08df3e886d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|22082099003|18002099003|56012099006|261102123227099003|261022113327099003|261102124527099003|261022075727099003|261026121527099003|261021121427099003|261009223027099003|11063799006|260925021311599003|260925022911599003|4143699003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	y6uhQZggomOwIAE+C1KV+YNtZSQwUYILs1E9RmopAK4fdVAbNhAahUpLRZfwVZN1NlOVjwPDi6mDolOLMKDo9zwNSj2RUMONBz6vXxbw6fNRWlg/NYJQx2GXz29XfiYZscAZqILIrC6C/c1ch8OUWg5omXdlrw4pvjDfekls0m4tbZ9OFAETdV6GNLHYgTxI1SWfQlxVTX/grJK0qrKoNjFIF82XrMzfN1RR+CrgebjRbfyuzCcxgVfHN6nk6Omsft/ENjNgOXSGCtVxz790oM0/yeF9x5Ynu1Mon/p11X9OZ4b3KBZFGcFcLLDrhHQH+R4PtQ5JNCMVa/R+tHoI2ciXCegyY1S9ctS9pRalbU/4KYwuZRAXoSn5/ngolODh8/PKzwfrNmYFZduo94pBv7GuQoMZbHe0hDGNLrSIX9dMyNl3EpbgjQF/ZxXSvjWhc4lrKTK+zSk87aVRUp+Gj3ZCGAN/5a9wW5hL/ndpAg5N0a/Dm6krYQ4C3DaUsTHvZqPlUT3jaX9BKJGSR5mltaQuUsPj66SG9omHz18w5bIRY2/kJPjs6ugPa4Y2Uy7eujjZmwK9/8KKPhcoJruf/Uq+NXldTR43llGc3kBs8SnCneyvYu8Q1NMk76zznkzQ37yFUuVroSheGC6suBVzSdy1wV91bWo/sZurU87evQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(261102123227099003)(261022113327099003)(261102124527099003)(261022075727099003)(261026121527099003)(261021121427099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(4143699003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhVQUVRb0QyMEZLeXI4N25KY2E4bmVMM0J3WFhiMzArUkd1SEY1RE92elgw?=
 =?utf-8?B?ZjBNMHZYUWRJNFEzbTVYN2NjbzhyK3g4bjlDaU5qalNxelpLYkFjSzFMUEE3?=
 =?utf-8?B?VStlVFFwRTZHWCs4d2ZaZzRseGJNQnRGWnQ0ditrd1pBM0RhY25VK0tSNzVq?=
 =?utf-8?B?c29qWXdGTFBEWjlWY2pJTDVUK0dkZTFRVXJ6b2RUQlY0MURtRzRrS3o2cGtt?=
 =?utf-8?B?NEpDcTM1Z3FmWmRjQ21wcnl6cWpEY25CK3pSVjNRbjROTWRZamsvei9TTGcw?=
 =?utf-8?B?SmlOOVFZSS93NXNKaWhQUnc1VVBuQVloditRTlNTekVZZ3RVa0FXeFI0MU9r?=
 =?utf-8?B?QlRKTnEzVzRmZ1I3d1FaTjZVNTdFVXpUellrOVZSQWNmaXZaNGxNc1ZyQTgy?=
 =?utf-8?B?bFVkMWhMeWU5Q0M3Zmw0QjJtN0NaOTg2Y2tXZGtKaWMwU09TaE5pV3huald0?=
 =?utf-8?B?WWxyU1c0TXphSnZQS0g4WnJhOFdhenQ5WGZjMWR1STNDZGJSL3M0Q2xvRm1p?=
 =?utf-8?B?bkJqa3dJS0FNRVFqd2J0d1R6aS9Ob280bFJ1bEdVbHRleU92MnU1d2tYcE9t?=
 =?utf-8?B?a0NSUmRMc3pGNG5POHJjOStVLzZYOFkwR0JmeFcwSFF2MGtSUlBWUjk2bDdS?=
 =?utf-8?B?WkZQS1lUamRWbGkyZWJtZWJXdUJtelQ4bk8zU0NhQU1GQ0t5Ym5UUUxRdjlz?=
 =?utf-8?B?bmZVUHM4OFJxWnp5WUo0dFhsZkUxL3RvU3pxelR0YkNXcE9VVVFsNkJOZHUx?=
 =?utf-8?B?TlVNY0tPaVJIMUUzd01GS1FmSG1ZSVRUbSt2ajRlVFdJemR2a3VuNnVkbWhS?=
 =?utf-8?B?bXkzNHRaeGJOcGZTRGMvSy9Ca2s4bHV3Tk96a204cHAvVnpXTG5leDVUMWlh?=
 =?utf-8?B?UTN5WGJUUVpZNGVHbTIzY0REb1NGYmdmOEhTcXZYYk53TE8xV01oY0R6R2E0?=
 =?utf-8?B?L1h0MnQvQ25xQldHcUpUcTFNSzVMdkFOOWRZZnhoL0s5KzdTN3VXaDF6WVpq?=
 =?utf-8?B?b1lEQVBOdFFRMXBhK1RrWnplRUtZcFFXR3l3SjlBcDVQOHNiNzhFNmR0ZFF1?=
 =?utf-8?B?R0ZmZEZnNjJZSG1UWHVBS1g4aTRmK2NaSm9aZ0gvOHVWclV3QWdRVWFEQlVr?=
 =?utf-8?B?c2dtTmd2ZFFBdDhIcjN6MEdPbE0wTkc0YkxVK2ZVeWlSKzc2Y3VFMGdxTWsw?=
 =?utf-8?B?anJHanF5VVoydm9GeUMrYnZWOWNUa3hyQytsQ3BBTmVWd0pEdVZBZGFLOE4v?=
 =?utf-8?B?TTMzOVRDRld6TGFQd1ZsMGJVazZoWEZjYnh5VzEvZjNMMVozbDlvWUhkcERs?=
 =?utf-8?B?cnlNazBaUm41YmdnMG5LVktESHliUVdvQUFoVTRCZEVKbURVcGZHUzVDT3Jk?=
 =?utf-8?B?RS9vQjVWR1NtdVhpRE5PWEtmcTJ5WjVETll5RnlPdDBXOGpMQ2tmV21jRXlt?=
 =?utf-8?B?VTdGVm1tdXVmbFVFQWdDMXp4MVFERmxlV254MHNSUVNnK1pSNkNSQTFCdnk3?=
 =?utf-8?B?TU4zQi9QTXZwVDBPODBTUjBtVmJGN3Z6bDgwOWw4RHJPRExybHUrV3NxRlhi?=
 =?utf-8?B?WUdJRm5CUzZOcE5yYlozRndQMHNZemJQL3RSQVQvYjNCeWpWLzZkSUR6VENk?=
 =?utf-8?B?WmovWGVSQ2ZqMG9xYUhzRlI0aW1nV3VwTnFpa2M2d2lzOUhZQTZHb3pBR3Fu?=
 =?utf-8?B?RDd1S2twWG1mUlFNSUF1ZlNZY2xYbElYSm9FWDJvdnk2OGY5UG1BWnNlV25w?=
 =?utf-8?B?NmZEanRtbi9pdWdYSGZ5azNDcjFCV2gyazY1NVl4cFlDNEMrT2IwUHRGRjVL?=
 =?utf-8?B?eFdzV3ZiZVpMb2ZOTnplMWtsV2U3YTdyaWludEx6R09rMThWVUN6SFFsWmQv?=
 =?utf-8?B?UVRTbVlyRmVrYjB3RjBBRFlJaEk2UXVHN05ZMS9INDFJOVRxK0UzWUlyMVJI?=
 =?utf-8?B?SGhOWk1tVzQrbEFMdTlmWktQTlI2WFVCN2V2bEZiWWVhL0xSVjc4NzlxM1Ir?=
 =?utf-8?B?d3pjaExOS2JHKzI4ZVpvTU5Pc2tVbzR3MzREb1hHR2hYVFNEcGFOYjk0VTVn?=
 =?utf-8?B?K3JtRmFydnpUS2VZRkxRR3VQbkVjbjh5UW1HYlR4V243T044VlFiZlJjM0tp?=
 =?utf-8?B?Y3ZOektjRmY2TlNkZzQzSG55Q2RnbzcrQlAvcTcxSU1tSlpNRkNUeXA4VnZV?=
 =?utf-8?B?Q1hiVEZiZVNwdytDNHM2bzlyYStVNnMzei8rWndxM0hSTlpETDJzYWpuWHl2?=
 =?utf-8?B?MXhENzl5ditSTUQwVnpSNGN0dkt2WS8wejRHK3djNm41dksxOStseFBiajI4?=
 =?utf-8?B?WUtQTFU5RjBNcUN5Mm1ZQTlSZWF6UTZqSk9yWDZrcXhUTWpWUnNCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a43909f-fa46-4e47-272a-08df3e886d0e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:39:37.7764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2h+ZtI3tHT6XJrTvpDMn6BeXt5SEmLQOhEviRKbUNOqeXPhXrKVWMo6G1Hgx6weVog1E/haW8xmkgjy6cOvv0NPDbxruk9CzMd50RpM7E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFCDEAADB6B
X-purgate-ID: tlsNG-ef75cf/1794245982-37AD0AE4-4BA7F057/0/0
X-purgate-type: clean
X-purgate-size: 2762
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 5:48 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 609c8595a487..ab09e0703da4 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4212,37 +4213,80 @@ long do_mmu_update(
>                       update_flags = PTE_UPDATE_PRESERVE_AD;
>                  else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>                       update_flags = PTE_UPDATE_NO_TRANSLATE;
> +                else if ( cmd == MMU_PT_UPDATE_SWAP )
> +                     update_flags = PTE_UPDATE_SWAP;
>  
>                  switch ( page->u.inuse.type_info & PGT_type_mask )
>                  {
>                  case PGT_l1_page_table:

{

> +                    l1_pgentry_t ol1e = {};
>                      rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> -                                      update_flags, v, pg_owner, NULL);
> +                                      update_flags, v, pg_owner, &ol1e);
> +
> +                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
> +                    {
> +                        req.val = ol1e.l1;
> +                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
> +                            rc = -EFAULT;
> +                    }

}

You need braces, otherwise:

arch/x86/mm.c:4227:21: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
 4227 |                     l1_pgentry_t ol1e = {};
      |                     ^


It's also a MISRA violation.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3046070649

>                      break;
>  
>                  case PGT_l2_page_table:
> +                    l2_pgentry_t ol2e = {};
> +
>                      if ( unlikely(pg_owner != pt_owner) )
>                          break;
> +
>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
> -                                      update_flags, v, NULL);
> +                                      update_flags, v, &ol2e);
> +
> +                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
> +                    {
> +                        req.val = ol2e.l2;
> +                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
> +                            rc = -EFAULT;
> +                    }
> +
>                      if ( !rc )
>                          flush_linear_pt = true;

You must set flush_linear_pt based on the success of mod_l2_entry()
before potentially clobbering rc with -EFAULT.

As this logic stands, it's an easy privilege escalation into Xen, by
causing Xen to skip a safety TLB flush.


Other than these two, everything looks in order.

~Andrew

