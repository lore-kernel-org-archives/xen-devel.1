Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E476C60A2614
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 06:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BBUZX5bY
Received: from list by lists.xenproject.org with outflank-mailman.1483096.1686653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR2Cb-0002Iq-BL; Wed, 11 Nov 2026 06:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483096.1686653; Wed, 11 Nov 2026 06:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR2Cb-0002Ij-8a; Wed, 11 Nov 2026 06:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1483096;
 Wed, 11 Nov 2026 06:52:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR2CZ-0002IL-3f
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 06:52:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR2CY-00GDqj-Gc
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 07:52:58 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af410ca-2eae-0a2a0a5409dd-0a2a45069bb2-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:52:58 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af410ca-195a-0a2a45060019-d1558035a9a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:52:58 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so16322295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 22:52:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983585c5c4sm7722506f8f.17.2026.11.10.22.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 22:52:57 -0800 (PST)
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
        d=suse.com; s=google; t=1794379978; x=1794984778; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qN7bJkEK+SzL+udtuaWWakZM3d/GjwBkTHGuDa3EwY=;
        b=BBUZX5bYeqUAQyIjlM8oPUJ6JpmLYtTkqQsUPzG60LwbLHoAj292Lj431wgcyAE5QY
         +jem33gFphT4kfRZ34xYAtxKL+KBW4zVhISBLpNM5XFwEc2gbo95yRDIGlwELxDHnZ5D
         X9+MPmuoWFdMeLWo/5jd+pJNnijOss1j+4yy7BGoG0rRBqPU6fsi1pz/EtAMY9WUc7wX
         LttoY7D+kQCE8Ik1J38QN7AwQWvRv8F9glUdYt0SjA7F3yYDHsYuNxjbBaYeVBfe/zfJ
         iCT6cnpXAnhVeFxPBa644riwn4vI+xtuXQvrwuIoVjo3UZku+A+TRTe002aL3a4XVeYi
         y5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379978; x=1794984778;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qN7bJkEK+SzL+udtuaWWakZM3d/GjwBkTHGuDa3EwY=;
        b=knHgvbsR3IiO5SvK0gij8X+KtHHJxQ1lgpJ5hyabLAryFM5gzVLPQB3yYsfOk7+086
         rnfL5qe7oxYJVUzTWIePk/sGC0zvN542P4RN2rv508ZBGBj2L5c1IQ+lDODghYYTssQg
         SwSwV8V/ysPDW1g5SNY3P8tzT5WQj4DBGpkHK1v1uP4ER3MQYua6qCnkUk6owOJq646+
         +wNz0EH7saeKsXmvvrktVByf6v6Oj+d9R5wdui27ZaLPdCLPiU9eRblLcdlj6Pp94wC9
         EZ6b8dHlL8l2BvgoXSkzxoBnZHAnb61R7rTVIZsa4fhPYtQFKcHo1xCS1sjNmgnaqnNW
         DCRA==
X-Forwarded-Encrypted: i=1; AL+hErGV+hygvgts+nguvVwwJaAX3ymYeDQ7qcJ310fXtNC/8ka5nC8xJievC8LagG5XAAB7VFqjgh6eqMY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/H1BkfRzwIKKHxjmnhABqeBimKwzyhYo1ANn7/Mm0Yshfs2G1M
	23UfYZU2enjOm9PJgDojg/aqV0rMa4kjmRWVHvi+Bm/2Hux7rpB65TalMV7Gwxoh0w==
X-Gm-Gg: AYBFou2P3h/D6o8WfNjHO4OenQMYFsvkztwplzsszQaPxPrwDiiJ2thOcR7N/kZtxeP
	Pe7T5TJDragF0pHfN9Dm3TyyUGPt3eq42JYXiluLDuZdqAz7lexUoqRfE189jOvf5093FVSlp9m
	lH2rcKEyVO7mEphBvbQ14L8sszAAAGFLd6K0wPXkBO3kbGd2lRa/joWB6+ZmYd4B2Z8fSCOCJTI
	WZnzobToeZ+cPQ2Lgml8lX9nX0+ivzcZbAwMuwO93JdN0GU4tZJCBz6jIikyI6oRA8kZ+S9XWZZ
	5BchGuaqFJiqVslOyj1m2t+cXER51DWIF5szTzQS1PAq4z/UASsknFuFonsw5N/pOlhCcL0NSFx
	JUtcMz/tEJZFVfsywJGmsdGkdOXtGT1M3FYTrth1TUZ/PRnPTUclSmBIKAOpMGN+RjhFXkaCd82
	MMVwPMxlQr5hBzBwfNGfY8tz6nR3DRzNCw1g+gHNrcV2cjvVnX5FHhcte/q5TBt618qiPmYPY9A
	5Ks16VEeCub04mleDHNVX9qAtSXEtjpdTWIqqxrb9w9qFIDlZoI6pQfKxYFdcGTX8atCCvnzJEB
	hQRL9T9LaFCW2hjdglrZ49c2OG6TtIrUzPppalqVf9ikjvsx0LbiGaYC3xYoidFXN4Gbw0WXg8o
	gpOeH8UdqxQoI4ObMIw==
X-Received: by 2002:a05:600c:c08a:b0:4a1:8dd1:305a with SMTP id 5b1f17b1804b1-4ba08d5d1f2mr22668245e9.0.1794379977791;
        Tue, 10 Nov 2026 22:52:57 -0800 (PST)
Message-ID: <7222d82f-de4b-4612-92b4-a67055e966f0@suse.com>
Date: Wed, 11 Nov 2026 07:52:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libxl: wait for QEMU exit before restarting a domain
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Penny Zheng <penny.zheng@amd.com>,
 xen-devel@lists.xenproject.org, Jiaqing Zhao <Zhao.Jiaqing@amd.com>
References: <20261110100258.490701-1-Zhao.Jiaqing@amd.com>
 <d2ef64c7-0587-4fb1-b119-bbd11b987c3a@suse.com>
 <81087fde-407a-4f3a-8a7f-e2a96945d175@amd.com>
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
In-Reply-To: <81087fde-407a-4f3a-8a7f-e2a96945d175@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794379978-F5C0F77B-1DC52376/10/78276251493
X-purgate-type: spam
X-purgate-size: 515
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 06:51, Jiaqing Zhao wrote:
> On 2026-11-10 18:22, Jan Beulich wrote:
>> On 10.11.2026 11:02, Jiaqing Zhao wrote:
>>> ---
>>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Roger Pau Monné <roger@xenproject.com>
>>
>> You will want to use a correct address here (.org rather than .com).
> 
> That was my mistake, sorry.
> 
> By the way, on MAINTAINERS:390, Roger's address uses .com, maybe it need to
> be fixed?

Indeed - Roger?

Jan

