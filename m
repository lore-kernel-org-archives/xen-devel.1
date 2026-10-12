Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F423CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:00:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446203.1662269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEh7-0008T3-BQ; Mon, 12 Oct 2026 11:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446203.1662269; Mon, 12 Oct 2026 11:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEh7-0008Sw-7y; Mon, 12 Oct 2026 11:59:53 +0000
Received: by outflank-mailman (input) for mailman id 1446203;
 Mon, 12 Oct 2026 11:59:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGEh5-0008Sq-9m
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:59:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGEh4-00FIOR-MX
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:59:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acccb99-8faa-0a2a0a5109dd-0a2a4505e4fa-46
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:59:50 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acccbb6-4cb1-0a2a45050019-d155802dac70-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:59:50 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so15705745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:59:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19c8244edsm115716965e9.2.2026.10.12.04.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:59:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1791806390; x=1792411190; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmmpCIyDBuwvHjkLzk3Y9dfyUmxSxY9kcRGuz5iGdHE=;
        b=CzjAPUdx1u6yTXuWqPJa7UcGFEekMbN9LsRun2HujVz8d6iHaEgXrIWWDq7JcfzMkg
         FTh/5I+g/sf3Ef4qV4cvocS4VdQ7s9qEobpOZVRyA8a2/S56Mv8x0SCl9fseutdigVCG
         GdQAh9hHMLiDrUB5vpq75ulv8AKeMt+fWDp34qdwrpYAeB8tGPHoj32/hDRe9EhspL8t
         hBykFt++gjobA07qaMoqzTsbpV7nhwHgw/7/UEg1YxdOE4irdO18hbMek1T0T3PwfOpi
         2xXv4WLhs2O8C2qn1UkCF5hU9EUW7PIBYntFjhW0apgmE1SU67dLZ4Hi00MZzOKTOpPU
         qD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806390; x=1792411190;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmmpCIyDBuwvHjkLzk3Y9dfyUmxSxY9kcRGuz5iGdHE=;
        b=GrAXCpp0W/SWJ0LIC6Uiqtryn9xmPZ5gsaGC/1nAPuh/1+r3LHhoXwsQXq5Le/mkpN
         Ef1u3d1bnxgrkNYTzgUHDdVDgJQuUoXGmNkC0PdxqpnjaAHSrg9aITHq/RJMXqQMuPOL
         ZXki0vPK+LtChPaCGLLHGQI7icW9w4XUF27b6WKzA9whdYEV2etT1o8tTBZXZxzsek2v
         APRjk4DpyC6Q3bcaurPFycUZfxwQ12YyzhjxPywlPXXs8/Xy6D90Ch0sL+aaVI5IBT9x
         SUSQzI4kpxVXWHfnK1LkkXR/Nvvgkkq8vG+pI10qa1AUGK4402tqjBaAp0SW0PLXw7B4
         5rfg==
X-Forwarded-Encrypted: i=1; AKwUvBy3oPev3DQ6p8g2oqMwinq+pM/dgw2847OZhb0AlArCg9lRTGClELl90+qRiy0Wi6K6omOFiLFT034=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKQXzhWbLT3WLaG0lhymLneD/QIXtq0Zf2ovwJDJJZl6RPXx8ou
	2/z0mq77m8GBnhY6KpKb2Pb2XwveL+aVliuX1ZawqCNh8Xr7OnlGWTqATmLMqHzjgg==
X-Gm-Gg: AYBFou2qRqSPnIMxpo1ZWf+6PZPnpXG9cu4jH6kuoMPEwSt3pftSkas6q+h6uvzm68T
	JTrYwnAtjY7VnRlgQHJN0c4qxRoWH/YvfRWAuHnKPXK8K7SIvogzvgPQbs7SD6/0F6fpVJQ3OqV
	IlfG3R1CjO7UYt8ISBtYM61PpY4us8PtjvX/XXs5k8VyVXbFajwrATwVEuM7HKx7084zzqj+0nA
	mGkE7v7r6C6pegpRSyxWQHeTexoefI8naAmxKEfEMYy4G+QI/C7LcHpxPzInUvkO5qwPWFD/uUa
	oqnHyM40zJ4ph4H78KsBshKW4JG3mcoMqy1Z23WWfC9C6Rm7qx10Qd0ca/VChFt0sgRunX794Qu
	7W2dBFQL07HGDoWD4/9yzljwXIIlsgDFPTtbQnons5vjRapJomZPv59tGD70VqNLMwsBW3FJPXi
	tKPTFLQ40srVBzyCCYL9UV72C2gTvB/RKFRwwCo3mJn/TROg6ZalJjkyjWCbrNhaINiCWKE/F+l
	g8Vk2RTD/moRF9HwYVXDyG9cHBTEI/YFmUQrXPPZhDue2ZmvlACI6fmQOsDdA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:698d:3044 with SMTP id 5b1f17b1804b1-4a18e493020mr171577745e9.11.1791806389941;
        Mon, 12 Oct 2026 04:59:49 -0700 (PDT)
Message-ID: <4587c4c9-4744-4e96-bb39-d9209b973628@suse.com>
Date: Mon, 12 Oct 2026 13:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/char: add timeout for XHCI console cable
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261009133608.364312-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20261009133608.364312-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1791806390-2551A2A1-73D03860/10/78276251493
X-purgate-type: spam
X-purgate-size: 1827

On 09.10.2026 15:35, Marek Marczykowski-Górecki wrote:
> Do not wait indefinitely for XHCI to configure console connection. If
> the cable is not plugged in, timeout after about 1s and continue boot.
> If the cable is plugged in later, the console will be activated then
> (see final part of dbc_ensure_running()). When timeout occurs, print a
> warning message - it will be saved in the console ring buffer, to be
> later retrieved from dom0, or possibly later printed when the cable is
> finally connected. But, do not print the warning when waiting after
> controller reset, as that may have been called from from console
> dbc_putc() and printing here would result in (possibly infinite)
> recursion.
> 
> Try the timeout to be about 1s, which is way above time needed for
> configuring already connected cable. But, since this part runs very
> early in the Xen startup, time is not calibrated yet, and functions like
> NOW() do not work yet. Use raw TSC and estimate needed time to be at
> least 1s on a fast CPU (5GHz), and possibly longer on a slower one. This
> is not very accurate method, but fortunately it doesn't need to be.
> 
> This also helps with similar situation on resuming from suspend - if
> cable got unplugged in the meantime, system will not hang waiting for
> the console anymore. And finally, on some systems, when dom0 is also
> allowed to access the USB controller, it may put the device into low
> power mode that in some older controllers (for example Kaby Lake)
> disables also debug capability. In such a case, adding a timeout allows
> the system to resume, then dom0 can wake up the controller and Xen will
> resume XHCI console.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


