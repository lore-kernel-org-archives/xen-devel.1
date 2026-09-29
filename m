Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BAECA5FAC
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 15:53:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436534.1655185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBa92-0007Ak-61; Tue, 29 Sep 2026 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436534.1655185; Tue, 29 Sep 2026 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBa92-0007Ad-1f; Tue, 29 Sep 2026 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 1436534;
 Tue, 29 Sep 2026 15:53:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBa90-0007AX-UT
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 15:53:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBa8z-006poc-Nn
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:53:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbdedd-bab6-0a2a0a5309dd-0a2a4503b096-46
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:53:25 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbdef5-fae8-0a2a45030019-4a7de1628001-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:53:25 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48881a62e09so2672207f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:53:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af508bb41sm5022429f8f.28.2026.09.29.08.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 08:53:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1790697205; x=1791302005; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNCU1+SLYxjwe7JYcba24LoLUluyuPQFyKJ38Du5U5Q=;
        b=LRaz6USMQFGvK6d69KByhvDbTW/C6bjeZizpOb4rGBstuCNlnjs1dTdRwLQegAArEM
         pjG5gQE03TvsfM2rF+eDqIGIang2b/268FjzunMqpgDT2QFGurMCFodRWsuLUUX/KFwo
         2+QOWGoqqmdCoq3SSjL8lHjs2EMBoZi0ecgOCwFCf6QD/C0NpcIY9inzEjulp3YGN/zd
         i4FSwMFrQCuL2Kk4yU72THCUcNxxA6D8MfVqDHS88sU95sc3bXXC5fy78ukzj6VF2+vv
         qwvS8aWaFURoBBZPb5Q2ewbvWZ+LehAHmuco643DxagR1AUuhriIw1OdYMiHM/ViaBqx
         Wviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697205; x=1791302005;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNCU1+SLYxjwe7JYcba24LoLUluyuPQFyKJ38Du5U5Q=;
        b=FQfX/PbPxQpK+E0Dw8WethnpjLIQAnPGiDSJeTAPqhzEDJZVdqA1kbUTsocFduTNn3
         NgcQS/wW48sJE3qSipB7b8L2LhV0pO3QFNpVhflRR0mRjwoATVo85Z4zZyentEzhYpfT
         dEPZsDxNzxCdNyW5tESdc0I0vR7pDHgLU/Bfiq+Fmu3Zu7UJBwWW9wcJCLJPgTOGH5NE
         5u8QHpb5N0jACS9EdJCw1gu0c6+7WU/Yv9yKltJQNudVN3WVupcP8Otvxgdc3uLOA4kO
         3FX7VH8waNkOBUuY39Dh96nRn0tM+0/dSuP5BHacqc8Z6oBBXyDeJm7b654V8oNFh3RR
         1IiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8YkrioE0kP+7AVfwnQX3Me2m6x6tSz2mkTrq5a+dXTkMiUPDixBeipEtPGNFpfKI1jcMbC77I2ts=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ2HbBbBtez9UsijeCzEJsSlOCyNakpI49rpWevXRhu21dW2Tx/
	xRSHO1qF4gEz4iIJAvaxrak5v5IIGV2fa6Vyqr3eGKQFZoFj+H4GuzlkbKA0jcaxrw==
X-Gm-Gg: AYBFou34VhRCXpimsA6eDOfcXnb+tjNftrtK4yyVtRDDpZtyNt8TbC/goBBTvNK6uiy
	3LN7hfSLWYHBc0Il6Bdi6FQcMDPE2CELDlS7y4cfrH8GNcZcCLB5zu+lEStvJiWp00fkDGZoCx7
	8RJoDdhkgtCSboaeOLcLX3gg8bWkOh8g11NxhKhC2xpGH+L17Yivc2xqf1orU0363sf7xQkAEdY
	ilpMSYE5M78N+R8oKD1+Bj8E7LBG4gQWbsJcI9HrtHuDGtxx7xyME5FrdwKTQPbAUwBBnCZEOC0
	ukIHG6uZz0fQ+jzCJwjM2V0uMa136GlWuFtsCQ6zjNIDNsBw4sOneI5sL7neOjh1GUsQpzJFftf
	plx5JHGqE3AiVaqxj7HqxsHCi5ABxszx3uy5nKwPNwAMQIJa46fDyxenH8T8OBHkjoB0b+KLJuY
	0S8NNV+otrC/qc8rmIFz/SLy3adt6uD/O/txbI/+qWD5JRY5q700eYlaeuaCR9Y1SxFpUyJkIlO
	zGrcN4kXnjYL3z30raXdm/53wV0hLxopSJISJ6P6KUvMHWifB7mg+lP4Si0oHo=
X-Received: by 2002:a05:6000:4108:b0:488:7787:469d with SMTP id ffacd0b85a97d-4887787490dmr22638675f8f.25.1790697204847;
        Tue, 29 Sep 2026 08:53:24 -0700 (PDT)
Message-ID: <252b42e8-d710-46f6-b837-21a9e6198d46@suse.com>
Date: Tue, 29 Sep 2026 17:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nSVM: Save L2's CR0, CR4 and EFER on #VMEXIT, not
 Xen's
To: Lin Liu <lin.liu01@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <33c6c6e2838745be1de15874856812bb68e671cc.1790587806.git.lin.liu01@citrix.com>
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
In-Reply-To: <33c6c6e2838745be1de15874856812bb68e671cc.1790587806.git.lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790697205-760FE4E9-B4EB5009/10/78276251493
X-purgate-type: spam
X-purgate-size: 2026

On 28.09.2026 12:23, Lin Liu wrote:
> nsvm_vmcb_prepare4vmexit() copies CR0, CR4 and EFER out of the shadow
> VMCB, but Xen does not run L2 with L2's own values: svm_update_guest_cr()
> ORs in HVM_CR4_HOST_MASK and, under shadow paging, CR0.PG|WP, and
> svm_update_guest_efer() forces EFER.SVME.  Hardware writes back what L2
> ran with, so L1 reads Xen's bits back as L2's.  Save the shadowed values
> instead.
> 
> CR4 leaks CR4.MCE under HAP.  EFER is observable on a VMRUN rejected for
> SVME=0: L1 gets back a VMCB with the bit it deliberately cleared.  CR0 is
> a no-op today, since nested virt requires HAP, and is changed for
> consistency.
> 
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lin Liu <lin.liu01@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1079,11 +1079,11 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      ns_vmcb->_cpl = n2vmcb->_cpl;
>  
>      /* EFER */
> -    ns_vmcb->_efer = n2vmcb->_efer;
> +    ns_vmcb->_efer = v->arch.hvm.guest_efer;
>  
>      /* CRn */
> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
> -    ns_vmcb->_cr0 = n2vmcb->_cr0;
> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
> +    ns_vmcb->_cr0 = v->arch.hvm.guest_cr[0];
>  
>      /* DRn */
>      ns_vmcb->_dr7 = n2vmcb->_dr7;

... I still think it is a mistake to leave alone the similar CR2 handling
code further down in the function. Yes, #PF handling in
nsvm_vcpu_vmexit_inject() updates the value, but as indicated before that
(aiui) still leaves (at least) the case where L2 writes CR2 explicitly.

nestedsvm_vmexit_n2n1() -> nsvm_vmcb_prepare4vmexit() runs ahead of
nsvm_vcpu_vmexit_inject(), i.e. whatever nsvm_vmcb_prepare4vmexit() would
store would still be properly updated by nsvm_vcpu_vmexit_inject() (yet,
as said, only in the #PF case).

Jan

