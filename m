Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBF0C5CFCF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389904.1630497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuU8J-0000fQ-4P; Thu, 13 Aug 2026 12:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389904.1630497; Thu, 13 Aug 2026 12:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuU8J-0000fJ-0t; Thu, 13 Aug 2026 12:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1389904;
 Thu, 13 Aug 2026 12:02:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuU8H-0000fD-SB
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:02:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuU8H-0033Jh-8g
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:02:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7db235-2eae-0a2a0a5409dd-0a2a4501dd2e-16
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:02:01 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7db238-5984-0a2a45010019-d155802fddae-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:02:00 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so20078415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:02:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a569c1fsm6004857f8f.15.2026.08.13.05.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 05:01:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1786622520; x=1787227320; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAKI3VAre4My91BL1HkZHsv/aK/WZK4PntFfiIBBQrU=;
        b=IQErONNh82/qPBcbE6EM7+tU2hHS8U6qjBQiqpwXFHJRfHUOI4/glVYTDpnKOX86KE
         8OnaJSDvnXhOI1oyPwou6Q3c3eGlMZy1ZUGqaLZuNytwvGcXN165TrCblnhXVGKpKg7C
         86LROURGgxn5moXhzUD+fb6hXA3wI5vIbWEPKAqhymDURxgDqxy+zNSZ5MgKOJKxoDvj
         wKvTP95yBCOGKG6Sicp9Qu6gpo0W+WzVKg/CFRpxfJ+Y2DBy5kFZ/gdhTMRgce2skARQ
         4B0mKGQmfP+RzoGQPcqYVVq8WoFnCRGOeqnHm8OCHqpUtmTAY2cDECyr21drng6FZZbd
         J/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786622520; x=1787227320;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAKI3VAre4My91BL1HkZHsv/aK/WZK4PntFfiIBBQrU=;
        b=BuYlJ46g0WGWlIqRWw09AmRTF0fWE3XRsfF+0cYSxJ2I1pJ5rKpSzNLs6RyZR+4fxr
         QfQzeTMvZOci0bfivC3MoDPFtUjfKFhARNf8hOQ/NxXh554+UooPPLoNqYbTRqLZqkOC
         OMwnctVgUI08bIDlChpknbqpJWjORWMGDFRB2B6HljtQU4w1RVAzl7qiLhwlF0IFP0GM
         b+GMH1QKfkYvtrasTN5leCjHAPCtIUrjz2vyT+QQwuIR4/GDJELGMkzoOPxEqpTicGjw
         Xos0QKsIlKtezwivdvtjWsxXrTXTw8LQcA3PZmJ4dwFUHU4lRMeLTJB+d4jF999Ctuwe
         9A9w==
X-Forwarded-Encrypted: i=1; AHgh+RrYusdnU7ObE2fkCHAnrioxoWIPTftoshiLFiW/9ViC3Nps9QdK/iLVE81SDe3YuUaxNW78BRK7XGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxXGIn1SvDW3TZpcWSul/R2PbNBB53gcsWCiPwplYHZXN8JxSH
	Bmr2K8Oqgsfk49xtUOBancw50J8/lj+IGRYx38G4J7ZOGd+Yul15R0lcmOcHiloniQ==
X-Gm-Gg: AR+sD13i09mWSjha7+L1SblneWAJTeAUpSNCaj25zUE1WY4PIsEz3K4maN7gAK/xcF5
	uQYZd2LXzJZ+u62Ge2VCi4aWfCMyMo7hEAemz/eBkp/t8YdOtomBbyn9niQtiRCv0i6xvQ0LPcT
	Hls2gfu95LSvLgLnWMhSHQ1gzxOnLtarMPtucbN/x0aUe24+yObNWJ0WUI69/taj11/M9Aeymz5
	i2sfFPMvooFD1r9Nb9LUhUWIH0fKyNFRzG3Qo2UPg29DBEBs93kl/y7qS5ETyUADbp4cdZE8iN/
	Ypb7GvlrCNgYMsSQnXKbZYaA9K++mmOGsK/PiYWQE5QcGGKhKxW0jhCk9jiW+6sod1yOycqxSpl
	mD4k1wszwsjvDdUdzFnMMrxMLXvyZG8W+esuMXTZ9Uv8qs+205JTTfHb7ySr7Z/iYzZMWJvQGWQ
	UhuyB2i3r4NAzy1zCnnCrW/KmDd+2GwBFuybni47bw+97bU/o70+A6PKpTRDU3zJF69IfUtWbA4
	Y+1DIkCSKkLqAfR7pmSJjjqld/1bbHOGScAC5Nv7qYKg8y6F0povFEfkU3+M+A=
X-Received: by 2002:a05:600c:4f87:b0:499:8191:62c7 with SMTP id 5b1f17b1804b1-499821d7e83mr57365835e9.18.1786622518812;
        Thu, 13 Aug 2026 05:01:58 -0700 (PDT)
Message-ID: <6166e2ac-3b8b-4702-ac15-357d1c1a4c56@suse.com>
Date: Thu, 13 Aug 2026 14:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
 <20260727150615.1373200-2-kevin.lampis@citrix.com>
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
In-Reply-To: <20260727150615.1373200-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786622520-BDE78757-D8B7D4E0/0/0
X-purgate-type: clean
X-purgate-size: 14260

On 27.07.2026 17:06, Kevin Lampis wrote:
> --- a/xen/arch/x86/pv/mm.h
> +++ b/xen/arch/x86/pv/mm.h
> @@ -66,13 +66,14 @@ static inline intpte_t paging_cmpxchg_guest_entry(
>   * How to write an entry to the guest pagetables.
>   * Returns false for failure (pointer not valid), true for success.
>   */
> -static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
> -                                 mfn_t mfn, struct vcpu *v, bool preserve_ad)
> +static inline bool update_intpte(intpte_t *p, intpte_t *old, intpte_t new,
> +                                 mfn_t mfn, struct vcpu *v, bool preserve_ad,
> +                                 bool use_cmpxchg)

No 2nd boolean parameter, please. (use_cmpxchg also doesn't look to be an
overly good name; "swap" maybe?) As you switch old to being a pointer, and
as ...

>  {
>      bool rv = true;
>  
>  #ifndef PTE_UPDATE_WITH_CMPXCHG
> -    if ( !preserve_ad )
> +    if ( !preserve_ad && !use_cmpxchg )
>          paging_write_guest_entry(v, p, new, mfn);

... *old isn't used here, having callers pass in NULL in that case may be
one option.

(In any event, old becoming a pointer imo needs commenting upon, as otherwise
one might expect this to be only an output.)

Alternatively I have an old patch lying around which looks to apply cleanly,
and which may be useful here; see at the bottom.

> @@ -82,30 +83,36 @@ static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
>              intpte_t _new = new, t;
>  
>              if ( preserve_ad )
> -                _new |= old & (_PAGE_ACCESSED | _PAGE_DIRTY);
> +                _new |= *old & (_PAGE_ACCESSED | _PAGE_DIRTY);
>  
> -            t = paging_cmpxchg_guest_entry(v, p, old, _new, mfn);
> +            t = paging_cmpxchg_guest_entry(v, p, *old, _new, mfn);
>  
> -            if ( t == old )
> +            if ( t == *old )
>                  break;
>  
>              /* Allowed to change in Accessed/Dirty flags only. */
> -            BUG_ON((t ^ old) & ~(intpte_t)(_PAGE_ACCESSED|_PAGE_DIRTY));
> +            BUG_ON((t ^ *old) & ~(intpte_t)(_PAGE_ACCESSED|_PAGE_DIRTY));
>  
> -            old = t;
> +            *old = t;
>          }
>      }
>      return rv;
>  }
>  
> +static inline bool _update_intpte(intpte_t *p, intpte_t old, intpte_t new,
> +                                  mfn_t mfn, struct vcpu *v, bool preserve_ad)
> +{
> +    return update_intpte(p, &old, new, mfn, v, preserve_ad, false);
> +}
> +
>  /*
>   * Macro that wraps the appropriate type-changes around update_intpte().
>   * Arguments are: type, ptr, old, new, mfn, vcpu
>   */
>  #define UPDATE_ENTRY(_t,_p,_o,_n,_m,_v,_ad)                         \
> -    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
> -                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
> -                  (_m), (_v), (_ad))
> +    _update_intpte(&_t ## e_get_intpte(*(_p)),                      \
> +                   _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),  \
> +                   (_m), (_v), (_ad))

Like the patch below does - if already this last line needs touching, I
think the excess parentheses then also want dropping.

Tangentially: We will want to consider dropping the function's return
value, since as of 1bc30c076a7f ("x86/mm:
{paging, sh}_{cmpxchg, write}_guest_entry() cannot fault") it only ever
returns true.

Jan

x86: make UPDATE_ENTRY() allow for multiple operation flags

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2149,10 +2149,9 @@ static void l3t_unlock(struct page_info
 
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
-                        mfn_t gl1mfn, unsigned int cmd,
+                        mfn_t gl1mfn, unsigned int update_flags,
                         struct vcpu *pt_vcpu, struct domain *pg_dom)
 {
-    bool preserve_ad = (cmd == MMU_PT_UPDATE_PRESERVE_AD);
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
     int rc = 0;
@@ -2172,7 +2171,7 @@ static int mod_l1_entry(l1_pgentry_t *pl
         }
 
         /* Translate foreign guest address. */
-        if ( cmd != MMU_PT_UPDATE_NO_TRANSLATE &&
+        if ( !(update_flags & PTE_UPDATE_NO_TRANSLATE) &&
              paging_mode_translate(pg_dom) )
         {
             p2m_type_t p2mt;
@@ -2213,7 +2212,7 @@ static int mod_l1_entry(l1_pgentry_t *pl
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
             rc = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                              preserve_ad);
+                              update_flags);
             if ( page )
                 put_page(page);
             return rc ? 0 : -EBUSY;
@@ -2237,7 +2236,7 @@ static int mod_l1_entry(l1_pgentry_t *pl
             put_page(page);
 
         if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol1e = nl1e;
             rc = -EBUSY;
@@ -2246,7 +2245,7 @@ static int mod_l1_entry(l1_pgentry_t *pl
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EBUSY;
     }
@@ -2260,7 +2259,7 @@ static int mod_l1_entry(l1_pgentry_t *pl
 static int mod_l2_entry(l2_pgentry_t *pl2e,
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
-                        int preserve_ad,
+                        unsigned int update_flags,
                         struct vcpu *vcpu)
 {
     l2_pgentry_t ol2e;
@@ -2292,7 +2291,7 @@ static int mod_l2_entry(l2_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, preserve_ad) )
+            if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags) )
                 return 0;
             return -EBUSY;
         }
@@ -2301,7 +2300,7 @@ static int mod_l2_entry(l2_pgentry_t *pl
             return rc;
 
         if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol2e = nl2e;
             rc = -EBUSY;
@@ -2310,7 +2309,7 @@ static int mod_l2_entry(l2_pgentry_t *pl
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EBUSY;
     }
@@ -2324,7 +2323,7 @@ static int mod_l2_entry(l2_pgentry_t *pl
 static int mod_l3_entry(l3_pgentry_t *pl3e,
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
-                        int preserve_ad,
+                        unsigned int update_flags,
                         struct vcpu *vcpu)
 {
     l3_pgentry_t ol3e;
@@ -2354,7 +2353,7 @@ static int mod_l3_entry(l3_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, preserve_ad);
+            rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
             return rc ? 0 : -EFAULT;
         }
 
@@ -2364,7 +2363,7 @@ static int mod_l3_entry(l3_pgentry_t *pl
         rc = 0;
 
         if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol3e = nl3e;
             rc = -EFAULT;
@@ -2373,7 +2372,7 @@ static int mod_l3_entry(l3_pgentry_t *pl
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EFAULT;
     }
@@ -2386,7 +2385,7 @@ static int mod_l3_entry(l3_pgentry_t *pl
 static int mod_l4_entry(l4_pgentry_t *pl4e,
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
-                        int preserve_ad,
+                        unsigned int update_flags,
                         struct vcpu *vcpu)
 {
     struct domain *d = vcpu->domain;
@@ -2416,7 +2415,7 @@ static int mod_l4_entry(l4_pgentry_t *pl
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, preserve_ad);
+            rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
             return rc ? 0 : -EFAULT;
         }
 
@@ -2426,7 +2425,7 @@ static int mod_l4_entry(l4_pgentry_t *pl
         rc = 0;
 
         if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol4e = nl4e;
             rc = -EFAULT;
@@ -2435,7 +2434,7 @@ static int mod_l4_entry(l4_pgentry_t *pl
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EFAULT;
     }
@@ -4135,18 +4134,23 @@ long do_mmu_update(
 
             if ( page_lock(page) )
             {
+                unsigned int update_flags = (cmd == MMU_PT_UPDATE_PRESERVE_AD)
+                                            ? PTE_UPDATE_PRESERVE_AD
+                                            : (cmd == MMU_PT_UPDATE_NO_TRANSLATE)
+                                              ? PTE_UPDATE_NO_TRANSLATE : 0;
+
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      cmd, v, pg_owner);
+                                      update_flags, v, pg_owner);
                     break;
 
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                                      update_flags, v);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4155,7 +4159,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                                      update_flags, v);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4164,7 +4168,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                                      update_flags, v);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -62,17 +62,20 @@ static inline intpte_t paging_cmpxchg_gu
 #undef PTE_UPDATE_WITH_CMPXCHG
 #endif
 
+#define PTE_UPDATE_PRESERVE_AD  (1u << 0)
+#define PTE_UPDATE_NO_TRANSLATE (1u << 1)
+
 /*
  * How to write an entry to the guest pagetables.
  * Returns false for failure (pointer not valid), true for success.
  */
 static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
-                                 mfn_t mfn, struct vcpu *v, bool preserve_ad)
+                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
 {
     bool rv = true;
 
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !preserve_ad )
+    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
         paging_write_guest_entry(v, p, new, mfn);
     else
 #endif
@@ -81,7 +84,7 @@ static inline bool update_intpte(intpte_
         {
             intpte_t _new = new, t;
 
-            if ( preserve_ad )
+            if ( flags & PTE_UPDATE_PRESERVE_AD )
                 _new |= old & (_PAGE_ACCESSED | _PAGE_DIRTY);
 
             t = paging_cmpxchg_guest_entry(v, p, old, _new, mfn);
@@ -102,10 +105,10 @@ static inline bool update_intpte(intpte_
  * Macro that wraps the appropriate type-changes around update_intpte().
  * Arguments are: type, ptr, old, new, mfn, vcpu
  */
-#define UPDATE_ENTRY(_t,_p,_o,_n,_m,_v,_ad)                         \
+#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
     update_intpte(&_t ## e_get_intpte(*(_p)),                       \
                   _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
-                  (_m), (_v), (_ad))
+                  _m, _v, fl)
 
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
                                                    const struct domain *d)


