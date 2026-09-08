Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD19C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 10:01:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411249.1641946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3se5-0003k3-Sv; Tue, 08 Sep 2026 10:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411249.1641946; Tue, 08 Sep 2026 10:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3se5-0003jw-QH; Tue, 08 Sep 2026 10:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1411249;
 Tue, 08 Sep 2026 10:01:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3se4-0003jq-N3
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:01:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3se3-00FxW3-HP
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:01:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fdcf5-2eae-0a2a0a5409dd-0a2a450bdada-30
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:01:39 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fdd03-b7e8-0a2a450b0019-d155da2ded77-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:01:39 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c15cf78d1a2so423073066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 03:01:39 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d6dfad6sm582834166b.60.2026.09.08.03.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 03:01:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788861699; x=1789466499; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ptI15inGDkfay3iPU1VaPqGcMwTwBXIm3eQI4TcEhE=;
        b=XXcR03zxrqVlp4tzp+05P0lI6l4EEntHqclTZbp0y6jqkd5kuO+qhHQDCLx3ELBT6F
         i+vC4qQH4y+AxEoduEOIwJ/plhngbiH4iJoCtSD4kgP9oAf8dHATEDnRGmP4IuNYED0K
         ZgwIUElIGAMGVvQU+fFSLlT6Gyqgna1Ms0aPrGgsKOLIfL7TrzcUGDe+4HSoTjBMyI4O
         IYxpOHbXjAr3BU3n+bWNAJ+vwoXdClH9zUGM4pHvillj2GXTTDArCLI17hDkf+OWnhdN
         +tY8Y80vftSRyyzSwC6XA/zaKg5tsvStYoKumbDwYIXUsGhAB5fY8rfjfrBFrmrnc0HG
         L7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861699; x=1789466499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ptI15inGDkfay3iPU1VaPqGcMwTwBXIm3eQI4TcEhE=;
        b=hNUhIqfmuRaitRyocCY4fEOSSFrIqTIefj9MUgWs0Bq3fL0MaEPDz6U5rThQp+Tg0n
         4ALVLJlKOzU0+h55wnza69hOjI8k3b46eAOD8009SWJyO1eE91Y/I+o43hUyQtnnxbP0
         lG4onNRhJZMhCypfFRZa59d0i6IbGPPDnzrkNVhGKdLGDEQIbhnNOdGAWFSRtYiObi3B
         qhZJ/L1fwGqeDwZjrDJYBE3/HNGa30Ux7Up4jXgskYKSZmSAdSd/lnuKwRvgd5MeAb7G
         5MMjylSRtA5GE4QiY8WDtnAbaxaMmFbZh7aJiw+gNUIEalGQbldZof9JN5VPpm1m2pOt
         VKTQ==
X-Gm-Message-State: AFuF++mOMDpaEA+rIzrFXwFhHEZnpqbfZsrUPdl1f2hcrxBcIz+9ZnJM
	S8PCI6hsgTWsw7lZaYQE4gnxEgDJaZiR9+/sn+1wDgUW+lc5SVChqw48
X-Gm-Gg: AYBFou1ADuJZwChM5/OSSnQA1S22aSzojhU0EbA5LxBJWTnwYcRqJjjyvckhYcWXvkI
	OsT0EJM+hO0tQDPHwOUQ7WVUyPZkuSRGv6j/pzBVXkHXZjQYR+7Nu1KHn53JTMMGCF+W1zCKMOq
	olIRomTZGO+oexqQ+DOSFIX++vgVenq6IjBG9iR2SO9MNiFd0oqFNLklD8y9PceoCFu2Bt1B1YT
	isEEWNNrYyCSDW9Kq6Enh45WhUJtweS8Amwpvvaq6HA+hUE7IX22Mt8b/cYEbKOh/Db98/ffwmA
	Bx2PH3LMqnpSoqrYopiljqra3wG0ROjDjXo8Hfwky+fExgQe2/B38GrIEURg30mSdIB/GkJfFQJ
	mDZB6nG6QagSP8b51x7Z3bMdrQTbiLyRJGHLHbxLRJaAF15D5E7Z6l4Avv+qWmX/SpjlDXcTE50
	D7Vgh3qBbf3uGnf6DoNxVOJuxexmDy87Uo31ufMvajyojAlKEAVnn+IX7U1D0pDQ7hISIXy4tGl
	kjvY1KFbK5YqrugO4fg8w==
X-Received: by 2002:a17:907:7a8e:b0:c26:19e3:e97d with SMTP id a640c23a62f3a-c2619e3eefbmr903459066b.29.1788861698506;
        Tue, 08 Sep 2026 03:01:38 -0700 (PDT)
Message-ID: <2f734f0a-7f3e-4e27-82ed-52ccf72fe49a@gmail.com>
Date: Tue, 8 Sep 2026 12:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788861699-ABCD79EA-6722052C/10/73395122804
X-purgate-type: spam
X-purgate-size: 4083



On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>> Some traps taken by Xen on behalf of a guest can't or shouldn't be handled
>> by the hypervisor and have to be reflected to the guest's own S-mode trap
>> handler instead: the access faults which handle_guest_page_fault() injects
>> for a fault that can never become an emulated access, and, later on, a
>> fault taken by the hlv/hlvx sequences of riscv_read_guest() while
>> accessing guest memory on a vCPU's behalf.
>>
> Access faults from handle_guest_page_fault() aren't "taken by Xen on
> behalf of a guest" as those are guest-page faults taken directly from the
> guest's own execution. Xen just decides they can't be emulated and
> reflects them back as access faults. Only the hlv/hlvx case is Xen
> trapping on the guest's behalf (Xen itself executes the faulting access).> Conflating the two under one description makes the paragraph confusing.
> 
> Suggest splitting into two:
> 
>      Two kinds of traps can't or shouldn't be handled by the hypervisor and
>      have to be reflected to the guest's own S-mode trap handler instead:
> 
>      - Traps Xen takes on the guest's behalf: the hlv/hlvx sequences
>      riscv_read_guest() uses to access guest memory.
>      - Access faults handle_guest_page_fault() injects for a guest-page
>      fault that can never become an emulated access.

Thanks, I'll update original paragraph with what you suggested.>
>>
>> Implement trap_redirect(), until now a BUG_ON() placeholder, for that
>> purpose. It makes the trap appear to the guest as if it had been taken
>> directly in VS-mode: the trap information is transferred to the guest's
>> virtual supervisor CSRs and the vCPU is resumed at its exception vector in
>> supervisor mode, following the trap entry rules of the RISC-V privileged
>> specification.
>>
>> Add the STVEC_* definitions needed to tell the BASE and MODE fields of
>> vstvec apart.
>>
>> The implementation is based on kvm_riscv_vcpu_trap_redirect() from Linux,
>> with a few deviations:
>>   - The function reads and writes physical VS-mode CSRs, so it is only
>>     meaningful for the currently running vCPU. Instead of taking a
>>     struct vcpu argument, it always operates on current.
>>   - The MODE field of vstvec is masked off explicitly when computing the
>>     exception target PC (exceptions always vector to BASE), rather than
>>     relying on the hardwired zero bit of sepc to drop it on VM entry.
>>   - Assertions document the preconditions: the trap must have been taken
>>     from virtualized mode (hstatus.SPV set), and only synchronous
>>     exceptions may be redirected - interrupts must be injected via hvip
>>     instead, so that the hardware performs VS-mode trap entry itself,
>>     respecting vsstatus.SIE and vectored vstvec dispatch.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
>> index 2d2e7e11b3..b2071f4758 100644
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -109,6 +109,12 @@
>>   #define SIP_SSIP			MIP_SSIP
>>   #define SIP_STIP			MIP_STIP
>>   
>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>> +#define STVEC_MODE_MASK			_UL(0x3)
>> +#define STVEC_MODE_DIRECT		_UL(0x0)
>> +#define STVEC_MODE_VECTORED		_UL(0x1)
>> +#define STVEC_BASE_MASK			(~STVEC_MODE_MASK)
> Nit: STVEC_MODE_DIRECT and STVEC_MODE_VECTORED aren't used anywhere in
> this patch (only STVEC_BASE_MASK is). Either use them where you decide
> exceptions always target BASE regardless of MODE, or drop them until a
> patch that needs them.

IMO it is fine to introduce *_DIRECT/VECORED here as they are used 
implicitly through STVEC_BASE_MASK and thereby it will be better to 
introduce them here now instead of open-code them and then just update 
STVEC_BASE_MASK again when *_DIRECT/VECORED will be re-introduced.

Thanks for review.

~ Oleksii

