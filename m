Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC2FC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 08:37:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372246.1619631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wodIs-0002A7-OI; Tue, 28 Jul 2026 08:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372246.1619631; Tue, 28 Jul 2026 08:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wodIs-0002A0-L7; Tue, 28 Jul 2026 08:36:46 +0000
Received: by outflank-mailman (input) for mailman id 1372246;
 Tue, 28 Jul 2026 08:36:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wodIq-00029u-Mh
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:36:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wodIp-00AXlY-6e
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:36:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686a13-bab6-0a2a0a5309dd-0a2a45069028-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:36:38 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686a15-195a-0a2a45060019-d1558035aca6-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:36:38 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-495590dde14so39635995e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 01:36:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c6dc25sm55057682f8f.33.2026.07.28.01.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 01:36:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785227797; x=1785832597; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kf0WjAbLiT9RQsokDaJJ9itaga43guYI9GPwrulwIuU=;
        b=ZOz0Ji6vgcVSAUCYzSwmmOWlZ9u0uKcWZSQWm7eAyeukxTGX5pERFYowiytqXx9txW
         dOIYlEVBI8pucKMlN8LC5+Kn04oQfJUEpZ2BynLDa//hR9fR5Pe25nEceainq/yRqb7t
         cf/7aVHhfhMRIFp7DRRpd9JGvffBDrXzmUZKHYTWyjlB7G3+Lgwh+Ba/N5Eg9aA0Lhwh
         SlDJzJj2GaZBK+HsTFGiaFpjOg/jfIzgoS6MZ7DRLjRWU6YHa/ZywWkBPWJycpU85WZP
         +BigIE4DCUI6GzMMm7tymDra64WAgfnR99z9tE6GuJoYsl5vRGT7AqgY0hii4k1r50ib
         TU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227797; x=1785832597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kf0WjAbLiT9RQsokDaJJ9itaga43guYI9GPwrulwIuU=;
        b=CHQWGyoi/yqC6hDr2P2O+y1IWAYiIIwnbtRTpxOnB3KMzp4+/IwAahD7wGoJ96opeQ
         LUUm+gzI88lNoUqo/Oykd0Bf5cub0VFj4dXKEHZkSa9s+mMFLwQekqg8mKxqw5v/nbdk
         +/qzT6GOC9AWtyGF4w9MWIJU9L6/rkFEeFR8p7fN/ii+uvirnhChRT0UK+NfFoo6FzZl
         LFXGtj3rfFgf+Fd9TCBD2xa/9+DQOJQs+4xQQ9kTFoZGjZkNlmsqjLJ1zv/kwTFSvbWc
         Pkq39Z9ICzZBSK5UxcHCul9P3uOsMVE04IE70Wl6bsqq5Gwjpz0hq+/eqlYOrwrMOTcx
         hoQA==
X-Gm-Message-State: AOJu0YxOg/nQo6erieRVm1mEwFJMWeXfMwdXqrr+VKToZp48A6K0b0CK
	d8GNhN46f1WMrGpeGS1czgMW6sS3GHTJ0C+yq6JW7Hlztpa2kduB2CaTn7WG6h973dNznlTFPFw
	oaWQxUQ==
X-Gm-Gg: AR+sD12+yJgez07Wfn+ZPCikf4kR11Bd9KmCpoSWaLlh4Gpf3JCY0jBlaZnj9GeOXay
	3E4nabbfPBJnRCzeZuQ1cdZj9YTTHSUb1xFVx69qCdyHGcnVc/Mvuy7yVzJ77Il362UE6fzEfYx
	npKtTIzOui0uhHAKx0DoLEoTVEytg8nE7CBaZQ4H3nPORZVGKOnaLKiGI31hoFP3hmils4aFamY
	JaZwgJvg0GaVkGLh1M0w4K7YceMYYRGVIatti3921MbZiSlTik3yrAbS09s/RoHwnPhR+WbYkxw
	HtkwbPHTvPZCQksx4zVFZWDrrXj3gwVaAPWlta10idiubArR1nrzZFyPOnx+nBQuXyuDzj6UA7D
	unHPoL8gV6oAZyUlp1RRNjpRLCqsPfSgPAAWNcp/iT4Sjhj1ODRXZ6RB6ycuxtxe4SefAYIFXVr
	RhS0/Ban+WLPftHnTrx4Q0vDNYdaE/ii8d2Lu8KWrizdHqQni1ndHKMbGhDpyH4lJfZbnfVG4CU
	Ma/
X-Received: by 2002:a05:600c:6304:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-496c641069fmr17029655e9.8.1785227797596;
        Tue, 28 Jul 2026 01:36:37 -0700 (PDT)
Message-ID: <c9d23b9e-4501-4dbe-97af-96ff8122c988@suse.com>
Date: Tue, 28 Jul 2026 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86: introduce "brk" allocator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
 <f7e3cd68-f6de-4ada-87d9-1a5dff277b2f@suse.com>
Content-Language: en-US
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
In-Reply-To: <f7e3cd68-f6de-4ada-87d9-1a5dff277b2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785227798-FD60A77B-79AC65C0/0/0
X-purgate-type: clean
X-purgate-size: 1347

On 27.07.2026 12:19, Jan Beulich wrote:
> ... to replace ebmalloc(), and then to find further use(s) to allow
> recovering memory which is needed very early (and hence needs setting up
> statically), but may not fully be used (or not used at all).
> 
> Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
> other code is converted) will be able to free part of the BRK space even
> in the xen.efi case. That would happen if BRK space extends across a 2Mb
> boundary, and actual use stops before that boundary.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
> right here. That'll be done when ebmalloc() is replaced, and hence
> what's there can also simply be replaced.
> 
> The xen.efi detection may want separating out into a helper.
> 
> When linking xen.efi, ld produces a base relocation for the reference to
> __subsystem__, which is wrong (that's an absolute symbol, after all).
> While that will need fixing there, it does no harm for our purposes.

This remark is stale, I've updated it to:

"When linking xen.efi, GNU ld prior to 2.46 produces a base relocation for
 the reference to __subsystem__, which is wrong (that's an absolute symbol,
 after all). That does no harm for our purposes, though."

Jan

