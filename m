Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A500606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=a8HJrs3Z
Received: from list by lists.xenproject.org with outflank-mailman.1494566.1694025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTfqg-0003Gp-Er; Wed, 18 Nov 2026 13:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494566.1694025; Wed, 18 Nov 2026 13:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTfqg-0003Gi-Bk; Wed, 18 Nov 2026 13:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1494566;
 Wed, 18 Nov 2026 13:37:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTfqf-0003Gc-MM
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 13:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTfqe-002T27-Mo
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:37:16 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afda9ff-2eae-0a2a0a5409dd-0a2a4503baec-46
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 14:37:16 +0100
Received: from [40.107.159.126]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afdaa0c-fae8-0a2a45030019-286b9f7ee8b3-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 14:37:16 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB7782.eurprd03.prod.outlook.com (2603:10a6:20b:345::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 13:37:14 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Wed, 18 Nov 2026
 13:37:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4FCyMLEnTxnoXdK2TQnjqqOVPXIfpvnvT3QEKFDgHeVSs5vT3mJfTWwR0aLoL2iqVYzxSD311OVPVnNPHzzSHwbOExw2DkOTRzQhp1XqDZ96Z2Ydvaya5DZgcnh/k03faM4gFA7NWdrpAAojXEMd7rteGCz5Nql2fOOd38DJcR6juUCBbPOwtAQkdzwOEXpVXkLQmXtGSOv3619gYnXHnqqMQTGjyKW9akR8g72xyZ3TqdfUAZeWnkD3d45dY5PR0r4/HGvLQoVC5RBlMMXCafaJcUq23SCTA9stfUQy1X9nP0SGTjsFpp1XId/rEgNXRKjuHWD/fC7iukrYjm7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UOspVItX6hnOTH+ycJoyjfNmWfrROiwkirRsmfw7Z0=;
 b=RYXY6TSaQr+vgMGsAUZACx6xV0BKXhGOj/ajQtngTAYlDZ/q/KAsr5QmifIZDoeZknZEh/KiwmIU6GRsz4GKmCvhSlyVj5tCtt+XH1kNJAYK1CQGF/1ooKN6WvHVwE230UHnitSmKW3SdBuqsVJFxrYxvzCi7DnJIWZbIdOgnoRFSGDEv0vOq1wFuT7x9KatWodiGK65rMH9rl5/f6COmwXoh4gJ34ntrSFI6jzx8STi+X1yVbrkBFkmKypjQpkzNdOq0DrAa0XXO+wYsxxuSwxGPZUaVIHE64W8wl4JwTOffdSi0apDGI/oUliDy4qPMIcPXlv/mKZziEjuySj0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UOspVItX6hnOTH+ycJoyjfNmWfrROiwkirRsmfw7Z0=;
 b=a8HJrs3ZogskL4CXcOuVXKyk5Vec/KS1PKunkD/CMUzKQkQVujG2j6mukSRUyTjZxU0SXaYK9AcmcWGiAkRFpXZoW24O8p3whAX+mixm4VoHn2IAJFoxgtPQgvrPeP2owhDTcRt7uRy++5QW59GBSrI2tnKP6apdyTFBljFzc33w7LHoc3B3nkZR67vj598OLGdNa13vC+waB+VU4JLsPiPkE8ZVHS47SsvHEFYTg4E1Ek/RrD99v4dzF7OT0gXNRVKygQf6Bb2qPvXtIESr9jIdT3YSLF14Q8Jq48zwnmdS+d055n95tvQDz77LBkPqdrfc96CaGhwxSPT8f/BSNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6634501a-e9aa-47fd-8fc7-d75c9a44ebc4@epam.com>
Date: Wed, 18 Nov 2026 15:37:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b263f174-e5c7-4e99-993c-9a66d20cefa5@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <b263f174-e5c7-4e99-993c-9a66d20cefa5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|AS8PR03MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e26afd1-2bfd-46ee-2a33-08df45790e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261022075727099003|261022115727099003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QKSykFgTQOommE3PDM+Nu31gm8OPKp9IvulIp98R3CJhmxgowqSCjlvscAaC2pt+7KSmTOfVIkHvrb3LrEJW5P+JIBBFgCPO27MJEl/gnr9JUjAjLsenad+Uv3Dq3MUm+iUVDFv2p6fZyLiAnztLdAHKhW7moFRGn/52HLzCd9GoVVdh62m5vPVRtG1gAIW8e6NqRuYnvzRPkSRUOVdbLSBZ1+87kZ3uxq5m35+pp7c1v6X+93Y9K5zJHQKyz2fSeRaJ539SS8o4cXRVN7v6mI39racFBoMByT+OV2PINv/EWvGDdwGLbEa5aG42+/VvRMTQBk4IIhHY1s1Qc+MM9s52CsfIScc4TU7WBSbYypAbHCD0dwrBzscjSaDOiWfJei1Q33be80Fw2Q3Onz1Rls9Dnjd8pRKlUIzq2DrWJfQkOwwWX/N2u3zxYE9j0Yo1iPyVp2qeF16hFUCRu1AtAo3RV3bcvfDUaVbHjWvitcX+xl5SlK7IUAPZe60/PZExtkuetmvO3e0gKEg3xP7btGlkk0BO7sQzSxC0Z4j/MK9/utJXKBW1angCmH/BlQVEFejK3untkgyYdaz6zh/Q4kCzwdCXJ6g+rWl7GBKOcRciFY+y0GCEvfcedr63xaFnJ1nbbJCTR6BWwLQALNsg7zSyIk7XsDIu7CmmNpSOR/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261022075727099003)(261022115727099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWNwdFIwcW4vR09wTHlXcjVkVHNmWHhleFZGWCt1dVk1Mkl6UWRVSWxJb3hI?=
 =?utf-8?B?TDZnWjh5UmRDTE1nVFhrWENUZ0hXcGhCSy93SkxlUGsyMVQ3UXVIREgzMmhk?=
 =?utf-8?B?TEpQVkRuUnY2dzc3akFkbmNSWmg4eFRHNnRsdGRhUGhuUVFPbUdsWHRMZnMr?=
 =?utf-8?B?TERFckdIVlBuZ3AzME5wVDRiZ1o1clJlaWg1VC95OXFkWldXUVdtQUFoR3R4?=
 =?utf-8?B?SXdqQ3hKdFk5K0VPWGExRWZZb3VqQnpKSG53bmhiS2FsL0RkbFFuaG5CNjA4?=
 =?utf-8?B?OGFreXhmQ2dvUUtSaUJlcVdxMmRnWUppR2haYVJVR3JHeVZwU2NCb211T2Jt?=
 =?utf-8?B?cW1Sc3JBSmdBU0tUam9OSW5BbmdvYXlkTU9CMXNlYXR1dEp4aVFtaWE1Zkhp?=
 =?utf-8?B?bHMzOFNmeHRTSXdJbXl0M2JyeGtiVllnZTJNU05laDlMVFdsd2c3WlRyMTRh?=
 =?utf-8?B?T1M2UFJwWk9mbCtkU3RPNzRrbUdnVkJvTjlZbEJNU05xZUwwRHptMTBoNzA2?=
 =?utf-8?B?MW9DMjFxbzFrOXBhaXY1NGFnQkE1NlpUc0p4OWE1Ti9uRmVWblJSZGhFbFFl?=
 =?utf-8?B?RXZRd2tYNGdubVJJL2l5WDloNVdFY2hJaVFvSWRGbnd1Qk9DanV4Q255SnFq?=
 =?utf-8?B?QU9LVDJVZUNxdGVsbitOMDh5aWVxZDVXYlpZdkdDZEJ3RThrQ3NDZjZoNm1M?=
 =?utf-8?B?QzZwL2xNVkF3L2grU01idW5FZDAzYWQwdGNGOUFTOGRYUmZmZ2Uvd2d5Q2Rw?=
 =?utf-8?B?UUE5QkNYRGxXSDMrZnZ2S2pNaGJwUVNDU1A1d2dHZDd2RlR4SE4vMk1tWmdW?=
 =?utf-8?B?R2NwTmZab0srMG9Bc2lrMkZLbGtUdktkZUc4dHhwanNBWEpQRlhlaTJJY3Mz?=
 =?utf-8?B?K2VRVTJCMHZsSUtBRVRncmJKVHQzT0FsSnQ0cG5Ba3AzZlJrZEoxRzJRR2Nn?=
 =?utf-8?B?bzhQNVhUbG5PTkFVd0pWTWkwZkhIMDY0cUZhdE82Y3ZQN3p5K2pFUjczRFYy?=
 =?utf-8?B?eUc0ckhlazBEZ2JZTEhwL21MZ1VRYTZFNUZOVVNtWHdZNGNMMVpJeGlrRkdt?=
 =?utf-8?B?MVVNVHIrTDlaSjdWMmdZYzBFRGprSWlXZit6V3Nlblg4L3JZMFJBRWtwT052?=
 =?utf-8?B?ZGtMMXVTNTA2SlBvL3hVdnF4WmgvcVRpdklEQnN3WlZHYUNMazd3djVEUUU3?=
 =?utf-8?B?SnRpeExwUUExdHBBbEZ0aGR3Mk02Rk5jbUxmclliMlE4ZmMwVFZqOEFheWRL?=
 =?utf-8?B?RmtZbC9kK0NqeTJmdkZMR01RRVBiUzZZcG1JQlgxd0pTclpPam1JM3RGM3Fh?=
 =?utf-8?B?REJVWTNOY3N1ZFYxNUEwb2JqaDNQU2VIOFNXUTF0dXpscEEwL3BZbjJGYU1i?=
 =?utf-8?B?eUZpTjlLOG56Y1ZILy9yZ0pQK0JEdkNpZmZ4TTZJU1o3ZDVSdmQyaXB5TVRk?=
 =?utf-8?B?Rk44YTZ1cFJXNnBQamtWMjVLQThYQzNXd2xTZ0hGN0VuRm53cmdiRWYwZDhk?=
 =?utf-8?B?Qk40dEptM2tGTzBsRy90dnZMOUM4dGVQTjFPYitQQmh4bFlEWit0SjFDcGtw?=
 =?utf-8?B?UGl0MWJNTC9EUTlJZFFUWGZVaW1Hd3A3a1p2OE40QlVmRUhhVTNtOXVyZ3A2?=
 =?utf-8?B?RjBGNGJqdTcyTVRieU1WVk5QZEZXMHJVdmlwRHg4MFNKY2ZOQlRCdjdCbnJU?=
 =?utf-8?B?dFdtYjYvaGlUUG5mWS9COW80VE11bWkvTVpJcGdUbGJId1ZMY0cyZ29qSDUv?=
 =?utf-8?B?WkdtbjB4RlY4VVZ0VWwzTUY0amVDbGp4UkVsUG5pYnZycExFSnEvM2tCOHZo?=
 =?utf-8?B?Qy9QdlAwQ09mV2E2SEdma1ZmRHVYTm5LTW9KRDd4THVSS21XSjVuK1R3SUlL?=
 =?utf-8?B?ZWo2aVdNV0s0KzhCYzBPTVJFUnhXb1lrUEdZcGI2SjRaQmFFR0ZlcjVBTDUw?=
 =?utf-8?B?Y3U5YndIL2pwdVMzYVgwMkphZnJhM3hwdEwzdDYvSitLbjhBckRtd052Q3JZ?=
 =?utf-8?B?WW1xMXF5NllIR0hGR2VZcXlRTlJqVzdSZThHODhVWVRtQlcxaC9XREthWHpF?=
 =?utf-8?B?dW9WSmlxdFF3MzMyMnluZHNqMTltL0NKRnhwOHNqNHZJblZ2VGV0WEU1dXJS?=
 =?utf-8?B?VnpEYVhvOUI4dmJsbHlBS2FmMkhDOE1OUWxybGxNdTZlbWxlb2VHQ0draVRl?=
 =?utf-8?B?K1hhMFdQTGRndTNTdVlMYXhBQmsxOWk2S2V6azAvUlNtVnF4Mm5PLy80d0ZT?=
 =?utf-8?B?Y3hBZWRqNjZoaEs4WWtjRWpsSXJYNjhJWVdYSGVnR21VYzNsSzkyWnZnWkc2?=
 =?utf-8?B?VFZYK1A3UWtGMWtiQmZJRXJITVU2aUI5MUhSNDI5ZVFYQzN0S01aZGJWVjMw?=
 =?utf-8?Q?VG+NYC/kxscOcu6Y=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e26afd1-2bfd-46ee-2a33-08df45790e34
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:37:14.2737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+hr2qQvPllFPkKijZou2HXYfbypoA63nJT9f/o2fBb5XPho0FdaoLG0W9x1t0t6rrDm9aPd1UoFCpztMjoBOtklHeeqf9pFYGkesNcvFto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7782
X-purgate-ID: tlsNG-33051d/1795009036-75EFF4E9-EA859CD6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1677
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 10:24, Jan Beulich wrote:
> Not doing so results in a number of Misra rule 11.8 (casting away of
> const-ness) violations. We need to allow kexec to use pointer to non-
> const though, so provide a means to override the default.
> 
> For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
> incoming pointer.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Use ELFNOTE_NO_CONST as the external control identifier.

Reviewed-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

> 
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -6,6 +6,9 @@
>    * - Magnus Damm <magnus@valinux.co.jp>
>    */
>   
> +/* We're producing ELF notes here. */
> +#define ELFNOTE_NO_CONST
> +
>   #include <xen/acpi.h>
>   #include <xen/console.h>
>   #include <xen/cpu.h>
> --- a/xen/include/xen/elf.h
> +++ b/xen/include/xen/elf.h
> @@ -29,9 +29,16 @@
>   
>   #include <xen/elfstructs.h>
>   
> +#ifndef ELFNOTE_NO_CONST
> +#define ELFNOTE_CONST const
> +#else
> +#define ELFNOTE_CONST
> +#endif
> +
>   #define ELFNOTE_ALIGN(_n_) (((_n_)+3)&~3)
> -#define ELFNOTE_NAME(_n_) ((char*)(_n_) + sizeof(*(_n_)))
> +#define ELFNOTE_NAME(_n_) ((ELFNOTE_CONST char *)(_n_) + sizeof(*(_n_)))
>   #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
> -#define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIGN((_n_)->descsz)))
> +#define ELFNOTE_NEXT(_n_) ((typeof(_n_))(ELFNOTE_DESC(_n_) + \
> +                                         ELFNOTE_ALIGN((_n_)->descsz)))
>   
>   #endif /* __XEN_ELF_H__ */

BR, Dmytro.

