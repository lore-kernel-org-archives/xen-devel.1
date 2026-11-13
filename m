Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DF9606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WM6+HEgA
Received: from list by lists.xenproject.org with outflank-mailman.1486821.1689275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmGX-0005pQ-Dn; Fri, 13 Nov 2026 08:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486821.1689275; Fri, 13 Nov 2026 08:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmGX-0005pI-9z; Fri, 13 Nov 2026 08:04:09 +0000
Received: by outflank-mailman (input) for mailman id 1486821;
 Fri, 13 Nov 2026 08:04:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRmGV-0005pA-TF
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:04:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRmGU-002t4z-BN
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:04:06 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6c466-e002-0a2a0a5209dd-0a2a4503dbb2-42
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:04:06 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6c475-fae8-0a2a45030019-d155802ed5f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:04:05 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so2771065e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 00:04:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5fe373casm3629103f8f.30.2026.11.13.00.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 00:04:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794557045; x=1795161845; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6mMRvdXGdKcUVHY1u5tTJvYDE/0OSODPzyy3p2SYGg=;
        b=WM6+HEgAdW5IKkbiKB2rcv2O5DmjnQ6z6JA3t27KN6UfaKbPbi/kGh8fu8RqjprjVr
         t3nnoXPro+9ZU39a3zXUMWGPEbUk+Vghqim856N8IyU9eGl+3fwh29qCmFa0+dCIbxDN
         nS/1k9ty4s4q1LhLlL66lMGNwDriZj8gW+UTAJp4KU5lrFrbssGM/tfG2r1X6hYe6ZyY
         vvjf6sl8ZfYftJ19AWl4Bk3ImT9KdglOaOZowo1A/a6YzHyBfAUMkXTdoi43du4mzDXn
         tr75Ji4liN+SgBx5OCjDPEzIR/6TUCq2NUmLz+50kFi3LdhqcJMdL4oxXRFbscXIePlc
         4M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557045; x=1795161845;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6mMRvdXGdKcUVHY1u5tTJvYDE/0OSODPzyy3p2SYGg=;
        b=OYK/6IvAYsRjDxEREUrzbdeusUWB4+ZIupKcfjzdee8fMp7B+q2tOtVGYeDhrNqEsX
         Zifj8DwQZeKjqDogPPnZjVjF6MOd9T9nziLPOTsOn9eFmiVcFBE9Yd25Ctnz/cNigAW0
         5/VTfYQrnoBiQyxkekmX57i+hW03snl+VJX1dIbiZiRik11pVQGr0gSvAKfvd96zjpPu
         2z7dROUQbKoavxo31iVZNEXmd7cyetn3sr5fXuLJ0w50iAQ2H/FNZyFjwpkQxn4Mu5Y7
         jQYo8eH2rt9HphbFHkWYd0Dxsp0SgsNAeR8aHpTsxjcp+GI/N9KskVavDiMUXZpzrrTR
         KbCA==
X-Forwarded-Encrypted: i=1; AL+hErEOQIXEY2HR9p3R6a77Xc2Qh/JAjj/D773QL7tPqwkTDcBK5RaLkUf1uWDgkZQAHxVoKkUq7ni+R2A=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+PtpJBkYkc5JZkMn9EHC4OHr5nd/w28MK8e+dhzY3ku5WIb1Ge
	1N4QEuepM9vMk3B9EzTBUnzyB7DG/yO8i0wy1scAymfJXzAsFLkvXuADYYiCGSQA4g==
X-Gm-Gg: AYBFou0ZKMJSvHaGvV1fUzDmw29tx4AkDiwV06XqG3q3S/U/gHjFcCSec27hCByMkwb
	WEa61rzg374Zz8PKdNvvTO5vSKsxNyrF1E4ynRhePENIEsxckOzY45lQNHsR9b8+NmmD09EY5Qk
	UGJlnIrRYmNzR08q0SRkJlBmn54Tnjcb6UKxGGcc/0jdsx6omfhwnxrXoSK5Ci1ifsVE02OffBm
	GKwsbrcoq5wPi6MU67jDbpqTz6VEwrW5u8VCBCfNBeaZTjqSrCKCvUqD3zlXdD7QZ4QMWRBqWVM
	zyWLAexhdLgtlokFdbvgqHaX7nh7N9mQoT3hkemth3mhjOa/LYFzsXLbw6SYhNRg0PFhin6p4/N
	Hz5S8X5FH9AVgkK05/VocCJF3fNJUFE08c688xhlXtuFTamNS2zwURToENAuhhk+5HLB6ILhKre
	2VaOvav/TSFyTC5Cli9Y4khvlhwfwYONA5SyIdvKEQR6V7l9Z76FVR0rUGe3LdjIis2z9to7Gfk
	8Nbu3TRMIMp6qbuYBOdgR3nHFG1vlOiEkGcaCnMejRJIS8jvoH+9id/ZWKd9VWAXGz/xWEdvbNy
	Sm6zOpKukzLk1yFZ9cSm/g59GlI8JG2cxlDnpy+4phD8UmS2J77Nw9FKtlkWUvpxybkG665unus
	Lc9WzcU8pxgXZoHED
X-Received: by 2002:a05:600c:4f81:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4bb55a25c66mr33144525e9.2.1794557044661;
        Fri, 13 Nov 2026 00:04:04 -0800 (PST)
Message-ID: <1287139f-4f26-4113-92b4-3b4636d9096e@suse.com>
Date: Fri, 13 Nov 2026 09:04:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Lampis <kevin.lampis@citrix.com>
Cc: roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-4-kevin.lampis@citrix.com>
 <20aa34c2-a1c1-4068-9e72-5b7b2c27b075@suse.com>
 <49d3b334-4d7d-4f74-ab00-09cc90dbaa5f@citrix.com>
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
In-Reply-To: <49d3b334-4d7d-4f74-ab00-09cc90dbaa5f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794557045-6F4C74E9-542EA674/10/78276251493
X-purgate-type: spam
X-purgate-size: 14406
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 17:36, Andrew Cooper wrote:
> On 12/11/2026 1:50 pm, Jan Beulich wrote:
>> On 12.11.2026 11:00, Kevin Lampis wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
>>>  /* Update the L1 entry at pl1e to new value nl1e. */
>>>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>                          mfn_t gl1mfn, unsigned int update_flags,
>>> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
>>> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
>>> +                        l1_pgentry_t *ol1e_out)
>>>  {
>>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>>      struct domain *pt_dom = pt_vcpu->domain;
>>> @@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>          /* Fast path for sufficiently-similar mappings. */
>>>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>>>          {
>>> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>> +            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
>>> +                                        update_flags);
>>> +            if ( ol1e_out )
>>> +                *ol1e_out = l1e_from_intpte(old);
>>> +
>>>              if ( page )
>>>                  put_page(page);
>>>              return 0;
>>> @@ -2280,7 +2285,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>      else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
>>>          return -ERESTART;
>>>  
>>> -    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>> +    {
>>> +        intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
>>> +                                    update_flags);
>>> +        if ( ol1e_out )
>>> +            *ol1e_out = l1e_from_intpte(old);
>>> +    }
>>>  
>>>      put_page_from_l1e(ol1e, pt_dom);
>>>      return 0;
>> This (recurring) pattern still adds quite a bit of redundancy. Was it ruled out
>> in an earlier version to pass ol1e_out into UPDATE_ENTRY() (and perhaps through
>> to update_intpte()), to have the updating done there? If so, why?
> 
> I can't spot a nice way of doing this.

See below. That's still retaining type safety as per your reply to patch 4
and as per ...

> The pattern is quite nasty at all levels.  We have pl?e which is the
> live PTE in guest memory.  We read that (once) to get ol?e, then pass it
> down to a CMPXCHG which can return it modified by A/D.
> 
> The issue is it's modify_l?_entry() which reads pl?e into ol?e, not the
> caller, so you can't just plumb mod_l1_entry()'s parameter all the way down.
> 
> Also, mod_l?_entry() wants to be typesafe, whereas UPDATE_ENTRY() wants
> to be not.

... what you say here. Things may get yet a bit easier if we sacrificed
that (albeit, as indicated there, more in patch 4 than here). With some
count_args() trickery it may also be possible to avoid the need to touch
pv/grant_table.c and pv/ro-page-fault.c. Not sure whether that would be
worth it.

Jan

x86: extend mod_l*_entry() to optionally return the old PTE value

Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
CMPXCHG to set the new pte value and return the old pte value through
the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
is preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
- Write of the output value moved into UPDATE_ENTRY().

Changes in v5:
- Refactoring the mod_l*_entry() functions was split out
  into a patch before this one

Changes in v4:
- Refactor how UPDATE_ENTRY is used
- Update commit message to specify CMPXCHG instead of xchg

Changes in v3:
- Add swap to mod_l{2,3,4}_entry()

Changes in v2:
- UPDATE_ENTRY now returns the old pte value instead of using an out
  pointer

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2194,7 +2194,8 @@ static void l3t_unlock(struct page_info
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int update_flags,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
@@ -2255,7 +2256,8 @@ static int mod_l1_entry(l1_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags,
+                         ol1e_out);
             if ( page )
                 put_page(page);
             return 0;
@@ -2281,7 +2283,7 @@ static int mod_l1_entry(l1_pgentry_t *pl
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags, ol1e_out);
 
     put_page_from_l1e(ol1e, pt_dom);
     return 0;
@@ -2293,7 +2295,8 @@ static int mod_l2_entry(l2_pgentry_t *pl
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l2_pgentry_t *ol2e_out)
 {
     l2_pgentry_t ol2e;
     struct domain *d = vcpu->domain;
@@ -2325,7 +2328,8 @@ static int mod_l2_entry(l2_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags,
+                         ol2e_out);
             return 0;
         }
 
@@ -2335,7 +2339,7 @@ static int mod_l2_entry(l2_pgentry_t *pl
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+    UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags, ol2e_out);
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
@@ -2347,7 +2351,8 @@ static int mod_l3_entry(l3_pgentry_t *pl
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l3_pgentry_t *ol3e_out)
 {
     l3_pgentry_t ol3e;
     struct domain *d = vcpu->domain;
@@ -2377,7 +2382,8 @@ static int mod_l3_entry(l3_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags,
+                         ol3e_out);
             return 0;
         }
 
@@ -2388,7 +2394,7 @@ static int mod_l3_entry(l3_pgentry_t *pl
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+    UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags, ol3e_out);
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
     return 0;
@@ -2399,7 +2405,8 @@ static int mod_l4_entry(l4_pgentry_t *pl
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l4_pgentry_t *ol4e_out)
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
@@ -2429,7 +2436,8 @@ static int mod_l4_entry(l4_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags,
+                         ol4e_out);
             return 0;
         }
 
@@ -2440,7 +2448,7 @@ static int mod_l4_entry(l4_pgentry_t *pl
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags, ol4e_out);
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
     return 0;
@@ -3318,7 +3326,7 @@ int new_guest_cr3(mfn_t mfn)
                           l4e_from_mfn(mfn,
                                        (_PAGE_PRESENT | _PAGE_RW |
                                         _PAGE_USER | _PAGE_ACCESSED)),
-                          gt_mfn, 0, curr);
+                          gt_mfn, 0, curr, NULL);
         unmap_domain_page(pl4e);
         switch ( rc )
         {
@@ -4156,14 +4164,14 @@ long do_mmu_update(
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner);
+                                      update_flags, v, pg_owner, NULL);
                     break;
 
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4172,7 +4180,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4181,7 +4189,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4521,7 +4529,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
--- a/xen/arch/x86/pv/grant_table.c
+++ b/xen/arch/x86/pv/grant_table.c
@@ -98,7 +98,7 @@ int create_grant_pv_mapping(uint64_t add
         goto out_unlock;
 
     ol1e = *pl1e;
-    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0);
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0, null_pl1e);
     /*
      * We always create mappings in this path.  However, our caller,
      * map_grant_ref(), only passes potentially non-zero cache_flags for
@@ -163,7 +163,7 @@ static bool steal_linear_address(unsigne
         goto out_unlock;
 
     ol1e = *pl1e;
-    UPDATE_ENTRY(l1, pl1e, ol1e, l1e_empty(), gl1mfn, curr, 0);
+    UPDATE_ENTRY(l1, pl1e, ol1e, l1e_empty(), gl1mfn, curr, 0, null_pl1e);
     *out = ol1e;
     okay = true;
 
@@ -290,7 +290,7 @@ int replace_grant_pv_mapping(uint64_t ad
                  "PTE flags %x for %"PRIx64" don't match grant (%x)\n",
                  l1e_get_flags(ol1e), addr, grant_pte_flags);
 
-    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0);
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0, null_pl1e);
     /*
      * Generally, replace_grant_pv_mapping() is used to destroy mappings
      * (n1le = l1e_empty()), but it can be a present mapping on the
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -109,10 +109,17 @@ static inline intpte_t update_intpte(int
  * Macro that wraps the appropriate type-changes around update_intpte().
  * Arguments are: type, ptr, old, new, mfn, vcpu
  */
-#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
-    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
-                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
-                  _m, _v, fl)
+#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl, out) do {         \
+    intpte_t old_ = update_intpte(&_t ## e_get_intpte(*(_p)),       \
+                                  _t ## e_get_intpte(_o),           \
+                                  _t ## e_get_intpte(_n),           \
+                                  _m, _v, fl);                      \
+    if ( out )                                                      \
+        *(out) = _t ## e_from_intpte(old_);                         \
+} while ( false )
+
+/* Use this instead of NULL for UPDATE_ENTRY()'s last argument. */
+static l1_pgentry_t *const null_pl1e = NULL;
 
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
                                                    const struct domain *d)
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -200,7 +200,7 @@ static int ptwr_emulated_update(unsigned
     else
     {
         ol1e = *pl1e;
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, mfn, v, 0);
+        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, mfn, v, 0, null_pl1e);
     }
 
     trace_ptwr_emulation(addr, nl1e);


