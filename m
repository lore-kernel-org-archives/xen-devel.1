Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9ED606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=FdgOxGd2
Received: from list by lists.xenproject.org with outflank-mailman.1494534.1694007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTfKt-0005qW-R0; Wed, 18 Nov 2026 13:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494534.1694007; Wed, 18 Nov 2026 13:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTfKt-0005qP-OH; Wed, 18 Nov 2026 13:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1494534;
 Wed, 18 Nov 2026 13:04:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTfKs-0005qJ-4I
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 13:04:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTfKr-008g46-Bv
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:04:25 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afda256-e002-0a2a0a5209dd-0a2a4501a9ce-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 14:04:25 +0100
Received: from [52.101.61.55]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afda257-5bcc-0a2a45010019-34653d37cf71-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 14:04:24 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5143.namprd03.prod.outlook.com (2603:10b6:a03:1f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 13:04:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:04:04 +0000
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
 b=cvXMXeG77lmAbwr8gq1EV2ryGt2eDtOS9yp1USNfEPRewSKsoUue6sgKgvcmKDAQjKxtZKnR7R7E2z3JG67BU4VY5e/6RUpJMb9jXdm3/D0KllOpQOry5RjFJAMTxzhbN1SOb9c2KRMUfBKjrWfn24wTFD6wYHrCvKPw3/U0eR1DyUJgrvfQ9uzs4/P8tEFWqzgW3oYeeejcQJZD2cAhOJCmxHNooaeRNA9ViYisTVZre8cg3elZumJGT8E9J5QmeLy0un23kPbMQoh7J8c3s9tX39foLpi/TUy9i17EqCV6BqxXKN2RXL2+yPdcbfeyQ2urP0hcZIyV4O22ht5fwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guKv1iyCSUkSEZp2eD6hjt60+sB0S5xBoWDb/Geenag=;
 b=ozW0I9EFg2pylf4t/H2PrBaFfT2tmwbACL4CAQ/ueV3MHCg2kLX/4nzffSYIVx7xxo14MMEsS3BLgpvoajXfwuRBmQLReKmWSht85i6oebAVB8izsXy1qk9xGmV/X0U65ZLdGZR9qxSRdSrLScgCk8Yr6Cv6bK6jtwe9puVs+M+m4rzOLkl1X14mcWi96FUS7i9LrXOEsudEZPZKRpOLwsmRDpaqDjukFIvEPmVXQ2qNl3i2HnjuphNsGiELdPYtzlxUdxFL1VPAubhe7TuaQGL+JBZaTY54W8cbkiqlFdmc9NmJrkwXOpu/1PTB/XGMx8LQyX9hfB509yCMdJEQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guKv1iyCSUkSEZp2eD6hjt60+sB0S5xBoWDb/Geenag=;
 b=FdgOxGd2t57+woAt97tUMVCjWtuYKnynqCdjBMqjk7UVreSPnVPyWHSgs9/JNOHcl4qiTR8wSL1Dn/3kM8BuUBGNsn7bkL1VtdjTOI4zUso3BHN7gqseydyHMf5CJIYEkgWGT4SEjoeCqzZgdKmhvA6ugvwOrWdZy8q15tZFzUw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b6a067a0-b9ce-4f8e-8d5d-e9a40e24066f@citrix.com>
Date: Wed, 18 Nov 2026 13:04:00 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
 <20261117202244.4054656-2-andrew.cooper3@citrix.com>
 <488b0f8f-c62e-4de7-bf1c-ae5fdaa75a5a@suse.com>
 <7db862cd-7082-4a3c-a839-1679d956ba9c@citrix.com>
 <681db7f2-8c68-4e92-8278-681cbafa41a1@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <681db7f2-8c68-4e92-8278-681cbafa41a1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5143:EE_
X-MS-Office365-Filtering-Correlation-Id: 1518fee3-e73a-42d7-cc74-08df45746c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HHd6N/XZa6XmGrVBH9VKCFivojFRtdyAIcXr7lUL5eVFHIHRNnmaWLTKcGte0175wz+qUJK4w33pwT2+HPAtM1opUxmA9LRrAiGkrT52wUoWnc/eAfJVkvnHB7DyBrRECpW59xWquZrF2XLGaQO7PMiCY4YYg8GISIa6as235YGyvF5mu1CpK4qVfdjGt0RKPTnyc8JICJc1QP0CO21kSymqlcMJCRQ/vqxTz1bVpMYGbp2L3yV4HI6SKukbScwcTKfSO/v7PJFGzZlaxFJ/mZnBOQsXwPAaOjyHzVGgw8JIWkH/n8NjXflAAZ1q/LZl4xSD1rV8ZwBljl/lWlQ5ZNsSMmz8ZN6xc7lWNhO6VELBKiNC4osrzvSiVy7vjxnoSZIBCfLdFnuWt95MZICwtNsJsj2SgZRcntur1B6420tnMFhZ+BC2uiqaR9VFVie5Et2WzmFv3rf5EjUgeLtQLpweRBMs2ilNHGsqFlK0n8uwrg79xrXDsjqNS0BOmPb5jeu2ruXbEauJfjCWOm1T9yLVKR2IZHxii88uT1zb5UvZvBYQShMfV6oQWdYy57nD88u4gjOjY5tWN31xKzC42xw6wUsQfe04w7dualE2+JemhsDwBo9ohSc8vx4pbveL/wwshFGPhJ6eF47Y8xKkAU4y8lWFTiYHht0gQufy1tg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1OZTdvb3VxclUzYzJnWmxrRmpuWXloN2VFVXdNTkZhSnhmeGpvazlhTGha?=
 =?utf-8?B?V1VqZ3VNUTFpK3JPS1hGKzVPUEp0UWFiSXY0ZG9TUWZPNEhDNVJETlJrZ25u?=
 =?utf-8?B?dWdFOE04OWVmTEtJNVVvVG8rSit0bWpMaXc5WnRkcEUrYmVsMU9tb1lkQURN?=
 =?utf-8?B?ZnhNaUxQSGNSN2VlWjVvNUM4MXpDSmlZRnZYNXo0UHVTL3BWYnJsdFhvYmJO?=
 =?utf-8?B?cjhsNlV6UEtqa2tHaWp3MzlTYXFJSlArVHVJYjRmeGtFRXliSDU4L0xHUGds?=
 =?utf-8?B?NEliWTgwT0RrMGYrdjVXc1N6amFnUkxrY3UxMWZ5QUJTeGVEdDc0MWY2dnlP?=
 =?utf-8?B?c05SN2hmUTFJbHZvTEZMSDF1bXBzM0JvTDZGeWpzT1RjYm9FZjNxSklMKzNY?=
 =?utf-8?B?TXdhRnQ3b20vS0J5WUpabDcxemJQc2ZvVzdrSGtFSHZuajNKaWRoK3VVVXBQ?=
 =?utf-8?B?dXNjTnJsYWRSUHd5MHlTQkVFTEZaOUNwZ1AxTS9uRmNDdllIRGpUWGxyOU5T?=
 =?utf-8?B?TWFFUkpZVE85L0RjODUvNHYyNkN4K2JYNHREbU9nK3AxK3B6ZGt1Yy8vZGFK?=
 =?utf-8?B?dFFxeWI2R0JQbTNNZlRnT2c0Lzl1MGMyM2RrNTJ0YnJOUWRlYjBYdVFrR3pJ?=
 =?utf-8?B?cmRBclZWT1lEQklZcmY0MEMxbG80c2h6YTZjUjBOdTBvL2RQTHdPcmNhZm1s?=
 =?utf-8?B?dVRISUhOWVFrM0JmbGRCdTF0QmM5TTUwS2VQbGQ0YlRvNlhqazhCQ0dLeE96?=
 =?utf-8?B?aTJHZEtwdUJsbTRmZERnUmNPUm5ZRTBKQVZvYWx4R3J5YVArWlh0U3NEM3Uw?=
 =?utf-8?B?MjM5MXB1ejJIdzFrTXBMdWd2d2pNRU9ROGdWY1doeG9qeE1VRXNkZFRuSWlW?=
 =?utf-8?B?dXkvV3RDYVdrMXZYOVo1NjBza3lobUg5YysyLzdWOWRrZStpeVdrZDZQMUhR?=
 =?utf-8?B?TEd6aTFsMGpwejE2Z2xUcTBsb1hPZGpZYUlwV3BuNTRZU2xBZDJvVXZSbjF0?=
 =?utf-8?B?cmZtNmgybUxoKzFDbi9RMENBeVNRVHllMW9BSFdpMCtZQXdXKzBVZGpYc3hF?=
 =?utf-8?B?c0RIODJRN2pkeVRKRHZXb1A1VWU1WTgydXFPdkNQN1hOTC9QODJ0Um14NU5l?=
 =?utf-8?B?WitQRVJDNStpeHUwdjZDdUZRbXRZYjBBR29ESVFta3Zka21ScG9JTG42Mk1E?=
 =?utf-8?B?NzFxWm4vZnBiMkNGTXdkcUdnVWdIYkVMMTNabU1Dak5sajAxZ3lUSzU0LzBY?=
 =?utf-8?B?bURDNDQ0UTd5V0pDTjR6MURPTVFuaGt6bFpYallDbnVkMVVCOElPSVNVVzJn?=
 =?utf-8?B?MGZSSS83OTNoS0F6YXhoaXFncXUyMnZqUjJMMDJTV09lSGdOVHZBNGV0Sjln?=
 =?utf-8?B?ek1TZlRsT3lSNDUxNCtocXR6M2JwUk1SUVNhL2ZxQlJISkZUMnJ6Z1dqb0M4?=
 =?utf-8?B?MUo1Z3pDZGdGUVd1NEdCV0tjbGJueFhaMmU0S0VuMlRRV2ZKVkduZFU4VzY5?=
 =?utf-8?B?YkxZYXpjd29mVEh6YlhNcWx6dGtWOUhqUWNhZnJscFNBQXpjS01wU29OKzFh?=
 =?utf-8?B?QU41WUk4MzBBVnpEQnFnZEs3QXQyYzRwQkh6clE3aGszRGtaQjZCaWRJOWFQ?=
 =?utf-8?B?NXRveXU5VlJuM25HOGNFK1VXK3lNcTFWN1dZeUJaL25EZWdYVmlxcmYydnN4?=
 =?utf-8?B?UmtaQnVDTTYvbEkvQk5kUHNaMEpPQ2kybjJOT3g2ZnVZUUdqSitVVWhDZ3dZ?=
 =?utf-8?B?OCtxR2psRlhHVUNJUzdJblVGdFRRZUM1NlN6K2lkTGF0ZVl5cFZpTURybDM4?=
 =?utf-8?B?aXBPbTVNTnJYcHZDelB2N09ENklFaG1zSmFCQXBjRDRhSGlJV051QkFRMlBH?=
 =?utf-8?B?cUVFTFNIUGNxamlaOHF3cEhCRnhmQTIwU2NWNkZYRzZzZzRUcEZISnVpNkk4?=
 =?utf-8?B?K2xHaEMrcG1PSFpOZkF3STZWVlcwOFMrYk5BK3FwZW9OMjdtbWgxNVlWcmZH?=
 =?utf-8?B?aDYrRUZDTy9BRFlUOWtGSGsrSHFlcm1LMW16TkNUc1ZSTGI5d1l2NjJRVHZU?=
 =?utf-8?B?VWxibjA1WVc2SCtIc08yT2djbGZibkI2SzgzQ0t2a282Q0Q4R2EwUDMzQ2dJ?=
 =?utf-8?B?ZzlTZUwvSGhuZ2p5VU05MEhocUJSMEVvL3h4ZG5WUWhGWWR4eVg2WXc2NnVJ?=
 =?utf-8?B?OE9DUWFndjVZa0RlVGhaemlKekdyTUtDL1hPaTlzZU1xYVBaTFVma3luZFJC?=
 =?utf-8?B?Z05hN1AvcU9na0Noc0VhdlA4M0ZaNHVGeW1YbjdnWUlESG5EdElCVHlnRjN3?=
 =?utf-8?B?MExqWkJHQ3JsaXh5akJGN00zYTdmWHlDUWZNMmxPS21QcVhQQW91elRwWVBT?=
 =?utf-8?Q?O+zGq/CuVUgPhIyQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1518fee3-e73a-42d7-cc74-08df45746c0d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:04:04.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+EEjGUf3ZcuaPw00q5ldh7O8m0sgMYPeaOsnnWZnzai2AR58Q4c5jxjCN7+t7iynaCa6srV9Kp9dHzy3TdpcsQkVjmQV2kqS2B6jgPudgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5143
X-purgate-ID: tlsNG-d62444/1795007065-BC4E75FD-F9F08D14/10/78276251493
X-purgate-type: spam
X-purgate-size: 1067
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 11:53 am, Ross Lagerwall wrote:
> On 11/18/26 10:51 AM, Andrew Cooper wrote:
>> On 18/11/2026 8:51 am, Jan Beulich wrote:
>>> On 17.11.2026 21:22, Andrew Cooper wrote:
>>>> Broken out of the subsequent change for legibility reasons.  It
>>>> will be used
>>>> to replace xen_build_id_check().
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>
>> Thanks, but it's just occurred to me that I need to make the logic:
>>
>>      if ( n->descsz == 0 ||
>>           n->descsz > (len - NT_GNU_BUILD_ID) )
>>          return false;
>>
>> to retain the property of rejecting a zero-size note, now that descsz is
>> not strictly checked against a length that was confirmed to be 17 or
>> more.
>>
>> I'll fold this in on commit.
>
> Shouldn't this be NT_GNU_HDR_SIZE, not NT_GNU_BUILD_ID?
>
> With that change,
>
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Oh, yes it should be.  Thanks.  I'll fix that too.

~Andrew

