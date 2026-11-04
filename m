Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB2606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RevVNKjR
Received: from list by lists.xenproject.org with outflank-mailman.1472241.1680194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOe6d-0000lt-Oq; Wed, 04 Nov 2026 16:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472241.1680194; Wed, 04 Nov 2026 16:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOe6d-0000lm-Lk; Wed, 04 Nov 2026 16:44:59 +0000
Received: by outflank-mailman (input) for mailman id 1472241;
 Wed, 04 Nov 2026 16:44:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOe6c-0000lg-Rl
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:44:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOe6c-00CwVg-8j
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:44:58 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb6103-8faa-0a2a0a5109dd-0a2a4505d6c6-12
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:44:58 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb610a-4cb1-0a2a45050019-d155802de1dd-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:44:58 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so11075945e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:44:58 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fecac1a1csm4770116f8f.12.2026.11.04.08.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 08:44:57 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810698; x=1794415498; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFh9XNruOl1l6IBdaleaL/z/voJOsGRPAKXD7uXm8bU=;
        b=RevVNKjRhScs++UEVT8116hhT72pRYzUWfF1wz1UXf8YJpL69rnHvpSKFzFLKHxFCq
         Coeh2iMwnuwKQpEWgGgfmzvt3pyTR+nL6SErs+tj5s3zp488ZR4UpxMiIlgOyUTG4aGo
         L2Jdpsl3pKgLrBTxQ4eBsLL/5Pi+fxILYZHqmvrjkY7oOfJGgFH/cMvFpRnjuXWmSC/g
         8JcuQ/BCHhK9gW716sMgfOInNxhpGagn2vaI7i910KmKIu2qphPuOnqeO/KBrmH41//G
         1tscbw8N0GzVBCM7jMJuV3s2tfTc1+wa4WA97vedFARKTioCQUTYXx2tUQWnUsPIBL59
         Yvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810698; x=1794415498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFh9XNruOl1l6IBdaleaL/z/voJOsGRPAKXD7uXm8bU=;
        b=gP++M3bG964nzkokx80ZA395d25kO7Xu1uBs7GSQr7v3otksjMLlT54hrnd1vyMx10
         DFyilTpJ0RiPoaJPq25xTWBu5/eAg+4IXXPkOQ6IgA0u4ZGSQQ3CKX4NcbgjHDFcOoDD
         vs7cnjx0fWWeoCt+PP1nioxki2TW/65nS8pioCXAAKlZwBQACOh0SNsECsd+B6YubqFl
         floozn8bWXJ9BWqSlGmbMzHe6c+rv8plOhI/dVUb6AvwQ9SQ1hS+E7m4teeyEg9KdrEE
         OReE3GzYnzyRI0RPT//x7bWue1Z0VV661XGjbHUVt8ER2gQWKIL7mxuYBu6smVQHtHsy
         vM6g==
X-Gm-Message-State: APuU4Z/YtCUFjpDyC1hQhNOE+OT3ngS9a2N9t5GhzHGDSBUszj26i0bh
	ET5c0R9C03FIePMMw2kASChNNjdr93NlOVqWnjti3u/8OkDgbnFJdQrP
X-Gm-Gg: AYBFou1+y63WB9PAccB4KfhKNbKG3fCJH9Wrsg2d3abt6w+NbNyW9/eT1d48kNIvPWT
	289flP/zexwSo8yXSl+d+jY4l5atm54Jndue+IpWYELXKHY8tGXBLdBPLSY2I8ypDO3aIDC2DH2
	fzp7PH3PvqchuulkUn+5bLGzYTYAPD5absjrjOlCpsd/lAjiG+h8yE1U1EyL67BidBC0FTJefZy
	GZm9W3pFQiBgGEd+QcJbB7G6maov1jXntjwXUGNM9S64kDkTziQmkqhzODdzGaCVmDQUNI6vjAw
	wlI3MGmMPDm4tjLdWrCrwkOhrXUSzhGPjv2mfJRo0dQmhgEAFlTq3r7QOGOaMPW3k37dW5nj1QD
	AIiekVymaOOGJcQnQyff+4HSX9c1drT3KXX1z4VsqSBn21kQTWrSC6JUYHAWexCY0JQdgrsZIta
	9nvkqyzsaA2ex8eDu9VHnb4umkQWS4F+ymcZ+HjZRqcKCWUiMMFo/pGHDvYYkrRk5Zx1URaD07j
	sifkuZnYSy4sex6TD1JpGPxGrSd42mRGBXf0IyO5iBKsu9LB1T5x3wqTptDANIyUQ99hXA2rTtM
	pXagotfvqN3ymlswaPFd2FW5qfi7dOlImDlwz/5jd4vnsRXm7XC1j7LdtFj3RJSuJ4D3Tgc+veo
	59Fm9Ul31SpIswhsFF3HBcTAi
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr384284625e9.4.1793810697523;
        Wed, 04 Nov 2026 08:44:57 -0800 (PST)
Message-ID: <23edf5df-0910-4239-82ab-a28549a7c240@gmail.com>
Date: Wed, 4 Nov 2026 17:44:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/39] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d4304a157181d8a8432b8f65f92019e0ead3bec7.1790779209.git.oleksii.kurochko@gmail.com>
 <9943b1f4-1890-4917-ae39-bf9c70fc36c7@gmail.com>
 <1792671188.8631fc262581453bbf619ec5b2062170.1a1638784d8000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792671188.8631fc262581453bbf619ec5b2062170.1a1638784d8000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793810698-F7CB82A1-2720EB97/10/73395122804
X-purgate-type: spam
X-purgate-size: 3653
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/26 2:13 PM, Baptiste Le Duc wrote:
> On 2026-10-15 16:59:53+02:00, Oleksii Kurochko wrote:
>> On 9/30/26 6:23 PM, Oleksii Kurochko wrote:
>>
>>> Implement emulate_load() on top of the decoding interface introduced by
>>> the previous patch: fetch the trapped instruction, decode it, dispatch
>>> the access to a registered MMIO handler via do_mmio(), write the result
>>> back into the destination register and step over the instruction.
>>>
>>> Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
>>> KVM RISC-V there is no userspace exit/return step and no equivalent of
>>> the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
>>> split; the result is consumed in place.
>>>
>>> Sign extension is done here rather than in the handlers: a signed load
>>> is normalized by a shift pair, so a handler need only report the value
>>> it read.
>>
>> This part of commit message should be updated. Suggestion look below...
>>
>>> At the moment vINTC is the only backend registered with the MMIO
>>> dispatch, so in practice this only covers vINTC traps. An access which
>>> no handler claims currently crashes the domain; injecting an access
>>> fault into the guest instead is left for later.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>
>> [...]
> Sorry I don't understand, did you forget to put the suggestion?
> 

Sorry for confusion, I put it here to drop the code which isn't 
necessary for my suggestion. and my suggestion was just at the end of my 
original reply (I will just copy it here):

 >   static int emulate_load(const struct guest_fault *gf)
 >   {
 > -    /* Transient, until the helpers gain their users. */
 > -    (void)advance_pc;
 > -    (void)guest_xlen;
 > -    (void)guest_gpr;
 > -    (void)insn_fetch_faulted;
 > -    (void)decode_ldst_insn;
 > +    struct cpu_user_regs *regs = gf->regs;
 > +    mmio_info_t info = { .is_write = false };
 > +    struct decoded_insn di = {};
 > +    unsigned int shift = 0;
 > +    int rc;
 >   -    return -EOPNOTSUPP;
 > +    /* A fault taken re-reading the instruction is redirected to the 
guest. */
 > +    if ( insn_fetch_faulted(gf, &di) )
 > +        return 0;
 > +
 > +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
 > +        return -EOPNOTSUPP;
 > +
 > +    if ( !di.is_unsigned )
 > +        shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
 > +
 > +#ifdef EMULATE_LOAD_DEBUG
 > +    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, 
shift=%u\n",
 > +             regs->sepc, gf->gpa, di.len, shift);
 > +#endif
 > +
 > +    rc = do_mmio(&info, gf->gpa, di.len);
 > +    if ( rc )
 > +        return rc;
 > +
 > +    /* A load into x0 discards its result. */
 > +    if ( di.reg )
 > +        *guest_gpr(regs, &di) = (long)(info.data << shift) >> shift;

It would be more correct to have here:

     shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
     ...
     if ( di.reg )
         *guest_gpr(regs, &di) = di.is_unsigned
                                 ? (info.data << shift) >> shift
                                 : (long)(info.data << shift) >> shift;

and update the commit message part "Sign extension is done here…" to:

Sign and zero extension are done here rather than in the handlers: a
shift pair drops whatever lies above the access width in the value read
and, for a signed load, sign-extends it, so a handler need only report
the value it read.

 > +
 > +    advance_pc(regs, di.insn_len);
 > +
 > +    return 0;
 >   }
 >

~ Oleksii

