Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D81C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:37:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373904.1620835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woh3M-0000S1-EP; Tue, 28 Jul 2026 12:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373904.1620835; Tue, 28 Jul 2026 12:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woh3M-0000Ru-Bn; Tue, 28 Jul 2026 12:37:00 +0000
Received: by outflank-mailman (input) for mailman id 1373904;
 Tue, 28 Jul 2026 12:36:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woh3K-0000Ro-Rx
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:36:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woh3K-00Eifh-8V
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:36:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68a265-2eae-0a2a0a5409dd-0a2a450bb4aa-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:36:58 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68a269-b7e8-0a2a450b0019-d155dd29a42d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:36:57 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso851334f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 05:36:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5c4sm57916152f8f.8.2026.07.28.05.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 05:36:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1785242217; x=1785847017; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2nqhC2tw2mRg2UHz1ZzRZrAVNDSJZBaFwlKGXSCV3Y=;
        b=XHXXmpEGqr1M0i+aHsAH21iAwBd4wyohB3xpsWqUCRuEwkfUYO/7ObwBmPXI+MRwrb
         6dGBQ5BHatrxvB4fOi3UPpOU0dzUl2T7irGA9R7tsjmuL+fFhX0Tw2AePCpyRD6WEerz
         NYIYx+uvnzOveo8zmu5zcLEiov0Bl+q3WNPjGfrfAR9NENcrL5dDLKTW6Pg8EmbsUxBI
         0gQrAaGj0baS0Li3iW2iQJdqf0YvR+vqZWc8+ag0DrGURtRfq+eMdeH9qeYsXkR4mibm
         K8FFHzvM6iprC70SgL+GLOHS98kdKGt0kpNOcppp+7aeOGMqBxhSk9SiHQfs3fyaTgVx
         rIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242217; x=1785847017;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2nqhC2tw2mRg2UHz1ZzRZrAVNDSJZBaFwlKGXSCV3Y=;
        b=MuHqM/LmfqfJQR8PFzudXdTF1oiuOssDdBx93fJc9zp/k4u3TsrXdIP3hN0ICF7RZx
         ukoJTBZGFx8uyXz3J58d4Thw48vLg6jvEHkr0hQpd8nrnQPGPfoOa0bqQgAfefU9DoTG
         va0ofF5Pfg/20OH4R6J0NP/3C4S9jDVWKuzT7G6IpVg5t+h+PQXVNY9Dnxft5Wl58JSl
         MDbDmld2iAexl7ZYc09D7Sfyl4iiE6wsdhmFbHGT+GVMt521NKU/0QSNQj3pixn5AVrP
         8UDDL+qbkcBmvrgG1iCkraVinb8/mwrBNOAL6eqbKD7NMY4J+LgLXYwVoq6Bs2qaCdWM
         JDGA==
X-Forwarded-Encrypted: i=1; AHgh+RpWlb4E/4O9n5JYuw9c7/XUBdrmO2U+ctSPoxQ9O0/b2gHxYmcqG9n/SHOlhYWH4qhNoNqRMThQ7wM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2MxVZIYCDsVYIkgo417y7WnOnQwhkGWGAdJh63P6Ttz497CeQ
	FD+yzxTcWI8TVzrbRT6mBC7naEJD73YkvgRsGfPxpHGzC2SgsbwuJkuGv5fpAQlgxA==
X-Gm-Gg: AR+sD13CQ3toGbgR8EFWYmhVONvmjnap1/GiA1CoiH9+HRc2KbwQyv+7RAK7S0EdrPX
	/vTMECb9daA39zhtS59KItcYDAkM0DCx/fXkliMKcEFXIwJQXCIhp2YwzmK+uhU6cHdyBPit+1P
	EjlMqiW5waNl99SyVdQhpJ6RzhVi6G89HTe5upcoJ3avTm0kN0sMEgA0JmsAl5JwqUs/ZhbsIuk
	VfZ37/SOZeYJ/D74BKXsJJJWbZy4QG142qXhdJRsaogJgZRMYaeVi6n3RZIV7se3YeA5K4hhNFG
	dSd6Mn0H0h8RNPMFIXQuLQGZPqkE7lXNqW5a57VIjFl+UiLBtOiKwlWsrPXgt9AHXZpCru8FkvU
	qbbJ3QiQIjJnGjr/uTnzZ8jYIJotK6G+GrbaJXUZUREB7LXsLOrVdZOKRjRcmVKvEWRzN/mouhf
	g8Ovf1/dIyVLhTYd4BHjFgpJTjlPEEwYW/DDmb2kI+w4qd7VF2YnaPQV46Va8pHjYrHA==
X-Received: by 2002:a05:6000:1ac5:b0:47f:6f2b:4e26 with SMTP id ffacd0b85a97d-47fb1e85773mr2647316f8f.3.1785242216956;
        Tue, 28 Jul 2026 05:36:56 -0700 (PDT)
Message-ID: <b8be4d29-e92e-4ecb-8122-07d370e7c6d1@suse.com>
Date: Tue, 28 Jul 2026 14:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vrtc: Use a real type for rtc_ioport_write()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260728123137.41861-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260728123137.41861-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785242217-1AAD89EA-34CFD3AB/0/0
X-purgate-type: clean
X-purgate-size: 714

On 28.07.2026 14:31, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -469,9 +469,8 @@ static void cf_check rtc_alarm_cb(void *opaque)
>      spin_unlock(&s->lock);
>  }
>  
> -static int rtc_ioport_write(void *opaque, uint32_t addr, uint32_t data)
> +static int rtc_ioport_write(RTCState *s, uint32_t addr, uint32_t data)
>  {
> -    RTCState *s = opaque;
>      struct domain *d = vrtc_domain(s);
>      uint32_t orig;

It's entirely unclear why it was ever done like this. Even in 3.2 it could
already have been done the type-correct way.

Jan

