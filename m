Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D73C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:03:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428651.1651547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yHH-0001GD-UM; Tue, 22 Sep 2026 11:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428651.1651547; Tue, 22 Sep 2026 11:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yHH-0001G6-RK; Tue, 22 Sep 2026 11:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1428651;
 Tue, 22 Sep 2026 11:03:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8yHF-0001Fu-Ho
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:03:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yHE-005R2g-R4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:03:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab26069-e002-0a2a0a5209dd-0a2a4508a5cc-6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:03:08 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab2606a-f659-0a2a45080019-4a7de18cbf37-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:03:06 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so22436045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:03:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdab8ae6dsm92707795e9.0.2026.09.22.04.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 04:03:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790074986; x=1790679786; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWVdaKk7lkBV1zyykoxHG3CrUBeKB9NFkyrtNEOtJgs=;
        b=gq831bf4pL4e4cz0i+hQfSscCB10ibvogK+6eBu791/YiiPx28cxZ3EEG/Pj1XRAnq
         jstkee4Cd8RAvG/2RNOR7ALcHOcWrzrG1b65y6OhzgmemhLZlh+isDjd4ih8OekNE+w9
         44jHiydoduAewe9z6USv8qfT4/rgUyNSsZmxHxSahvB7n7OGhx4f/e1MTXxmsAJpI4K3
         KAOqJhYgMgvuobUmee2vTMy17cTYPnXQHK08KDIZGmIORa9ejCiTzzzfhETBKMS0/VQC
         C47ZKBbmPRp2uSaN6PSke3pEiETJIelTFCTXoOy6yZ8AHSg8bp/Za5WV5T5rqHtSSd12
         6rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074986; x=1790679786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWVdaKk7lkBV1zyykoxHG3CrUBeKB9NFkyrtNEOtJgs=;
        b=0SsqkDdBMhiOsWG9r7vTkD6YEartRi/dYmUZkd7RNx3UmJUa5yehmhry540uBY48TH
         5fiqaZBgvvqho+oG9NtZ8U5D9JK9bDWw9O80WPosnPcP8D9grXqxfz7NydBRh/iqVqT3
         8KguDqc0/nzF9q6ddBSee1Aa5QntAVMC3fNd6YC2czl9KP3viVMJzxLZ+EyCwXFnQXx/
         Dl88OxeWLI6mJ3xVqavlcD1Qgvix8derr+4vhCXvZTJpcT7EpsSwWg+/ECq4lYX2Thkg
         G55EbQt+NSHSJ/eq3+UO4EGHkl6tNHk8ndRhYQOcyskqcGotwXmuOJ/cePq85bN9/qTy
         gilw==
X-Gm-Message-State: AFuF++khIEJdk2f7Gpp5fwKSRwvakzvbFe+hEhO2r9t0CiPh6xzWw3lc
	olame5iO4MOKv+oN309d1HE8Ekb0fWIk/vwrSvgQlWsNeddkDTL9XLdH
X-Gm-Gg: AYBFou0C1rCbiJ3GRCV/bAS1EDs+pBok16oAB57W5mgTkpODYnYvydTjp9vu0qqgAs3
	hqpq8ZlCBZFenfOxgI6auztgthvoRDqjD+YQJe/5/v9VQ2O4shgF5JNALvr9yjPCKUsXn6A4CCF
	OCpwemYYVDQbs5ycBtOCjR9LWoxTbMcLN4QATUof0QYoL5azm7dTvwZNJUKk/V9ci4WD8fXb3a3
	DyXa+UxJPMcFAEDJGIzoc2BcMfmuMhYim2QQmcclZT1ETPviVKT3FkmmVDK2Kx0x8j+vF/dS2IP
	YEDlyFVgoWZlGsvsfI/lKZCR1Xnj2E3pOT72X+fBO+juXMMDYT339iYutqJ5UvdxFQFsZCwXR4R
	P0e1kHjhXtrB1AKx8Iq5vCvOmUP5BCsuL0CeS6XHUVC8I2o7zywk/LQPwtIgJMl6QCwyG5S76ux
	h5jCPqRuAdsMsCkMK+88A2JcQubNbwaJQRlIEdhr3ESljfMKB2XEtb6laI4P9/3WRYBM1E5LM2e
	lL/3Jg1MtP4eLKHKzIfzVa7sLPA8ZvLSDmOB1a4lswAuNZ/rA==
X-Received: by 2002:a05:600c:c16a:b0:49f:ce78:356e with SMTP id 5b1f17b1804b1-49fce7836b0mr139595575e9.31.1790074986223;
        Tue, 22 Sep 2026 04:03:06 -0700 (PDT)
Message-ID: <028383a7-e806-4219-990b-c982b580edd5@gmail.com>
Date: Tue, 22 Sep 2026 13:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/39] xen/riscv: add helpers for decoding a trapped
 load or store
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
 <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
 <1789721101.8631fc262581453bbf619ec5b2062170.1a0b3b0c3ad00072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789721101.8631fc262581453bbf619ec5b2062170.1a0b3b0c3ad00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790074986-CE94287B-223EC513/10/73395122804
X-purgate-type: spam
X-purgate-size: 9524



On 9/18/26 10:44 AM, Baptiste Le Duc wrote:
>> emulate_load() and emulate_store() will both need to obtain the
>> instruction which caused a guest MMIO trap, decode it, and locate the
>> register operand it names. Add what the two share, ahead of either of
>> them being implemented: struct decoded_insn, insn_fetch_faulted(),
>> decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc().
>>
>> The mask/match chain is adapted from Linux's KVM RISC-V implementation.
> Nit: maybe you could add the Origin: trailer as mentioned in the
> sending-patches.adoc.

I think that I will drop that sentense as the code in v3 is changed 
pretty significantly so it doesn't too much sense to mention that it was 
derived from Linux's KVM RISC-V.

Basically even if I will put Origin: now here then it will be still 
pretty hard to undestand what was used or not as I mentioned above there 
are a lot of changes done in comparison with original.

I will take it in mind for my future patches.

[...]
>> +
>> +/*
>> + * Decode the load or store instruction fetched into @di, filling in the
>> + * remaining fields of it (@di->insn and @di->insn_len are filled by
>> + * insn_fetch_faulted()).
>> + *
>> + * @xlen is the effective XLEN of the guest, needed as
>> + * the encodings which exist for XLEN=64 only must not be recognized for a
>> + * 32-bit guest.
>> + *
>> + * Returns false if the instruction is not a load or store which can be
>> + * emulated here.
>> + */
>> +static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
>> +                                            unsigned int xlen)
>> +{
>> +    unsigned long insn = di->insn;
>> +    /* Register fields of the uncompressed forms ... */
>> +    unsigned int rd = RV_RD(insn);
>> +    unsigned int rs2 = RV_RS2(insn);
>> +    /*
>> +     * ... and of the compressed ones, where the 3-bit field selects one of
>> +     * x8..x15, while the stack-pointer-relative forms have a full-width one.
>> +     */
>> +    unsigned int rs2s = RVC_RS2S(insn);
>> +    unsigned int rs2c = RVC_RS2(insn);
>> +
> This naming are confusing because above you described di->reg to be rd
> for load and rs2 for store but here ...
>> +    di->is_write = false;
>> +    di->is_unsigned = false;
> 
> 
>> +    di->reg = rd;
>> +
>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>> +        di->len = 1;
>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>> +    {
>> +        di->len = 1;
>> +        di->is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>> +        di->len = 2;
>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>> +    {
>> +        di->len = 2;
>> +        di->is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>> +        di->len = 4;
>> +    else if ( xlen == 64 && (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )
>> +    {
>> +        di->len = 4;
>> +        di->is_unsigned = true;
>> +    }
> 
> 
>> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
>> +    {
>> +        di->len = 4;
> 
> 
>> +        di->reg = rs2s;
> ... you assigned rs2s for a load. According to the spec, it should be rd'.
> 
> I would suggest something generic to load and store. Maybe rxs with a comment to explain it concerns rs2' for store and rd' for load.
> 
>      /*
>       * ... and of the compressed ones, where the 3-bit field selects one of
>       * x8..x15, while the stack-pointer-relative forms have a full-width one.
>       * rxs is named after that field's spec mnemonic, rd'/rs2': rd' for
>       * compressed loads, rs2' for compressed stores.
>       */
>      unsigned int rxs = RVC_RS2S(insn);

Good point. It isn't partly applied to what I suggested in one of the 
reply to Jan B. but I will try to re-use part of your suggestion there.

It will look like:

static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
{
     uint32_t insn = di->insn;
     unsigned int funct3, width_log2;

     if ( INSN_IS_16BIT(insn) )
     {
         /*
          * C.LW, C.LD, C.SW and C.SD (bits[1:0] == 00), and their 
sp-relative
          * C.*SP forms (bits[1:0] == 10), have bits[15:13] of the form x1y:
          * x is set for a store, and y selects a width of 4 or 8 bytes.
          */
         funct3 = RV_X(insn, 13, 3);

         if ( (insn & 1) || !(funct3 & 2) )
             return false;

         di->is_write = funct3 & 4;
         width_log2 = 2 + (funct3 & 1);

         /*
          * The register operand is rd' of a load or rs2' of a store for the
          * register-relative forms, both being bits[4:2], and rs2 of a 
store
          * or rd of a load for the sp-relative ones.
          */
         if ( !(insn & 2) )
             /* Quadrant 0: bits[4:2] encode rd' (load) or rs2' (store) */
             di->reg = RVC_RS2S(insn);
         else if ( di->is_write )
             /* Quadrant 2 (CSS): bits[6:2] encode rs2 for C.SWSP / 
C.SDSP */
             di->reg = RVC_RS2(insn);
         else
         {
             /* Quadrant 2 (CI): bits[11:7] encode rd for C.LWSP / C.LDSP */
             di->reg = RV_RD(insn);

             /* C.LWSP and C.LDSP are reserved with rd being x0. */
             if ( !di->reg )
                 return false;
         }
     }
     else
     {
         /*
          * funct3[1:0] is log2 of the width in bytes, and funct3[2] selects
          * zero-extension for a load, while being reserved for a store.
          */
         funct3 = RV_X(insn, 12, 3);
         width_log2 = funct3 & 3;

         switch ( insn & INSN_OPCODE_MASK )
         {
         case INSN_OPCODE_LOAD:
             di->is_unsigned = funct3 & 4;
             di->reg = RV_RD(insn);
             break;

         case INSN_OPCODE_STORE:
             if ( funct3 & 4 )
                 return false;
             di->is_write = true;
             di->reg = RV_RS2(insn);
             break;

         default:
             return false;
         }
     }

     di->len = 1U << width_log2;

     /*
      * No access is wider than XLEN, and one as wide as XLEN exists only in
      * its sign-extending form: this rules out the encodings which 
exist for
      * XLEN=64 only on a 32-bit guest, including C.FLW for C.LD (and 
alike).
      */
     if ( (di->len * BITS_PER_BYTE > xlen) ||
          (di->is_unsigned && di->len * BITS_PER_BYTE == xlen) )
         return false;

     return true;
}

> 
>> +    }
>> +    /* c.lwsp and c.ldsp are reserved with rd being x0. */
>> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP && rd )
>> +        di->len = 4;
>> +    else if ( xlen == 64 && (insn & INSN_MASK_LD) == INSN_MATCH_LD )
>> +        di->len = 8;
>> +    else if ( xlen == 64 && (insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD )
>> +    {
>> +        di->len = 8;
>> +        di->reg = rs2s;
>> +    }
>> +    else if ( xlen == 64 && (insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
>> +              rd )
>> +        di->len = 8;
>> +    else if ( (insn & INSN_MASK_SB) == INSN_MATCH_SB )
>> +    {
>> +        di->len = 1;
>> +        di->is_write = true;
>> +        di->reg = rs2;
>> +    }
>> +    else if ( (insn & INSN_MASK_SH) == INSN_MATCH_SH )
>> +    {
>> +        di->len = 2;
>> +        di->is_write = true;
>> +        di->reg = rs2;
>> +    }
>> +    else if ( (insn & INSN_MASK_SW) == INSN_MATCH_SW )
>> +    {
>> +        di->len = 4;
>> +        di->is_write = true;
>> +        di->reg = rs2;
>> +    }
>> +    else if ( (insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW )
>> +    {
>> +        di->len = 4;
>> +        di->is_write = true;
>> +        di->reg = rs2s;
>> +    }
>> +    else if ( (insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP )
>> +    {
>> +        di->len = 4;
>> +        di->is_write = true;
>> +        di->reg = rs2c;
>> +    }
>> +    else if ( xlen == 64 && (insn & INSN_MASK_SD) == INSN_MATCH_SD )
>> +    {
>> +        di->len = 8;
>> +        di->is_write = true;
>> +        di->reg = rs2;
>> +    }
>> +    else if ( xlen == 64 && (insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD )
>> +    {
>> +        di->len = 8;
>> +        di->is_write = true;
>> +        di->reg = rs2s;
>> +    }
>> +    else if ( xlen == 64 && (insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP )
>> +    {
>> +        di->len = 8;
>> +        di->is_write = true;
>> +        di->reg = rs2c;
>> +    }
>> +    else
>> +        return false;
>> +
>> +    return true;
>> +}
>> +

[...]

>> +/*
>> + * Width encoded by the MXL, SXL, UXL and VSXL fields, all of which share one
>> + * encoding. 0 is reserved.
>> + */
>> +#define XLEN_FIELD_32			_UL(1)
>> +#define XLEN_FIELD_64			_UL(2)
>> +#define XLEN_FIELD_128			_UL(3)
>> +
>>   #if __riscv_xlen == 64
>>   #define HSTATUS_VSXL			_UL(0x300000000)
>>   #define HSTATUS_VSXL_SHIFT		32
>> @@ -896,6 +904,8 @@
>>   					 (RV_X(x, 7, 2) << 6))
>>   #define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
>>   					 (RV_X(x, 7, 3) << 6))
>> +#define RV_RD(insn)			RV_X(insn, SH_RD, 5)
>> +#define RV_RS2(insn)			RV_X(insn, SH_RS2, 5)
> Nit: format
> 

I think it looks like that because tabs are used there instead of spaces 
and tabs are there because it was orignally taken from the project which 
uses tabs.

Thanks!

~ Oleksii

