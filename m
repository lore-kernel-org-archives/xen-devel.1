Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9848606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=apEpCqQc
Received: from list by lists.xenproject.org with outflank-mailman.1459251.1671238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKF85-0006dm-36; Fri, 23 Oct 2026 13:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459251.1671238; Fri, 23 Oct 2026 13:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKF85-0006df-0M; Fri, 23 Oct 2026 13:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1459251;
 Fri, 23 Oct 2026 13:16:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xKF83-0006dZ-2r
 for xen-devel@lists.xen.org; Fri, 23 Oct 2026 13:16:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKF82-00AFrE-7B
 for xen-devel@lists.xen.org; Fri, 23 Oct 2026 15:16:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adb5e18-2eae-0a2a0a5409dd-0a2a4503e772-22
 for <xen-devel@lists.xen.org>; Fri, 23 Oct 2026 15:16:14 +0200
Received: from [52.101.52.47]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adb5e1c-fae8-0a2a45030019-3465342fd122-3
 for <xen-devel@lists.xen.org>; Fri, 23 Oct 2026 15:16:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4932.namprd03.prod.outlook.com (2603:10b6:408:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 13:14:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 13:14:04 +0000
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
 b=WOHS1ngNCy/6rNKKhFzvQxwMjmbyjKMS4Qgf6xjbdHk1MEN1Dii6xS2SZ1ihpOAQPNYoDfJYPNZzUaQa7/gWGZKquS4JvUygjp1mWEIXJbdcqYFvNpMRjh1cDYE/XgPILyUJDLiIZYvfhd6Qe9C+97TNcSg+ekeshFpKzHWe7HQRPdZS2wwDaURw5m36in2DY7hU1XpW1US7Q6ENN+FUwO+E5+knZ6moLX9ubD0qbweIiaOXIimZZauSMrGUrsZgMfzgY9J2ZbuUR7OIqtyaLZckLcQHBy8/VtnNpvdHf0NI08Iz+7MxkpQ6OGZqjkybJmQnYWiLXq//J+1PgxNE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZHdye5F6y7DiYUJRfyFI2Ga+u4H2/fgm/+sThwYkB0=;
 b=yN4v6g2IwovMp6eZ+CYLf7xrCzdF5dHsZt4QUDfWBlHNfcbODT3QTlqmm2k9z1t7AJtmDQqIXzfeEajRqUNLZULSPBqEFyyKGbPwyV+AQAu62SG93BNKPQvm/SAtdP2/bYMDHV1yifoBs99jzF7D1Gfzq8CDwGlNxjUx4HEvcIUzqik3KbpNgjn3UYi4IdOK5FkN3hk+zXAJAqRT7Kz1Wwzm83JYICxCwdK1ao9VJSh7ZUOLey9tMODwY3EV5mU6dbbTCtE9evZKcbRoZ+iwqpqyyptnvLLS/Nwq9F8mROtpZ1SAgiYSUuw6O2hwVpP84BNHuZQgUeeGy1XaqU9n1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZHdye5F6y7DiYUJRfyFI2Ga+u4H2/fgm/+sThwYkB0=;
 b=apEpCqQcwLAZ7eTDaYzFtctSNLnjuZuHeIu89ruN5FYOhJRexAgBQfNp4hMY4kZuQ6OjH+KJJs15Sc9h8+vV/AVq1E9FvLTEIJ6QPZINloeWmVI05ZYZl7IIS0lCoDfCvGlZCnCwZRlu5o2D9XYbLahJTyBj5cmzrEdduRH3qZc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
Date: Fri, 23 Oct 2026 14:14:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0503.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: 2607fbf8-191e-4f9c-5c2d-08df31078340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261009223027099003|261021135927099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|10067099003|56012099006|6133799003|18002099003|22082099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	hhzDmzqyRPn/FwDpQhJXqfnEOJ5HOf3pcWPNqtEFduZ/azXJ3PRPbLmH5SRahBWn9ahF6XwXBuLF5dXlgz7GHK20m3+r1I0hp5DUNsjLxV2M/240PBBnMKMS2G+L311CFQREOgb5bjRr3uWRuFhs7IOzhxMW7n4GVA658b1FKtm8h2c0o8XgekkFPVgMA64cfvwOIEEL4uqp+1L0h27eX4u6FLm7PT/Jrzzz8lU7YrEew4c1VveDp3X9g7NMl0mwjQuV1DjU9fkJufjDTTIoQ1Ktez2uX6xM72OSvGKIX3JBYnQrFnhC6TzV5soTHSmOtBxHppPrPoljsKotWe1KV1cNSyAv038SB0P3acStMIy9/BIScyyk+NFsQ8D0I3kwrWtTCU3UjQduhCyeKVCxgjuIqh/FNK7lfLaz29z+fhvDSnYvQinjCNiqAuD2xhVh1XDjXsCZ4cnyIATJUmw7DWWL7bI/6qDG006fEM2ZB3SqVCNfMyMregTicOf3ehqnLJtZOsKOxjLOxnPXUN3RN3M50NSjhT9wawyStbchLCG3wxoUj3PEvDpBfPUJNH113y94+PDbK+EJGEQtElqvYaJvbObsqNBmZiklBXxOqHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261009223027099003)(261021135927099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3paMU85M2huY29sNmZnblR4c0pScC9TaStuN0xLU1ZhS2d4US9NaCtncUVS?=
 =?utf-8?B?MkRSdC8wTXNwSzJydjh5VUJMTkhzUjNldS9zUDVDNEhzMU44WGhhdWRUcGRn?=
 =?utf-8?B?UFpybENhbURxdGMvMzIrZ2xvOGgyQlRZMXNNY0NaNFJyYWFMM0VEd0tCK2Er?=
 =?utf-8?B?eDZHMXRzNjF3OG9tVXlhSDh4UkEvOVpFRjl1Q1hyS2NPb29VNS92dGVzdmdo?=
 =?utf-8?B?SWxKa0tFalF1ZytPYTlDNlZXSzlMQ05GYWFyVEIrV0NLSFF3Y1NucVZvS0xS?=
 =?utf-8?B?VWpRTzVNb28rdXQ3cUx1SEpmdkVaVFlEMG5EbVpyK2RxaG5HeU5BMUZ3cktq?=
 =?utf-8?B?MlpwY2hxdTdDTXN4cFdmbXEvcG85dmYrbkE1aUhIQUNVZlVyR09lQlR6Z1Ax?=
 =?utf-8?B?Q2k2SkUxdUZlUEVvek12b2pUeFZycmlNMnNtMWRsTnJ0bmlqUnYrV2pjY0k1?=
 =?utf-8?B?RkJZTnhGa2NjMTJ3VzEwVG9ISDRmMGxMVU4xYnFteHkxSFZjT2YwTjlVMENS?=
 =?utf-8?B?TVpaQ0hHV04rQldrVkpabFFjOXVmMXlubmV3QUJMMnJrK1J0SG9RaklYSlVT?=
 =?utf-8?B?V0p5VDJ5aDVjaWxHSDJQRVN6TGxyYW5xNE0yb01WdUhvdlMyZFI5WTNTa21G?=
 =?utf-8?B?OFhTRnc0WlNtcXBqYWZESlFLQ2xSNlp3VW0rU1ltYmRLTkpMdUREdWlNWXYw?=
 =?utf-8?B?UlI5RW9YZGxnSTFiNmdqVnlkL0tqSUpCRStqZ0hGSktxWmVySkdMTUNobFhv?=
 =?utf-8?B?QWpnemJ6ZGJyL2FGR2VQaTdoMmdSUUhGRTBKNXlVWHU1UlVRWGVsektRRXMz?=
 =?utf-8?B?NnVKcVZFd3R2Rkxubk9DanZmL0M3NGxPY1NDZVdmWVlzb29jSStCeDkwVUor?=
 =?utf-8?B?VVNrUlZuR0o2S0FwV1F6R2x4N0ZWZzd4azlCS3RhTEpoU0lDQnJwWFBmNHV3?=
 =?utf-8?B?bloxVFhFeitCbDcrT2s5eUZwTjVNeDJkdE1JQytzcnlhUENPUDFOTDgzWGhO?=
 =?utf-8?B?blF5RkhwZ0E5dFpMTXZoa21iZC9lbUhEQmlJbjlRcVozczFaMkRyNlg3OENw?=
 =?utf-8?B?b1dER21QWlk5c2N5ZXlhdnFTbEJKaE9sSlhBTmZ1ZkNNTnBiSHlycVE0MHc5?=
 =?utf-8?B?ZTRsYW5Iak5wUG5JNlZUNTVLL2hmZE5VUVpJYjd1dVBWeTN2ZzNFZlk2em4z?=
 =?utf-8?B?dm10Q24yU1h0V0hId0hrWlROVzNWMmpUQU02UWtLM21MSzByUjk4MG5BVjR2?=
 =?utf-8?B?Q3VHSHF6N3J2UmY3T1RpanA2TFYvcmIrSlI5UlpYbEIxRno3dVBqTno2WEE4?=
 =?utf-8?B?eGhDRnB2NWJyZXl5UUtGWVRjUDJvNEtZckxZRlY4R1FpaUpseDBwenRkakNB?=
 =?utf-8?B?dGkrd0FFYTV1U1NKUTR1SUpUbmVTMnB2V1NOZkoxeDdWRWEzTkhGQ0VxWXgw?=
 =?utf-8?B?cnZkYnNZTjVZbW56bkZlcFVPL2VLMkZpSThxNjNhVm1jejFERTJaNytYZW1m?=
 =?utf-8?B?NGRoc0xxYjkwVStUZmtTT3EzOWY4RVdhd2xwcm90bS85a2Y1OERnbEVMUnh0?=
 =?utf-8?B?RFpTOXhFOEpPTVcrYlJKYXhFaWNMM0dVc3VzMEtDQXM1c010OWFmcHJEOWVl?=
 =?utf-8?B?MFgzNDJGY1EzUGFxMGlTdWpTc2h0K2hjdEtPNXZNYUU3L1ZaWTJYZGdKOTdr?=
 =?utf-8?B?MFVOcjU4V2c3Rm84d3k2NW03SEtZMmh2NTluVjNJa25Bdk5FeTJTU0JKeDRn?=
 =?utf-8?B?WmQ1ODdTbTZNa1MzSC81WWJOZlF4ZGJHNzhVelpHdmVRTE10VHYzYjFuaTFm?=
 =?utf-8?B?UUlCOTVOa1IrQkV4ZThneFhhc1dlbUhUVy9uVm5pTlVVc2dDa3JSZXJKbUdv?=
 =?utf-8?B?eDFtd2hjQmFBSHBjdHJEMnB2dFdBSVh3REZ4VVc2UjlvVjBOL0E2Tm00dVJO?=
 =?utf-8?B?VXBMNmVyWjh2ZDl5by9pR1owZ3V6b0hibkJraG1iVm15Yjg2WWE4LzgvSU1l?=
 =?utf-8?B?RFB5ZTJ1WkxPUVYzYWJlM0NtaW1kZ2ZYaXYvWHNyOXY3YUFuMHdzS09USzFG?=
 =?utf-8?B?blIwVVhUUHo4YzJOdC9UeXNKMWlLME5ISDQ2Rk1rN2s2MW5KWEVLYXhITmQy?=
 =?utf-8?B?UU44V0NURGF6TDc4UWcwdDBnVWV4aUQ2andZbEFNaTU3YjdDejgybTFrY2F3?=
 =?utf-8?B?TWJ3dis2a1FCVm45V0dudmhsNm5waW4xNUpHcW9qU3dPMmFNNy9CRU9sRUJz?=
 =?utf-8?B?MTlOUFY3SnpwcWdHQnFUbURJQWtONGdnNmJzY05MbDFlc0crYllvWGdadjBj?=
 =?utf-8?B?SFZURGt6YVcvZzhHa1N0Y3dzWVU3WDRHZ0kxcW5uOXVTeG1RVXNhZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2607fbf8-191e-4f9c-5c2d-08df31078340
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:14:04.7259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkjOYu+80PpPgV9yhNjcYXxKBeG8a2FkHjMHYrj6Q/40pKfj6OYIp5qZeXNYynpHdy/3L2QmTgQSJ5zQHa2F1oqa+6OqKlkNAUfXGWggX44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4932
X-purgate-ID: tlsNG-33051d/1792761373-76CF84E9-E633BC51/0/0
X-purgate-type: clean
X-purgate-size: 5019
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 8:32 am, Peter Deggendorfer wrote:
> Hey Xen Team,
>
> I'm hitting a reproducible hypervisor panic in the AMD non-fatal MCE
> polling path on a Ryzen 9 5950X (Zen 3). Eight occurrences since
> 2026-09-09, between 12 hours and 2 weeks apart, always CPU 2.
>
> Environment
> -----------
> Xen:   4.20.4-pre (Debian 4.20.3+127-gc42374a105-0+deb13u1), and still
>        present in 4.20.5-pre (Debian 4.20.4+39-gf1e1321c87-0+deb13u1)
> dom0:  Linux 6.12.111+deb13-amd64 (Debian trixie), PV, 32 vCPUs
> CPU:   AMD Family 25 (0x19) Model 33 (0x21) Stepping 2, Ryzen 9 5950X,
>        microcode 0x0a201210
> Cmdline: dom0_mem=4096M,max:4096M ucode=scan console_timestamps=datems
>
> The panic
> ---------
> (XEN) [2026-10-19 08:58:18.727] Xen BUG at
> arch/x86/cpu/mcheck/mce_amd.c:100
> (XEN) CPU:    2
> (XEN) RIP:    e008:[<ffff82d04028a650>]
> mce_amd.c#mc_ec2type.part.0+0/0x10
> (XEN) rbx: 0000000000000445   r12: 0000000000000011   r15:
> 0000000000000446
> (XEN) Xen code around <ffff82d04028a650>:
> (XEN)  90 90 90 90 90 90 90 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90
> 90 90
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04028a650>] R mce_amd.c#mc_ec2type.part.0+0/0x10
> (XEN)    [<ffff82d04028a699>] S mc_amd_recoverable_scan+0x39/0x40
> (XEN)    [<ffff82d04028cfdd>] S mcheck_mca_logout+0x42d/0x840
> (XEN)    [<ffff82d04028a35c>] S
> amd_nonfatal.c#mce_amd_checkregs+0x1c/0x100
> (XEN)    [<ffff82d040240e8c>] S smp_call_function_interrupt+0x4c/0x90
> (XEN)    [<ffff82d0403123d5>] S do_IRQ+0x2a5/0x650
> (XEN)    [<ffff82d040201915>] S common_interrupt+0x135/0x150
> (XEN)    [<ffff82d0402883ca>] S cpu_idle.c#acpi_idle_do_entry+0x8a/0x140
> (XEN)    [<ffff82d0402887cf>] S
> cpu_idle.c#acpi_processor_idle+0x1ef/0x650
> (XEN)    [<ffff82d040302cf1>] S domain.c#idle_loop+0xc1/0x130
> (XEN) Panic on CPU 2
>
> The outlined mc_ec2type.part.0 contains nothing but the ud2, so this is
> the "unreachable" default branch of mc_ec2type() -- the extended error
> code matches none of MC_EC_TLB_TYPE, MC_EC_MEM_TYPE, MC_EC_BUS_TYPE.

I think it's safe to just drop the BUG().

That code is literally worse than useless, because if nothing else it's
just hiding the diagnostics.

I guess it means AMD have added new statuses.

>
> Across the eight occurrences, r12 appears to be the bank index from the
> loop in mcheck_mca_logout(), with rbx == 0x401 + 4 * r12 (MCi_STATUS)
> and r15 == rbx + 1. Three different banks are involved: 10, 17 and 23.
>
> Not a hardware defect
> ---------------------
> - Started within days of upgrading two hosts from Debian bookworm
>   (Xen 4.17) to trixie (Xen 4.20). They had run 3 years on 4.17 with no
>   incident.
> - Three different banks, so not a single failing block.
> - Updating to the current Debian package (4.20.5-pre, built 2026-10-16)
>   changed nothing.
>
> Possibly related: 532988dccc19 ("x86/mcheck: fix mca_allbanks
> updating").
>
> Also possibly related on the Linux side: 0422b07bc4c2 ("x86/mce/amd:
> Filter bogus hardware errors on Zen3 clients"), where bogus MCA values
> on Zen 3 are filtered rather than treated as errors.
> https://ratatoskr.run/stable/2026/04/7143905

From above, you're on a Vermeer, not a Cezanne, so I don't think that
Linux patch is relevant.

However, your observation about "fix mca_allbanks updating" quite
possibly is.  That was backported into Xen 4.20.1 as 247b708b1400a, and
Debian has 4.20.3

Are you able to experiment with that patch reverted?

Alternatively, are you able to experiment with the BUG() removed?

>
> Diagnostics / workaround
> ------------------------
> mce_verbosity=verbose yields nothing useful.
> max_cstate=1 made no difference. mce=false is the only thing that stops
> it, and it is what I'm running now.

The fact that mce=false isn't causing machine resets means it's clearly
something the hardware thinks isn't fatal.

But, I am concerned by the fact it's always on CPU 2, and multiple
banks.  Is this true for both systems?

>
> One more thing: the host does not actually reboot after the panic.
> "Reboot in five seconds" is printed, but the ring buffer continues with
> normal activity minutes later and the remaining 31 CPUs keep running.
> CPU 2 stays wedged, and "xl debug-keys t" then hangs. Afterwards dom0
> and guest vCPUs start losing timer interrupts permanently (RCU stalls
> with a frozen timer-softirq count while dynticks keeps advancing), so
> VMs hang silently hours or days later.

I've recently noticed that crashing with interrupts off doesn't reboot
any more.  I thought it was something local to my development, but
apparently not if you're seeing the same.

>
>
> I've attached the full xl dmesg log of the last crash, and I'm happy
> to provide more if needed. I can also test patches.
>
> Thanks for your work, and thanks in advance for taking a look.
>
> Peter 

Thankyou,

~Andrew

