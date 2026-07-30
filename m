Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470C0C55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 14:40:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377929.1623644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpRvV-0002wf-C0; Thu, 30 Jul 2026 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377929.1623644; Thu, 30 Jul 2026 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpRvV-0002wY-7w; Thu, 30 Jul 2026 14:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1377929;
 Thu, 30 Jul 2026 14:39:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpRvT-0002wQ-BM
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 14:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpRvS-000Jnn-L0
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:39:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b622b-5cb7-0a2a0a5109dd-0a2a450b9b70-42
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 16:39:58 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b623e-b7e8-0a2a450b0019-d155802fa47e-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 16:39:58 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso6441465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 07:39:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498011e5febsm61548765e9.3.2026.07.30.07.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 07:39:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785422398; x=1786027198; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWY4T4iy+unDopf0OnXyWJbGCaInsS7fGYaAHmEqU9Y=;
        b=LUcjjhAIe0Uj2jtrAI+JibI0gQRcMDBdm7MlvwHtZGsIJH6wu0rb5wHTjK+lniVpkd
         LHCoRv5HWtfdPVsirqQP7aQGZoSXdwd7gN7erV5F6EYeUqkKQRpWr4CQh5/Gj2xOhres
         DNMxkHPsy5dcMtxyC8SsElEq6nXcDMNP3mg/w2VMTVfbeDiWxp1s6+z2W932bszJIEc4
         +l0KS+9OZMMkgth8rPDKv26l2LzqZ08WwPpe8ukVJm/s2l0Y6b+XemQsW6mhm2vUjPG+
         7aP8Cv9m7nq5bPWu/So40L82oJP1lSvocReidod99r7vtiw3ZG5S9016av/u2vFQnLoi
         3usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785422398; x=1786027198;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWY4T4iy+unDopf0OnXyWJbGCaInsS7fGYaAHmEqU9Y=;
        b=FOgbyav8iOqe6sGsW/eOZzFGNjtEIKS93RG6vZOHMfL0aTIWYBH9P0tvlprm/dCrCJ
         cQ7X8SmZCGzCKW+kReKptJGtA1G0H+MG+IQtcFnlmOb/QO0fBEGmUITc046ysDtsfpVT
         W3WCLogRY845D5NcM3/hdhIeGVl4zIGGDEYDhf8b4F3Ir+BLOfRzNVJY8PbrXaYGJRk4
         55EP9X2wz9HQHOLqGb/SS3YQ2s2HcZ5auehQFqllA1HSiCr0EfjFyo0JNpgQrzWJBIK+
         +D60p+rHcF5jylz5RJ140ACnVDcpdjrO80ijtGa9ENLPf702veQ+V6viRhDQTd86lO4Q
         m/Xw==
X-Gm-Message-State: AOJu0Yxj8BhKusTxA8vW802GheFhkoqF4sJIXpwX2/qNbYFp+epMgrqi
	0LJ0HhJ2i6KzhpTxE3qTUfSE5vHdJdeNXiepf4jqv5y52Dh+6Eg2IIrgpuJIW2b96iuSqgp8+v6
	dexvhXw==
X-Gm-Gg: AR+sD10JRVjYClIO8qK3/LM9jaSzRMX8jUwWXu9vctKjcIu0f1ueWZE7YEq6ySris0+
	G/x5OczGNG+ylm7tleanpcX8n8AB0coALM6ji/f12KWox4pfFD8e1gxcij6/pOCzCPsWUC1J18H
	h2vpkYf04xL9X12CuvoLanJtKoECP+nT/XXRQDcWbaTyC9JMjZs9C5V32DiCzh32MLtWm/fF3Lg
	NAIYbzfdWYYL4RsEwrpRA4gvHkkrIQAhdKVBFxmdrcr1WfDQQnj7auGc291eFluD7+kxOdmVsaU
	IcMjlV/xR1sJekrHoquXsNya6bJClsgQ9LOmKXx60wCKr97g0z3/O/UYFzZniKvQfnus1Z4A47V
	WF160bSRmmnZwfQenfOEnjI8/W27qRHyMcUsT/DZRHVCAwhUZ7W927IK9QOiLDjGRbW27xzgdnF
	5I7YyrtsVDF0uvO+cRK/wKaSvhTvBOT/uzVMAgcpjmt9g6sqJJpk01K1nDirqZEZlRqGm5c4KB/
	kEMkQU74Imq70jKbuV9jJpDjU0Zn5BE2+bYuL/iERRf6JL5CuMf
X-Received: by 2002:a05:600c:4688:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-49804d18413mr8041295e9.16.1785422397042;
        Thu, 30 Jul 2026 07:39:57 -0700 (PDT)
Message-ID: <c2c01987-1ccd-4f14-8300-f637e816cbb7@suse.com>
Date: Thu, 30 Jul 2026 16:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6a6b266559168_35fb2bc1be9079a4147ab@prd-scan-dashboard-0.mail>
 <d0ff411c-3bd9-4306-8782-ac63f7b202da@suse.com>
 <ab6d9fe6-e239-49ac-9bcf-79779cf63420@citrix.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <ab6d9fe6-e239-49ac-9bcf-79779cf63420@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785422398-1A4DB9EA-4EA54AB5/0/0
X-purgate-type: clean
X-purgate-size: 6245

On 30.07.2026 15:21, Andrew Cooper wrote:
> On 30/07/2026 2:14 pm, Jan Beulich wrote:
>> On 30.07.2026 12:24, scan-admin@coverity.com wrote:
>>> ** CID 1697485:       Control flow issues  (DEADCODE)
>>> /xen/arch/x86/hvm/hvm.c: 2436           in hvm_set_cr3()
>>>
>>>
>>> _____________________________________________________________________________________________
>>> *** CID 1697485:         Control flow issues  (DEADCODE)
>>> /xen/arch/x86/hvm/hvm.c: 2436             in hvm_set_cr3()
>>> 2430                 curr->arch.vm_event->write_data.cr3_noflush = noflush;
>>> 2431     
>>> 2432                 return X86EMUL_OKAY;
>>> 2433             }
>>> 2434         }
>>> 2435     
>>>>>>     CID 1697485:         Control flow issues  (DEADCODE)
>>>>>>     Execution cannot reach the expression "(value ^ curr->arch.hvm.guest_cr[3]) >> 12" inside this statement: "if (!!(curr->arch.hvm.guest...".
>>> 2436         if ( hvm_paging_enabled(curr) && paging_mode_shadow(currd) &&
>>> 2437              ((value ^ curr->arch.hvm.guest_cr[3]) >> PAGE_SHIFT) )
>>> 2438         {
>>> 2439             /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>>> 2440             struct page_info *page;
>>> 2441     
>>>
>>> ** CID 1697484:       Control flow issues  (DEADCODE)
>>> /xen/arch/x86/hvm/svm/svm.c: 128           in svm_update_guest_cr()
>>>
>>>
>>> _____________________________________________________________________________________________
>>> *** CID 1697484:         Control flow issues  (DEADCODE)
>>> /xen/arch/x86/hvm/svm/svm.c: 128             in svm_update_guest_cr()
>>> 122                      monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
>>> 123                    vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
>>> 124             }
>>> 125     
>>> 126             value = v->arch.hvm.guest_cr[0];
>>> 127             if ( paging_mode_shadow(v->domain) )
>>>>>>     CID 1697484:         Control flow issues  (DEADCODE)
>>>>>>     Execution cannot reach this statement: "value |= 0x80010000UL;".
>>> 128                 value |= X86_CR0_PG | X86_CR0_WP;
>>> 129             vmcb_set_cr0(vmcb, value);
>>> 130             break;
>>> 131     
>>> 132         case 2:
>>> 133             vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
>>>
>>> ** CID 1697483:       Control flow issues  (DEADCODE)
>>> /xen/arch/x86/hvm/svm/svm.c: 396           in svm_vmcb_restore()
>>>
>>>
>>> _____________________________________________________________________________________________
>>> *** CID 1697483:         Control flow issues  (DEADCODE)
>>> /xen/arch/x86/hvm/svm/svm.c: 396             in svm_vmcb_restore()
>>> 390                 return -EINVAL;
>>> 391             }
>>> 392         }
>>> 393     
>>> 394         if ( paging_mode_shadow(v->domain) )
>>> 395         {
>>>>>>     CID 1697483:         Control flow issues  (DEADCODE)
>>>>>>     Execution cannot reach this statement: "if (c->cr0 & 0x80000000UL) ...".
>>> 396             if ( c->cr0 & X86_CR0_PG )
>>> 397             {
>>> 398                 page = get_page_from_gfn(v->domain, c->cr3 >> PAGE_SHIFT,
>>> 399                                          NULL, P2M_ALLOC);
>>> 400                 if ( !page )
>>> 401                 {
>>>
>>> ** CID 1697482:         (DEADCODE)
>>> /xen/arch/x86/hvm/hvm.c: 2332           in hvm_set_cr0()
>>> /xen/arch/x86/hvm/hvm.c: 2382           in hvm_set_cr0()
>>>
>>>
>>> _____________________________________________________________________________________________
>>> *** CID 1697482:           (DEADCODE)
>>> /xen/arch/x86/hvm/hvm.c: 2332             in hvm_set_cr0()
>>> 2326                 hvm_update_guest_efer(v);
>>> 2327             }
>>> 2328     
>>> 2329             if ( paging_mode_shadow(d) )
>>> 2330             {
>>> 2331                 /* The guest CR3 must be pointing to the guest physical. */
>>>>>>     CID 1697482:           (DEADCODE)
>>>>>>     Execution cannot reach this statement: "gfn = v->arch.hvm.guest_cr[...".
>>> 2332                 gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
>>> 2333                 page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
>>> 2334                 if ( !page )
>>> 2335                 {
>>> 2336                     gdprintk(XENLOG_ERR, "Invalid CR3 value = %lx\n",
>>> 2337                              v->arch.hvm.guest_cr[3]);
>>> /xen/arch/x86/hvm/hvm.c: 2382             in hvm_set_cr0()
>>> 2376                 v->arch.hvm.guest_efer &= ~EFER_LMA;
>>> 2377                 hvm_update_guest_efer(v);
>>> 2378             }
>>> 2379     
>>> 2380             if ( paging_mode_shadow(d) )
>>> 2381             {
>>>>>>     CID 1697482:           (DEADCODE)
>>>>>>     Execution cannot reach this statement: "put_page((struct page_info ...".
>>> 2382                 put_page(pagetable_get_page(v->arch.guest_table));
>>> 2383                 v->arch.guest_table = pagetable_null();
>>> 2384             }
>>> 2385         }
>>> 2386     
>>> 2387         if ( ((value ^ old_value) & X86_CR0_CD) &&
>> For all of the above (and maybe more further down the original report): Do we have
>> control over the .config Coverity uses? These (not really) issues all result from
>> SHADOW_PAGING=n by default now, i.e. the unreachable statements are expected in
>> that configuration (and they were there before, if the build had been done with
>> SHADOW_PAGING=n).
> 
> Yes.  It is .github/workflows/coverity.yml which does the build and
> submission to Coverity.
> 
> Right now it's a plain `make build-xen`, so will go from absolute
> defaults, but we can change it if needs be.

So first question: Which exact way do we want the Coverity scan to be done? Is there
a reason we have it use a plain default config (which can change at any time, as has
happened now), rather than e.g. an allyesconfig one? Or something yet further
customized (e.g. in xen/arch/*/configs/coverity_defconfig)?

It's only going to be a follow-up question then how exactly to make changes to that
file you point at. I, for one, have no insight into how to try out changes being
made, before actually sending out a patch.

Jan

