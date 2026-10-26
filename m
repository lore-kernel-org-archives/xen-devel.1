Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD75606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Al5cAL/H
Received: from list by lists.xenproject.org with outflank-mailman.1461608.1672656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNrJ-0002zd-Bf; Mon, 26 Oct 2026 16:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461608.1672656; Mon, 26 Oct 2026 16:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNrJ-0002zW-93; Mon, 26 Oct 2026 16:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1461608;
 Mon, 26 Oct 2026 16:47:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLNrI-0002zQ-Ia
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:47:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLNrH-007lt5-VN
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:47:39 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf8419-e002-0a2a0a5209dd-0a2a4507d02e-26
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:47:39 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf842b-b4ea-0a2a45070019-d155dd31c890-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:47:39 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so1918546f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 09:47:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb902sm18257927f8f.24.2026.10.26.09.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 09:47:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1793033259; x=1793638059; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAf5uxPV3dqLf1y5npVN1ioosjLkGMccQTf7bTfhxSI=;
        b=Al5cAL/H+XiVnYWAs5XxiwuawgX5QG7gMmeFSD505ptcJl+uXJ8QF7lthSfKwGFDQf
         TDtCVqaszyLtWxk8aVO8O7Ws+ySgVeFAPW0NW8rYS6xp02CpGQkQoghkzKlqiuDJca68
         DMYvs3qhl3GcPYoOjfXPDdbvDwvuled5UA/cVEQlSHX68ltrvcNRdDFY+gvo/HL6kdKW
         YzoZoIXgApOK+SsTLgRAwGbywRmpBOHBKKhMMtXqGC6o1Mr7JRn+DAa3FB0w8S3DeY4X
         yKueV0/K0YMtL9/fWjWHWPp/RujnjsgV0LqRbqAX2VdU/OLRO7pW/oRwY7xRSiDIhjqI
         ry5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033259; x=1793638059;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAf5uxPV3dqLf1y5npVN1ioosjLkGMccQTf7bTfhxSI=;
        b=XLe/0B3uMEEEd8AOLh6UmXvimvY+nKKQojB5/fl/KrSi/9FSRt9HX/rqBOtoYvpiTO
         1TVJcc8Gr+WJnDlp+kpOMpJolSHpTTgeHMfNFsO5QJYsuf1+iS2gdyWzYdkkH1D1Px0y
         2aa5PElCawKSq32zWfgmN2hYjl9ysm7FdOLfdncL1A39nb+1J2TsePuJehE6hUBOAAZE
         l9NKlLz9LPqd27YDcEhmmnipIc4xL63Vz74oH29a2wbBIyUmD/AcOPUTD7uIWHrhuB7L
         dxZZJjRLHIpNJ2Yf+HXPsy/SjqwqJZrrPQAViUWXurWmv6bslt5rDUhb4sXogYV1hla+
         XKdw==
X-Forwarded-Encrypted: i=1; AKwUvBzd2oge9XLAss/Wmdz6/lWj6I/4GqyE0En3yq2bDZPuUZsROksJbGW1jxck6zoYSNI0yeALUXv+png=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK03kaM7xDszfwy3lGoXD5QkL6XV11SbhsnWph03O7DclTtjwqK
	sLUC+4RfHeWcIf0co6iTR3s3SjMOk9F42HkBCzxSMgTk8hNVhgOVuIFBY+AxLPW17JXdLOUXF0k
	FNzqfsg==
X-Gm-Gg: AYBFou39kncfBmr7WGqdRO4Slvs/A6nPXyjA99XRan75ATujyDZkgjDMkY/Trj8xBBW
	T60C4iiPJr3i+1WMOhl37nRB9Kt8tqD3d+al7xkIYl4OhuWydNB5izKtxaUwiWJd3SpDlVsAssd
	okpylO63Y0UaVU7TtWKAy3jBHQXqVQPLVGdDUQ9M+yALHTbREmxGdkxOjW4stnIPSB35xLKXt0Z
	u1+UUuuqVTD7SCz5Vq+ks9JxpI8u3CJHU3KaWBYQz3Mn/3BP84zzCJFBOya3eTmefTLtSZ+Mgf1
	7hiALV/F3qGUKaTj70dA7yVp3CQhrB4TUyQ/eP/abe0pbG3JpeM0AGO5Dd+0KmZVzyeKnivLDs8
	JsliW9RkQ7JmPrt8kSYtTxSX44qnEcwusRUyeglefbnm6pKuSeIeEmbdTS5FoocrYstyucZh4zT
	ZlbICQqOsVR5uwJcyNfFB8jrw1tjJkoEBe5fj7i/yMwBRQH/6GlIQud6pBrFdCJyIero69gYmqD
	h7CZ8ucgpjptNWgnww3FUvCjoIXgffoixHspe068ohl5APAxZvhJ1eAWxarcIbyR2r0c83vpOzo
	2q69wF8eX5udKeo/LYbeUHNJuGGwHLvrlvSPre07A4w=
X-Received: by 2002:a05:6000:612:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-48e3eba5700mr13927070f8f.50.1793033259069;
        Mon, 26 Oct 2026 09:47:39 -0700 (PDT)
Message-ID: <21702cbe-7506-4b2c-a0e9-80d9fabb33c8@suse.com>
Date: Mon, 26 Oct 2026 17:47:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nestedhvm: Inline nestedhvm_vcpu_in_guestmode()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793029157.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f@vates.tech>
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
In-Reply-To: <1793029157.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793033259-A5CC7AE4-363BC314/10/78276251493
X-purgate-type: spam
X-purgate-size: 259
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 16:38, Teddy Astie wrote:
> This function just returns vcpu_nestedhvm(v).nv_guestmode and would
> be better inlined to improve codegen.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


