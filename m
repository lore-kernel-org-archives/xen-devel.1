Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E03606A32D
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Jx51Co+/
Received: from list by lists.xenproject.org with outflank-mailman.1482112.1685986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpAB-00062r-Vk; Tue, 10 Nov 2026 16:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482112.1685986; Tue, 10 Nov 2026 16:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpAB-00062k-Sw; Tue, 10 Nov 2026 16:57:39 +0000
Received: by outflank-mailman (input) for mailman id 1482112;
 Tue, 10 Nov 2026 16:57:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQpAB-00062Z-2L
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:57:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQpAA-0083xC-8U
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:57:38 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34cf9-bab6-0a2a0a5309dd-0a2a450ac544-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:57:38 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34d01-f2d2-0a2a450a0019-d155802ae936-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:57:37 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so22895015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:57:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c43f4sm7314950f8f.47.2026.11.10.08.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 08:57:36 -0800 (PST)
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
        d=suse.com; s=google; t=1794329857; x=1794934657; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKHqz9qSWxfbS3jbRQXCiirIQjCxiSthCjStzuzyhvo=;
        b=Jx51Co+/KXeLefJo0vC8J+ceUt/gYYp49dOoAq4WPkVLoG4uVRhhnqNC0L+FhU+W9g
         H5egnvewjeq6dXsLSxiFvLxERoSdx5FnA1Ux10god+5h3a5xcEh+l5GxlXLcNIH8iP0+
         I7Wmhe/fTcF8w9IZbJH7VnfV02f5wkZOB2yIIQrcxIsB803sijx3mfi5vRaLC4UuVsCn
         WgPdmXOf1RARDDh4qGWI9UhCA/NYUT+/FwCZEBVev3g+uaKzzSyFAO76EyqbFpykZX8e
         6/Kt24u6PgxGjAqIPXPtUxSeD1yqYbS2HX1sEBpmKyuUDECuGqGfD2/PiReXiFMOETTX
         FVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329857; x=1794934657;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKHqz9qSWxfbS3jbRQXCiirIQjCxiSthCjStzuzyhvo=;
        b=PfJeNKfM6C6KbIhX2nuyiVO7lXuJM/nxMALwK50fiZIK3hCRRGke06X559kU2khI4f
         i943NdlCcoH7sQwrO/2RBzK2OW8vcWysPt8OTWcrEt+XVcG9mDxIybXFMXa2YUKbP+bh
         sTfk2akE4uJX9AKtHOyiu9XQU5yNTNeKVFiyziV1HWNv4Jja9Dnldd6qLEI8mDkFc2BT
         5LdY5LdKpHXQsK93b3c4CkFydlgtO6v5RUyRt3I4TDNyO+8vjS58Zlsj16NDyJOeDWA6
         CjpD2DjoXQwCAtfrgJC5BRoxdDmAFyVnUHriySNhwDj5DscPzgIi2vv6a490J1zjW9/i
         5s1w==
X-Forwarded-Encrypted: i=1; AL+hErFOjolt18Oha1sznYxIvo0iugG2qllc7x2+WYRuGp61mXna4lQj/6KDDt+4loWIgm7+MRpQa/AgJzg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/aZxwVuYnZXIuitDayZ1LV9BR+vm4k/PGAkuoddtdG8mc6s8qE
	0fDY8Ilg//SAPy/GqKHiq4ymauS2Iv6KqxVp5gMKVZCx8gSCzjTaknCU57lxxuKc4g==
X-Gm-Gg: AYBFou3IHF6u855ZpNVRdCWhuY2ozvFwST4Ok4Td4P1iHuSghjl147LZCizeC1u8zrX
	SqVbxpUoXAzGIsIdYpvC2CoYJzsq2x6Y2N/b85L/8K8rRhZGbVZtNunBG2mOT1K1ByhZyd0yhuX
	RN3U0s4FQwUPQi6Eoe7NtXxSXpE2oXLoxVNMdRimoAwlDPYXz++d1cUpNEh299pVYHbY2UiJ9iv
	2Eu2f/jKSncZY1QzEWLjFyemdUS0MQ20WY2O8pV/+MDYTe6iB88mlB00R1k/0SvtHu3W/Q1fHvq
	7uo6JlpRcQQRlwri6swo0datQQRi9RxXvViLAilcftuSLYFUw8s/lTX65xlPmZ+z6dEQqSCbfAm
	1SDPAQyqULTH/xjC/SmjN9ZL/rBFQ8v8HdZzxYLDXca9JQDZmrMCi0j6w+7OvSLJg3h0csbx2xv
	JsfoFXbvCGbT01Y42iQCHYdmLSbMLd57a85HtWKXk+DUoRa+pzhtyzJ+KO6U8S0UpOu3A77qM94
	11z5lD+fvoswBWjmVoaK8ADMRbnaq5fzD9S8fc1lIkHm8GsHjXOfSSrxFADf6bG1aIPBR/J1ig8
	f0cy431cVOGE5qwoBSTUIKdXUzeVLLNoKn+hQjRlgf3Q1jngfQDs1GieZFiC34CyjLXY/i70u1m
	gjXxWqcqezDYz75/c
X-Received: by 2002:a05:600c:310e:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4ba023456eemr56554605e9.15.1794329857473;
        Tue, 10 Nov 2026 08:57:37 -0800 (PST)
Message-ID: <640287c9-0747-4f2e-9708-476c35340aec@suse.com>
Date: Tue, 10 Nov 2026 17:57:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gnttab: Properly drop page ref on a
 GNTTAB_cache_flush error path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261110164816.3163420-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261110164816.3163420-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794329858-508CDCFC-3A5E1849/10/78276251493
X-purgate-type: spam
X-purgate-size: 1068
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 17:48, Andrew Cooper wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> This patch was XSA-520 in Xen 4.20 and earlier, as it affected security
> supported x86 cases.
> 
> In Xen 4.21 and later, the hypercall is only available to ARM.  Nevertheless,
> there are two identified cases (STATIC_MEM and the xentrace buffers) on ARM
> where system domains own memory, and need this error path.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

And I will want to include this in my next stable backport run, planned
for tomorrow (if internet availability permits). Therefore if you don't
get to committing this tonight, I may take the liberty of including it
(about) first thing tomorrow morning.

Jan

