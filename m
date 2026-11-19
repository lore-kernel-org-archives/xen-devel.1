Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E321606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=q0YWWMk0
Received: from list by lists.xenproject.org with outflank-mailman.1496330.1694926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU1aV-00021K-5d; Thu, 19 Nov 2026 12:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496330.1694926; Thu, 19 Nov 2026 12:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU1aV-00020o-1g; Thu, 19 Nov 2026 12:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1496330;
 Thu, 19 Nov 2026 12:50:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xU1aU-0001oj-2T
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU1aT-009MoI-EF
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:50:01 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afef073-e002-0a2a0a5209dd-0a2a4509ccd0-18
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:50:01 +0100
Received: from [52.101.57.31]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afef078-be1a-0a2a45090019-3465391f77e6-4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:50:01 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5106.namprd03.prod.outlook.com (2603:10b6:408:df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 12:49:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 12:49:58 +0000
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
 b=M0p1A/SKecJyPSOhNnvvxwWKHVVqR8qEwbYfDhjH425Mq2Y/8rsA3ltzqfLr9J1ZDGkr2WEyDvWxzZgU2CmrOZMId0YBR5bizkO+CZQ8+A6M4i1TT22eqYw6DAJVNxkxDDk88p9raPMbR0tWa6yU+/GurLQB968DVoYtD5dtpV3RrtfTDWBaS3N7c8PID08AGeZuL1tgKacTmgememm6v0iR+STnh9jxHa9zgfUaUwblRvYHH0qseme2hP7wMCr7aSObBhTeW6JEogit6/ZHVnDRO29ncA4stdDq6s69BJXEQZ4ZMQypUFtcTSxQJPIQw3FXdXLN0vjlfT1dRTvCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcH7yIzte50mF1Q4cFDpW8CwTDrtdcowGNRsP+liegs=;
 b=uDvJAEBoZJO1YYcEruFjhaDW5qFcU9OsAhMG5D3Si5aew7YokGHk775JpNurY9OKqNClNY3qWdDFuDFSnLaEbOH0d8IYEyJEb/hIlbBMREL42dl/2m4RnJoXJ1G7XaePW3ysSVofoc2gLZqn3IYa6lLGIXK8sKQMPo257Z42NnjUDY9LR15ovM9TRRSJk8wml9jGKO4NHwW+4l849JREfXJOPoRSczN5oNfQwqar4cf/vkfJawCYp6IcQK5k52RI9CcmqG66D6uokIDUlcTV1wKnUflV3+8627p3GaHvni9b4vipiroNZWt/4Fj4RFvkwMC6YiOJuK7/uKxgbefCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcH7yIzte50mF1Q4cFDpW8CwTDrtdcowGNRsP+liegs=;
 b=q0YWWMk0kqD1oOU5eHuAeb+U9YBtjrTLkjmrTkZ4vOrPeX5EsR/GKnBX2aETvk2yvZ3Ud1ecrvEiZ+5v5AIAXy1/HB2wdl7BEr4lfuoirASeGyDDkqOefYYaTi3xhtcuA/RJ2u/eRUUnaAzJbAb0fJnVuuCQlFRPiBsHvEFgbU4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5458b651-cb26-4b20-b39d-6bb75dfb684b@citrix.com>
Date: Thu, 19 Nov 2026 12:49:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86/vLAPIC: only accept interrupts on enabled LAPICs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fcf0446e-3511-4dfc-b1dd-1445f29ec815@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fcf0446e-3511-4dfc-b1dd-1445f29ec815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: b500b0e0-c736-4210-2711-08df463b9df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|261009223027099003|56012099006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KDU9jeMMlESKvWSDD9zuDRltGiYLwqj0gjIeLHMT38lxdUIb4QHY4EpeQvv7B0HeyD/Q3vLXlqIA1z1vijEipUH/rTLynut8ubETFup0Ffnss6+F2djA0zFAyxoBTjPDoPlSxcUjkPBtATKssfsYOvCnAqIKkhSJkLj1fu6fZkIArUGTHnsG0dWfXNfc4jrr7vAA868xUgBlF+K+ePXIYRr4ZAiuTyHt9tKdTszJsWaatbHv+bzqV8a7AB84mhWWiuBWzX5LpuirfRK88GRTQaHafXp8W4IgsiZ+h1oBxFdsSmoDSV7pGwV4XqcwLFqyLkifDLXwm6Pg4knVKGgwyKtpWFH4FRIDGo+xatPO6vksEZwnH3/aX5Cw7IP/XHK8X/0lYw0gwoZ57x0f9Jo+hDqVolm6QQFBK0X6Kmvx8Y5q6TZDZa6+mMIgnSBkvtaXseiUOWth4ceFMr6X4rzomOj6ry8ztFMsqg0opV5NtGLtUEQS/vSHsPZGz1K2ba0ysddU7/kk7Q1Zw7/528zIr7/UObF8iAjro1z/DDI+WEw+TBqFur6ZiNCrsolA9Qc+kBddosQ8mNQ+KPCrFpoGVITh+hrlBEWTs7vijcfI6+JHpnFlV2ZYIn3uFmdeeygk34V4++OdKtZS2LO4Tk/hYlOLgNA44RW9uYwR0VoAKX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTl2dXhjL1ZkbzlkeENNajFyNGN6cWYvTm1CMTRxYXNvNi9EMzZvN0Fjdjdh?=
 =?utf-8?B?YytyVStSaHB2M3lqcnlpcmFiNllmd3E3Vy96dmxpVDdFdlRHZzU3Sm9MTWJs?=
 =?utf-8?B?c09NWnhsV0t5KzdRT0JJRElyWUFpeDBXYjA1WCtFWmRvT3dxNndGdDNxS0I2?=
 =?utf-8?B?NnRIai9UOSt0MmFqSUU3b2ZSU25zVFg4TVJ1TGRCVDJ6VW5HeTdmdkN6Kzk1?=
 =?utf-8?B?V1B3aGNUQjVueWl2SlcycWt4QTV2TXh0OW1ZRUh3OEl0MVhxOU5OM0V6QVNr?=
 =?utf-8?B?VlRIeXlTSkpTYzBqWUhnMWV5NTQxSnZpVFBOOEtndEN3aHJSdXRmVzNFWWYw?=
 =?utf-8?B?Sm1mKzFPUUxQdWdncGZSMGo0KytaMmlDU1JVa0xNSkk1c2lqS2RYc1l2TkVV?=
 =?utf-8?B?MzVqdCtpSnhWc2dmbFJuSnBEdm5COEdMTitiYUhNRDNWWXdUWG40MlF5WWZW?=
 =?utf-8?B?QXlvVXVPd0RWVzV1bTkxSkxkcjlaUWF6VGUrakFvQ2lkMWF0OVErWjRlSXQ3?=
 =?utf-8?B?SWNHYlI4TGgvQUV1VmxXQSswMjZDdU11NHkwbU9xa1pKc0tsZ012NmZ6NTI2?=
 =?utf-8?B?dUgyVXNzZllFUmhzTkFNQTVCQ09FREVrUWQ1UG5oS2ZnWFRGbXlzUFZEYmc1?=
 =?utf-8?B?NjN2VzR1RHNtMGRZYmxFR0o3SkgwMy8zeHhoUko2dUwzczhDOXRWbUlURDdo?=
 =?utf-8?B?UThwNzdmRlFyK1VPUmxqMnZBVTFCTnkzSElpazFseGJyQTI0eU9VcW1iTUIv?=
 =?utf-8?B?bjAzQWM3VWJ1Q1pLM1dySzAveFhYeDFwSndpVXF4QkpDZ2Z4ODl5OG9nT3Q3?=
 =?utf-8?B?SHB1UXFRRVhSK2p5Q1VyQVA3ZVJ0T2xxYVBzNXBWTjlHdjcwbWpPWmx3VHpO?=
 =?utf-8?B?R3MvYkhCNXdJMHR6c3JrTkE5NkR2WXVhZFQySXV6TTc1NFVUaGtPbWQvdzhH?=
 =?utf-8?B?WndWQXA1Sno2ZXBaMnNYLzFpbWk3SkxVVFRSdXU4d1hHT0Y4NHI1R0lEVnU0?=
 =?utf-8?B?bEl6aG5HdmhXa2tMWDV6azhObzFuaHFpSlBndUlnaUZIQ04xUlRoaS9pKzV5?=
 =?utf-8?B?ZmgxdnhJSTN6dDNCTEdUb1Boa0hoQW9lV0Z0VzE2UDJHS1J3K1VvdUVNb2tS?=
 =?utf-8?B?VGFwdWF4VnFxUDAxTHVobTdmUEhPdGZ1SUhaSUZLWWE4U0ZGYTJYZlVxcGN6?=
 =?utf-8?B?K0JVay9ZbEowN25sdmdKQTRRZldQczBwRFlUaWFYUzByVlhVTzdwV0RkcFYr?=
 =?utf-8?B?Ymw5d1VudTJ1dWt0dlNUa00ydkNjMXhZNUNBVkF5MENHaUI0akltcG8wOUhW?=
 =?utf-8?B?bGNSMHJFSzJKS0J2TlU4T2NOTENBdkl3R3BRMFltbkVLZFdNWVlWMjMrV2h6?=
 =?utf-8?B?Q3hBbGtDOVZqZGhXRzluMS9xdm1STytmcTh2VVRvTjBUWXlSYVpLcVNURGlp?=
 =?utf-8?B?N0RTMElzakRRMU5TQVBwOWltM2d4aUNjcm5jUXZYSTk3N3dnUnVlSFZMUjRF?=
 =?utf-8?B?RTFXN3ByVzFmdklsRWxDc1ZGcEJHREdlRUVHM0pucG9iaXZsWUgxcU4rT2NT?=
 =?utf-8?B?emE0c2JCUnhiTS9PbWI3MUM2NnBDcjcyZ25jZHVQNmhoSVp4Nld1RnZmS015?=
 =?utf-8?B?T1ZlbnhnZk5ZMmFpTUtheGNtNmlFajFHVmlpWlBWZVB2N3hHN1RXN3JwekMy?=
 =?utf-8?B?VzdBSnR5SUlXWW90b3I5YjFSdGdrZkFobWx4RU0vRTdIek1FaWFHWkgycm1u?=
 =?utf-8?B?VFRXNjlFUEF6WmJJUDJES0ErallsUlRNNGNBRXZmK0FLbUpjQkJhRzU0RTlK?=
 =?utf-8?B?cU9xTmRKNkxaUWZydTc3a0dhNm5mSVNPTEhZN2VJMmh4d1cvcDFveC84bUJz?=
 =?utf-8?B?YnlkaW15YnpTTnUrY2V4MlBLREdPRjBVNExpMUhKL3A2SFVyeGZMT2liT2tl?=
 =?utf-8?B?WDJVakh4S2k4aXpPeGlYQWpNaHFYYjJrczNheVNhLzFFTkQyT2QwYkZzYUVH?=
 =?utf-8?B?ajg3Y3k1eFEvWndiK1RLNUJJUDQ5d0xjRDdaNENOVnVsL1hETXRVTFIxQUEr?=
 =?utf-8?B?RkRMNElxb1hNSFFVT0M5bndNb0tGZlBNQS9Ub3NzOWhhaTd0N0tHQ0R3L0ZW?=
 =?utf-8?B?ZEhSTXpHc1JiZmhTcDJIVjgrRUg5SVE3R1hEd045NGZLY2JxWlB4MWFmRWpH?=
 =?utf-8?B?TEhjMWt5ajJwT3poUXA3TDZUdm5BaEg4cTQzRlBhT2FsdHlvb2hTTWN2NHll?=
 =?utf-8?B?Z2hHVzhINEloSGJyanhybzZHbkI3Y3doRlBqcWl5ZnhBZ0plbk5TZEcrVHNV?=
 =?utf-8?B?RmZJNWsvUlNlZzltL1RtWXRpYm5aYUs5ekJYRE9jTnEzaTA3a1ZDM0tEQ3Yy?=
 =?utf-8?Q?1iJlUqdz79efcUJg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b500b0e0-c736-4210-2711-08df463b9df7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:49:57.8826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYxmOn9fehPk/hdaSXouDbg4EMRKQcd7CbKL3wft07mKH8zNar/20yDiBF9+p+iRh8OVzst9SLR72sTxCEefykaVchf5NxRHylQQWn06PAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5106
X-purgate-ID: tlsNG-bad1c0/1795092601-3BED6034-56658CF7/0/0
X-purgate-type: clean
X-purgate-size: 757
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 12:18 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> @@ -136,6 +136,6 @@ struct vlapic *vlapic_lowest_prio(
>  
>  bool vlapic_match_dest(
>      const struct vlapic *target, const struct vlapic *source,
> -    int short_hand, uint32_t dest, bool dest_mode);
> +    unsigned int short_hand, uint32_t dest, bool dest_mode, unsigned int dm);
>  

Even before this change, I was thinking that 3 fragments of ICR were too
many parameters to be passing, especially as some are bits as per their
ICR position, but dest_mode is shifted down to bit 0.

I think passing a real ICR pair will be an improvement both for
legibility and for code generation.

~Andrew

