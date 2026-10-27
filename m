Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D1606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BxptJ1uJ
Received: from list by lists.xenproject.org with outflank-mailman.1461854.1672859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbPm-0008Cv-4H; Tue, 27 Oct 2026 07:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461854.1672859; Tue, 27 Oct 2026 07:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbPm-0008Co-1I; Tue, 27 Oct 2026 07:16:10 +0000
Received: by outflank-mailman (input) for mailman id 1461854;
 Tue, 27 Oct 2026 07:16:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLbPk-0008Ci-Ot
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:16:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbPj-009JWF-Tl
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:16:07 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae04f9a-bab6-0a2a0a5309dd-0a2a4509c80e-34
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:16:07 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae04fb1-be1a-0a2a45090019-d1558030d848-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:16:01 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so30719305e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:16:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a2d9280sm243047375e9.13.2026.10.27.00.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 00:16:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1793085361; x=1793690161; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uewbo8Z2JjHZoFIUBtycp8zjmlIrt0H3keDQ45XzbCo=;
        b=BxptJ1uJH8QFABpkJJeQIXtbMSGTUznXubZp5i1jur8NlhEPoWCc/l/SdYiags8Cjj
         w1vl/l/lbhlXOfchkVA32xTiNMaOwq3SFAsX19KmuJEQZIhzQLOhVnXom5otbfu4jhh/
         DG435RL7h9tjPTecvSQalELy18XRgfLIQTRFpG4GM71jFRN3zwef4XwVUVHpvDz9rjya
         5CLaRDCs+Y/6w6jWFMx0h2NRMHDAexfLRXvfX5V5L3ExrFJ4AOZ12aZT8XUCNULQrIyd
         2rFH1TJi6di5+aIqH1rBd/gzUKkANHuI6adE08+snr5mb4C+8CHZZ0N841gJSbt/2Fbf
         f3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085361; x=1793690161;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uewbo8Z2JjHZoFIUBtycp8zjmlIrt0H3keDQ45XzbCo=;
        b=i+CM2FdepYgnRq0Pdpr5NkFxngr1e0FgChiMZ3gfUptScsI6vRmMxglnlrtYGjuGpk
         9qaVf5oOpZMKpClWZtHYOicyVuzYfR1ssUWs68P55KWn+77fAX3Oi6Dus8GWX+/lbLAs
         wMEZRD96sGWFXSUlKLyQdggchanmCdOuyTl7rTxNBtDf0ckVCOb5xcAibUg4pIfWAhm7
         kPHYONkB7+J8vpO6l5caR+90FkyQDLHDnW3w/mv+lngd+zaa5u0AFcWdvrRsC0drD8jO
         343qSgMzGstjfBp9MJHl1RdVUhaxL5JmXdDkd9mKPCcmeg1C2SHMCVrgV40BErLb7qgj
         vOeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyI+LCR8x6r4MBBvPxqBfMlfQE3/gdbvqsTKYpJsk2CPXeTdkK51+gwCITPsIBp2Ec86+qE9jE5kQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIQ70jgH1vsd85DwfJGmtgOHZAVZinye0iI5ft+RCQaGLsulN0X
	KVH326ulyo9kmzcFbsXAdASZ6WwWIUdFJGNBiQI37wf4m18laarB8vx5Nd/MS/kN1w==
X-Gm-Gg: AYBFou00HY84u2u180eMozUc/dwNVB7XKwQwmxykaHroSCezQUevD9MV14LecmMtF71
	6UN+QV2hAv/HY+kEDnX6AUfZx7WRY/YAxBpBSIhf3SiQDwemq2zzUSzClscThgbKw3gIC5CV6W3
	/nNyQ7TOmHXpiyC580oaJqOfClc4tq2BmmC/sf9Lt19VeCYHkOQrOJ6zTTrhaqgsyLh2l0yzRyj
	Ep8W+X1WkARw1N+QKKI10HPYYDoGGckVj/e+i7GJvIitI1T9CYQxNaYmUhGQ3tfwpkEmB6YkBGj
	Zd/hTcKwdm/xv9KOqlDTXddXLyt2F8hcQMvjIrZKXh6k0cH1pCYQWzRqj5OytMBSRwgVtP0qHkO
	Kj/rWzXOT92MnguS1PP3//ixp5sxv25qEXu/d0S0DZt8u1M/Bz75Mt+N8cUgWlafS9S81KUWAPT
	bGT3mv59Y8aEkoDe5+z7V/gJQ7fQG9RXRkmiDo0PSGG9RdsoUcD+RftAEZcX9RlzJMgVsg/GJNE
	tS51jPFcwrsYtooF5bt4wNuw6SJyj6GaWkcx2+kdWdjkUOF/oD7kgDnK02uq/GdRSfnEhzuHl+Z
	1BwrcpVpMOkB4vpB78GHez4aKbO64RpZCFBcfFIZygk=
X-Received: by 2002:a05:600c:4f55:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a35ac9a6d5mr185685095e9.8.1793085361241;
        Tue, 27 Oct 2026 00:16:01 -0700 (PDT)
Message-ID: <9c9bf7aa-1c8b-42ab-85c7-ad87464d3cb4@suse.com>
Date: Tue, 27 Oct 2026 08:16:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/page_alloc: scrub each page in
 unprepare_staticmem_pages
To: peter kang <peter.kang@boeing.com>
Cc: anderson.choi@boeing.com, matthew.l.weber3@boeing.com,
 joshua.c.whitehead@boeing.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d58a2eb5897a14d7312629b59fdb6b4bd2e48a64.1793074467.git.peter.kang@boeing.com>
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
In-Reply-To: <d58a2eb5897a14d7312629b59fdb6b4bd2e48a64.1793074467.git.peter.kang@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793085361-BDCC7034-421FE9BF/10/78276251493
X-purgate-type: spam
X-purgate-size: 901
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 05:25, peter kang wrote:
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
> Signed-off-by: Peter Kang <peter.kang@boeing.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


