Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBCCC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:31:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407334.1640434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28TM-0005S6-7N; Thu, 03 Sep 2026 14:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407334.1640434; Thu, 03 Sep 2026 14:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28TM-0005Rz-4F; Thu, 03 Sep 2026 14:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1407334;
 Thu, 03 Sep 2026 14:31:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x28TK-0005Rt-UD
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:31:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28TK-002hVC-6e
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:31:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9984ab-2eae-0a2a0a5409dd-0a2a4506d942-48
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:31:22 +0200
Received: from [52.101.57.56]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9984b9-195a-0a2a45060019-346539389962-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:31:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5269.namprd03.prod.outlook.com (2603:10b6:610:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 3 Sep 2026
 14:31:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 14:31:18 +0000
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
 b=EIwK+qkECACliE9/s5uez1N129RhZ3AzKMh9/wBN8VAfSLkS3H+yR60pOt96Ovuo49CuTjVZ1d/zz3XdcGRlZ2A3QfcTbjDLXELsAdtZBNTnyaynK9PeALcBEpCebEcMOMvFsw4IXQLu14Wkr+FmZmCqt9KGlTDnRCjomasbC8EVjjmiz5lxLaNePFY+FC8eqk8RSpd5GRRoydK98bxf4PoDBKrEKPZdWcmmIsLTlKuW86jdPJMjsc+LB/If43N/czDN5fWjb0Z92MLwmGM7c12AoKaMB2i0LN0dkE+a3E898+PPDF1aX0lMhmYXun59Y5B+lX/Z3tznBDsHg/X0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPVIOCwunf0gq3nutFG/6p+uX3ybf9cx2QlWCmeoesw=;
 b=UB6qxCJf6nLXcDcVqCl8K/p5CfJQtDBIP2PZNF4JMdG539P4ymi0yxVPfopg8Yh2hAAESidxPpPH9QGzNfzdTz1JUjIChxjSx02re0dXoYQ8YZFfK4d0Vge9Cqu0R/rjXUa97Z+0P6nfwrnb/LBUiYpCZQjWlIbdiiRnKKhkK/1zPcCFTuBKezwVCWdLWP6ZNPIDqDuxZkmJ+yU/gPiCCWWTGYr6ToR+K7LUfG2tC4DZUuRp2Vr+NZ92hF+Uayyg4pDD1GC0zNAVX7d47OPP9gz/gpp+uLXBIETrpyvHAMxKFqjvIq+iOawKMSXhDozR23aiScleXYPes8coxlHkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPVIOCwunf0gq3nutFG/6p+uX3ybf9cx2QlWCmeoesw=;
 b=rrxNcFp/rEkdhDwCS1sl9KeG4vHT5YMTRlCazlzW3JFCXhlCSQvl8VupH2XT1bMNX4Pj2EThHKXoy1kY86vykb/ms8QhGxTA2Gl8yeQFvv/0cEJDi7U4ntWbF9gg6ZgHYg4Mfgy+1uarp7rrPV3MPzEoPWlhlENXWNjoIG2SJN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6ecdf1d1-784e-4cc0-b840-f8970a295ed5@citrix.com>
Date: Thu, 3 Sep 2026 15:31:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] x86/svm: Intercept CR0 writes selectively
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
 <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ee6489-dd3d-43cf-69bb-08df09c80467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+2HoLOBgBrkzu40mzkSV1LUC8kn+dCQ5wySR+yCp3cqBXAA05glCrUxVO0Gn7szvMGG6WqyASh9LsoXgauMDYvyg7kdVtyqkgJ+27keEMdpXs4quu6F+8dWvY3ANxAKlHzsXjnWV7ZLnUhcyAOUifT68UPSohA08Sp6hfbgEDqcojlXwqXReoNT+Y9f9FQq5E5jvR8tZide2ngL/POJYf0y0hv9NAZ67lmYwycfJG24id8RppGtttdiGu2YUTufcs4qwwYZC/AHxbopc2Oi0lPS8buXj+/spMwENOACBIXEQj/xKNXY5B6DKpydTh3CvO8LfmgrvgCpugH1q6rZyqkEQLC9gjPjfKjwu2AIGhyINS8v3LHJ3hkbG4piLcwSXMO1x6JHg6Mr0fQoFnsrNA0D9FGP2Zsc5pzkT9YMCwV98wxSPFuhxK0AjLwHynuLFYk+ljwRCqok0lhQLzCzsqiqw6v0bNkDCYKgfMqyDdpLNxXwijBPzhl/iHwz6DqLEG9751FdwPKY/Rc/frsDkRKmHxEVvKHpp58PnuVO2So7bK2aT0bW6ezxnU+hbNUhxyTmDHWwFLhoctoeCkOCtHAP8FoYOGtukcFljkZrTHlLElicsylu1B1pw8i4J9AUsj0u4Bf70Fu9efgbFDGxuTi3MthNdu3uoflVkL1OsPMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SSswWVZMUnI2SlNiMStobGVmNlRnOXZzZ0NLb0JkK1J1d2xrTjJ1K3p4aFZm?=
 =?utf-8?B?NkpzdGNMOTc1VVY1SmNHK2s5a09tdCs5OWMvVXlxWnNOZHFQeS9MODRocE42?=
 =?utf-8?B?cFY0d281ZzZtUGdYU1c0ampwMnU5RnVOeG1peDVGYXNjOFp6a0IrcW5rV0hY?=
 =?utf-8?B?VFJ5U2UzVFk0QktyRnhyc3U2QUdwTkN4bGFtYWRaMDR3UlZOVjNNMkllckVi?=
 =?utf-8?B?anN6YUJJVGpHTmxLTzl3Y3NUeGpxWFBrSHkrVUJOTnV1d2J6alhTN3ZVZk5i?=
 =?utf-8?B?ZUtDL2RnUG1MSytxaDhjRnlqMlk5TXlFS201S3FwaURIOWFvNXpab2lpLzVx?=
 =?utf-8?B?YzZBMHM3SC9OcElaNW82bUs0cmo0MmJ1bSttMUlhdXdyQTVHMmNsRExJNUNt?=
 =?utf-8?B?eUJubWFmVXA3UzNidTB2TUdMMzhEV05teUZmOThmT05OWTBZcDNWMlNBcU1p?=
 =?utf-8?B?ZHBsMks3OCtYQXNZYkVHM0xZWGN0cUdVTlhzT0laWVVIcUtpSi94MVgrbCtK?=
 =?utf-8?B?N1BxRnFnR1d3K3hTVFl2UmFGY3pzL3gyVFNHc05UZWdqY2kySWhZMzhQM05G?=
 =?utf-8?B?NGk5Ylg3UGo4OE1FdE0yVlR1SUYrWUdldDVXb0hmTCtkUzJzZGtPMDQxdGwr?=
 =?utf-8?B?M1hjQXVwbkU2Y3ZSNkhHYmorT1k2NkVYelN0YjhkV1RmTStPbm5mcXpMN0VS?=
 =?utf-8?B?eVVONUU5Tkp1QWt2ZWV4L1NtYnNYcktBZlZ6RFd6cGIxY25Rc1hqdDFZaDFM?=
 =?utf-8?B?SUVKU2tkVFZ4YnBnc0pMYytmcmRzYmhUQVd6WVVrdWFHN21xSHE1QndKZkVJ?=
 =?utf-8?B?NHZENG1SZUpkUndyOCtaMm9oOG05Tm9FRnA3U0hzUEhlc3JYcXoyd3M0S2sx?=
 =?utf-8?B?VGpoci9ONGRHbS9WN1NlVnhYeGdQT0Rabmk5UUVQbjVFeGx3dTliM2RvQ3lV?=
 =?utf-8?B?SUYxTFk0NU5kZkVlQ05UZllKaXpvOWdPWHhvSUdvdUkxOVpVZ1hiSTJ5TnV2?=
 =?utf-8?B?bU5TaWxKbEJIZmFKVmxjMzZ1SldXN2xjU3crTk9BTWQvM3g1R0VuN2lJemhw?=
 =?utf-8?B?dW1wRm9HQUhOcVZMcTg3Ry9nVEh6VG5xeXhFOWFROVU5M3ArVWhERE1ZVWF2?=
 =?utf-8?B?WjY5WUtmSWNXVVdEbXVEMXpkWWhmVjNVOWYzdkFFRWFiNWhkUTl4RUlpaTVz?=
 =?utf-8?B?RVM0ZFczS3VLcG5YUmcyUjhxcUFtZjJUY2w0VE05YmZOQkhONWl1OEw1b2Ri?=
 =?utf-8?B?eEFqV2tBRUZWQ3laTmFhOVIwZkNXME1vSHJxVjJJeEFYMm9LN20zd0Z3VDdi?=
 =?utf-8?B?Y3R2UVhYMUMvY01qVmw5TnJ5VHZYWjI4U0phdThFMEZQS0dORkVWQXRPdytn?=
 =?utf-8?B?aDdUNjhLNUZZWkdoTEE4akd0b3ZLdEdrS004c0g0RzRpU056QWJLaS9Iends?=
 =?utf-8?B?ZEJVdHJ5SUd3emNSenI1UVVEU0xRWk9GSkxHSFV4d1BNSmh5SUx2RTFlRm51?=
 =?utf-8?B?R2lEWldxVGhxWjI2aWJ1V2R1YXB5YXljcy92S3B2SnFMNXAzQkttekNJWTl4?=
 =?utf-8?B?dDVuVWdpTkxWemJwcDE1QnE3ZGoxRzRaRHJNUGttdFdtcG0xNWpBYjdKTThB?=
 =?utf-8?B?OFptTlkvQUtqaXM2U2NCK0UyVVp4KzFQUWRKK3hFQzFEWDgvT0V3SUYwTVg3?=
 =?utf-8?B?MUxSK2NlUlpsT2dnMFBlWW0wYVhRQUxTTTlQZk1vL3dxS0hQd0kvSHFRNDF3?=
 =?utf-8?B?cjE0bml1Rm05ZWNNMS80THAxbEJlVVcxZjdLYXpiN2p5QVMxQmRZT1Z3Nld1?=
 =?utf-8?B?SHVTdk00d0cyWWF0RzBuWlVOVDhtSWtudm4rcGZsYlpjM0xvd1Rzd2c0ekQ0?=
 =?utf-8?B?alVxWVI3Z1IyNHZQME5KSDcxemhpNGR6cWdyMzBEWGdIUHFwMjBSRVJpSDkr?=
 =?utf-8?B?OXFFd0Z2ZUQyVEFwOFBGeG1YRWdXelFLUzBBN2xZZzVRYUpiVlRtYVdQQWpJ?=
 =?utf-8?B?dHlJdWlaRS9hckRuVTVocWJxZzdrdUlQUjlQYzRWdkp1L2lEQTRYVDdsUktT?=
 =?utf-8?B?UXBlZkM5bTFNbmhTaE9LRDZXaDdndEJWaGo0UVJPcDJ3amJRdTBaY1V6TW9s?=
 =?utf-8?B?SGprc1AwWWEzZGRabEZkZ3kxSzJ4YnhtQ0lwTE5LVlVpZkE4bk14RXRBSUlD?=
 =?utf-8?B?OHllK3ZHQ3NhNzFPa1JYNzhiNGQxVEhqenhMNkJGMmVrS0prTThuWGZrQURQ?=
 =?utf-8?B?SXZFbHRKRGZkMkZPVmdjZld1YTVFejlsaXJ3Y2J1dmN2cEk4OUhUdy9ISXpO?=
 =?utf-8?B?Ty9hd3ZaTlZmeG1nK2pmRTk0NjJySndvVlJmeGwrZEtJZUJJVTJHUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ee6489-dd3d-43cf-69bb-08df09c80467
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:31:18.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7k5rr8LoSEnsip/ZEHCkVdH5lbEBL6By2cQUPdZxnRDBiQCerp90/arUUwx8AlSS2zlc7LCrvIA8ki4BxrLchMLvmzBFQUmK6zyB2cHUbz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5269
X-purgate-ID: tlsNG-16d1c6/1788445882-FDC0F77B-31987012/0/0
X-purgate-type: clean
X-purgate-size: 573

On 03/09/2026 2:02 pm, Jan Beulich wrote:
>> Aside from potentially reducing a few
>> VMEXITs, this fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE
>> and L0 intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so
>> L1 never sees any CR0 writes.
> Yet if L1 sets CR0_WRITE, since intercept masks are ORed together (if
> I'm not mistaken),

L0's choice of intercepts needs combining with L1's choice of intercepts.

Mostly this is OR-ing/unioning, but not exclusively, just like levelling
for migrate isn't a straight interception.

~Andrew

