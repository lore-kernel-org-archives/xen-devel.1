Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59053606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=REFYXKuP
Received: from list by lists.xenproject.org with outflank-mailman.1493946.1693650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaeq-0005ZA-5R; Wed, 18 Nov 2026 08:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493946.1693650; Wed, 18 Nov 2026 08:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaeq-0005Z3-2Q; Wed, 18 Nov 2026 08:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1493946;
 Wed, 18 Nov 2026 08:04:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTaeo-0005Yv-Ja
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:04:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaen-004X2s-W7
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:04:42 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5c12-2eae-0a2a0a5409dd-0a2a4507930c-44
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:04:41 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5c19-b4ea-0a2a45070019-d155802eb1b4-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:04:41 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so4758785e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:04:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7843bd79sm125637245e9.14.2026.11.18.00.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:04:40 -0800 (PST)
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
        d=suse.com; s=google; t=1794989081; x=1795593881; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUkgpk32RHWgfeQKpPj+o9EFellHOl4gSrDNarR0cyc=;
        b=REFYXKuPxajKdWpMBPvPQre/dDisKfQfLkqbny2iL3dND6UrsDaZ4pQtCzsgQ7i3cg
         inIW2AT+vwDQYMpvQAzSjQlYBcOU7AKvxbCU924ANjfdwQhMnhSSfVuYdmdq6TcTEDiT
         uUGO2KDSru0QMacolmtVLl8pxcV3jvLRKxxPRj39Mb/ri2g8xb1ZEhHJBCkxePou+gFV
         JbnRljBiTxVJll/2xTSfsZ5N8ZxZprWndf4EBp+QI9oiRipI9P1P02i9dK+nQiajhKoB
         lLWKVKY0wA1DZurgyvKAf5aQJoulvs41GPY5AbKQWTyEAz0T6lQ2Kfy/R7waSarMkA4G
         PEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989081; x=1795593881;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUkgpk32RHWgfeQKpPj+o9EFellHOl4gSrDNarR0cyc=;
        b=GbRrnV5rrwo9oBqxyBCRG+wo9KaCU+FOr6fsQ81unKx1H/1mGh69jPYmYO6x2M1D6B
         reeNZ7RA7VDDjSK3P86GruDJoBbsWgNIFpJKUJXe2rdyWhgr0T+MLKwno2eAirVHPtCJ
         9qtJhqSzf2D2WyTMa2nUn6BZYj+y32eqnZxOiTfl1TVDeNvMyIaJfAEDAlK4keLYpaaP
         06mGYPLm6eQHSSnGK0CV1KsaZ/Et5TpNUMTYLBcoGv34wu3v6T7F0pQMKKC8y5kt3sD9
         f+OfI4l4ppCTl2g14bfDfQRQmC1qUn2wPqLcCKbMwN/uEZ5pJxDsiwIx4mq68k/zwQe2
         OTVQ==
X-Forwarded-Encrypted: i=1; AL+hErFrnbrQ4U6WDAxVA4Ea5nXV0Nnb+S33P5Q0mUOb0sAdJ4nI1t0ub3s4b23uJGpXfwCnRcB3dt+LMKs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Pm13IKoXC+2Q5GW9/udvAZd810dKFB42qOJkWGsTYDJQToukV
	shtRNt2GByOU/V6lnbp4OgYw4ObdSQACIIeXx5O9BWy2FvZpKK2V1cQWzeY+7mG1gA==
X-Gm-Gg: AYBFou2qrDGMSP4bey7jsIX1waVUOLG3ACiDTwcIQ5X1YiD5CLgYGLBmbie3WxaF3ov
	xRHrgDMsfgbwZgBCAcrvDP53Qzgnqr8yVFO5U2ZoPtrmUM0b1ZpNAdEjb/LcZuvo9m2lNNUXJKb
	2WM/jXKCJ/Ub/HCfWBZAmVlmtwOfz21PMwGPrt3PlLjfWG+m0HXW13A5sHhBzw4FuhiLc+oabDs
	PKSXQxeCOJXGA4vgHynrGdcEnyEx0PnXnMbHUeWQysj8I9TIxOLPrkTMzH0tEJ/Fgd80lhchbEy
	6PcLLFc5fP/wZTSwM1rU7Wk/dFTcVqucz0nFYco9d6TNjLAC9vEwG1JDgEezK1D7fLc1xtoLtKn
	rtIoX2rKZvDPbxZmPXzpBmr7HwnfAB4X1qrR6ghPkxflEzbobzGD1Yjip9T4B5PTR2EFLzycAF7
	U8l07HPAs5sdvRls8LHuGSuQXS6LsYjjQz3l7Zve7R0EZWeBnaa6goFOaSMBhM755krKOHymnJP
	6R7oBxKKbaDw/I+U5aDYJ7UvOD5UoD/Rbm+tZMj2thOPcwKREtiH/MBA5GCLdRe+eQCbhng+hMK
	48k0zcWsp+aiKmAehgKq+ySWaWZLSd27HlrHG4R/lAvEgJDICPHysOALSHM0qHBk7q0nr6tWFnj
	Pl2FOOyj8quNXXBk6
X-Received: by 2002:a05:600c:4f4f:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4bb7da1274dmr31301665e9.10.1794989081259;
        Wed, 18 Nov 2026 00:04:41 -0800 (PST)
Message-ID: <38f8b411-66a4-4a8a-a89c-a45b238b4bf4@suse.com>
Date: Wed, 18 Nov 2026 09:04:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: note the plan to remove the R2.1 deviation for
 unreferenced functions
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20261117225013.2609286-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261117225013.2609286-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794989081-A54C3AE4-75022614/10/78276251493
X-purgate-type: spam
X-purgate-size: 633
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 23:50, Stefano Stabellini wrote:
> The ECLAIR deviation of MC3A2.R2.1 for functions that are never
> referenced has a one-line justification and no entry in
> docs/misra/deviations.rst. Note that gc-sections support in the Xen
> build is to be improved, so that such functions are discarded from the
> final binary and the deviation can be removed for them, and add the
> matching deviations.rst entry.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
(or maybe rather/also Requested-by:) perhaps with s/improved/introduced/
throughout.

Jan

