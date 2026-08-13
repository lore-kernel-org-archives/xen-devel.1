Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC5EC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 08:40:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389524.1630212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuQz6-0003Vf-4a; Thu, 13 Aug 2026 08:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389524.1630212; Thu, 13 Aug 2026 08:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuQz6-0003VY-12; Thu, 13 Aug 2026 08:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1389524;
 Thu, 13 Aug 2026 08:40:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuQz4-0003VP-EP
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 08:40:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuQz3-005fwJ-RS
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:40:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d82ef-e002-0a2a0a5209dd-0a2a4506a920-6
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 10:40:17 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d82f1-195a-0a2a45060019-d155802cb8eb-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 10:40:17 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so22040855e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 01:40:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5612b8sm3760695f8f.1.2026.08.13.01.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 01:40:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786610417; x=1787215217; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioN0GcUgDupZWMnqex7h46Dzd0XGzkRzLaOePnGqE5k=;
        b=XdO5w/QmFHtWZ9Pk171nEx9FVdIEvaJd4NkZW+Pic3DnfXiRuPPO85Tp754s7s2brq
         r4a4DEskDJ9W7035HiqVDjiCySU4yEMLXY/MRg24MyucG2iHD4Z2/skG5hvGD7P/DK2+
         d9r00iOv5pSh/fVD/wfjV15yBoj4QnNytogHrKPU+KrsEFUqzMzwJk5NXcA9aQ8rNIE4
         cgUGARzSMT0MXtQfoQsTkQigU0a2Z6wihi9cBlveOq4xh+rR/EC+meLfCxJhNkjV/U6B
         oNtQMZW49sUBwVbANgjSszX3kiu6ibYPeFGM3pkpkcg+/xnqmNVjs8IVI4hyTx5QVT4J
         DaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610417; x=1787215217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioN0GcUgDupZWMnqex7h46Dzd0XGzkRzLaOePnGqE5k=;
        b=eLBkW31yQZki/apVTa2gQscBpuZ4FCwuealOKTNkEGmjFQ3zr16bf8UfN712tsIBZF
         WqSuZBIcua0n5LfIelHUnRvbbwgI79dReXerQMQnGxH9qyXMf29uKHxJCe/mfK00O8XN
         TtQoVBiP/jv9LkbItCnDsHpsLwj1G2scE/r7Dxh2EdVStsMMUCsWdfmTyeeWOFF5Yp8M
         Lyg2AhBpOJm/K00h+Cgi+kDrT+ulVYJFnWon2ntAKMIlCUkXIc9MT4tWaJvx7RpgCnS7
         9gJ7a7MgpgCEv2aB+YknU4DjT8P+0bkrR8o+2Xgwpl9lSSr7C6rfR0mrxaCIj9nUbPo9
         G1yw==
X-Forwarded-Encrypted: i=1; AHgh+RqeZsMP1j/pmTMNeV+yTsXOJ3k1VSrNGcADHQUCJYl/JmFvRVe8bmZISH0so7iijV1yMeJ2tstn67M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfRVTp577SJ6LVIaCNcszc7ad/jUP2bQN/c800f1N64qGmqq8C
	8XllJ4tPu8+y352X69XfeKPLDJsDM5uiTvETjNCvWjoG/E0RsCGHee2mMabusO1Tng==
X-Gm-Gg: AR+sD11YfPIR202S2KLm0quRz8Q1an+fDf2V6lVdUHb0yxxyBooAP8xrqJfkbc0kJvq
	kCsLN30SD89PfsIqNpoSqKzdUi3XXCzbIuFAU6MXlRGmw0AHUP8ZvSsyQrZUnXEChv4Zwaoo2fn
	dBmYt5kQn07f00N+iTTG1s6vcQWitpjZIV6vjPxMMgtFKyVqgjTRFy2NcoXS7FqqRen8cfDKls4
	V3+v9KolGH+FWNnkB0p7dgsQS5X84uQrepz8D77+v2+TPRtHGpHFupHhTFoWWxRTwWZFdekXIBW
	ZMsHfLHSDLkIzMjYAnPFue7OqZVKarK0ySKlqyPgnZQIS7m0RfvaOrwHGzzKsvr2RdATLLOpgqU
	I8EhBqpwLfA9lXFuqvAvY4IeCm6b7++IpP6zBEZC9gdLmIiivzgl2Aaoy3HLb3tQjGAv+/qIKQp
	5dY1VxMMSZqqF22sJV1lJWNzNps4qM49TIFnj7x6rYwyyQ78SxB27wRlvzbKkpBYhWWfYzBRpfV
	Rhj+8v9vH+4x6uyDQBGDENTVazXD7PyV3DSvRCySXuCTVZc7dB1
X-Received: by 2002:a05:600c:e48a:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-499821fefb3mr30044825e9.17.1786610417106;
        Thu, 13 Aug 2026 01:40:17 -0700 (PDT)
Message-ID: <0cec914c-e52f-41ee-873b-6bdbc1d1ed82@suse.com>
Date: Thu, 13 Aug 2026 10:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nSVM: Check the L1 IOPM_BASE assigned physical
 address
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <f97fdc50622e4db559ce059091d0ebf2028e2f2e.1786114518.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <f97fdc50622e4db559ce059091d0ebf2028e2f2e.1786114518.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786610417-F420077B-8B32B6B8/0/0
X-purgate-type: clean
X-purgate-size: 2360

On 07.08.2026 17:58, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -18,6 +18,7 @@
>  
>  #define NSVM_ERROR_VVMCB        1
>  #define NSVM_ERROR_VMENTRY      2
> +#define IOPM_PAGES_COUNT        3

This new item is separate from the NSVM_ERROR_* values and hence wants separating
by a blank line. Especially with the three numbers being in sequence, not doing
so could end up being confusing.

Considering the constant is used exactly once - do we actually need a constant?
Can't we ...

> @@ -294,6 +295,15 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>      enum hvm_translation_result ret;
>      unsigned long *ns_viomap;
>      bool ioport_80 = true, ioport_ed = true;
> +    gfn_t ns_iopm_end =
> +        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), IOPM_PAGES_COUNT - 1);

... use a suitable expression here, e.g. PFN_DOWN((0xffff + 3) / 8)?

> +    if ( !gfn_valid(v->domain, ns_iopm_end) )
> +    {
> +        gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
> +                 __func__, ns_vmcb->_iopm_base_pa);
> +        return NSVM_ERROR_VVMCB;
> +    }
>  
>      ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
>  
> @@ -302,13 +312,12 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>      if ( ret != HVMTRANS_okay )
>      {
>          gdprintk(XENLOG_ERR, "hvm_copy_from_guest_phys msrpm %u\n", ret);
> -        return 1;
> +        return NSVM_ERROR_VVMCB;
>      }
>  
>      /* Check l1 guest io permission map and get a shadow one based on
>       * if l1 guest intercepts io ports 0x80 and/or 0xED.
>       */
> -    svm->ns_oiomap_pa = svm->ns_iomap_pa;
>      svm->ns_iomap_pa = ns_vmcb->_iopm_base_pa;
>  
>      ns_viomap = hvm_map_guest_frame_ro(svm->ns_iomap_pa >> PAGE_SHIFT, 0);

In the description you say "without any sanity checks", yet
hvm_map_guest_frame_ro() -> _hvm_map_guest_frame() ->
check_get_page_from_gfn() won't allow unsuitable GFNs to be mapped. Since
here only the first page is mapped, some extra checking may indeed be
warranted, but the description then wants updating.

As to that part of the description, "directly to valid host address" also
doesn't look to adequately describe what's going on.

Jan

