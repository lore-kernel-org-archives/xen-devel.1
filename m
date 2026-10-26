Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC9606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=XcpuCVPT
Received: from list by lists.xenproject.org with outflank-mailman.1460993.1671893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLH10-0004vs-JI; Mon, 26 Oct 2026 09:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460993.1671893; Mon, 26 Oct 2026 09:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLH10-0004vj-Fp; Mon, 26 Oct 2026 09:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1460993;
 Mon, 26 Oct 2026 09:29:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLH0y-0004vY-F4
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:29:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLH0x-00HGtY-Ks
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:29:11 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf1d63-2eae-0a2a0a5409dd-0a2a45098f88-24
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:29:11 +0100
Received: from [40.107.209.29]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf1d64-be1a-0a2a45090019-286bd11d1a5a-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:29:10 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7986.namprd03.prod.outlook.com (2603:10b6:303:276::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:29:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:29:07 +0000
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
 b=Gq6vVpb2p0pG6VxXQ7FsDNWCWFlnoBPqNaY7tQSotYPvoanhWDX2UQWzlYPX4+exkx6K2JRC1GYD/PyKIEO/xlO1Yfvc/qyEIfolRWf9nfjKsPuCYRj3KCx3VZhFkppyrIfz8572zVt/QEFeA88IF0npfsd1qjCBaQ7YJgFPVD56dwkRQWyi0La1kpRGbJ1uKPPgK57vfc0S/+agoZSSO0rOEOuSioIM3Z0Sx2+tJkfZ+yewVmU7ujJaDr1EKumqlQgyTz7XjFYethX50tSXA3uU/U0hCxt19VQVZ55s/sWoMPIb9zlL283QwxxMJbowJWb3SaDzh5MozeG+Z1DMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxw3faFySc2Vebb0SR0LoNqsfTts2GI2iOQHqAX/rhk=;
 b=Yp42qEGXO6UcB0G8E+SQqTzgs5HhNWO3+Zs5pk5mJXEszZLzXxOflcpeHuWb39D1eKC2zXvvyckDFSXqbZyzuxniCdL8M+BlYOdWlVBnE7xb2/axCJI3HUYbeXHfnCTDzk3QGrwN/BPp2ISGzOYy3VUARIOk2Jm5lSdNIV55sXHbyOM4Q+XUzr2EgaIZKgFTgOOxhZlcCPz02E1SwmdSfZsW6gs2QzG6eKwyz6e7bSv+91jxL+MlkIijf7Nb3yg3oOBcw2t/iCpFP5SF/Znelt481CIIX9bjU3tjXFvFc5nN9CrE0CHJOIbMhm0XRx6w523vS5079Z0zISp5CP0riA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxw3faFySc2Vebb0SR0LoNqsfTts2GI2iOQHqAX/rhk=;
 b=XcpuCVPTEVYkmH7s3vS9DF07NbIatzbwwzFa8kpP+8JM18H8GW77Tu0+IV1IctMWT2eXbHFMbs33S5rfEJNVC/KflsPhHEBnlDyUM4KIdB4E15DYzAvRS2qfD6PQi/8B+Ve5FrEoKWnCUtAPkHljUR3f+7O+Hhs2rtrVi8aivB4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <432e0fba-0765-4c2c-866f-faff8cd04926@citrix.com>
Date: Mon, 26 Oct 2026 09:29:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
To: Ryo Takakura <takakura@valinux.co.jp>, xen-devel@lists.xenproject.org
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 548a784f-8fba-4a22-4b38-08df33439538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261022075727099003|261022105027099003|261021121427099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NYGUucxBoP/iVDOsbie1yty9OD+tdewFWUSYw2ZHAneyvVqq0Dtb1/v4DcMsRtPIPg96df6poVR54Kn+ujyTqzP/oXMbEgZSVgQA+3JYGDe4h1gpsDPGUMrAYTuOW2rR6FtdT+5eWZC30l/l3f2d26ndAyoUK/8B3AenNhtBYhYBOtmIZ2nyGAKhCuKqNlnoaQgDDpmipR5BXfeFcIVsL+qyTcasEwZCP5z9PTeY+O8bWe+0/wo+8y0ZPv9eHo3yK0nZ0XYxFV7OCbm7nEqGK/onhl8uFQV1EsFirzcRT6vYLx4sL4Qx4ZPNS11A+DpDcXmicBZzvXZC6D47h1c+j4Y6vglUnq1DA01eyaNVLYfmNmNDaJVs6tNvnHYcuqHCPXr3Hgm4w2Wq4ZPIdYT0mB+uixt/CNadlkyy9Tpzl59PbNruLcfvlklRR9H6I4Rr5jNSe1v7FGY963AkRFvgCPwJXY4XeCVA/YAqjS5Pe+UHBW+42iq3oGwmtzxUrCFnTFdfzbNQsugNX7n+5nlYPwMhfOuQuHvL5I6R8VaH55r70aEHrXh9m6UsQEVCxDqGJiNyGMKu0smrT9mQugJo91UBYgrD7D3QQBTd73+WNh29Q2RObdbHXCsWIdiYFJfF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T002eTk0RDJZeloyYVFDN1c3cEUrTE1DVEdWbWVMTlBoMFAzTWZDbm4zRlRX?=
 =?utf-8?B?a0NXUVpmSzViVFcyNzNaaVUzZGxjbVVyOW1vVFQvMW5aVTZoUlhBL1pUWHRU?=
 =?utf-8?B?NmhJNUxHeVJjNjJGTVZsYVo0U0x4eFNhYUhsbFdKcFpXM0M2SEdJc1ZUcHhw?=
 =?utf-8?B?dE90ZS9PNjF1WE9lY3p5ZE1oRy93WVhqVzI5SXJ3MmUyRVRMUW5MVk9pQURt?=
 =?utf-8?B?T3dQOXR4NDFaZzZEbkVldmNmRmNjSHFsWHF4dURXakVHdloyRmhScUdRZ3kz?=
 =?utf-8?B?bUt1WllRWVVOWDlvejB1ekwwQW93RkRwaHFxVXZ6VDczd0JZUU5RbTVlZ1NN?=
 =?utf-8?B?K0hyeGhnMFhCaGtxa3JVd0JPQnlhWmR1ZlhxV2JhOUVac3MxN002NE55VXU0?=
 =?utf-8?B?dW1pYkZiSVpNY3JEWHV4MmN1ZnpzRHVYWUpkRllDMUtmUXpMT1hCQis5RXFF?=
 =?utf-8?B?Y211K0E5N2VQbE1rN29tZFllY1NmOHhxb3hEYmlHYVNJTjZSeUZoSjM4YjlB?=
 =?utf-8?B?czFDOTNpNXQ1cGRyUkRZbWNkSEl1cmFmb0hUUFF5c0c1Nkd4bFI1OEVUSXZ0?=
 =?utf-8?B?U3NySVEzTUQ5dVA5TUlRcW04Z1dTOVJ4SG41RHZwV1pQTDJZZ01nNTZvLzUz?=
 =?utf-8?B?czVhbG9KK1l5aWtYTU42UEJTMnladGYvY2ZZUXMyb0NJYkJHYU1jV3d2dStk?=
 =?utf-8?B?eWQ3MmEwdlljSUZMcFU4UGljaEtnSDZOUEVGODBvV09jOXJrMlByZkgvd2pH?=
 =?utf-8?B?ekR2cHQ3cHpLZWExWkFoVXMwR0IzNE9tek5td2ZvKytMQW5GdVlPVjFYaG9K?=
 =?utf-8?B?eTU2MGRDZjQwT0dCVUhBaXZQQStYSW51bWJnVWNDcTMvR1RCYTN1bThpWUhW?=
 =?utf-8?B?cGhqeVI1ZG5kZTR1SzN0V3hob090c1NsNnF1YXI2UXhPYkxER3BwM0YzVVlI?=
 =?utf-8?B?dTFaRWlXZUNZWEtacHJiYUZ2eUdiWVQrblNmQm1Jd2xtVGdESGk3Sng2VWNw?=
 =?utf-8?B?MjBsUzFodVlxM2xmSkxSVW5wVWNhb0hsdjh3c1VFcktPQ1hQb2VSanl2TU9E?=
 =?utf-8?B?WEdJOVpNREh1ZU1FN3ZxNitYRkJBSUMvS1BZcWNQb2JGUjJrMjA3VXBzQVRj?=
 =?utf-8?B?VkluVnRkcGZUTHZEUWN0SHFDUUxuampLOGYweUJJam50cXh1ZENHTTRjSktr?=
 =?utf-8?B?NDVqb1FhaWZBeHdabXlyYUlscDJma2c0Z01xWGFLaEJMa1dtU1B6KzkyVkhL?=
 =?utf-8?B?MGJmYnRsUXErQ2JIMHlSYnBTd3plV1pZWDhpMVRQeElIR0dkWC9CQnJBc0h0?=
 =?utf-8?B?bWZOOFY3VC84WmFleEozTmxGRE9ETlh0dXNacENlS080N3FlNFY0bGpNOHQw?=
 =?utf-8?B?bkdWM1ZZNnNsQjNRK0l5TE8zNE8rc2NVUS82akJMTmNScUk4d2xhZUlnUmY3?=
 =?utf-8?B?dE5kS3VoS0VHSWZ2R3M1RTFUV1BrSXhXSFJtb1M5a3Y0NGlTZ3N5eFVpK1Ra?=
 =?utf-8?B?Sm9wamhiZ29ORjNoT1c3UjNDQ2R4N1JBNlVuNHYvY3VqcjBCYVdQZzl1ZkRV?=
 =?utf-8?B?ZnNCcUY4WmhJdkpUSTEyQ0JVUHRkVlVJOVM4d2RFSnpIOWRDYUNaQzR6alVP?=
 =?utf-8?B?YkZ6VVA3dFJFbWt3YTdyRjhpVHdIZHFLQnVKUXcwSjVQN2NSZld6WXlkTHFB?=
 =?utf-8?B?M01YaFlCQTBVVG9vQkQ3RkRubXNmMG9HUER3K3dCYmgrSTUraWNFUERVdUZ5?=
 =?utf-8?B?WWg3QitOaWJGNHAwTC9iWDhMUnhCbDRTSE9yYlFmU3ZUTFowdHpUUnkrY2x1?=
 =?utf-8?B?aDl6TjI1bGxuZGNhQVhrOVJRRnJzQjZXdWlWY3BacVZsMnZnQ0lZR21COVZh?=
 =?utf-8?B?c1kwOFY4dnhIVE9PRU42Qnp5MzNZQ2lkeFhtSHdmakRkVHJLZFU3U2toRDFS?=
 =?utf-8?B?SHlicGhmMHZDODdic3RLWHc1NkFaNmV0M0x3YkpPS0lINHBmUlFRTHNDNmtP?=
 =?utf-8?B?UG1ZZHU0a0tURHd5dXFOTzREeWtjRlZPaVFIN1NRMkd4UzQ0bXhobkd6dFc5?=
 =?utf-8?B?Uldzc1plNzNZeUxDSjJzc3VPTGxOSXBQRlhJOWJBR0o2U1NUWFJDL0w5b1lB?=
 =?utf-8?B?ZXRJdFlnY2drMEpWY1F5UUF4eGwrcm5PaEMzNUx6anJFT1l2aHRJaWNwa0xQ?=
 =?utf-8?B?YnhJY2JNa1dJbmFHNGR5R0RpRVNQYlo4Nm5GRlNvNU4vSFFydUNKcW80TTRw?=
 =?utf-8?B?dk9pZWJtaEN0S2piRm4rZ0JvWXp4MTRDWHloNEZ6cXJndFpoaDZYNXRMWUJY?=
 =?utf-8?B?YUpMY1ordFpaT1dCa1YwbjBjUmtMcGg0YVh2V2hrRXk5MUcyeEdCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548a784f-8fba-4a22-4b38-08df33439538
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:29:07.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz38g1z8v50syswQOzikq6dVNRgcalvqpwsQ1BJQf2qGP1WHw27qeq65cWs6w8cKGoXgHwks5eDvZDjlth2Kz484dP2FJWOdQcAfGmZA66c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7986
X-purgate-ID: tlsNG-bad1c0/1793006950-BF0DD034-F560598C/0/0
X-purgate-type: clean
X-purgate-size: 2158
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 5:48 am, Ryo Takakura wrote:
> # Configuration
> In addition to Livepatch and HypFS:
>
> CONFIG_LIVEPATCH=y
> CONFIG_HYPFS=y
>
> Enable the following configs:
>
> CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY=y
> or
> CONFIG_X86_PATCHABLE_FUNCTION_ENTRY=y
>
> CONFIG_LIVEPATCH_TRACER=y

This ends up having two almost-identical symbols, depending on
architecture, where really this is a common piece of functionality.  It
also conflates several different tasks.

I think what you want is something like this:

In xen/Kconfig, create CC_HAS_PATCHABLE_FUNCTION_ENTRY which performs
the $(cc-option,-fpatchable-function-entry=0,0) check.

You are also going to need a GCC_PATCHABLE_FUNCTION_ENTRY_BROKEN symbol,
because of https://godbolt.org/z/sde4faxaz.  See the ASM_GOTO_OUTPUT for
another example of this pattern.  Just use a plain version check rather
than tying it to XEN_IBT; this is a new feature and people wanting to
use it can use a new enough compiler, and it avoids variability
depending on other options.

You also want a HAS_PATCHABLE_FUNCTION_ENTRY in xen/common/Kconfig,
which you select from the main config x86/ARM/etc in each patch where
you add the architecture support.

You want the single visible entry LIVEPATCH_TRACER which depends on
HAS_PATCHABLE_FUNCTION_ENTRY and CC_HAS_PATCHABLE_FUNCTION_ENTRY.  You
want to make the text architecture-neutral.  Instead of the exact number
of NOPs, just say "reserves space" which will be entirely fine; the
target audience for Kconfig text is sysadmins/distro integrators, not
developers.

Finally, you want PATCHABLE_FUNCTION_ENTRY which is selected by
LIVEPATCH_TRACER, which triggers the Makefile changes.

As a general note, you don't need "default n" lines in Kconfig.  That is
the default.

All together, this separates "can the compiler do it?" from "does the
user want it?" from "what to do when the user wants it".


Separately, you have a number of MISRA violations which you're
introducing in your series.  I see you've got cf_check, which suggests
you have built in GitlabCI.  Have you also run Eclair?

~Andrew

