Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8227C624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:44:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406792.1639968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24vj-00038e-W7; Thu, 03 Sep 2026 10:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406792.1639968; Thu, 03 Sep 2026 10:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24vj-00038Q-Sf; Thu, 03 Sep 2026 10:44:27 +0000
Received: by outflank-mailman (input) for mailman id 1406792;
 Thu, 03 Sep 2026 10:44:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x24vi-00036x-R8
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:44:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x24vi-003JKH-7s
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:44:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a994f89-8faa-0a2a0a5109dd-0a2a4509db92-2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:44:26 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a994f89-be1a-0a2a45090019-d1558029e14d-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:44:26 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49cd9add88aso13986755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 03:44:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5d1fa6sm66226815e9.1.2026.09.03.03.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 03:44:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788432265; x=1789037065; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIzas/uL2P8BgJezkOhhFdgxAtmFD3oqSyOce2VVsK0=;
        b=O8v4grZb+Dc0ZbN8rfdXFf6eMX5BKMESs3kOqJWeJ2WXY0dQrOKZqd1HTLo7Zk4hnN
         lqzAktIvAjXVUczf9SM9Bqra0E9NEnGyYHIlV7i4EgDk0F2GA8DVk87zT34KlVhvi1ud
         e+FfqXI5KmNXQbPbZeBiR/4n6zUsbhDzc8gIXMKBBEetidgkqzfkhanwZifMk/jKJiPz
         OvKVDUXfmYHS1vN5A7yOpyq5XocNOQVvjUD6V9f5yXYXkWI5rDsuWGLp6QjTe/x+W0Mz
         IYFDi4G7qjzfHwqcWY7PPCM79IlZfOSzo4PyzdOTyHzvOs2yN+3rpV9IEY24EXBZuV6O
         Xy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432265; x=1789037065;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIzas/uL2P8BgJezkOhhFdgxAtmFD3oqSyOce2VVsK0=;
        b=YYj4u2A0CmMgzjRo5uMYuXlMh6AeblvuuQazBlr/neOdrwAm6nwaz7Pyr+cmHa+U7c
         UDlRoqrLGrqesZIXTWz/FauSoIKbRSyhUnPQfNS4E8NAyJELKbOyM44hNUsnQUJMQtvD
         pf/RqzP9MWE5OhK0DFovckFnqIK7DcHnRx+fo+M3/pBYVL9OK/rt5Gk7E8DIZ0SgL02O
         JRsEPxi3VGKqK3sKe5vkVizSFa7CM7bBnqiKJJmOln/DdyLXRxHc2bYdxvhvWzEflSt4
         IOBwkTuizKXf4urrsji/RM1/FcQrWjFSsrge23ScqwgibhxF8k7r2sT9imdR0SHeBC9N
         t1+w==
X-Forwarded-Encrypted: i=1; AKwUvBwAtG1auDLNA6rrpmDkrZze5I5d+a7KuYjaosIjmUUVp429oyXJ0hBVQVaBjP6W5usqpYqF7v7uQ6w=@lists.xenproject.org
X-Gm-Message-State: AFuF++lBYlahYppJ4XkGTqS9+b9v12QK4DEa7x953jwyOsToK/KNsAuR
	BlthKjhaYcoEgYl9Sd8UD9uFRpBwUMfAU6fDUJFXfb4zC/mGsUMeSMtfqHuUIG89bg==
X-Gm-Gg: AYBFou2dFrloeYwBEwS4PjS9VZkZVzfBYtFdyXJmfssiv9Oi4bl+LPKOUnUzJ9DoHay
	vAIMdtuLO8rDN+3JSl4yafCd7tK4P2ZiVIWHaW7siTTmQW57yYrasL//9o1E2Jlpuni8nbpo0F4
	G0fJ7TKh9bo5ImU11j5NWA0sv1rZK/aImPmIEC2uAlpYAbonwJ7Mo3V0Ctugw7rKj3QbmcWF4Z0
	oiS3fIOqQV0t6qkiqUicMZR8bUuhje4O6uVhHf5DN+0mX4ktptnvqYpjkASi/4VTf0gFGgBkZYb
	srYuzzhGB5wFXaqpA3Bn/LuUJ0BbaIExMZBJw/NhfBTTLgfbAoEiOw8fichSFzfHuYo2dpurUoi
	Dt/KooVNIBa0phhQTr4YyIVynN+JmdT0M/pmLRVc9bKUYIHgXih+A5vp+oZqI/nurZveMvS44Xp
	Pa5uUVy4hlg2TT92OregKa/QyKcZiy+OCM6iRh5Evk7fDv2xVgN/pwGIO6JZRTY/6NN/aWe8Lyf
	MYrXkCkT8Tj6FcYy3EYG9XmXSKbv4ugN/4istQbzwhHuiXjQSXY
X-Received: by 2002:a05:600c:8b10:b0:49b:12c2:104f with SMTP id 5b1f17b1804b1-49ce55ecddamr238217505e9.1.1788432265579;
        Thu, 03 Sep 2026 03:44:25 -0700 (PDT)
Message-ID: <39ccc2f5-7b3e-4c5f-a98c-b526f12bb1c7@suse.com>
Date: Thu, 3 Sep 2026 12:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260828131142.3986110-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788432266-3A0C5034-C6AC0A4E/0/0
X-purgate-type: clean
X-purgate-size: 679

On 28.08.2026 15:11, Ross Lagerwall wrote:
> The Viridian spec requires the vector to be >= 0x10 when writing to the
> SINTx MSR, otherwise it should #GP fault.
> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
> the spec-defined initial value and since the vector is 0, it GP faults.
> To workaround this, treat the write as a no-op if the value is
> unchanged.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I expect that despite the (valid) absence of a Fixes: tag this will want
backporting.

Jan

