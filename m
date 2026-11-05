Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F5606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y0khizxp
Received: from list by lists.xenproject.org with outflank-mailman.1474146.1681330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsb9-00022w-Ai; Thu, 05 Nov 2026 08:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474146.1681330; Thu, 05 Nov 2026 08:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOsb9-00022p-80; Thu, 05 Nov 2026 08:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1474146;
 Thu, 05 Nov 2026 08:13:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsb8-00022R-9g
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:13:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsb6-00GuWb-Dz
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:13:24 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3a9e-bab6-0a2a0a5309dd-0a2a4506e57e-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:13:24 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3aa4-195a-0a2a45060019-d1558036cd7e-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:13:24 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso16081885e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:13:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fea181085sm8549278f8f.1.2026.11.05.00.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:13:23 -0800 (PST)
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
        d=suse.com; s=google; t=1793866404; x=1794471204; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilp1ZFuaFXFjQmjuHd3VoFXvmRpQam+c/MOy2R58vKk=;
        b=Y0khizxp8ZDcsNL/96SvX/L8QvowmknzF9DalJgWwXw+UEQgvlp6WoYJF+/Qq0D1b5
         TRGKKIvAKMz/Q2dCNmyQPC0aYk85Dnzq4ncbHcJTk9i+1AeaAi0p5OK+Wq6bGaCSMwHv
         cyrS8Rx0zxE1d8bTqf8RTOszYhaTS0EWwByrPdu8ygv51++uMUN2vBladIxZ/IX9HTtR
         9weoKNp/ZTYV8KcsQM4n67MIcKXsHJLQMmAKH4GL7PYYSKrWkBwrum4TfaMcdoFxyS/g
         J2J/cbO5UhfHWWHlmmsBzIp2+ftTBYaK+k+w4noB54E2P+0xEU0Bqgv8dPmHan03OHc0
         7t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866404; x=1794471204;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilp1ZFuaFXFjQmjuHd3VoFXvmRpQam+c/MOy2R58vKk=;
        b=YuGRRctbIk5nLYoLXCzxKZVn1Il0ujmIug05jMNZ/okcwJiiVzubVgk0JdAuUsSvi7
         qhmjdWTMi5Ji1K6ItOWpDUhldH86pZPTDCYA1WSDqEhcWM6slw0y+9rKzgQ6hKyl4cIY
         2wGtHjQ4JLJwUW/WNlDZa9De9se0DiLYhOwhgPU+j5PHUJGa7uZSP8HEf42Xtqf+OLCJ
         FNsOVRCSgmVxAx5J+NBVeQKyc0LgmYh0G5DueS0SnOfgwOWV7/IOkdnR2yTk/j/RZPPC
         IQvSCLFrHXTWKCCcMyGYaHwcsUbuy54o6nRuhf1aLEOkJniZL7zKlipy2L7nRpc3Flyg
         tUUw==
X-Forwarded-Encrypted: i=1; AKwUvByV2NDHxGxwF5j7WKxmSMaWjGq3T2O9nkzL33wI9bcqw4OUBqJzSfjYOe/EJsM96oeEziJqhWZRijQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/4OyxpdzhW0nQjJHaBgUJyD9CsHDJ0vdUxF7vD1QSon72TsfPa
	/fsUysph4LlmzoGAAs9gZE2ZHsz37TewFTSOd3iwJut0iRZYDhZcU7NWPSVoPwiL/Q==
X-Gm-Gg: AYBFou0+TkHIfrWeBqEZshusVM2Ene9XK11Ue+CvVroZqN8qD64ggMbBDTeK9jueiJn
	FEgqo+2b5WqhsvfwaE7LYcIRjLcOlOHzNaHTg52+RKs3nqoESDfNt//+MCj8jXFssMttzgrEzTD
	XgxYDptyB1AXH1/hv1YlNfMp9YOE06qmnVlM6j26IoFnHsliVVk/B1OGRbIog1F8gKwTQ+Ivx4W
	K0I7w4C4XwS4/TWT+F68YqK46XdfJOCShauYPnl4YeOeNlpbbXSRxxSNghlEbz6i41llj2Q+AIG
	LLfwsPICh05cDlkB+JdJAg9EXp/l1BFuoBUpsA3pI/ZmRuMq5NmfKW4Q27igmLxeXf22VYjrajE
	GNge6Px1Hzvo4zN7NUvm/ixDY/uU8QpHzZR71UqEB+Y2/rGmtgpsaZmHsVd/IrTrKqJaVEI3d1H
	sKrv96uLh+24AdmZRqUInS3HUPJuNrxyLp/p8zaS7LpmlW1z3JnT3TTnJ/f6wu2MSohru/+6eRm
	gfHWrhigY6sTRV4RgVeDrvp8KpVKmj/TFG0sbWFpJJQda9YFTmEoAwce89F3SXQnqNrzUCEb3fr
	kO7ZnHxvLEYwh8UGMlfo5IcxbIxvp7P3haGMiXOOoHFcVyX4t57ivGY7p2LPsQG3yLO4D6o5jjZ
	ekSCAF2Txf3cgRxCI
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr103805865e9.21.1793866403823;
        Thu, 05 Nov 2026 00:13:23 -0800 (PST)
Message-ID: <fdd91377-bcc1-4695-8cb7-b5db1f0f71ab@suse.com>
Date: Thu, 5 Nov 2026 09:13:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
To: Jason Andryuk <jason.andryuk@amd.com>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
 <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
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
In-Reply-To: <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793866404-F6C7777B-042F08E0/10/78276251493
X-purgate-type: spam
X-purgate-size: 891
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 18:33, Jason Andryuk wrote:
> On 2026-11-04 01:46, Jiaqing Zhao wrote:
>> The PID-based device model destruction path returns immediately after
>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>> port because the old process still holds it.
>>
>> Wait for QEMU to exit in a child process after singaling it for at most
> 
> "signaling"
> 
>> 60 seconds. If waiting fails or times out, log the error and retain the
>> existing domain destruction behaviour.
> 
> 60 seconds seems like a lot.  Did you measure the time to see how long 
> it takes?  It's an upper bound, but maybe 10 seconds would be better?

Is 10s enough for it to time out upon disconnecting pass-through devices?
I'm seeing this happen routinely, albeit with an older version of qemu.

Jan

