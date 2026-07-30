Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E049FC55165
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 13:14:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377774.1623606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpQaM-0004dW-M2; Thu, 30 Jul 2026 13:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377774.1623606; Thu, 30 Jul 2026 13:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpQaM-0004dP-J3; Thu, 30 Jul 2026 13:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1377774;
 Thu, 30 Jul 2026 13:14:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpQaK-0004dH-GB
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 13:14:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpQaJ-00058Y-PA
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:14:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b4e1a-5cb7-0a2a0a5109dd-0a2a4502de16-12
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 15:14:03 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b4e1b-6ca4-0a2a45020019-d155dd2ea4b7-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 15:14:03 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso743672f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 06:14:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc88d8d37sm5768244f8f.8.2026.07.30.06.14.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 06:14:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785417243; x=1786022043; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=whV/u9EkReVT/Ja31GbWvlmguODJTCAafpM9z/1d1SQ=;
        b=fmWttsLToCzZsTLLpD/1SG5boSdyN5fXRXyU0vW1DQ7EV+GqpMvLPQlyxdsRt3H+r8
         QLQhra1PNwftgWS6po/n8wZIRtnC3bjuZGyu9Gq8axQgl6abds40a3lz5z29WaatAznq
         sxykoZ/s2xM5RinnAMPNHM8OwugArhfo3eINqK4L8boFMGS0G0WH41ZLC4FwMoGvwuko
         plUINV5W6n8V8RfQMpQLXuVpB3GYfH/boBRhiKxH5vlvPIiHhcFtQ8gOIOK+RQ5AUOp6
         JlcV2ocB5qRU4Xt0AGD+GZU4g+jSbDU4ZS2yxi++QyPIgi40Ub+AhVKtjqdL23Z/Tgs4
         o7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417243; x=1786022043;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whV/u9EkReVT/Ja31GbWvlmguODJTCAafpM9z/1d1SQ=;
        b=bQqvzNv3mfFWLT9jwga0mbx5XRLoNQFI/dSnfJBQb5TmIuwwYeeb+2tST35Xzdfnen
         EAx2jJ+R7Q2VetFenDMXXu4Z/IXZdhlsI5cKZ3t7l86+s0Ax+Oub7EHFGyacTaqCJQRn
         6EVZxqcWb0JNivjcUZ2KgN6AMnR+f9CYooGAZe/Uxjo7qHmGLJfXdVPf3rQD1ynHpVwD
         uKQ55nmLNN5o2p5nz3qizZn3zQCVDUHj88rFos0R5p9dv2QvxaSrDxzPtIyLA+2w67uh
         yJFQn1mxsARkQGhrI5qy2zXh3PSTHIfHaUovn8Be45JizX2/5DVCGSZ8lf5z7axNAjZY
         yJ/Q==
X-Gm-Message-State: AOJu0Yyl/3/YkwUuA3BMkDcd5l45nNsjd1EwNLUmnXbwYvPLBx7AiRcd
	acOAhqahaBwOjtS47hDDvN2CKW96rMyfUggSGV2LiL4lU5n1morIZDoYVrP3T+D0z9o5k5GzMz7
	j6POU7A==
X-Gm-Gg: AR+sD13hkPTXDkDLp7/d4qgoJlJdgond+vX/i7YbHEA/UFpgqmOtdFWX7fxaLmaFcq9
	TSnlw/s1Od7XJmo0yoCZg53hTiV7t9GgBS39x6QTW0huRx9TB9VIFQbiJyVQ1uuEuLbDaU/Wbke
	SMqLmRiuI+c/khrKBEoUWTWXAC2Yx1qEjeRVTkp3XiFxfdg8RK8YFWqpS0oJmWAUxNMjhpi9ar4
	5OL8TFoIN5PfcOPabfhD7NqnYmmyURkiEH/KxYELyYIao5bn1amsUSX/Sxtx9QAXTWh5/X/uGAH
	RxFhNupxHu52xYlkThSCcQbcZxfAtMJzRCLlbXlYejT1PuiLniC7BzhPHF6nfYUl67Qb4Up+3I1
	qXAzS5pzcAmMKCj2bNQfZQc7+6eLgbubKqZ+mxi3MEgfthTauoBoSpEYtDOmWPnEqW6U1FMuMvo
	hGZ2Q5UGSAcr5W264tYwzABUjnJYzBNfUaJkyWa9vwg9QhWD3RZOl7bstmJfGUPGFR9+StxPl4H
	TjAvzvYBlaMUUx4VpD44enKUkONr1vdL9gGkV8FU7SadzFWiXoo
X-Received: by 2002:a05:6000:43c5:10b0:47f:8eb0:c825 with SMTP id ffacd0b85a97d-47fcbdb6665mr327463f8f.24.1785417242828;
        Thu, 30 Jul 2026 06:14:02 -0700 (PDT)
Message-ID: <d0ff411c-3bd9-4306-8782-ac63f7b202da@suse.com>
Date: Thu, 30 Jul 2026 15:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a6b266559168_35fb2bc1be9079a4147ab@prd-scan-dashboard-0.mail>
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
In-Reply-To: <6a6b266559168_35fb2bc1be9079a4147ab@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785417243-66CB22AC-5371C6FD/0/0
X-purgate-type: clean
X-purgate-size: 5196

On 30.07.2026 12:24, scan-admin@coverity.com wrote:
> ** CID 1697485:       Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/hvm.c: 2436           in hvm_set_cr3()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1697485:         Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/hvm.c: 2436             in hvm_set_cr3()
> 2430                 curr->arch.vm_event->write_data.cr3_noflush = noflush;
> 2431     
> 2432                 return X86EMUL_OKAY;
> 2433             }
> 2434         }
> 2435     
>>>>     CID 1697485:         Control flow issues  (DEADCODE)
>>>>     Execution cannot reach the expression "(value ^ curr->arch.hvm.guest_cr[3]) >> 12" inside this statement: "if (!!(curr->arch.hvm.guest...".
> 2436         if ( hvm_paging_enabled(curr) && paging_mode_shadow(currd) &&
> 2437              ((value ^ curr->arch.hvm.guest_cr[3]) >> PAGE_SHIFT) )
> 2438         {
> 2439             /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
> 2440             struct page_info *page;
> 2441     
> 
> ** CID 1697484:       Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/svm/svm.c: 128           in svm_update_guest_cr()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1697484:         Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/svm/svm.c: 128             in svm_update_guest_cr()
> 122                      monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
> 123                    vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
> 124             }
> 125     
> 126             value = v->arch.hvm.guest_cr[0];
> 127             if ( paging_mode_shadow(v->domain) )
>>>>     CID 1697484:         Control flow issues  (DEADCODE)
>>>>     Execution cannot reach this statement: "value |= 0x80010000UL;".
> 128                 value |= X86_CR0_PG | X86_CR0_WP;
> 129             vmcb_set_cr0(vmcb, value);
> 130             break;
> 131     
> 132         case 2:
> 133             vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
> 
> ** CID 1697483:       Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/svm/svm.c: 396           in svm_vmcb_restore()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1697483:         Control flow issues  (DEADCODE)
> /xen/arch/x86/hvm/svm/svm.c: 396             in svm_vmcb_restore()
> 390                 return -EINVAL;
> 391             }
> 392         }
> 393     
> 394         if ( paging_mode_shadow(v->domain) )
> 395         {
>>>>     CID 1697483:         Control flow issues  (DEADCODE)
>>>>     Execution cannot reach this statement: "if (c->cr0 & 0x80000000UL) ...".
> 396             if ( c->cr0 & X86_CR0_PG )
> 397             {
> 398                 page = get_page_from_gfn(v->domain, c->cr3 >> PAGE_SHIFT,
> 399                                          NULL, P2M_ALLOC);
> 400                 if ( !page )
> 401                 {
> 
> ** CID 1697482:         (DEADCODE)
> /xen/arch/x86/hvm/hvm.c: 2332           in hvm_set_cr0()
> /xen/arch/x86/hvm/hvm.c: 2382           in hvm_set_cr0()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1697482:           (DEADCODE)
> /xen/arch/x86/hvm/hvm.c: 2332             in hvm_set_cr0()
> 2326                 hvm_update_guest_efer(v);
> 2327             }
> 2328     
> 2329             if ( paging_mode_shadow(d) )
> 2330             {
> 2331                 /* The guest CR3 must be pointing to the guest physical. */
>>>>     CID 1697482:           (DEADCODE)
>>>>     Execution cannot reach this statement: "gfn = v->arch.hvm.guest_cr[...".
> 2332                 gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
> 2333                 page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
> 2334                 if ( !page )
> 2335                 {
> 2336                     gdprintk(XENLOG_ERR, "Invalid CR3 value = %lx\n",
> 2337                              v->arch.hvm.guest_cr[3]);
> /xen/arch/x86/hvm/hvm.c: 2382             in hvm_set_cr0()
> 2376                 v->arch.hvm.guest_efer &= ~EFER_LMA;
> 2377                 hvm_update_guest_efer(v);
> 2378             }
> 2379     
> 2380             if ( paging_mode_shadow(d) )
> 2381             {
>>>>     CID 1697482:           (DEADCODE)
>>>>     Execution cannot reach this statement: "put_page((struct page_info ...".
> 2382                 put_page(pagetable_get_page(v->arch.guest_table));
> 2383                 v->arch.guest_table = pagetable_null();
> 2384             }
> 2385         }
> 2386     
> 2387         if ( ((value ^ old_value) & X86_CR0_CD) &&

For all of the above (and maybe more further down the original report): Do we have
control over the .config Coverity uses? These (not really) issues all result from
SHADOW_PAGING=n by default now, i.e. the unreachable statements are expected in
that configuration (and they were there before, if the build had been done with
SHADOW_PAGING=n).

Jan

