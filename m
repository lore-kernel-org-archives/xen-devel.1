Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CA606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KeA1fNoJ
Received: from list by lists.xenproject.org with outflank-mailman.1460889.1671759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGai-0002iC-5h; Mon, 26 Oct 2026 09:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460889.1671759; Mon, 26 Oct 2026 09:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGai-0002i5-2a; Mon, 26 Oct 2026 09:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1460889;
 Mon, 26 Oct 2026 09:02:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLGag-0002hz-P2
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:02:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGaf-00DHMm-Ma
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:02:01 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1702-2eae-0a2a0a5409dd-0a2a45088264-16
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:02:01 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1709-f659-0a2a45080019-d1558031cdd2-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:02:01 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso27875975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:02:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd39a9sm15397193f8f.46.2026.10.26.02.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:02:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1793005321; x=1793610121; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oi5FAnr/gjjQLIwAVs9y0r51/dbuSsrtiocWI+nOvN0=;
        b=KeA1fNoJ0e9pRnDaiUr62AhdzqM8XsiN8e8go0OwsZY3NQa6glZAhWxmTHdzM4r3Vn
         qQXGI4CdomkbxN4t1D/znxgt6CqtZRWmYavlEfbamhJMMDhWwbbsDyhzifpLtSbDx3lB
         OU0AliAeT4LOHIpuF2qPxj8INEwe0XjdR9UMiARKuvb6unp1849pgNYxr5hYHZukli+K
         PHXnp4xtwIwMgoOKrxZgJWINPJuimaZgebwniJaZlKzh4T3g5zpxT0sIxnOhddIiRKY8
         cLfPdhBYinIR5zWSiNmcQQcuvxPPokl06jwrnhtnPqYqIPL88yBiojgtW2I9vojFpxF9
         tMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005321; x=1793610121;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oi5FAnr/gjjQLIwAVs9y0r51/dbuSsrtiocWI+nOvN0=;
        b=BztQ3L7M7CMYIfX6AEKvj1eNkxjKlgzJMxDnl7AF1E7gHTJufHxfcZghAMOZsvH5p4
         YScj2UvJEevPy90WWlYdmShufxuM+hXpfssHNww/Aj54uiMwiloUznOiMx8li02GTCbr
         pDHdmXGyi6qXD9nZx6sYOthiFgE0Dgc/bfD1iqKOyKeDpOZre5vBFxX/kE41RpSXZP4M
         odTXEGPs8UqeLkU5KALrW7PpAO/V08qaP0fVmARD40YHoQUXSnTUDP24QAty1noMcxgq
         vbkuDaDwByh+Uq9YuzKlQ/eBf9pbfGxNMPaAYHnF/3MFtYgoy9KVOIPHZKcJB75bmGWg
         KyFg==
X-Forwarded-Encrypted: i=1; AKwUvByF3+QPBHHYjs0qNt8f0I+CIeS5Ov1NtB845QXNBBBTfAbH0ass51chO68N+XUB+SD7T68Z+K7FbwY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI9WICOpWcLbqU/Bfhnx+zM2f3PH8iNLt+BLkQCVyw8+U22PJF6
	30bqAgVxPa0snNaaL+W1EJHjPxdyvUlUELimGHsxpdieDR5pgg8NcZoofEtQPtLx8g==
X-Gm-Gg: AYBFou3kChX1ZsPhipJflQ2dsf/IlAiVvyOgr2cwHQs0r382h4j38+QyCzQLtYEDHOl
	kw5sK5ds0A+QOOBvMRcLrR+hmJruL/xAgHdMbVeh3uaereAbdqKc9BK/z8LqVaVNm6PUuesaFK3
	r1SP3IaSgPSHshpLjTe+HCt+pTCXcDucDRkswDTxH/g9BqVe/iSru4RRNcs+aGzqVrWzOA4n8xs
	2l1+p0NeQjbh9iTdt148PtJ6ZhRzYga+O0X8Ic/xo+7UOhaiz3D5YH/P41c2kdScPExqYVB630H
	etc5DzgZPLOfhLReLr9OogiPc7FIid0kPRjPpYZoR5hZXe4G0JunUxWCljZJrULXr4b+zpVNIc5
	Rmao8qMAtLpjZbbFggU1H69vfRQpDamCKqzqj3/0FTmfQZR85rMFKYfI3vEMIGk4HKw2hJjj5lB
	kbOWIphTsYFVs+FprOdjsYWmJ7wYlKeZL0Ao5D1CaMy9TQART5tn0ljjXrqKTCKJE9ShYkoDwj3
	63Sjlx9mjTcPtnfhGJ2jlBU3HfrnDwDaK70OLWIRMir8Ceplioby3wTYeRghquBuc9ENbpcfQcN
	8KdGUezRVsn/N2AVGra7lCEN/lm/IqjziURFlsKBorGN
X-Received: by 2002:a05:600c:83c7:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4a35aca5824mr105924985e9.21.1793005320840;
        Mon, 26 Oct 2026 02:02:00 -0700 (PDT)
Message-ID: <a7d5134b-aa9a-4f30-a58c-939f5cb7443b@suse.com>
Date: Mon, 26 Oct 2026 10:01:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] make: add use of $(realpath ) in top and main
 Rules.mk files
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1792436534.git.ehem+xen@m5p.com>
 <0b38e7ba64831575c2f2533c69e00da79c4bc958.1792436534.git.ehem+xen@m5p.com>
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
In-Reply-To: <0b38e7ba64831575c2f2533c69e00da79c4bc958.1792436534.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793005321-CF55C87B-789035C8/10/78276251493
X-purgate-type: spam
X-purgate-size: 350
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 21:02, Elliott Mitchell wrote:
> Date: Sat, 17 Oct 2026 12:25:36 -0700
> 
> Without this "/.." tend to accumulate in $(XEN_ROOT) and eventually
> things start breaking.

"breaking" as in what exactly happening?

Jan

>  Address this before something subtlely breaks.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

