Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39F9C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:46:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413209.1643428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JYr-0003o3-VA; Wed, 09 Sep 2026 14:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413209.1643428; Wed, 09 Sep 2026 14:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JYr-0003nw-RR; Wed, 09 Sep 2026 14:46:05 +0000
Received: by outflank-mailman (input) for mailman id 1413209;
 Wed, 09 Sep 2026 14:46:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4JYq-0003nq-R1
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:46:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JYp-00HGRr-Me
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:46:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1711d-e002-0a2a0a5209dd-0a2a4501c0a2-32
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:46:03 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1712b-5984-0a2a45010019-4a7de14cb59a-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:46:03 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485b1d2874aso288674f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:46:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858bc74298sm40334717f8f.6.2026.09.09.07.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:46:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1788965163; x=1789569963; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lgbui3E8HMFt4aMlGQ4+Kjn+ED8eLzo4WfdkMfbAOdc=;
        b=FOyHtH88gSSCFmntT1pmqWfkSX/GRNiuSkqcg3grolq6wb6QTfDApkOxMWy+X8kOCb
         qPgR8vP7YiaX84vB50eRCONJ4uSoGItXQXzLGDWxefMkF5zEiWMKhiErFaHRdmadYF4g
         0hQdqzmszwsOFNxKxSVIboJ5g7vA3i08qTqFhY1DRnqgcwoxW+lKg/rgUesxt4rUhGln
         XKa7Fjd5b2enedQqc2dvw1fPlJgaIedwOdolxVa5NAlvOcm/FekjO+SjQJS23Q8zdUoX
         letE+WwlG7mKcs24s15041qUCk0OtwCVdtbXr66+PIO9WFBkP/Hnsd7M39lZ5vbU177k
         syJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965163; x=1789569963;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lgbui3E8HMFt4aMlGQ4+Kjn+ED8eLzo4WfdkMfbAOdc=;
        b=rFLv7O66g7Y1dxQyNgTyx9dRddqhC/1lXAEKzR9oBJ9k8oaH3ZlO1J3tmOTgPLR/Q1
         L5hG22lFJj2/Di5kMqtsIFjY6QOSWxHPoCPnlh2HmO4zgQd0Nyy1p3VUQNP4NCfVk3lk
         BLYGPq7A76AoUKcrt9oKxlw7hT+8nkSCC5drJDzxAxpCMzCOr9T973VCqFRn2jbrvpZ5
         0ljrsVowvabkTWUMKeG0CdJsEV6kde9oEc97buktBGFCNurD8jH8q+lIgbmXTvk91klq
         VbGG4PGpD6wBo8KRVWAldLgNp1amRQOyKw6SmwxY/exH9yWGeSaPyhkz8YnNCwhlUDeP
         Lchw==
X-Forwarded-Encrypted: i=1; AKwUvBx96pcbgxo9PXHGLwGIHT3iklQ9KL8yjkS+UYDWXHHk8KesQie6IMjPiZKAEabVQEi3F9AjknevRNw=@lists.xenproject.org
X-Gm-Message-State: AFuF++nxJcdLDgRPS1gVlxLPBczxJZGapPRnui5v7N2MmgkrSkfxwJ7H
	ehRZtvSRU+xOkGivS6eIVlY79zmO+ZySWKno2WWxPN3ORnSQ9l91Fqydn3h2diIdkQ==
X-Gm-Gg: AYBFou3IDNiqqhy02BDv8oOoqgG7ZzQhP5oWzQYlboEtOEt73ewKrElxauFhqdton6R
	YggtsVL9yev+HhYwtz8590EN5x/9FKmqQg468p62ABaEvFeiK0rqGp31yVKierFNboZgj42hKtY
	hcyOYPK0mzUoo7F40Pf3fe90XYVar1bMn9luScUvLtDB8IBsJJpwx3j1ySzbEjjIp9JpH2bkZFl
	i6XVT6LukgHjD/IAon/0EfIMoUh+iBOdwXuFGybDYwiMvR1nPy0bDYY/fHQb4wc6BjTS8gN+Pub
	4Ul8Sbo/0dZdtqwK5H9CH891khun/0QpHeZlLq9CVYbaWeYaK+CnX64qVPXftShm0kjm9r00HtQ
	Ut96wsvu+iAtKXJYO1h/nGp5SmnOQZHVyzzZZOKnnzHLXCGrIHe8B7aXfoin3BPWO+xLePUcv4p
	7W36dz0psGo81lklqN5n8shUmueiuEXf4XXzmDAC+KiuEOHTzoJ5KV9w0ZbLtcylP2k3WyHxkfz
	UZtJlrPuqGylTp1yg1ovoifHefxWBkfvus9SZOt3BgaGYapxOjDaIBIYBUojqY=
X-Received: by 2002:a5d:584f:0:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-485c240e5a3mr3515484f8f.28.1788965162908;
        Wed, 09 Sep 2026 07:46:02 -0700 (PDT)
Message-ID: <92c9bf4b-5171-4a26-a62e-f2a7b1cb89ef@suse.com>
Date: Wed, 9 Sep 2026 16:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/mm: limit deferred TLB flushing to PV domain
 support
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260909140500.73483-1-roger@xenproject.org>
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
In-Reply-To: <20260909140500.73483-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788965163-C4359757-5C97A854/0/0
X-purgate-type: clean
X-purgate-size: 1274

On 09.09.2026 16:05, Roger Pau Monne wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1538,8 +1538,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>          BUG();
>      }
>  
> -    /* If a page has no owner it will need no safety TLB flush. */
> -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
> +    /*
> +     * If a page has no owner and there's no PV domain support it will need no
> +     * safety TLB flush, there can be no stale TLB entries.
> +     */
> +    pg->u.free.need_tlbflush = IS_ENABLED(CONFIG_PV) && page_get_owner(pg);
>      if ( pg->u.free.need_tlbflush )
>          page_set_tlbflush_timestamp(pg);

I'm okay with the code change now, but the comment is still concerning me.
All by itself there is no reason why stale TLB entries couldn't also exist
for HVM guests. It's just that (a) only the host TLBs are flushed by
filtered_flush_tlb_mask() and (b) flushes of guest TLBs occur when pages
are removed from their P2Ms (aiui; hopefully true also for Arm). IOW what
the comment says looks to be correct, just that it leaves too much to be
figured out by the reader. At the very least I'd suggest "..., there can
be no stale (host) TLB entries." Thoughts?

Jan

