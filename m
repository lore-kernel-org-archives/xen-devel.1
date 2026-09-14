Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27D5C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 13:13:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420940.1647136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x66VC-0003dC-FU; Mon, 14 Sep 2026 13:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420940.1647136; Mon, 14 Sep 2026 13:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x66VC-0003d5-Ck; Mon, 14 Sep 2026 13:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1420940;
 Mon, 14 Sep 2026 13:13:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x66VA-0003cy-Ve
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:13:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x66VA-00GsrM-Bk
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:13:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7f2f2-2eae-0a2a0a5409dd-0a2a450b974e-36
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 15:13:40 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7f304-b7e8-0a2a450b0019-d1558031e0e4-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 15:13:40 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49e78adf099so12412825e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 06:13:40 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60ad0614sm339581965e9.10.2026.09.14.06.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 06:13:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1789391619; x=1789996419; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5CB6YBam0fmqhE0ijkrGF3sE995xttITmudScBDlcc=;
        b=FSI44xCOvPRRcPjG861CS/0WJ/Z6FIQTvh4GAwp9l+SqFy3vm+EFSIFo3FBLzaBYae
         HrDFkReB6rg4QVhcD6S4toHoS1XfYU299dVELsSYCzbP5U6tj7M/MNQMoYxGeajIkfwG
         NAKwP3fcJvXvBCMLoCQ8Ucd5O7ZVhAK1bHiYOHyxe8f1b/0EKnWj8wYOgs+HhVY+Pyrc
         Ty1kvH2eXjKy7uVzvzaeU5uPE0vRzcVTYWcSJFyccG90fOrhCADIj6AkYEu+nJO32y4Y
         oh46k5iVVo5OY84Ol902fQuyNc4wq82IeLzbEOAKFz3FRGboLLS7LeQH2iI5SGJH9buH
         h6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391619; x=1789996419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5CB6YBam0fmqhE0ijkrGF3sE995xttITmudScBDlcc=;
        b=KdVbGYjsqO9evId+wzuC94rfJeaeDAxtt2gBtca32lyyIUA9BIN2fcWVu5JmTaxuIh
         y//lcaE0SVKmnYsl8BbHKSkcuwrK4wVKHFNMUmQfZ6vvk0GvwDi8XNNgLtWvznTzKbKB
         gQ8e7965mqbynsT3ywPfT+ApAXuhl3Eq3L7kutuiYyGGWNO5IcBo+D/sfn5uhR4x4yv9
         gCGVEr9jSmq22PbefIfArMjc9uJP2r+K/0a0XwQf6mJc5y2Cr6uL49EFLJPR/w7oo0wY
         4OrEpuY/Gd21QdDA7nKTpGPr6K/WUX29d0prpgW8ez/oqs+nu5vP3YQ2bAbUbkai5XNt
         Vhvg==
X-Forwarded-Encrypted: i=1; AKwUvBzmuD9bWHQpbww+3oBzgGH/M7rKXSXXt2Opeayv7Rln++wSuL6xyUY7HQjt8JNo3G77yKlQd2o8ags=@lists.xenproject.org
X-Gm-Message-State: AFuF++ko75xzkp9JlgW02XxGJM40I6ZYi2c5vl/MZ38Wsx0b9LQzQdCY
	lpj+1F3Wj4u7ymbflu2yfF1Y0CdfI5zzJSgss7zzfkM/d7O+k8l6/B5906Zhxd9dSQ==
X-Gm-Gg: AYBFou1B8OXbmZPN72rQ9/pr95QeruCxTVGJ0mXbWMJQnMORwrvupuI2ZhwsoxNTorp
	dXcUAptO4HyK6RhR4dA4ElB6LWxx3XyBnk8VxS4AcmGvVfbJy7ZAZx1VapfuHbKmKlit3yO5TB1
	1MmXc9yCcCMP2Ke3k7C/Sx2zYdY1RgWzJGrV24176HAqBIb/t1UMu059+IAKtYzDx6FkoQcNF5U
	W5xJxBgy9fHbRRQOE93dd3BHbs8aBZaUhfIpYTSoBxfT4FdcP7U5Cw7fVPx3YTWzM1rQ1Y7xST4
	hmz2eFx48Q/HhhonTLryH61UntiDkcx2xh9LPFMH0/AUOWjZGUfX+hBEdUGHO5/1odJ5SgTrh0j
	3fNfAxVn0RmjSkMRcOBUkE68u9+gAdcZYwAt3mkvYysC9x4WR7jvGXNTgTO4x4tV6lrkb7ng33f
	d0HlWVHEWIysXSK88XwU73KFMTOISNjsDZCu+AwPKlM+FsA4Gbd66fkG98oTac2ecap62Upr9dN
	py1KLqQTOBFvw==
X-Received: by 2002:a05:600c:860b:b0:49e:79c5:ee93 with SMTP id 5b1f17b1804b1-49e7a64b4dbmr28601075e9.8.1789391619585;
        Mon, 14 Sep 2026 06:13:39 -0700 (PDT)
Message-ID: <2ea26d3b-6413-410f-9cb1-59645cf594e2@suse.com>
Date: Mon, 14 Sep 2026 15:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
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
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789391620-A96C29EA-43E18A0D/0/0
X-purgate-type: clean
X-purgate-size: 6288

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> @@ -77,6 +78,64 @@ do {                            \
>      csr_clear(CSR_SIREG, v);    \
>  } while (0)
>  
> +#define imsic_vs_csr_write(c, v)    \
> +do {                                \
> +    csr_write(CSR_VSISELECT, (c));  \
> +    csr_write(CSR_VSIREG, (v));     \

As patch context also tells: Excess parentheses.

> +} while ( 0 )
> +
> +/*
> + * Generic switchcase expansion pyramid.
> + * F is the per-operation leaf macro, ireg is the base register index.
> + * Optional extra args (e.g. an operation and/or a value) are forwarded to F
> + * via __VA_ARGS__.

Just that there's no F below.

> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg,v); break;"
> + * imsic_switchcase_ret(ireg, op, ...) - emit "case ireg: return op(ireg[,v]);"
> + *   The variadic tail is optional so the same leaf works for both read (no v)
> + *   and swap (with v).
> + */
> +#define imsic_switchcase_break(ireg, op, v) \
> +    case ireg:                              \
> +        op(ireg, v);                        \
> +        break;
> +
> +#define imsic_switchcase_ret(ireg, op, ...) \
> +    case ireg:                              \
> +        return op(ireg, ##__VA_ARGS__);
> +
> +#define imsic_switchcase_2(F, ireg, ...)    \
> +    F(ireg + 0, ##__VA_ARGS__)              \
> +    F(ireg + 1, ##__VA_ARGS__)

Ah, there is an F here.

This (recurring below) shows another problem: The two F invocations
look syntacticlly incorrect, due to the missing semicolon. Semicolon
use wants redoing everywhere here.

Further (and again throughout) I think we'd be better off using either
standard C constructs (e.g. __VA_ARGS__) or the gcc extension
permitting use of ## after a comma. A mix of both always looks odd
(to me at least).

Finally, unlike further up, here (and below) ireg wants parenthesizing.

> @@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
>      return 0;
>  }
>  
> +/*
> + * Arguments of the imsic_vsfile_local_*() helpers, which are executed by the
> + * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
> + */
> +struct imsic_vsfile_data {
> +    unsigned int hgei;
> +    unsigned int nr_eix;
> +    struct imsic_mrif *mrif;

I can't spot any use of this field (and hence I also can't judge
whether const wants adding).

> +};
> +
> +/*
> + * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
> + * going to work with.
> + *
> + * An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart the
> + * file belongs to, and a guest interrupt file index is meaningless on any
> + * other hart, so such work always has to be done by that very hart.
> + *
> + * The local case runs with IRQs disabled to provide func() with the same
> + * environment it is given when it is called from the function call IPI
> + * handler.
> + */
> +static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
> +                              void *data)

If this is supposed to be passed struct imsic_vsfile_data *, why not say
so here? Be as type-safe as possible. Of course the callback function
has to use void *.

> +static void cf_check imsic_vsfile_local_clear(void *data)
> +{
> +    unsigned int i;
> +    const struct imsic_vsfile_data *idata = data;
> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> +
> +    /* We can only zero-out if we have a IMSIC VS-file */
> +    if ( !idata->hgei )
> +        return;

Wouldn't it make sense to avoid the call here altogether then?

> +    old_vsiselect = csr_read(CSR_VSISELECT);

Likely obvious to you, but I can't spot why vsiselect would need saving
here. If you want me to ack such code, please add at least brief comments.

> +    old_hstatus = csr_read(CSR_HSTATUS);
> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> +    csr_write(CSR_HSTATUS, new_hstatus);
> +
> +    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
> +    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
> +
> +    for ( i = 0; i < idata->nr_eix; i++ )
> +    {
> +        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
> +        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
> +#ifdef CONFIG_RISCV_32
> +        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
> +        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
> +#endif

In asm/imsic.h I see

#define IMSIC_EIPx_BITS         32

Why is the number of CSR writes different here for RV32 vs RV64? And
if so, why would you not use the 64-bit write function, allowing the
#ifdef to be omitted?

> @@ -689,6 +818,14 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>  
>  void imsic_migrate_vcpu(struct vcpu *v)
>  {
> +    unsigned int new_vsfile_hgei;
> +    unsigned int new_vsfile_cpu;
> +    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
> +                                          BITS_PER_TYPE(uint64_t));

As written, this could also be 64. uint64_t is a fixed-width type after
all. The question here is: Which variable's type do you really mean
here?

> +    struct imsic_vsfile_data vsfile_data = {
> +        .nr_eix = nr_hw_eix,

The local variable looks to be used only here. Is there really a need
for such a local variable?

> @@ -699,5 +836,27 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      if ( v->arch.last_cpu == NR_CPUS )
>          return;
>  
> +    /*
> +     * At this point, all interrupt producers are still using the old IMSIC
> +     * VS-file.
> +     */
> +
> +    /*
> +     * Latch the pCPU the new interrupt file is taken from: vgein_assign()
> +     * allocates it from v->processor's pool of guest interrupt files, and
> +     * only that hart can access the file afterwards.
> +     */
> +    new_vsfile_cpu = v->processor;

Same here: Is this variable really needed? And what exactly is the comment
telling me?

> +    new_vsfile_hgei = vgein_assign(v);
> +
> +    /* We don't support SW interrupt files at the moment. */
> +    BUG_ON(!new_vsfile_hgei);
> +
> +    vsfile_data.hgei = new_vsfile_hgei;

And again - any real need for the separate local variable?

Jan

