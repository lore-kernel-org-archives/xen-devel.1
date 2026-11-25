Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94846606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=PuOKL5WJ
Received: from list by lists.xenproject.org with outflank-mailman.1502240.1698224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBMv-0001qd-FS; Wed, 25 Nov 2026 11:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502240.1698224; Wed, 25 Nov 2026 11:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBMv-0001qW-BR; Wed, 25 Nov 2026 11:40:57 +0000
Received: by outflank-mailman (input) for mailman id 1502240;
 Wed, 25 Nov 2026 11:40:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWBMu-0001qQ-7H
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:40:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBMt-008enN-Je
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:40:55 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06c934-e002-0a2a0a5209dd-0a2a450bd33a-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:40:55 +0100
Received: from [40.107.201.44]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06c945-b7e8-0a2a450b0019-286bc92cf69a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:40:54 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by EAYPR03MB280937.namprd03.prod.outlook.com (2603:10b6:303:2fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:40:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 11:40:52 +0000
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
 b=MFLXBLrIO4nFzgiIQd5NCQ1wfpQPBKtyxzWxJFdmS9cufFyLpVlRLlWnYGiyubh8MBHP5g6PIoJZ2yoGIbIfQUF0v71b0pIAIekiQbyhGa/Hu9mjRTkxEPYPixSsQgydpMrEWx0c9HI/l91haBaly/hsyZNcNmnvHPSwOGNUh9PnqwkNksnstaHrMa8nvjQ8/rDWYlh7TdkbUZRc/ViNSFhytg5sCgS6il2Lq4vkUCXMRwaunU3bng74n8u/0+tXBgCftYKKKIokgYsB4epdlSkJv2sjA0RUyWTonZoSmYgCM5zXyn/5LYrq78EYtMNbq8Iyg7tOifjx0Rm5HtfPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2xGLJz6hRfEHEE4ZWUk7PhYIp690Xs9UcEm9V2zeug=;
 b=CgT0R4hPtvWX5T6f7CqFwbLrH4U3JNthnTDVcKCC7uYvFkByAm6SGubPDlK85d/9VT2E5VT+8ojiHTdv8hrONOodhZB55+aQ2P9WlqlEjNeALWuqtsenAQxPFWMxU0NFZhQwMBN1uyx5XtI2cVC7jn3fpKdgh6j3pitK/aI7e65pXLhV4tNhwWnrI2AEp64Btsftr+4TqBIFjY/WXXMGJn3kB7WDfpANxGAfIaQzgpRGbrf+Oc2Pf1HuvCC4uUpAkd8v/xWvOE+okIT2xu9BWLbioGCae3vM0NUUjWK5fWOTfJJgt5ql+MndZTQQVG7Cz7AlIqg8eVPumkIsxCa9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2xGLJz6hRfEHEE4ZWUk7PhYIp690Xs9UcEm9V2zeug=;
 b=PuOKL5WJzooMuFUIIuc66s+4eXASwqA54Ii6iurqJRR94kUsjwXZsucK0qJxcNVXFmClQgt1F8Kg8qwXB9RECZAukZBieYAk9XmNWK57tvp6E8wvw1pvXxLZLD+SFxdvCLHZPPOp3AbXDmO9gy7WZGf/qdpRfQiMjSMbeBLhby0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fd82c7a4-36c8-4ce9-9e01-7dd9d148fa4c@citrix.com>
Date: Wed, 25 Nov 2026 11:40:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/p2m: acquire temporary reference when removing
 foreign mappings
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, xen-devel@lists.xenproject.org
References: <20261125112233.14046-1-Zhao.Jiaqing@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261125112233.14046-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0288.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|EAYPR03MB280937:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4ddffc-d520-4d52-3202-08df4ae8f571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006|261028144727099003|10067099003|261026121527099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	c4wvx5qHJIAFKuEv6eRwbHV8u+oWx66Z4OGJbluSpsKhXVzCzox1u/MG9PHofoKnACzKHtXAgtVRn2LpRxOu/ry9iJIXdTJuDmtBsWeYhOea1fH1giZymjGdgwT7tcBe0ZR+hxjUkTluXL60eGs2eca/E7ACihuk1l2x9ZctPg8xOFpAUEEOIMFHmTmWcD27OlA2b7jIlYgTI7/yZU8IbrFOYCHXuKjIwaamEheb26PncKAzyMmLnS7ZhEuIyjaZ9EtaSwRIJYMqwQsRKoOSC17VXgn44cEgTY5M1FM+O4GYVcvbE+lmK8agFE7MZ8PY33FHNf1eXF2b1bnmZXcLSjDWGC2knQGeRqePelrZDqS7IjxTwENc+GCHBLnuxaxS5F8gyTAasarSpg9ezJhWRc+T7hr8XKQNUrTELD1l7rVtmrna6k2vtfekHvLnevaRELsgCdSVW5VFff0g63SA53fcUr8ufyWRvyagvCr4rafEK45qMSTfH7J7NxXYAd1S1vVA/QQWgoJfpDjEJ6XxhB8iTv/kUfK8MeiA/m71v6IXdMyCf3C/dGEoWOzqHZ68j/TraoNykB/AxOfrTXJax/SmPpfwH7LeWMo5o6/ijML0UV1mKYxYPgON4n7wG5gKDLExYmpiGBdBCIhCJK0NgK/IBWi40aakMZvzpabbqVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(261028144727099003)(10067099003)(261026121527099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGViN1Bab2dsNUxQczlKc2Qrc3RpM2tYQVc2MWVEMHROR1pML3ZOUzFIdDBC?=
 =?utf-8?B?QzFDblpsaHRoRnczVFo0clRUanNabGN5WVF6cmpUYWhkZGlCSXFJUmRiL1l4?=
 =?utf-8?B?QlhHL1lBcUtUbW1NN2duKzhjc0h3YTJVMGxXc21CMXlOUmNOcWUrNEhWU3NS?=
 =?utf-8?B?KzlmWU9pakZvQ0NZMWRxMDU2bEI3YjdWRWhRRkhmTWt6OEZPcDN0WEFNSklH?=
 =?utf-8?B?SUZhT2wyZVJKbXY2azNkU3pSZHc4OXZvaThrSVhDWGVWZGljUGprcCttOU84?=
 =?utf-8?B?a1dGbXBsK3hhc2pieU1LcTlKQlpNNWw4SFdSK3crUHM0SkRJL3Q0MjNaOWlV?=
 =?utf-8?B?VkhIc2lTMTVhSXlITzFLUEk1Mmw3b3YvM3BudlNUem14MW1UZ0pJVUxxWnYx?=
 =?utf-8?B?S2ViU0I5eklWdmVTeWgyNEhudXBGem1VREUwZ0RsUy95WnVRUVFKeThPR05Q?=
 =?utf-8?B?cUpKZ2hJWktzTjBsaThSN203WW9sNUN2NGozV21UM1R2NGM4TExuMlNNQnNt?=
 =?utf-8?B?cVNCNXVvYUIvcXlKSnJxQnpYcE5qRkszQ0ZmSzdmbTByQTZxQUFUamZmRWtB?=
 =?utf-8?B?RWJFTWZlTUxJQVZIU0dpemNRWDZpR2NNRXNxamMvWW96Qlg1ZndQUmlmaU16?=
 =?utf-8?B?TWhaaVIxbWtTQ3V3YXJ1OVpOQzZoQUJiSEdjTW5uUmJnNjhIVmdZaFFJb0JZ?=
 =?utf-8?B?YVBDOUs4NWtWanVXaGEwdFhhdEdoVUNwVldCRjNRd3JYNXhQdTB0N2t5Mnhp?=
 =?utf-8?B?bFlVRzdQbENBNllkR2Z6RXlML2t2L09YdThKWnlDb0Q4RkUzZ2VTUVRxb2J5?=
 =?utf-8?B?d1U3YzBkdE41bWo0SmdsbG9UaWVRT2NmaVNabDBVZG5wQUVpSFJIejV4OFRT?=
 =?utf-8?B?TEFBV1Y3Q3pENCtFQ0RlZGJyNDJVYUtKdVB2R1Fhekw1MlZNV05HOHJreTNW?=
 =?utf-8?B?WGoxaUZMK2syb3VoR3JiRGM3QXhJczBGZ01DdklVZ1dJdXNBN1UzeU5ETS8r?=
 =?utf-8?B?dXlIMUxHOTI5UVRoL0NNZWdnNUFIYm5iYnVFYXNPVnVtZ2liZkxEM0dXK1Rl?=
 =?utf-8?B?NGhreXBCYm1hSmxNVUlJMzZVTURFTzdKVmJ6ZzhnbU9rVXZ1N1RFcEhFaEVP?=
 =?utf-8?B?R09PUVFhd1ZYUE9ZT0lXeUQ1NjAxK092bktienlUV3dLbDZOTVJuelJPdEU0?=
 =?utf-8?B?TzBQVCtKSzlYejNQblZiOERwVURxaVlmZjl1RWhlblMvOHNrWWdpSWFGbllF?=
 =?utf-8?B?SHJTL2JLUWZpNkRmVmNOMm9xbWhFN1ZNbVk0TWgrcGl6bnZvNDVscFNKZnBj?=
 =?utf-8?B?a09PVVRremNHTG9HS1o0VktQQXBVS2xZOXVndGRqWWZ1dEtFQktIcGRBV0Js?=
 =?utf-8?B?dm5rYkRrNzFLcDVvcmc4czlVUkpyQVRDdG1XdlpxSWdCTFlOQ3B0b2VJamRI?=
 =?utf-8?B?QlFodnFCdUd2TUpxUmdNcy83RmNuY01NYWRuV3Fpc01yZnp0VlVJK0o5bFZt?=
 =?utf-8?B?T00ySGpvcEpBcEhtSUYvVmZFTUJ2WlJPSklUM2JmaEFIaWUya0E2bW5pQjRB?=
 =?utf-8?B?SlpDU0IxWXc5Vkk3czh0RElCRkowd0NjcjVmR0thbVVHYWdaL2Q5UFU3Njdk?=
 =?utf-8?B?MTY3eFU2dExtWXpLRkdydEVYZ0pPRkhNbnRCR3JDNy9lbUkyWENwQTNscVdL?=
 =?utf-8?B?T3BDREtoTk1XSGxmcnEzV0MyTzRuSXB1TzdqUVh2ZjJ2dUkvWU9xU0JYNkM1?=
 =?utf-8?B?bCtqMWtXZHFkeEg1MG4ydzlmUWs3RjAzQ2VFUXlUMTZFaUFTTmh0b2hnMFVR?=
 =?utf-8?B?NS94NGtGT01QclBPSm5ncWtpdGQwUi9GSFFhWTlmQXVHMUozR1lnR2h0dUNx?=
 =?utf-8?B?MEVkNUkrekIyRUVFanh1RVoyYTB5MEd4YThCVjUyY3N6R3JXVWNHM2thckxW?=
 =?utf-8?B?bkZyN2JYUW5ZOFh5aDlFQUN3Wjltc0dCMzJjVHpHNnFIdk1hQ1lCNTFDeG01?=
 =?utf-8?B?ZlJjdnlIblZRdTdXelBacHBBNGsvOXZYSk8zaFlhOXhFSXB1R3M4UkxqUUQ4?=
 =?utf-8?B?cU1KRFBVei9aQURyZTlIVWFVZzVWYzFJb3c2TVRMcG9qUXNCS1d4ai80Nkpt?=
 =?utf-8?B?dW9yMFcvS0VLa25ZS0NSMXNEN01IUDR2VHBWSFZpTVh2ZXFqZVR0N2dDY29J?=
 =?utf-8?B?Z0xZYTVxSXY0OVpqUEtyM1oyMFdDaEpCNi9CbVliSjlFSld1Unl6RlVIZHFF?=
 =?utf-8?B?czFMYmpVYmZITTlycGREb3AxNHRTcFJIb0ZNS3lTclhyaWFKUTlsZUs3ZkRz?=
 =?utf-8?B?T2czRmpndW9LZks1LzBsRjMyS05wNGR6dTdSODE3VC91RStOT3ZWOTFKQjVz?=
 =?utf-8?Q?rSWkZfgwxcVMVUio=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4ddffc-d520-4d52-3202-08df4ae8f571
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:40:52.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKuLqF2KBhpzINYDbTesuEB+VH+s3U6wcgFyRQwaAcpK26/hfTLmKT0GIJWisjMoT/kVVdSP78th3AIAWe6a2DFEuOOi+rLGD96Im8r5td4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB280937
X-purgate-ID: tlsNG-42698a/1795606855-AA4DB9EA-CA8049E9/10/78276251493
X-purgate-type: spam
X-purgate-size: 1482
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 11:22 am, Jiaqing Zhao wrote:
> As p2m_entry_modify() drops the mapping's reference before the P2M
> entry is cleared, since ac607edc2e26 ("x86/p2m: clarify foreign map
> handling in p2m_entry_modify()"), p2m_entry_modify() requires the
> caller to hold its own reference when removing a foreign entry.
> However, in relinquish_p2m_mapping() and the special page handling
> paths, foreign pages are unmapped without taking a reference of their
> own, causing the unmap to fail with -EILSEQ.
>
> Acquire a temporary reference in p2m_remove_entry() for foreign pages
> when unmapping, force IOTLB flushing, and drop it after the P2M TLB
> flush. Use p2m_remove_page() in relinquish_p2m_mapping() so it takes
> the fix.
>
> Fixes: ac607edc2e26 ("x86/p2m: clarify foreign map handling in p2m_entry_modify()")
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: "Roger Pau Monné" <roger@xenproject.org>
> Cc: Teddy Astie <teddy.astie@vates.tech>

It really ought to be obvious that patches of this nature should not be
posted publicly.

If you had spoken to the security team, or (in this case) your
colleagues, you'd have learnt that this has already been reported.  You
would also have found that this fix is incorrect.

What you have done is zero-day one of your colleagues who is attempting
to make a safe fix for this issue.

~Andrew

