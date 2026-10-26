Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B04606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IUsGoKFb
Received: from list by lists.xenproject.org with outflank-mailman.1461209.1672175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJng-0000rc-Vr; Mon, 26 Oct 2026 12:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461209.1672175; Mon, 26 Oct 2026 12:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJng-0000rV-T3; Mon, 26 Oct 2026 12:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1461209;
 Mon, 26 Oct 2026 12:27:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJnf-0000rP-TZ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:27:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJne-000drW-Tu
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:27:38 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4731-2eae-0a2a0a5409dd-0a2a4509dc20-28
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:27:38 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4739-be1a-0a2a45090019-d155dd33c071-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:27:37 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so1646013f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:27:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4d8dsm17455189f8f.36.2026.10.26.05.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:27:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1793017657; x=1793622457; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpomNrNH8qnnrRyjYkppSWS+I4DgFqYEFVp4DNFHbVU=;
        b=IUsGoKFbVsQ5zUBJuAjqUW5WYKdEhyt7D0N6cg1l6Xbc2uBzMQTbviWJ5M2GOy5rWr
         ZpRUQAz8on+ab4cp/Vl/Dgi28svn4CTSolwyXcvll0RD9LgG5FQRr1wwct5Ygz/C8LZ/
         tx7BGSwMuPaewreaAjLCgxdNp9ZfZNLE1BjXhBe23PkFvJMPuCx/bhTWj0G//HuREXYi
         dXZeZ3iY44V5ae8WyySky+sTtCuUlQbqGpnUEP4bpnu3QclZBcrrEbgAEDLydWY/vZzl
         jxAk7K/iRMG3g0lySG5N+lKspF+MoS5LrzLAw0VSL4+YXyJHgHsgv7MtEygQovseGYmz
         sV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017657; x=1793622457;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpomNrNH8qnnrRyjYkppSWS+I4DgFqYEFVp4DNFHbVU=;
        b=todOpF8hhbgoSezyrEdAX5BlY3GGeOcFaKjGbIfV1bORxk4ksDN4G27/RyA4ieoV90
         nKHvGy2vfgeo41F47o6hjF4iVnQQ5EZ53ydJGkB+qI1GIWleCWIaqlpmfP8qZV42RdOW
         +bMWXSZO1WySpj6jPOc3CPHGYGFyCV2ZfDNitTEak2mjrGjSlLVMWV1jIIDdYMv8Ync+
         xPwwF887tFAJh5zfiw2WthwQF1aXR5atRrA2BVJXp6FPx8b9I8LZeKUHa+ejWUu3rUsQ
         bk/P1GMpQTM6y7TgXpJv+RZNulTjKHulHd+47HhZUfbaIR8PsYTPOhFwq7IxZbYJGrkW
         R/yA==
X-Forwarded-Encrypted: i=1; AKwUvBzG19QSJpJAtM/tgRj5DRMPnGxkNocUAQto0/c2953DzS4ABFMrvlWkXAWUksWCASjcHqh1EPBn168=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLeMt+ds4S1yGXy6Og+d+ZD/5ahzcPQ+y/qfIQk4uOa3vr4s2Dl
	H6oBysWmJ+kPILV2hIhEgt/enRInJ6M3XnLWq8j+Sh3fXoyNPzfRAAhq2PYEQ1kS3Q==
X-Gm-Gg: AYBFou1LWiytr1GUFLLqSK0U45I0Pu6vvP6th/jro7mSbkcbdaQTvGMMO2UdREWGzsr
	24aulG+0I3EtDsGk7D3soWo/DfRiKbj1m4A0yT/Ay0KwwiFIkVzzNXjNs34eHgnpGHjvssmmoy0
	ae9Cx99uJosUXCSrZO9kUJh1+IkFmnEUFmD7eQ6uT1o4+8GU/VkLcTN6An8Fw4S5T6M3OthIKQN
	cb1chvm7IA7XwHXrH8hoyVVGEYXvGIVHIwujW25Ls/1sgjhkvWhoPCJb/R71U+/3nUDDJCx/yKp
	oMCoArgBC47WW2/Gqx8zqnWzubuLLytZYg4UZ4Gsb4GyLAC/md4GVhUrSj6v/fNzNIvb78Y5WHm
	kdPJ3RvOr9jEZNUZ9SQnp/k5pvWLkgrv12acsmjUKdaC5OfczhMUWupD+dD3ZY2nCFbT7gmjOeR
	P9qXYCpM77QydNs/q+VhXbXFIyqlH8/kIMTIdWDYPRZJVHVLTTXVl8zAtCA6i/NLqxbWToJHUbW
	iOFzGNgVypxuJPIqQ1HY7xL5TOAgL4TzFdAB/dBF1AcU98gNsK2K2bQKQyOZVpwTshdL3EasdUj
	Y/5dbzeAYQfVlGewknYs/iY9QFET5p5bJk9iXfYYvuQ=
X-Received: by 2002:a05:6000:24c5:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e3eb859dcmr12181717f8f.16.1793017657229;
        Mon, 26 Oct 2026 05:27:37 -0700 (PDT)
Message-ID: <25409f5f-bf65-473b-93e2-07070295093f@suse.com>
Date: Mon, 26 Oct 2026 13:27:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: Skip IO-APICs missing from the IVRS in
 shared IRT mode
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261020215941.3667346-1-stefano.stabellini@amd.com>
 <1792572666.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f@vates.tech>
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
In-Reply-To: <1792572666.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793017657-3ACDF034-4845F589/10/78276251493
X-purgate-type: spam
X-purgate-size: 768
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21.10.2026 10:51, Teddy Astie wrote:
> Le 21/10/2026 à 00:02, Stefano Stabellini a écrit :
>> When an IO-APIC with entries isn't described by the IVRS,
>> ioapic_id_to_index() returns MAX_IO_APICS.  With per-device interrupt
>> remapping tables this is fatal, but in shared mode parse_ivrs_table()
>> only logs it and then uses MAX_IO_APICS as an index, reading and writing
>> one past the end of ioapic_sbdf[].
>>
>> Skip such an IO-APIC instead.  It is left without interrupt remapping,
>> which is what the rest of the code already assumes for an IO-APIC with
>> no index.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


