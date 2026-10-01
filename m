Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B77CA5FA5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 07:44:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437999.1656885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCBT8-0004Tq-Mw; Thu, 01 Oct 2026 07:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437999.1656885; Thu, 01 Oct 2026 07:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCBT8-0004Tj-KJ; Thu, 01 Oct 2026 07:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1437999;
 Thu, 01 Oct 2026 07:44:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCBT7-0004Td-BU
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 07:44:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCBT6-00DS7B-8B
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:44:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe0f63-bab6-0a2a0a5309dd-0a2a4507e784-4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:44:35 +0200
Received: from [74.125.225.100] (helo=mail-wr2-f36.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe0f63-b4ea-0a2a45070019-4a7de164802b-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:44:35 +0200
Received: by mail-wr2-f36.google.com with SMTP id
 ffacd0b85a97d-48b0fc598f8so42380f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 00:44:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a023ebe694sm18188195e9.10.2026.10.01.00.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 00:44:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1790840675; x=1791445475; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4n2RxWwCoh6PnTESTZx/CIsuf6yjka1yL2L+4ZsDN4=;
        b=B6gNhddzyOoiBATemoPNKfgZhevevrvkG3Id+xp5HsSqGd/+1WEUxiTiBBY8ht7748
         VUbW82Z9CCFXJCNe673bslLU5vgBUXf8C2bb1HDPkCLMaGb4lNT9BCgZUaT98Gc4Q+Dz
         LiKlzlghWtekTAlc7mJxdg7VXzO8TsK3OiPdyTLk0Y1rP/d9i9qAtQ5/l/0a+uZLTAzu
         is3N7EXSpj/84MWBXVVv0Unr64sfLCgMD+LKhlj4E34EYGI/fVJYIY54wzNXzR4MMv60
         81rpjzaLjNVIMRZPWCKF8P5mMAP/8l/YEwRpmOrEsBNb2D/b9RRWpsExUmEu/q8wArP1
         NY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840675; x=1791445475;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4n2RxWwCoh6PnTESTZx/CIsuf6yjka1yL2L+4ZsDN4=;
        b=z3OBylCQOTZFixCT140vE3jOlftEqs3VVNST6TT3aQnuxIEY8G5+sXvEkpIR1sXrWl
         ORUqM5vdFcFReidJ1mYNsrDwKpamMiK7s0/P3q/Prv2w5EsQfSt8nOH/RLclcnB2Khm6
         cudflNtvnFz8QkHJVIj1iwL7KzoPAtcLc/RKeEzQDQhNC+OzwM3fxzF3oqjtlV+OpqqA
         Yoq5uULQLY9rArJB7oplkUI8VRuZgGI1j6nUb3WLQolG1axwOzAsIlh/XP6vrWieb0jk
         k8x3QN4ZMOLYgLJxpvudCCwknWJ8os/WaDe6cyE08JDJD5mced/7pJDk3vFb3PQRM4UR
         rZpA==
X-Forwarded-Encrypted: i=1; AKwUvBxX5epGElAdLx9ffKP9oOFfQfLWgmZpgrWJQg4IQfqPB1UkMvdsWN0EJUejWWFk2Cal8S7R7M4K21s=@lists.xenproject.org
X-Gm-Message-State: AFuF++n3bP3o7x7apOfUKGRb3YuXw1JQQsB5Z9gQd5+0tc762TN9EsTc
	fLDpIAvQc6Bt6CO65/+LaD6+1jM9nCUzm9yJobCBkXGjizVCMoGtBuV+VbhqcGqMQQ==
X-Gm-Gg: AYBFou0/3jSp1t/QkwTrP7z28h+qipl5tA/rC5U2dGr6SY+3umpv1s64VNGtxm58+zl
	D/JQPgpi+n5zNvG3LLQHgRYod4UXb+aFbIE+LZ9fH1CRSJseFcYDLz5EsfaT81RDJEZdRwxajZx
	3/8Bw+kTA/+eMe0207eOkC2v2o6HEmn0dDsEL+7zfnYVGPTZ4sT/7zLl0TFU6+o5jwgP2irHeR9
	+/EvAfdor0Qddw5rHWz/6AL04tYAMGGxtRk4uIQkzFf0KFjonbLH8LBPitPoeIf2WsiO1JkFOVa
	HyHueL2MwkfRki1OFmwjzW09AtJa3qBeYkLO1UResRTTGyrl3Qv+xyxPqLJgQQwAcZOS6yo1nLs
	rc/pWjZ2AQXICU0c6aXgwUS6rh3k7fPitNBGuH9J7CTsdRi1XBESB3GZ74Vjy8/zxJhorkIuy+z
	wxKcZlpz7dNGTUcMb7Em63IKEw+4SSxOyadP8nWwl06ZsLfpZumt/xRZhWrVXXqLeeZcC7qj+/M
	y5jA7B2nv4RXNih53C12eP2iAc3cmfJH3l8ZjwkgBVznrQkeFOyzRZ8NkqBNJuFD/v4FDjS
X-Received: by 2002:a05:600c:45d3:b0:4a0:53e:b7d6 with SMTP id 5b1f17b1804b1-4a01aff8082mr56251885e9.16.1790840675251;
        Thu, 01 Oct 2026 00:44:35 -0700 (PDT)
Message-ID: <b2b1c078-649e-4086-8d4e-5a7967f1235b@suse.com>
Date: Thu, 1 Oct 2026 09:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ioreq: drop the emulator reference when range set
 allocation fails
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260929170835.964609-1-edgar.iglesias@amd.com>
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
In-Reply-To: <20260929170835.964609-1-edgar.iglesias@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790840675-A6AD8AE4-CC0E7CCF/10/78276251493
X-purgate-type: spam
X-purgate-size: 570

On 29.09.2026 19:08, Edgar E. Iglesias wrote:
> ioreq_server_init() takes a reference on the emulating domain before
> allocating the server's range sets, but does not release it when that
> allocation fails. The leaked reference prevents the emulating domain
> from ever being fully destroyed.
> 
> Route this failure through the existing put_domain() cleanup.
> 
> Fixes: ccb42e0ca661 ("x86/hvm: take a reference on ioreq server emulating domain")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


