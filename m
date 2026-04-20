Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1696F588EA
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 15:50:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286324.1567415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqtT-0004Fc-9A; Mon, 20 Apr 2026 15:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286324.1567415; Mon, 20 Apr 2026 15:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqtT-0004FV-6K; Mon, 20 Apr 2026 15:50:39 +0000
Received: by outflank-mailman (input) for mailman id 1286324;
 Mon, 20 Apr 2026 15:50:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEqtR-0004FN-Oc
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:50:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqtR-0082Rl-5Q
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:50:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64b49-5cb7-0a2a0a5109dd-0a2a45029b36-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:50:37 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64b4c-af86-0a2a45020019-d155dd2dcc66-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:50:37 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso2912938f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:50:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a381sm32869395f8f.21.2026.04.20.08.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:50:36 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776700236; x=1777305036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GewcUYWf61DPS06PE+C8EkQ53WngNiW6KstzIESIQrQ=;
        b=KEOgDLPHz6puPGFaHrHXOQoXXcL3VO/pcU2JLOY/rMGzh7utUw8dm9SuiO8sOcOJUn
         UGKUW/RChWCEwLnCgbwpCZY7Zc7KnVI2WcbZWfUbgJHZ/qAE5K3bk/nowPw54Di12Vru
         u2LboiahOrF5MaK+p4JB7wnqOBttVvqxdz+y6B5N2GtdEYKHVHSXrF4srqo0rNBVQ7es
         lYZBYgaQXNa6O7eqZ4kqUE14SZNFc8SeiKANvis/mx40GdBYvAWnm5kQMejtJTOa2DAI
         Q7sU3RIVwaoiGqQeQya9h9543V0E5kwl1MXVJpe7iX3sodGYM3+WtXMjA2cTp5OYmlhF
         yaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700236; x=1777305036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GewcUYWf61DPS06PE+C8EkQ53WngNiW6KstzIESIQrQ=;
        b=HrfGxUzIpgJLIyxCU6YQVM9uqPk+XbWY19OUzHzBAi6GERgZi7dCWtMet2EyYszKU3
         ySEiH8eyYiF0zdvy2ZgNSlMCux7RiBl9MXet+1sBvbse+7PqMQ7t67Myra23m7AbqNpU
         O7OW3vC9ECu4bKyQOILBUmCRc41iku2v+yR1S3bYgwt4wtbFfYIZ3UabUpI/8zTaKSov
         VvWzWfMB2OZ4jN1BL56hd86Je9WYn82qfD1TlLxsDdX3oR8SYUG8xhbv0o5BHulN+m0u
         HUma4m3+BEJG3ossuCgRVVMB+WYK/gQBQd0FRvZ08Tr8/d2Tgxydi8vrXouktmZ2WYe9
         eC6g==
X-Forwarded-Encrypted: i=1; AFNElJ+7vmstR6YrkpmzBNSKzQ2UWgG4/L1Nv6E+TaRnJNK/5x3LVQkE4zBZoo72RQTNHovE3dvCgVbS1Y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa0/cg/hrs4WQP3/hpVxFLQ5ZrJDdyBcbpuJtPFh0mIIXLA++J
	mjdw5b6uPlegM1uOlGQKkoYaw3eG8nT54Pe5+CV6EYd2NzRM1ucdD2WY2/IPh9LVmA==
X-Gm-Gg: AeBDiesej0fA0omMG8AxD3+/yc0o6lMmQm6Cshkied5rC9I/XpOjzMbaQcajl9K4Uyc
	blaXSxAEW7pRcyknVSorC0C6spyAt0LmCm8uOtuiFAJcGrT5sVyvT1lrKIxbzvg2BZmXxIQHAno
	uPySQ7AhKrg3k8y59uZqIj88hn1Vkpkwv/FKdgxE3Ppi1+kZX8jir2pQuzeBO06fW0DjCOFuDX0
	8t9DkSZVJaA6J9x8GGy8yUDoj+baSHSfaxotz7OnYcsoBmYcTr/9GWlwVrQYxrrRfFtCqCs599J
	IbwDW0S6r2DN4YWMAxRxeS5aZ7AOPBFxsn5pGckM1ZN58ca5WF8G3lMTwj2d4Un6mXrSj9DOd1f
	kQ6xzVxbkcsvydRHNOkrAMcI2117OAaIvaNicOhYzcBEfdtVIkCPATDUB9MTxEqYW9vWimisEx4
	NG8eKccaak3LBoz8HrAXMOR1ZGT6F5B+4CaUCI7X+0MDLuPJUaNRDbs/hSWXJxuzsPaTvdyA93G
	MNFm1HC91i+u7asYSEcCUW6gA==
X-Received: by 2002:a05:6000:2c0c:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-43fe3dc5b0bmr21635119f8f.5.1776700236485;
        Mon, 20 Apr 2026 08:50:36 -0700 (PDT)
Message-ID: <d4e65920-aa03-4fed-9277-fbb7d295fcb1@suse.com>
Date: Mon, 20 Apr 2026 17:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Feature freeze date for Xen 4.22 is Fri May 08, 2026
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <832ac76c-12da-415d-b598-7865ae0133ad@gmail.com>
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
In-Reply-To: <832ac76c-12da-415d-b598-7865ae0133ad@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776700237-8A0C7161-5CB4D230/0/0
X-purgate-type: clean
X-purgate-size: 550

On 20.04.2026 17:43, Oleksii Kurochko wrote:
> The feature freeze date for Xen 4.22 is Fri May 08, 2026
> 
> Patches adding new features must be committed by this date.
> 
> Straightforward bug fixes may continue to be accepted by maintainers
> beyond this point. They could go without R-Acked.
> 
> If you would like your features included in this release, please ensure
> they are committed by the deadline.

Among the large amount of stuff which is in flight, have we settled on a
subset which we want to see make the release?

Jan

