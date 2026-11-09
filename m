Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB7606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=VsSg8YQF
Received: from list by lists.xenproject.org with outflank-mailman.1480269.1684232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQREa-0005Dz-F8; Mon, 09 Nov 2026 15:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480269.1684232; Mon, 09 Nov 2026 15:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQREa-0005Dr-Bm; Mon, 09 Nov 2026 15:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1480269;
 Mon, 09 Nov 2026 15:24:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQREY-0005DJ-Jx
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:24:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQREX-004O8z-Q4
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:24:33 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1e59d-2eae-0a2a0a5409dd-0a2a4502951e-38
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:24:33 +0100
Received: from [52.101.85.6]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1e5af-6ca4-0a2a45020019-34655506dd29-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:24:32 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB8000.namprd03.prod.outlook.com (2603:10b6:806:42f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 15:24:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 15:24:28 +0000
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
 b=oj+Uu8FV+73lclDiBsAMcGE/w6LVPKzcyxfm88l29J9OXuFYDo91WKeefHqEK6nPMs/EYOTN6ifoECtWkvMhdzoNgroWgAin31HdDo6eox/fclYdllmpdSGKh9Zj/KfaqKkTNCXB5FQi0xEnQtQ6sGbtu+GVdZW/NHHbBN7IbzTCBqQVJb750fVxHvW5qfa8WIb9TsbYJ8GzCjUgbyJc5N6J7LX0sOACIeKFo7RBP9Y11DTB6PBdaoKjlgnALCOVLXP8yZ6lxRSug8bQ0CXNOfR+t/Zq+MKqb+w8DzK0j8a7qnGXAQtKOA78YWcHGGiUONJH3DlLeM5KIHk/24BSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bZNplKRRRnkkBx2EIY3wvJUVvyDK8glfRxVjYFGw4k=;
 b=I7IaRUW03En6/XH0hc9t3//gVuc6QuX3e+Ra2u/G+jllerG4qYODYO+6BRggyZqlB7r9zBgz7Dv3upSL5z9MVYQdqeFyIHfMpnpO+xzHVijQ19lYK7D56L+XgBULghod08kTboaYyXkf8vdRloAtkDcyBUGMAxKZfyT8WqRIRZh2ZnT7/4+0I+qa5ZRv8Vs6n/CbQjGsDl/iUFKoqEWjudsP0kIvGRUDeN/w2cMY/GdaAkgRg01lBsvgkxqJz16pSk22Oimib8lXWkbopT4WPqQzxQXjJRP3oFZpU07DEZEJsF8flLutM72ds1530PyahXE66EExlypO+XB9DlINCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bZNplKRRRnkkBx2EIY3wvJUVvyDK8glfRxVjYFGw4k=;
 b=VsSg8YQFiugFImz7OipfWTQokplWfoCWagGbAahdSp6HDNdNmpcpygWmOvnJPU8JovfYnrVAVYqZeNORXgDW2ZprnV4Mb2JVAJeLyHWX8zduSGve01UPj92d0quIMPR8feC1JC3cfvK3qJWkEyJAaS+sGZL+Ay40pF4Dpil8kTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e62245b7-0510-4e18-8789-045726f113cd@citrix.com>
Date: Mon, 9 Nov 2026 15:24:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v4 1/5] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
 <20261016164815.3109065-2-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261016164815.3109065-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: fba99f5b-9d5b-44ca-ca58-08df3e758bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|4143699003|11063799006|261102123227099003|56012099006|261021123027099003|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Z/ulIEub9eb09UOsdcj9A6aY5A7S4+/Ry6iqkCw42Rz1531EqG1eMLoUw/eBvU2CIhWRoRacWYaDHtVcbwziFQnYUo+jQW2yhBvW+Uor1M2IsBr+jdAMRiZoaJ3WRMPAAxHyiLJsVC7oFPkbSkoSOm2YnVH4C9g68porSVhYMXsvExnmuCGuAxB8gQx3S2JbEgPX4MM4iNW6rFes1AH6LsTxS31rkRuEYt4xQZWEkUhTPNHfGFDkJrPj7G9q7U0Swr+4YHayx0BSqQKIYDav7i7wnONHGTDdTQe5rXogpof8+O1G4577fYPVCeTWsZvRdtXSnSjS8Q6p3I4wxhx6APHmL+kQaCZDDL/jIUapVkWWnTm5eZC9WH6Pf8QR8ol0dCttlb0PAGZ3SNVKjC6ltMRiVScY59s3YjldDZOYj5E/d9xuXx8FY9zNCl7CsxuYfpylgLk9evd6zekZqIfHCPEm7FLvH+WQedEZ1Ng0Iqo5vlfwe5ibK9VUnqZ9eCGjO/BEh1YDRduHg9BSPyQYQBEVRzJZ5T+J307krZY2mrv6Lz2l5bcPEqBpfsFZ+5TVFLGglHpQGKipLBpDGu1EwdLGHr55y648/ANBnHPlBjzxlRVDdHJqBJqlH6meQ1G+9mzA9dtHmfwR7kS8XnGnDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(261102123227099003)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWVWbFY3V0V4eTJTWXlhck9sc0dBQnlQNERabm00SnM0ZmQ2WmxUWHVSSnhn?=
 =?utf-8?B?VXhnTjZhWEVMR2lTR2FmSjVveU5mRElZekEyZ01WVFZwWXVPeFVPYUw5ZUpQ?=
 =?utf-8?B?allMeEhITE1VQ3M3bnNjcjNPVVQzRlRlZ3E2aUtOUzBrRmhVUHlldWhzbmlm?=
 =?utf-8?B?K2hJOFVMYVJQcDhMQ2M2blMxbFdxUnFDV1FUcWxzNXozOUJmUjMxd1BnYkdG?=
 =?utf-8?B?TmcvNytSQkxJdmY5VVEzUlVPbHE2dVFIT1J0dkpUZUp5Ty9tS0NIUjFNWmZ4?=
 =?utf-8?B?QVE4RUFPMDdRclYyKyt4eVlSQ3ZyYVJJK1FRU28zTHRlZXlmcmFlMS96QTVZ?=
 =?utf-8?B?SGo1TG5TU2k2T0FZdGxMekhVMTRIcnVVTnZQU0U5b1VDakJPK1FCRWtkUGZI?=
 =?utf-8?B?cVhidXBwR2ZEbTlNYVpJM3VocHJ6aXppRnhMend5RlpiSzRFSWtib01oMTBO?=
 =?utf-8?B?eCtORWQyVGlpMnJXQ0h5bFRVS3dSaFlBc3VXdGZYZFVwb0JwYXFQR1RQSjYv?=
 =?utf-8?B?eE5WMDZ2UGpvb2x4THdKSzJzSDBySmhvMHdJdWo4YzU2eStPaldxSWlOT09L?=
 =?utf-8?B?WHVtdFNtaVpLcXU2Rm9LeDJ4cjNTNzRKaHN4bU4rdWxvNldYYUl4blgrclVy?=
 =?utf-8?B?a21PdENxMUFkbUQ4N2x5cEowVGJJUFVNYkxySmVjMnNMT2d6WU5QTG1kOG12?=
 =?utf-8?B?T0hIeWJZbUs0bENKWmlkMEJ1OHlWdEtiSnVRM1lPWDMzMnpaS2lyejRkMUVt?=
 =?utf-8?B?aDRFUENwTEh2cHI0RkFoKzlVZDBQR3JCeDRWdEFJYTZiT1lPOVBidnoxMDhR?=
 =?utf-8?B?blh0WFJkS0Q5YWczOFRDdXFXYlZiWW0vbTgrUlFoMFhQU0JIU1ptN2NubGRp?=
 =?utf-8?B?aDlnUHRWRnJPSXdMMGtkZnMvWCtpN2xJVGNGK0NBdVZhZlVwNzR0akQ1Tktz?=
 =?utf-8?B?WFFWeFpYQzA3cWZUdkRmZ2liY2svOTI1a1hJYjZpdERGNzlYYURXbjA5TW1p?=
 =?utf-8?B?cFM3dTgxUURLVEpQWTZHOXFsUVZWRW1rRlhGeTl3WmpCeUdTNU5UOVJwcG5s?=
 =?utf-8?B?b25jU2pCelZTS2s2MnVUVkNpNC9ZN2V5RkNlelpZeHFYTVQ5OGJzR24zT3B5?=
 =?utf-8?B?SjZ4LytudVRmL1N3aXV4MGd2NmV6bHJXYmd5QXhiOHg1Y1YyVFFDWCtReWto?=
 =?utf-8?B?Q3MvUFFWMGlldWZwQ29mTVhKbnVIN05JNGJqWENRdEUxZWVYUi8zT1BZUG1o?=
 =?utf-8?B?Z2UwTXc5Zkc1cWFZZ2FLbGlENFlhYlFBMnlLaVJ0ZldiV2M5UkdIYjRVWXV1?=
 =?utf-8?B?K1BTb2cxQmgya0w2T3FBUlg2R016RkNwOGVrd3ZkT3hQQTBvOFhTQU5CUzMv?=
 =?utf-8?B?MTIyS2pBcHBIdlNhdFlPUnloZndRYktoTlluSDdFeGhsS25MbkNaeUpRZUZQ?=
 =?utf-8?B?RE5rU2Iwb05XRHVXSU83endnZFJHWDV5WE15Ny9IbVhKRHhWdnlqRTJIM3c2?=
 =?utf-8?B?MFZyMlpxZkIzSWtETEV5QXNPTlRsZWl3cWlKNEJHa01TdTJrV1Jpay9DRlpC?=
 =?utf-8?B?NTAyMi9uWHZrSmo1L3g0NlV2VlB6SldrS2ZXSEVoejd5K1A2NWpvUkR2ck1y?=
 =?utf-8?B?YWpFc3F3VUM1RGZLSS9WNnB0bDFNbVdhQWk0TUwycnRNQ3FLRlU3WUlLL3Rl?=
 =?utf-8?B?Z0VNL3R0YkRvMHA0NGZ4bFgzRjBxU0FCZlo1cjk3dHNIOU4reGN5ck9velNX?=
 =?utf-8?B?Y0dpQWM3bmdWNkF3aGhMWkUyTTBHWitLeFU0cmpNdjc3bU01WHZsWDREa2Ru?=
 =?utf-8?B?cTkxNmVkRFJrNFBxUHJIVjZlR3FpTFBUZG9vQklIUUdJSE1XWFVYYi81SlVn?=
 =?utf-8?B?bGE4MmNNRmlncUN2NHFlZ291M1g1bFpFYkhxUXEyczZmTldKVk9aSUtzN21s?=
 =?utf-8?B?R1UveE0yaGUzaHViOE1rdzc4czYzS1FiZlp0QndNcnE4RDZTNVpud1hWeGNN?=
 =?utf-8?B?SkJQM1NoaEdqbEVBUndqNjYrSEk5elRha0syV0JhZkdpNjhTbU9UR3hyanJJ?=
 =?utf-8?B?VGVTazNyakpNMjRyYzR4bmNNWko5UWZaRDBWRnRINUx0Z2w2NGIrenJyT21x?=
 =?utf-8?B?USt1ak5LUEJoQ3hRMC81TDFQOVdGamcyUDlpYzZlSmd5T3laL0FuTjFWYlYx?=
 =?utf-8?B?SmRXQ2J6MEdLb09SejZPSVczOFA3UkhBbEc1UU9JbDJFUjU1ZDhSVEpyc2ll?=
 =?utf-8?B?KzRSYU1KZ0hvUUZ2Y0J3cXJpa3h4ZDdqRmFORGNyWTMrM1JpWTZXbHBLbnFx?=
 =?utf-8?B?Z242ZmZDVkZFSE4wUTYxc3hZOG5UUjBnWCtRUE1seUN4aW90UDNjZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba99f5b-9d5b-44ca-ca58-08df3e758bd6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:24:28.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ossg3eEZ/FhN8rhDVxfhVrx1dmOWtUC98fd+gKlnNstVCfQ5gGImL4QE+SaGlOT3QQPqDF2tSCejLLudXgsuFfzej00+O1uMlvFO9C7CYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB8000
X-purgate-ID: tlsNG-720697/1794237873-313CC2AC-0D83E476/0/0
X-purgate-type: clean
X-purgate-size: 1793
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 5:48 pm, Kevin Lampis wrote:
> The update_intpte() now accepts a new swap flag and if set
> returns the old pte value.
>
> No functional change for existing callers.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Changes in v4:
> - Remove UPDATE_ENTRY_SWAP
> - Don't move the backslashes in UPDATE_ENTRY
>
> Changes in v3:
> - Return 0 in the paging_write_guest_entry() case (update_intpte)
> - Add UPDATE_ENTRY_SWAP to convert return value to correct type
>
> Changes in v2:
> - Add new PTE_UPDATE_SWAP flag instead of a bool argument
> - Return the old pte value instead of turning `old` into an out pointer
> ---
>  xen/arch/x86/pv/mm.h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
> index bfee0feb7b21..381a0e25b986 100644
> --- a/xen/arch/x86/pv/mm.h
> +++ b/xen/arch/x86/pv/mm.h
> @@ -64,16 +64,22 @@ static inline intpte_t paging_cmpxchg_guest_entry(
>  
>  #define PTE_UPDATE_PRESERVE_AD  (1u << 0)
>  #define PTE_UPDATE_NO_TRANSLATE (1u << 1)
> +#define PTE_UPDATE_SWAP         (1u << 2)
>  
>  /*
>   * How to write an entry to the guest pagetables.
> + * If the SWAP flag is set then does an atomic swap and returns the old PTE
> + * value, otherwise returns 0.

This isn't quite true.  It will also return the old PTE for PRESERVE_AD,
and unconditionally in debug builds which set PTE_UPDATE_WITH_CMPXCHG.

I'd be tempted to just finish the sentence at "value."   SWAP is the
only one we care about giving a guarantee of a return, and the other
cases are far easier to see from looking at the function rather than
attempting to describe in the comment.

I can fix this up on commit if you're happy.

~Andrew

