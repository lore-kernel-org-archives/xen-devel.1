Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B424CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 11:34:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439064.1657572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCbWN-0006Gr-87; Fri, 02 Oct 2026 11:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439064.1657572; Fri, 02 Oct 2026 11:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCbWN-0006Gk-4Z; Fri, 02 Oct 2026 11:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1439064;
 Fri, 02 Oct 2026 11:33:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCbWM-0006Ge-E1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 11:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCbWL-005niw-No
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 13:33:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf9684-e002-0a2a0a5209dd-0a2a4505a02a-24
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 13:33:45 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf9698-4cb1-0a2a45050019-4a7de1639c35-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 13:33:44 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-4887840c529so2588683f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 04:33:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280c84a9sm66076845e9.10.2026.10.02.04.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 04:33:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1790940824; x=1791545624; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDojIWkbTG7AeBUmA+WcXOG+4O+hb7+PsQogC6F3kz8=;
        b=MVrzQAy+vtTRlDo/hezOFzPeK9ZVC2M92Zr8KDDBHUFAM9B2AEWGBpWwdZMEGce1Kd
         unjsc3RCp3APyT5uQ37V0NFNX86wDlKr4Joo8+F9cHNIXZmtCNl8TbZ935oTmiRo+Xyf
         nsRJiIThLXd8h4QSLJt2MPQju/nu84oVfZtvmXNvxJN75RMcs8vfktDRvGwGJSAsOpic
         flp81krlBIBcqnlEXpw22kwN5CQYJRw06o113eoUonvwgVSNUKUjHIAoamSVUbWGZnQe
         0Gp9rUI0I6H9tRbXZEnQaKY9ZtL66Dvjw14lUeJN8gpcvnmm4klBgkg0/xruqxU5tySY
         ayzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940824; x=1791545624;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDojIWkbTG7AeBUmA+WcXOG+4O+hb7+PsQogC6F3kz8=;
        b=pc1PUuSwuJ0TM0oPX96QPlq2W3T4X/c8KiXrpn6y/sAZu6Kt7jITtaP9fqiMfx2FgN
         na1O41DVSUSx59edPPlHrQ9CmM+TT4KHU58RFzDHwbC26HgrIojoVz4IY6MlNJtDE2/D
         6L6SDvC6PeF7bSoR7ZHA3AR4+V5fFxFtM+c4UuaB1fZSq0GTLvvE9L0yjmCBjhfxo0J1
         3bf7TPV/NmiNhRxIzdM+YIXDmK9I+i3Btu41ONrvr0wFdCMri3gv12mgcaDyTNpIfD/j
         9vYeLjM3w2lq9AYE427rBMBsPvH3uJ3V4tTKXbKkBpnEQlqTykca/LryoWilmgCNiJ7n
         5pug==
X-Forwarded-Encrypted: i=1; AKwUvBwsfqDOs9eNshE9yZdKApKTYQcK0ozHNYuGJ7pxRjNVNd9yxmPYhsJst8ngQ+0bETMfEamGeLhbkDI=@lists.xenproject.org
X-Gm-Message-State: AFuF++mG4QIkMN4K/4+gHgLkegHHQ83PknN+zF94mR3yy83YEsHC23zY
	rjNr2wyNRIV7SbTzSXumeO8y9WTODOfX0R7N3wh/qU/tgdAD6dhifQvHRPo0FyTYig==
X-Gm-Gg: AYBFou2NskjoXLnFzHqKapC64mITIwJq9aiZJ0m5YOAfTBIUdYKnkRXfHQmgrfjCu7L
	pgSrwGIQ9KJjanKng0NYoKBj1zwC2nzrp8F7vU8lkMlZyBtwFp+h08ToseK0dRYzGO6xpTo5h6n
	uilDGVL01ok6O8BpaD1jlcSmbzVqPEX9cfOwji2jPmhHnPC/koZ1rDaRFaqgDJhEuvZNQztYYrO
	rZn43HsQHpZeiMFNlIsIhe/NHoBzO30Qt9REY9DKthNLN+cPuYgdfFvJlpM8qg6pU50Q4x+9jBX
	0UUzuwCVcFkuFFg5li/KsT9lu5q01JgTUd12prirX6HyiTCxGj2kgEmYjSXsiKYMBW8B+tX1pFm
	EyX0U9RldfXT2lMPas7+l1x7KrYEcRx0UGgq8/44AVlLtTvHSJfPz6DySeitB6zbwiSRah1KB12
	3HucUMdHWUY7nk2xUS3Y51VeabelBSHDYGRUMaWD6z1W0ANDleWyIrx3enTCZwepdO5jIXmkGFr
	HTqRBU7nZWPEGjktPgcZrCH/vh/V4ONgyaJfI0u6XIxrhd07nruHCnbXpfx4g==
X-Received: by 2002:a05:600c:3e19:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a027534b98mr43334665e9.3.1790940823925;
        Fri, 02 Oct 2026 04:33:43 -0700 (PDT)
Message-ID: <8e26f887-453b-47cc-aaea-6c6675d9f9a5@suse.com>
Date: Fri, 2 Oct 2026 13:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: restrict context switch hooks for the idle
 domain
To: Roger Pau Monne <roger@xenproject.org>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261002112005.20656-1-roger@xenproject.org>
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
In-Reply-To: <20261002112005.20656-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790940824-F64B42A1-D441D108/10/78276251493
X-purgate-type: spam
X-purgate-size: 1098

On 02.10.2026 13:20, Roger Pau Monne wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The arch_init_idle_domain() initializes struct arch_csw idle_csw as:
> 
>     static const struct arch_csw idle_csw = {
>         .from = paravirt_ctxt_switch_from,
>         .to   = paravirt_ctxt_switch_to,
>         .tail = idle_loop,
>     };
> 
> but only place where d->arch.ctxt_switch->{to,from}() are used is
> __context_switch() where they are both guarded by !is_idle_domain(pd)
> which makes the callbacks in idle_csw unreachable.
> 
> Introduce a new poison value to be used in unreachable function hooks, and
> set the from/to fields of idle_csw to it.  Use a different value from the
> currently defined ones for easy differentiation.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
provided this doesn't raise new Misra violations, including for rules which
aren't entirely clean yet, but which are actively being worked on.

Jan

