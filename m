Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4D5C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 05:19:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421454.1647302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6LZF-0008CF-TN; Tue, 15 Sep 2026 05:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421454.1647302; Tue, 15 Sep 2026 05:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6LZF-0008C8-QR; Tue, 15 Sep 2026 05:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1421454;
 Tue, 15 Sep 2026 05:18:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6LZF-0008C2-0a
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 05:18:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6LZE-00CjpQ-A6
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 07:18:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa8d521-e002-0a2a0a5209dd-0a2a4501aa30-28
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 07:18:52 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa8d53b-5984-0a2a45010019-4a7de14cafdf-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 07:18:52 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so981737f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 22:18:52 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7d280f69sm32885055e9.3.2026.09.14.22.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 22:18:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789449531; x=1790054331; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=is8I/jPfh/JULRUoN5crrHFUA655y0BwhWcPxqSjvzA=;
        b=AOWtJJBRwvP+ijDnMZtufq+rh4qGm3WWbsQNEwBUo/m0VZaXj8sC/62NoEDHj7sg1P
         NbS9RhNq5YS2aC5stKa5YK1RwSN+GodD6huY3tv7YAEAoskBtBEjMtOLaFmmNy1dm8Nh
         RoK0MX9K1kZNRrn0HgV5aonk7v4tW18fyP/We1vgRyAm+FNX8st5HGHZOMdwP4WkitZi
         NRIhQ2Gs2CvlkXzQuCci2WTSvTecHGJpK6jYFJ43bTBRM8/2gV07lL8bv29VuZZ+CHHm
         BfhZ4+t4E+zjwunUj+2DAze5jzThlhySlL0FmVNB525ZTmYoHPi7u5y7oQPA/xLkNY+F
         GA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449531; x=1790054331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=is8I/jPfh/JULRUoN5crrHFUA655y0BwhWcPxqSjvzA=;
        b=Tuvy23CTsFRylfX6ftviIvEPwmRpArVQWgcJE+PSVleOAzJBc9+3o4h9WDgUednquG
         t5cr2N2TUYDeSyrC+TgbChrUvlvWPe37Ow/mjcCjBwoKPeNCHM9HUXJHlQR/8qrqbWTE
         abdpnA56/mazHmjYDGdHorVKvJDfngtzI7XBDtkRK6wbxmRrwcwWSSfc4UvZ2Pvos8xj
         ++10xqkJk9zxfSpF/orapeVCKLwey+2LiPbQokNCpN+AzJvmF4bsQDY0G+LHQjRc3oxP
         vTH2SXufmY6y2TSEtkyXXMkUhTuOfjpHK9SbZmFeaJ6zjvYRJYQ01rjZGX4JZds1LkKn
         ET2Q==
X-Forwarded-Encrypted: i=1; AKwUvBymxdVF+6SqdUO7/UtZHmuWqxQxq5hEYB17JnbqOlVKz/fQuWGlq+gZQRh7XCcQleKuD4Cy67oWlAA=@lists.xenproject.org
X-Gm-Message-State: AFuF++nx6dhF+lHCTc3zs4wW0DAys0yIdq5x9V1dqICanTR85j3qUGov
	unBz8zaHbTuxhNh4x6HAenU5y7nVRmFsEiaoIZHhmj0R2J9GRo9PBmQSIByToCnfCw==
X-Gm-Gg: AYBFou1gWRnzMBctlYqysNOeTBrRZrjkF9Jsl2Gka5wQ4hyhFAP7xn+YbmNCxhfndu1
	zdi3WGyYUUaAuMctNwBtqrAZ47xm2Rc+IDiOCP5wiik1I8mTe7S0LyreKe3BC/S7cCKtc477z9Q
	XslsIKiU/w7ZJCQp8qEsSvBPKm8dA2QChUDb2VwK6TpSDrYMPv0MQTy9Dfl3Bt6+SCqj50zN+Ui
	59aRsGDSr1Usm47/nw4uASG8tsGMp8ViyL6C69+Yhi2qcDFde4cmPIa9b1pDdH8dK54aZ0SJzvN
	1Ggc2EZHBp8ha5ovqo5MxKTwXFZw/xQ2xOvEY3e9eFkj9FjWH30iDbDjQRSzWp1nE3sGaswKuSb
	Gp8qmelNhetoES6hAIZ9X/WiGs6XL3jd/ZE9wmvc5/Td07s/Ds6pxDvPuhnsjFw9DkIh0DvePUm
	6VUXZZjI29qesgGP8bnQ4V0+Zgluap6d6aLQznnob6d2HZ4XrcWEVatu1dyTKIyu0djSQ/18b6U
	zg=
X-Received: by 2002:a05:600c:5352:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49e7d750bebmr20952005e9.13.1789449531362;
        Mon, 14 Sep 2026 22:18:51 -0700 (PDT)
Message-ID: <1d11bbb6-ebad-48e3-8a06-695a3d4dc7a0@suse.com>
Date: Tue, 15 Sep 2026 07:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/39] xen/riscv: add helpers for decoding a trapped
 load or store
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
 <895a427d-1adb-43cb-a2bb-e0e9d50791db@suse.com>
 <62a6884d-f2dc-46d9-ba5d-0dc4949ba25f@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <62a6884d-f2dc-46d9-ba5d-0dc4949ba25f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1789449532-1E867757-97B7E468/0/0
X-purgate-type: clean
X-purgate-size: 7422

On 14.09.2026 17:57, Oleksii Kurochko wrote:
> On 9/14/26 1:03 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> @@ -13,9 +14,29 @@
>>>   #include <asm/csr.h>
>>>   #include <asm/current.h>
>>>   #include <asm/emulate.h>
>>> +#include <asm/guest_access.h>
>>> +#include <asm/processor.h>
>>>   #include <asm/riscv_encoding.h>
>>>   #include <asm/traps.h>
>>>   
>>> +/*
>>> + * Determine the trapped load or store instruction which caused a guest MMIO
>>> + * trap.
>>> + */
>>> +struct decoded_insn {
>>> +    /* The instruction itself, and its length in bytes. */
>>> +    unsigned long insn;
>>> +    unsigned int insn_len;
>>> +    /* Width of the memory access, in bytes. */
>>> +    unsigned int len;
>>> +    /* Number of the register operand: rd for a load, rs2 for a store. */
>>> +    unsigned int reg;
>>> +    /* The access is a store rather than a load. */
>>> +    bool is_write;
>>> +    /* The load zero-extends its result rather than sign-extending it. */
>>> +    bool is_unsigned;
>>> +};
>>
>> I wonder how efficient this is. With use of bitfield the size of this struct
>> can likely be more than halved. With suitable choice of widths this may not
>> even cause significantly worse generated code.
>>
> 
> We could compress the structure into 8 bytes:
> 
> struct decoded_insn {
>      /*
>       * The instruction itself: no ratified extension defines one wider than
>       * 32 bits, and insn_fetch_faulted() rejects anything longer.
>       */
>      uint32_t insn;
>      /* Length of the instruction in bytes: 2 or 4. */
>      unsigned int insn_len:3;
>      /* Width of the memory access, in bytes: 1, 2, 4 or 8. */
>      unsigned int len:4;
>      /* Number of the register operand: rd for a load, rs2 for a store. */
>      unsigned int reg:5;
>      /* The access is a store rather than a load. */
>      bool is_write:1;
>      /* The load zero-extends its result rather than sign-extending it. */
>      bool is_unsigned:1;
> };

Likely this is going a little too far: The non-bool fields may want to
be 8 bits wide, for better code gen.

>>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>>> +        di->len = 1;
>>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>>> +    {
>>> +        di->len = 1;
>>> +        di->is_unsigned = true;
>>> +    }
>>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>>> +        di->len = 2;
>>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>>> +    {
>>> +        di->len = 2;
>>> +        di->is_unsigned = true;
>>> +    }
>>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>>> +        di->len = 4;
>>> +    else if ( xlen == 64 && (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )
>>> +    {
>>> +        di->len = 4;
>>> +        di->is_unsigned = true;
>>> +    }
>>> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
>>> +    {
>>> +        di->len = 4;
>>> +        di->reg = rs2s;
>>> +    }
>>
>> These insns encode the access width uniformly, i.e. doing things the
>> way done above is rather inefficient.
> 
> I think that I don't know how to do that better at the moment.
> 
> It could be less of if/else if to do in this way:
> 
> static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
> {
>      uint32_t insn = di->insn;
>      unsigned int funct3, width_log2;
> 
>      if ( INSN_IS_16BIT(insn) )
>      {
>          /*
>           * C.LW, C.LD, C.SW and C.SD (bits[1:0] == 00), and their 
> sp-relative
>           * C.*SP forms (bits[1:0] == 10), have bits[15:13] of the form x1y:
>           * x is set for a store, and y selects a width of 4 or 8 bytes.
>           */
>          funct3 = RV_X(insn, 13, 3);
> 
>          if ( (insn & 1) || !(funct3 & 2) )
>              return false;
> 
>          di->is_write = funct3 & 4;
>          width_log2 = 2 + (funct3 & 1);
> 
>          if ( !(insn & 2) )
>              di->reg = RVC_RS2S(insn);
>          else if ( di->is_write )
>              di->reg = RVC_RS2(insn);
>          else
>          {
>              di->reg = RV_RD(insn);
>              /* C.LWSP and C.LDSP are reserved with rd being x0. */
>              if ( !di->reg )
>                  return false;
>          }
>      }
>      else
>      {
>          /*
>           * funct3[1:0] is log2 of the width in bytes, and funct3[2] selects
>           * zero-extension for a load, while being reserved for a store.
>           */
>          funct3 = RV_X(insn, 12, 3);
>          width_log2 = funct3 & 3;
> 
>          switch ( insn & INSN_OPCODE_MASK )
>          {
>          case INSN_OPCODE_LOAD:
>              di->is_unsigned = funct3 & 4;
>              di->reg = RV_RD(insn);
>              break;
> 
>          case INSN_OPCODE_STORE:
>              if ( funct3 & 4 )
>                  return false;
>              di->is_write = true;
>              di->reg = RV_RS2(insn);
>              break;
> 
>          default:
>              return false;
>          }
>      }
> 
>      di->len = 1U << width_log2;
> 
>      /*
>       * No access is wider than XLEN, and one as wide as XLEN exists only in
>       * its sign-extending form: this rules out the encodings which 
> exist for
>       * XLEN=64 only on a 32-bit guest, including C.FLW for C.LD (and 
> alike).
>       */
>      if ( (di->len * BITS_PER_BYTE > xlen) ||
>           (di->is_unsigned && di->len * BITS_PER_BYTE == xlen) )
>          return false;
> 
>      return true;
> 
> 
>      return true;
> }
> 
> But I am not sure this is what you meant.

Yes, this goes along the lines of what I was thinking of.

>>> +    /* c.lwsp and c.ldsp are reserved with rd being x0. */
>>> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP && rd )
>>> +        di->len = 4;
>>
>> Careful with insns not part of the base ISA: Between the trap and you
>> getting to fetch and decode, the in-memory insn may have changed. You
>> posibly set yourself up for vulnerabilities if you permit C encodings
>> for guests not having C exposed to them.
> 
> I think then it will be better to reject it duing instruction fetch in 
> insn_fetch_faulted():
> 
>          di->insn_len = INSN_LEN(di->insn);
> 
>          /*
>           * read_guest() fetches at most two halfwords, so a wider 
> encoding has
>           * been read in part only and cannot be decoded here.
>           *
>           * Report an illegal instruction: none of the extensions exposed to
>           * guests has instructions wider than 32 bits, so such an 
> encoding is
>           * not a valid instruction for the guest in the first place. 
> The same
>           * goes for a compressed encoding where C isn't exposed to the 
> guest:
>           * the instruction in memory may have been changed since the 
> trap, so
>           * what is read back must not be taken to be what trapped.
>           */
>          if ( !di->insn_len ||
>               (di->insn_len == 2 &&
>                !riscv_isa_extension_available(current->domain->arch.isa,
>                                               RISCV_ISA_EXT_c)) )
>          {
>              ...
> 
> Would it be better?

It's an option. Where exactly the check is best placed I can't easily say.

Jan

