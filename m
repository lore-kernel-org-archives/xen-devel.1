Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D00C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:43:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388242.1629453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmlG-0002xU-85; Tue, 11 Aug 2026 13:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388242.1629453; Tue, 11 Aug 2026 13:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmlG-0002xN-3N; Tue, 11 Aug 2026 13:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1388242;
 Tue, 11 Aug 2026 13:43:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wtmlE-0002xH-LW
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:43:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtmlD-00EaN9-UL
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:43:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b26ef-e002-0a2a0a5209dd-0a2a450ae408-36
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:43:19 +0200
Received: from [52.101.43.18]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b26f6-f2d2-0a2a450a0019-34652b12a380-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:43:19 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7817.namprd03.prod.outlook.com (2603:10b6:303:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:43:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:43:08 +0000
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
 b=gFnLaDSzHdiBahBBUdGKIrSPyvQRPy2K79WUDL72kH3vOHQ524xbgwxZH+BfaQB5FpjvGLOgTIGRkxX0yPQTu+REqkCIzP/lXw+11xZe9mbJn1rBunExM61BdEy2L6cjuisuCO3Dzj8EhbAd3Za9HEFjuoFWaus73wTg1Nr1GiD9L3Qz6Aeisgca2Z8k/RwHPpdvN/pKJiAjwBjVSWIPpDcG0Gm21G/AQEjwjYfb0D62a3KjegtM0Xvo3XHjmgYK5bZQ++iE2P59PqugPbuF1if1+zcb6hXeYzzfD/pjYaM7rJYwkHtv926cVUKc50kV8qLeTxfXHSHmElGEX7ddQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6HJleX/8qOcArZJBfZRiD8XBv61MP4y4fmJda5DMlk=;
 b=yBNaTPTeZ+peQdGu+OrvSYXCwB7CaJXdnHBQuIS8pP0i4BFD/yrEnKyfBotLueRhKiQWAEWi8T3ptITSS5s1Q5vxCJbC8H6scuJfatClkV7MakeV1Vg+ZoOAZZb+GPgTd/QcOH9cviWjxSm6nX2kE7r223YtL6zYcMgBzgLeC+6NdKF+r+UmiWvc3tcy//W/fY3KmVVBSelNzQ3KGdeFXvEYEWRCWmQVRKYv6zEpFD64ORPJq/cEIzAbAovY2bkMYcjZk7yFt4uUP4L90xh6mx+UwY+zHjMp4TG6r51ljtdDzJ1iBzD1Z1v1xHLNMQJff3W+ueQRmH+Qj0GDp8nEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6HJleX/8qOcArZJBfZRiD8XBv61MP4y4fmJda5DMlk=;
 b=W33IEWJkhvqHmxJBhJ+aD0YZQb3IR2pDEMZCtVgHwFK0A9KpGe5c+czlaN4h43PjXMkX9S4gaZ8/8F0Fydhp7sXeqtAh+OWgly1ic30PDHTvvpbX0t3KfvF84eyzlbYrOy8Lg2ABoOxG85cKhd5XtpnxrZxFhHhbgo3Z1m/TSIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a766db65-4c46-4d8e-8677-ce1d8d014436@citrix.com>
Date: Tue, 11 Aug 2026 14:43:03 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 3/6] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211105.8631fc262581453bbf619ec5b2062170.19f6b44e5b6000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1784211105.8631fc262581453bbf619ec5b2062170.19f6b44e5b6000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0676.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: f0db2984-4836-46a8-1904-08def7ae7a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ozy4epcRdDZeMaXOPmbsfIv5/Y0y5kO81xhkjVDpFjQy+EwE45JE4QrWk6pnkALqmTGvmDtEXgu2KBsfWlC90AEFCyOiBydLMjcIbmUBaYM5a+8sH/AGAtGfyYX0EUfsbY4rv+3MjatBhB2al3NUd0GQTBhOTeAn8BtnGcZYsdQTHyKZ1MKSwIDebOehRyIJCi9gGaBuxa6eILueslfdDdlwlQdgb92D+V02CvYos2cNjmSVjFkmm7nU2erosrUNwcIPVfrgFbIP8nhunsw12/P++UGcFhH/H6yDwYz2rkUds7yFLhxQZSKOj2fQWyBOrlrAc2tMmjewZUrUtCsuC0E006brgbFKPGNUFl8PBYBB4CFtORUb3YimaK+ewdNWl70eQw2HMfFZ+20OrvhkPPqBzuRN+X89I+3+K3FBJuCQCXUgt6pa2qTTA2cfLagK5LBk4VwC9TfuZ5xEcQn2QomAh0VUJkPKHR8taiUfmlKSk9YxVsAbWv8NfBno0nnDVBaTGq5rWR/Nceb6SiTEjFXCUbDjd5KRb/kdvuDfxICw2D50FW/IrEveuT+nhzM6UeSQKszHttVw2TmRpiwi6HCrtLyl8jYQ52f+HSaMuxsrO0gTRTWEWv/KIygyeaab7yBfsDhLtCaTbyMO85RZ86LwxpRWjrNV82wxmwtdbhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVrdVBGY0FjMHFVUHRXQTJBUHRzVzdWenpiOTA4MHhXenkwSGwrbHZMRldL?=
 =?utf-8?B?YnNDR2h0MEx1cFpHK0NxT2NjMHFMSlNpOVVJaHFCSEtqelFpYUFSdDdrbzZH?=
 =?utf-8?B?NkI5by95ZStzdUN2cXZuVDNUTXBrSVF6Q25xc1owdmw3a0lPUEJ0TXJuem5s?=
 =?utf-8?B?RkZtamdzenF1dzFDVEFaa1ZqYkc2dzhhb1k2R2Q5Wmp2NjRwY2F0aUZJR1Nu?=
 =?utf-8?B?YWVISjVGVDMydklpWVpnK2dQdnlRbU40N1h3cVZyUVhkQjNXekFMT1pheW5Y?=
 =?utf-8?B?OTZsQWRYaTZkU0ZxdDVjRmowQWwyMlhpWXBjNVQwUGpUaU1PdXhvZkd4Mlho?=
 =?utf-8?B?NkZwT2ZLU3Y0QWtMeFNTSW0rTER0d3FoSGFRQjcydGZrOElHRlppb2lPakF0?=
 =?utf-8?B?VzJOQUxXVWNiK3ZDeU1vZm9DMm9hN3F4aW1SMGR1LzY4Q0ZzNzFEWVBSbG96?=
 =?utf-8?B?UHRGOXlJeVhkdzNCNVY4bURaN1pWSGhMS2piLzRQMFZvT0dVME1QbERXM3Er?=
 =?utf-8?B?aFZEQm5WSXFXTEc4SVNrL3QvaDg4YmFHSEpsWFUzdWk3VEowWnlTUWFwdWFt?=
 =?utf-8?B?Z3RURVpLQTVFQWdIb1FHZlZPcDAvVjUxRFRhM3hBWDR1R0RML01mZG4zSlNl?=
 =?utf-8?B?bFNlejZ3aHlXOFJvZFlURGVuSHJwUU14VU1IMC85ZnB5U01FWlZFcTNsd0dU?=
 =?utf-8?B?Y1pFNkErbzQwbEFjb0JlWml2OTcxY2hWNjZybEVqSjlyZDhjcExkeW5obEJl?=
 =?utf-8?B?ZmhJeWhzRmx4NDd4UWsvMUhWT1AyOEh0cGxJdC9LUG9aUEZNSFl1UGJUZnc0?=
 =?utf-8?B?bEJySjZzemNjZVljSlZBVUdXckNTaHlxRFplTk5hWGlnZml5ZGFZdE5BbVFx?=
 =?utf-8?B?ekZEYmczUVNncWg2UWpOUVc0ZFhtTzZFRVY2N21PMFZzME14OHZINlFuS0FW?=
 =?utf-8?B?WnhLaEVBQTNFaGgxNWtZWGxWdm5jY1pmc1VSRk1vS2M4UGlPMkdubG1KeXpL?=
 =?utf-8?B?RURRSkU3S0JDTnVidFVFOFlaWSt2QWlYcllQbzVRZTRQOU5hdGRBRnJXQVkw?=
 =?utf-8?B?YW1XU0k5NTBzM3N2blhrT1d6RElBVE5aTDQyRWRPbElIb0NoWUxBa3JHcHNB?=
 =?utf-8?B?R080RzFGMk5rNlJtZG51K1QwVm0xSzZIR3ZjMHpuUWMrU1U1QzBJTXlnby9l?=
 =?utf-8?B?VHRJUERVc2ZENkNCYUJNemRjeW84SFgwYXR2dXVBSHZXeUtUeDd3UjJtcldU?=
 =?utf-8?B?azdRMFArT0hCUGFBaWFlN0hEc2hiWEc3L3NzR3UwUUNlSkRjbjNVb0FmSEty?=
 =?utf-8?B?aTdsQTR2OXN3N2RwSW1pemFaNGxxN01zanJSOVh2c3k1UStwWlBEdUJpRzdI?=
 =?utf-8?B?VHZQMmFCRHZNSS9pRTRib0xmYm5YTUxRSEQydXZ3Q2dqNDBPSzFYbWJvRG9R?=
 =?utf-8?B?cDNHaEFzOXhFL0ExSFRZUUdnckhWSFBNa3ZWdWtOcFp0MXZNelhTSWpUTmNN?=
 =?utf-8?B?bHNsRVdMTFM2NE12RUxrWHZlQUJscXE4VzRCTU42SGRYTFhUa2FLR0d2K1Qz?=
 =?utf-8?B?UUNna3d3MnV4dER6QStlNThzem1lb0xRSVNscGZBaW84QXJ1RS83QndwVkZm?=
 =?utf-8?B?V3JBV255V0JGRXAvNUk2TmEzUzV5aUF0WGk4ajQ1ckpYWWExOHJqQmJkK3hG?=
 =?utf-8?B?dTNHazdnK0dLdGk1Rytpb1p1OWpLU3Jpa3laZ1hzRVAwMmlQZmFtWUVRbWs0?=
 =?utf-8?B?QTNsUUF1RlN2aGhrVHkyZDdURXhrMHFOVXliMFYvNFBQQk5LNXllRVQ2empX?=
 =?utf-8?B?SXRZZEM0aU1pWDg3MTJMYnF5VHBSMmxONW9VUjUxaXVOei9ZS3dGb0JkTHNq?=
 =?utf-8?B?RVpkcEVNZUdieHdUeVlwUlJYdEJVNmxwUGtlRGNXZkFvY01hT1VnZ3NYMkVH?=
 =?utf-8?B?WHhyVDJ1UWxJcTNSOWtLejFORUhnbGNGd1F2djkrMGh6dmxZeldPSE5ORS9v?=
 =?utf-8?B?VWVVbFZsYWdWd29OQmg1OStXSVE1c1hsbzlENElmVHJRNFJHVTlBc2R2dE02?=
 =?utf-8?B?bmp0Zm5TK0xFc1dua2FYbkJxaGpRVEs5enZRNVBDUmIwRC9sbnhicHdxWkp6?=
 =?utf-8?B?RG1ROWROVTJiVitaQ3lmSWhZaHFPN25FRVQxeHZNWExYWmtMTEVWUExlOWFM?=
 =?utf-8?B?RjRNUi9NRDJjazhGUUJWT3lxZW9DeEhQd0EzcXh2QmtqcFExcThWZm5iN0lI?=
 =?utf-8?B?MXpJVEJ5OVZzTUJQVkNSTXZCNGNiU0FyQlBGeW1zd080MXdhUU1mWDZ2Wnk3?=
 =?utf-8?B?OUhseThxS0FJRVZmeFNJb0czNWU5TitGQUM3enUvWXpYN0ZVWlNGZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0db2984-4836-46a8-1904-08def7ae7a0e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:43:08.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruMlxaLIYkwopAsebD2mE0z3w8wmR1YV9Zv59HnJFp2VfFy16IcWbZxLTfVoPCuyvXKai1PiRxZ3Usn/8Vl+4jIaHYEp4eejJ2uUY2F9RV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7817
X-purgate-ID: tlsNG-4011c0/1786455799-50CCBCFC-D643FEAD/0/0
X-purgate-type: clean
X-purgate-size: 1100

On 16/07/2026 3:11 pm, Julian Vetter wrote:
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> index 4aa4c6c34a..6397df696b 100644
> --- a/tools/include/xen-tools/arm-arch-capabilities.h
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -25,4 +26,19 @@ unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
>  #endif
>  }
>  
> +/*
> + * Generic test for any single-bit XEN_SYSCTL_PHYSCAP_ARM_* capability, e.g.
> + * arch_capabilities_arm_has(caps, XEN_SYSCTL_PHYSCAP_ARM_GIC_V2). Multi-bit
> + * fields (like the SVE vector length above) still need their own decoder.
> + */
> +static inline
> +bool arch_capabilities_arm_has(unsigned int arch_capabilities,
> +                               unsigned int mask)
> +{
> +#if defined(__arm__) || defined(__aarch64__)
> +    return !!(arch_capabilities & mask);
> +#else
> +    return false;
> +#endif

You're missing a } here, and I don't see it anywhere else in the series.

> +
>  #endif /* ARM_ARCH_CAPABILITIES_H */

~Andrew

