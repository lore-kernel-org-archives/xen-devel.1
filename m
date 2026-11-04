Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A563606A32C
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BTEHmzMT
Received: from list by lists.xenproject.org with outflank-mailman.1471665.1679912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYhf-000703-Ad; Wed, 04 Nov 2026 10:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471665.1679912; Wed, 04 Nov 2026 10:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYhf-0006zw-78; Wed, 04 Nov 2026 10:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1471665;
 Wed, 04 Nov 2026 10:58:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOYhd-0006zq-Pz
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 10:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOYhc-00AKwa-Vx
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:58:49 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb0fe8-8faa-0a2a0a5109dd-0a2a4508a7fc-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:58:48 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb0fe8-f659-0a2a45080019-d1558030a45f-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:58:48 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so4745875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 02:58:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4134ff2a3sm42205495e9.2.2026.11.04.02.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 02:58:48 -0800 (PST)
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
        d=suse.com; s=google; t=1793789928; x=1794394728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/74xMzCy1qrkh5nS4TT5y5CUMY7oP3+jZg9UUxgPNQ=;
        b=BTEHmzMTLeXeLrn4ITnyGXwyxxmo0n17nkUpO/2VAqZpT0DYqcol3tYYgEPh8YGQmp
         1lfiAAELk+PBb0DEdd+erYEmnIeqv+naju+i69W/d4NnQ0y6qEM5zjqz7QKhUEuJeoyt
         WpU3aOJtEOZicnf7vO0cNjOUWGCpZMKk7YMGFMCwH5fJGGIzFfO69efsuIMy8PO2V/I8
         cqkrvrSY8vuEqqSpF+R/2UEQsM5hNDYYbpWt1gTuB+v7upC5bPE8rIi+BK/AzyBqQiNM
         QR2gVVCZYNrsZHgNgnaESH4DtU9EbXrzabXT1DHxAUL0yjWF/6P2r25i2oZwi3dmtA6w
         1DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789928; x=1794394728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/74xMzCy1qrkh5nS4TT5y5CUMY7oP3+jZg9UUxgPNQ=;
        b=YwFbxwiAlKqyj9Al6N1oMxaMjPQrK898vH/0tvkLFRDjVhxo4SQpniLS5ymjgDPFgi
         CZ+d06X6/npUMkW9lgaZfgiQb4dkeRXxvE1cYe4kd6r1YeRIHxAeYGukXJ3uiVap2dWs
         36KO5xzRukGyK7qirGn5uCiRoB864gG37FUs+ielXOMgyRSzGzzMPWpBujJX01VSC4ZH
         VH9uW0MoaMBvb6k/BlBUDe9tu0uJa50hF3GojvZ2xM47uVuJ5Q3OR/Q3dV4c6rnOSGPy
         domSw0LFyhUzpiiWqKQHPmkR2VR8Lhsp5vDslxt0XpZJyFLQUuabbGrDiVoyoA4M5uV8
         y7vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDbaQfj+DF3FE0qZhq5XUAb9ML8MUBQfJWxyBWNC1pS/84re1sFjDXso1xUM2blhbXgisuCmUlrjw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9oEIr+xs9vH9w7VkVhBLn/tmuGZYHftsvDiOvz0blWu86IqFAP
	TsCDLhOJEJmBZvOXJwN3DBMtII1fYRIGaPaRTQMj99oIB8LJFy8p87odkczRU5kQ8w==
X-Gm-Gg: AYBFou1QRrG46+Tsgb1XHlxkOKAFRiO4BFEbm6Kikdj+a1xsiUbF3gw9dT92T2L6TEi
	KhgvZyXeFdgwqjnjC27eRrOtHP/EylrOZ1Viczz/crzjyn/ISUZYUEf0PFNqayLBdEkQJlDYKD3
	j5gD7kpLqEa/N/B+N5c/yeACa8MmKsdF8HJKvkSsrUDdoimGPbaeF4EwvAYSP6kI59SN0s9c0ok
	/QTd0gCeY/I34bZRj/2hFhDj47m4jCpNkn+xuXE68vOrJwgWGyyjImbGoTPzCAya4DhR/JSyQDY
	4RqZ1aT46drE24FiIkcBMjI+rC2kYHV89j/KbJEOncAa4KY3b6eIIYeiqVOwdahV1wO/7hNNcHK
	ARRXpBdXvXNYVT0LxSm32NjZbPLDr8PbeMxZbUJ3ZFKXxVjatGdvUrBPKscpSqwG/1GlT09yUHe
	pEdfVAj1chsNCaqpFdgp6zw00ZU47dH0WKkdbdLXeBoe5XYjb1eOx6XaYF6GBaQ5zpUuXtxd7hs
	A9W8ubnie2SJd4v0bIrNsnnJz29ljgOD45ypJaliznKFZHgf5YpeqFlR5YkvLofligyedBi+cJY
	pwOkPa8Wj5vAyJYDe0JeL+Xn7n3YUCNmLaZOF0hmDf5TQlAFxZ3J6jAVgNdjcxJMGcZCINiYBAP
	59TJyddzBKKr3PJySE4UkxuayhK8Y0Z8HvkKK
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr357729515e9.14.1793789928294;
        Wed, 04 Nov 2026 02:58:48 -0800 (PST)
Message-ID: <4c03ba94-6635-4f86-bd05-944fc396f3ec@suse.com>
Date: Wed, 4 Nov 2026 11:58:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793789928-DFCD387B-8AF0C178/10/78276251493
X-purgate-type: spam
X-purgate-size: 760
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 11:29, Dmytro Prokopchuk1 wrote:
> Livepatch passes const-qualified pointers from struct payload to xfree()
> and vfree(), which take a 'void *' argument. The cast that removes the
> const qualifier is a violation of MISRA C Rule 11.8.

I can only repeat my prior suggestion here: xfree(), vfree(), and other
similar freeing / unmapping functions should take pointer-to-const. Andrew
has been of the opposite opinion, thus being unhappy about e.g. vunmap()
or unmap_domain_page() taking pointer-to-const. I think we need to come to
a project-wide position towards this, and only then can we decide whether
(and if so how) to deviate any of those functions.

Further, if you deviate xfree() and vfree(), why not also xvfree()?

Jan

