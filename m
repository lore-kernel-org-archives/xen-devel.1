Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CE1C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:47:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383053.1626314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXH9-0003Ye-1Z; Wed, 05 Aug 2026 08:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383053.1626314; Wed, 05 Aug 2026 08:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXH8-0003YX-VJ; Wed, 05 Aug 2026 08:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1383053;
 Wed, 05 Aug 2026 08:46:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXH7-0003YR-Vo
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:46:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXH7-006QlE-8t
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:46:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f877-bab6-0a2a0a5309dd-0a2a45038e04-48
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:46:57 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f880-fae8-0a2a45030019-d155dd2ea416-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:46:56 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47fde295992so578161f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:46:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfe5e85sm6963759f8f.14.2026.08.05.01.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:46:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1785919616; x=1786524416; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9K2nghcFTEoUumQc+qv00dhERm+3wC5Gi0zPR+wU7p0=;
        b=RdP+6138DK3Y+tiUYh9roc/kYhroYANfewd/5RapZtnqVVZ8UQilgZZGMtbZrmTkG7
         8o263Ed2iZqsDlBksFc5e/4vib8OpX7lSsvI2ZMeTgp2G94yJO/n+lVglE8PC14tlY8j
         u4ryZDyJZemW3daz7ZUjrOa2I2vvro09daqqgYTCkj9cZ++/UjvjW7qe2Yuz8gOQcJEj
         g+S+BH99QFGDgtu29m2TBYCcNv0cuPn0DiUYFHLM1RJK6tSi+SENPEQpBJMiBcevbc4I
         KZC1qTzopI2S+0daQKIdjGNOE/ptwBMYVFGnqqUbpty/7V05BK/k3rCi4Tfo/3dKWTL+
         Rn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919616; x=1786524416;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9K2nghcFTEoUumQc+qv00dhERm+3wC5Gi0zPR+wU7p0=;
        b=A2LgVD2C351H1SHCMW89EiDNRvOr5Q59Y4xVzzL4y8JjKSYzRU2Fwb/Tj3bMVxlblz
         4YUYoW4iy+F6uBYVb1+KfgA2W48OvdRqwmOIalSdjvQY9NI2CjvcTl1jP6v15mBePTi/
         bCfG2EYHLcZWNTDyvAk3bwGYq/AZpdOk8ImfvjGCAIH1yZTyRlEVvjns59TOnW4RV/Fb
         2ZtIaF7jJp8Q071eixCtrWWbd4fW1b88i38fzUR3a3M9Cx3IZjOeMsWplKVKV29hQLoS
         ph+bhLiLNjd0trM+Z9/MX5Ba36fYFG/cfTcHAWABf6lINOLc0PsQX53TlQs2L4U5wiJz
         UwgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2RWAwbpThX3q+Exye57n2en8yHdNhiC8auLzv6sZDQBdFN4MoDfwrozQspRwpRC1mBDG9THu0wMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfGLpmMwhe6qsnAKasTob7HUC2Jy2niXkiW5ulFaoKVlOATDXD
	xDKTFyfkowilR+d3hKhEK0GAJU84FR+V473zRBshdl0h54u5n/NukYqVtG2wXIV5jQ==
X-Gm-Gg: AR+sD11s65pZln/MaSSCjWHUmwADzJcZ8rFL2ZOtSuaxFp1I7nvu0HpJDZHWQMy4ULi
	aAj86Nrc9jOmij3+n62dP8EDTLh+pM1+VW2qcUtGKl64L8c/w+dj3qVT1KaIXW0Q3CDXfb1MrYb
	W6zGWygGtQJI7Tny4pw3SAYxIGNAjlwVLFwz6/H4+LhXc0Vhgvur0JaSZBKhnxBlzP9zaBTcfsK
	+WozO8Zqgdxjj4TDqmThlmBXQPP08mcXrOEjcJtpJzP4eYqA6fBOpu7ax5MF4xGkZLNTOWgvljk
	CtUJO6F+Jq9bsUDrYXU+pCFKfRxLBD1rigWw2kDJd5GUC/yXE0ZPGtzegA0IK9VbqCmqQqbWzsX
	2iHkaXWjA1tmIBxDyK6mcFErpYhUSfROvTIAsrqIJdkAdY0aPy7XlEE6dkF//kWY/0x4rkNDyDV
	06Mys9zPA0LBa497MIY3EwS8/FicSW/Ex7Hpfq7nu5hwWxipqy17v8cQ/m/++AGhQJWA1NZ+TPa
	QkkrgdBVSBboAS6muMrTWftGsylYPPe3VCFGeCLgd9CjfIPZaAyjOKIahe9zsy1
X-Received: by 2002:a05:6000:2282:b0:47f:9158:5924 with SMTP id ffacd0b85a97d-47fec517023mr7487875f8f.9.1785919616177;
        Wed, 05 Aug 2026 01:46:56 -0700 (PDT)
Message-ID: <ffbe1886-553c-499d-bbbc-fa239b671850@suse.com>
Date: Wed, 5 Aug 2026 10:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/alternatives: Rework get_ideal_nops()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250522150015.555492-3-andrew.cooper3@citrix.com>
 <20260805075303.23105-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260805075303.23105-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785919616-776F34E9-7F2E92D1/0/0
X-purgate-type: clean
X-purgate-size: 480

On 05.08.2026 09:53, Andrew Cooper wrote:
> The {k8,p6}_nops[] arrays are both 80-byte structures indexing 45-byte
> structures.  Furthermore, perhaps unusually for C, the source layout is an
> obvious hint about the triangular nature of the structure.
> 
> Therefore, we can replace the pointer chase with some simple arithmetic.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


