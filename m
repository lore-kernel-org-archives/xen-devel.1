Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B5C79F88
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 16:40:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408840.1641137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2WxZ-000503-Ow; Fri, 04 Sep 2026 16:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408840.1641137; Fri, 04 Sep 2026 16:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2WxZ-0004zw-LW; Fri, 04 Sep 2026 16:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1408840;
 Fri, 04 Sep 2026 16:40:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2WxX-0004zq-MS
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:40:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2WxW-008Bd7-VJ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 18:40:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9af464-bab6-0a2a0a5309dd-0a2a4505d49c-12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 18:40:10 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9af46a-4cb1-0a2a45050019-d155802ed578-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 18:40:10 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so12851595e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 09:40:10 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff81c9b5sm16979075e9.4.2026.09.04.09.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 09:40:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788540010; x=1789144810; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uaRiF92XmAFBOP+wJ34ETAAVKNmbfG+f+mu0tHy9ek=;
        b=iY5IwhztR1HOo6uQDhjAZkOKH3RmeOcawKpTs3EKjSAW0kyfOwmEjAgkgbJaon+CPi
         MiCA10iEkrznIPMn2mkQnFkViuX4SJJleWFH5UCxQEaXqSuZUx3kdeZZlPEwyfJWp6pP
         3PTH1VSSfuN1VTPVJjpzsU4EuLM9E49ppjKo3713+gAhAFkE04GRMDzvFP1itJb3GXSY
         3wWgcTq8JY1dtX8VMVQQOJ3nFO2LYurgpNbzfUSkOXvEby5C/MVvwNr6lgnmx7nKVaSN
         LB+jsgJK/iWbq5F/Ywtq8OXM2gkUigcsOfF68551FaViTHHkCuxrzfsO550qrbX5iVvq
         esGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540010; x=1789144810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uaRiF92XmAFBOP+wJ34ETAAVKNmbfG+f+mu0tHy9ek=;
        b=fNv5YgH0trTBbyz6Sdr+L/rg44ww590aIxDejFuiPUTDU/kanthU6DuGVD44564QtW
         5HXtO/ODAkk4VztRctV+MWREkxu0EZQ2I+TEgHLFXYG6WT2bVrX4rUP6xmRW5Zm8sG7a
         UNWSqSdNCGpgD3lGaMHjvM1Sv0Y6bBVOUgCpXbYVcyOQGnE2bRR/VNpdnyn4bTddE2Lt
         rpl1SWOFA97hhzQ6mvsu9ba+jWqZsYLvBK1Y1B0WfuenU0SZND/iHf2ZTFyk4OA8rVax
         MeMbr7gFgM0bSqC+/vhlS6RvGqagAL98OtSOdXqXt9+tiJOIm9haOcYfAfQR6DM8JYjF
         Ib0Q==
X-Gm-Message-State: AFuF++kytEHV2+S9S57qhN81uYUFHxkifnf7x0UXj5S/zhgbNmLctRe1
	aa22RVKy/y3Crgf7eX3wTE36eMehg/loWps0fRT3t1soOKgFqlmZEUrw
X-Gm-Gg: AYBFou0E1v5iUUsdgD1O6DoVAbja2UKH9WBIEDa616oOJHEIMbuo/Wyx4hN7cFvknmK
	oX5OSXe5grmraZ9cbs2Uqpsqsu+ADh+3PauwuAeHS7GdYrW1/4/Pup7HeKzx61eznAM3EpsjGpZ
	IO0SuMkdmsyDUZUqh8yPDO9/xs53+9wPC8VhdEeg2XE8KeTE7git6ojpuhX0GG4BukDttxHptWn
	WUf30xo07rh7iahvIAsEZZ42/PzTWT/0g2MMsW/WfsPxDZdBw7zA+LdgZ73bIEOwxAJE6Y9bqC7
	AJIcILUjRqjY9/twhxK6KmnPehe6nsJ7ufLW+V7fy/1OpXByzMZ9VwGZ5o6EqQah+L3pBNkVOuH
	w/N6TQ7waCXMqxLMhROLAT2tHUxdydRxw8zVgJjBXgYu7pg4AZ5rHIytMUdtOx8SHq2D6Q71YV6
	ECbrmryr/gt01DhlSAFNivjTWRacNgxhmilwjkWVxXTw3FS6CGNWlpfIgGullihainmj/l2xMzs
	deXCDomZDaqrV5aD3XlLSfCtC6/ZXGTdBzNmxE=
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49cfc6cc091mr46777165e9.27.1788540010053;
        Fri, 04 Sep 2026 09:40:10 -0700 (PDT)
Message-ID: <a2c4fe44-28bf-4623-9446-b2ec1814bcbb@gmail.com>
Date: Fri, 4 Sep 2026 18:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/39] xen/riscv: save and restore AIA state on vCPU
 context switch
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
 <32e8b81fd276498cfd339defd2720bce1745c1cf.1787838835.git.oleksii.kurochko@gmail.com>
 <1788515561.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788515561.8631fc262581453bbf619ec5b2062170.1a06bd5af1a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788540010-73CB82A1-0E01E2BA/10/73395122804
X-purgate-type: spam
X-purgate-size: 6933



On 9/4/26 11:52 AM, Baptiste Le Duc wrote:
>> vsiselect and hviprio{1,2} are per-hart CSRs which a guest can change, so
>> they have to be part of the vCPU context:
> Where in the spec did you see that? Because in AIA spec section 6.3.1,
> it is written that "When vsiselect has a value in the range 0x30-0x3F,
> an attempt from VS-mode to access sireg (really vsireg) causes a virtual
> instruction exception" and this even when hstateen0.CSRIND is set as hstateen0
> just control whether a guest/S-mode is allowed to access a CSR (exactly
> as you described below).

Your understanding is correct, it was me who confused the things. Sorry 
for that.

> 
> Therefore, the hypervisor has two options to modify the priority of a
> major irq:
> - emulate the iprio array in software.
> - Use hviprio1/hviprio2 (only 10 irqs configurable).
> 
> But the guest shouldn't be able to modify h CSRs at all, in any case, or
> I may have misunderstood a part of the spec.
> 
> For the moment I don't see any catch of possible instruction exception
> in do_trap().

There is no such because we don't emulate range 0x30-0x3F. We don't have 
such use cases now.

I think that I have to recheck what should be saved/restored now.

There is no need to save/restore CSR_HVIPRIO* during context switch as 
we don't have support of handling of 0x30-0x3f. I will introduce that 
later when we really will need that.

VSISELECT should be save/restored then only in this patch as we have 
hstateen0.SMSTATEEN0_SVSLCT set so guest could change VSISELECT directly 
so we need to store/restore.

Am I missing something?

With having only VSISELECT saved/restored in this patch I think the 
commit message should be:

xen/riscv: save and restore vsiselect on vCPU context switch

vsiselect is a per-hart CSR which a guest changes on its own: when V=1,
VS-mode accesses to siselect are really accesses to vsiselect.
Architecturally a vCPU has to find there the value it last wrote, but as
long as the CSR isn't part of the vCPU context it finds whatever selector
the vCPU which ran on the hart before it left behind. A guest which writes
siselect, is descheduled and then reads sireg without rewriting siselect
therefore reaches a register it never selected, and it can also observe
another guest's selector value.

When Smstateen is implemented, access to vsiselect and vsireg is gated by
hstateen0.CSRIND (bit 60, SMSTATEEN0_SVSLCT in Xen's headers), and
v->arch.hstateen0 holds the bits vcpu_csr_init() ended up with. A clear
bit there covers the two cases in which the CSR has to be skipped:

- Xen didn't hand the guest access to it, so the guest can't have changed
      the CSR and there is no state to preserve;
- M-mode denied the state altogether. Smstateen makes a bit which is zero
      in mstateen0 read-only zero in hstateen0, and a zero bit in mstateen0
      traps accesses from every privilege mode less privileged than M-mode,
      HS-mode included, so Xen couldn't even read the CSR to save it.

Without Smstateen no bit controls access to the CSR, so it is saved and
restored whenever Ssaia is available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
- Update the commit message.
- Save and restore only VSISELECT.
---
Changes in v2:
- New  patch.
---

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 0ad851ee0f5f..1085ef152b8b 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -327,6 +327,28 @@ int arch_domain_create(struct domain *d,
      return rc;
  }

+/*
+ * vsiselect is a per-hart CSR, but a guest changes it on its own: when 
V=1,
+ * VS-mode accesses to siselect are really accesses to vsiselect. Hence 
it is
+ * part of the vCPU context.
+ *
+ * When Smstateen is implemented, hstateen0.CSRIND (SMSTATEEN0_SVSLCT) 
gates
+ * that access, and a bit staying clear in v->arch.hstateen0 (see
+ * vcpu_csr_init()) means either that the guest was never given access 
to the
+ * CSR, and so can't have changed it, or that M-mode denied the state
+ * altogether, in which case the CSR can't be accessed from HS-mode either.
+ */
+static bool vcpu_can_access_vsiselect(const struct vcpu *v)
+{
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+        return false;
+
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        return true;
+
+    return v->arch.hstateen0 & SMSTATEEN0_SVSLCT;
+}
+
  static void save_csr_regs(struct vcpu *p)
  {
      /*
@@ -354,6 +376,9 @@ static void save_csr_regs(struct vcpu *p)
      p->arch.vscause = csr_read(CSR_VSCAUSE);
      p->arch.vstval = csr_read(CSR_VSTVAL);
      p->arch.vsepc = csr_read(CSR_VSEPC);
+
+    if ( vcpu_can_access_vsiselect(p) )
+        p->arch.vsiselect = csr_read(CSR_VSISELECT);
  }

  static void restore_csr_regs(struct vcpu *n)
@@ -375,6 +400,9 @@ static void restore_csr_regs(struct vcpu *n)
      csr_write(CSR_VSCAUSE, n->arch.vscause);
      csr_write(CSR_VSTVAL, n->arch.vstval);
      csr_write(CSR_VSEPC, n->arch.vsepc);
+
+    if ( vcpu_can_access_vsiselect(n) )
+        csr_write(CSR_VSISELECT, n->arch.vsiselect);
  }

  static void ctxt_switch_from(struct vcpu *p)
diff --git a/xen/arch/riscv/include/asm/domain.h 
b/xen/arch/riscv/include/asm/domain.h
index 58d1e8076876..b0824d7f9add 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -75,6 +75,7 @@ struct arch_vcpu {
      register_t vscause;
      register_t vsepc;
      uint64_t   vsie;
+    register_t vsiselect;
      register_t vsscratch;
      register_t vsstatus;
      register_t vstval;


Does it make sense to you?



> 
>>   - vsiselect is written directly by VS-mode through siselect;
>>   - hviprio1 and hviprio2 hold the priorities of the local interrupts which
>>     VS-mode reaches through the iprio array of vsiselect/vsireg, so writes
>>     the guest performs there land in these CSRs.
> hviprio1 and hviprio2 hold priorities for interrupts 1 (SSI), 5 (STI),
> 13 (counter overflow), and 14-23 (local) so calling all of them "local"
> is wrong.

Agree, it is incorrect to call them "local"

>> Without saving them, one vCPU's selector leaks into another vCPU's vsireg
>> accesses and one guest's interrupt priorities apply to the next guest which
>> runs on the same hart.
>>
>> Whether the CSRs may be touched at all is gated by hstateen0 when Smstateen
>> is implemented: SVSLCT for vsiselect/vsireg and AIA for the rest of the AIA
> I couldn't find any reference to SVSLCT in the spec. I assume you wanted
> to refer to CSRIND and SVSLCT is an OpenSBI's own nickname.
> 

Indeed, SVSLCT is the OpenSBI nickname/macro definition for this feature 
and CSRIND would be better to use in commit message.

Thanks.

~ Oleksii

