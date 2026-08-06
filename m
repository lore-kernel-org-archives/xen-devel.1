Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49127C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 11:48:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384648.1627493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrwaD-0000ZP-N0; Thu, 06 Aug 2026 11:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384648.1627493; Thu, 06 Aug 2026 11:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrwaD-0000ZI-K4; Thu, 06 Aug 2026 11:48:21 +0000
Received: by outflank-mailman (input) for mailman id 1384648;
 Thu, 06 Aug 2026 11:48:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrwaC-0000Wk-4G
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 11:48:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrwaB-00F8Za-H7
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:48:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a74747f-5cb7-0a2a0a5109dd-0a2a4503b636-22
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 13:48:19 +0200
Received: from [52.101.85.32]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a747481-fae8-0a2a45030019-346555209f12-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 13:48:19 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB787740.namprd03.prod.outlook.com (2603:10b6:806:51c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 11:48:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:48:15 +0000
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
 b=lgbZqSciwmw9km0Qt+B6NDfLVd6aZdTKWwFbDkpFyRnZWoqpb+fHU4JKlewRnMj/pimoi6Oi0xazZyuDqQpJth6sqsI0r0q9tvoi+v9eczouLLPX0aNt/VIjv4lcIu2y1jTdDYkKhwv7nndRx8gQ246UwcKsFaBsW08rDvWTzhoFYQiuuleGHXheOo+9CHjSzlReDyQYAv8lI2drtYs3EtW2pWzneihwGy3MJPx+26RpEl4Fs/hTZIPv8VEor9sYV35yG7d11y9M6+6Zv8cIeOzV0lRFmDunJqrAFR3SMfK3Z83Udw8/cvgzmbD/rudMLoT8OVIbLne8RIcmTzYgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJHuwZp7A9ScOnrOoEHuY8gDSLlZRB842wSSW8st0xM=;
 b=PWp8jLelefc3sVUBuaW/wVkfkwiuDtrR2gEqh0WpJ9utr9FjQ8+8bFK+KOubMbKoiENaSlsuS9tXRF1ubCxKjTBbV8b3wg4hocFwjZFbKyAsYvvStKMRVN7q6gQetMNvUUS9JYdPQJoNuSpUwe3bM4K5bxOBsyM/AYjK4C7rAYXKDdkBLWVkyXwJK9Rat10OwWHYpGx4HB/YI2gSRBDOdMaBlJkOqI4qaJOuh43Zhdc3bTYjzWBqd1IZ9VHz7MWqjdbI7KrS51lRms3d1DWiQhTbHAS2Do/4CJoTQ9TxRTiofw4HaCZ5NsOaKPteAKOYkk0lzktEtSFX40CYg7vV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJHuwZp7A9ScOnrOoEHuY8gDSLlZRB842wSSW8st0xM=;
 b=GhBOSebTaZyHoyJ6msnqSO4XU+KC+RfWFtPh0dmMfji0Pz2ItEnyuBo8XmrUvCw0/r3pw10gaEnMhRpAJLiHo8ojacYeiyPXmfvNQ5hh4hNhFqp1CROOApoIuREi5Vt70IFLDMJ2Le7ysssLAqH56IGp3s87PEGvTpTsZngnzlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c510770f-33e5-4b85-a52b-67bb776fb70c@citrix.com>
Date: Thu, 6 Aug 2026 12:48:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] xen/vpci: allow unaligned accesses by the hardware domain
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260806110401.19615-1-roger@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260806110401.19615-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB787740:EE_
X-MS-Office365-Filtering-Correlation-Id: cb437712-bc1f-4dae-0aca-08def3b099ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KnHUCbxltax4cC4T5QGZJkHVekeLRxupPAWrSNxVoICfzqx4HLQ2Mo/Kxtv+xzjF/vLP3meRvHEiUMk8qjBhB9IFjLjTR9oxiWvcFty6uE8R8fI5nRnib4TL4GkwfJAoVKV8V5AJc7tl5K01kD1dK+S1D3NGPWL99JmaGKtAhgXIjhJZcs3e2tZ0NIJPIgMDrjWwS/I8bqt3rby98fhA00qDZxBqx5uWtRmfcFJ3rwDL4f+sBnFLILLFvSzZDAC09UnK9oEV6HOX+I26MTsm7PYveTDe3Gc9t0PJkSKCeMsASI1/oZBMaZ5+9vXQr67q7JAks33cGaPoNg3J6sl410bXh2r551tDHfBUn2b2Kf4xY5byGOeEZsuUkTti1oT2ks/2EKJxN56G0Yq3UbKFDVWCpA8pN8KwxMBxsWNqWp9JBAjGc0FZRZGJK7s6Orjcyhmks0RTpLA+oEj0AlyIbwKHRua5Y61p1LxzUipXPAQ0kx/dxuCcrgajFdXNuSHfTeUQMd1/2gcORRfL4ErL1yCATXjujs73f0/LtQRv/jdt6HDwREvuh++0+o6QhdOKa9Dyv/ZTbH0eq6oIGsz+uCbHXJS/NqZFZGdAEVh1t19+ATB4yoZd3JtPtk7TRtZLOaDWRKHcaCcRNT1QTncawHzQKi6eRmMYf3Z/geH3pv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBZaWJ6akVyMk9QaHkrc2cvTFQycUFVSjN5ZHgyU2g1aXZhVEFDaGFpYmhK?=
 =?utf-8?B?ZURDTjNMTzc0NW9PN3BIbk9YRCtEWi9IUmNZWlVCcWpXWUtRQnRsMm5IVHJ3?=
 =?utf-8?B?ZVBTUFlIRkE2U2FrMEhnOVFOUmZIYUxoK1dGb2R6K0pZTU5mWGcwa0dLNzJm?=
 =?utf-8?B?dk8rSy9YeXNta1psWk5qb0ZlSFNCRklYSnc1SlBlTGJTMFhIYzBSb2I0ODB1?=
 =?utf-8?B?bFI4d2hqcXFhV1dpQ3hVdCtJZjNod05Xdm9zRktpRkllajdOTXE5QktpbnZX?=
 =?utf-8?B?eld5UGlwL3E0bjhleWZFczlYSkhhNmdJeWY3U2hib1p0UEJTaHFEeHUxV1BZ?=
 =?utf-8?B?Ym9LWUIxVUg2MStiOUpZQTNzTFIrdEJUU294U2owK1ZrWE1iWmt0L0xFN2Rm?=
 =?utf-8?B?a0FFTC96NFdaRm81ZDdNdEwyT2xPK1NnL1NXUWJqaXJld093WGZDTFZES2xH?=
 =?utf-8?B?NUt3NjVyMVNucGtKSGNtbFQxSEE5dkNJbzVUaDQrMUxyaHVDTjV3U0lKN3RG?=
 =?utf-8?B?dFBVbWFyMmhLVEtqUnFkRnkvRWZjdkRBOVZ0TjVwTUdBNWpmckhaaEtsMGRn?=
 =?utf-8?B?bEdnTFdyODlEV1pmWHFXaXpoMFVndzFYUWt6V3ZIWEt0VmJ1YzlhR0xLWkxp?=
 =?utf-8?B?L0pYWTNxSHQxTDhyV1M2c2dlMjZLN3ZBZWxiL1JQSTNnSDlIYVVvOTkxKzlt?=
 =?utf-8?B?ODN6dHM2VHM0V242Sm9xYmMxSzJYQ3hkQUZacDU3ZG8vZ1RiTE5JL05ucjBu?=
 =?utf-8?B?MHBwdlFQcjBPbjdrN0FWMlFEYzdaNmNmZ0VzRXRqUHBUQzc0OWllTnVtVm9h?=
 =?utf-8?B?Vm5NUGxESkU2Q0YwcEs0cTZZQisveDJnSXZoMC9JQmxPUnFqcldROGE0OTZG?=
 =?utf-8?B?bWZCaGRGbUszRFhQdWROcEJ5cnRENTlVaEhIeEcrUWI3YXFUSWhxMllHZ2cy?=
 =?utf-8?B?WHN3bkVhK0VPcHJpdVZFellxdkpZaGx0MDZkYmhjc2hld2JXQjRMdURLNitm?=
 =?utf-8?B?VnJIM3k2NHZuQWhpU1h4YnhzYnZROTN4ZWVuSU80STVET05sOXVrMHN5eUdR?=
 =?utf-8?B?cWg1RGlGNVBYOURVekZmbUFZL3NVRFBWY0dTRDFiemQ4WXpGVHdnVGVVU29C?=
 =?utf-8?B?YW5OeDVMbnA5MitiT3c3ek9UUDg1ZW92NksvQm10bWs1ZnlsQWlQaHB1RjVC?=
 =?utf-8?B?cWE1UUdHc0RwcTRqb2VjaWdhR3FrT2VLT3VWR3FHcFZJaDBQQnRtTkhtbVRt?=
 =?utf-8?B?cnIrR2pKRXF4eWI2WWdLajFid3luL0l2VXp5d3pEMlNNeVlOaEdWTVFMMFdt?=
 =?utf-8?B?T0NvZStHcGkyOENxWlIzN3piZVdVTDZoWFN2cGQ5WnpnZzhxSkhlZWxaeElF?=
 =?utf-8?B?ZEJLUHVjVzZDRUlDN0Z5YlMvUkRNNGY3Y3JnSnJMaHQvVWhsUDhTTTd6Uzdi?=
 =?utf-8?B?bFY0THFsMkZOdjdzaG8rWUx0L0Z1UzZGVVVoeW8yMzZjTVQ3MDk1dFAwSk9Q?=
 =?utf-8?B?T3pLREEwYUgxcDZGN1ZISWZRa1lpYkxsU1NLc2tSeXBDV2NIK2pxcnJZTkpx?=
 =?utf-8?B?R2RDT1NCaGhoVzNTVFhvM1hrUmlPTXFBSzN1Vk5VL2JmbkhzMUJFcTJuRk5F?=
 =?utf-8?B?RjZiUlpCVkVIdmhBQWJtYmM2NlRRQUQ1OFFXT3AwOS8yRnB6ODVaYjFYZ2U1?=
 =?utf-8?B?c3Mxc1Fub2NsLzYxVnBZcUxRUzRpWWpicUYwVnFaY3RpU2EvdmMwSGthYXZZ?=
 =?utf-8?B?SjluOS8wWUF0cTRDT2l5Y0NnV1Ixb0loWkVucHV6ckxyV1dTd3cySFZJUHNa?=
 =?utf-8?B?WTNtbkFCT0NDMXJXY2FwZkU2ZWRZaEFxc0lYcWdrWU5SVTJLay9ITWxROGJO?=
 =?utf-8?B?Wk5WWW5raE5NYWJxczYvQmZ1VGJsNWppN1JGYkhnSW1vTWRISi81M2JBejYz?=
 =?utf-8?B?UkRvUWJVSmpuTEtjanoyOEI5VTYwSHc1K29Ja1RGVWt3bVhyRDRyWEl4ZjdU?=
 =?utf-8?B?clVITXVGaFh5UXNLQzJrNW1wTTBhRlE2ZTVSRlhWaWIxcERFdnZML3luNGVL?=
 =?utf-8?B?L0hzZmdOS3FzWEl3bVFvQ0dWMTRrUGlycmI1WCtHU3FsdGJ1OFNQYTBjNUh1?=
 =?utf-8?B?d0YvZUhaTlhYM0JoN0xFaitMR3dzTDAxdG9PMjhFcTlvaWlqNmdUd3Q3akdu?=
 =?utf-8?B?YkEzTEQ1VTM2YUpiZE9JaGlIUTA0L0JnVVg0SmdEaHFMZVF6eVQ2L3hJWkxW?=
 =?utf-8?B?TmM3S1J0Tjd5emxpRFBtcU5XYVpNMVZua1JTTjVZR0pZS2JYdVFreW5oNHk3?=
 =?utf-8?B?VU1kTk11QlV4dlpudHI3RUJLOVBIblkwcTVDeFdSZ2I2b1FHQSsxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb437712-bc1f-4dae-0aca-08def3b099ba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:48:15.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2IPFVcHoZWWeThh/Lgr9TA3BrPy2/TrWu5zomY+Q9RCTzh1TkEqE+8+Xjur2AOpkiaKcoLf3g4e8sqzgpeFW/KBEny7Ql69Zl5vHRdYwfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB787740
X-purgate-ID: tlsNG-33051d/1786016899-6F8C54E9-DF4E9F66/0/0
X-purgate-type: clean
X-purgate-size: 3001

On 06/08/2026 12:04 pm, Roger Pau Monne wrote:
> It's possible for domains to generate unaligned PCI config space accesses
> when using ECAM, and hence vPCI should support those at least for the
> hardware domain.  Such unaligned accesses to the PCI config space have been
> reported to come from ACPI logic.

By this, I presume you mean AML from the DSDT/SSDT ?

Misaligned ECAM accesses have undefined behaviour.  On a particular
platform this probably means implementation defined, and for an access
wholly within a single devices CFG window it might even work.  But,
misaligning allows you to have one access hitting two devices, and this
really can't be a good thing.

I presume "fix your BIOS" isn't on the cards, even if it would be for
the greater good?

>
> Relax the checking in vpci_access_allowed() to allow such accesses for the
> hardware domain, and fix the handling in pci_conf_{read,write}{16,32}() to
> fulfill them using MMCFG.
>
> MMCFG regions are identity exposed to the hardware domain, and hence such
> unaligned accesses can only come as a result of the host having MMCFG in the
> first place, as otherwise MMCFG won't be exposed to the hardware domain
> either.
>
> Reported-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> ---
>  tools/include/xen-tools/common-macros.h | 2 ++
>  xen/arch/x86/x86_64/pci.c               | 8 ++++----
>  xen/drivers/vpci/vpci.c                 | 4 +++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
> index 8d33429103b9..6298141c3ca7 100644
> --- a/xen/arch/x86/x86_64/pci.c
> +++ b/xen/arch/x86/x86_64/pci.c
> @@ -26,7 +26,7 @@ uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
>  
>  uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
>  {
> -    if ( sbdf.seg || reg > 255 )
> +    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
>      {
>          uint32_t value;
>  

Personally, I think this is making a bad situation worse.

Baring quirks (i.e. K10 era), there is never a case where we want to use
the IO Ports when we've got ECAM.  Furthermore, on AMD systems when
we're lacking ECAM we can still access Extended Config Space; something
which Xen currently gets wrong in several ways.

The IO ports require a global spinlock in Xen, and then a global
resource in hardware just to be able to translate the IO access back
into the ECAM access we passed on originally.  i.e. from a safety
non-interference point of view, you want to veto any use of the IO ports
by Xen.

Xen needs to use ECAM, and only fall back to IO Ports if we think there
isn't ECAM covering the target sbdf.  This will cause (mis)alignment to
get fixed automatically.  It will also be a substantial perf boost in
the general case; all the MSI/MSI-X editing we do (far too frequently)
is in Legacy Config Space just uses IO Ports.

~Andrew

