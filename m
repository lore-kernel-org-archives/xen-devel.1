Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA46C982D6
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 14:51:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424193.1648830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7DRy-0002L4-Am; Thu, 17 Sep 2026 14:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424193.1648830; Thu, 17 Sep 2026 14:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7DRy-0002Kx-7Y; Thu, 17 Sep 2026 14:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1424193;
 Thu, 17 Sep 2026 14:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x7DRw-0002Kr-Bk
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 14:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7DRv-003KPq-OR
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 16:50:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aabfe3a-2eae-0a2a0a5409dd-0a2a4502dbdc-22
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 16:50:55 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aabfe4f-6ca4-0a2a45020019-4a7de1638689-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 16:50:55 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48437356d60so526706f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 07:50:55 -0700 (PDT)
Received: from [10.72.3.52] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27198sm16171656f8f.15.2026.09.17.07.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 07:50:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789656655; x=1790261455; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4dF3hk9Uxz0Ygi6JMqQi0SH29NrgEpW+/dmOOr6Fbs=;
        b=sQZCk+WAMOyauuUYRJFdXeRF71IWjW1hua5CnyLX9WxZXTRqqJbAYM2QSyXIBAXLMW
         eH+WBKi3ElhxoeYGul89vw/68u3PNFwATw8Z7kC/2PKP2tuT3lrOaMppV3dVrhYhOBFd
         IvVMPfOS8sCTXSzzxDJghoaGFqv0GjCGGOBOvjaPy8qoi2SHhpONuRczZHPGhvF0YtsF
         hR9D3HoucY890ecJMeH9Gbxb4wOCwq1P7m4Pt2NlIdo+tpxy//Sk2bXkQr+c9WkJA//M
         DGxYM6QQB6rZ9MILazUxvpLvJEuFia0VXUc1hZqrGY2yCKAq/9AZiUZnf82RY2XGVoPY
         d+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656655; x=1790261455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4dF3hk9Uxz0Ygi6JMqQi0SH29NrgEpW+/dmOOr6Fbs=;
        b=Ek9E7zZtTbtgplIJGN2SVQ2SM55OpoyVhXST+BDBOarRlfgzNxUZYelarPCTxQjdCa
         IxUcFB4ORf5Dva7nkqH/XTtfBuLBt51uE60nzV5zNVlX/wb59rilRoRxtVn+qqG6AD1/
         h0LeCcuxPv9rwtiNUJZ4d0iZrMdXSNYfEEZogTkNmjlb4knJjeKPchydXqvhFMzG+0gK
         jq48ZbZi3y5/utkBqoLyHBU6KCQjhssjEi+FrHcBP9R5el5tvyRSXv7JuNiny4HjDn4G
         yjNcWImZDHr+SUUFD37pu1sIz2JAqT+EU4jQ8uSndDs8cOItYyzSYdCkrV8B39rkrey2
         sNjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQYCaWbwU+3YXTvC7biiV2wNECpMVcoMGyFas5LRvk53uUlWcIdOraJExmU1mry+noMIl0sTzW5YA=@lists.xenproject.org
X-Gm-Message-State: AFuF++ls7CiCKo+QoinXhdOV4FZ7UGhZwGdFwlykUQ6PTSE8VhQHYP8x
	kGalTUxlK8WB7akkY4NHA6b5nEtyVJiGktYG0PphpAjl4sBg3fYqZA/C
X-Gm-Gg: AYBFou2L3meBNwGfgmfvymYWJGOV38OxqFGROHJHZxBgJ+M8WGrE7ijABPMHr3WGW8Z
	rzoPm08LQXrRV9fdJMNJRMP/3SZpsHB8yrumBobCJ5NeRCOiNAkRwaeeBU+Yr9N1wmgdgFVi43b
	+av1zIZzVFGoORg8MoNtZP/Hi/VavVMUA5sK6TNo3dbjjkln3wz7HNMZwdnR7lgu97/aUb8brRD
	npvU6zsdUqYB8JXPUkdH+Im0Bghsssaje/ixIMzsTtkm8r4x9YO/e58pgvrFhaMKo9DarqWO+nc
	EiPPcLY61TZo2pA8yQ/nfqS+dj59ReiwU9JHl7fiVyQT2+Ae/3OaUq7v9vCsp/QNhGESXGIVXMV
	NXhz4acevFilEWpepQPsT6Wab0FTpC0vTFmLpOr3jX4Sr6XPC8pPN5JDU9/Bnhdf41oxN3bZLgc
	TO2ILco8luxlOyk0Tnb0VHZOoQk1vdjNdvqijwAZu1BpkKLSUUKvBS4sPICmdD1/fjlPvGhGXQx
	Vi5qA==
X-Received: by 2002:a05:6000:4697:b0:485:8ee5:5ffa with SMTP id ffacd0b85a97d-4870d273f7emr6296054f8f.38.1789656654802;
        Thu, 17 Sep 2026 07:50:54 -0700 (PDT)
Message-ID: <8c0855ca-7e32-4b6e-91ed-dc2e72d9693b@gmail.com>
Date: Thu, 17 Sep 2026 16:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
 <2ea26d3b-6413-410f-9cb1-59645cf594e2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2ea26d3b-6413-410f-9cb1-59645cf594e2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789656655-F20A82AC-8F708166/10/73395122804
X-purgate-type: spam
X-purgate-size: 12517



On 9/14/26 3:13 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> @@ -77,6 +78,64 @@ do {                            \
>>       csr_clear(CSR_SIREG, v);    \
>>   } while (0)
>>   
>> +#define imsic_vs_csr_write(c, v)    \
>> +do {                                \
>> +    csr_write(CSR_VSISELECT, (c));  \
>> +    csr_write(CSR_VSIREG, (v));     \
> 
> As patch context also tells: Excess parentheses.

I will drop them then.

> 
>> +} while ( 0 )
>> +
>> +/*
>> + * Generic switchcase expansion pyramid.
>> + * F is the per-operation leaf macro, ireg is the base register index.
>> + * Optional extra args (e.g. an operation and/or a value) are forwarded to F
>> + * via __VA_ARGS__.
> 
> Just that there's no F below.

Oh, right. I will move this comment a little bit down.

> 
>> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg,v); break;"
>> + * imsic_switchcase_ret(ireg, op, ...) - emit "case ireg: return op(ireg[,v]);"
>> + *   The variadic tail is optional so the same leaf works for both read (no v)
>> + *   and swap (with v).
>> + */
>> +#define imsic_switchcase_break(ireg, op, v) \
>> +    case ireg:                              \
>> +        op(ireg, v);                        \
>> +        break;
>> +
>> +#define imsic_switchcase_ret(ireg, op, ...) \
>> +    case ireg:                              \
>> +        return op(ireg, ##__VA_ARGS__);
>> +
>> +#define imsic_switchcase_2(F, ireg, ...)    \
>> +    F(ireg + 0, ##__VA_ARGS__)              \
>> +    F(ireg + 1, ##__VA_ARGS__)
> 
> Ah, there is an F here.
> 
> This (recurring below) shows another problem: The two F invocations
> look syntacticlly incorrect, due to the missing semicolon. Semicolon
> use wants redoing everywhere here.

I will drop then ';' from imsic_switchcase_{break,ret}.

> 
> Further (and again throughout) I think we'd be better off using either
> standard C constructs (e.g. __VA_ARGS__) or the gcc extension
> permitting use of ## after a comma. A mix of both always looks odd
> (to me at least).

I will follow C standard here.

> 
> Finally, unlike further up, here (and below) ireg wants parenthesizing.

I will add some.


> 
>> @@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
>>       return 0;
>>   }
>>   
>> +/*
>> + * Arguments of the imsic_vsfile_local_*() helpers, which are executed by the
>> + * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
>> + */
>> +struct imsic_vsfile_data {
>> +    unsigned int hgei;
>> +    unsigned int nr_eix;
>> +    struct imsic_mrif *mrif;
> 
> I can't spot any use of this field (and hence I also can't judge
> whether const wants adding).

It should be introduced later in the another patch.

> 
>> +};
>> +
>> +/*
>> + * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
>> + * going to work with.
>> + *
>> + * An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart the
>> + * file belongs to, and a guest interrupt file index is meaningless on any
>> + * other hart, so such work always has to be done by that very hart.
>> + *
>> + * The local case runs with IRQs disabled to provide func() with the same
>> + * environment it is given when it is called from the function call IPI
>> + * handler.
>> + */
>> +static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>> +                              void *data)
> 
> If this is supposed to be passed struct imsic_vsfile_data *, why not say
> so here? Be as type-safe as possible. Of course the callback function
> has to use void *.

At the moment, I don't see where I am using void * so I will use struct 
imsic_vsfile_data * instead.

> 
>> +static void cf_check imsic_vsfile_local_clear(void *data)
>> +{
>> +    unsigned int i;
>> +    const struct imsic_vsfile_data *idata = data;
>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>> +
>> +    /* We can only zero-out if we have a IMSIC VS-file */
>> +    if ( !idata->hgei )
>> +        return;
> 
> Wouldn't it make sense to avoid the call here altogether then?

I think it is better to have this if () here instead of the caller side 
as this function one day could be just directly (w/ imsic_call_on_cpu) 
and even the way how it is called now and in the case of 
imsic_call_on_cpu() is executed on local cpu then it will be basically 
just direct call of imsic_vsfile_local_clear(). So in the case I am not 
missing something I prefer to have a check here.

> 
>> +    old_vsiselect = csr_read(CSR_VSISELECT);
> 
> Likely obvious to you, but I can't spot why vsiselect would need saving
> here. If you want me to ack such code, please add at least brief comments.

I think then it will be better to put the comment once above struct 
imsic_vsfile_data and then just point here to that comment as basically 
it will be needed for all imsic_vsfile_local_* helpers.

So basically I am suggesting:

--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ ... @@
  /*
   * Arguments of the imsic_vsfile_local_*() helpers, which are executed 
by the
   * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
+ *
+ * The helpers interrupt whatever vCPU context is loaded on that pCPU, 
which
+ * generally isn't the vCPU the interrupt file belongs to. To reach the 
file
+ * they retarget hstatus.VGEIN and select the file's registers through
+ * vsiselect. Both CSRs are live state of the interrupted vCPU 
(vsiselect is
+ * saved to struct arch_vcpu only on context switch, but the 
interrupted vCPU
+ * may resume guest execution without one), hence the helpers have to 
restore
+ * them before returning.
   */
  struct imsic_vsfile_data {
      unsigned int hgei;
      unsigned int nr_eix;
      struct imsic_mrif *mrif;
  };
@@ ... @@ static void cf_check imsic_vsfile_local_clear(void *data)
      /* We can only zero-out if we have a IMSIC VS-file */
      if ( !idata->hgei )
          return;

+    /* See the comment ahead of struct imsic_vsfile_data. */
      old_vsiselect = csr_read(CSR_VSISELECT);
      old_hstatus = csr_read(CSR_HSTATUS);
@@ ... @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
      csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));

+    /* See the comment ahead of struct imsic_vsfile_data. */
      old_vsiselect = csr_read(CSR_VSISELECT);
      old_hstatus = csr_read(CSR_HSTATUS);
@@ ... @@ static void cf_check imsic_vsfile_local_update(void *data)
       * stack.
       */

+    /* See the comment ahead of struct imsic_vsfile_data. */
      old_vsiselect = csr_read(CSR_VSISELECT);
      old_hstatus = csr_read(CSR_HSTATUS);


Does it look clear now?

> 
>> +    old_hstatus = csr_read(CSR_HSTATUS);
>> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
>> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
>> +    csr_write(CSR_HSTATUS, new_hstatus);
>> +
>> +    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
>> +    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
>> +
>> +    for ( i = 0; i < idata->nr_eix; i++ )
>> +    {
>> +        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
>> +        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
>> +#ifdef CONFIG_RISCV_32
>> +        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
>> +        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
>> +#endif
> 
> In asm/imsic.h I see
> 
> #define IMSIC_EIPx_BITS         32
> 
> Why is the number of CSR writes different here for RV32 vs RV64? 

IMSIC_EIPx_BITS is the unit the AIA spec numbers the eip<k>/eie<k> 
registers by. On RV32 all of eip0..eip63 exist and are 32 bits wide. On 
RV64 only the even-numbered ones exist, each being 64 bits wide and 
covering what eip<k> and eip<k+1> cover on RV32; accessing an 
odd-numbered one is an illegal instruction. Hence one 64-bit group of 
interrupt identities takes one register on RV64, but two on RV32.

I will add some small comments:

     for ( i = 0; i < idata->nr_eix; i++ )
     {
         /* On RV64 a 64-bit EIx group is the even-numbered register 
alone. */
         imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
         imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
#ifdef CONFIG_RISCV_32
         /*
          * On RV32 it is split into the even-numbered (low half) and the
          * following odd-numbered (high half) register.
          */
         imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
         imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
#endif
     }

> And
> if so, why would you not use the 64-bit write function, allowing the
> #ifdef to be omitted?

I can introduce something like:

/*
  * On RV64 a 64-bit EIx group is the even-numbered register alone, whereas
  * on RV32 it is split into the even-numbered (low half) and the following
  * odd-numbered (high half) register.
  */
static void imsic_eix_write64(unsigned int ireg, uint64_t val)
{
     imsic_eix_write(ireg, val);
     if ( IS_ENABLED(CONFIG_RISCV_32) )
         imsic_eix_write(ireg + 1, val >> 32);
}

And then:

     for ( i = 0; i < idata->nr_eix; i++ )
     {
         imsic_eix_write64(IMSIC_EIP0 + i * 2, 0);
         imsic_eix_write64(IMSIC_EIE0 + i * 2, 0);
     }

Would it be better?

Or instead of imsic_eix_write64() I could just have a combination of 
imisc_vsfile_local_clear():

     imsic_eix_write(ireg, 0);
     if ( IS_ENABLED(CONFIG_RISCV_32) )
         imsic_eix_write(ireg + 1, 0);

> 
>> @@ -689,6 +818,14 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>   
>>   void imsic_migrate_vcpu(struct vcpu *v)
>>   {
>> +    unsigned int new_vsfile_hgei;
>> +    unsigned int new_vsfile_cpu;
>> +    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
>> +                                          BITS_PER_TYPE(uint64_t));
> 
> As written, this could also be 64. uint64_t is a fixed-width type after
> all. The question here is: Which variable's type do you really mean
> here?

The minimum number of hardware EIx groups is 1 (for the minimum 63 
supported interrupt identities, i.e. DIV_ROUND_UP(63 + 1, 64) = 1), and 
the maximum is 32 (for 2047 identities), on both RV32 and RV64.You are 
right regarding BITS_PER_TYPE(uint64_t). Since an architectural EIx 
group always covers 64 interrupt identities regardless of XLEN, using 
BITS_PER_TYPE(uint64_t) is unnecessarily indirect when we mean a 
constant 64-bit group size.I will simplify this in v3 to use 64.

> 
>> +    struct imsic_vsfile_data vsfile_data = {
>> +        .nr_eix = nr_hw_eix,
> 
> The local variable looks to be used only here. Is there really a need
> for such a local variable?

No, I will drop nr_hw_eix.

> 
>> @@ -699,5 +836,27 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       if ( v->arch.last_cpu == NR_CPUS )
>>           return;
>>   
>> +    /*
>> +     * At this point, all interrupt producers are still using the old IMSIC
>> +     * VS-file.
>> +     */
>> +
>> +    /*
>> +     * Latch the pCPU the new interrupt file is taken from: vgein_assign()
>> +     * allocates it from v->processor's pool of guest interrupt files, and
>> +     * only that hart can access the file afterwards.
>> +     */
>> +    new_vsfile_cpu = v->processor;
> 
> Same here: Is this variable really needed? 

Technically no, it could be used v->processor everywhere but just for 
readability (to how spec is wording migration process) I think I will 
prefer to have new_vsfile_cpu here. But if it doesn't make sense I can 
agree to drop it.

> And what exactly is the comment
> telling me?

I am re-reading it now and it looks just useless.

I think that initially I thought that for some reason v->processor could 
change during the end of migration and so by that I wanted to fix new 
vsfile cpu so all the interrupts will go there before migration functon 
for that vcpu will be called again and reschedule all the interrupt to 
new v->processor.

I think it isn't real case so the comment could be dropped.

> 
>> +    new_vsfile_hgei = vgein_assign(v);
>> +
>> +    /* We don't support SW interrupt files at the moment. */
>> +    BUG_ON(!new_vsfile_hgei);
>> +
>> +    vsfile_data.hgei = new_vsfile_hgei;
> 
> And again - any real need for the separate local variable?

Here I agree, we could have only vsfile_data.hgei.

Thanks.

~ Oleksii



