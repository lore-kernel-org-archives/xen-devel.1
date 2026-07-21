Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B98C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:42:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367514.1617257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm57P-0002vO-9r; Tue, 21 Jul 2026 07:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367514.1617257; Tue, 21 Jul 2026 07:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm57P-0002vH-6e; Tue, 21 Jul 2026 07:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1367514;
 Tue, 21 Jul 2026 07:42:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wm57O-0002vB-AY
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:42:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm57M-000O3B-M0
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:42:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f22c9-5cb7-0a2a0a5109dd-0a2a450aea7c-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:42:20 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f22dc-f2d2-0a2a450a0019-d155dd36d15d-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:42:20 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso10209088f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:42:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eddd1csm36619434f8f.29.2026.07.21.00.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 00:42:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1784619740; x=1785224540; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bPSnGhLS74c5WqUMiNVZrSGFSrv0+clXO3Oe1XhzmA=;
        b=WrcurWAy3gjxOHc03HgF3j1xuyf+9OHYhiSwHI/x6GcuQwHkNt7QvCqkemdPpYGl8q
         xYQ3m+Px4RYH3CpLsItPv6mAMD9LIrOFh6/9aqMBviYRnEdmeni2lYN/8pGoihnY9JFH
         gCwC45LWDqpCc6lvvWgUMrrQHfYuJdbFt05KkPQGOKtgQTnVhSrWoqFGISMfa+ukZCDp
         PoURWhe0XAqS7JbncqcQv3yNFA/rBfqv4BgbzCR2D2wdXSCgcZb8IQrZnIDq29BxBVLs
         c6OkrodfeJSUjpgcvu35KiVWA5plyWlRykHhkfMhoFSVsKOJM5Kj+O/wO3H9dxwUEHm/
         6NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619740; x=1785224540;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bPSnGhLS74c5WqUMiNVZrSGFSrv0+clXO3Oe1XhzmA=;
        b=G1ByKhSQDeUBF8PjXSvMVs1CY2dAKHtpA3aQLvn054Q2rnz2iNX10zfyb9HBDADY++
         CDvR2cuB2+lFDalldwBCuBrgbk1zvqnVKsWcjFqF6oYROSwZryG1+8HgKzQbCqhtPilH
         571K20x6SIp2095j7ctyTd7cHqMpWiqKbNHvpZlp1vVIE8TsuCQMFAdSw0tTjnEWgoE1
         GMU2Pe9/utsSF8J0vSJ6UaeRDUm/hAqrB5pSmn8VLuU+Q0O/6hwupv4tTkZFkkR2u0s1
         UbHi5HYWq/eZbDbNrN7kk60dHmpZekQRCc5KbZ43xl05+eMHvtCsZFB7oTm7D5Z4GsFK
         8xzA==
X-Forwarded-Encrypted: i=1; AHgh+RqRx8+FPzTdXtARx7m6kLOxSjtlt+6EVfEK3kUqJlRpzVDgMXL6xdsvAhQNtUoOotgQQkpS/jzRCZI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywy79h5LsNVERnEnjbRcdzceyBJmR4ZnNxwBNdcrHgBWLbRYGcD
	3C89GPmn2BbtrtV6Ml+yDv/exBGUe+qn22WWrRsPkSQ209S/sc3AYTkqy6myoF9LjfAqOkDQ4aT
	3+5zIWQ==
X-Gm-Gg: AR+sD11S9/QlPBGbU3OiLUj1YeRxGU0OEnlcMeE9YhVkCIGVybcgzNi/6WniyCG7fBB
	RhJiveqL/FNVDG3UqQfglBz/5MBLyQ7SwO+d6x1KzHzdNUHzkCMyvuGqM8b1JK4vRIS0bAjCX+Z
	Veexcs8q8pHGkzTofEGzTWObz8kDPT794B7zgUenTBZJLGTXWx3n41Dv+UgSUWAFYHxJBkkpMr8
	CZR+k5C7XfsFmbZY5oCuLgHfD0Y6jX0cL3R1TFH13oaNBCEZ9BGrahUyeTsfS5/x7ybESUJCmAI
	p6qyct95dodN4DtgYlfXXphXZsYzaQA15CCvnWBQqwoinbDcZWbHDumMpg3v37rCeGkdAvcumXU
	ay2iZ6JsplLV8CcnIjOXkeND/ERGTHK8PlsjuNQPlBpsMhJh+yDzfjqVnHNLiCv/bpzzBMjsosC
	OSzVhVXogLmIPhp9Bw7dUZbDOSFcWDM13ZB4WO9xuXf+h/jRE4qCLs7kBWXQPhhHq3NA==
X-Received: by 2002:adf:e010:0:10b0:474:cd60:1154 with SMTP id ffacd0b85a97d-47f6232c9c2mr14623250f8f.41.1784619739861;
        Tue, 21 Jul 2026 00:42:19 -0700 (PDT)
Message-ID: <16ce4b19-d94a-4787-aa5f-8319d7cca7b3@suse.com>
Date: Tue, 21 Jul 2026 09:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/kexec: Wire up kexec hypercalls for PVH hardware
 domains
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260720185825.2204624-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260720185825.2204624-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1784619740-51EC2CFC-3D29D0CC/0/0
X-purgate-type: clean
X-purgate-size: 622

On 20.07.2026 20:58, Andrew Cooper wrote:
> Nothing in do_kexec_op() is PV specific.  Plumb in PVH guests too.

Hmm. "Nothing" is a little bold, isn't it? PVH (Dom0 or DomU) in principle have
no notion of machine addresses, yet KEXEC_RANGE_MA_* report such. Similarly
struct xen_kexec_segment and struct xen_kexec_load each have a machine address
field. Presumably these can / should be viewed more like "handles" here? If so
(and preferably with the description extended a little to cover this) ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

