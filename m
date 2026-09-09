Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16616C79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 09:22:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412725.1643095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EV8-0008Mp-Vj; Wed, 09 Sep 2026 09:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412725.1643095; Wed, 09 Sep 2026 09:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EV8-0008Mi-T1; Wed, 09 Sep 2026 09:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1412725;
 Wed, 09 Sep 2026 09:21:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4EV7-0008Ma-UE
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:21:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4EV6-002BZu-Ow
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:21:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1252d-8faa-0a2a0a5109dd-0a2a4504a2f0-16
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:21:52 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa12530-b57f-0a2a45040019-d155802ed49a-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:21:52 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso41758295e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 02:21:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d057f4778sm356877635e9.8.2026.09.09.02.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 02:21:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1788945712; x=1789550512; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvTueSMmC85xvgISAk8rclCvuKn+yoZ+BpUvFMd4JTg=;
        b=fi5UEjUKo3BU+HKxYxZ1B6uPNr7hB+su2QsUhPzIqAAdRAWUWtCe4ZyVvG5CjoY+Qp
         Ge9sCEEov5X1YieHj/LOtVYonk3kJd0QGv6Cn7AWVNr+GekT7ema9/tZ9O0cszzyG5lr
         rUuOjlC/kjb/d/yKLzwu+hkM1aTJfYdx0AcXJi1yFw6vo8+ajoF602FrV8cYGsRrA4Cw
         VEr5xrDU19Nsg/lbeTUoXbJ8L7QbpJ2iT0StpN4pBmSlpWFA8DJ5IwuSJqGZvvkW5Snl
         CFOVTOMqA2TGLYMfWiMkH6SZpu9zQDazwmcnmghIaQiEgNbspQpEaSchhwHrz1OjRN3C
         hEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945712; x=1789550512;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvTueSMmC85xvgISAk8rclCvuKn+yoZ+BpUvFMd4JTg=;
        b=G2KtXIY9wT6GjqKu0acUNKQcG04LPARM047OlCfXrMrve75tz8gyYtrtE1P41tO0aH
         c0rl3YDc5lL8AQ5eQa0mecY5uHFcgSgkqgZn2ZFx2LvIrUD+xQhEkb9zMiUFwDMu21gp
         Rs/+SR/4+kJF+v3xWLbtojEauvG1BkP7RMILqnVD31Ldwu8BO9s3DpnlOOGXw/FOfvzZ
         GFbN72BE30kiKwOqwd34T+OObDL/hJtL/UoGBsucn0GGtJCICpfA0maQ51DwQkI5EMCU
         GOs48228yh8P28q4JYQ4pJnCx7Z+ByyN688+vCwk7zyAjtulfSof8LhmRHdJ4rjREOph
         J1ag==
X-Forwarded-Encrypted: i=1; AKwUvBwyXTxR7UHCIfcOqyG58xf5E91FT8UjUu9yN89LsZU6PCk2KA0n/KCwqMu/NtBpVMSZj+OHxrlCFZA=@lists.xenproject.org
X-Gm-Message-State: AFuF++kgKUH58oC3BKzIcp19Vew6STyH3UjP+0BICnN0iO+MAJOqJ4Mb
	ylMX+LJSiXZpb56RwqQvTTDy0OaqPpz9CH3dJ5eXDzCvwSUEpI156yq5Gq6WFfww9A==
X-Gm-Gg: AYBFou2GVPCyn3Oxsy7mVvbqcepEyf830dYVVtonsA89GgE07fnVpOkUKDwZnWjwN+x
	oqPwKJ9FsB4CfBNX1Re1GCPiFfhxML3rFBerbODw3ZwJXi+bEsg8KnLLuR285vdSjoJeGODHjMJ
	k984+Vqd+G0MpSula7yD2cAeiLr9nIMBmAneIoFPECQky8o+zs5O+RPYJrM5q6E35Q5TO4FVYPM
	haRwV5BkPc5c7Qc+qEP1KuvEoYVMBeog7JejGADQ/RSNXeOpSJ+VZUlD2ercr+sW+yx8FFGB1qx
	gbebD07ULAcBkUJ763kiJwh2iEGEyNEkcYazXmwcVpkkt/HMANbVKbnvgr/HNR8GPzjsQOsKmWb
	d2yIzsm3P6tZMh4UVY74f/p55eez8uVWrzscQRkCz75UCwJubrUxrV0N+tcYldWYceNfm2f+Yv+
	JRBHj4nbegcZ1qYXWT3D4qZKuToli8DDO7AllxJsUHCec/IkGLYg3BYtyPUFJqIuvALnvIjAIBv
	xpnDgWS4L6GXSgr0kiMf5VeOZyZOWKQ2lI9A2uwAg6pV/wRejmdNzcCM667BCc=
X-Received: by 2002:a05:600c:4fc8:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49cf81e6783mr358762005e9.4.1788945712058;
        Wed, 09 Sep 2026 02:21:52 -0700 (PDT)
Message-ID: <1cadfc6c-efc1-4e23-b778-1df97fd0fa4d@suse.com>
Date: Wed, 9 Sep 2026 11:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: limit deferred TLB flushing to PV owned pages
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260909072451.67324-1-roger@xenproject.org>
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
In-Reply-To: <20260909072451.67324-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788945712-510DDB50-56FEFCC5/0/0
X-purgate-type: clean
X-purgate-size: 1240

On 09.09.2026 09:24, Roger Pau Monne wrote:
> The current logic on x86 will mark all domain owned pages as needed a TLB
> flush before being re-used.  However such TLB flushing is only strictly
> needed for PV domain owned pages, as those can keep a reference to the page
> in the TLB after it has been freed.

What about HVM-owned ones which a PV domain has grant- or foreign-mapped?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1501,6 +1501,7 @@ bool scrub_free_pages(void)
>  
>  static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>  {
> +    const struct domain *owner = page_get_owner(pg);
>      bool pg_offlined = false;
>  
>      ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
> @@ -1539,7 +1540,7 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>      }
>  
>      /* If a page has no owner it will need no safety TLB flush. */
> -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
> +    pg->u.free.need_tlbflush = owner && is_pv_domain(owner);
>      if ( pg->u.free.need_tlbflush )
>          page_set_tlbflush_timestamp(pg);

Imo whichever change it is going to be here, it definitely also requires
the comment to be kept in sync.

Jan

