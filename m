Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B01FC982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:25:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427420.1650116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8d4X-0007Mu-Ga; Mon, 21 Sep 2026 12:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427420.1650116; Mon, 21 Sep 2026 12:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8d4X-0007Mn-Di; Mon, 21 Sep 2026 12:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1427420;
 Mon, 21 Sep 2026 12:24:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8d4V-0007Mh-RL
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:24:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8d4S-006Ypt-RR
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:24:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab121f1-e002-0a2a0a5209dd-0a2a4507ddc2-36
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:24:32 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab12200-b4ea-0a2a45070019-4a7de18deb2d-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:24:32 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso20664165e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 05:24:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc57547easm246167125e9.3.2026.09.21.05.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:24:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1789993472; x=1790598272; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOWzjm9V2HkBkqE5Ilftrs+3ip0tzKvIaFfS8Kt3HCk=;
        b=RkDxwd9ZKaAYyRyI5SI3rzd9E5D2LPdSFvD0at+AxJxHMopY+KKPN7UlAU69kaipnW
         JZ/vZcrnoyv6mdUovMF971YKUPNEb28aazeOBJQ3+65M334BF0G1reOYuN6Y4irrqm3E
         TB7+lZWFiwRMgSBgkTjEgCL+vyHU5oUE19kyym2R+nYDZ9yUqLc2nA81yxP11kgykjYp
         mlmP8VdkmW+CYS2mfYoQYK7JpDtsUBxxfixv+QlbYpcKpUkCaYye0H6Y94hXnyARgQBE
         YsHXDjT6g5Y+LkevQVLzWMs0wJUmqS50NFQvBfPT7ogxUoJj8CYS+tFwMsVMmr6DN8f2
         g0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993472; x=1790598272;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOWzjm9V2HkBkqE5Ilftrs+3ip0tzKvIaFfS8Kt3HCk=;
        b=hV4NOzOw2vQ8QGkNWtUpfQw8fbAfRpf6bbxxpkDZx3JhUSHdQZ5qVHoaAF1WxpKA7t
         vbb1tfbKq8u6gw3yPmr2tkjHmBnWVNwlIJxHYv42+X/DFK0/kUoelUusLx7MqEzMGU6n
         +tUNgxDk7gPpPLDUAAuAv9CYwxisn2Vs6qdG8I9XMwOb2nUo22LkcANUHOpkX2JEqQW8
         5ZvCSgiiqcaNenCIOU7mqwf4koJ7wE4uslwlNQ7KuGGhaGYqhlo5IcasFt81PNMSP+Xk
         iM+jWKS/+yKq42MebvBx19gd19X1uXTinKkO6r6HehGVkG7ndcjUERjVpcBP4kBZNlbi
         ARPg==
X-Forwarded-Encrypted: i=1; AKwUvBwxBQOv8SmvsbseyXrK5BpS2h22nPcLgAGINp13KKrnF6sWdgamrm15uQ2947hu7CmJlnCHbU7JzSA=@lists.xenproject.org
X-Gm-Message-State: AFuF++k4x9H+qAdNKBqvzRfWF24oa0+Lm7tccf4ib89gg1YgfKE6c15e
	2h5C4RvA/dyUC6szoQ4XuxHIRYq0MMQzs/bx/5Ax1s7831Iq3tXwVWKF+WYqHt2xoQ==
X-Gm-Gg: AYBFou2cMdGpNRkVaNWSM06TvjiwKzFFWbzF6v4rKTwTHv0mJdHvq3K4FQq4nGZs1/z
	Fxu5S9lIe3Ls6zA7HHQQyg4Aiuc6QiG94t3p9v3o1dZzQDc5PPWg1XG9t69UgZ/bbyNRBJSwi1E
	lJWRxSXLgwlLYbCTvG4KqiVUAN08qfH2lpb38VjvY9CkoHKWOIdBLQkLF+Wfp/n6Taq86iav9ZT
	6cfBJCybskW807CYrvPwU4R73UsPbG5+SlVrrEbAhCqxAJbNGlR2kt5Z8UclWRETpSV1optWfpu
	85PzuRkVJtn/3tJhYuQ2XDKf8kj9FU4dmfhJ79wE0LgcxuH2/RGXV8LTti1QtQqt24sa+oQgaRo
	qQFwoGMibfiA5netl3AkTQUWUsHuqOsUvKQW12A3moZUCXmxH3KI0IKf/fLH9sNvvD4d85Qc2Uu
	u2Tx7aDCaa8SaRymmNAS3JQXydhY77GeAFJGJezdifC7XLk3hZaDDppuvGClBaD1DmO2Lhw/k3a
	vZnaNl4Y5r+pjW5fTZSyBZXy/rZ8ZxhuIme27pMD7WUhsjffJfStUdAGlOte1g=
X-Received: by 2002:a05:600c:474c:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fc569587bmr157732555e9.14.1789993472118;
        Mon, 21 Sep 2026 05:24:32 -0700 (PDT)
Message-ID: <c75bd621-4608-4bbf-be08-fd9cea6c89a1@suse.com>
Date: Mon, 21 Sep 2026 14:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vmx: Handle TDX instruction exit reasons
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
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
In-Reply-To: <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789993472-A66DAAE4-104FB882/0/0
X-purgate-type: clean
X-purgate-size: 833

On 10.09.2026 16:17, Teddy Astie wrote:
> On hardware that supports TDX, guests can cause VMEXIT related to
> TDX instructions (SEAMCALL and TDCALL) regardless of VMCS configuration.
> 
> Currently, that causes the domain to crash when a domain tries to
> use these instructions in kernel-mode, and emit #UD when used in user-mode.
> 
> Adjust the behavior so that the guest always gets #UD when trying to
> use these instructions regardless of the privilege level that the vCPU
> is running.
> 
> In the nested virtualization case, also reinject the exit reason to L1
> rather than failing on "Unhandled nested vmexit" (leading to a L1 crash
> that can be caused by L2 by executing one of the TDX instructions).
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


