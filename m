Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE091606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=bXKkWkbe
Received: from list by lists.xenproject.org with outflank-mailman.1484317.1687686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRAB7-0002Wh-Jr; Wed, 11 Nov 2026 15:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484317.1687686; Wed, 11 Nov 2026 15:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRAB7-0002Wa-FA; Wed, 11 Nov 2026 15:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1484317;
 Wed, 11 Nov 2026 15:24:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRAB6-0002WQ-7l
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:24:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRAB5-00EVty-Ku
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:23:59 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af4888b-e002-0a2a0a5209dd-0a2a450a917c-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:23:59 +0100
Received: from [52.101.48.67]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af4888d-f2d2-0a2a450a0019-346530438b22-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:23:59 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6545.namprd03.prod.outlook.com (2603:10b6:806:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 15:23:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:23:52 +0000
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
 b=bBoyRKbKCqvgy5djSi1v7eWT5n57jyR5PiaPwo7wc3TkswNAg29PC4iSJvv5GGO+2SQLmmkk5jNzepyaVx7eQVTaCE3gx/k+OeS/YeMKm7LWvNV3kWNI5KEeH6+Mcaiwwtu9/dtY/KRxxusludGLnXWpntKgIU1wDkC8Kx5KJUJAJAnf3hKiOZUeeiuz04l0PYElRDHtjPxGdlV1KQFxFVe/FY39k8Jkmg5hSbR+7cSH9YDUB39WXRUYm09ZHBAHiGPylzKdQ5sU9TexXAsmkhlZND03yuzJ2SNFxT1B1K1bkPeSZT6aIOvS8LDmM+kADBMYcAhaY6zoDBJ707wChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwMEITRmZkWHSL+iVqTec6SPfO6ykHJFR3gtNQwhFSk=;
 b=Oy0IRrpxmucOiY5HRjTk37hzO8dqmfFmdnTUkn0O9wHszrvE1LkhviF/2pFkdo7LEx03wntanf2e4UW0p7VpKY1/p8y/5cEEo5tHUj/fidtUGxvoqGZFUX5cpcgOl2H4XtiX8uXL95KU5nvk9qncjS6inaQpsPl78mkU7+EV/BoEVeyA2RNUVXxNMMYnShe2y6tu+/PMKUjAIDTQDkfJO//0oigb3kXXKI6Tm7k4UeMvw1TjFyTM43pr2JUw1RO/vqCArdfLpR1gFLfJXuUiHK9sd+n5zBKmvs38W+qO6aexPj4B1NbQQ5v4lZrxu/HIiGqbsLxBQC/C1CCHyVdu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwMEITRmZkWHSL+iVqTec6SPfO6ykHJFR3gtNQwhFSk=;
 b=bXKkWkbetHxtyKZcUTs8uedwG5CJbSr6VedUJwb8XtuNlGWjlWXgKKIaw0F27ns81PTTBKIqCG7oq5rEIrbD3OwMBWzcrlcbyX3Hnq5gtkpzDoHkadWUrMBQCOcpl3+Zpfckz8d3+w1mIvXMSyQ8FeC9ahxLohGjQnyS4ExrFCY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d606fdab-f088-44e2-b86d-a02f3a643021@citrix.com>
Date: Wed, 11 Nov 2026 15:23:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: preparations for 4.22.1, 4.21.3, and 4.20.5
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <399a2c0e-8a47-436a-bae9-51cf93336973@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <399a2c0e-8a47-436a-bae9-51cf93336973@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bae2567-bcdb-40b6-84e1-08df4007cb38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UG1i1rh4XCN35VYn6LRgXgyts4hXyfr5uiaepvi0NpvmFr6P/LbG32V74Oh+gDlF2k+CVRHvaKNs7vdaPcRyssrZpTbBgazx293BSvmL0KFdKLz9olklxwBvXJYZl+Wmc3/OfXraMfgeAPAAbIbJIFQG4Wgc94Y9pzV1dlL+6l2kgpt3cQiugqj/m/3inYjdqTuhI3sOpiCbw/Ks6gN48jGU33u6Up0GD0aFFZqFgiowBx46viFuMwyBBYV9HLplIebeedUTsmoTpsxgqSLzCdklTQ/y6rM3O0AbZlD++buCPPUyp76E/kwruRfrW9pgeKNx0KkCw2nSuJm+yyGDJMM/ch2kqUMflNI6ALRa/XetUtK5LYNXLf15iz4gHMTO+p+HkxSOpAZ6hKb9/vIvVpJUtRf0zWI02adp2vqQer3JKUjeVrGkVDqF0ZjnJcr0mO5VIEJX63BCdLRnvCefJJ8uhkEtg6rixAKDVxj/s02QYG4+UPh3NmaByLvcSBJkRdNkUaEb7JItH+k+/ICiyGW5hkVnqERac8+eCNX2zH533leMy+5sUNFjHkGyzCW0UV7BJ2tx60O2Z0ZuPOvv1gTKk+no5/fdw4arl92wvd57mF1l7asbK6oPB5Q/5wAkrIt67wqtFuJ5dwfJHhfa7ZRSI16BEJVqhjqePX2xp3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUxiS0s5WFYydHJwd3Q4L1pyMnkybC90a2pBTXBXQ3lqT2tmRlpwSjQyTE8v?=
 =?utf-8?B?QWpYbmp6VS95M1hsWnlYY3NWRmxaNWtBbjhtKzRYS1dQWWs5Wm1GSmU4WXlN?=
 =?utf-8?B?UXhDTlIxVDh3WDVjd3lBam5kWjhHdmplWm4xT3FmQTlSR0J6M1BZanhjZWVx?=
 =?utf-8?B?K0tteFl1ZXhvWm1jQmhvb3ozQ1lZdEoveTRRYXhkRDNtWlIreGw0ZDh5eFBE?=
 =?utf-8?B?YVlMZUZKY1BmSDVJc3pGVmR0UjkxQlF2OUN4YUNHOWZpSUZDS0plWUVtSmVK?=
 =?utf-8?B?ODBzM0M4VDJ4bGFoQkZOdS9TMnFpN0lnTFp6K0lpa24xMFJIKzlTSFdwbFlI?=
 =?utf-8?B?THM4M2NKNVhxWk5idEhVait0OW1KRndreGd5WFlqZDZ6VGU1ajV3dTNKVm1O?=
 =?utf-8?B?QUZKNjFJNnd3dVZ5T1pJSjhMSFk4dm9PVlk2WXMvRStIVktnRXhtSm1HK3h1?=
 =?utf-8?B?NXFOU2lScUlJUjloYlNOcUJMbGI2cEN3UndkQzJnZFV4clNmaUowYzRBS1dR?=
 =?utf-8?B?djFabzRROVRKOER4OURwRmNNUVdVZlJZajRYUnZITjdpc0JOZGNGVmptTEdS?=
 =?utf-8?B?cm9WSlREeEE4RHM1aUlDMlRoZEtsNDdBblA4Y2U3cGJZekNQZmFJLzhyRnpa?=
 =?utf-8?B?Rm9HeVJ6MzU0NUJPY2FOZWs0VjFUUkRxN0hrQXgydC9lZ2RlaUJPNXZJRXRZ?=
 =?utf-8?B?a2xocW40SXNCTmZKbXlTaW0zdk4xL2g3RHFZOWw0MWQvYmQwYkpxWnNCTjRi?=
 =?utf-8?B?cVMvVzhSZFlYc0I1dXZLSk5LYk9VWTlSWGwrZ1dQOXpaeHBVTXNVbElNeFcv?=
 =?utf-8?B?UW9wTnJCNDZnTUtmTDV6L2x2TjEraDIrdEVITnJJMGRJSDhQY3NrbHlPSzZN?=
 =?utf-8?B?TmZLbWFWR2RsbGNFZkpIcmI2KzRuOVRtaTBoY0hFZVMvQ3ZHZzVPV2pFRmJY?=
 =?utf-8?B?Q1JmZlc3VVU2cG9zdHcyUitabm9Kd3lKZWZodVU1R2svZEdnMzZZSXQ0Rzdq?=
 =?utf-8?B?NnZjRVpBdUpwMUh1UCt2Q2g5NWE3Z3QyV0xTTDlTeHFUSVpNc3prc09UalVR?=
 =?utf-8?B?TmRHNHRZWVU4eGM5YjF6Si85ZmFEc0RSM0tyUU5CcUoyajFmUWMrWUttWnhy?=
 =?utf-8?B?bTg3UUVrRVJPNG9NUE1KU014bEVaYTU3a0JYMFdYU2ZkWkFFMU55Q005QVVC?=
 =?utf-8?B?UTdHVnkreENWd0l2U2t0UWhKbGV2Yy8ybVhlOHhCR3EwZk5sUi9lYVZsZ25y?=
 =?utf-8?B?OW1Ud1dFUEZjSlEvNS9heVRqb2JRWDFtZ0VXN1A1SVpBMGFVbE9uVGZTZ296?=
 =?utf-8?B?TmhOc1hwTEdHVFU4WURjUmZyOWNaTjNJYldiMzhSNTB2eExkK00rSUh1eEpt?=
 =?utf-8?B?VFhaSDdwMEVjbWlLYmZzV1FsbXMxMmtOZWhYYWVkaGhueVMyQVdaa0lvckpK?=
 =?utf-8?B?MHZTZFNQWjU5VURiUUNuSE5PaldhMHRWVDM5ekhvM1laZ2Fkc3ltL0NIVWZk?=
 =?utf-8?B?c2VCTHpBL2JGVXhMVm1WL0FEWXRwVDNWVnd6Qi9kQklvdWpuVG5vQnRqOGta?=
 =?utf-8?B?dnljb08zbzF5WVFaT0dvSlY0SW5HZ0NCYnlGVkRSTVBZcHJFU1RXMTdCOXQ3?=
 =?utf-8?B?QVI2WVd0YUhETVdhWDZpbW9iZDlEVWlTWlVQaFBhOXBTV21HcFRYa0RBQTNx?=
 =?utf-8?B?QTJzQzdzZXJmWUgxZng2eCtrNHNqVitqRG1PV3lJWkQ5dEgzTy9wdm5hMHNo?=
 =?utf-8?B?emtuUEhaTnMyZUVPTmpRTXRNL0l4NlE0Tm5kd1hMa1VGM0R6VEkza0E3R3E4?=
 =?utf-8?B?NEtkYmhxMWNoOWZSbFFadDVZV0pXZWZkMDZ4N3VHbzYwcmFWTmtCS3pMZVJP?=
 =?utf-8?B?bnlrUDR2cFlDLzVkMWEzRzk0aVRtM1Z5TDN6T3RnQ0xQa2NGRzN4U2pSSzhI?=
 =?utf-8?B?c0V6VzlaWjJtYS9DK1VFWDRLQUVmMVJKazhwczhVWXZCVmNGUTBlL2ZnQ3Bo?=
 =?utf-8?B?czlQdUdqSWtVZDNmem9MSnE1ZXNlZDFkMnZWMUNpaXBVcVBQd0FSYTE4VkZo?=
 =?utf-8?B?WERuazFlSEw1d1VyNVYyYm9ZUS9aWTF5RTlLVXpHSWlmYlQrTHJoMlNuWXlV?=
 =?utf-8?B?NzNOUG1SMUlSZWRKd0FYeEVkOUhqSmlNdzBWU2Q0V0htWlR4Slp1N3NXOEd6?=
 =?utf-8?B?emhlMXpEN2ZBOGV5NGY5UloyQS83SElHdXhHamd2TjRoWHN0TktVeXY4VThI?=
 =?utf-8?B?TXNWWmpzbWlDbzVsYzJhZW9QaVo0VjdMcERqVnpqaU5KSzhKRktyV1UvRVhr?=
 =?utf-8?B?dTR4VGdaWXdPVGV1RXNham1wb3hZTFJCc015d2dFMS90Wk9ZQ085Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bae2567-bcdb-40b6-84e1-08df4007cb38
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:23:52.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1inHD1PnjlIDYnBP57n9pd/aXChdhGaKTTOIhCEuFxH4u/Fd17VI+ZMGsOlULhGYdKdQYSFGBwffN2muHAIUbH8+DFKHPvKTO4r5DMRpFTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6545
X-purgate-ID: tlsNG-4011c0/1794410639-524DFCFC-E7FEC177/0/0
X-purgate-type: clean
X-purgate-size: 716
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 1:31 pm, Jan Beulich wrote:
> All,
>
> the releases are due by the end of the month. Please point out backport
> candidates you find missing from the respective staging branches, but which
> you consider relevant. Toolstack backport requests please go to
> Anthony PERARD <anthony.perard@vates.tech>.

From the XenServer patchqueue, one toolstack patch:

0c53660c1cf3 tools/libxenstat: don't lose all VIFs when dom0 has no
Linux bridge


On the Xen side, one borderline.

1bb05cbdf650 x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in additional
cases

I recall it being identified as a perf problem which showed, but I can't
recall the details.  Teddy, do you remember?

~Andrew

