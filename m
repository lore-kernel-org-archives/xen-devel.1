Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078CD606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=nBeHHkng
Received: from list by lists.xenproject.org with outflank-mailman.1463551.1674412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM83Z-0005Ui-Fq; Wed, 28 Oct 2026 18:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463551.1674412; Wed, 28 Oct 2026 18:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM83Z-0005Ub-BD; Wed, 28 Oct 2026 18:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1463551;
 Wed, 28 Oct 2026 18:07:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM83X-0005UV-If
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 18:07:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM83R-003s52-VQ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 19:07:22 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae239bf-bab6-0a2a0a5309dd-0a2a4502a19a-26
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 19:07:17 +0100
Received: from [40.107.200.5]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae239d4-6ca4-0a2a45020019-286bc805b133-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 19:07:17 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7981.namprd03.prod.outlook.com (2603:10b6:610:20f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 18:07:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 18:07:14 +0000
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
 b=l4S/BeO9cjtJiRygEQ9KFnkrBX6FQ8x+U1R4lXdUF3pjBh+oOgSC3qXV4roXntQANUHZ+gVwTNROMu8X0i8Vt1d4JCA8b7rHR7Na6IywqkWrQh1lutXzNNYhe0G5E4HOjFHoR1mjgjy7FXa1XCYvHJImhtmDC4PvItuCNspD1RLzouK4ouTnODgIiewXtYHBiESkhyLUssv9v8LaI7yzg+VQHxGuGNE3f3DgwZgWHZQcXRjGxIPPFPWrtJ5TRSn0yYQWQ+VW6SqsMv1xuJiwDEQGZr2TqVUjXcPM1Mx7HjGKolFrcTB5qR0HvNY/eWMTQp/4rl98lvtsfownt8IlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCQjdIPg/E+subNw9B1h4jEB9D2tYCtlMQx/vMOTdSk=;
 b=udkwfEbsiK+2Lms92nJbfDc2jbu4Qgwg5jE9K5Go7X6tvrE2nJcWgXsAbxOxyrsb+9iJecMCcIc2kwSgM8W7lh6vyAsTOyCm1uB1BLx/fYAxXGmqmgHMqvTYfCwJNL14N5OH/KoX350gA6t/K2g3mkeC0xMqDdUPNWBdaBG712jXBYpCg13k3IXE9rebApj5qXKlDSxo4dJ6twZXoxIKv0u+pEMGYHhAuhy8bXMHJlXTP8GW3JTqSnt9ZHUiffzGTb/V2PrwEbDZEcLe45I6ZUItEA/PvQ2oTk4LmuQA7CSoFIvBN33m/3f/qd4zDU9Me0a3nC2WGihM7PzWjeTJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCQjdIPg/E+subNw9B1h4jEB9D2tYCtlMQx/vMOTdSk=;
 b=nBeHHkng6GjapPPsKLqZDayI0aNuC1id+AxwC//N6+7vM8oaXpia6g94kkl60Jtipb4aWYF1d2d06XawuOM4dVwynICZTpvlrT/RPWtZ7qLNvc5x2kMJnonaUehYUvtKY785O9QCtrX05W2zsQYQ9BU9yjb6CDXKTHl2Gi4apGg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <78279123-37d2-4acd-85b0-2bfe1fdf61d0@citrix.com>
Date: Wed, 28 Oct 2026 18:07:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/mm: Remove loops in get_order_from_{pages,bytes}()
To: Jan Beulich <jbeulich@suse.com>
References: <20261028124104.1564435-1-andrew.cooper3@citrix.com>
 <7128c617-9432-4571-9b7a-22d6f6e8d884@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7128c617-9432-4571-9b7a-22d6f6e8d884@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c3d9ad-3902-4928-5d30-08df351e4b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|260925021311599003|260925022911599003|260925021911599003|261021121427099003|56012099006|4143699003|5023799004|11063799006|261009223027099003|261026121527099003|261021135927099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uEPxAGudSP6050Co0Kb7pwaBorZ1zuMo6dCwcu7YuVvSkhWBfZQTEzmKRlyu3Z4VL/necB/wZI4OKbrehY6IDIpSfqNfa9yeCNJ/tVbYpIV6UlwMcV6/c9br7CiZuIj4YA9WlONXewrRFEXe7yzbXm7SvlwnWnM3HQh8DP8nuct9Of9DJUKjEwxKYND6HBh3HufTmQH9zia9cj1TnjTbUsFIphuz7ho9aSJKkDE+QwcY/wbgBMM6a+yrDnncNRQpMMa4osq5jkwSHT0KrGyTKc210gN8csWrauQW+j4whBOWtSTwv26P7mCr+m7jN3AU9fCAFNDRumECPwGR0vV3AnxhuJ8JGZzQnPZdjRikyf43HOk4/sxEDqCVXclblCr73bFfOE22UZGKr4nRZK2ZfppDtS70ClajzGE2II5Aa0SDZuSqWsjHCIDc01JWVSeLJmfiz9l+ueYiQo+1IAv8JUSnGqTb3INv607C2R6Z/1ToSZv7aoUkBlKo9nOUP6XyD9vSVMXrMTLIQ2HwkP44POpjDkaPr4AeeEeTr9+a02jBw5PR+9yhVmZntRs87tRvLL1PPhmRrz3gcumjtOn4loRUTeMqLp23O0TcxFjs/FDc5u9N65xotrIVgywNYB1e1+9eK8lgX5x+mNPv43FgKiS9IisG3z/46KP1uYhcizU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(260925021311599003)(260925022911599003)(260925021911599003)(261021121427099003)(56012099006)(4143699003)(5023799004)(11063799006)(261009223027099003)(261026121527099003)(261021135927099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVhb3FqcVBRYjdyUDY3b0ZLdDNUdXRwUU9jVGRySTZIVVBkZVNDUlJQYmc0?=
 =?utf-8?B?LzFVM0tDVGFadklHcWdBUlQ4Njk0ZjFCMEhQZTEybUlCNFRSS0pSS01SV1RT?=
 =?utf-8?B?Yi9UNmVPTHVGcjI5bW04eXluRkJZL0h6aU5aVURnb3JIRndNTmsrSFBLd0FE?=
 =?utf-8?B?TEYramZCaTBaSTVJUlVQNXpCRkFXcFcvdVllZzNyRVJGTHhhQlVRYXZXbHN4?=
 =?utf-8?B?amV5N3JqWmFjM3ZFUWFOaDBUN0d2eHRZZEc4Wk5rZTRTMWxkeXZSdVVLQnNi?=
 =?utf-8?B?QVNTNjZEVXQzWDBldzBjdm1nMWFnNEtOeFZIQW13OWdTdXQwU2lrb3kwTU9E?=
 =?utf-8?B?ZlVBbUR3bzlqZFBOVHZHR2tMUmdYWTdNbEI4TVlmZUhqNjhYSThVT0pGKzJy?=
 =?utf-8?B?b3BubTRWV1h4bnU1VFdKeDhBekZjaWFzU2RTMjd2SEpIQXJOeSt4cEtRLzlw?=
 =?utf-8?B?dDdQUFZwU0prS21HcjZ6UW5qZmFLUkFQMjg0V0daRFM3cnMvNHVrTmkwbjRo?=
 =?utf-8?B?Wk02Y1VGNEdBWFFsVXhxellnakhxZ1Bua3o3a1ArUENoSXZzd1E3VnMwOTJO?=
 =?utf-8?B?NklrZ25jcm5EeXFiY1BmT3EyL2wzb0xBZUtOZzRaNm9BUnFKcFZySjRoNTRE?=
 =?utf-8?B?Y0VJTmx3bklTaXpnV2lBWDFZcUdjWjNOR0k3cWFJaHRUWHZITk9BV0tLZEVC?=
 =?utf-8?B?RGVBUFpvTHJCcmwzOE1SR1hpUkRzMmdoTmJHVVJyUllVVWZPSTBmTDMrL2Jl?=
 =?utf-8?B?ZnFjM0lwTTUyRnc5dUU1QmlWTjJNOThaeTNZRnp3WmtyOWd3d1d4QVFZT0hF?=
 =?utf-8?B?REFldjd0SU1LODk2ZG9XaWpTVzJSM3MyNmZlTmxJbE1yL21rdGFJUlBTYlpq?=
 =?utf-8?B?T1M4M2N3cFA3Mno4ZDZ0VldhaitLUjBZRE9rOHVhay95TzNUZm5aTkk3V0Zo?=
 =?utf-8?B?V0J4NTFIMlhNajFaZFdDTGhhVlRxSU9QOUkwdVNvQ09xbHpQTGVWMnMzVk8x?=
 =?utf-8?B?dXg5MG9Jd0RoNDB5THhQY3VHVitRVmdSSDRoZlRZaTA4emdwRndtQlVhalRq?=
 =?utf-8?B?YUFPcUVWQnBOTzB1SUkrbVpsdEFyeXJYTExHQVlNcWFoT2w2WjNXTGJsRTZO?=
 =?utf-8?B?S1h5azhZWTRyMjhxZkJzdG94bU45MG8vUkVNZlFIYmU4N2Y4SHJPUmZ0THlj?=
 =?utf-8?B?YWJCazdNZTM3Nk9mamh6Z1VjbTRJRGFlM1cvejN0bThJOExWVDFOaU05WXE1?=
 =?utf-8?B?SEpITTdZOUJxcHpaSURwV2oxMFlUK0hLdUpleG9sa29YMmRBRmt1VnduSVBn?=
 =?utf-8?B?dFJJVUduTnJUUTJFcUxrMUNwbXFlajdNTzR6Uit3cFhnckFvWnBYMHhzYXhY?=
 =?utf-8?B?dTN4VWYxcDh4c25RK283U3MrZ292Q0ZsNDJQVjgyck85azc5WVVxOWI0SWdD?=
 =?utf-8?B?TC9OMXl1WnNaT0FiS3k3TEZ0eXdpNEZHZUFBemVnVUM2QzU4NjRLWTlJWUpT?=
 =?utf-8?B?MUxzbFE5ekw0NkpUbU5CeXdWNk05TnJ3MU9xRmd6RkN3SjBvdnhmbWNiOTl3?=
 =?utf-8?B?VnpuMDFEcUdjUFBBd2hFdTN3bzRZemU5bDNpU2N0K1BUNUZYWmRmLzFwY3JT?=
 =?utf-8?B?ZXdwaEQxMFZhb2lCVVY5blpSSDdzT2hUMjRNSndVY25qb1FBeU1ua0twYTNZ?=
 =?utf-8?B?L29ZTVhkQlZoNENHMUtoTmNwaC81cmpuTjVMVVlzR0FwZWtsdE81aEh3am9i?=
 =?utf-8?B?Z0c3SEU5TWZpWHFqcUh1MUxtdVlwanFIWllpcHRWSUZndVNoalNRMnB0M2F4?=
 =?utf-8?B?RFVWMXNmc2N0YTl0L3Y3eGl4TUZ6OWEvV3d0SUtnZFd3Y0ZWWkRjOWJjeWpD?=
 =?utf-8?B?QmdQYTIvZktBcDN5b0F3bDF3eStaYWEyM2lTY3R0dnRuRk9Bd1hhQUZFcWRr?=
 =?utf-8?B?aGdhbTNTT3FMZFlyVG0rdllTREhBUnF1Z2s2TDg5MU9ySy9WRk5kOTIySU04?=
 =?utf-8?B?VE9TazV1dHJtWU9MYytlME1KVVhKam1IdVVXdXJ2cEs5bnExdDRVK2c4b2sy?=
 =?utf-8?B?NTVDOVBqYlBlV2N2OHFid1hhZUFTdFd6QzlHZml4TExpOGRhOC81Y1lORjQw?=
 =?utf-8?B?RDNzMW1rUTVuU3A5Y05FWVBVN3dBSnlkMmVSd0R5aVZJZkRpa0hCSU9zSEY0?=
 =?utf-8?B?c0taSEdjZmZtQnJJNnV1U1hnL3RoQm1FWUhpcUtteDNrUWc5Zkt0Sk9WSzVB?=
 =?utf-8?B?QjlacVFIK3p5VVI2clVtSlVDSTRVNStrbkJjVWVXMjloTlAxMjI0SnhJVHNp?=
 =?utf-8?B?NXFzNjBEVlAvU1RQSHpZRExTRCtQQWhNUWozdDlIMllWSmxSQUNidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c3d9ad-3902-4928-5d30-08df351e4b91
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:07:14.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6DxS8lfzOnYFOHAvHULBdLWcrNgl7Vcy2/dYRwC79AG3pW8OJ6v2T5AEVmBDlgLFMaE+PV7oo8wMaVJzdqCNdAJskUs6rqaBRickMFw6z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7981
X-purgate-ID: tlsNG-720697/1793210837-662A92AC-37A8BFC6/10/78276251493
X-purgate-type: spam
X-purgate-size: 2881
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28/10/2026 2:15 pm, Jan Beulich wrote:
> On 28.10.2026 13:41, Andrew Cooper wrote:
>> These two functions are just fls() expressions in disguise.  Furthermore,
>> GCC-12 at least won't const-propagate get_order_from_pages() with an input of
>> 3 or above, which covers most of the cases it gets used for.
>>
>> Rewrite them, and provide some self testing.
>>
>> Interesting, unless they are always_inline, GCC has a habit of out-of-lining
>> them even when inlining would have been a win.  I expect this is to do with
>> the fls() functions being superficially more complex.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2999078934
>>
>> I think paddr_t is the wrong type to be using in get_order_from_bytes(), and
>> so really is fls64().
> What other parameter type would you suggest? size_t is suitable only to express
> virtual address region extents.

uint64_t directly.

>
>>  I could add fls_g() which would be slightly nicer on
>> builds where paddr_t != uint64_t.
> We have ffs_g(), so adding fls_g() would only seem natural. But see also below.
> Either form:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -530,26 +530,16 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
>>      list_for_each_entry_safe_reverse(pos, tmp, head, list)
>>  #endif
>>  
>> -static inline unsigned int get_order_from_bytes(paddr_t size)
>> +static always_inline unsigned int get_order_from_bytes(paddr_t size)
>>  {
>> -    unsigned int order;
>> -
>>      size = (size - 1) >> PAGE_SHIFT;
>> -    for ( order = 0; size; order++ )
>> -        size >>= 1;
>>  
>> -    return order;
>> +    return fls64(size);
>>  }
> Along the lines of what you do below, perhaps simply
>
>     return fls_g(PFN_DOWN(size - 1));
>
> (and nothing else in the function body)? And then even
>
>     return flsl(PFN_DOWN(size - 1));
>
> (eliminating the immediate need for fls_g())?

Neither of these are quite correct.  fls64() can't be downgraded to
flsl(), as it would truncate the input on 32bit builds of Xen.

If using fls_g(), you need to modify size absent of type promotion,
which is why I left the expression broken out in that way.  (I did
actually do fls_g() first, then remove it to shrink the patch.)

I think for now I'll go for the patch as-is.  Any change along these
lines want to be separate anyway.

~Andrew

