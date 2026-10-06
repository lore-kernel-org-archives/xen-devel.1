Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA43CA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 13:50:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441511.1659106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE5Yp-0008IV-24; Tue, 06 Oct 2026 13:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441511.1659106; Tue, 06 Oct 2026 13:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE5Yo-0008IO-VN; Tue, 06 Oct 2026 13:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1441511;
 Tue, 06 Oct 2026 13:50:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Roger.Pau@amd.com>) id 1xE5Yn-0008II-7i
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:50:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE5Ym-00573v-H8
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:50:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Roger.Pau@amd.com>)
 id 6ac4fc89-2eae-0a2a0a5409dd-0a2a4505c62e-38
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 15:50:24 +0200
Received: from [40.93.194.7]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Roger.Pau@amd.com>)
 id 6ac4fc9e-4cb1-0a2a45050019-285dc207096e-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 15:50:23 +0200
Received: from SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 6 Oct
 2026 13:50:19 +0000
Received: from SA3PR12MB7784.namprd12.prod.outlook.com
 ([fe80::bcb5:6549:d82d:1870]) by SA3PR12MB7784.namprd12.prod.outlook.com
 ([fe80::bcb5:6549:d82d:1870%5]) with mapi id 15.21.0451.026; Tue, 6 Oct 2026
 13:50:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWKC9gBRsUn8hMxW1tpc0YDkwbNEDuF2fAhMo/AHram75tHkwpiCinhJWA9Er4n5Y9FAQIkfxpdU4RLhxUa2Ih/4+1sw5RQhSMufz5Iig0o1dDhZxarIuudfNn++MqGuCK0OCcgkHHGd69CQPrCSCjbm4S2BRd1q0SMKy1J0BWL4EgfkMXm44no19U7bHIcpfQEHJwlFutiz3yQi99Ypo/CK/rVnktEiR0CYWf/TmoJp1zBYQDDdF6vdB1AAaseIs6plXlEmOsXHMuH5WNrWwciYLzESLrFGUmnvvbjxGAG3+FJbNFHuQBR0J/FC3eG6PII+GkTAk5akoE1/GodRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmC3Tqk8i2AEAulvzFKpPrk94evSxtynLJIc5VGWLsE=;
 b=H/Ksx+r1i/T4z4q45WfsmE0476AoX4E70KXDHDNVFIFlbLI5jtKbY345Pb1KFETnXStvZ1vrmMnsPb2xwun+KQR8KUrPvx/Mm0lRveW3Ado3zuydCMbo7ZIkxx0iUHt4TXrwNjRgPrgJL4iXFoHpkzJYhfTM7miHQdLisvUEIS65p5WOVnJPRFPc4doVd29iZMKAam0w1b3K0jyhdQm1lQezX/q3bpTPNmBbObtJLliUb1sJCXfNLwuIKxvRd7QTVBbI1OsPiRSeIZzKotFfCuGUvN0/jskgDNbPWhG0Zd31xS7p57rWFYGLjE6VRxfsSKpHx52OQCIiSAjm4pmiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmC3Tqk8i2AEAulvzFKpPrk94evSxtynLJIc5VGWLsE=;
 b=3bTS9596prU3O99Li7euCGkEkgkoC4at/ugIoh2m6zNzYJ4u01likcHF90Z3w2CVgqlT1ZKZzVYl7T3wgfvjsqfVX99ayZYee5+YiqTSlPhLPzmHbLypu4Pusri1lh3xrCwDy3b8Rudr2iXIJUT6rMJmNBHdVJTPUKGcZIlqdHA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 6 Oct 2026 15:50:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
Message-ID: <asT8lQktOeLhcva3@Mac.lan>
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA3P292CA0044.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::9) To SA3PR12MB7784.namprd12.prod.outlook.com
 (2603:10b6:806:317::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7784:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fbd3a2-c46b-44db-b36c-08df23b0c08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fftjt7xRuNqiOw88D4DMhlke8/7IAeH4367ClNa15XmJU8oQm/+wT+n3i0dIm4n7YzGKJkKRkm8F5yXeCZuQFTBBcxRMtGixp3shc9qYZsk7PBj7jyz4x//yxiDu5h96gGcvGWzNjVWZSm+GIkyPSFShXeoxcZFkrfNzkFU254Kh0Fnrr9Zw0qK+VNjXy/OuzK/80xsqjAIG8S1wt2p6FSN3ii+jR4mudKRab4K3AKWKLWzbiOkvujc5IxI1xCEdDczpFnwFn+Mdv8mMpygWgiDEU5iVxjI7bg1+EMWe/CVw+ZZhQkiFk4rJpYqyvmUKRY6aQINT6T8jPRIooMq46HcpxdcLlVERn/JlfFGw9qjcUWDOgKDbWsRC9PRdLCDK73zJlV9rB6WM+oCS+7MGQynt6ZQ3S8MevOZLobCX11BiawhC++KpTjMzk428LKYGnRsIjbERdd6NJxQlN1kRIb2ts89LHCKEkJbBu+nybTr46OZDTZQzIHXFZ9IgAJtjyhae4fSWwxHF//mxMUEft37U0M/jnS1Na8JAiQ6KsJ7H6Hmjw5yxfJhOljSoOL6XMuAE326zoTaPuTT9GZPEBkyJnDk6CdnMtTR7aIK2ROTSOltq4Dr02cIz4EHAeC7/s7DNr5AzXFExWOJtE8/+3+K5GNhLAxCDe/aUDco6BMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0s4RFBCK2FWNlZxSUovU1l1b3AzQjFueG90NmVNTmNZK2crcEZNbmJpa0Vi?=
 =?utf-8?B?MFVxSGV5dUZkY2c1Y0o1bHVYNkRpRlVkUGNPRVJpMlV5UVpZRXBXSWtzTVJ3?=
 =?utf-8?B?YkNoL2VSQjNHVEhaK3V6eitvZDdJOXVnclJVRTUwVDFZMnhwcWM4N2Z2SXBG?=
 =?utf-8?B?Mm51bk0wV01zaVBKMml5RGp5cmMzVlJjeEpQWnQ2YTUwbk41MExlZmhzVEVY?=
 =?utf-8?B?TG5iak80bFllZlFJb2tKMEFYMlM0RXkwaGd1UThMb1FYZnZXcndqaWhjMlFs?=
 =?utf-8?B?MjYrcm5leFFua2l2R3VGcEVVNkZPZnJmOWtoS3NTUEZRV1JxWXRhUXpYYXhZ?=
 =?utf-8?B?YzdBalkralZydmdqZlZSbmlZNXliSXMyN1NYY1JpNDh1dVl6ZVk3c09sQmNk?=
 =?utf-8?B?UDJnR2lDUUI4Z09uK29zaVNKc3BGMWRTWCtNeGNtT2M2NlFIc0VnRXhWUUJx?=
 =?utf-8?B?dTdDSDMxd2dTV3YzVU9tQ29HQ212RGpXWXkrZWpVWTg5dENVaG1nMWEyWEtF?=
 =?utf-8?B?Y0llZTZQbEFWSSs5N3NZcXJjanFEWGUyZjhDa1NBZzJ6RTB0aW1mclkwMVFH?=
 =?utf-8?B?U01IUmNiYmFVd0JteVJtcnZBWDlvQVZhMGtZSldOU1p2RXU0NVptS0pDSys4?=
 =?utf-8?B?UFZUa0ZGWHplenJCa1llMHhnaEdweGYya1NKTmJWbkpMS3FVNjY0b05rUUp2?=
 =?utf-8?B?RFdiOHIvdms2YzhzaitjNmJlRVVDcXlTa0UwbE1zeTlPNXhDeklaREIybjJQ?=
 =?utf-8?B?d1h3RHFRa1IzUE4rTXNHdXA0azhIQ1JIVkNjdUxJYjdrZk5zYUFSbk1wTEJN?=
 =?utf-8?B?OUM4d052cmQzaXhYcjBLL2hSMmlhVnRCeFA2S2l4aTdQMDFkQVlHYkUyY21i?=
 =?utf-8?B?ckFXNFhwSW1mR3lGb2s1MzZ0YU1nWnR0clA1MVQ1YU5RaDZ0bXZLWjNrTHlP?=
 =?utf-8?B?ZnkycU80d3JRNVA5UzNWbElkZlA2cktxdFlzUGNJSWNXZ2JNN1RTWmk0MVJ4?=
 =?utf-8?B?Vi9teEVUUWZkV2JZNHJBRVJIbUVGS3FnQkJqQktoOUFoU1JzeTFpNlVFTHBH?=
 =?utf-8?B?Z09OZDhBL21ZYmUrdXp2VlVySkU0Q29YL09MZVgrQjg4OGp2VTVaYlljNy9C?=
 =?utf-8?B?Zm8vVjdib2JwU3g1d2tRR0cvS0xRVGhiWXg2YjdLaWk1TXYvdUlxYzN2cnFI?=
 =?utf-8?B?TzBUL2pmMmI2YjRNTEZmN29yMWR6c2NpNXEyODlIZ0NtS1NLTDRDRHlwbXhS?=
 =?utf-8?B?NlpZdFRmcTJhbm9nRjAwS0dzL3oyYnNuZWhsS2hhblIyUXM1UXJlRExlWVBF?=
 =?utf-8?B?ZFJsbWk3a1FnZDBuU3hnRjB3akNuZDR6eE5xVGJ2Vmlpa3JWL0s5Z3I0SkNy?=
 =?utf-8?B?amV5ZWd5RTB3VUFyU2xkVjFOV25lR1BERUJNTFJpVE92djFKeGhkQ0l6aDE1?=
 =?utf-8?B?SFM3dG1TeGFzQ3ZvN2ptbDU5RGtQS2JJUmtYTWlUQWRBajZlb0E2MDh6VkV1?=
 =?utf-8?B?MkNMQ0pIU3F3NFdJbDcxV2tBamJPS2FRUE1hRHdVSWJ5V3hST01WdWN0MEV1?=
 =?utf-8?B?OVN6SHVUUWpBcDB4Y1QvTXY4ZEdBVWxZSUtqdVhXREk4Mlk3a3k0Y2dJU2k2?=
 =?utf-8?B?WTRScVA0QzdYZEFacThUWENxS0x2NkR4bUcydmwrSS9rZTlXRDB0bksrNG5N?=
 =?utf-8?B?QnJaQ0paZUg3MVpKeDJXbFN2SHhucVlaSTNNdnJkL2cxdk9xRkV5enJ3QUV3?=
 =?utf-8?B?R2d5Sk8wVUhDOU13Tk1QWmlVaDVHYkZkMlBEWWhYdWV4QTU4UVRXZS9nR0dJ?=
 =?utf-8?B?M2phNXE0WCs1cnlSZnFET1hiSUdrdHdZQnpKdzcxUTdnQk5jblArUXFGUTg2?=
 =?utf-8?B?cDJsZ2wrazF4KzJ1YnJPYnB1blM2cWNxVWxBa1MvQ3pUb0R1UDlHb2x3NWhU?=
 =?utf-8?B?REU5dEVrMVd1dTJPNjFCSnhuTDdxUUNJdEs2S0VycVoyWWsrUFRvUlA2M290?=
 =?utf-8?B?WFY1WHNHbUJCZWFlMXZvNzZOZHJOVEhVSk93M3hTb0Q2Q3EyZHBnaVBUS1RP?=
 =?utf-8?B?ZmNWcC9LUnR5TnYwTFJSTGRIVE9CaWc3d01sVmNiT1gxT3F1T1h5VU1FUVIx?=
 =?utf-8?B?UzlBUHRRM3M3SkdxbXZqbmZVdk9MKzdqMlpxVVZzanlZYnAxbWtBekx0eFVv?=
 =?utf-8?B?MGJ5YnpWcWdGcCswMTQ4RStTM2RKRXdNaGtMbS8wMFZTRWJvVEp3THVYQ05K?=
 =?utf-8?B?MjQyb05hWnNqN1dIRzNiUkNydEtFdEU0SVZoeFhENkRac2lod2lXbDFJQ2NZ?=
 =?utf-8?Q?5950WO79mj42/bJ8aM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fbd3a2-c46b-44db-b36c-08df23b0c08f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:50:16.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzig2SbjvTNsLNOhOM9iaT05oUX3HWS5FnxCm5JkbmJn/Hm5NM/FIBRrNKgBUC3rkidA+HenKtKBrUVgkkJiZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539
X-purgate-ID: tlsNG-c201ff/1791294624-2491C2A1-1319990E/0/0
X-purgate-type: clean
X-purgate-size: 557

On Tue, Oct 06, 2026 at 12:31:40PM +0200, Alejandro Vallejo wrote:
> While today they don't implement fencing in a way that would block
> speculation, once/if they do they'll absolutely need to be inlined, even
> if -fno-inline or -fno-early-inlining are passed.

FWIW, it's my understanding that -fno-early-inlining is not really
relevant here; it disables the early inlining pass, but the late(r)
one(s) is/are still present, so inlining will happen, just later in
the compilation process.  -fno-inline is indeed relevant here.

Thanks, Roger.

