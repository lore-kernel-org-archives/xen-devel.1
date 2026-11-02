Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4BE606A331
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 18:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=czB9hVTV
Received: from list by lists.xenproject.org with outflank-mailman.1468554.1677620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNwaC-0007U3-Ch; Mon, 02 Nov 2026 18:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468554.1677620; Mon, 02 Nov 2026 18:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNwaC-0007Tw-8m; Mon, 02 Nov 2026 18:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1468554;
 Mon, 02 Nov 2026 18:16:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNwaA-0007Tq-N3
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 18:16:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNwa9-008DSx-KH
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:16:33 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8d365-8faa-0a2a0a5109dd-0a2a4509c562-40
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 19:16:33 +0100
Received: from [40.93.196.0]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8d37f-be1a-0a2a45090019-285dc40099ba-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 19:16:33 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8406.namprd03.prod.outlook.com (2603:10b6:208:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:16:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:16:30 +0000
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
 b=WNfgve+PlnPPe5bTylAsDlxRKaSb1Q6ohnYll/tKy5mzJtyXRJaZJedcW1KU3TYGp4iGKasyZtUXowmH0wgEQJHIeVjiBgYL2eH9kRkooqnps2KCwA+H2wUxYOEfrofC6rCq5q3NBLI6Rn8DHu3lo5+QhU8ZuR7V1g4Qf5jZb3eKz2TRfHI9wQ9NK37yahsWSWcbT8r1vYG16m3jzcItYkkYBVYURStwrZ/B8x9JnSiJ/7WsOlcwF8vdW/VQ6R6IqCDuv5gspp6jYcjc4t+haYOJyYFj36oWbyL6odvMXQjAr6GWvxZBHjAHmIg3kGmPTTZu1G5oA8b7rV3E3gIFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jLxeI91OwB1vb9UNVDEH56AiDFMt8c4cd4n7O9KGWg=;
 b=bQ8yJPUahFC3w3B3ghif2Gh+Ma5iixek2mZqKHOaqMdbCD4L4VgkvTf55XoABxD+YuVvY/XgOm9p5Ub9b7hoiZ3NCdKBekmJLGu7D8Md1TUvLPN7uQVpCn5y3mX8Fgf1hvzGSK4x2Ln/8li2dLPY4cXuu6S46kn/PwNx7F7vVhGaJlpE266UFURBvj6MLzQWU9Ll6NcpcLBrkhuD5+3ptX/Uu4yS2BWcja+vwevCZpQGr8sVg/02G+JJGRTXguaZ981wxITSBULzAxD+Et7p4er26I9sQaskMPrW1tRFI68F7Q/SP6EHvDRPEctyva9qmwCqnP/3brs7JK0fMHosJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jLxeI91OwB1vb9UNVDEH56AiDFMt8c4cd4n7O9KGWg=;
 b=czB9hVTV1uvZCF6T3fVjHkrvxMYthFG0okBKp6FNey7O/YS/fdfaf9v0el8KsLiORRMm109gnj/xuTPq8X7cQ4U1rtxgvbLYSBTa71TSoDlkPKLRv4tavdkRxp8vEtAsw2ELYKMAYirctOSg4M8kvM5k/IqNHKL9W3lDKLfp+QU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7021681a-277a-4b40-9963-74e55dde35af@citrix.com>
Date: Mon, 2 Nov 2026 18:16:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
 <0c81f171-7ffc-4a59-8f9e-69ad27371b96@citrix.com>
 <CH8PR03MB82743DC59D48A031251F71AAF06A2@CH8PR03MB8274.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CH8PR03MB82743DC59D48A031251F71AAF06A2@CH8PR03MB8274.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0062.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 9493b2a0-73cd-4e45-e222-08df390d6aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|10067099003|56012099006|261102123227099003|18002099003|261009223027099003|261022105027099003|261021121427099003|261022075727099003|5023799004|11063799006|4143699003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	n26TmnxcBpI5foRj6hdbGhBfFLnbUTEb+t7b4er3dAVk5r6tdfJ6lR6k0UJ8RH9H7yhGhU3Wk1S+45JIWir3nCSnzlFgvag3kWGWE1+mUBaQAODSS4lpo6ETRY0XAaiN6P9b+UKnoewfiRZT17iUstUexmL5m6HRKZRYgyiKRDBVeb52ut8IVVR07+yUrJ8YwGZhY0KkBlPIXen3aPxFbvH3UOZiTgHiaC8lqoXX0gsbAxlGiaYH7bswXsA/evUXW7E2LNzi98MwzKUEPEfaVMIPOuUJXI+xkutwczHdSRpy3UolJaxWCu8zDwGA/LK/zUxuB8mY8gvMs+T8xPZDPMWh/WJoJrDlFIyUufSbwRBW4QnMd+RFmD0h75XKVdFCMaJlUX+JZjWZUtqmxMWj8n9errtkWTPedlrKSiaWL1L9zOivbdlBsmdP1Pe70fiFtlUkYihHjQNN3sUuO1I09CidG6eg7ng5NgDamdyHPZO0Ft0pzT8ggsLyGyxof1URrrQ+EPjvh+IUjI6wKNK7CuHusB3uf8ne4x1w3/MK7y4T2kmjWcFaE3jA6qcaJexDJixA83uJbf7ou80BQ58VY4xrNSbY7LVi8wVESN+X0AOoN3k3dZy31SKWCxM/InRtUMXWPtn3mRuNgs/R733aLr01VCbaf7tejEAKfWfekIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(10067099003)(56012099006)(261102123227099003)(18002099003)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(5023799004)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2JOcTQyUE1yRGFPZFpJb2ZEa2V1TzJjdTV5aDZLeThmOS8yZUxiY2paa3Rp?=
 =?utf-8?B?V1FxVmx4Ynk5cm85aEJPdEtrTUd1ZWNOK0ppd2FJL0w5VmtEaCt1aHJhY2pL?=
 =?utf-8?B?ZnZ4RGpmQm5mYmh0YVdNYXBTc20zMzFLLzZ0dWg3SUI0bHRwVHhtWThlc1Zu?=
 =?utf-8?B?TzRSUFZvRnJibmtYOFppVXgxNThQSHJCVVJ4cTFPMmx5c2F0UzR4WHJOdnRW?=
 =?utf-8?B?NTJQVHB3NkdTU1pGeWpCUGpVeTUySGhxMGpSajhKeCsrcklybk1CUGp0MlBw?=
 =?utf-8?B?anM5TzVINkt1amxRNFJOdUpqU0dlK1o0QmFacms0MmZTOXRMeXo1cmdLTUZo?=
 =?utf-8?B?OXAxZ0FMUjZQaU9RUFdDRkRhTmxjWitldEFUVG9kcERLYUJ6VjFTNHVYUE5h?=
 =?utf-8?B?VkpSQ2FJeFRadWppeEd3Nm1ZeHVuTHFONm9HVXVyNEpWVlY0a0doSDN3UExY?=
 =?utf-8?B?RURxcStrTk5MTmdkcXF5YXlvMXRLL3cyVHNJdmNESFRpTkMvOVMzdmthTW5a?=
 =?utf-8?B?Z09LTWZLUWpZL2FKMWpHRjVrRDk3dXJsQ2NiM3BwM2ZzamI2a2JJbUJXc2hK?=
 =?utf-8?B?OUYxdjJrZ1NzdWdEU2JlSkxXS0xoNWZrazNCcE4rVEdjeEZhVU95blltVjdL?=
 =?utf-8?B?dHRPZEY3OE5xZWNOdWJyN2ZteXAvZXBjdkgrdDQ0K3d5SVRKVm5BMWQvTjVM?=
 =?utf-8?B?V1FMQmJPWDV4UzYxRk9RQVh5RlJPQ1pNdENFRTlLaG9ycVRVeVA4THFzV2dE?=
 =?utf-8?B?WUdWNDNGdjVKNFY2RU5VeXIvd2xHeUJXSTBLZDFkQ3hxVzlrNDV1R1dtVmNC?=
 =?utf-8?B?aWZaN1BiSmNjalh2ZEhvSktaYkJERURtemhPMFAvVDArS0JwNE54ZUNBb3FD?=
 =?utf-8?B?M1N3SDMzOU45UTJtU3dnakZ1bDJidHYrakp2NzkrYmh4MDNQaFZTVWhJaFFt?=
 =?utf-8?B?VncxU2pCTFBZNk5RaElYK29IUXEyalJMb085Zmgzb25uYUpHRU1uR2RRNWxD?=
 =?utf-8?B?dTBRU0NMeW16U2R3OTNBMFBXSnJiVkhxTjArVzNvdElsRitXZVZkUmlDZnVk?=
 =?utf-8?B?bnl1bStkUE9SNlJPRnZ4R3hKQVNCVS8zZnE0VTBnM1ZDOHdsQ2t4MnBoZnFB?=
 =?utf-8?B?QnRVV21ycUowakg4Z05ISHJVL1JETk9peUVsd2pVU1J5bWI5SWhzZWFVNkhH?=
 =?utf-8?B?WlI1QjA5clFxSWdadnMvSjdjblZyQVZ6akdVRkdGcVl2Nm4wUjRoaE4xOUcr?=
 =?utf-8?B?M2lrR1lzaDFKdnlseldlcmtyMG1rYWg1ZnM5YTR4V3FINVJ2U3Z0a2tRbVhT?=
 =?utf-8?B?Wmw1K0dBV2lhVXYxM0diK243V0dxNlZWSGExOHoxR2RxbDVQQTlMM3REcDk5?=
 =?utf-8?B?NDYrVW9TaUU4ajVTNnhjZENicmpaUHJIL2g0aTZ4bmJudGVXQldjUGNCWDMx?=
 =?utf-8?B?MjJGbGIzazgrcW1YdHhyMjcreWlUOEI1dmtGZFlFMFVyT1gxQ2dtVm94bHFN?=
 =?utf-8?B?TkM0aFdrcUNqL1RRdmJwcmx5RWE4UGV5VFhkZU9DZmRyWW5Ta0t2UTA2K2NS?=
 =?utf-8?B?WnN3MmhQdGdnZDZvTEdsREVERW8zOWxSaHZOQjMyN3RLVFhMbHQvd2gxajVi?=
 =?utf-8?B?aFN1RmtxMnM4U2VRQkZWWXByUmFBUnNLOWM4bmFJMDJYczBOaDdFd0piR05r?=
 =?utf-8?B?SWNIaXZvQ2JwQXhkaGdqNHZ3MmRuWDRKUW9Mald4Q2pXbTFjeW54TXVsaXBp?=
 =?utf-8?B?akdUTEFId1lubWw5OHNvR1I0c3JiVlFlSHl4WHJiNSswaTM3c3NIZ1hEVFZo?=
 =?utf-8?B?Q3FuYTJEUHJtNHpIS1Rnc012cFg4Um44Z0lWV3hBZ1hNZnJSZU02cXVpQk1W?=
 =?utf-8?B?UjZtcU5BblJtZ291K0grR1FaU29iNWhUNmY3YkZ1UWxFUGl4Z2dLU3VZRTZV?=
 =?utf-8?B?Q3Z6S2VhMXZTTHlRQ1phQmVWWU5DdGlQZ1RXNm9Va29yZHdITzgvYVFDNTNP?=
 =?utf-8?B?eGlZNlYzU3BNNjcrbTBGNERDa000ZEU1YzZJajJUWWo4b0JTRm5uZy9xb01U?=
 =?utf-8?B?WXoya1cwdDY4S1o1U3h0Q2RQbGM0NlJCaVdGdkRnTjlYSFZUOW9Gbi9DUmhx?=
 =?utf-8?B?NHRWckM0YmloRlpoLys5ODkxc0lJMVVWQ0J2SUFqOVg2Y0UrYTRnUU1uVnlP?=
 =?utf-8?B?OGIyVXpWbHVJc29PaHZsT1FuZFVpOHZpWTNwZWFqcG5hVk1OSlJ2TU50b2FD?=
 =?utf-8?B?bG1sWGNPZ1FvSjdxaS9XU1NhKzlzYzN3ZTBkVmsyMXM5WjdXWDNwMmFxeTMr?=
 =?utf-8?B?MHcxRGU2Y0xWRmppa1lveDd5Z2o3aW43cWpnUUVHVjdHbUVUekpnZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9493b2a0-73cd-4e45-e222-08df390d6aa8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:16:29.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYCu8gLpHhG3upXOBi3XFtbykEvXtpB5EbZHqQ/vnJKQUvIGYBgkZy0S2YX2zHU71b1Nzydi9tYC4iUiqBRGaZCiSzd99FtohIPWkGC54dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8406
X-purgate-ID: tlsNG-bad1c0/1793643393-BE2C4034-70B94E7A/10/78276251493
X-purgate-type: spam
X-purgate-size: 3448
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 4:12 pm, Ross Lagerwall wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: Monday, November 02, 2026 13:54
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@suse.com>; Roger Pau Monné <roger@xenproject.org>; Teddy Astie <teddy.astie@vates.tech>; Jason Andryuk <jason.andryuk@amd.com>
>> Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
>>
>>
>> On 02/11/2026 1:46 pm, Andrew Cooper wrote:
>>> Despite prior information to the contrary, APM Vol2 revision 3.46 October 2026
>>> has been adjusted to state that the vNMI fields in vINTR are covered by the
>>> TPR cleanbit.
>>>
>>> Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_vintr()
>>> rather than writing into the VMCB directly.
>>>
>>> In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.  Move
>>> the reading of vmcb_get_general1_intercepts() to the point at which it is
>>> used; tt does not need reading on the case that vNMIs are enabled.
>>>
>>> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Roger Pau Monné <roger@xenproject.org>
>>> CC: Teddy Astie <teddy.astie@vates.tech>
>>> CC: Jason Andryuk <jason.andryuk@amd.com>
>> I forgot the extra comment.  This bug is hidden by:
>>
>>     /* The exit may have updated the TPR: reflect this in the hardware
>> vtpr */
>>     intr = vmcb_get_vintr(vmcb);
>>     intr.fields.tpr =
>>         (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
>>     vmcb_set_vintr(vmcb, intr);
>> }
>>
>> at the very end of the vmexit handler which unconditionally writes vINTR
>> and hits the cleanbit.
>>
>> This is an absurd codepath.  SVM has virtualised CR8 since the very
>> beginning, and put in CR8_LEGACY for Windows to use even in 32bit mode,
>> so the only path modifying TPR is a non-accelerated write to APIC_TPR. 
>>  That path can be updated to modify vINTR, and this logic dropped.
>>
>> ~Andrew
> The APM says "(Offset 60h–67h)" for this bit in the current and previous
> versions. Perhaps that means that more or everything in that range may be
> covered by this bit in future? In which case more extensive changes would be
> needed to avoid future breakage.

The vINTR field is complicated, because some bits are unconditional,
while some are covered by a cleanbit.

Byte 63h (V_INTR_MASKING, vGIF_EN, vNMI_EN, {,x2}AVIC_EN) all control
virtualisation behaviour.  These are unconditional, and I bet the 3
reserved bits in there will continue to behave in the same way when they
are given meaning.

All other bytes are state of the vCPU, and are (now documented to be)
subject to the cleanbit.

> On a related note, I see the APM says this:
>> If any VMCB fields (excluding explicitly uncached fields) have been modified,
>> all clean bits that are undefined (within the scope of the hypervisor) must be
>> cleared to zero.
> AFAICT Xen doesn't do this. Might that cause breakage in future?

Fun...  That's incompatible with the previous sentence.

Xen follows the previous advice, and sets:

    vmcb->cleanbits.raw = ~0u;

early(ish) in the VMExit handler.

~Andrew

