Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EEC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401804.1637322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzshL-0001y6-D4; Fri, 28 Aug 2026 09:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401804.1637322; Fri, 28 Aug 2026 09:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzshL-0001xz-9u; Fri, 28 Aug 2026 09:16:31 +0000
Received: by outflank-mailman (input) for mailman id 1401804;
 Fri, 28 Aug 2026 09:16:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a047a7f351000c4f3@swg.vates.tech>)
 id 1wzshJ-0001xt-VC
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:16:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzshJ-000AXW-Bs
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 11:16:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a047a7f351000c4f3@swg.vates.tech>)
 id 6a9151e3-8faa-0a2a0a5109dd-0a2a450c8cb6-14
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 11:16:29 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a047a7f351000c4f3@swg.vates.tech>)
 id 6a9151ec-f479-0a2a450c0019-b9ff1c23a0c5-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 11:16:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a047a7f351000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Aug 2026 09:16:24 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8D39083B3C;
 Fri, 28 Aug 2026 11:16:23 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=bpLWXRcoAXBYkPhXEckK5N+1EASBF3iYMH32h1CXgFM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YcDA5HDo/alGROeI2hUqIf+YHWBhEGq60SZammnAUARjmOU32+i8jlCd9IURAjiem0UfQqvAP
 OAmoAcC4iVy6Y7suf9Bj5opzue1V+OfxbOT9eRFowbuhekofYuRhzVm630x627knPTrnFW1UvjU
 XBH3F1fDW9FDIxZvR6YBYF6ppDtfhXWMAWNToP5Q5x/v1kl3TdfMpP6PloFQaHUXBxFM/H9Wfjj
 bZpjW3sUQWLwdXK+tHqxTq2WDDFzYkuYMVJ6y56S2icvg3bDR0QzTxyXHdphkV0HfS92GqrXQHP
 9totW7qHwStNoAz4mN3YwjP3ymPknxsnrk8jTJNhA2TQ==
X-Zone-Loop: b1707fee90aa32bd2371c9c5f38919d308ee4482c985
x-campaign-type: default
x-transaction-id: 393f0f08-e9b6-4d14-a8e2-b798757af45b
x-swg-uid: 01-5be2e115-a207-41b1-992e-e108e9d02fce
X-Mailer: Sweego
Message-ID:
 <1787908584.8631fc262581453bbf619ec5b2062170.1a047a7f351000c4f3@vates.tech>
x-swg-bid: 1787908584.8631fc262581453bbf619ec5b2062170.1a047a7f351000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/5] xen/riscv: make Zihintpause no longer a required
 extension
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, zhangzheng@iscas.ac.cn, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <92b8d7f1-6a29-4345-9a77-71741a9f34e9@gmail.com>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad47c000c4f3@vates.tech>
 <92b8d7f1-6a29-4345-9a77-71741a9f34e9@gmail.com>
Date: Fri, 28 Aug 2026 11:16:18 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787908583; l=5027;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=xJ2yEegfsnrPmaZ/jjZowAWrHDD+/f2kJyPr7Yk7iSw=;
 b=v57mcyUnSeaENwSm+RguKg+gLtjrKkaMboEbUwMDppLuD4Y9b0CLIV4Eamvxfqa2rLXgMV02d
 tiaA6/4GcL5Do5LejT8Ol+bJqXdYKccRa7d0OQTanBS5IrsnfQJJTp9
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787908583770
X-purgate-ID: tlsNG-d25034/1787908589-76CDBA5B-9A7768CE/0/0
X-purgate-type: clean
X-purgate-size: 5031

On 2026-08-28 10:59 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> > required_extensions[] panics at boot if Zihintpause is missing, but Xen
> > never actually depends on it: cpu_relax() only emits the "pause" when the
> > extension is implemented and otherwise falls back to the, which is a legal no-op on any hart regardless of Zihintpause
> > support.
> 
> You raise a very valid point. Strictly speaking, stating that it "falls 
> back to a legal no-op" can be slightly misleading because it implies the 
> instruction is decoded as a literal NOP (addi x0, x0, 0).
> 
> In reality, the fallback is a fully valid FENCE instruction 
> (specifically encoded as `0x0100000F`, which represents `FENCE W, 0`).
> 
> Here is why this distinction matters and why it is safe:
> 1. Since the FENCE instruction is a mandatory part of the RISC-V Base 
> Integer Instruction Set (RV32I/RV64I), it is guaranteed to be present on 
> any compliant hart. Thus, it will never trigger an "illegal instruction" 
> trap.
> 2. When the Zihintpause extension is not implemented, the hart decodes 
> and executes this instruction as a standard FENCE with a predecessor set 
> of 'W' (writes) and an empty (null) successor set of '0'.
> 3. Because the successor set is empty, it imposes zero memory-ordering 
> constraints on subsequent instructions.
> 
> Thereby I think this part of commit message will be better to re-word in 
> the following way:
> ```
> The fallback encoding `0x0100000F` is a legally valid FENCE instruction 
> (`FENCE W, 0`) rather than a native NOP. Since FENCE is guaranteed by 
> the RISC-V Base ISA, it will never raise an illegal instruction fault. 
> In the absence of Zihintpause, it executes with an empty successor set, 
> enforcing zero memory-ordering constraints and thus architecturally 
> behaving as a NOP.
> ```
I agree with this suggestion, thanks.
> 
> 
> > 
> > Drop it from required_extensions so hardware without Zihintpause
> > still boots.
> > 
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> > ---
> >   xen/arch/riscv/cpufeature.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> > index 900cb9d772..661babc0a6 100644
> > --- a/xen/arch/riscv/cpufeature.c
> > +++ b/xen/arch/riscv/cpufeature.c
> > @@ -155,7 +155,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
> >       RISCV_ISA_EXT_DATA(h),
> >       RISCV_ISA_EXT_DATA(zicsr),
> >       RISCV_ISA_EXT_DATA(zifencei),
> > -    RISCV_ISA_EXT_DATA(zihintpause),
> >       RISCV_ISA_EXT_DATA(zbb),
> >   };
> >   
> 
> It is also needed then to update docs/misc/riscv/booting.txt.
> 
> Generally, I agree that zihintpause should be dropped from 
> required_extensions[]. One thing I would like to point out is that, once 
> we do that, cpu_relax() may no longer provide a pause hint on hardware 
> that doesn't implement zihintpause, even if the hardware provides its 
> own pause instruction with different semantics from a fence which does 
> nothing.
> 
> For example, the MIPS P8700 provides its own pause instruction with a 
> different encoding from:
> 
> __asm__ __volatile__ ( ".insn r MISC_MEM, 0, 0, x0, x0, x16" );
> 
> Using fence in this case would not be power-efficient, as it behaves as 
> a no-op.
> 
> For the MIPS P8700, for example:
> 
> #define MIPS_PAUSE    ASM_INSN_I("0x00501013\n\t")
> #define MIPS_EHB      ASM_INSN_I("0x00301013\n\t")
> #define MIPS_IHB      ASM_INSN_I("0x00101013\n\t")
> 
> 
> I believe there are other implementations that don't use zihintpause but 
> provide their own pause instruction as well.
> 
> Therefore, I suggest adding the following to riscv_fill_hw_cap():
> 
> /*
>   * Zihintpause isn't mandatory: the encoding used by cpu_relax() is a
>   * HINT which executes as a no-op on hardware without the extension.
>   * Report it, as a platform may provide its own way to hint a spin-wait
>   * loop, which then has to be wired up in cpu_relax().
>   */
> if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_zihintpause) )
>      printk(XENLOG_WARNING
>             "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
>             "wire up this platform's pause equivalent in cpu_relax()\n");
> 
> 
> Without such a check, we could easily miss updating cpu_relax() for 
> platforms with their own pause mechanism. While having zihintpause as a 
> required extension implicitly forces us to consider this, once it is no 
> longer required, I think we should keep an explicit indication that the 
> platform-specific pause mechanism may need to be wired up.
> 
> Thanks.
Good catch, thanks for that. I agree with what you said to not forget
platforms that use their own pause mechanism. I will add what you
suggested in v2.
> 
> ~ Oleksii
> 
> 
Thanks.
> 
> 



