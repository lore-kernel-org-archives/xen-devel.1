Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D40606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P0/F0cz5
Received: from list by lists.xenproject.org with outflank-mailman.1494052.1693732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbNw-0000lR-4a; Wed, 18 Nov 2026 08:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494052.1693732; Wed, 18 Nov 2026 08:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbNw-0000lK-17; Wed, 18 Nov 2026 08:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1494052;
 Wed, 18 Nov 2026 08:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbNv-0000lE-4L
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbNu-00Exf4-8C
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:51:18 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd66fe-e002-0a2a0a5209dd-0a2a4502ab98-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:51:18 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd6705-4900-0a2a45020019-d155802ad195-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:51:17 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so7217155e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:51:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7ad9430asm119371005e9.15.2026.11.18.00.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:51:16 -0800 (PST)
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
        d=suse.com; s=google; t=1794991877; x=1795596677; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5WkvQpSga9kVAKnpdysVfA7UsDn90krRUUTlyneiAk=;
        b=P0/F0cz5uPAh4V7y5ISo7kmS4zg0M6whlu00tZbd3uo3BMvO+COxpkVgPZnubtHQ4Z
         PEQBtwEJ4Zlx93Xp82CnrYK7T8r23pfjOHFxfXi+16XTa6jKFlk/QrA3jcbROdhn8mCb
         53Rk2pOi8/SMEdgW+7PWF06SVC8HWu4gDdSVByGbk8s1DFGXjiK8roPNmFHTIktPy7nw
         zummMNMl+8jpLapl2eb1yrUEfuWUluIXnVIbI1YRT+WGDqXJaw18AOHXKZHHKDORz9Tb
         Pesgp9P5OSc7mwgxPTTq1EwhE0cTLqgpxNZ2L1V0Xe/xJz75djznPA4Dbnf0KUaqlnpt
         asOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991877; x=1795596677;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5WkvQpSga9kVAKnpdysVfA7UsDn90krRUUTlyneiAk=;
        b=jLzWh2ubjceTqr5cG1S1fePKMURpx9D7iSQQNM/oDrmgtvtuaAjlb3BRfZ9toYcO05
         5JQBv2iKiFPoeWuRD6gf41C28eVXQfuwfbfYzts5cDoTKnCxN5A8cie+OvqyyU6gQSjD
         TY1eQEBxp/kT3H7fTJ9u+o/QAALj/mchFB7NfmNtzQNK2/0OgCA11ktqZNPMYB026mOY
         Vod6ioqEilIfaKBWkNd09c8mjBNeSoLCjc1ymHX1oZYzNiMl+izO17JOj6dXjrnUcjQ+
         6PXkAcmocniyaRNDyuKZv0m5s0zIMiQQ4iA/iclZkp1CJDGoDCCBOjOJkJL9QEBZtGMs
         T2Zw==
X-Forwarded-Encrypted: i=1; AL+hErFzH0CmBdk2fFu/ashDzrvI2xODQOdsnep4gNCupQ1b0cXT+P/dwTgLAgLhGsw5hD1RYPALL3wireA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8dw77LQDzzcALIrwun+cS4mO5uqoYRZg/exJhRI3L3jk79mIGd
	4HQNs5rmr5TjIR2Lwl00TNrypZI9LhlZTOLBnHTQJO72NayMCN0t9FP5fOggR2bNBfAQvjR9eM4
	MyyiMRA==
X-Gm-Gg: AYBFou2nBYBddMim+dkPqp8K5KElfpHaCtRGSON4CsXiaSQFiQQJQdHLaInSNhhh6Ln
	YTvqjmX5Y32MwfqOMJq0Tbdjah3a9ERysKK7FMjOvHje0GE6CVPl9+xACi/ksLE894qIEwpDDGt
	nGxcrLvEAwi+bmfD91uOwVrX7IgMVM2A7Ph1zFY+cpyx1lmxI5anRZ4E0nj5BG0dZBUYiwc9M8/
	hNfj1ZKPpKieRdPuYK7AkF0OsJHCvXqFqQG5I98PC2E54PNXjrlkdZ4enGskThYvs4acGzl9i9D
	CJSdN0k+W6fidS6aekrg5u6efF7idaKyvwVZbAfQ+ZHsNuNUD8442MZ9XM6aUBRB4EKLlfH2D1H
	xVBqHLY4I6mmId8KMekQuWe1VBq+Uu8FdvabOqkgfCRkwYPuHWkKP4fFmfYqYqB/YdHxa4L9voO
	MZ8laRBqfTEaiU2SP50kH8u/SAP+idVD6I6wKocSsf3TLDe+oc30pI7wZP5+61aWcNCV201gETY
	CoE0KnnrdZUSZEaAjzESuMxY/bv98/Nd4P8DbECm+5vmTGe4SWVNEcjykr44VgGO0ZMkdSc4V9O
	zavfZO77hpFtSjPY+ggAx2Cu1WYH0wf/9OpHvQwrODOohvqAasksVQ71mKzFiWy+69DAN3CbBcv
	XAoB+18HE1K/irP1Q
X-Received: by 2002:a05:600c:4e56:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb7da3003emr32741805e9.22.1794991876922;
        Wed, 18 Nov 2026 00:51:16 -0800 (PST)
Message-ID: <488b0f8f-c62e-4de7-bf1c-ae5fdaa75a5a@suse.com>
Date: Wed, 18 Nov 2026 09:51:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
 <20261117202244.4054656-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261117202244.4054656-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794991877-F198E6C6-6CE3AF7B/10/78276251493
X-purgate-type: spam
X-purgate-size: 273
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 21:22, Andrew Cooper wrote:
> Broken out of the subsequent change for legibility reasons.  It will be used
> to replace xen_build_id_check().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


