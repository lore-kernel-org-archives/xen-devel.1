Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D527EC98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 15:22:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432532.1653754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lGp-0004Ln-7b; Thu, 24 Sep 2026 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432532.1653754; Thu, 24 Sep 2026 15:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lGp-0004Lg-4r; Thu, 24 Sep 2026 15:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1432532;
 Thu, 24 Sep 2026 15:21:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9lGo-0004La-3J
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:21:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9lGn-006wTd-CM
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 17:21:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab54011-bab6-0a2a0a5309dd-0a2a450cb5e6-8
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:21:57 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab54015-f479-0a2a450c0019-4a7de18cfa3a-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:21:57 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso27897225e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 08:21:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c3731fsm141138565e9.2.2026.09.24.08.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 08:21:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1790263317; x=1790868117; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ6Z5Fp/6POQiZdohnTBjItV7NbW9wvywJBkS1/asbw=;
        b=b2Jk8rmfkR+DIX7xsUKSyA1xc9Airrg8vuQhqKloj4Etjw84bWNVaWKA11AE/S4cuv
         PMAONIBzdsxbrW7n0O61OHRY9at6W2zgLnGgB137b9wPmP073vCfocKMdl/z7BkmBrGl
         G/sZt6lo7E5TcfBGV6oM1V+ZSYOB2rLng3TzJh9IL+RWE7RL7Pbdi+n5mL5V6UF1YKOq
         r2GdoBYgN2xWXWi9GPJNKlLMoC82dCaVxipzeRaIY12NjoHUIXrENspH9lMEtZZkfJQN
         6fmqoF06/y3rD83801Vg9fNvDAhq0JI+Qzefeg50UEWVQcIvHbURribEye6CMDKZDMY4
         AN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263317; x=1790868117;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQ6Z5Fp/6POQiZdohnTBjItV7NbW9wvywJBkS1/asbw=;
        b=b30oFjgXL7wKXcfw7DC6rkmr36dDiKUfmCaB39rQ4VpBI1oVL6A/2FnciWup0JIg2J
         NHscyivLyowm6qmj2UnpAkIAiGnhe81yClJJMonVazJExRyeWAYHHZZx30hPt0rC6qdU
         qAWHsahYdymIpNtFGGSIRx6kbhqVwNQEeN9i9JQKyrBBDdBN2gVTTYKtC5RSjqPpy2Hs
         ueIW/116/sWyOIxqynwqGH1yccclU+fmPca8wvkteK4VYGDhdeLy+q33+sXhaNRJuXih
         NSJnSOG+ttw2bmN3xvnVTK/sG3HQCyHGKzYquyuS99hbYnvxGSnADXiX5rjNgMP3MTEb
         ZJaw==
X-Forwarded-Encrypted: i=1; AKwUvBw3gb1b1BqYBJF8jao+uSDVGFPe2ZEprNlk9CvKvujSEhdsdstyVBtwqPvS3b+ZrW77kyqOZho7du8=@lists.xenproject.org
X-Gm-Message-State: AFuF++mxcy38LOV+TDY+CW3eQ84vJGzUOcnoF510FbDYvpSUugsFJum6
	kkbJ7Bg+hPYERoayWlZQtMy4no4bXgU+BNnAPZMi+kim+dY2Xw9URr6u6DJGG/wcxQ==
X-Gm-Gg: AYBFou1PcMiG48e0tDxk85jULMw5WsMOzfWYIMKusSAXUQPjj9cn4wk79S01XCtHCmT
	uGQCQw07l8foh1XFjBS9R66qUYQ8a5FVPKSd6J2vAKmLrafZD2JuDVMbFlu6itjB5y8f6oqvzjn
	o7LF0JYMEH6pcen6IUuGYXrsuHIJjz6V+7+5yoCWmjCiMYuEocsMm9OlxV//qwSbE5V8+I13+YB
	Rm3PxdNvfRwYl1VObXIR9FMwdy3usoCcEHvIM1AsGSADf+DDPOdwtPwTAWecRuK+X6PgHC3M0Z1
	72A4g761Cqx6E58gJU6JJZvy37Z4ozlIj+60kPGNJh8Nw7WuX3h5gMGKJvW9e9h6G5xg2nM+RsW
	86ovqMPxyWsQZrCOn7r4EB9QuEMwQQxC04lZQt3ZMDALjtags6jlXVYbXsLgaBnWjuvjnWu1DhJ
	BGoke1DZHmvJuVebvSQlazgMYDoHwhojYBl39+mcaZ3A1gCcOMgJsnU9KCgAZCOobzzBSlhWFsG
	S0/qD4qL5amCqPrlv8FXyWGXFTojNMAMMnhU58PGr/nILTqWiOltd0yabw5+g==
X-Received: by 2002:a05:600d:8482:20b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fe67bc264mr36213175e9.29.1790263316630;
        Thu, 24 Sep 2026 08:21:56 -0700 (PDT)
Message-ID: <8bc996ec-09c0-4241-bc3a-64dbf44c5e5f@suse.com>
Date: Thu, 24 Sep 2026 17:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
To: Lin Liu <lin.liu01@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
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
In-Reply-To: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790263317-51F33A5B-27E84408/0/0
X-purgate-type: clean
X-purgate-size: 607

On 23.09.2026 11:51, Lin Liu wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      ns_vmcb->_efer = n2vmcb->_efer;
>  
>      /* CRn */
> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>      ns_vmcb->_cr0 = n2vmcb->_cr0;

In addition to mirroring the change to CR0 and EFER, doesn't CR2 also
need handling the same way? Effectively the inverse direction of anything
respective that nsvm_vmcb_prepare4vmrun() does?

Jan

