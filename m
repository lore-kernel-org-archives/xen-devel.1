Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30DE60A2609
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fRHPB6dt
Received: from list by lists.xenproject.org with outflank-mailman.1492221.1692934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHcL-0003mS-3A; Tue, 17 Nov 2026 11:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492221.1692934; Tue, 17 Nov 2026 11:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHcK-0003mL-Vq; Tue, 17 Nov 2026 11:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1492221;
 Tue, 17 Nov 2026 11:44:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTHcJ-0003l8-Rf
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:44:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHcJ-00H2c7-47
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:44:51 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc3e2e-8faa-0a2a0a5109dd-0a2a4505a2d8-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:44:50 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc3e32-4cb1-0a2a45050019-d155dd31c1db-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:44:50 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so2372196f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:44:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5a32d336sm29949317f8f.0.2026.11.17.03.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 03:44:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794915890; x=1795520690; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OkMUuHjgJYB1s/od4RZIt6QnrPG1K+UULOY1LC50Ts=;
        b=fRHPB6dtry3pcl9zKREXeV8hKYvW3U9g3VX+LSL7sYRGdInl80TZn9BzJN+rCZ0y6O
         GS8VfAwyE/dUM+imH5Av+OtSye4S4ToSw3QYAnh+O9fQud5q4zGBBusXah0BIaXTVCpZ
         /HG6VrkAYkmy8XwPWOlWlUrzSIU+FKAMEVbaIxQdSqCBXm9bsGoLGeV2w2rCgU9arHSO
         KEG/aXoyQmnBFEkMoOBcurwXwOQbn0zESod9T/d1mLneDaMTGsrddnzC1IdDbPfhHSRd
         HflGBBZhCihSydp7oMVBBWz3G73ubKq9lbSCEEmKVQCRyQlLSJWxzR9rCx0+HvJiCxGB
         SS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915890; x=1795520690;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OkMUuHjgJYB1s/od4RZIt6QnrPG1K+UULOY1LC50Ts=;
        b=CCEBKQWMI+IF8tRMZSGAtHxgt+fuqqg45CEnpgZr06iBA+B5lrvPU74MF2+aNVPvPQ
         pgEhSybhG/4Qwq7GkqvwgE7JK0+V31mmoPUqDC9CK87vwKchd3lx12eLDaxq6SAHVygg
         +L3tlFSO5k6y7kOJ5ma7C6EtY7d1j7P71lhy4YK9GU7KnJJxTk1jFAgqjMNWHko6EE2U
         crSZtOb6aukbH8ukivezUQXrgV7J30mYhzikQRETWaGLBx4HHsFbq3cPOtvLBzTthtgI
         NfzNHNyIFyfKkbuoZ0L9UflEuvp0Jd5Ck3DWiusL6fhiswS1an0aIQfVCiLp6h3h+igu
         vv8w==
X-Forwarded-Encrypted: i=1; AL+hErG5sAkvgt5NgxU+eDUkQu8aJphMJNWqcF4XCUJJtzva+3ugL88AbkhzA1vl3hz0JnbLoURcfXbm+X0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Ik6BLE5tHV1pZFGZ2Ch5wX+K8fmiBx3UJEqPOsY7szNzNI5fp
	acsiuuowffyplhSdUtZ1tW6rPEK3Tu+DG7U3kFfMPd51hERh3Xpf1vFVGEzlWrh5ow==
X-Gm-Gg: AZFdTZfZmJfxiQSFBbJOR66y6k69383dS5DSVzHQ862OGJK82dH/78UtyvxeFRSE52a
	XpVyVWG8qdZDpbPYWVe6SKk5g+dq2aQvB4Yrd30Cb3gXw8D38Fl1XQDgCJ/nnoOGoNZcNSKKD5S
	iQTiQ3PktxXIAEO9UAGmXnqnTTZjpK8vkZLJhxqrW2jQBoFzGEZemsQou4i+3Ljx3mRnqotoyaw
	gLNfQU5W/ffKpi5zPz5a7hYXb7QZSzDcYi7JtRDLXGOE0naWNmejB5lo6BnQMH9mlz6dQXoFrFd
	8+iAHMutO7w7PXqRFEr82D67U+09MFU9mfezGY51q4vA3GOqirlWrjx8/Zn47vwmbqmsLPYxEp5
	HEPACzU7Lzd6mKBcUnr+CD5TdtOiy5QOQXaDzfaLNWVUIPBNrzuwAo0sLfHBcMMawCB8ItAKyEU
	BWYM1vQcoSgwLdraLLvvZ1+fN5CJwcrX9eWpalAbqdQNba2KoOneA2tGJ86BNh6r7vukATTZGP0
	XnoJ7DCbg5xOPQpeFaZIjbCjqPTIkB4gnRpp0XEOfKocTvvgwGHpXjlbO3JSO6meH9BLEqRTJ36
	6ilR7U3xbw768wE2+hihpL88swUPZR5sIt2vb9hKshFwIgIGAe6HHX1dR2aeXsmS/fDmjhBMMtm
	tw/8Z5Y6VAax5YhpOcw==
X-Received: by 2002:a05:6000:1887:b0:4a4:ee9f:a3d2 with SMTP id ffacd0b85a97d-4a4ee9fa5d3mr1828716f8f.55.1794915890458;
        Tue, 17 Nov 2026 03:44:50 -0800 (PST)
Message-ID: <23e35fb5-b1b4-4f21-a703-8cd37e278475@suse.com>
Date: Tue, 17 Nov 2026 12:44:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vlapic: accept a logical destination of all ones as a
 broadcast
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261117020601.1466125-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261117020601.1466125-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794915890-F7ABF2A1-DF4E8DDB/10/78276251493
X-purgate-type: spam
X-purgate-size: 893
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 03:05, Stefano Stabellini wrote:
> In logical destination mode, a destination of all ones is a broadcast
> accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
> the cluster model (AMD APM vol. 2, 16.6.1), and 0xffffffff in x2APIC
> mode (AMD APM vol. 2 Rev 3.39, 16.14).
> 
> vlapic_match_logical_addr() treated these as ordinary logical
> destinations, so a broadcast reached only the vLAPICs whose logical ID
> happened to match it. In particular, a vLAPIC whose logical ID is 0
> received no logical broadcast at all.
> 
> Match the broadcast in each model. A destination format register naming
> neither model still matches nothing.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Oh, and - a Fixes: tag is going to be wanted here (at the risk of it being
one of the bitkeeper ones with meaningless subjects).

Jan

