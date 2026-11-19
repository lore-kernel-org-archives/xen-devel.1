Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E7D606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VgXA8yeM
Received: from list by lists.xenproject.org with outflank-mailman.1495874.1694584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwnI-000805-Og; Thu, 19 Nov 2026 07:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495874.1694584; Thu, 19 Nov 2026 07:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwnI-0007zy-L8; Thu, 19 Nov 2026 07:42:56 +0000
Received: by outflank-mailman (input) for mailman id 1495874;
 Thu, 19 Nov 2026 07:42:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTwnH-0007zs-7S
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:42:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTwnG-005zzk-6W
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 08:42:54 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afea879-e002-0a2a0a5209dd-0a2a450ba650-26
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:42:53 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afea87d-b7e8-0a2a450b0019-d1558032a570-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:42:53 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so7436655e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 23:42:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm25037485e9.13.2026.11.18.23.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 23:42:52 -0800 (PST)
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
        d=suse.com; s=google; t=1795074173; x=1795678973; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkTVlyhS3WBM5IKgUirstvW8+CuZXNhhnXcIew7fxGo=;
        b=VgXA8yeMijHVqGueWOomLHFdvHNlQCDpO0jKKVmuHNCj17G2Kzbw9kb2n1Gayy67Oo
         34c2aQbBe4osLfgddoMIC3uBQGy6ax/5kC2sp6RKxdKzc0s5yOMW1yIezCyR2sk+WhEL
         6Ksy0WyGDXA0Md6N7Kbhgy8wuMmMn4QmuxB4D7SCBE/94LYO3/1Fs9LtzwM5e0us1Y2f
         YRbQBWw5iV9hOzxbKplqbMrjyl0PAialcez8aeveptePSXzfc6I1M76fv2T0bRHtrrGM
         G+g+Po7SyHdqYjmrAtJs8YPtGxDH/bjwNb7AaC+JzI5QhQvYS6jFulNoke4K8fwtAsiY
         QgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074173; x=1795678973;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkTVlyhS3WBM5IKgUirstvW8+CuZXNhhnXcIew7fxGo=;
        b=FeXc3fqBZnOL/UXm1cXdGBhedRdsrEE192IwrHsWogVwfnUO1POPOZH60GZF5TLiFA
         3a9jsgmLxTpJdv5+HgKjrQWgVJ1gQjyDHV7TbLTK7PAnOGqv7iuZbTFg8HxNUjlBjehW
         z9xsl4RBCxTtljKjxDJpc2P0n28BiZiAV4kK8ukeiSFD4zY+A/BiU3F+E2oBOwmIJVQP
         lcVjZQb12aIOeeDZv9wLTJ0fRn3F1JjTbdZn/NWr/ZxkBhxb0ZY1m6F9QM97pVWPa6Sp
         dT9SBa1121p5HcYepHxF6d9yn7OJ8A3mNNAd5oucTm6n9rOK1ZzkQNGPgoDRnQUnkVv3
         y/Dw==
X-Forwarded-Encrypted: i=1; AL+hErEP2dG9ejlwBktu8lStwUE/qK6+6N9BlbCQ/o78hVYjod5wfdr6D6ch6kkFvSpn5Cmd1k7aLO2TzQ4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/lZ4D4MLfeW4Ta3iI2+Us5DMCJyfCINMDlXxkujM0F6+kFI793
	LBxML7cZ+SZI5HmSQMKgWlOt1vTellHefWf1KjkdWVwHOlanBwx+QqoeuiaZ3AFgCw==
X-Gm-Gg: AYBFou2Quemdqiz/0u2wxiHdwlsyx16v4BJ7lkzY0/Jfuc/PkmZ/qJtexlXT2mstKRX
	RlVe62ZgC+iNqPqjmINc/M/LPzzQbp7HP87ouew90W3fhc3VaLBnS3/HEXoUSF2xEvaYlzmuNrU
	0yDvvSj6dOLs+g1ToDy08so8EplaZFCmRnV6CFeWnUJLP2oVcCfE+U+WG5BP9HJTil89z8VuZM3
	pavO6IdGaEKGgkIkH3NVrX0OMTaI4OSjidcV/wnUa4g9eqvkNNrO0ofKFbqGfXcxEar0NWY6ip2
	QQgpVRBCnKwWfhw9/Z7UL5a8Yhwo9UAQiGHWsXQMSoYiekrCnc6g5LfL1vtYuqHX5S7vXU/nIgY
	znu8U0lOZb0TExODHs1VGraFR77hOXRy8T3hCU31n7zQ2fVr+Lx84KvX8Xh78Yuou8RzsjZhKyT
	9d3HJ3RNa37VzcfGqZuhjb6nLJO3vB0HfKI6O/fppvvRBBM18e7oEqvyAewE2YIXq0z/w18SrJ/
	ufbHmAOrcBlZ7Eq0uOLFJ2XMVByEnjCbwF8xY8BlY27yZw4G5htEFhRNR/InWLmFN/+yfK6ue+p
	oEV4wq1w6rYF/jnrhp8GCZHRyVfgWO2whrqcdjgQdoDgRqQLSqoswEBxB/xEzLPicoCjgO5ZJHv
	BgjbALSzH5AkXpJXgqP8YnoIqQh7Pk93lfxfoGEM=
X-Received: by 2002:a05:600c:3b86:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb860ffcaamr7559955e9.6.1795074173353;
        Wed, 18 Nov 2026 23:42:53 -0800 (PST)
Message-ID: <ee5350f1-87cf-42f3-b504-85c6b8716c53@suse.com>
Date: Thu, 19 Nov 2026 08:42:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nestedsvm: Don't restore L1's CR2 during VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261118175852.1683016-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20261118175852.1683016-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795074173-1ACDF9EA-1CB92F6A/10/78276251493
X-purgate-type: spam
X-purgate-size: 593
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 18:58, Ross Lagerwall wrote:
> According to the APM, the host CR2 is not restored during a VMEXIT.
> 
> The state of CR2 after a VMRUN that exits with VMEXIT_INVALID is not
> explicitly defined by the APM. After this change, CR2 in L1 after a
> failed VMRUN may contain either the original L1 CR2 or the L2 CR2. This
> is in line with the observed behaviour of real hardware.
> 
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


