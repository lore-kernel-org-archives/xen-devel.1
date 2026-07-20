Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80761C44521
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:19:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366135.1616028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wliHp-0008CD-64; Mon, 20 Jul 2026 07:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366135.1616028; Mon, 20 Jul 2026 07:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wliHp-0008C6-3S; Mon, 20 Jul 2026 07:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1366135;
 Mon, 20 Jul 2026 07:19:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wliHn-0008C0-1b
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:19:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wliHm-000DDV-EL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:19:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5dcbf7-5cb7-0a2a0a5109dd-0a2a4509ec72-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:19:34 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5dcbff-be1a-0a2a45090019-d155802cc44a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:19:27 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso12753855e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 00:19:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm25670999f8f.35.2026.07.20.00.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 00:19:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1784531967; x=1785136767; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykyWWK+VUt4EYjbVAGccjri2nV/bqYhJg97wYXOcOU4=;
        b=JfzzEMaJ7WyNGiadADD5Q0SI2VTVuTdWCV2rSIYgZFHo08JBjOUNc/LaA3oob1rdl4
         MVw41RV3NRLQOxgzCVahzBnjplYoX7+34tjpinlQD7P1gfJ32yfRLTlCum79AJmy67qn
         sgm84FfLZmxuG3J5bN1lWPhcT11JP8th/mt/VzFUHtYEyjQtFVk4fzx2Jl34e2bg89n9
         YgKRn2YmPftpeUiNza6p0FH/12J3V3Nps3F6lcpL6jFdx2tWNGoKoousuev1qLzdUo2V
         ClqY8yoojVowzVIetHqcx1jfF5ncx+1Fftyn0Ej71aoPIpeo+gpM2aWDElLdIS7oJ60W
         BkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531967; x=1785136767;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykyWWK+VUt4EYjbVAGccjri2nV/bqYhJg97wYXOcOU4=;
        b=FhWm0zg1cpH0BxavlemFplxFnAuiN0+IsabNKsfSs+cS3ap5N3cdBWwAu6bftqfTZk
         J/MmaGZeFWIooPA1DGBJMflqLiBLGTl1wFQA/SES9mbepk3FGTbzCIdu2k7OeuN3qnD5
         8IgMzrFP0tE7OCieYfsLDwEKPZLwo7hwrpAWUF4KVcS+MZANzRn3DY+KUZvoszS2KwSk
         D0SPRFeME/PjnKOzx1ny6MDmaS1X8BJQdKzOGbXrSjSfWL61L7dINtTP5PuVcJYJYCEi
         CT0JL4j+ybflLCozbCViwWE9bW01nvpNNgIbforVAabR0Fv5Xkl5xY4r6P5iXK/MPoXs
         mgiw==
X-Forwarded-Encrypted: i=1; AHgh+RqfNX3WexCG8biy6SwDLoKNCTXQZNSWeCEBfi8XJxDd+Xf0/5fdXCsrX7cQ3norrIOqwJjETYsJRZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAgsJ04ngj6y6uSXRv4EX1bqInmei+1RkZ5brkIExZQX/CczUJ
	m9DWQCIDSPvsc1KwAgYCHHW5UzUD8faimgHFVv9HYZbEJbyQZJxCfhxdaYEqNWYw1Q==
X-Gm-Gg: AfdE7cmmAQq91aRYclkLI1gaSY+LhNXhzy3S1hgxMC7PyeoRA/jbip/hnUhr+if8/6D
	cEx9eZfVJ4KWpE9DS7PyJIBoG9KlODVeBQAomj+B7duCPN21LIGj2wYSyFUF0tG9Hz0ldqwwE2r
	tJT9DnZwUnhHmS2vRljAMelM7EH0evjB+66wp5EYEKNv0LK1zUHxtoSfvTgRT20s1gQV2F9673A
	bHfyrvZDxuOWQ/UYOYZFhPa6NBbAI+1BgmpUwo3QhEqq14FgkkbltsnsSEgEFlTKKVJ7Ba/hGop
	a9fd+hD7KeXTANKYAIu/84utv4d0Q37tq3b5BVpee4SpxUgeAEmDzmj0u+f/klCm3UV5uJPGTek
	aF3AsTjMA98thOPLfhRB0GMtsJAKJZ7+HOpNmn6+XdU6ll3kZQdU2PnNTa5RKCTh2iSRRH6BAWa
	mOy78tzWE9Nf1kf9V8r9rKN405WX6P1AhB6WELMGrHoo44SMi0txF2mims/citAdqUg2+npn558
	gl6
X-Received: by 2002:a05:600c:6212:b0:495:5375:2510 with SMTP id 5b1f17b1804b1-495537526b4mr75573005e9.24.1784531967087;
        Mon, 20 Jul 2026 00:19:27 -0700 (PDT)
Message-ID: <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
Date: Mon, 20 Jul 2026 09:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784531967-FDC6D034-4274AEA1/0/0
X-purgate-type: clean
X-purgate-size: 3336

On 20.07.2026 02:12, Marek Marczykowski-Górecki wrote:
> Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
> converted memcpy() of the cpu_user_regs structure to explicit copy of
> its fields. In the compat case, it intentionally missed few of them,
> named in the commit message. But the 64bit case missed also r8-r15
> registers, which was not intentional. This, at least, caused Linux
> 6.18.x crash when resuming PVH domU.

Oh, wow, what a bad mistake (including by me as the reviewer).

> Fix it by adding missing assignments.
> 
> Fixes: 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One remark though (equally applying to the original change):

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1255,6 +1255,14 @@ int arch_set_info_guest(
>  
>      if ( !compat )
>      {
> +        v->arch.user_regs.r15               = c.nat->user_regs.r15;
> +        v->arch.user_regs.r14               = c.nat->user_regs.r14;
> +        v->arch.user_regs.r13               = c.nat->user_regs.r13;
> +        v->arch.user_regs.r12               = c.nat->user_regs.r12;
> +        v->arch.user_regs.r11               = c.nat->user_regs.r11;
> +        v->arch.user_regs.r10               = c.nat->user_regs.r10;
> +        v->arch.user_regs.r9                = c.nat->user_regs.r9;
> +        v->arch.user_regs.r8                = c.nat->user_regs.r8;
>          v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
>          v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
>          v->arch.user_regs.rdx               = c.nat->user_regs.rdx;

Neither here nor ...

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1481,6 +1481,14 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>      if ( !compat )
>      {
>          /* Backing memory is pre-zeroed. */
> +        c.nat->user_regs.r15               = v->arch.user_regs.r15;
> +        c.nat->user_regs.r14               = v->arch.user_regs.r14;
> +        c.nat->user_regs.r13               = v->arch.user_regs.r13;
> +        c.nat->user_regs.r12               = v->arch.user_regs.r12;
> +        c.nat->user_regs.r11               = v->arch.user_regs.r11;
> +        c.nat->user_regs.r10               = v->arch.user_regs.r10;
> +        c.nat->user_regs.r9                = v->arch.user_regs.r9;
> +        c.nat->user_regs.r8                = v->arch.user_regs.r8;
>          c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
>          c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
>          c.nat->user_regs.rdx               = v->arch.user_regs.rdx;

... here it becomes clear what has determined the order in which fields
are copied. It's neither by register number nor by field order nor
alphabetically. We might do ourselves a (however minor) favor if we used
a clear criteria; likely field order would be best. The more that the
new internal struct cpu_user_regs mirrors field order from the original
external one. Andrew (in particular)?

Also, despite this being an issue in 4.21 already, I think this definitely
wants considering for 4.22.

Jan

