Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E83CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:02:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442210.1659808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPPC-0001mZ-IW; Wed, 07 Oct 2026 11:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442210.1659808; Wed, 07 Oct 2026 11:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPPC-0001mS-Fk; Wed, 07 Oct 2026 11:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1442210;
 Wed, 07 Oct 2026 11:01:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11606beaf0003f66@swg.vates.tech>)
 id 1xEPPB-0001le-EA
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:01:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEPPA-008pDh-Di
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:01:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11606beaf0003f66@swg.vates.tech>)
 id 6ac62698-bab6-0a2a0a5309dd-0a2a4508cf88-12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:01:48 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11606beaf0003f66@swg.vates.tech>)
 id 6ac6269b-f659-0a2a45080019-b9ff1c22a3eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:01:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a11606beaf0003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 11:01:43 +0000
Received: from [192.168.1.17] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E825981FAA
 for <xen-devel@lists.xenproject.org>; Wed,  7 Oct 2026 13:01:38 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=aSZZkSioV2HZ1n7DfrheCNoDkgkMOhWqs5CzorKW/IE=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=anuwEmJAut0Np04wLmk92Qk7O6fiNQkW3Rznpnp4eHpHQfH+8p/C+j9VLkwbwYJ4VSgBMKZ+7
 tBhlbouHDmpXBVst7Tw0tNEEK4Yr5Qhtr5HYAbKm2RVuVgMgSrl7Ub/4+y+Iv1vZ7BGvXiie6AY
 vQ01UArV/w4KrJ2FfJR0uCtTEemTnHtpvBLTAHfL35d0i0Q7I7ksewvnUxgfHa5QEzS8XNOTGbr
 r+GxKWkNP1j1ceoZy7IBmviIU94tHkGEW/eLtD+yrV8qwDoK1P4aTokGBH+t7ZfYDDO2D8WYjEi
 6B/lUQFRLgt6VlhZnPa1g7IdMtUXZ1van5wLrY2flLOA==
X-Zone-Loop: 1d780a8d8004902239c1a81cd51fa76795558e39928c
x-campaign-type: default
x-transaction-id: 8529ca9c-da92-4715-8f8f-996734edac51
x-swg-uid: 01-691bbcec-7612-48ce-8a48-f7e09970ab8e
X-Mailer: Sweego
Message-ID:
 <1791370903.8631fc262581453bbf619ec5b2062170.1a11606beaf0003f66@vates.tech>
x-swg-bid: 1791370903.8631fc262581453bbf619ec5b2062170.1a11606beaf0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 7 Oct 2026 13:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: xen-devel@lists.xenproject.org
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <1791327013.8631fc262581453bbf619ec5b2062170.1a113690c000003f66@vates.tech>
 <1791361284.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@vates.tech>
 <1791364402.8631fc262581453bbf619ec5b2062170.1a115a38ea30003f66@vates.tech>
Content-Language: en-US
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
In-Reply-To: <1791364402.8631fc262581453bbf619ec5b2062170.1a115a38ea30003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791370898998
X-purgate-ID: tlsNG-c1860d/1791370908-CCB7187B-A3484DAB/0/0
X-purgate-type: clean
X-purgate-size: 4447

On 10/7/26 11:13, Teddy Astie wrote:
> Le 07/10/2026 à 10:24, Baptiste Le Duc a écrit :
>> On 10/7/26 00:50, Teddy Astie wrote:
>>> Le 05/10/2026 à 18:02, Baptiste Le Duc a écrit :
>>>> A RISC-V implementation can manage the PTE A/D bits in one of two 
>>>> ways:
>>>>      1) Update the 'A' and 'D' PTE bits in hardware (ratified as 
>>>> Svadu).
>>>>      2) Generate a page fault when 'A' and/or 'D' is clear, so that 
>>>> software
>>>>         can set them (ratified as Svade).
>>>>
>>>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the 
>>>> device tree
>>>> advertises Svade. Platforms that use scheme (2) without advertising 
>>>> Svade,
>>>> such as the HiFive Premier P550, then hit guest-page faults that 
>>>> Xen does
>>>> not handle.
>>>
>>> I second what Jan said (this is likely a firmware bug, given that 
>>> the enumerated behavior is not consistent with the specification, as 
>>> existence of Svadu/Svade alters observable behavior).
>>>
>> Thanks, agreed on both points.
>>
>> I'll reword the commit message: it shouldn't imply that Svade in the 
>> DT means faults will occur, since with Svadu also present that 
>> depends on henvcfg.ADUE.
>>
>> On the firmware-bug point: I don't think the P550 is really 
>> inconsistent with the spec. Svade and Svadu didn't exist when the 
>> P550 core was designed. They were only ratified later, to name the 
>> two behaviors that already existed in the wild. Before that, the 
>> privileged spec just allowed either: hardware updating A/D, or 
>> raising a page fault. The P550 implements the second, and there was 
>> no extension it could advertise for it.
>> Therefore, the DT lacks svade because the extension didn't exist when 
>> the platform description was written, not because the vendor 
>> misdescribed anything.
>>
>
> At least in latest specification, absence of Svade implies that A/D 
> bit is updated on page-table access.
>
> The spec also insist on the no-Svade behavior.
>
> > The Svade extension: when a virtual page is accessed and the A bit is
> > clear, or is written and the D bit is clear, a page-fault exception is
> > raised.
> >
> > When the Svade extension is not implemented, the following scheme
> > applies.
> >
> > (... hardware updates A/D bit)
>
> The no-Svade behavior can then be re-introduced with Svadu with ADUE=1
>
> > If the Svadu extension is implemented, the ADUE bit controls whether
> > hardware updating of PTE A/D bits is enabled for VS-stage address
> > translation. When ADUE=1, hardware updating of PTE A/D bits is enabled
> > during VS-stage address translation, and the implementation behaves as
> > though the Svade extension were not implemented for VS-mode address
> > translation. When ADUE=0, the implementation behaves as though Svade
> > were implemented for VS-stage address translation. If Svadu is not
> > implemented, ADUE is read-only zero.
>
> The specification is unfortunately written a bit sideways, the base 
> behavior happens to be "opt-in" through another extension. 

I'm not sure this holds for the !Svade && !Svadu case.

In fact, in that case, my strict reading of the text from spec above is :
"If the Svadu extension is implemented" then:
         - "ADUE=0 => Svade"


Therefore, in !Svade && !Svadu case, if we followed the spec, we would 
felt into "When the Svade extension is not implemented, the following 
scheme applies [...] -> hardware updates A/D bits"

However, it is not the case of the P550 that doesn't support hw updates 
of A/D bits...


Do you read it the same way, or am I missing something?

>
> But that's specification, and it's possible that firmware follows a 
> earlier revision of it that has unspecified A/D semantics instead. But 
> in this case, the firmware is out of sync with current specifications 
> and probably wants to be updated.
>> I agree that, where Svadu is available, Xen should ideally configure 
>> a consistent scheme (ADUE=1) and use ADUE=0 only for specific needs 
>> such as dirty tracking. But Xen doesn't support Svadu today, so that 
>> is a separate piece of work which I'd prefer to do later.
>>
>> In the meantime, presetting A/D in the G-stage PTEs is the only way 
>> to avoid the faults on hardware like the P550, and it is harmless on 
>> hardware that updates A/D itself.
>
> Looks good to me.
>>
>


