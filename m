Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF1BC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 08:59:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401788.1637313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzsQv-0004J9-1K; Fri, 28 Aug 2026 08:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401788.1637313; Fri, 28 Aug 2026 08:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzsQu-0004J2-UU; Fri, 28 Aug 2026 08:59:32 +0000
Received: by outflank-mailman (input) for mailman id 1401788;
 Fri, 28 Aug 2026 08:59:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzsQs-0004Hq-R3
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:59:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzsQs-00Bqnn-3x
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:59:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a914de8-e002-0a2a0a5209dd-0a2a450bccca-18
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:59:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a914df0-b7e8-0a2a450b0019-d1558031d50c-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:59:28 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so6866795e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 01:59:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4c321184sm145250985e9.11.2026.08.28.01.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 01:59:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787907568; x=1788512368; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqp1RaaIjNS9UokBVkvy6Ld1z6fOigYRhXOIVNTxHZQ=;
        b=qoCMo5w7DVa4SQWK3x6M+D2OBZuhAX20a/9StvMbTrEUu9BNdmNdBrjU+OeHkpN/Rn
         3SKzz4jvDbWNOapCTP3A0BNt40X6A/eEoibwV4T7poKj9rtMxeLmZMi+1976EPSmfKOk
         w/z1NUZ8Cevp3ztZzhHCehXtw1n/VMAQfJn2iiZOhgHoAkFvbApPCS10PP1hd0JB89wE
         3LnPJmory4Uetcn/7FLmpATZIXVBSE5ts3BMOMdtEMbYlKEMP09fQjTW76CIYQmovw1j
         cDPG40DJJa6oM8H/V7dWSqSOHX6fXF2yYwEne1JRarc02TKjBTZBay0OForm2Y/ftm+O
         M34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907568; x=1788512368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqp1RaaIjNS9UokBVkvy6Ld1z6fOigYRhXOIVNTxHZQ=;
        b=bX7Ix7chpQ+kFm0XdybQnk2Ou+nAEbo2OKKmY4DpWEuJMWnWij46OJrMwleGmtqC+H
         Zk4M+ifrqzkaLiZaVeFvU/WRMGR3eSLZTdO5wSvxiNMbaigXdzLC6HTMjPHqHkm+tmWE
         4TCA68+kMLlAbXgpuFpa6tX5IPmk2vEjCFk5pIz5dex3wZ1gaTEODJI5mjKx2/W4EWo7
         z0Ty12hokYVgbumzXII8fP6xpaHTg3xOJJGi1qcMdpQ4YwKsL45duvnXbo4Xquh5NhZs
         FRc+kCl/8ObAvATifX99iKP5RRg6wjwMeZS2TDl6F1aq81Ytw9RHQVcg4MsuOp6X9HYD
         7ENw==
X-Forwarded-Encrypted: i=1; AHgh+RqDKxML0Jp+OcHFD6W2rsHzAQ9fIkIaKs2C41Y65vCWTZEe3M+nQfUSh3xaWZeeFb2oUZu4tzoMK6Y=@lists.xenproject.org
X-Gm-Message-State: AFuF++mHpgR9pG8FLm/pNBx8eLSKdLKf5MXvcfO+dHfoIlZJesdxhvIk
	qz5eZvo5VpMfCgEDKGVao9mCiqOo0kZ7EmBeHd+o0ZjA8lTJpRBEt7uT
X-Gm-Gg: AR+sD10huN+cKQM19z2Jy7W0B0s9uXHMsVs91w0uB7gp7jZUlxsbdNtd7W+uX8917mC
	SmrfIfr5R4sF3F6cfeiMHuUtJ78k5OdmFxx2QcNIhYquLBtZ0ffYCKlC0unJoZE8qZRF6KOCUqM
	0TJ1HxI72+Q3eTdO7Bu/phSmd5t7JUk1rIldxYoqkhICPTDBMIiXeHc/boNRE2L4/JD2l7uHhMb
	IgqBAPqnYZN2oz9DB2ZMRigLv03NJ0piLAroZPtI57mbttbGCuqWaLktc7IchAtdRZ2rOCRlk+b
	c9QVngWpKxb+ssiptS3d3EMYXkylH9Ml+ukTVJohc0VgGsnofhcHMH3VVjfWgO51Lxzz/zUo+jv
	oAOIbCCvh0vTIIuX2uZ23ZxBKc6ijkv8/ckG47DrrbJx1qSbEG4QmLD44rnDVM6h1019CkGweez
	NQVwF5V4x4c11hGW/Xv9BAhEsGt19H6bD24VNmcXr0rfaSviRftf0RkTkxZhPPm738ldcUl3xFS
	+kHjDSeaKijj1O49AKS9gBCCVk9H4BwSvgoT6Wtk/JKtletn/nH
X-Received: by 2002:a05:600c:698c:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-49b91c3ddc7mr96584255e9.11.1787907567940;
        Fri, 28 Aug 2026 01:59:27 -0700 (PDT)
Message-ID: <92b8d7f1-6a29-4345-9a77-71741a9f34e9@gmail.com>
Date: Fri, 28 Aug 2026 10:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen/riscv: make Zihintpause no longer a required
 extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787907568-2C39B9EA-5BA1DBA2/10/73395122804
X-purgate-type: spam
X-purgate-size: 4535



On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> required_extensions[] panics at boot if Zihintpause is missing, but Xen
> never actually depends on it: cpu_relax() only emits the "pause" when the
> extension is implemented and otherwise falls back to the, which is a legal no-op on any hart regardless of Zihintpause
> support.

You raise a very valid point. Strictly speaking, stating that it "falls 
back to a legal no-op" can be slightly misleading because it implies the 
instruction is decoded as a literal NOP (addi x0, x0, 0).

In reality, the fallback is a fully valid FENCE instruction 
(specifically encoded as `0x0100000F`, which represents `FENCE W, 0`).

Here is why this distinction matters and why it is safe:
1. Since the FENCE instruction is a mandatory part of the RISC-V Base 
Integer Instruction Set (RV32I/RV64I), it is guaranteed to be present on 
any compliant hart. Thus, it will never trigger an "illegal instruction" 
trap.
2. When the Zihintpause extension is not implemented, the hart decodes 
and executes this instruction as a standard FENCE with a predecessor set 
of 'W' (writes) and an empty (null) successor set of '0'.
3. Because the successor set is empty, it imposes zero memory-ordering 
constraints on subsequent instructions.

Thereby I think this part of commit message will be better to re-word in 
the following way:
```
The fallback encoding `0x0100000F` is a legally valid FENCE instruction 
(`FENCE W, 0`) rather than a native NOP. Since FENCE is guaranteed by 
the RISC-V Base ISA, it will never raise an illegal instruction fault. 
In the absence of Zihintpause, it executes with an empty successor set, 
enforcing zero memory-ordering constraints and thus architecturally 
behaving as a NOP.
```


> 
> Drop it from required_extensions so hardware without Zihintpause
> still boots.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   xen/arch/riscv/cpufeature.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 900cb9d772..661babc0a6 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -155,7 +155,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>       RISCV_ISA_EXT_DATA(h),
>       RISCV_ISA_EXT_DATA(zicsr),
>       RISCV_ISA_EXT_DATA(zifencei),
> -    RISCV_ISA_EXT_DATA(zihintpause),
>       RISCV_ISA_EXT_DATA(zbb),
>   };
>   

It is also needed then to update docs/misc/riscv/booting.txt.

Generally, I agree that zihintpause should be dropped from 
required_extensions[]. One thing I would like to point out is that, once 
we do that, cpu_relax() may no longer provide a pause hint on hardware 
that doesn't implement zihintpause, even if the hardware provides its 
own pause instruction with different semantics from a fence which does 
nothing.

For example, the MIPS P8700 provides its own pause instruction with a 
different encoding from:

__asm__ __volatile__ ( ".insn r MISC_MEM, 0, 0, x0, x0, x16" );

Using fence in this case would not be power-efficient, as it behaves as 
a no-op.

For the MIPS P8700, for example:

#define MIPS_PAUSE    ASM_INSN_I("0x00501013\n\t")
#define MIPS_EHB      ASM_INSN_I("0x00301013\n\t")
#define MIPS_IHB      ASM_INSN_I("0x00101013\n\t")


I believe there are other implementations that don't use zihintpause but 
provide their own pause instruction as well.

Therefore, I suggest adding the following to riscv_fill_hw_cap():

/*
  * Zihintpause isn't mandatory: the encoding used by cpu_relax() is a
  * HINT which executes as a no-op on hardware without the extension.
  * Report it, as a platform may provide its own way to hint a spin-wait
  * loop, which then has to be wired up in cpu_relax().
  */
if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_zihintpause) )
     printk(XENLOG_WARNING
            "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
            "wire up this platform's pause equivalent in cpu_relax()\n");


Without such a check, we could easily miss updating cpu_relax() for 
platforms with their own pause mechanism. While having zihintpause as a 
required extension implicitly forces us to consider this, once it is no 
longer required, I think we should keep an explicit indication that the 
platform-specific pause mechanism may need to be wired up.

Thanks.

~ Oleksii


