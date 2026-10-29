Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E3D606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bUNUcCuq
Received: from list by lists.xenproject.org with outflank-mailman.1464967.1675888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMT4v-000685-OQ; Thu, 29 Oct 2026 16:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464967.1675888; Thu, 29 Oct 2026 16:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMT4v-00067y-Ll; Thu, 29 Oct 2026 16:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1464967;
 Thu, 29 Oct 2026 16:34:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMT4u-00067n-3r
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:34:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMT4t-00Gi3Z-D2
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 17:34:11 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3757d-2eae-0a2a0a5409dd-0a2a450abbe4-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 17:34:11 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae37582-f2d2-0a2a450a0019-d155802dd43c-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 17:34:10 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so15883765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 09:34:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6df1e543sm237344f8f.4.2026.10.29.09.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 09:33:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1793291650; x=1793896450; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0N+6yqUkoBetmn/N10FAiKXysuT5QJyGT63Uo4upcZo=;
        b=bUNUcCuq9ugQ0fFd4pfpiHnMNaNJbzRbB1tkTNd/VU1Qbd3sVu8yOmNgLX1KNJiGhY
         C8jLGPjgbWlN0AHPpmAoz4t68wQEdybQKzXvpEWvTG3KBheprNOdvyMSiiXCz8NaXS7T
         2jtSyqGStUHl0itFIsntfrjCFHigpyFXHy5HLZjvPPoKZlsmDZ+DDR8rPL9h9CFlMGUq
         GSs2ZDXEru0jRSv8RfLJobjdF+XJ9L3mQjCYwIpUSgHQshGJc2B0jQFxxdn+yy2DfId6
         nBNqVlBON+SXay9ZV6sOJN/TnBJR+i06RjVQYLDFzuGmSjkwTThqbCwgw8XuVyKsRqgs
         TaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291650; x=1793896450;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0N+6yqUkoBetmn/N10FAiKXysuT5QJyGT63Uo4upcZo=;
        b=CzvuFwDYuOzei/vCCoFWYw5XdUjdt/IgfCZh/UCX40+E+cDYgp6H3hioIbQioH2L7Q
         b0Kf+IPv+MHFKiLfOCNlB0DjwOHcLT4+o5KMpcu3jzs7ASwnBnUdL4xv3WbKoEshlCH3
         9OBg/fAhpozri2rPkYXcIw2/84tiD7mf5arXtQaMLS4kNtkXDL5NqHoJV766862vJIfQ
         VFIMtEeW2NO2V2+F6xiiey+fZCiJ5vu8fE/E39kA0i8WhJ+2J28uXH6tfaNUcokVYZIj
         WSEAmAXqSBfgYT9kk+F4q5mrAIxD6bpI05LIACd/XRjpP/X/PrOnw6pfC9buAwc+rYN4
         OD6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx47CJGBGlUy3AvgbapzQ96P7PfN1LVFosH3RVGgNlfFleLUhpxZntLwp/r98xTkwFy12lpniK0YpE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJrIMT/pCxLH3GjwdEBCq+d68FdYsJVAoUviTV9rsBUMIKOl4HM
	8yk+Vd0zlA+4FZS3Pjr4Pmuu2gljtVQnbLpn+4IMbrKJv+uSQvLYv51kZKa6u7PS9A==
X-Gm-Gg: AYBFou1xrMnA9sd4q6u7oLNFz8gXxIwitMHOPxfsi4HuZ4WTE7wHIsJkDymkRYw2oXy
	IeDn3Sh63+IW68tpp1PXS2VcP3F5oTlY2In5o4gXrF2Ei4zlp1zS0ujy9Buv+Uk7YKj0OKmWbZ0
	ozCCbb1y+sV1+Uy7hPEyo/Nc097yCbqtztJSanKT0/xJjdcoImlrzxZxvBPd7xuLQQ3/WqQ7wOA
	xQlr1xsVBAiItoOcaUZif3SEvWyVQx9M0mecaPDfFAqUSt++gzWuhTkhfQwPbe+9G+h6DcGvN7N
	/E8PtvfBwCOgwy/w1s3JPGrWRpB0Bh2ThaRlhQrcrXDUcA2TQUVUiNKgAMAqqp2oqDWHwC7uK6+
	hvNxffCYo3kUlKDsmqE3sTTWCmyNBDOyUL8jBPJSW2F7shoeujB/kO6zCdqAIPP68jKieOsedzV
	OPj/RWgHypxXv0d1swGZhfQ79PcoP9Owp9x+zw6lPUeSkYyQfvT7QA+414ZduWOGLKqzBdDi1ZY
	JCtXnrnHMMCE6UDiKp2wHie9FLNNkmaBXN3Pe3zdepLLXFMfCf2uJoq5NOiMWLo7drbbqHDzJ1K
	1CRZ3gNL+Zf2fnN8DWfshyexR5vMeA/JK2x3qCRdlxjqYUQILzgDja6OoROdN0FQqnBu/iiZC7L
	ylu/HmjwMWFR4+HoZ
X-Received: by 2002:a05:600c:b8a:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4a9672f91d2mr137255995e9.30.1793291650355;
        Thu, 29 Oct 2026 09:34:10 -0700 (PDT)
Message-ID: <db462f54-f116-4b11-9d00-de0441fbb948@suse.com>
Date: Thu, 29 Oct 2026 17:33:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: shrink (pack) struct periodic_time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9bb9cf4-9171-402c-b6d7-14ba45618c6b@suse.com>
 <be21b731-f903-4334-95bd-99128a560d08@citrix.com>
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
In-Reply-To: <be21b731-f903-4334-95bd-99128a560d08@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793291650-510C9CFC-223172DF/10/78276251493
X-purgate-type: spam
X-purgate-size: 1580
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 17:23, Andrew Cooper wrote:
> On 29/10/2026 1:56 pm, Jan Beulich wrote:
>> Except for warned_timeout_too_short, which is used with
>> test_and_set_bool(), the booleans there don't need to occupy entire bytes.
>> With them converted to bitfields, pending_intr_nr can move up into the
>> vacated 4-byte slot.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> test_and_?_bool() are a source of multiple problems, not least because
> they have no business living in xen/types.h
> 
> Next, most users of them really ought to be using the bit forms, not the
> whole boolean form.
> 
> Next next, this particular warned_timeout_too_short has no business
> being an atomic at all.  It's a printk_once() in disguise.  Worse, it's
> a gdprink() so we're doing this atomic work for a no-op in release
> builds.  Also the debug message is tantamount to useless as it fails to
> identify the domain/vcpu which produced the overly short period.
> 
> 
> At a minimum, I think you ought to convert warned_timeout_too_short to
> be like the rest, rather than leaving it like this.  Or remove it; I
> really do question its utility.
> 
> But, if you were to expand the test_and_?_bool() macros to finally
> remove them from the code base, leaving behind just the xchg
> expressions, that would also be very much appreciated.

A lot of largely orthogonal (to this patch) work, which may indeed want
doing, yet surely not right here. There's no problem at all for someone
to do that work on top of this change, assuming it may go in.

Jan

