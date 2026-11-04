Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F7606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzYoimft
Received: from list by lists.xenproject.org with outflank-mailman.1471829.1679984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOa3d-0006Cw-Aj; Wed, 04 Nov 2026 12:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471829.1679984; Wed, 04 Nov 2026 12:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOa3d-0006Cp-7s; Wed, 04 Nov 2026 12:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1471829;
 Wed, 04 Nov 2026 12:25:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOa3b-0006Cj-FZ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:25:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOa3a-0069Gq-Fd
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:25:34 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb2437-8faa-0a2a0a5109dd-0a2a4504cd78-34
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 13:25:34 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb243e-b57f-0a2a45040019-d1558032e99f-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 13:25:34 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so5112005e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 04:25:34 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b411de95b4sm37178325e9.0.2026.11.04.04.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 04:25:33 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793795134; x=1794399934; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqUmeipCfeknZSMsGou+n7GuJVTBeNa3ADvT/lOjSdI=;
        b=pzYoimftGDro2DPgeByi6o7uABCUNsxr0QJ1/M8AFq+BCC5RQKFEsow3Fr4CDiyovb
         r3o/g2OiyeoPKJXZrV58MaX6Hx/P2jpaJrgtLTS8jBnsF7gFxEfDGBzGbXi0BMfumVP9
         1zOj1IChHNZd5pJielUKzhfanYdeYiWwBvOOHc0dmUftI62Gr3Hw0vCAUdu24XQEEwu4
         s8gYe0pA5eRZ+fwcdw5V3tTTdH0V5bKL1PTZQoqxMxzh3CRUg7joGV773t/8C/HzVNnB
         AV509CmYqoHDxm54Pf5YuTMMEr4I6pOtsEVK9grmZeMpsQ0e3HGT7yDrtisIwgLen6bh
         12JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795134; x=1794399934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqUmeipCfeknZSMsGou+n7GuJVTBeNa3ADvT/lOjSdI=;
        b=DRlYj5NKH3lfLyzNPrWLwdya5po77kbaJGwUs3DSYK1XNAqGyZltcRl0t+864/k0xm
         mBJjpQLRYcdEC4ysbBZe/YdVsAPxjCJdr/A4iPUJvtojs7VNLVuBafAwWxtt6YrADa8m
         dSnmBw7jPvjzsqso9N0DV3jFLpiZXxyK9NEWjkHKm6fqsA1yd1in916mkK0QpgMx4Te+
         stG0/rqSAa/Z/ByDLnr+utCwvYK1Yr+t4QKbQIj50Hz7McBY+o0bCwvdM0YHxkvKJ5mI
         pGOU8i63G0oZWdUkv4swGn202hts7viACbn5bR/3G6EuijDhu3tABtzz9JjfoKmSadfm
         qLdA==
X-Gm-Message-State: APuU4Z96YonmrWAL95DL3UDoHRlaOK67eJKRQHcimzJh3tN8W5f4Qp1G
	8bi2xlAJNGqbsatCzO1yGCdmJEP/mQDc6I/qyNzWOtGIWjozep0JM6Uy
X-Gm-Gg: AYBFou30ZCh++45Al1mpPm40AFOpZN4DPNim/cu9p6duvCJacQpkE0TE3wq75oBgu3q
	+q6dXAfT2lSvKiCOiqnlLqiONUKv6ezsZhAV7Cn5R9pe+KuQBDokExSH3PCPAMc26K47+uKdOWI
	2Kfl0iuo+v1Aw2xgUXtKt38S0ey8z69XTvsUM2+XXXbldjts3rlLAVs8J6pY787v1+gDh6B1i/G
	hlMFO/+jNqFCTAI/zHTmYtH+EeFqhPg7HO6c4Me6tdlg0KxCyWAt1WuzhNna2iQ3abLe4us5UB7
	/eSYW3L4+W5iexrlNH/hlWt9J2wITBJvkrmiu27MpDCfec4SILf2ppOWkPy3w4aDnvTy0t34Wu0
	9qWiPxT7J6pJdNWAVsW8mvJ5+x63R0v0jSmSBHmR6c/cY2xwKSC+H1bpWDv89EXz7S67juBubMe
	FQolt69ZuvJXn+7efpaIZOPj+IputwO2twpfIFcK7JszopxWloKe5DJnVIm0UGehykoKFVFtZmu
	GKgRM3DDupOdumEGLHEh/nqCdjqrBJAqPdFjewulHFqESYs4rLNsl52L/lYIX4DH3goXy4VC7fR
	nZy1ecaMzfZHd+UBEEFgaXEFWvaE4Ku5wrwew/pja1p89aiL4yWgzukmkPHtlbpqGq0HaUK5byX
	p5s4=
X-Received: by 2002:a05:600c:3ba5:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4ac16fa356cmr436637405e9.11.1793795133837;
        Wed, 04 Nov 2026 04:25:33 -0800 (PST)
Message-ID: <18863ff2-0e9b-4ca4-bbbb-8859cae824ea@gmail.com>
Date: Wed, 4 Nov 2026 13:25:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/39] xen/riscv: add guest memory read helper
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
 <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
 <1792594596.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792594596.8631fc262581453bbf619ec5b2062170.1a15ef6d2f2000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793795134-C1CD7B50-EF35D404/10/73395122804
X-purgate-type: spam
X-purgate-size: 3743
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/26 4:56 PM, Baptiste Le Duc wrote:
>> [ ... 75 lines skipped ... ]
>> +/*
>> + * Read machine word from guest memory
>> + *
>> + * @guest_addr: Guest address to read
>> + * @read_insn: Flag representing whether we are reading instruction
>> + * @trap: Output pointer to trap details if something went wrong during read.
>> + *        It must be zero-initialised by the caller: it is written only when
>> + *        an access faults, so trap->scause == 0 on return is what tells the
>> + *        caller that the read succeeded.
>> + *
>> + * The hlv/hlvx instructions translate guest_addr through the live
>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>> + * space of the currently running vCPU. It must therefore only be called
>> + * while handling a trap taken from that vCPU, never from a nested trap
>> + * taken in HS-mode, which may have interrupted Xen at a point where
>> + * hstatus, vsatp or hgatp don't belong to the vCPU.
>> + *
>> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
>> + * wider than 32 bits are not supported. Such an encoding cannot be completed
>> + * by calling this function again at @guest_addr + 4: the length check is
>> + * applied to the first halfword read, which would then be a continuation of
>> + * the instruction rather than its opcode. It is up to the caller to reject
>> + * anything that is neither a 16- nor a 32-bit encoding.
>> + */
> Shouldn't docstring belong to header file?

I don't know if we have such rule but I think that I will move this to 
header to be in sync with other functions in asm/traps.h.

But in the matter of taste it seems to me that having such explanation 
in C code is more useful as it at some point explains a code.

>> +unsigned long read_guest(unsigned long guest_addr, bool read_insn,
>> +                         struct trap_info *trap)
>> +{
>> +    /*
>> +     * Poison the result: if the very first access faults, the fixup skips
>> +     * over the loads without writing it. Callers must check trap->scause.
>> +     */
>> +    unsigned long val = ~0UL, tmp;
>> +
>> +    /*
>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
>> +     * live vsatp/hgatp for the translation. Xen never installs a value of
>> +     * its own in hstatus (it is only saved on trap entry and restored
>> +     * before sret) and it doesn't reschedule before returning to the
>> +     * guest, so all three still belong to the vCPU which trapped.
>> +     */
>> +    if ( read_insn )
>> +    {
>> +        asm volatile ( "\n"
>> +            "1: hlvx.hu %[val], (%[addr])\n"
>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>> +            "   andi %[tmp], %[val], 3\n"
>> +            "   addi %[tmp], %[tmp], -3\n"
>> +            "   bnez %[tmp], 3f\n"
>> +            "   addi %[addr], %[addr], 2\n"
> Could you add a short comment explaining that the andi/addi/bnez sequence
> checks the low two bits of the first halfword to tell a compressed
> instruction from a 32-bit one? It is not obvious on first read.
> Something like:
> ```
>      /*
>       * bits[1:0] != 0b11: 16-bit (compressed) instruction, nothing more
>       * to read.
>       */
> ```
> 

I thought that the last paragraph of the comment above read_guest() 
explains it but I am okay to add the suggested small comment. I will put 
it immediately after ASM_EXTABLE:

             ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
             /*
              * bits[1:0] != 0b11: 16-bit (compressed) instruction, nothing
              * more to read.
              */
             "   andi %[tmp], %[val], 3\n"

Thanks!

~ Oleksii

