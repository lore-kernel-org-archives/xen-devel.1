Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B5C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 08:03:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382013.1625435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrA6p-0002m6-Q1; Tue, 04 Aug 2026 08:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382013.1625435; Tue, 04 Aug 2026 08:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrA6p-0002lz-Lq; Tue, 04 Aug 2026 08:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1382013;
 Tue, 04 Aug 2026 08:02:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrA6o-0002lq-EL
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 08:02:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrA6n-002m56-RE
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:02:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a719c9e-e002-0a2a0a5209dd-0a2a45079228-22
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:02:45 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a719ca5-b4ea-0a2a45070019-d1558032e8bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:02:45 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so14270615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 01:02:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fc2ff6sm61006725e9.1.2026.08.04.01.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 01:02:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785830565; x=1786435365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86lG+DPRfxOIdxiwMYJYnP52hG1gKOaF+TCIcTnAaM4=;
        b=c+gtxNu+6XbnY0AxLVpUXJqa7TV2MYxdLzhgmRBFc8Endh5EhJonFkI6Y99Zo3bEbB
         X1skoq6n2HdGVHE2s7EjSRANeEj50qUIvFzCPrvslI/UZfM6qZ0J4QLIawmcyiBUQDXI
         9So/Uo3mHnBN58c1SeXNa6iHT3hMSw9MJIXoP9M23dYKJPFg9asPG9g6XeILoAEJTQO0
         82zIOYv5HWCBvWhMO+4ybTMY2nSA6THgTnr/khkAZSWim9oGo+20itt9AwUqFpreo1Nw
         J9+nR9LEy0A6fZMM7rFG9IR2FDnQ+RACDbiTzcgBo9CFSIo3zp3qe6SpWVJE2yyoGgfZ
         idfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830565; x=1786435365;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86lG+DPRfxOIdxiwMYJYnP52hG1gKOaF+TCIcTnAaM4=;
        b=C44G0LOvpuLJ0USwq/D7PHsD2Ozz/wQARwJUV9fRrBVl6wsRJvsRIbHZ6iAQZeZGr9
         M0ksIX9u/DWeiPtl+P8/l0MevVTVGEEw+lw3BNAJtsjjZQIcKLjdp1DggUp1j6SygNfM
         1XS5vF/cIE8Vcl3naEGqFC24ZuhV+LAGoTxUn3gkJfaR7mv4Sk1/Iv4dTfl3O8SzFVD1
         sHLmfMyFsCtYcDCCjLfRRilRbn662PsaZQgd/BTCZ5zGVL0Ibdie3ev/aBi4Soycwh53
         gdWaawCgGCTesL4OVRz+LhBrWY9UfCHiaWvo9XusygGLzQ0MKQf1vnOSmYcj2gMsyqFc
         WUrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr72PA0ckmkBVCecEXb+cN/qOO07zO6W3lneeMiUhY7LSUjmv4EDrJqQ2JQ7cF2vzVwGC9ex/sA2Vg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4PYJzuW9sGAQvKlYUvNFSxaezY2BGrdIGq78udGpzolInFALT
	1/C8BSkw6elPOZpP6ophfP3wjFsZECkFtkh4+ZXJg0uPtU+kIvRNky/XXzgo9eYYNYy7qJlQoUl
	c+H9vnw==
X-Gm-Gg: AR+sD119J6OocNKKv/jwuNRpJ0T79+P64jFppCsW83VySyCflMTlu43EBYhActpBKav
	jHRpQaEZjmH6+Kjs2YXvzi5GxqHrAYqUKBgWN5AHS4vQ0QeWX8ymyByQz39N4RfMlJYQKKQL5sT
	NJ1jcMc/ocJ1EQo2sy9GhmxrIDCa4uJXAHDNa22OmsaR0HwN6DE75LvoN9JVH16eHD9Lj4FyoRl
	umAM90a3Opvii6Bqc3d405lRBDUpoovXhr3lPq1DCLAcsh62Cf1HsR8X4nuaevz8cSXxo1vAYcc
	nt8j9Ue65pZ9I6ZmSLO3nEXZW92hfr/QPyXRk5EOLmqblZh0XLcml0dXuEcs3iftBZsPLeuWM+C
	kJk1UkWEYbtmaXRdO9G5ZoMVYa8DASL0v8/RyGQdK1HOhgY4ozYs+ucH1kpYwzWaeinM/gweEoP
	h0yn09jPc2JAGVomSWaEGo3lJObdqZwk34J6748NONbPI61VSz5k3thuL6eI2IT9aKfBkMiDvjk
	yijcSwS0bN525lBwZZHaZ6MQ7qztY70YnSazmWBtwcN8I+IwMyNqptGECqzXlQ=
X-Received: by 2002:a05:600c:e557:10b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4980c64b824mr211207245e9.7.1785830564585;
        Tue, 04 Aug 2026 01:02:44 -0700 (PDT)
Message-ID: <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
Date: Tue, 4 Aug 2026 10:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux PV domU with >1 vCPU never resumes after xl save/restore
To: George Dunlap <gwd@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785830565-374D3AE4-8F51320E/0/0
X-purgate-type: clean
X-purgate-size: 512

On 04.08.2026 08:12, George Dunlap wrote:
> Saving and restoring a multi-vcpu PV guest appears to have been broken in
> Linux for some time (observed 6.6.56 and 6.12.86).  Report below from
> Claude Fable; I've independently verified the behavior on vanilla Linux
> 6.6.56.  Claude seems to think it's a bug in Linux.

Just to double check, as there was a crucial fix there recently: This is with
a Xen including bedbc17d8407 ("x86/domctl: restore all registers in
arch_{get,set}_info_guest()")?

Jan

