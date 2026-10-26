Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C038606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CcmUl1Gn
Received: from list by lists.xenproject.org with outflank-mailman.1461111.1672067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIRR-0005Yo-Br; Mon, 26 Oct 2026 11:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461111.1672067; Mon, 26 Oct 2026 11:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIRR-0005Yh-8l; Mon, 26 Oct 2026 11:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1461111;
 Mon, 26 Oct 2026 11:00:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLIRP-0005YY-KA
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:00:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIRO-006id1-QH
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:00:34 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf32cf-e002-0a2a0a5209dd-0a2a4502c906-28
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:00:34 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf32d2-6ca4-0a2a45020019-d155dd34bd8d-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:00:34 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48e0d1c095dso1648387f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:00:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb902sm16480172f8f.24.2026.10.26.04.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:00:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1793012434; x=1793617234; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei7vttzd16p5T1ZrEZ/u/MoBXfEEiqIvkZTZGi05x10=;
        b=CcmUl1GnBFLFIo7L2yVOkEW4vXLfEtKfRmYHSL3PRrQsJ+cXdyIPKbpOAC6hlvvSQw
         9ZI+rovZndhmOTHrd7WlwR11/s6kPEnjWmx6kd+vXrB9xk/mhR7EFkOKTcZlBKEvsgJx
         Nav5xWraAh+pmXJvhUn78kLYOh/3zUXiBlVnVUl4arChlcOyCxuzNVvjbywZyJu3nJi/
         quuzUewEvpE7FXQwVoyaQ8lTuV3E86VZI5W5rxAqVF4A9KBNIn/JlINdgC8IwQFnyEPW
         xcF82atMmlKBH8tnDMl+UIvyWGYNSfLJTHf1SDsSy/U2+1BiO+jO1KiPrQYfXifCiqyS
         8nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012434; x=1793617234;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei7vttzd16p5T1ZrEZ/u/MoBXfEEiqIvkZTZGi05x10=;
        b=NDZEUA1eZPTPRYbhxgRuxZyYfMQt6NErJWc0PmRpFkc0yRN92kRPBAQq/EMbqSwbUf
         gtoYfCBenuXTwIoCSPYoQA+9B0wCJ2+knEa5io7NSj6goyOTYEhveG8DlWjyBXvqZpsF
         fVyQUPZviu/NtpslcjyWdKIPp9wQI7WTRkYED6H0tK32u385fmLgRWYh5C7BydZ953wM
         aBA2aQKthmJLHbLwhG24x1bsk0Zm0qLrNJJuOSQu0TNW4LZyIw8LaKDdxIi2My+trXhY
         bDPIRQ+ivxXXM29VrNq4MJVy+vwu4ycYaz/uWJrGZnHeOH1r52ckhL4hHtsA7AJPByPl
         m73w==
X-Forwarded-Encrypted: i=1; AKwUvBy5rBFre8vcUL14qXGBogj0/Er+x98aqpGO4L5tXjy82raPGqma/9qlCM8sZSo4c2mghBnxoXoqtqY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIOMSF5m3GPOf4KkxIHPijNhHEDBiPP11+ZaHUdgZZRgLS1BRBO
	fOIS38Ibihg6gJgQV9ZqJpijGolFAxg7mv7YaSFE2j2Ta91R9ClF7M+afTck2jmlrA==
X-Gm-Gg: AYBFou0k8ZNs12QgoO2iF/09MaV37dAdL4lTuaiI6J6au9A0+VUcBq5Ft99qXS0gfy1
	oY8UduFQHx1+D/zO2wSsvDyvU0tTj+TfY07K9fIf5/FTmzE/4pK5abkSdz7MKrxRsuvt3K8lbTb
	Odv84nAqgKPHvgZ/zG9E+Vqfy86u8+tNuRQBESbQBIK5n5j1ls75IcHSjjte0i9yYwzwJJiTsFg
	/EseXwqvgMjNXgLVNu1tRiLRu/S9rGuwswZWWr+y7rlMGqG5K5WlqY/eDFbzsSDimK0wwOMpKkY
	YCibWrGg0/QqUq8SIPGX1OYOuUhzCLuhmmpYepJov/ZpN09J4Rh4lbu1gXMNEJ1DMH2QqOSDQC3
	EFDdwq4cei+XJnH1vQ8icuLU3C7o4bfUMOUtsof7w6XgfCGF93pDKWMt/ex7KOsJvWawNiZj9Jn
	Jf3/E/p3FQZhFzWYGgFptzc3PEDXc9n5+OnN3D9YTOilwKSX/bqFKfqjXXxH9vmGrkwoTPaH1rY
	S8v2B0RLSNZ374lwCSOklLvggjexrHOib3iwhEkOa+CzAMgzUbHryaktezjTdV9XmxlYWllnv+1
	N54l2mQvT7RKG/ej73q7FJ9Xi890ESpohEQhyV/ksx0=
X-Received: by 2002:a05:6000:4285:b0:48e:bf0:352 with SMTP id ffacd0b85a97d-48e3eb4676cmr14524867f8f.5.1793012433986;
        Mon, 26 Oct 2026 04:00:33 -0700 (PDT)
Message-ID: <edeaab3e-95e7-4184-baf9-edab27096bd1@suse.com>
Date: Mon, 26 Oct 2026 12:00:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/page_alloc: scrub each page in
 unprepare_staticmem_pages
To: peter kang <peter.kang@boeing.com>
Cc: anderson.choi@boeing.com, matthew.l.weber3@boeing.com,
 joshua.c.whitehead@boeing.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0caeae8b795439ba7f9d466571f0d125b924feaa.1792992356.git.peter.kang@boeing.com>
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
In-Reply-To: <0caeae8b795439ba7f9d466571f0d125b924feaa.1792992356.git.peter.kang@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793012434-F24B62AC-235FEE46/10/78276251493
X-purgate-type: spam
X-purgate-size: 1140
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 07:00, peter kang wrote:
> From: Peter Kang <peter.kang@boeing.com>
> 
> unprepare_staticmem_pages() can unprepare multiple pages in a static
> memory range. When need_scrub is true, each page must be scrubbed
> before it is marked static.
> 
> The loop currently passes the base pointer pg to scrub_one_page() on
> every iteration. For a multi-page range, this repeatedly scrubs page 0
> and leaves the remaining pages unscrubbed, so a guest can later read
> stale data from pages 1..nr_mfns-1 of a static or static-shared bank.
> 
> Pass &pg[i] to scrub_one_page() so each iteration scrubs the page it
> is processing. This ensures every page in the range is scrubbed before
> it is marked static.
> 
> Fixes: 4a9e73e6e53e ("xen/arm: static memory initialization")
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>

The patch itself is fine, but the tags aren't: The patch needs your own
S-o-b, and in the vast majority of cases the first S-o-b should match
From:, while the last S-o-b should match the sender.

Also please update the Cc: list - you've used a stale address for Roger.

Jan

