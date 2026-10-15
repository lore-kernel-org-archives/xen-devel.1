Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C606ACC6B30
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 10:37:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450221.1665704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHIq1-0006zj-Bp; Thu, 15 Oct 2026 10:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450221.1665704; Thu, 15 Oct 2026 10:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHIq1-0006zc-94; Thu, 15 Oct 2026 10:37:29 +0000
Received: by outflank-mailman (input) for mailman id 1450221;
 Thu, 15 Oct 2026 10:37:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHIq0-0006zW-8T
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:37:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHIpz-00EcDQ-LQ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:37:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0ace4-e002-0a2a0a5209dd-0a2a450bb4b0-6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 12:37:27 +0200
Received: from [40.107.209.39]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0ace5-b7e8-0a2a450b0019-286bd127dda9-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 12:37:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7501.namprd03.prod.outlook.com (2603:10b6:408:19f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 10:37:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 10:37:23 +0000
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
 b=ESptemlv9OTtY9V+bMsx88dSaLOAUAkeWYtmYVIAf5Q6PrIy2yfNfoOVDea8DpkxTN1uXBsvjodqfcAt6e33GbeCL+otKOZRT/zPSxJu2eTFxhBkLy/lTvaU7dPiP9b0LSGjXVTCdML5M3R758A7c16T8qxyxovLH1VLqDBWyKmQa0SL7c4gC8MkgEYd8T2BSh7F5WbtiQ3o8e6y+D6eYoM71BeDQBU+ubHFWH2KqPQe6VJY2uiyHC4SckTpkLsPIuIl1Q1VfI3punDfSKN5rh4VTcTAmySM/fo7k8GNieQJUbLZgO+hs3M67JMzFIQKlL2Hsk01+YKBPzbk9Te7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjfznOE2Too69mTl2oG0BG+QegdFquffWU9s9fkMleQ=;
 b=YDDqdYSIl2Gy1bdLPM7Fvuw2DQhL9jr175yrYo5nGFqdt9HFAiTlG15hr+I4JogUQutpXI1C+c3vY4kmTAzevSqfyxa8QYs47GAx+GXFBRFqCXArUxuIb9dIxIEtgSu1qqdNUlghYgvdZPE00702Hd4adP78auCD5KdwiVJIr3AG+UxZEQTTehg2qP+d+GLw5NG/ucgekhjJrfTQH6NxH9UP7gyfvq1F4E4gIF3uLhrngQeMW/K2v2mK4xJFgbOnec19X/woMCUxX3EGSZa/FONgxzQ2JKuqgfUx3tmuk6TZCnZJyKyCXZTN97jkx13dRX0Mlsae5+PDwWlfY8jyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjfznOE2Too69mTl2oG0BG+QegdFquffWU9s9fkMleQ=;
 b=JgD0EkAjUe3NJTMDCywoTxktBqpOhtUROhhdjbWES8Gg4dtpr/nMlJx+d5sDVBJJiQkQEK0IIhHNxGRE/EeGe/fQu4YK4NG1Ko4S6qPuvHB5fDENJreVi6TfVf3Kw9pXLtRQA+mYJXCxx9zLFBX6g9rB/xFDUWaB0AaFEhNe1LQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <716a13d4-9fd8-41bf-b475-08d0747ff442@citrix.com>
Date: Thu, 15 Oct 2026 11:37:19 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 2/3] x86: use __builtin_popcountl() for arch_hweightl()
 when available
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
 <9e48f405-4e99-4258-921e-2948f0d6754d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9e48f405-4e99-4258-921e-2948f0d6754d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0325.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d785bcd-a671-497b-7921-08df2aa84c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|10067099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tJNOqcmmbeR8ta0M4hS93IPpjzVZ8NID8nqAPF+QD1VEhUuup6JYirzPIsjXNvgsIux5U2qxNM2TAqinwleO8Fsyx61zQCJITIlnLIP1eXnrk2OL4iVI7y9KspQtHsS8oPUUw9aoNu5IpC5ezwqHrNec7SOYFMWwQuodSNr/sbgAOW/DLsfDakfTILLwZ6sdsTi0BX9FGXiEoGLxHBnoqqdvBcNEhO+2CLzeFxGieCEN5F8JYWN9RVxZE6vlRNjovy/v/abfbpKhxiXTaam4s+d21KAnHpoZko9oK0aSa9feh/SZEZlz7DFQtCumLImKX7NPoyclChGK3v6ZNSflohaO4fq2NAwBd7NvYYm3gR8lXxk/EzAxnw4gQL3UdameY3MN35NRm6fLRN+B+Z0gE+748f8sqr1j0iJA2pcQILJLjJzAdCDfj6QDXPu545UOmxQuHmvmUtwpiugQ72x3aC85lnkk6dLNfv+wYS/3al/KVHjwHIY8UZmJx30O9XBe5bvskoYJvQmrjalsRo6BJ8+T1ELIGzmhHyQ+1QFsKjydNUvdgRxYTrF6ZFN0ZMaOOEM3a6ngB4a6kcjhEat1xe6IxCGX0V3telQd4ze6kR2LGXWqyzpt5aajQsSEBeZP9+6r6UmJ6PnlywfsE2kbSGNpDQ5to+FY3CtyUYuLV3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0hVU0NoSUpBaVhFVllZcU4vZEVxc0phcWRPVllRTXhOWkszV3R4MlJGeGxn?=
 =?utf-8?B?WkpMMFRKUXdLOUtabzVyTzhTYXNyZTBNT1pNdXovM0tPcFI3RS8vZUxVc1k3?=
 =?utf-8?B?WU1vckhuK0orZTlXWGpiZ2x0cHhqTlRNZ3kyM1FXeWgycDdzNXZVU082a3Y4?=
 =?utf-8?B?SSs0b3dDakYyZExMa0dVaFFHRUR1ZTdOSWJnSEoyRWJXZDFYS2dJaFRGUXg2?=
 =?utf-8?B?UUt2TEw3OStkWktkU1J6bFpEaGt4cVZhMmJNdHg0b3FSVjJScGdtS1c0K1BO?=
 =?utf-8?B?TmpuUVJob1ovRXhMb2lJMFlaZGkrN2VOb0lKQmNLcFlvcU1tTnpFTjZGemdh?=
 =?utf-8?B?VmZ3RDFKME96RGtEdmhMVmRZMlQweGVIQVJFUUtDMDRxNTFBK2VTc1UrMVFo?=
 =?utf-8?B?dUlhVlE3MW9sK25xM1RFNjRocDRhUG0rVTBKTWdTVDdIMktLdEFrSm9iMyth?=
 =?utf-8?B?eVhjMW83ZmZhK2JHZHJhbUFDUzF5bThNdUpSR1dRRE9GQXlFR3lJLzlpR1FZ?=
 =?utf-8?B?amszNHdnMFlsbWJZUmFTRDNHSjd4R05ZbW5nSmF6eFJqeXJYdXZZSlV4VXZo?=
 =?utf-8?B?Tlg1VmZNYUxadUVnbjZrcW1KenhVVC9rUzZVVTY5R0ZSWlFHbmxSUGhaYm45?=
 =?utf-8?B?c0NHYXM0VFpVWTJPKy9IOVBoNmkvOHRDQnZJWEYwWHRobTBjNWRZbVNLMWpF?=
 =?utf-8?B?NnIwcXpkMnlUODdmZllZbDYvd0lDWWdEZVdyVytSK0tnRjRqbVUrelVCZE5r?=
 =?utf-8?B?Z25Va1Z6b3BvS3haQkdpYmphVGR6YXlpN0U3UHNTUVlYYldiUkVtWnh6TmdQ?=
 =?utf-8?B?MmxXU3drZ1hjRDduM2NUaVF4NmtDSWJrbVgyZWRXUUY3SWs0OXpucjBJbkxU?=
 =?utf-8?B?eUtYa20relcyR1BrbzRhbU9CWHNjVU5MdFRabkVCdHlXa29tdmIrN055WE53?=
 =?utf-8?B?OU9sOE1OSitkRDlaSkhRRURxajd6QmRJbXVrZ1ZsM0VNdjA2S2U2Ri9CazBU?=
 =?utf-8?B?b2lacTFqb0VubE1QdWdVeTFyY1NqSElGVlBIZ2VJSkFnL0Q2QjgyVXBZWWx5?=
 =?utf-8?B?b0NyeUwrQXkyazcyMUNtRHJOYzNRUThibDhITHlhZU93RUVNdlVQR0pLbS9w?=
 =?utf-8?B?L1JmZ2VwYXhPbTgrYU5UZ1A0S3dlaUdsaWFrR0swUGNyazU0ekU1SXlCUlRi?=
 =?utf-8?B?RExrWjlPVHFqZmhqcm9TeHMvQmFCOXlFS3NseHRMc2tOZ2NMTm5EajZUMEFI?=
 =?utf-8?B?TDVhUjdlZm9iY1daSTRxU2VSak9YREowcTc2WWlIc2dDR0NDNENPbDMrMmF0?=
 =?utf-8?B?ZFNNM01OSUFvQ2pLRGVNRjd1UjFGbmNiYXVyVWhhL0dIVnVJbCsvU202Wlpk?=
 =?utf-8?B?bWU4V2VlVFBJRTBXa09lN0Z3cVAvL2l6QThZZGowOTBpR09hd2hnREQ2NENo?=
 =?utf-8?B?UDhRMHFTU0dtSys0TGs3YWYvdzFHK2MraXBvQVlrcXRvY1dJcU96TjZKSCsw?=
 =?utf-8?B?OGJFNEZwR1ZqdFBvYWNUa09GR2VpTWxMWlhCSUFEYjk0WXc3YlY5V2QyT3FS?=
 =?utf-8?B?UDRGSnhmSzhlYTJjWFZRQ3ZSaktFQTU2eG5Gc0R5Ylh5TTlacXZ5c05OVitT?=
 =?utf-8?B?RlU5M2x4TE1XeVRIMEFwQXVIYVRqMHp0Z0JSQmhMM2ZobzU2SllLWVZJN1NC?=
 =?utf-8?B?cmJjT0hqTFliL1NnQytiZktzQ2ovOWluVG44R3h1UklFUWIzSXQ2dGR1d2tF?=
 =?utf-8?B?YWlGbFZOMlZRL3JZNGNwWXBERGJVendpbXNITUM0dW92VUZFVmhXdUdaWGRJ?=
 =?utf-8?B?U3lheEFKQVpaeXlXK2ZhMVViOE10c3kzMGNid2wwZ3d4ZDlNemI4VWpjRFRN?=
 =?utf-8?B?R2swVHZmblVWaDdRQzNHdDBNUVFIc0UzOFpGTHFwZUx5NVlpcHh4cXRXYkFx?=
 =?utf-8?B?SU45TThVYWFuSjV3cVpsREhEZnNaclJTUjVWMVBCR2EyTjd2cG1IY0lzK1Vn?=
 =?utf-8?B?QmtGZ1p0SUhkaTZBOTIvNFRjRWVFNzIrSkNIYVRjcWk5SkNBQ3Jac1hkVVll?=
 =?utf-8?B?c2Fta2xNQzBGZ3JXMkk0L3RnNk93aXdYS2ZPQlF6Q0FqYzBLMUJnblNYci9W?=
 =?utf-8?B?UUJQekJ3MVJpWnFpdWhBRkVUeHhlUjA2SFN2ekJsYStFc0g0Z1ZOT0FKWlo3?=
 =?utf-8?B?VVNrbmM3RkJOYUhWUDBmOXkzMXZzZXoweFI1b0dtUXJSeWVDUWV4dTRlWGpk?=
 =?utf-8?B?aXhWQXBnL0Q5YjNBSm1wdEpTd01yRloxN1RVVEhBMlZFbjVXakhPWTl1amxV?=
 =?utf-8?B?L0VCQ2hIV1l5MjFpdnRQaHZxeFdYUTRHcS9GN1gvMVEvMjQ1MGRhQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d785bcd-a671-497b-7921-08df2aa84c3e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 10:37:23.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvRasK/YJIzUFXreXjSKBNb1H16ef+1N7SD+PZUTIDiJVFgCLsRzPXgjFpJd+tRprmWh7o38Be5M5Nqv2EQIkBV5tq0gukBbMjzZEFthG+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7501
X-purgate-ID: tlsNG-42698a/1792060647-A92CC9EA-6FD1A5E9/10/78276251493
X-purgate-type: spam
X-purgate-size: 1527

On 15/10/2026 10:10 am, Jan Beulich wrote:
> Use the respective compiler builtin when available; no need to play any
> alternatives games in such configurations.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: Re-base (re-do).
>
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -500,6 +500,9 @@ static always_inline unsigned int arch_f
>  
>  unsigned int arch_generic_hweightl(unsigned long x);
>  
> +#ifdef __POPCNT__
> +#define arch_hweightl __builtin_popcountl
> +#else /* !__POPCNT__ */
>  static always_inline unsigned int arch_hweightl(unsigned long x)
>  {
>      unsigned int r;
> @@ -525,5 +528,6 @@ static always_inline unsigned int arch_h
>      return r;
>  }
>  #define arch_hweightl arch_hweightl
> +#endif /* __POPCNT__ */
>  
>  #endif /* _X86_BITOPS_H */
>

This is needlessly complex.

diff --git a/xen/arch/x86/include/asm/bitops.h
b/xen/arch/x86/include/asm/bitops.h
index 557cee03baeb..c38680e8888c 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -504,6 +504,10 @@ static always_inline unsigned int
arch_hweightl(unsigned long x)
 {
     unsigned int r;
 
+    /* If compiled with a suitable baseline ISA. */
+    if ( IS_ENABLED(__POPCNT__) )
+        return __builtin_popcountl(x);
+
     /*
      * arch_generic_hweightl() is written in ASM in order to preserve all
      * registers, as the compiler can't see the call.


~Andrew

