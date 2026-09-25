Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F6EC9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 09:25:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433586.1654068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA2Ax-0001gk-P2; Fri, 25 Sep 2026 09:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433586.1654068; Fri, 25 Sep 2026 09:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA2Ax-0001gd-MM; Fri, 25 Sep 2026 09:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1433586;
 Fri, 25 Sep 2026 09:25:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xA2Aw-0001gH-LN
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:25:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA2Av-008EU5-EC
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:25:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab63de1-bab6-0a2a0a5309dd-0a2a4503895a-30
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:25:01 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab63dec-fae8-0a2a45030019-4a7de18dc2ba-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:25:00 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e64ccso4430095e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 02:25:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a349fa1sm7895583f8f.8.2026.09.25.02.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 02:25:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1790328300; x=1790933100; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z6ojXIO0zDL7LD8TnIZwg1SLz0VeRJlMP/I+aLZFxc=;
        b=KkKo1GAgU9F3dx0opD/33l4FZHwAo1n9bQwde0CxmIIclkMfwugbEcqJKEwfvZSCxG
         fkSfjPPAF06vomk/2mI4k99lWcVIk/fUhG8e1ds1w581LGHh14Xd/1gSUzrYDjJCnF+E
         trOqSphFp5jVSljDjO+KQ/LZQ6kd4736ztbXoPmr+OCsnGuvx7wMEiTEke5ND5h2VTB8
         mCKfGmizek5w1YKmwGKHq8DInTQZHXr950q+FCKz5DDo3lnena78BZZ9DS0190m4YQS2
         evLXe1+dHPurs8f95NxI9P4hI9vQ7IQSnKtfL8+VEOrvGcvKYNzjFFwUOa2qj2GemYQj
         w3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328300; x=1790933100;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z6ojXIO0zDL7LD8TnIZwg1SLz0VeRJlMP/I+aLZFxc=;
        b=ATLhDahya6O9SD93zH6Z3MLhLek39ETPGDWQD98bSo2/Jz4o35g8I7R7P0bZhWjuLQ
         hn0BG5MILQIzSjVrDdal3xKrWDinsMjiK4u2hAoS1nOuptnzN19uoS4uIuT1rv16uzOC
         gABMGQSlsm3XP6oOg651CQ+fCFUJqRzTm84bN/Qdu1EnacEMzjO+0ggD5Ib/sXrDez5/
         L37AukKdlLzVuT2nSIfIJ01mnTcKkLApkcEwoNFwsWE8uL4d/PpkRP4uHkLSFJmStwFj
         b2X8eEbGxMKLCY8X14Tq+ziS5VURjoAd8Tv4PxVWwCSx3IfEHbZrGPW2yMdTR+2GXkOg
         GVPw==
X-Forwarded-Encrypted: i=1; AKwUvBx3Yv2hBxfqkfyxb+fj97jX4pO//6fKZcul40r5tjh6rENagT8yxI5Op3pBQ2YxKN7kUQfwy8GhzsQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++kbre1TrYHIKWGfSm4GvDviFPT3dOj8U3On2vJfUwC5JrQrpyQZ
	y54Tj3DFcEIzrNKYy0Kp5ZvLP64psWAjR3jweP8fKmEjchY1RiH9VhkEHt0KRsrtqA==
X-Gm-Gg: AYBFou3IryNjYt6QSE/ZqOgPNJ7pjcgDn8+FDtjr0qDKZziKSzbbG/TPpsO4PfHmUIQ
	ywE6xTROkrcgW1NRFXYNUHd4R9jk2Wwg883lfelxAECZZdAgQo84m5Ck2nUy6yP/5UlpNcFmhAP
	d3Dl4qC3grZJv6lSGWUDos/yySXXXa24lffS3WTMQxBFEnt46rG3TMi/PDy5y3INvtKT9CmWczQ
	FX7N1drlRrsmKl9Hya9RvbyJI/Iv4L1zZtJ1bEamNuWiRUMajqkdo9jcaEkQlJodMCDh5HnBTOz
	m4xEQiNMtzI2jr6kawExaEjLR5v8UKRTmXi6b91jez7LzechpMqS4an1O1MOc+mpEX2o+Wby8jC
	IKeIvxvmug5wUqMAYW8l1i9VAGrlOyoLb7IY5l0tVPIH5PwC1boj+avAexdFUCGLLAJPn7BW585
	5Yvio6TPCWvrE9YRc5u+GaK02MR5Fa26zec1qDjIe0CuiYweDp53xYxZ1iQ7Xtm/Ol8JYszf+HR
	j5AW2wCboO5vR53AYGT/NFN6dWgtF4oDrGJr6wRmoaJc6mAARZXD8zwXkNYSA==
X-Received: by 2002:a05:600c:4e93:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fe66d2d2fmr95436075e9.12.1790328300374;
        Fri, 25 Sep 2026 02:25:00 -0700 (PDT)
Message-ID: <480139b0-faa4-4425-af4b-4d884b0d3112@suse.com>
Date: Fri, 25 Sep 2026 11:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.1 5/5] tools: expose admission control toggle via xl
 sched-rtds
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org,
 anthony.perard@vates.tech, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260918080935.35498-6-frn1furkan10@gmail.com>
 <20260918104106.53530-1-frn1furkan10@gmail.com>
 <c959d6e8-3eba-46a8-a486-20a76f7438a7@suse.com>
 <d5e3edc6-2bf8-4527-a341-0946d6292c93@gmail.com>
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
In-Reply-To: <d5e3edc6-2bf8-4527-a341-0946d6292c93@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790328301-754844E9-A0139A7F/0/0
X-purgate-type: clean
X-purgate-size: 843

On 25.09.2026 11:13, Furkan Çalışkan wrote:
> On 9/18/26 13:45, Jürgen Groß wrote:
>> On 18.09.26 12:41, Furkan Caliskan wrote:
>>> Wire the per-cpupool admission-control switch through libxl
>>> to xl sched-rtds, and document it.
>>>
>>> Add -s/--schedparam to list or set pool-wide RTDS scheduler
>>> parameters, and -a/--admission to enable or disable admission
>>> control for a cpupool ("-c pool -s -a 0/1").
>>>
>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Just noticed that patches 1-4 have been merged, but patch 5 
> (which already has a Reviewed-by from Juergen) doesn't seem to have 
> made it in. Could you let me know if it needs anything further, 
> or if it just got missed?

It's still waiting for a maintainer ack, afaict.

Jan

