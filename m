Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBEAC56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 09:40:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384478.1627424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wruaD-0001ip-Km; Thu, 06 Aug 2026 09:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384478.1627424; Thu, 06 Aug 2026 09:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wruaD-0001ii-H0; Thu, 06 Aug 2026 09:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1384478;
 Thu, 06 Aug 2026 09:40:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wruaC-0001ia-3i
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 09:40:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wruaB-003eUK-Gm
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 11:40:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a745675-5cb7-0a2a0a5109dd-0a2a4506d7c6-8
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 11:40:11 +0200
Received: from [52.101.43.44]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a745679-195a-0a2a45060019-34652b2cf386-4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 11:40:10 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV1PR03MB989626.namprd03.prod.outlook.com (2603:10b6:408:3f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 09:40:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:40:06 +0000
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
 b=dFe+kXS/DunfMfIlyc/I2JaQNHUwKjfl3rBafT6AiFi0UrppemzPsQFaTAeo6uQvqwyiZtjHybEcSRGI3OdvWYvo77aDowp8a0qZh4+fSXwIum8Xty3feGN5wALOPPo3m82c0tZyU/cBUe+ORjUQZc9TsC7YfTEplwCnPsOt2jCV0Il7pW7oYTJXYZt4fNQCEvfbpQr41kWaflSSXsqO8uyDMqmKkE9gz1E3YlvioRBG0YOjiiy6s7/uB5YjLtp7pPwbxNBNOvr8VrN8CQDBk2wo6H2tcwIm8YZ7guziOPvLiv6GImGbmjhKL9mU7D2QXSREcGXv1MFVZUCGECGRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQBE6PmyIsgW0exlUidMoLkPd7iub8pgxLjMotEfFkY=;
 b=pCWl3+NzWIVRG1tMyH3essZU8iu5LRZin5qNv9lBIrcNENATygzp/GoS9MlMRQhv83cJ1OHXY2cRnrJyVD4fMoFBm0yCtTKUE3Chu8dNfw5mU1zqztFWa3azz1Saot2G5gBRnDviD6iqY1A+j/OAfHb/NBYaCJDdXwhwao5wscEaZPF6bLfn84B/T+3xRLRmX2jPOQNSvlAooZ1pt9jpYOEonIt0Ni1D3iB2XWtLui1w6uuuO4R56YQzLy+zcwHCREOdhXcTUS7xRxCOM8Y6/mu4rq4CL9A5VIZd3xm5MFo7UzVi9vh9OF98lKzi/AwDHqQ8lvXID4go7SlT6tgx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQBE6PmyIsgW0exlUidMoLkPd7iub8pgxLjMotEfFkY=;
 b=fauHB9+wzoLKDIjGVg63CYXD8enma692aCrS0qGxk9XCebMKNn1aPfY1upaaYGHFKY3gaEVpbvJ3M+MR1cj4vi1dxPmeeYtuFqAO3duWnpIpTm+r9QSeZOIyCtmt2KpfYGIuhwPnh8WhKrYFaSwr7XW2O5OFYgpPGs+RLn/5rJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bad63e21-5ac2-44a2-9669-558e7e45dbb6@citrix.com>
Date: Thu, 6 Aug 2026 10:40:03 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/5] x86/nmi: Don't configure EvtSel repeatedly
To: Jan Beulich <jbeulich@suse.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-6-andrew.cooper3@citrix.com>
 <d76fa0a2-1a53-4ee4-b077-d51715dba339@suse.com>
 <da3b4ee8-7c12-4fec-8d31-6f2f66bba4a8@citrix.com>
 <0b38417e-2c59-4df1-8429-ec7c98ce22d6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0b38417e-2c59-4df1-8429-ec7c98ce22d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV1PR03MB989626:EE_
X-MS-Office365-Filtering-Correlation-Id: 192567b1-1fb6-4044-a964-08def39eb2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LmJxxGPFVEFIS1AYsUQDDOVkAqQRz4fWcygsNamIXxJEKmVnuId6uBVNudOuET1LDaeK5/BEMiTAQMsBI2lReW1xohu3LCiywIYSVH5kdXZlkSqjD4QhdXndcJeSsFD3gbG9jnLWzKPhx14z5Qk2G+Oy0qtjwtlcRprJ0XOXlBJRy+FxvYDBR5eGhBlFNKdXyt7dbHjqeV7mHkyPBAVDkEQes/Y8kjtTbRlYzAXJwc3nFUgEnQXTjxbF9suCjM/9NBBfIbFC5mH4/jf6nAn403mZvMXuUX0adYf6HtMnNGqcjF5O/pDHHO4cm8+n9f9yzw+ulCXD1LkNN544KFWEMyiAw8tn0aa8zbnd+ajXXDNH9FsLJHvblb75Q0K0R/aLQHEPUi1G53n13gwdIO2w/ANQTdyUFvdlWt8ahoMQSLuTlGQA1yd96mspMuhhUyDkEfcMpjyUIDYSDKZiKMbihCl7dW6iXGwW1Ax58SK9xJU/e3yGdcvYiWWhQAFwSab7hbCF63yfll1TN8uDY3iYRt0H34M3tG67d5/xXkpx7lImVC6uGwOEnxshK4FXWguvcmG+uhv6KKZEDTFqKDElM2fVm0Cu27sRe1aSIpy6iKbVQHjB7cDo87UdoxzqtVcylC/tO/jzUbP1O9pTzElcT+De7cUpBhKagVTwjt4qmZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm9la3NPdHArbWVEWlNMZFNCTUo3eCs3Zi9xUnVGQzI1S3dvNDY3ZVYzY3Vy?=
 =?utf-8?B?a1loMG5aU1I1THVVWFg2b1lmQUpqbjdmclNYcU1BUHdRVHMydDBESTdwWS9q?=
 =?utf-8?B?d2VuNVpncFUwSjdVbTRYS0RXVU1YYXpMeTNLams4MzJsL3h2OEZ4T0kwYS8r?=
 =?utf-8?B?WjVlRWFaak9pN1JYaloxbkRFejJuRWkwckt0SWVnazVCTWNpQzF5SzFLZmdK?=
 =?utf-8?B?YTZlTnlsYXRRaFpha0Z0N045YmR2TzBGSCsrd3o1ZXdhTjFYVFpSM3BSd0ZF?=
 =?utf-8?B?TS9yeHpBZUFTOXBjNGQvVDRVUjFFQXQ5bjdkbnljd3ZoYjU4UU5sNEdsc3hV?=
 =?utf-8?B?NFp6c2dVQ1VGV2ljZEJkVzR6VU5qT1E0aEhCWUM2UjVDWEdWbHNCbE94Z29E?=
 =?utf-8?B?M3RINk1VNkg1VnR4RXJjSDQ0c0pRMkgycndXVzlhYmFDWTdKRHpRZzZvRWNv?=
 =?utf-8?B?N2s2cVpwTU82SHZWSGRLTm1vMlZkRTRCOHpORHlmWHhURXFpeFVKZ1cyYXdR?=
 =?utf-8?B?akliVWV6aURvc1VxdVpleXc2OUFKMWxreW5vWlI3UzBuY0xqRmtiNnl3Q1Vk?=
 =?utf-8?B?LzNVZDhhblNodmRlRThYZHBzV05xODZISElDT05URnhjVDhnTXdzZzcwRkZX?=
 =?utf-8?B?Y2tJRURiRUdOVkwwRU1QS1ZQd1QveHNxRC9CaCtwV0NQT1BxeGJGREk1cHBY?=
 =?utf-8?B?RVFVaVloQ09oVWxhMlN5a1RzdEFSeWQySFhnTDB0MFFFTUUwbHVLZGdTME9V?=
 =?utf-8?B?MTNBMVM3cWZVSTJucmVVYlY0M0EwanZ3NDY4ZEVQUU8wZFc5YUVMRDRaSmhZ?=
 =?utf-8?B?R05ERkQ4eGVCYlkvTDVvU2lYOUQzSW5aSTVhRnlqaUxDQ2pzZjF4dDN4K1Jl?=
 =?utf-8?B?UFVybVVnSTBIM1RYYXhzemhMWU92VEtMTFBNb0UvbGQvREQ0MURBSCt1T1ky?=
 =?utf-8?B?YnA3MFhSVU1VcWMvZitrT3V6TjJSc013WTlXWFZIbVh4dEQrR2NjZUplRENv?=
 =?utf-8?B?WTRzYWk1RWYvN210Ukt5bWoreXZFRktJVitqcC8vQUVNM0t1UzB4SlJOUlRq?=
 =?utf-8?B?UzZqRE8rZy8vcUVBWjJnSGZyT0lqc1lyNmtGeXJwRlhUMi9PanNCNjJFTG1V?=
 =?utf-8?B?bE9rdE5XSkxRb0xkclhnVGJia2NIanoxZVJCRndHTWNpaE9FcnkyU254SjFY?=
 =?utf-8?B?Q1pxNVJ3ZXNnOTJKcExzNkoyR29PSUFNeWJLajJjdDVwdUVDMXhxNElsQVA5?=
 =?utf-8?B?V1hzb2ttV2pwaWI4d0JwNVJiVjR1SHU3SVVHWXluYXVUczMvTURVK1Ywd0Vo?=
 =?utf-8?B?Y2R6U3Z5bFE5UFhOaE43Uk9WZmVQazhkcW0vTlo1NjFUWXNwai83N3dBYjB2?=
 =?utf-8?B?T3dzalp1S2lDYm1rVVVnWHBpaXpBNUh5UitJVVFWdk81YXByM1pHdjlDWkFu?=
 =?utf-8?B?dkVQUVh6UjVuZUZtQnZCRDlQUVdLQm1jQVl5c25ObXc3dU9WQVh0RHZCL2VJ?=
 =?utf-8?B?RGRhRG91cGZxY2pNV2JtNXZGZjcxTkFrUUFwNXkyYVB2a2NvOE44ajJoM0FB?=
 =?utf-8?B?MGFHTWtmZEUrb3lpcUVpUUVWY2lqY2N2ZFQxaUJIUFgxQUJ0enMvRGc4U1h5?=
 =?utf-8?B?cW55U0VmSUZUcUVsK2FnOHo0TVFCWkdORG1DSEdRYmdtSWZJU0txdHl0eFdm?=
 =?utf-8?B?bjFES1hrVFNzMWVDSEdjOVQ0b2tEa0xxbGIwbTB2M0JxMW1GdU9HMDlScGpw?=
 =?utf-8?B?dW9yMFM4WWhXNzhtYXh4VXRQdjYyR2VDM1VacmJzU2RYZThDakJGN3liaUZ4?=
 =?utf-8?B?cjQzTldUUUN3VEpoY0s2Q1NzeWRpc051TFZjQWtKaHpIenJpT1QrZTBVVmVv?=
 =?utf-8?B?dWtYWDk0M3JvRGJ0aGl5a1J3dEhXclFQWDlWVVNDMWcvdkwwcjdxSUF4NmpF?=
 =?utf-8?B?WllPZm13U24ycUZmQ1NnNjRnRnZzNFpyU3RJcDJ0Wkw0Q05GWlF1a2JjTXpG?=
 =?utf-8?B?QmFuazQ5WU9KRi8yZjBLano1Nlc1NEdIUVVHa2xYbzhoY3o1SndKL3YvdGg2?=
 =?utf-8?B?MkV4OXYzYlpKR01TNS9hMnEzOE1sVG8yL1pxeDl0TnNNK0RycmRYcElONnN0?=
 =?utf-8?B?UXI3dU1mTGNDM0l6MDBZcEQ0a1EydkdjNENCTHVOaEZWMXpjVjZUMjNBQUUw?=
 =?utf-8?B?MUVucStNVitJY2F6TldPWVlML0tnY1hMdUZUakFIdUd3SlY4SDRNSnowSXp3?=
 =?utf-8?B?WWtqYm9IZ2kzdXJMY1RNc2wzeVA0S2Faa3AwRUlLcGdhOWRiVjUzSGQzN2wz?=
 =?utf-8?B?QVA3WTNXdW13M0NpNHlIRGQ0em9tWThueUZHdHBNaW9DQTRneGptQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192567b1-1fb6-4044-a964-08def39eb2a5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:40:06.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mwz+k5e4PI+fH0GSjsLQJtqOsyUR5ssr5Pl1Y19ShP3X9VxhJs87bY+H6xKZWcf+s++ZBKdu3VY8dVI/T/4Vb1tjxkGZX0hbb2V2F05wvCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989626
X-purgate-ID: tlsNG-16d1c6/1786009211-F580D77B-4BB27AB1/0/0
X-purgate-type: clean
X-purgate-size: 1283

On 06/08/2026 7:57 am, Jan Beulich wrote:
> On 05.08.2026 17:37, Andrew Cooper wrote:
>> On 05/08/2026 3:20 pm, Jan Beulich wrote:
>>> On 05.08.2026 14:45, Andrew Cooper wrote:
>>>> In both setup_{k7,p6}_watchdog(), EvtSel0 is first zeroed, then written with
>>>> everything but the enable bit, then written with the enable bit.
>>>>
>>>> setup_p4_watchdog() is slightly more complicated, owing to what
>>>> appears to be a bug introduced by commit 2a2bd8de16b6 ("Clean up NMI
>>>> watchdog handler."), which causes a second bit to be temporarily
>>>> different too.
>>>>
>>>> The middle of the three writes is useless in all cases.  Drop it.
>>> Spotting the 1st write in setup_p4_watchdog() wasn't quite as easy, as
>>> MSR_P4_BPU_CCCR0 (as passed to clear_msr_range()) has nothing to do with
>>> MSR_P4_IQ_CCCR0. Using unrelated MSR names there is as unhelpful as using
>>> raw hex numbers.
>> Perf counters on the P4 are utterly insane, but our local logic really
>> doesn't help matters.
>>
>> Another option would be to remove P4 watchdog support, in the basis that
>> we really can't test it.
> Well, my Tulsa system is still alive, and the watchdog looks to be working
> there.

Oh, if you're still able to test, then that's even better.

~Andrew

