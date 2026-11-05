Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5FC606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lx604v99
Received: from list by lists.xenproject.org with outflank-mailman.1474207.1681394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsqF-00029a-Rq; Thu, 05 Nov 2026 08:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474207.1681394; Thu, 05 Nov 2026 08:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsqF-00029R-NP; Thu, 05 Nov 2026 08:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1474207;
 Thu, 05 Nov 2026 08:29:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsqE-00029C-Sq
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:29:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsqE-00GxHG-9f
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:29:02 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3e3b-bab6-0a2a0a5309dd-0a2a4502ee3e-28
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:28:58 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3e4a-6ca4-0a2a45020019-d1558035e53b-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:28:58 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso10493465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:28:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed084f92sm8655845f8f.29.2026.11.05.00.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:28:57 -0800 (PST)
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
        d=suse.com; s=google; t=1793867338; x=1794472138; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2xK568DGrbnDDLTLSdZsVg+YUptHoc1iHIVKcxqDR4=;
        b=Lx604v99SzyxghM6noi6h62OeeXGgTmnWuyc3wSnrNZkYMbXmp8InI1m2sC+cLeTvq
         MjZqe1l6T6LEBgPpCEpOwaljIxY/TqZla6IAQ/sIXNtMUofiyrPzU++/MzT1+T/IopuQ
         f2mnzuPn1NmRiR3/Id7civ/ZjsAceEHsJCNi9VegfbT+ePwq4LHGYr5keBvgmb2MD++x
         HDKfbgIZkyrcojZXwRaBDFg/6Qm5sWV+NUR5i0UlyjekK1BLvw0xiHs8xYcaKJpMCNf5
         xWeMBmVcS4NYty6zkCrey3ny3jMnrRLMeMg8XBxSFijIguz3MWMfM35ULXhbKvjtVT8D
         f8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867338; x=1794472138;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2xK568DGrbnDDLTLSdZsVg+YUptHoc1iHIVKcxqDR4=;
        b=Tg+7IF7s84N/3MqqwhK1/NaHI2CR1UwAd0v9vKFTWPTaSsVUGypJfENXp54q+W5kgc
         1K6MUp9SP8JekPWK9KnGhxZi0finZ810SqREqwhjhtfNmcoY0uuC5Q9i5oI089IhTXZ0
         ZvGH273iw/5tkofEGfhsNX9OqaSFqXu9pghjvSEbt28B8kVsZDR1zxUr/H6CtG6vP8ol
         MoBy3ADyu0M0O9l0PGi8x/E9zIJy5jlg0/1nryD1Dz9o1ScWsaratDO8ewfs8siNhz6O
         jn0VMLgnQbMsqmNDPw932kT9TQaqkeHImTrIO6x39EGxiK1gyewguemh3NVDST50w+dG
         U7rQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9P8rAzV6sYDhUDeuL+P2e8+LS8xyb8gPxj/6cg/ETMJE6RaU3ihyVdB3+34C8l8BBYBjmKzQ9uMs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/T2L3QKxgO7f2Bl40PoEeln4t3QDpRCkDOP4QpX1QDbuNDDxYh
	DjYpP4CK+6snxSeKlg6tsIh8D69VMTM+KG8YZ4zzIgyuwhjOnHBxv9vJ4uk7Mo9rYATvmzNrAQV
	AtMymRQ==
X-Gm-Gg: AYBFou16Kdtw5oi5S5YTMYNnsn5COZKfnPRrMxpe1ruwBt6KThXPuCvaIIE0f5deWvS
	AP2VwLRNOzb0BCT+Ww/mNNQW5XgjasiXQz5NOQMaa1ipNKd6HPo3XCwKZj5KTLTn5ZfLYpbDzIP
	6DAOaiMrUhBINeH42TCMC+RoQDeEuKnBlsm4GyqtkaWWTfn58XVAdb9tkUZO4VDnYWYklVHrXz6
	GbwxMhPtN203mTQUPsMGi3ZXODauW2c+ssvu7QN1iaSBovUq01dZrwkU9fyRasPyZBlTYwl1t2N
	Dac52o5i9Orv8hza1ZOpluzPnhKvZwHVRNNCZkbbLKqqEO4zUuSbuH6OFxmdaELOJmvxmSGhSF1
	XfXUKNw/Prf2LtKlSf8EkGeemmcxRefM8O2MnqSooc56I3F0PfdzEAcYMdxXYdiyLFxAbuhyDyo
	wrqvulQiHxZmD7VLKevB9A+bpP3B/eoIv+uy7o2x1SBS6yfgXuJRooeIJSganocOKvYWpmVL1nj
	lEMyflTd7HAPhA+d9ABZ75zPHMyAP/y758kC9gaKfXFkpIoDvqNjTRTK1A9g1m444rU1ArjxCjI
	dP+BrtxffI8bEJV+yGtMsA7CxEFiBcpIgvzmGTK8jB05G2xrlPoQuHbKQnHlVum1wpN/JjwXNDc
	Y5/ePK5D9ewfuFOo=
X-Received: by 2002:a05:600c:6215:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ac17a366c0mr420550135e9.17.1793867338280;
        Thu, 05 Nov 2026 00:28:58 -0800 (PST)
Message-ID: <62a5225e-8288-45db-aa27-0f0cb969ff18@suse.com>
Date: Thu, 5 Nov 2026 09:28:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/28] x86/time: fix typo s/interruopt/interrupt/
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-14-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-14-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793867338-F38BC2AC-22937EF6/10/78276251493
X-purgate-type: spam
X-purgate-size: 188
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


