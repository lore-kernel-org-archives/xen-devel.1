Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B80CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:51:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441387.1658969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2lf-0008Vi-7b; Tue, 06 Oct 2026 10:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441387.1658969; Tue, 06 Oct 2026 10:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2lf-0008Vb-4q; Tue, 06 Oct 2026 10:51:31 +0000
Received: by outflank-mailman (input) for mailman id 1441387;
 Tue, 06 Oct 2026 10:51:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xE2le-0008VV-LC
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:51:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2le-00GI5k-1i
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:51:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac4d2b1-bab6-0a2a0a5309dd-0a2a450ab894-4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:51:29 +0200
Received: from [52.101.43.69]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac4d2af-f2d2-0a2a450a0019-34652b454cb2-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:51:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB447892.namprd03.prod.outlook.com (2603:10b6:408:3d3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 10:51:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.020; Tue, 6 Oct 2026
 10:51:25 +0000
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
 b=Jt/chI7Xiq788PcGimyU3Vt8CNk+ZxMfTk9GVjHDxCv0kUKAiVA9hKZD9MMzs2Ory1vyZwJ5r+2eD+VRWrRon7qXY8wBbbIPE5foyI1lu1rzqlqwqtD9LKKMHlvJxp7FVEr6McFprvWTl1SpG/jvaKiYWC0HLucyGDp+/E5CK1p1vf2ioLydt95tFwMcnG0bJtcSQBJbTXBoTHFf/2RPinQ6nLrDFUJ1eZOWVoTYi/n0rJ1ekJ6RnLfBLzYj1oxPOcRfVo7oBMSVZvqMzLBameLTwN6/v2RSNju4839okB3wn1k7EQuEaJmyH5vuW3b84IYDmiV75JD4tTcX9JRmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dWqNSma8FZJKABlRBBfTjCLx5mnlYL8ohScDbOQCio=;
 b=A/jOZAXSmnoghDuGcSSTcEmE3tNJQrP9CYb1vMsANqTUleLJFzHx3MPH7M19tLsa4MeMAwD/v2FVRdu7nyQkX3OBoO+AuFV+XzKl2SU0SY3Xv0lNjBRipaTCyV5Pjok9T+NWZ3Ll0Zn7RlVn4Xm/ccO6wnvzuWEUHFzQLgMFPNrA6ZkbxCRGKSHcniuhm3zyBKppEkdle0RNhDqypzHPwGTRRNQPEH4HSaG0iBLe4MA/aSvN4E0CA6EdnTg+aF2R9hiQuQqv6FKwLHkovLSt1TZy9D/0dn9x+RYf9wIDqpTSXYag/B2sQ+3HA1KwFQHlb0gaA5eHghRO5+qasXAtjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dWqNSma8FZJKABlRBBfTjCLx5mnlYL8ohScDbOQCio=;
 b=lHsjMbqBaSsZhU02PzqH2UP8V5mY4ksrVeA7Ak+EXp+yKEeqZkhpYKbhhrzZlq+N9ceKN5xBKDPW0Jmg7Ofi/KCCefaKURAuPa6yu98LgP3yZQflhc/7CcEe8+XDX5Xdt58lwsYRz4xoWQeXzGBrdbWjhQprPJvebfZANo0MPcY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d66c1a89-b448-45d1-b17f-ef63a34acc8b@citrix.com>
Date: Tue, 6 Oct 2026 11:51:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
 <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB447892:EE_
X-MS-Office365-Filtering-Correlation-Id: b0acc403-7f63-4fc0-43a2-08df2397c445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Kn0an8mVWgKrbyGXaB/gHIsJGdAhPUPhGTubG7UrfMx+93WxBj2bxq50vGdRH5lzJbIL+myLOSXUqK2ZVC8Q1CJJKSD5c8EzYLJFFT9QSyvuH1ONJyu8Hrc53YZlybZruT0kqed4r3xR0gXq4DLjnqU8a9ycAry3AoBUBOYbzwX7kba6UgPnK8rp6cJe+DtDe+6CWwJnIyV7Cl7ZjK2vSDitq1pDUT26Lnd8EvhSmWfES6BjOZo9m21UX3lsd9Z/Eb4l+Y8ybu9UJZJqkajZAxV1Gtnh9wN2UWkVr6wbZWFGtbGRKCiTGGbQaDeKT/zyj/H4yncDs2vWOzDgrfKiai0bLR24QGZxKYH1brmXt6UUiC7WdkK6CZnYsV9L7S3+Pp+zvyj/8WrczAi5IBwTN5sLwyxKdUnbEvg03PC3hR0gRkRkJrLypZLK1IF9erLJ1UKUICokYHjfzOCXKVRpKty89qubJMeXjMyGYWYBh51j4MkXszziRBUKigrKISHFadlguNjDg0XJM0TbKeMQPslCYff9lBQklBhq1XMnzeWD+A7WcFYWrsp7zcNAAdP8Q0L+5Q0sqTvAxG3p0CfCteQR4UEcQlpSgGvms+IsC6Xuj1OT2i9GVmFQC2QtVvSdvCz0rMAdQiwAe3PDlWNP59rRkGPjJdrREfx3ExZt2HI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1dOUXFpRFM0U0ptZkRScDVPTnQzQzJHUDExWGJNMVY0WGk5SHAyanhicEFS?=
 =?utf-8?B?Rm9XNmZqZmVyVGczdElmb0x5ck9zYTVQaDZTRWdaZnF2Q2RadE1yVlh6TzF3?=
 =?utf-8?B?TnpDM0dMaDJVNzZHQm5CdGJJRGltaklKQ0tUY0Yvby9iOUluVGQrcWFVK1l6?=
 =?utf-8?B?a1BUTTBsV2ZMU0dSS2F6a3VwTDA1ZWx1d2pBK2kwWVpqYlpqVHZaU3JkTGFC?=
 =?utf-8?B?YjJlOGhKV2lJaUxwT1MrYy9BOTdUa0VZb29YeG5QR2tVYzRnWFJLWDR3YlBj?=
 =?utf-8?B?Um0ydlNJNWVoK0RTbjdRSmJhbUpJK2JrWEhxN0tHd0dySVhhaSt5aWFvN2k5?=
 =?utf-8?B?YjFSam45UmhLdGpQTHBibGZkYW9LS3Y4YWRMOVA5QzYrblBVRWM2dkt5UVlH?=
 =?utf-8?B?Q2toUHB4dm00NkEvVGZYSFJUK0VCR1pmbmJyZjRhaitBK3RwUnpNc3Jhb1Z3?=
 =?utf-8?B?ZXg4ZTdhV29hUVA4Q3daSUU3TmRjTlZ6Q0ZvWTNxc0p2RnRZcWRTU1grQ3lC?=
 =?utf-8?B?ZVJldVRuZEQ2OWQ4T21lVkkxdnRyaWdnUFQrVTNjU3BUUFVwL1RPS0Zac29X?=
 =?utf-8?B?TE5CNDNyOUlEWW9UMU92OFRuRFBsbmthKzhsVnYraElsK1d5YkUyMUpzSnB0?=
 =?utf-8?B?OU5DU0tsTmhmMGRaaXVpWC9NSGtYNEQ5ZGl0U3ovN2J4REtMZmozejB1b1VK?=
 =?utf-8?B?M1lrY2s4NzRML0RLcDFaV1I0SEFrZHQ3SExHTjRSVmdFa0s3eW8xOXlEQStT?=
 =?utf-8?B?Zk5pSXhpejM2WUtLZzVTdldNV3JoR29PU05MdDNCTFZSWXhMcEI1NXU5TXBo?=
 =?utf-8?B?RlJOVnZVMkNHcGRmdWxsRHgvUXI4WWhEdi9HV0JmWE5RNlRVdDhPNEUwRSs4?=
 =?utf-8?B?UFF3RTNjK0lTQkZmTm1pdTV0dGtQeFA3bmJrcnY0dmwyYVBSVG04Rk10Y1Rt?=
 =?utf-8?B?YXUydGdIN2c3ZlR0U3pIVmo4RkVrRlcybWk3aHVKbms1WC80Uk5hQjFRVjdn?=
 =?utf-8?B?SnordEpuQUlocWJLUE1KalRpU1hvZmh0MkFWSVRZRzBvOEx3WEwyekRoNEpV?=
 =?utf-8?B?bGNiSTNLSWl0UmxTWUdycXlRdGNIUDY0NWY4OFBKWkpSdUNtanJjclR1NEJ6?=
 =?utf-8?B?WTFYa1pGTmlJa1drVVFqU2d6Kzgxa0tXMHdBQzF1Y3VlNkxYWVVSbVo5M0Nv?=
 =?utf-8?B?TkFndjh4eWpvRng3UVZjVDRsYUVPM0tTbGU2ckcrUGlYNDZXQWlIQUxwUlpN?=
 =?utf-8?B?NUhRWmpjSC9yL1VNNSttNWlKZ0N3VlAxYXR6cHN6bzZpbTZaMm5oSVdhbUdv?=
 =?utf-8?B?aEUzWlFQRG5NVnNJeXdXV2F4eXR3bThDSGdxMUVkU2RSWFI1N1I0Z21TNG8x?=
 =?utf-8?B?WUxORlFzbXFwVW5pTzVnazViWC9MV0Y1N1JKTFd4VDVSRjFKdmxIZ3Y3MDRy?=
 =?utf-8?B?VVJjRndiaG9nTnd5Q0hUQ25wWUloTkRlanYxbUFMVEZPY1E2b0ZGREwrSWJI?=
 =?utf-8?B?N1RNVk03UTh4aXpjY0ZzMktQb1dhUDlwNC9wYzFXbXk3UDhxdDI0N3lkcTMw?=
 =?utf-8?B?QytHQm1UQTdjaHFPQ2QrdjBqSFJ2Yy9sNXNSdDk5aTgxenRVeHdpUnlpNXhy?=
 =?utf-8?B?TmxIKzlPRzVUNmVLbnhKSENNbXZwZzV6dnROOEJwME1jMisrK2x1S25sNzU1?=
 =?utf-8?B?d2tod3B0ZWs2WS9ES0ltcWw1cnkxa1dWVWJaTFQreG9iZCtNSzJsOUdWWXlm?=
 =?utf-8?B?UFkyV2pIZFF4SmVndGY5d2kwMEFjZHJmOXhKbHlBQ3BmWkZKdGpyVWFqdGVC?=
 =?utf-8?B?ODdtSXptQVpSUGZmdDJVNmhia3hldTAvcXRzeE9OS05PV1l0VTVyOUhuazNj?=
 =?utf-8?B?RGoxUEpUYWIrSUord1ErRk1QYVIxRW1sdFAvcGxCUVUxRjA1VzFjU1RtNWo0?=
 =?utf-8?B?M2JBajZIelVNa2Qya0IxUERrYTFXQ0JBSTlPM1BQSkRMbnVVSVVDWXV5NnBF?=
 =?utf-8?B?SzZPTHBEWjhBdWVucnAwZ2JKK1h5WW5PYWZSWGs0SVZDaWZkcExQS0FhbjM4?=
 =?utf-8?B?MGQ3SS9ZMXlCd05pbG1MbDdJM2NEMkJRVFJ4Y2ZNNzNlUlNtcTA5bnpiakJQ?=
 =?utf-8?B?Nnh4NXFRNmpjYjhsZXRJNS8rNzNsVEJMYmpaWkI1OCtTWFJYaHRoWXE0b0p4?=
 =?utf-8?B?ZVJJdnk2WWNaeDZ6ZElwTGNxb2lpRWs0SXNjTjFOY0JwV3RyM1R5K0FhRkZz?=
 =?utf-8?B?Qkw0cTZTdmNmZUIrVG9rMkJHTjFaemhqV3p3VGtaQVpLMmxJNWZodjl4akll?=
 =?utf-8?B?am1hMWVPdVZUNERxQ1kvZjhLeDVjVmlXZ3VYRFhtQUJmdWhDZFdYQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0acc403-7f63-4fc0-43a2-08df2397c445
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:51:25.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y29CTK/VEx8+gQXyzQsVIGgxgCprefZODdxSYB8z1wfO0d9y59wqw82wvQuaw5gXzrMN7T46mSTBUxbmG6FP+eKRqUX+7Q1sWdX6v8KhR3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB447892
X-purgate-ID: tlsNG-4011c0/1791283889-587CACFC-88AE1868/0/0
X-purgate-type: clean
X-purgate-size: 745

On 06/10/2026 11:45 am, Orzel, Michal wrote:
>
> On 06-Oct-26 12:31, Alejandro Vallejo wrote:
>> While today they don't implement fencing in a way that would block
>> speculation, once/if they do they'll absolutely need to be inlined, even
>> if -fno-inline or -fno-early-inlining are passed.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> but this should be done for Arm, RISCV and PPC at once in which case you can
> keep my tag for v2 # for Arm.

I previously had a patch series which made this all common, for these
kinds of reasons.

I think I'd prefer to kick that over the line, than to keep on taking
micro-bugfixes like this.

~Andrew

