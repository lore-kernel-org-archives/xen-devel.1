Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA6606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=u+0/DVvT
Received: from list by lists.xenproject.org with outflank-mailman.1501974.1697969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWA2W-0000MV-UR; Wed, 25 Nov 2026 10:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501974.1697969; Wed, 25 Nov 2026 10:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWA2W-0000MO-RD; Wed, 25 Nov 2026 10:15:48 +0000
Received: by outflank-mailman (input) for mailman id 1501974;
 Wed, 25 Nov 2026 10:15:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWA2V-0000MI-MH
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 10:15:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWA2U-0021m4-NV
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:15:46 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06b54c-8faa-0a2a0a5109dd-0a2a45098a96-12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 11:15:46 +0100
Received: from [40.107.200.61]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06b551-be1a-0a2a45090019-286bc83d73b6-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 11:15:46 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5070.namprd03.prod.outlook.com (2603:10b6:208:1a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 10:15:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 10:15:43 +0000
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
 b=I9MXiZJv1ehYIKvARK5Yzz5vFdA7LJmXYKfN+/jMkfK3AZ5Og95ZRcJy4XFNlpym3fkX56xpuxnScbUFopU2R+pRWvnPlpOOuQfFCgmCPj1Fs1FF2KRXQr7V3kvLbz70jsv3xFHAQniN6DUs3zdRcZGKf2bGctkoouAyeqVlrgm2d87jTOxqungqURAMhILVoC/LTMt1/aAXXZX9yHb71PLxpLDtJAJl51/qUr4cLRLAi7ZdIeO7OifLbN0SEokPHhrrV1unaqSOS42d+O+BM5JlhrkVw5r/9JPPmhbMij6g1Am+BuTTjjy06115NQu7Yaq894ePSwyvHvQ3KXeFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCvR/1qDj/TlaLklZx+yEMI7R0P72yEB4dEcLXpkWfs=;
 b=OCAnnCA5bBtd5d9GgZffrtaWwBaHW1ZUUkMi7uSX0lFqC8gBMERow+ThQtODJS10JPFYkrPPxAI1TBqQSVuMzt7lPgKlU7zWMkX/j5kAmxHtS3o5zPuAnkF4YP2cHmexS3sLlsx1Er2rnL+uSJz6eIVj8RdB4XOGNaebIFDKTVqlUxdFlVucamm6VtxtcsG/WoAiaomusLDFKatZY9cHS7wPCAppzlTHxB9aJIMoI4/eBMrJb2/z0aVmhvJ2vlyvb/6kHdzSjP5bt/Q/Ihw1a8kKmUJxEKr/H/A45Beuc7vWTyT3GvNLt1+xsUVgqSadBmveVUstrr8EsqsWr1/yzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCvR/1qDj/TlaLklZx+yEMI7R0P72yEB4dEcLXpkWfs=;
 b=u+0/DVvT7SyRYTsKsF4G3jVCjElkIL8I69Sk44AS7sfT0d7ykcYSz7tGPNT1f5iVdQxtDFSkCZcH7w3pg/kXEWlbt7hjT1YPW5E/RpsjOdnHdFh7DogUM266taTgmvu4QiDvHFx3MXirLnveo1nd4oIIXVjymMIy/Tzckjg5VWc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b2a53585-423b-433f-9ea0-03e6499a6f06@citrix.com>
Date: Wed, 25 Nov 2026 10:15:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86emul: MOVRS are mem-only and 64-bit-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a7017d8-1605-473c-93cd-d98812bb0d8b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2a7017d8-1605-473c-93cd-d98812bb0d8b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5070:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b69de4-a69b-45b9-0b3c-08df4add1076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	sFrqZHEaVOfBTqlVv2bxiKSBQJED7fZlwkSKWgNSKhXqwckBwLWeO0w0xLyP1oQY/oQGBjg8slvsKo9GmFl31LbggWSt4FjYWeE2t7g8bD6IAHo7zbBsTLkzVKvZkduo86pByttc10UoeG+X9xeTAGGBPe37RcpKzpraAfRUsIcJlw4r7k3XvrL+b+PisOgVjfwd81TwZTgnrLQSnnxrPMvq+Vl0jmUw9B07pNa/EFaP5/asBh2RNykK68chMMBfAG0/i17T1x/mxSWZ4puL6RmmQBT5I9C3xn/Fg1Wk9q+Sdn/Md6Yj6cSSzXVDdl/+PWvtNXBqXy/dwa965fonBrY4uJBZFBsMM00atPO3rdcshBRzY5FNWb4iaUiSv0t/IhMwzeYc86ZCGi/8Uwlymttmmw5Ap4+Jinvlri/78aVurMHDWUPJpEgqwysqEc/wef2ejsQCQ0BXcI1G1C7+0s5v7aqTRDuK5IFJNanXk0/oIZTfEfr1nPVum+MqmuWR7Swoj561NpQzpyJOMFW4otiJQTR/uMV81rPk5Q/8ja6rvmYDsyTns4PoVuseGqcSCTm5lQ9ZzTSZ0i4CBqz/qe4sZXHhdS78n9kFaRxaiijt5Vbbf1Ial+cOqQWSNp7eNr2PmScvn+70N2743102OQlDCbkMAXSPpWG3f61zUv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGE4MThualY1N3dyblhYTElKMzBsZ0FiWUl0c2tJL1NZOVpPd0Z0bjA4UnpZ?=
 =?utf-8?B?SmpOdEdZOHdGZWcrUTZ2VEQ0ejhCMzVrL3ZBZ1pTMUhabTA3eEluTExlV3BH?=
 =?utf-8?B?czZ6Q2d0YkpWZTF2Y3p6ODNmaGR6RW4yRlNLUzd6U1k3TFFmVXpxNlBRS3dT?=
 =?utf-8?B?TklkaDhTSEdmUzA4d0dGWGM2R0ZaTXQ3ZURpb2MzSmRqWXZjUm92WFdZcEZP?=
 =?utf-8?B?QVpZNmk0cGMzS0ZPcXRTVEVQU2w5UVBRNjhoMXJrSWlhQkNDaXAxTEowbWcr?=
 =?utf-8?B?eGlrRVdvd2NsVUdmcGpzcDQ1cXAyMUIrOTB5M2FrY3FXQWdvWVdmK2RtN2p6?=
 =?utf-8?B?VE1RYnNFa0pia0xWSzdXbDhSTngzbndRTmhzNU9jUWdWVzRLbzQ3ZXQrR2Iy?=
 =?utf-8?B?eTV5WmlwQzNXSmZ2bEYxZFg0QVNPTUFRSHRYUENIcXlHeVVxY3BHTHFCcmZ1?=
 =?utf-8?B?aSswcitnR2hMZmFXTWtOK2trU3E5Y3c0NjdmZWxaK1ErSTVKRGJGL2szcC9F?=
 =?utf-8?B?aS8rMytMeGw0QXhScjRpTC92ZnFTbXJpTlBhYjlPaEl4OEE0d0tUTGlPNWJP?=
 =?utf-8?B?eFFFNVBwVEN6QU1tRktuWEVLMGE0TnNPVW1ucnZSQ0J0R2tZT3pFUFluVFN0?=
 =?utf-8?B?TThhQlloWTRpVkxyNXllQ3RuQU1ad3FUWkptZE5CMmxYYkxtUjFXYmFibGZ5?=
 =?utf-8?B?eUg3SWIyYlVnTGFmNVduMjljM2REQXhPRXhzUStMSk9WeHE3VUVrU0U1RkVx?=
 =?utf-8?B?b2Q3OFhOSlB2dFV2M3RPNHF4Q3VncENZK2RSVisrTW11YUI3dDI4Qkd3N1dI?=
 =?utf-8?B?OUR2S0lYZnBkZUdITVptNVkwaUg4em4wTTMxblRlTXgyVXFZV09aK2tXNVUx?=
 =?utf-8?B?eis4cXgxRWFTZit5UXZYTHFwcE1kUDFrSndEUXlRZ3I5Zi9tWEJ0OXBDQ3pw?=
 =?utf-8?B?aGZyTVFadmVIdmZUeVRJdDd6U2pTQ0s5ZnJMMmppRVJXM1dvTVovR1paL2ZD?=
 =?utf-8?B?VXVkNFg5OCtpTXEvS2ltTTRobFpwMDRReDZqTFNjUy82NTQ3WjNsMHlVVHlO?=
 =?utf-8?B?cndJSFlMcFI5OWJHNkpXSVFEQ3hrbE9SRTNkbHh4aHpaUHdzN0hBK1hPd3Zq?=
 =?utf-8?B?cnpjTWJZNEtkblBtN2h3Qk5HU0pEM1NnSmxLTUMvODFqZ1VJMitQRERGV1Q1?=
 =?utf-8?B?VloraUxSQ2FkL0p6WE9pZHhpb0hYYkJ6VGhhVmhOMFpqSDdYVVVJVm5NbThW?=
 =?utf-8?B?TUJRYUczRGxVdFpxdWRhcHIwYzNpWmoxRWVoQ1VRZ0p0eVY1bzZDVWprUnVB?=
 =?utf-8?B?cUpWNHhUTDNhMGhGSGhuMTllaEJVbzVxK1RGY1pjcVZoVkZuM2xHWHk4dXc0?=
 =?utf-8?B?eUFuUy9SUzRSRUNpeDF6NFZnS0RUWnhBcTFOWTl3a1JQTFg0WEx5R0JoV1FG?=
 =?utf-8?B?eXc5NnlZV0JKZmZ3QzJVdk01UGx3emMxRTAvL2Zsc0UzYVZES3c4clRHWDNa?=
 =?utf-8?B?dUhvNjZnS2VubThITHVaUHZaTmliQ3BDVnhqZy9PckNrdkZqc0N6WHVocFNx?=
 =?utf-8?B?OUM0RzJHNTBqSGo4ejJMYUpyOGJMRkt4NEo3VEVOY0k1YmxneDlNSnJrZDkw?=
 =?utf-8?B?aUdMYzZMUXhMSk1lUEpEOXhmZ0lraUhIWFd5QW9tbytGK1g4Nk4xU202djFa?=
 =?utf-8?B?MU5qc0p2VTlEdDQ5T2MrcHVTdUY1OGRwOFJkT25qYXFxeEdpV2EzdzVtOGhD?=
 =?utf-8?B?K2tBekZETUgvMjZ3SGlEaHlVSjBOWnpBMHBOMUZWSHFBTWc0MFdYR3VWYmlY?=
 =?utf-8?B?R2JNNHVpeWZ5Z3laWXhMQld4YkU2cW1VWkFqdktWVXg2SkR5ZEpNSDlVWjA2?=
 =?utf-8?B?SnJCd2tpWGRQSEloSTFmRjJzQ2h6bDU5VHVqZzE1TzEzajEwemVVaUFzTm5n?=
 =?utf-8?B?K1ZGYlNLb09WdVJHaFJBWENZV2pWOEZsZE50YjdSRmxsekw5MWlCSVdaR1Bp?=
 =?utf-8?B?VElBN1FHTnk5cVUzSGN3eVArRnBxbGtDVVVWQkErMmpKL0VHajhxTHN4Um53?=
 =?utf-8?B?VDZCT0toZGtMcklFZ3NLSVZDTTNEQzRkRU1qT3ZVWDhwa2tCR1Z6WkJYQ1p1?=
 =?utf-8?B?QitpZngwSXByTUg4MHZPVlpGWWVlSit1Uldyb1dKZ3JvU0diV0U4L25lNDk4?=
 =?utf-8?B?ckc3aG5XWSt5S1FBNGNyaVhuOEpDWUdVY1ArYXBBREMvWHBnUHZROGJiWmlZ?=
 =?utf-8?B?bjErUXJkWUF3aXR5eGVHdkxGQ2IrOVRuSjNTdXA0WWFOU2lPc3pRTmRXK25n?=
 =?utf-8?B?ZDRNb0NwUHV3L2s4a2d4MUtZY1VOWTZXMWtFQWxRa285ekk4ck83UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b69de4-a69b-45b9-0b3c-08df4add1076
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:15:43.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frs+fAoU/MVm5IDd8PsUWzgZSnMiMuT/FEyL6jMM9i6bmIQ4ScX+OHmUvbsAeSQgXih4BDaUVYfikukyT/ofYufvQr+Obvc7jp2jOObk5qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5070
X-purgate-ID: tlsNG-bad1c0/1795601746-BDAC0034-3AE66350/10/78276251493
X-purgate-type: spam
X-purgate-size: 361
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 9:38 am, Jan Beulich wrote:
> Register forms are supposed to #UD, and the encodings are undefined
> outside of 64-bit mode.
>
> Fixes: 59b18eb757db ("x86emul: support non-SIMD MOVRS")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

