Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E54C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:46:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414276.1644054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bMX-0007bg-CR; Thu, 10 Sep 2026 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414276.1644054; Thu, 10 Sep 2026 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bMX-0007bZ-9t; Thu, 10 Sep 2026 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1414276;
 Thu, 10 Sep 2026 09:46:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4bMW-0007bT-37
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:46:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bMU-00AEjn-NE
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:46:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27c75-2eae-0a2a0a5409dd-0a2a450bd5e2-8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:46:30 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27c76-b7e8-0a2a450b0019-4a7de18c9bc4-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:46:30 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso12661305e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 02:46:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c6ba4sm55085318f8f.25.2026.09.10.02.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 02:46:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1789033590; x=1789638390; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWICW0eODkNw0pMXItBLQ++rYqChoX6o+XJRj72Bgp8=;
        b=EmPS0B6Hk97fx3pqtkn9letU3JlYOPNL4EJoy9RQdVCF8QsBp38uBPBWYmvHomRm3f
         Q985dGOC7x2NVNHhYdawJXjWSo3wUgSfQN6sVfkdHdeosEVtGCnU4j/T+8inldckbpkU
         SLQrO9sy2Hjnu2FUQ6WO8CE5w+zdC+0vWAN4Le1IR/FtQ0B+3AdZJrvnvayJS2TGV+sM
         ul/zDbWcacY/8ku9ZB4GOzzCN3cZJMquk9H81LTD3f+3CHPQgG9G0fzKebMcEohKNvLJ
         JBGvgIEVlk/c0Ho+jQKXBarkC5zNI+bpCz7pcjLwCe50Jf+6vA5hxSPO56hFPPtxdxo+
         xocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033590; x=1789638390;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWICW0eODkNw0pMXItBLQ++rYqChoX6o+XJRj72Bgp8=;
        b=jVokG5svhM3uqJqLtga7VtiIzAaMiJQU3Y0DTq2349ei9tPwVbMLXGzWUWUcHIKAGd
         PCQlDcciaCP1BkKFI+P6ILPqjwOkgnNoHxZexpegmmr89bCoYNjeXXrWV2gT1DihZRTl
         R3KqpXXkgOuHE2vs/f3aQSintUBRlF/o+f/6W9JLAXmjvbANklEdorgYeut7Gwv4aaNL
         g/r8aDlGhKBMuLetaCUNjOzJNROqkbe6u0gtKLFMHNQTRlIZcH4z+KicJ1ckxChaKdt6
         i2huQXPYBuyQiGWDq69jRcdmzsMbo/sVytGfvKGOaQ0JRQrKGnERVMbLK0YbNPJ92h6T
         WOwg==
X-Gm-Message-State: AFuF++k+RSqBICtQ10uymQYjv6jau+J/Ke4+FSMzynIqQ1/zLs/nZX0U
	G+qbJnqZSu407+B7qQ4VaORNuoPENbXFO4VaD325ouUMHqPcL/dlcj5QBEj0Jtu+7g==
X-Gm-Gg: AYBFou2oI5x7g1n2AGRMDNLnl9Q0wabPBIzG0mBlXSeAYF14/7KohLDCEP7F4hl5S2V
	UphCQsXG41VyDCDQWSZVKsDVMBgLVl/f75Ml5w1PL/4C4+1BiRc3RPAx1UbcOudC3nHHqXvOAXX
	ITI9siIlfYahbHC2t0kCrmbTcMjLpsn1WIafyx9licv0s+HowDHuU0eSefGjECsyCxegk33FtOJ
	CDw+NLmqQ37CWyjLzuv08z9ZNUgFISKF6uZM9gySWL5rwH7vczoB6JOayy2jjvDsZ0SwznEtId3
	BfWIRn2r2PwPjFxJOEUMWrs8ozHToPA7z+UXSsCL4LPABU5qeAsmD2VJScPwi4bpf78fZGhEsHS
	JFX3ju/wf184czmvPqyLDZ59CqyUbunNqwuFYlLyiYy2pHRkswlwFa2J7j2qm4nQmATU4gAnJ2X
	j2wvdiTJNlfTrv/ALKuZdM7jlvDszqaSKbAIH0wnOUY1EQQ9wgo+wc95a+sQFOzevqx2s9DwgYL
	UhlLNt3NohSsBkU9jY2oPQUR7+W1n/PfY1sbr5dG3IiU07v6JPfTtDMzlij69k=
X-Received: by 2002:a05:6000:46c3:b0:486:e594:a6ce with SMTP id ffacd0b85a97d-486e594a8c3mr1330062f8f.35.1789033589890;
        Thu, 10 Sep 2026 02:46:29 -0700 (PDT)
Message-ID: <768c0fb8-cf54-49af-a529-8a59cbc9aaeb@suse.com>
Date: Thu, 10 Sep 2026 11:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stubdom: Fix GCC 14 -Wmemset-elt-size compiler
 warnings in PolarSSL
To: Andrew Mbugua <andrewprecious388@gmail.com>
References: <37902bbd-1ab9-4b49-8f94-4b788b3620d9@suse.com>
 <20260910091414.22966-1-andrewprecious388@gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20260910091414.22966-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789033590-1AEDE9EA-850543A7/0/0
X-purgate-type: clean
X-purgate-size: 2784

On 10.09.2026 11:14, Andrew Mbugua wrote:
> A followup to the email thread with the previously suggested changes.
> 
> I have:
> 1. Added the patch reference to the Makefile
> 2. Removed the new subdirectory I created.
> 3. Formatted patch message to be <75 characters per line

For one, none of the above should be part of the commit message. Such wants
to move past the first --- separator.

Then: While I see you did 2, I don't think you really did 1 and 3. As to 3,
...

> When compiling Xen with GCC 14, I get a compiler warning originating from the /polarssl-x86_64/library about a memset element size mismatch:

... this is still in need of wrapping, whereas ...

> ssl_tls.c: In function ‘ssl_session_reset’:
> ssl_tls.c:1778:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
> 1778 |     memset( ssl->ctx_enc, 0, 128 );
> |     ^~~~~~
> ssl_tls.c:1779:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
> 1779 |     memset( ssl->ctx_dec, 0, 128 );
> |     ^~~~~~

... compiler output may be kept as is (imo).

> This patch introduces a build-time patch to PolarSSL that replaces the hardcoded
> 128 byte length with sizeof() allowing clean compilation without warnings.

This again looks to need suitable wrapping. Furthermore, isn't there a little
more to be said here? After all sizeof(ssl->ctx_enc) != 128, afaict.

> Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
> ---
>  stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch

In line with other patches we have there, maybe better name this e.g.
polarssl-gcc14.patch?

> --- /dev/null
> +++ b/stubdom/v2-0001-PATCH-stubdom-Fix-GCC-14-Wmemset-elt-size-compile.patch
> @@ -0,0 +1,13 @@
> +--- a/library/ssl_tls.c
> ++++ b/library/ssl_tls.c
> +@@ -1775,8 +1775,8 @@
> + 	memset( ssl->iv_dec, 0, 16 );
> + 	memset( ssl->mac_enc, 0, 32 );
> + 	memset( ssl->mac_dec, 0, 32 );
> +-    memset( ssl->ctx_enc, 0, 128 );
> +-    memset( ssl->ctx_dec, 0, 128 );
> ++    memset( ssl->ctx_enc, 0, sizeof( ssl->ctx_enc ) );
> ++    memset( ssl->ctx_dec, 0, sizeof( ssl->ctx_dec ) );
> + 
> + 	md5_starts( &ssl->fin_md5  );
> + 	sha1_starts( &ssl->fin_sha1 );

I haven't tried it out, but I can't help the impression that this patch is
not going to apply. The source code I'm looking at has no use of hard tabs,
yet there are hard tabs on the patch context lines above (yet interestingly
not on the lines actually altered).

Jan

