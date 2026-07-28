Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DC2C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:58:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373958.1620862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohNr-0005pg-IE; Tue, 28 Jul 2026 12:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373958.1620862; Tue, 28 Jul 2026 12:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohNr-0005pZ-Ew; Tue, 28 Jul 2026 12:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1373958;
 Tue, 28 Jul 2026 12:58:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wohNq-0005pI-Aw
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:58:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohNp-00ELxn-Nb
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:58:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a68a758-e002-0a2a0a5209dd-0a2a4506a76a-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:58:09 +0200
Received: from [52.101.52.14]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a68a760-195a-0a2a45060019-3465340e071b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:58:09 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by LV5PR03MB8436.namprd03.prod.outlook.com (2603:10b6:408:363::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:58:07 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 12:58:07 +0000
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
 b=tRYxn0FUdmgg7SjdwgAAMI8aGVuokewYJ1Grt+IoMeRS1PWQJBDGTCcBLj/zqi50gJY+4d6f45GdeWge5f6eMQ26EHakvfbfAz7HEmQuK1qXp0SgdjBQzkQ4PvtYmIoLD6wCGo1pADgViQkZt1y5NkX4vagXljmwvrMcW/VoHcfaA0jO1OgiTpzY0NhLIlN7DISLTkGmvx6NatLH/1OlH+zfBHUHAj8rybBjoiyMVLgDTE43I/fVsOm3nPtp8NiEfhh9GBJ7RFxlhsOzjOPLMlRwpSJbWh95utuN+t62cw0JT1slyrm+Ah1+3DdFfQJ8P60o7CRV6krtptkXoq3cpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl+CNZzZchFuKaqFlBdG0xNrJV1Mh4ogyzcdf0ysjYM=;
 b=glu7Q2SsPw9eFtJ8XS7dvL5u67QurdRyxY96uQJ+lPKeq/5gEr2JyIe2Vtb/4Jq3S2f5L+EnOGVau53yzBnqVpPFcVj7I2lYLlUuL7rSXh9BOpxqB7osCH5Xy9G5H1LSvs8EOR6o9cfP6nBDMqcgCF7qPFWHWuO7NjEmD2HeIG1cz7cdL9layPJxjT1sT0FThBXU/hcx+cou2SmL+g4I80VHCqcmLLt1aLDyuC6rGuGoJ9oLyqj+aRDuUlnw+NO73+oz+Da8ddDfg2vpEYA6JcxBK7bWi/sGOcNWIgtZykCuBsVc80I+dSJgm4AwcO21H7vX2AmZFKgz+rFtpObRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl+CNZzZchFuKaqFlBdG0xNrJV1Mh4ogyzcdf0ysjYM=;
 b=QvguYVM+2R/QwZBjJwOvC5ZCou4NPJ40srIQ9FLDclDXB+ETAsnZbX48z/ZthldgcHDQwwkTvndXLtnU+vOiahtN/KpiQcM17s9oGnKcFBzv7WLmOX5Y7L6PEof6VhJJm+EBEzfBRLkzZnQEVbpIxmEAo8EX9dikPBVwxOdd4mY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <49b43341-5075-4989-a066-745373b0dc7e@citrix.com>
Date: Tue, 28 Jul 2026 13:58:04 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
Subject: Re: [PATCH] tools/ocaml: fill arch_config for ARM in
 domain_getinfolist
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0240.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::20) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|LV5PR03MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f799f5-9dbd-416b-7467-08deeca7ded6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7NS6ETfRGj1kAFrhMq0B8lJrvHrA3gatPWWwtibsE1R3OAqjQDQUrUwfrY6y1Ac0sRUupbNkMk9YmrJ4a7ed865vp79SOF241NVvnZ/pUEHKUEMJChRklEFBh9qtoPyAKGTsXxj2th51I8wcuSv55tWPfuq+AM57bBt9aHFElPx/gaurB4s/tv1vAtNeGsxnfxOoqQUQUUC1+0GwGiCWXsF957KQd2VlfQ77V6ZLwQaQoz/MrBGdUq5v8x8S4qOqIZwNzusfpVGk+Po0d/uLwrMyprboXvpu/jXMfGf37JR6JzVp6F9POqgjyRIiZJz43Mh+7k/DAMuvICbzzqGZILBD9xCsqooQ/iG3SALuFrJI6KsTy8vBv9dFdbwdwL6IE4+AFJEGPb6uVOvQYSXzk/84iegMd1v3eEVlHdWF2pZugivtiXSybI6FOSyzlrH2cRwdmgh9kIH16vCKSzPccSz5zecfxYC4Ue88eT9eQ/5mzLa1mJFf8GJw65Vj+ighTB7dwm5EjsWYRgZ8kBXyfeYvFK2fmA9Y6IN0aXhCrJAPcq6PSjbwXr0GbkNqzHiTgYxl55lubQGm82r0EzBK1AImXR1rPAi8hmn1ZZtsqkEfTrIUJYrGRcv/bmnvAXop7eScyHyw/1Jz+7xuyxCD+bFvH0CBANczsLYefTSVAyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWIyQjRKWGJTbXQ5RzM3NEJYWnl4d2JXYUxZWklCczB3YzlmNkFCQ1k4VWVv?=
 =?utf-8?B?Y290cElQMHhkNkhlYkJ1aUJCVEx0d3dTbVhMc3IrdzB1aFNNNU1nVFZNUHFN?=
 =?utf-8?B?c2UxR2QwWTZ0KzBUcnc4Y0FWN1ZLbTNWTUQ3cG5hZG5kbmcyTmNJNmVoSlpN?=
 =?utf-8?B?OGcwQnZTWXdSTXlRdnVRaDI2a1h4TU0vM0lwdFUrV2c4cDJGL1MxOHJVSnRS?=
 =?utf-8?B?OEMrWGdGbWduSlJ4VUJWY1RadzR5eFU5MlNmbldybjM3YmY1OC96NlRYMlpx?=
 =?utf-8?B?QStvY0ZvMGNqT215SExMbGVCQnFxWkw1WlhIYnZIY2hKdWdCeFhCV2xibkJl?=
 =?utf-8?B?NU1sNzN2U3ZpWW14cUYzSUdXM0crVmFZZ2NrN1phTkU5SlZ4eUNySnB6em9T?=
 =?utf-8?B?TjZKWEJ2bnFWdGZWcTM3VzZXRzlsZ1NtWWZIbGVsSVVmUzloRlplM1QwalVn?=
 =?utf-8?B?YVhHTzczaG56cjloaTkrbWpzaW5KbmoyZDQraWxFM2VkZjQyTUNKMTBWRE01?=
 =?utf-8?B?OXRxQlpDV1lsTHBEZnhUVkFsd2EzZ1NzeUJNdDBWRUxnSXUvVENDei80RmVz?=
 =?utf-8?B?d21DSm5qRW02SXZWQ2dOa1RGNWxaYmxOeVlFUFpPYUdqK0I1Y3RCNi9GSld3?=
 =?utf-8?B?TXhPM3NOdEF6bnpSTFV1Yk5HU0dKZzNGaXZSdlYvR25KczhpQWF6ZFNmL3Z3?=
 =?utf-8?B?SkR4N1dlczUveVV5N2VISnNvZ3FlVHBXdWZKMWR5SGoyb3pRWHJDNTNMM2Jw?=
 =?utf-8?B?RlprZDh0d3dGamVWRHphcWhGMkFkSXhkRlRpZVByS05QNHRSa3hNdXkrSUVK?=
 =?utf-8?B?YWJMdktRamR2N1ZqMEY4d0w4c1dnVFM4aEVUdTZGSnBtNUFMajBLdzNqN3lt?=
 =?utf-8?B?eVNsa3QyVFU0TEQvdFR2Um1EK1FOSUExYjRRMldRbGpIbWtOL0NDeGk3STZY?=
 =?utf-8?B?WEJwZVRIc2QzWHArTlhIb1lwTW03bGpTVFB1UHV3STNDYkhzK1U0ZGVPMkYv?=
 =?utf-8?B?Q0p3cXR3MFptNFNtMTVJK2VUTVQvUFFhZTQ3bU9WbkRCblNyTU8vcXFld2c2?=
 =?utf-8?B?Z2FuaTU4eDhMRkFyZVZBdmg2NmZ0cFowWSt2Z2VDNmh4VWNWZ0d0bURVV1kw?=
 =?utf-8?B?NmdUVDJFRTVjL3JqdEdBM2lZMS9ZQTMxaWdNdm5jaExzOHRKVW1qenBpd0FF?=
 =?utf-8?B?aERJbWdDM3ROM0xYZmNwbkFMbjNXRmJUL05heFdhMFRieEw1MUwwSytIWm9S?=
 =?utf-8?B?eG9HWUVIeXpJYzZZakhDUXlJeTlmRFVReVFrZmlYVG1xUGI2RXVaajdNdEQz?=
 =?utf-8?B?dG9ybENLeHVYYnVOaENZenFFUlI5K2tEZUtleXkvdTZwcXVRZzMvZkRWcWpy?=
 =?utf-8?B?YVc4MkpRSlJwZXB4TndtbFduWXczeTNrV2o5ZlovdlgwZmk3M0Z1ZHN0OVp0?=
 =?utf-8?B?RlVhUjQ0ZmlWeDlKblhnYlkrQWNpZ2dPMmtVMStWT0F5L1I4RmtGSTVwbVJz?=
 =?utf-8?B?anFPbjRkOTAzMzcwOCs3RjZqYVI2Mnl6UmtYNFFCSFpGTnRXdEE4VFBuM2U4?=
 =?utf-8?B?V0V0RlNCVWZFS2U0STMwaGFMZ3ljMlVYZXlaK3QzM0NPSHBTM3RqSy9aTFlj?=
 =?utf-8?B?VlJ2aElMY284L2h0L3p6UGp0dTVEVjMyVDhaMUdpRExocVdVYkNZYjdxNUVq?=
 =?utf-8?B?Rzl1dkt2UCs2d2duaVlXZ0E4N2R1Z242TTlvOFJOOWplaXdYNlkwYnE3ZHdu?=
 =?utf-8?B?WnBvRDgvdDJ2aWNEb2FLckVZUzdneHhBZ2ZsWFMxVkp5dnNWTk0rR1NGNCs4?=
 =?utf-8?B?NHlsMUtlVVV3TFU2OFhKVXJyelkyclRkWncxZFNMN3pYN29OVW1EcFBlVFc3?=
 =?utf-8?B?NmJjcG04TWRzMHQySVVuWTd5bTYyNk5LNEs5c212V256b0ZVSWhXUjB3RGQv?=
 =?utf-8?B?cmNnN1V2WUdhdVFvSnljZnU3NHcyTVpyellPcUFBRW9wUEZ4SlppSFl4Ym9q?=
 =?utf-8?B?V2N5bldWMm8rMStUOVdkTmlRYVByOFRTdzFqQkVOdmtzdGFYZUZMajV3SWZ5?=
 =?utf-8?B?aVF3VzdhN3RaeDQ5ZWk4T0ZNNHdEejRXMldtSWNaMWFKaXFGVU1sWkF6dHA2?=
 =?utf-8?B?KzNURE9oSTFWQXJVT1V2S3BuQ00vQnNMYUUvSXMyRTFLWUJaRk9RZ3dVbmEv?=
 =?utf-8?B?ck02R1l4Q3R0dkxWNm9uM24wTjIzeTN2am1KenJoamRpT1dlOFpkcnRhTG8z?=
 =?utf-8?B?WFd6eElBbkNwMlpCNlQ4dERhZ2xIODBvNmJLZ21YRGdEaTZxdm9XSENFQml4?=
 =?utf-8?B?enNqcTdRcW1CYWpHRldrN3RtK3czYTIxZXpraFpFSUx1eUJKZllWQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f799f5-9dbd-416b-7467-08deeca7ded6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:58:07.6073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suKQdjNpZVk0SblOezXk08TInFHJxBRnmUB4xhNE0aTUtAY0AK9+P+7Uvu7Msk0BiheCDSr3Fqs+5a75Cd1dLM91H5qDhqsmpTUBRiYl8tA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8436
X-purgate-ID: tlsNG-16d1c6/1785243489-FD00977B-FB5E03DB/0/0
X-purgate-type: clean
X-purgate-size: 634

On 27/07/2026 10:11 am, Julian Vetter wrote:
> In the function alloc_domaininfo() the arch_config field in domaininfo
> is only filled inside #if defined(__i386__) || defined(__x86_64__). On
> ARM the field is left unpopulated. caml_alloc_tuple() does not zero new
> blocks,

Hmm.  Yes it does.  caml_alloc_tuple() calls caml_alloc() which
initialises with Val_unit everywhere.

It is only caml_alloc_small() which doesn't allocate, and potentially
ends up with garbage.

Do you have details of the crash?  I think it ought to be a plain
NULL(ish) deference from trying to interpret Val_unit as a pointer.

~Andrew

