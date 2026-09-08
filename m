Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1787C79FAA
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:58:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412151.1642649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xHK-0002vu-Bb; Tue, 08 Sep 2026 14:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412151.1642649; Tue, 08 Sep 2026 14:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xHK-0002vn-8s; Tue, 08 Sep 2026 14:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1412151;
 Tue, 08 Sep 2026 14:58:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3xHI-0002vh-65
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:58:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3xHG-00AXWe-PM
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:58:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa0228f-2eae-0a2a0a5409dd-0a2a4505a9d6-14
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:58:26 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa02292-4cb1-0a2a45050019-d155da32c5f5-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:58:26 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c259e5c22ffso416745066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 07:58:26 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d036674sm643829866b.8.2026.09.08.07.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 07:58:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788879506; x=1789484306; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEmh4Lqec1cy1UW024Cm5lr7aE+xJUksKB82LS3mPow=;
        b=QTy3i46yJAuPmbVno4X7beKLmxwgIPFaSR/6kwvXODid3eFAaekXohOsPfhrpsOVTp
         itrQJAqoEEJIcWxvUhTeo4zj8amb8z9xVmQsr/8kDq9ChHNvy87AutIqJI5o1hDgI+Q1
         GaodtMx9FaXF2x7R8PWNcIQPn9F6pmVOFJpqXfpOu3r2FHZtQqM1/mIjv+ziayV7gkh/
         Ts25Vzoo5+BN+tcmj6LTUgj8L8YvA0GbWWap1FczXhz3Np4o02NQoN5VB9EQu2mMgKEM
         lURcqO/QLdTRyaOYS2pb1lpS7MyRmemxVeKlmXzPqDSUzhxJBspplpduCe4LZYRgrXIc
         tqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879506; x=1789484306;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEmh4Lqec1cy1UW024Cm5lr7aE+xJUksKB82LS3mPow=;
        b=aME9jm/yFw5SXZtXmlekxwFOj3aB4By+64BOOnSeJS8KInOtIpRTGcsT2OFCVjJqnn
         /a7vV1Sht7iEMTP9iB58dxUR4tA+0yHIIXTBYGkhgPvfnVmzEuy0cHtzJVUcgk4WU3tH
         xluQ8lyAVs9xEh8yUX48XnVsEqtwVDiOIMnDTbd/a4KyOcgzj0dQ5swGbIUP0vYg3Kzd
         b/SNhmPQdzbpKmothKvsrCKLLeY9thV7yppNgrCY3SMWHzi/yksy6UMPeI+pQNST7yXK
         YKe5xK890RXTg7ySeaTaMyZmfR0BQ98K4zOQmg5rNzRjvOvbWV+DoTEXmZjvo6vF+s8r
         5fbg==
X-Gm-Message-State: AFuF++neXjiuviF+JBV1dGjGrIEjNCzG3nG+OEWdsIx6m8KklIGTZgeS
	bLtq/dhy9laKMTzgIo+fuLaQGz3zE+RsztykMzw0DSoeSRVU4TRteE/j
X-Gm-Gg: AYBFou1W7/qbdDr89E+pY0U2S81quXMffUjMEP/itLb0Zwe7rL6JyTMOlFGUbjHmlLM
	uGSo2gzZHAcE/SA4p1Xr8FBpUqFljIEpUoaHoE657aJ8sWRCLzIdIiYc7FLPJ8swD6PvTPsz1ur
	MZztLR06YECXT+8do+f/QDEHPGeE4ONPsPyyyvmO/MafS6KfjatUIbD2KTnme09J8Ja5mUCXQHw
	SgSQJe3/xWdMabyJFgMWGdU4SXxFOQl2v1DJqoWdx9h/5iBr4+sdAcRcap0NCphLYbPu0wCTzB8
	w9ieu4SsRRB9EjkLbgmOrdiD9ilwXGMUAREgpkIR8DYscUIVC+rgCTZbg+v7i2s1tMJmrImnnHX
	al5T3UI79JqkQb7Z4V82k2z0Sc7ILDs8/2Y3FSulj7nCMuPjL9MpTyb0nVJ8ZKZwyUSMrnzOz8d
	TJ0lW3hvS8u3Frn2n8bSFZ4nN0UG82uDWnYgjbO/26gfk0PHVr3RVmQLZ9hmhv5DN7N3q8ggesG
	jN1zZD0Vhc9vdhQX7KgibA=
X-Received: by 2002:a17:907:9709:b0:c1c:4e36:eec6 with SMTP id a640c23a62f3a-c260ca22ce1mr1187731066b.18.1788879505883;
        Tue, 08 Sep 2026 07:58:25 -0700 (PDT)
Message-ID: <72b89a0c-ad0e-4c1d-97f7-92f49ede7a55@gmail.com>
Date: Tue, 8 Sep 2026 16:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <2f734f0a-7f3e-4e27-82ed-52ccf72fe49a@gmail.com>
Content-Language: en-US
In-Reply-To: <2f734f0a-7f3e-4e27-82ed-52ccf72fe49a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788879506-F76BD2A1-40ADE2DA/10/73395122804
X-purgate-type: spam
X-purgate-size: 4719



On 9/8/26 12:01 PM, Oleksii Kurochko wrote:
> 
> 
> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>>> Some traps taken by Xen on behalf of a guest can't or shouldn't be 
>>> handled
>>> by the hypervisor and have to be reflected to the guest's own S-mode 
>>> trap
>>> handler instead: the access faults which handle_guest_page_fault() 
>>> injects
>>> for a fault that can never become an emulated access, and, later on, a
>>> fault taken by the hlv/hlvx sequences of riscv_read_guest() while
>>> accessing guest memory on a vCPU's behalf.
>>>
>> Access faults from handle_guest_page_fault() aren't "taken by Xen on
>> behalf of a guest" as those are guest-page faults taken directly from the
>> guest's own execution. Xen just decides they can't be emulated and
>> reflects them back as access faults. Only the hlv/hlvx case is Xen
>> trapping on the guest's behalf (Xen itself executes the faulting 
>> access).> Conflating the two under one description makes the paragraph 
>> confusing.
>>
>> Suggest splitting into two:
>>
>>      Two kinds of traps can't or shouldn't be handled by the 
>> hypervisor and
>>      have to be reflected to the guest's own S-mode trap handler instead:
>>
>>      - Traps Xen takes on the guest's behalf: the hlv/hlvx sequences
>>      riscv_read_guest() uses to access guest memory.
>>      - Access faults handle_guest_page_fault() injects for a guest-page
>>      fault that can never become an emulated access.
> 
> Thanks, I'll update original paragraph with what you suggested.>
>>>
>>> Implement trap_redirect(), until now a BUG_ON() placeholder, for that
>>> purpose. It makes the trap appear to the guest as if it had been taken
>>> directly in VS-mode: the trap information is transferred to the guest's
>>> virtual supervisor CSRs and the vCPU is resumed at its exception 
>>> vector in
>>> supervisor mode, following the trap entry rules of the RISC-V privileged
>>> specification.
>>>
>>> Add the STVEC_* definitions needed to tell the BASE and MODE fields of
>>> vstvec apart.
>>>
>>> The implementation is based on kvm_riscv_vcpu_trap_redirect() from 
>>> Linux,
>>> with a few deviations:
>>>   - The function reads and writes physical VS-mode CSRs, so it is only
>>>     meaningful for the currently running vCPU. Instead of taking a
>>>     struct vcpu argument, it always operates on current.
>>>   - The MODE field of vstvec is masked off explicitly when computing the
>>>     exception target PC (exceptions always vector to BASE), rather than
>>>     relying on the hardwired zero bit of sepc to drop it on VM entry.
>>>   - Assertions document the preconditions: the trap must have been taken
>>>     from virtualized mode (hstatus.SPV set), and only synchronous
>>>     exceptions may be redirected - interrupts must be injected via hvip
>>>     instead, so that the hardware performs VS-mode trap entry itself,
>>>     respecting vsstatus.SIE and vectored vstvec dispatch.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/ 
>>> riscv/include/asm/riscv_encoding.h
>>> index 2d2e7e11b3..b2071f4758 100644
>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>> @@ -109,6 +109,12 @@
>>>   #define SIP_SSIP            MIP_SSIP
>>>   #define SIP_STIP            MIP_STIP
>>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>>> +#define STVEC_MODE_MASK            _UL(0x3)
>>> +#define STVEC_MODE_DIRECT        _UL(0x0)
>>> +#define STVEC_MODE_VECTORED        _UL(0x1)
>>> +#define STVEC_BASE_MASK            (~STVEC_MODE_MASK)
>> Nit: STVEC_MODE_DIRECT and STVEC_MODE_VECTORED aren't used anywhere in
>> this patch (only STVEC_BASE_MASK is). Either use them where you decide
>> exceptions always target BASE regardless of MODE, or drop them until a
>> patch that needs them.
> 
> IMO it is fine to introduce *_DIRECT/VECORED here as they are used 
> implicitly through STVEC_BASE_MASK and thereby it will be better to 
> introduce them here now instead of open-code them and then just update 
> STVEC_BASE_MASK again when *_DIRECT/VECORED will be re-introduced.
> 

Oh, sorry, you are right. STVEC_MODE_DIRECT and STVEC_MODE_VECTORED are 
really not used here (in this implementation). I planned to do:

#define STVEC_MODE_MASK (STVEC_MODE_DIRECT | STVEC_MODE_VECTORED)

But I missed to do in that way.

I will update the defintion of STVEC_MODE_MASK in suggested above way.

~ Oleksii

