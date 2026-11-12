Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325F606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhJQeD9r
Received: from list by lists.xenproject.org with outflank-mailman.1485548.1688737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRSXW-000473-OL; Thu, 12 Nov 2026 11:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485548.1688737; Thu, 12 Nov 2026 11:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRSXW-00046w-L3; Thu, 12 Nov 2026 11:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1485548;
 Thu, 12 Nov 2026 11:00:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRSXU-00046m-WE
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRSXU-00CTTS-Bi
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:00:20 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af59c3b-e002-0a2a0a5209dd-0a2a450ae982-36
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:00:20 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af59c43-f2d2-0a2a450a0019-d1558035e548-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:00:19 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso28643845e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:00:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08ddbe68sm205556195e9.0.2026.11.12.03.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 03:00:17 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794481219; x=1795086019; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NCE7d/e052Pwen4CuSXBAr/RltF63SNnUQIbMgF+Y0=;
        b=rhJQeD9rUyWEy9DPxdZQrgtDpjuB78ukTs5oIn01UQBNlPmlrZCVVuNdwf1XtEJjcy
         WmEiOcl8P4s8DxJ0XXxb34IfX7/w8jkyB69JlLzDIUoa7HLIzaKm/6rJufd2/t+Wx0dO
         +vdoe166W/xev0WfED7Le9vU0trjknux0J8KOn2K7Om6A1N+gc6U4YM9C26nsnCuesRV
         KHHfsXDNoWrQU+ZsgCXr7pEaCyA4TSzhQuYgbySe28GyrXFsqHS3pItK9fGxEtq1Aiiu
         0ypYm5HNC5zpY7/04EwCpWI9iEHJlMVh403bXQeohzhiCSXBnQVL9hj3uq0l2XtD/k5d
         sDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481219; x=1795086019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NCE7d/e052Pwen4CuSXBAr/RltF63SNnUQIbMgF+Y0=;
        b=B0skAykDX4t96WXpsJ3Ov/Ntk60/LRYphGRKlnT/PUyx+ge6qew/ggQA2eDt3EUGdI
         viCjq7lQaRTXYln1Ykl5T+GhnYhHUWUCgNn604p9WD4D8idq8MEj0lG/69X0vuSGfd2z
         9c4RSTZ/VYJTf/IQznhxsk2pkjQ0giqICTpY58hEcsiQNYO+Madkbkrti62Tn1TtlDE9
         63faa91CDNDXOjQYYlze52S0mdBRswKxBWNFtixvfx3UvmJzHzOhCO34jfMaGY+87NwY
         XWG4wtJjhoyx6/N8YO1fiB7/knBNcOZGoJs1CMcw5omdVc9av7ktq9cT2E42ouHWvaUU
         fD1Q==
X-Forwarded-Encrypted: i=1; AL+hErGqvoEvXURHuPuHkkqualu2Aw5rvVzctShCB6kFzrfVb5hcKu0cXl5vZYsKPRqmY/i5dhvbYfg/29c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8kHFSqm94HIvGYXLSiB+SP6mrpZyZdiox+U0cJYtxjrRGza3Qp
	LhsivSqncPVX9rRjtxisQ6HfX5/dLwHoIn1bSjyr9mRCPMz8h3EtS3b0
X-Gm-Gg: AYBFou1LEc7zycucf0kDRJMR8/sgHWduUBKnGczBYNhH7z5Fjfw87RjUa1cRR8AICmR
	NszaxzTFJEA3gGqNMsS2pnabKedkZ3YteRgn1RCvukh9XxwG6SNJ9p/9I/nW/dpifyJu9eDO34T
	5wfz8uzwU4rJtoWWJSZdH+Gf9Rptn51O/f4KDZUTFhkO04k1bgwNodPrYA6ywukacjoK7y21F9U
	XOJfwc+8hWaodC27lQjQJ0A7WlUuv6U4vDBXBPfZm9fYDaTeQJcHW0nx8qeTGxJjxL3gqUa34gU
	mPaPgHZLOsUV+5TfEhrVtdQ3ufIwnLdou0ZOaYeAMh/D5LYzEZO1bP5LmNuHcU3N//Wid1Acu0D
	ynNnUZSVLEJIxAYqt3pGk8U3TO/dl0vL1hmHZPnwniH63OODpZshpiksrMcbp0Lkiofy/TzTTX4
	Un35ZmoU3hfjZ5i0WHl63QkBbq5Nl1TnMdlPJiMMDYt1FZleSVBmc7ygJJGJRHsIsn0x33f4TNI
	/+mChM0ZL1/UhaW25ZULR1W103kKs311ea61zZR1KFXbG6K1/A8OMnmZGLsYeHsD4jGBDWUbIpj
	QaNS1pk85Q+2ggERSg9Pywo0vFXBx/04CRlQusP+lEU16VTrgU1/pirpCcItRrkxuqjmbDb00jM
	38A==
X-Received: by 2002:a05:600c:310e:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ba09383147mr89539995e9.16.1794481218108;
        Thu, 12 Nov 2026 03:00:18 -0800 (PST)
Message-ID: <b95c5a4b-1331-429c-b9a6-726e25854c11@gmail.com>
Date: Thu, 12 Nov 2026 12:00:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
To: Jan Beulich <jbeulich@suse.com>
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
 <3dc50437-5417-4456-adfa-fe3268a4230a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3dc50437-5417-4456-adfa-fe3268a4230a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794481219-522C0CFC-87E5BDBC/10/73395122804
X-purgate-type: spam
X-purgate-size: 4789
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/26 4:52 PM, Jan Beulich wrote:
> On 30.09.2026 18:23, Oleksii Kurochko wrote:
>> @@ -323,6 +326,130 @@ int arch_domain_create(struct domain *d,
>>       return rc;
>>   }
>>   
>> +static void csr_regs_ctxt_switch_from(struct vcpu *p)
>> +{
>> +    /*
>> +     * There is no need to save these CSRs as only hypervisor writes them in
>> +     * csr_regs_ctxt_switch_to() and guest can't access them so they shouldn't
>> +     * be stored here. Keep them commented here just for symmetry with the
>> +     * restore CSRs register part.
>> +     *
>> +     * p->arch.hedeleg = csr_read(CSR_HEDELEG);
>> +     * p->arch.hideleg = csr_read(CSR_HIDELEG);
>> +     * p->arch.henvcfg = csr_read64(CSR_HENVCFG);
>> +     * p->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
>> +     * p->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
>> +     *
>> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +     *     p->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
>> +     */
> 
> I don't understand this comment. Whether the guest can access a CSR doesn't
> matter very much. If Xen modifies it on the guest's behalf, it may still
> need saving/restoring. The question for each individual one is: Can its
> value (or the guest-affecting fields of it) be reconstructed from other
> state? Or is what it holds global state? Or are p->arch.* fields reliably
> kept in sync with what is stored in the hw register?

The value of none of them can change behind Xen's back: they are HS-mode
CSRs, which the guest can't access, and Xen writes them only in
csr_regs_ctxt_switch_to(), from v->arch.* fields which don't change
after vcpu_csr_init(). So the h/w registers always hold what v->arch.*
does, and reading them back would be a no-op. The one exception is hie,
whose VS-level bits alias the vsie ones the guest can change; these are
covered by saving and restoring vsie (hie being written first).

I'll replace the commented-out code with a comment saying this:

static void csr_regs_ctxt_switch_from(struct vcpu *p)
{
     /*
      * Not saved: hedeleg, hideleg, hie, henvcfg, hcounteren, 
htimedelta and
      * hstateen0 only ever hold what csr_regs_ctxt_switch_to() writes there
      * from v->arch.*, which vcpu_csr_init() sets up once. Neither Xen nor
      * the guest changes them otherwise, but for the VS-level bits of hie,
      * aliases of the vsie bits, which the guest changes through vsie: they
      * are saved and restored as part of vsie.
      */

     p->arch.hvip = csr_read(CSR_HVIP);
...


> 
>> +    p->arch.hvip = csr_read(CSR_HVIP);
>> +
>> +    p->arch.vsstatus = csr_read(CSR_VSSTATUS);
>> +    p->arch.vsie = csr_read64(CSR_VSIE);
>> +    p->arch.vstvec = csr_read(CSR_VSTVEC);
>> +    p->arch.vsscratch = csr_read(CSR_VSSCRATCH);
>> +    p->arch.vscause = csr_read(CSR_VSCAUSE);
>> +    p->arch.vstval = csr_read(CSR_VSTVAL);
>> +    p->arch.vsepc = csr_read(CSR_VSEPC);
>> +}
>> +
>> +static void csr_regs_ctxt_switch_to(struct vcpu *n)
>> +{
>> +    csr_write(CSR_HEDELEG, n->arch.hedeleg);
>> +    csr_write(CSR_HIDELEG, n->arch.hideleg);
>> +    csr_write(CSR_HVIP, n->arch.hvip);
>> +    csr_write64(CSR_HENVCFG, n->arch.henvcfg);
>> +    csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
>> +    csr_write64(CSR_HTIMEDELTA, n->arch.htimedelta);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +        csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
>> +
>> +    csr_write(CSR_VSSTATUS, n->arch.vsstatus);
>> +    csr_write64(CSR_VSIE, n->arch.vsie);
>> +    csr_write(CSR_VSTVEC, n->arch.vstvec);
>> +    csr_write(CSR_VSSCRATCH, n->arch.vsscratch);
>> +    csr_write(CSR_VSCAUSE, n->arch.vscause);
>> +    csr_write(CSR_VSTVAL, n->arch.vstval);
>> +    csr_write(CSR_VSEPC, n->arch.vsepc);
>> +}
> 
> Btw, for both function names possibly s/csr_regs/csrs/ ? Or even just singular?

Good point. Use csrs_ctxt_switch_*() sounds good for me.

> 
>> @@ -72,6 +79,12 @@
>>       (void)csr ## H;                 \
>>       csr_read(csr);                  \
>>   })
>> +
>> +#define csr_read64(csr)             \
>> +({                                  \
>> +    (void)csr ## H;                 \
> 
> I continue to not really understand what use this is.

It will be dropped in the v4.

> 
>> --- a/xen/arch/riscv/include/asm/system.h
>> +++ b/xen/arch/riscv/include/asm/system.h
>> @@ -76,6 +76,8 @@ static inline bool local_irq_is_enabled(void)
>>   
>>   #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
>>   
>> +struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next);
> 
> asmlinkage (at least for Misra's sake)?

I will add.

Thanks.

~ Oleksii

