Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C312CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 14:33:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449154.1665076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH02r-00054Z-TB; Wed, 14 Oct 2026 14:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449154.1665076; Wed, 14 Oct 2026 14:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH02r-00054S-Q2; Wed, 14 Oct 2026 14:33:29 +0000
Received: by outflank-mailman (input) for mailman id 1449154;
 Wed, 14 Oct 2026 14:33:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xH02q-00054M-BT
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:33:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH02p-005ppF-OR
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:33:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf92a8-e002-0a2a0a5209dd-0a2a4507caf0-46
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:33:27 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf92b7-b4ea-0a2a45070019-d155802ff115-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:33:27 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso10548865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 07:33:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd5c748csm15835e9.12.2026.10.14.07.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 07:33:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1791988407; x=1792593207; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/Y28sNNN2MKpKnPvSQDvaeI1kGzroZ9VW7pAACaSVg=;
        b=GG4jR0AOF2auL/Ea5d5fDGcwdOrjvpmn9xpTJkKoKMseg9IWaIqVZ/G/QzhSYSIhBk
         L7cYvQrdiie1L3r0emsUM6cPKPSjKF9Pyr3YYUe7uycKBqZ/ugBbxLCuOfXQt0kQrDR/
         QrZOIJR/TLujz+KXdamsmJqPzRAQZWypEthhHq63K7rS5aeg0YzaQZZQs+vKzdy2BrID
         JWg4SuclxhVtNfpUqkJ/I0y1uH2q5UCGIB2wY39vAyNBf0zFSnGgNDp4zXxLTFHQ6yqt
         bMRsPfiNGwUCqCT5QzwjhDZqxGPj8DJbwTuMhE6yWbYM0Fbfh5uNclyMY9wbS48qnWSR
         PmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988407; x=1792593207;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/Y28sNNN2MKpKnPvSQDvaeI1kGzroZ9VW7pAACaSVg=;
        b=26ch/XUE1hvOBfcNU/94/WgPnSAAwiSkwWiSsKhDC+6V501d+OgtqDIkH0Q9GflykL
         25skdCKnQtMpUi5VldaVBxyb/X3p9Z12i7IQ2ZHiCFebzPDDPxB5RzpaoSj1ajuONFFt
         sMDzgQMokqM49i5yh3cdmUj08GbdIVS5bgTMqpssK9Y9pMsfmXlSmMslmZlaR/asPmqE
         tdoABnTz7qf659htz9esf4qtNVkW+h/SsbCzG0lAi7MejFrXt9ZJf1k5Xb5YVbplobMX
         zaBGk+ujgRlSzuyQtH9E7xt5hXs0/Fi5u1uruJaEUQnbt34CwcpyKCIKpjrtqW0T/R6M
         +wzw==
X-Forwarded-Encrypted: i=1; AKwUvByuErdTILZg6R0u4NTSXXMoc4vMl5I0SBu66fUlSChv4OG2Rv5h3TmOoZ3f8hjlghRJhpbS1gNExZY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJeHDNwKlBW7WdsAComz8lZPpcgLQ5bbRt/dd0/cDj9lFzVGI0h
	GQ3iUAEaQlHiIP9NSMOu+RWQLT4bo1ffKbwDZ6Jc9RU4Uy2De1QGgLQ5i9QEVwg1yQ==
X-Gm-Gg: AYBFou2v7Zc2BM1UF33mthiXllwMtynxo0H4n4fujx53Z/1mRGPCFpqiRdfOqqwqgNc
	X2VuHWZfdmPzlZCTpfBvuQmDe5KSTP9hxzKgcv6yzDH0TkUtxs+6ucGOBxvojjZlhsccHIXYwmY
	JimGuAsztKe5s3OVOn8AXPXf88wygXhyjSzHD32Xhv0EIEjCXhEKCE7G8lmAKGPKRYvRt9hEsog
	H+NCvXqXcy2gG1kn90WhDCkLiZisr4iTVjNrMCjKpf2oC70GjBZ/7NCg/rXLyItTjObafMcetnb
	Pa7MkCgdBgTHyUlrdMhl9s9+W3EfggHgydTppvrtQNQkhcm6YtKxQsPkuglhbuSDVTgvU/YV63W
	bJ4PJwhBuoeBtTKiWPbLABgR2wKKib8EJlLVQ5/lAofUUnJz/v4qTxIN/9N5Z6jnh9r+ZasthJu
	Yrx/mfFguxpfaU9ol9sBe3R18VVnnqZaV7WwCAVz1qSVYaNf90ke/G1pWE3Z+5dRlPE7zuaSiUa
	uEO62+IrPUIvxLUM8CDufiNsdAHyDx7bIOr+JXDUmOXAZmdLSlj+A/d0CTIVQR8Y1j/VBSl
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a18e4a3f69mr317625895e9.14.1791988407084;
        Wed, 14 Oct 2026 07:33:27 -0700 (PDT)
Message-ID: <bfc959d3-fa71-4296-a984-4af85edaf770@suse.com>
Date: Wed, 14 Oct 2026 16:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/atomic: Fix UB on various atomic helpers
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261014133551.622462-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20261014133551.622462-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791988407-A44CBAE4-1D11377C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1579

On 14.10.2026 15:35, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/include/asm/atomic.h
> +++ b/xen/arch/x86/include/asm/atomic.h
> @@ -122,7 +122,7 @@ static inline void atomic_add(int i, atomic_t *v)
>  
>  static inline int atomic_add_return(int i, atomic_t *v)
>  {
> -    return i + arch_fetch_and_add(&v->counter, i);
> +    return (unsigned int)i + arch_fetch_and_add(&v->counter, i);
>  }

I'm concerned seeing this kind of change: It's merely papering over an
issue in the caller. There's not going to be UB if the caller passes
suitable values. And the atomic types hardly are meant to be used in
contexts where overflow could occur.

Furthermore different parts of the C spec say different things here [1],
[2]. Hence whether overflow in signed calculations is undefined or
implementation-defined doesn't become entirely clear, according to my
reading.

Yes, [2] is from "Conversions" when here we talk about expression
results, but unsigned overflow not being UB also only follows from
what's said under "Conversions".

Jan

[1] From "Expressions":

"If an exceptional condition occurs during the evaluation of an expression
 (that is, if the result is not mathematically defined or not in the range
 of representable values for its type), the behavior is undefined."

[2] From "Conversions" / "Arithmetic operands" / "Signed and unsigned
    Integers":

"Otherwise, the new type is signed and the value cannot be represented in
 it; either the result is implementation-defined or an implementation-
 defined signal is raised."

