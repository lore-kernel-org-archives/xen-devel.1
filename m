Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF5ACC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 10:25:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450207.1665696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHIdr-000449-B3; Thu, 15 Oct 2026 10:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450207.1665696; Thu, 15 Oct 2026 10:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHIdr-000442-8D; Thu, 15 Oct 2026 10:24:55 +0000
Received: by outflank-mailman (input) for mailman id 1450207;
 Thu, 15 Oct 2026 10:24:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xHIdp-00043w-ME
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:24:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHIdp-007Xhp-36
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:24:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0a9f2-e002-0a2a0a5209dd-0a2a4506b7d8-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 12:24:53 +0200
Received: from [40.107.209.50]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0a9f3-195a-0a2a45060019-286bd132d0d3-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 12:24:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5042.namprd03.prod.outlook.com (2603:10b6:408:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 10:24:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 10:24:49 +0000
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
 b=aRtGmX3Ty58lWncRroMh722zB+G6sBobBrtS6LxvzpJy6G8pnP+teHKFmIZmu1B/7xCvNfuunwTKwnPNgNacRMV/aUFFxiq/CNXqYgkIcOC+YVBIJweEUHA7XuSNHHVF6PGe4x7Efmp2kQFqX0q3qvGKeLnuRDU8+6FFEiUQElDFJZmO8WydwBNFIPJfgeC8hXbMXJWIuWMoPPU5iUS/sQoUgKIHuLFkiZBsdkHkJE83k/BgI4H13hXlEADRqTjT6G9+AfmfZPrlGKxs4TtPCjQ9whu3KkXn1FJNRQ1Pki+vgZJnePDyQx5hnyoNX7rG9ibKV6fQ2UK8HZk+DMHjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jGpdqPUhyIPQ/EBqhacEufO6gxtrXQuZjIUXpQGaj0=;
 b=qT9QSToq3V/Aeb+7esmwd3VealRm/eNOSQ0P6+FiYYov18e/oGyRQrmP2w3re4gIFffx/o7ecHPCfkmzvHsfJDneCecj4ksRI3e42oI3EimfMMS5Y+yNfi6ApkwbUy3WsxYGhCbSW70utn0ciWrzEWe3iok13lDwKWSdnfUJF+rORC509Ggcg6rPQ6q3be/46tVNatMhHeYL1WgV50o1VU7sPkP/94rbeuFRmw0XAsKOwUBiTADZ9r4HUQKkX0ammwIfcUtMeeS5XBxZsmFKmSCdVQbD+3rg1JWzvagYzL3Cyzap3dvplC4QCoQgjdp3T/Ll+9CZV+GWT8fEWQY41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jGpdqPUhyIPQ/EBqhacEufO6gxtrXQuZjIUXpQGaj0=;
 b=nAl0vafLje9w1Brc/ZcahoSwzsNBQdpnYzv2Huj8vc7rMiqb8gUIDDTykNrzC6nyhVZHjEdjGpnY70w6/7WNgWSIRUyVITtQv6GJjQmSJMznXQKk+wxLb4vXjupAyzNhzt42V8LecaGnCDADwTnjmnTEQISqj3urCIAGbMkfxQ0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bdc00337-6197-40e8-8515-6e4c0024c0a1@citrix.com>
Date: Thu, 15 Oct 2026 11:24:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech
Subject: Re: [PATCH v1] x86/nestedsvm: write back V_NMI and V_NMI_MASK on
 nested #VMEXIT
To: chunjie.zhu@citrix.com, xen-devel@lists.xenproject.org
References: <20261015074512.221777-1-chunjie.zhu@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261015074512.221777-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0201.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7c7403-0b36-45fd-d771-08df2aa68af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|10067099003|5023799004|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	284VhRlO8/gOSfolP1KsglshBDvoc69WAajQo83OgVfGl6M7eOxOjorMsV92NN3v4NkfUPcFWHGAiAGNbPXTUxGyfshZNt3z2S3BIlbrXhRtJERlr8AS9gU/po5SlHeRmrduZ2ulaKWIYbFF74hHGNg96jiHl1lvIqVxgvVtaHvBOcZnZf9wYOk2yvrf0CYX1d5JTZNrJdP5Mv/Z6W8xu1MkM0pmkK+IVPc0Dxmk0PBbXVKVJ6MAjFNwQ9JuqqLhtRnIKiaMxE5GjLlt9FvxE+tlbb3d7FrcOI1XqE5D9P8oITZv8oeT92vjXQ9tXOe0+peNPPFsA414G1zbt1Yq1PavH6O1FiDmS/YSv++WhjYj0jijsalIZlhuiXCtp78I5GZ1Thj0x3KOCbcVvofZMbiDkryxj/rWxYp5L5a99W7TbdXqg6MAUUDOfutMt5UyLRGxGmCvi8cXj6moIzJCZXJSEduz4uZa+yinMgP6LbYZFuINdx4QmQkPjoQvREKyANKYiUGzNCxkcqmKXGcnioLwaIrwj8Gol++RwH96wBpWGw3eJwScnk/cjqH74LB0ACg9p3I9bflde717bfh70004HaeDg6yY1QVNoAewBweEsQpJfvhYOW8kvbSVYv7EfRTmQ2r3jszkO9G+2A9IYUaj3CRXaE90td8piJNEvsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(5023799004)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emlUaVFLdlFMWjJOSlFUZ0gyaTZCVFJXNTA1ZTNCVWZiMmpDN20vaklyUk5l?=
 =?utf-8?B?OFlqdHdkQ1BoQ3MrMVVLb0JGUDU0ZXNma1dNUFN3REt2c2lheGdodFdXclFa?=
 =?utf-8?B?anM2ZWR5NEJtelZrdXVmN1E1VUtLTWtrWGRGRElwaUNod2llenB2aG43RU5V?=
 =?utf-8?B?K3FjQmZldHBkRlU2cEVHalNBSmxuZUdrbjI2cVNicU9tQnduN2NTV3lRcnBH?=
 =?utf-8?B?dWRDTzVtbXFEbjNYQ2NabDJaV05DbWVoZFRYZzdrZnRNUURVTFFNLzU4eSto?=
 =?utf-8?B?aFRmUWtqRVZLVWwrZm9Yak44ejZBMVRlM2xEN1d0QXhXRloyelBvakVab1lN?=
 =?utf-8?B?YXMyQm5yWEwrS002ZmFwdDZXV1dZSytEeXdUNFpGL2dRWk90eGZPMmNUamlR?=
 =?utf-8?B?OHN4UlFyVkQ4YndVejN0MmZINXQxek9wMjdEbGxwOWJKOTR2bWhRTFRUdU5W?=
 =?utf-8?B?Mlp0ZEh4aDE0QVJERkVuNHdhd3ZUM2dNaytyUzJaZHJJbVpOcUZmWmNwaDJF?=
 =?utf-8?B?ZHJ3TUJjOTVIMDR5SHhDcVozcFpJck1XRTRZM09oaTFxUnY0UEhzN2lRbk9w?=
 =?utf-8?B?em9HOWN1NkZPRlVNWjMyZkJFMHpWN1dWSG5kaFhrQ0NuUXJOREpFNDMwL29v?=
 =?utf-8?B?dmNLanFOYVBXRzg3dGtNRm1Ka1Q2ckpqTGhueDYwZGJ0T3haY0hTNnhuSFdL?=
 =?utf-8?B?VlFmUlB4VzFDYThKV094ZU5vVERzRU1GZ3dXTlZpYmYzU1pQTHpDN0pUTm91?=
 =?utf-8?B?SiszZDJRT05VemoyZGNBekhXZXdkaWgxSXJ4T0FuMXE5Tmt5a05TVmp5N01N?=
 =?utf-8?B?Q2swbDRYNVdpOXUxaUhlcXRFQTVNMGJ0ZlAweWxVenFmdHFxTW9BZ0JIb0g4?=
 =?utf-8?B?VDRaaXJFNHJDNDVHOHc2QXVONHY5b0oycmFkYVpLMDB6dS9nWDh2aVNjSWY4?=
 =?utf-8?B?WEpLMkt5NktzZDErbGdHM2pFSTJLYTZza2U4ZWVTVFRJN2lsVlIwNnBTZ3VR?=
 =?utf-8?B?dEZyb0o3VTAyRkFCbm54MndDaG4wRkN4aDA3aklUajNjdlZKWXF4dG1WdUFo?=
 =?utf-8?B?bmRkTHVjVnNHSHJKakE2b1ZTTVVJd0xhbTNmZ1RrcEQvWjR3WGdkZnJGSHZi?=
 =?utf-8?B?SlhYRDlSTENpVFViYk1LV0dHUWwwRFBBUWN2R1hoUitCeUQrM3R2WjhkcGZK?=
 =?utf-8?B?TFFQbGQxNjF0WVlCT2llbmc4MmtMdUNRazlBNjBVODYzZ2NqM0V1SEppbjBy?=
 =?utf-8?B?Y3R3N3VoK0FNNlZQV2JuY3RFSnh5aTdzNlV3dS83OEY5UmxXcnRQM01ERE1v?=
 =?utf-8?B?UVcvOUQ4OFordU5DR2JmYTB5bkhPdDZ0WmZJTjFaV3lISEJYdlV6UDd1cFZL?=
 =?utf-8?B?S3J6bWJ6V24vREprYmNiSloxWU14Y0djaWZtK3czOWVGZmZJRjAybDNENGRZ?=
 =?utf-8?B?ZVVTV1pOQnZvUGNtcXNmbUY4K1FmeE03Y3Z1VytaeVExUUVETDVWTytsdllO?=
 =?utf-8?B?MmdvaFk2UjB1QXpZSXI1c2ZiMTh6S21HelVEeTRoVHREbGR3SnljRkdDcG5M?=
 =?utf-8?B?MzAzbGhaT3M4MmMzOWFrZDY5YTE2NWFvY01UQURnNHEvbzBjR2R1dGxhMFpm?=
 =?utf-8?B?NHcyVHJ2UVJVc0lLRnNKYXJuM1IrL3gvOWhkR3RWN09RRjQxdUhkcHdrNzB2?=
 =?utf-8?B?MkdjTXdXM1pkKy9oOURRZTE2bTYwSnRZQW1sUWdtUkZQYks0NWhhS3g0MVR3?=
 =?utf-8?B?aDNiZ1NUNHArSzZGNzBKa0s3ZGFuRjNFalh4cFgzZDloWGkyMGhwNWJEN25w?=
 =?utf-8?B?ek9qakF4ZU5QNUE5VllGYytiYkdBTTg0SENDVS9GeVB4MGFaQXp5K1ZjWlFw?=
 =?utf-8?B?ZE9xMEloSFM4SENQc1RZMmNtVGw2cmJ1eGxIUjJTNXFla2t5Tk5jenZWYmo2?=
 =?utf-8?B?cDJCc3pFK056dzFoS2psUWhnZDVrVUpicjZNME03SEpQUEtHemNiU0FkNHV4?=
 =?utf-8?B?em10cDYreXBHU3AzOUpGZGM4L3VkaUIydjNzaElLanFNVXI5NjEvSUxFemFW?=
 =?utf-8?B?UnhlcVRja09TUDdOOHFPVzhia2t2cXlGUTd5WFZpU3ZPSEE5V2xhSk4zdEpO?=
 =?utf-8?B?WW9sSXo2UmhldGpvVmI5UHk2WHhhK3FsT2VidTVpV0dNUjJmRm1CdkV2VU91?=
 =?utf-8?B?cFZsNFhFbXZrWnc1OXRDWjRacmJSbWFoazcrVDk0M3Q5NHYrQzUxb1ZzaE44?=
 =?utf-8?B?dHdXekc4NmNlNnI2SEd0V2U2N2hDR0RkM3B5WURoK0hzM2ZqMWYyRUtDMHhl?=
 =?utf-8?B?SkFIRndPeGVQWjJaeHQwcUQ1dFBodGtUdkkyL3hBbWpLb1dOZ0t2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7c7403-0b36-45fd-d771-08df2aa68af0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 10:24:49.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q27qVDZUsROcPuK9Q8v7NyrwKepMTe4tmC8tnKNT+kUlttLheMb2Ur/PUx5dqmGvN9sD2ga940/slG3CzNk/ags240oVjOYwxZwYLuodf4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5042
X-purgate-ID: tlsNG-16d1c6/1792059893-FEA7477B-A00D30ED/0/0
X-purgate-type: clean
X-purgate-size: 2409

On 15/10/2026 8:45 am, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
>
> With V_NMI_ENABLE set, the processor clears V_NMI and sets V_NMI_MASK when
> it takes the virtual NMI, and writes both back to the VMCB on #VMEXIT
> (APM vol.2 15.21.10).

The processor also does the opposite on IRET.   Really, what you want to
say is when V_NMI_ENABLE is set, the processor manages V_NMI and
V_NMI_MASK automatically, and writes both back...

>
> nsvm_vmcb_prepare4vmexit() only propagated V_TPR, V_IRQ and (conditionally)
> V_GIF from the L2 shadow VMCB into vmcb12. V_NMI and V_NMI_MASK were never
> copied back, so L1 kept seeing whatever it had last written, regardless of
> what happened in L2.
>
> Copy both back when L1 has enabled vNMI for its guest.

Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")

> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/nestedsvm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index faacfe007832..ecd89eb43f06 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1027,12 +1027,18 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      /*
>       * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
>       * 15.6); the remaining fields do not change.  Copy vGIF back only if
> -     * enabled in L1.
> +     * enabled in L1.  With vNMI enabled, #VMEXIT also writes back V_NMI and
> +     * V_NMI_MASK (APM vol.2 15.21.10).
>       */
>      ns_vmcb->_vintr.fields.tpr = n2vmcb->_vintr.fields.tpr;
>      ns_vmcb->_vintr.fields.irq = n2vmcb->_vintr.fields.irq;
>      if ( ns_vmcb->_vintr.fields.vgif_enable )
>          ns_vmcb->_vintr.fields.vgif = n2vmcb->_vintr.fields.vgif;
> +    if ( ns_vmcb->_vintr.fields.vnmi_enable )
> +    {
> +        ns_vmcb->_vintr.fields.vnmi_pending = n2vmcb->_vintr.fields.vnmi_pending;
> +        ns_vmcb->_vintr.fields.vnmi_blocking = n2vmcb->_vintr.fields.vnmi_blocking;
> +    }
>  
>      /* Interrupt state */
>      ns_vmcb->int_stat = n2vmcb->int_stat;

The patch is ok once the comments are sorted, but Ross has a pending
patch removing the "fields" infix.  I can take care of this when committing.

~Andrew

