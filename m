Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28F606D83D
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agHyRmfl
Received: from list by lists.xenproject.org with outflank-mailman.1472249.1680203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOe8M-0001F7-3b; Wed, 04 Nov 2026 16:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472249.1680203; Wed, 04 Nov 2026 16:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOe8M-0001F0-0i; Wed, 04 Nov 2026 16:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1472249;
 Wed, 04 Nov 2026 16:46:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOe8K-0001Er-MH
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:46:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOe8K-007mur-3G
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:46:44 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb6166-bab6-0a2a0a5309dd-0a2a450a956c-18
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:46:44 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb6173-f2d2-0a2a450a0019-d1558030ed2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:46:44 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso8364365e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:46:44 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec9cd40csm4791391f8f.13.2026.11.04.08.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 08:46:43 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793810803; x=1794415603; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilgnMHOX8V2Ck18VdxJ8LoPsXSjyvGiRkOyNPRe5n0s=;
        b=agHyRmflelse5XpVSqV9D6Ar6bNUX26BQK36jIlMoAz/M8NZ3lxL18uEcROtCUNQuL
         EtaBPVZ01GH9SVxeugU4iRHaQz4+gzYk9nJJyUa0sDxctmXAQM3kQCjzZjmBF8BwkmL7
         SCzZHeId99GMMw81vuCy9h4CvfZOOsDfyplAxwv28tepYRz0VlW54+HmtoqsZIx6IMI6
         P0WS3nMAipz+qJf+d1JpxRvuQQlP/BUdwvbRjFUQG2ZBRqowA8Zk/mCPEIAtVFEj5AGq
         694boTFmYogsnIzrlyg3OVTaXCYgsHo3QyjfbeaEmWKP4qR690tw//CoSmCQnOG3IMJy
         lZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810803; x=1794415603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilgnMHOX8V2Ck18VdxJ8LoPsXSjyvGiRkOyNPRe5n0s=;
        b=t6OlK6e5BHS91NlPHevCv0YHKy+MPMnpRmh67cB4UNBgHW8i628VzSFbPrvQK8TArV
         G26ue1aBLXDcw744bnzWLgMUMLcUj5LCWc6wYHuQhR1RdwVCYNaZgwusJw9Vk/81EoqV
         xzMnryhEPf1pkNXIsvoyhdG5ZM4U/zlFxQSx9DBejbjG15bukLikfgR4RNupDfvcL1QC
         GbotQc8G28zbsHashaCWvJgcxIUB6OB1M0DRWAovQXDmUbFUIlgZw/OR7Jd27Vxyq4IM
         nQqNZaJ402np6wMAm/CFX8uZYwoYTLNt9OZ8QDPfcSt7ZmOlOTEg+myrjY6lQnztIADe
         2YOg==
X-Gm-Message-State: APuU4Z/PX7ZEzm0PwlRixy5jy8y9WtpF2hhaG2wyLWBNS+DQvbpwcOZH
	Ks8FkUG5/Aur+2VJYy+C00iuz6vynh9VhO9uxe0hQaP3ETL7pYx+KrqB
X-Gm-Gg: AYBFou3wCVbHU0AD0RhQ9hL1VrLp3G6A+ukOWCT5LVV845xdQZ8NkfMMU6gyLxOcEH5
	DZKmKfjJB8UpXeuHU6bpMIEkj02szBlbwCBxtZDukE0CYTWK2zSu6dvB0xfPsPUYN6mbh59kIPU
	t4EIZ2/+I+/cemLv8Eo3jU4rrNJ8tGwpxa9omL877AZI4PXYdyACvmTmFlcnlu2NHJUHNL1qULc
	H4zNSzMrQHqqYI+VvBaSZaTuu3aAaiHFrULNsa+c3boW9QqBgNKDGvLEnn9Z3xFCGc7Xc8UpOFs
	v31wncnrJN+Rmw3ZfQ3pW3ISsNfdyy1J5PWpm4ti0YRhEw1LOHo/eFetxQX6DiK3+eAXRhohtpN
	kEzS09Hhj8lrIHb/lHVB8pJij8CauDXXiW5U2Wa/yX3NEu5GUW79RsLgLMObjOIuzXZcn1nVvPq
	gz/j+wuiW5Bf9gduukSbkGJhblrAXlyoxF74/srmu6JJWv2hTLeSw5/gQ8Fo/CLEVJDNIfjs3Q1
	CMnaJJ4iqUVh6ydxQl/A9FV+IkCF+AzR5BKGilaLfnNieN3qTsnyQvwMPSvmcewqD0rtTuFu1dF
	FgWkbafkRE915DDgxV5oNhFD1QqzAV1p4hyHyW2pCnsgl6NTe+nSd/9HbwKBBZWCIhSmq6KsuWL
	6LwY=
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ac1899353bmr369165235e9.31.1793810803506;
        Wed, 04 Nov 2026 08:46:43 -0800 (PST)
Message-ID: <75a5e61a-f68c-46f2-82ba-fac1767b69d2@gmail.com>
Date: Wed, 4 Nov 2026 17:46:42 +0100
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
 <1792672239.8631fc262581453bbf619ec5b2062170.1a163979000000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792672239.8631fc262581453bbf619ec5b2062170.1a163979000000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793810804-52ADCCFC-689ABF2C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3665
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/26 2:30 PM, Baptiste Le Duc wrote:
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
>>
>>>    static int emulate_load(const struct guest_fault *gf)
>>>    {
>>> -    /* Transient, until the helpers gain their users. */
>>> -    (void)advance_pc;
>>> -    (void)guest_xlen;
>>> -    (void)guest_gpr;
>>> -    (void)insn_fetch_faulted;
>>> -    (void)decode_ldst_insn;
>>> +    struct cpu_user_regs *regs = gf->regs;
>>> +    mmio_info_t info = { .is_write = false };
>>> +    struct decoded_insn di = {};
>>> +    unsigned int shift = 0;
> As shift is always computed, I don't think it makes sense to init it.

Good point!
I think that originally I took that into account when tried to the 
suggestion but missed to sent here. I will double check!

>>> +    int rc;
>>>    
>>> -    return -EOPNOTSUPP;
>>> +    /* A fault taken re-reading the instruction is redirected to the guest. */
>>> +    if ( insn_fetch_faulted(gf, &di) )
>>> +        return 0;
>>> +
>>> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    if ( !di.is_unsigned )
>>> +        shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
>>> +
>>> +#ifdef EMULATE_LOAD_DEBUG
>>> +    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
>>> +             regs->sepc, gf->gpa, di.len, shift);
>>> +#endif
>>> +
>>> +    rc = do_mmio(&info, gf->gpa, di.len);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    /* A load into x0 discards its result. */
>>> +    if ( di.reg )
>>> +        *guest_gpr(regs, &di) = (long)(info.data << shift) >> shift;
>>
>> It would be more correct to have here:
>>
>>       shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
>>       ...
>>       if ( di.reg )
>>           *guest_gpr(regs, &di) = di.is_unsigned
>>                                   ? (info.data << shift) >> shift
>>                                   : (long)(info.data << shift) >> shift;
>>
>> and update the commit message part "Sign extension is done here…" to:
>>
>> Sign and zero extension are done here rather than in the handlers: a
>> shift pair drops whatever lies above the access width in the value read
>> and, for a signed load, sign-extends it, so a handler need only report
>> the value it read.
> this LGTM.

Thanks for checking that!

~ Oleksii


