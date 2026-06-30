Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF952C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 13:44:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348953.1606740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYkh-0007Tu-PW; Tue, 30 Jun 2026 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348953.1606740; Tue, 30 Jun 2026 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYkh-0007Tn-Mi; Tue, 30 Jun 2026 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1348953;
 Tue, 30 Jun 2026 13:43:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYkg-0007Th-7W
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:43:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYkf-004dr0-BL
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:43:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c7f8-2eae-0a2a0a5409dd-0a2a45029124-46
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:43:49 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43c815-5a27-0a2a45020019-d155802ee02f-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:43:49 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so39010735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:43:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bb13b737sm35158035e9.0.2026.06.30.06.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:43:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782827029; x=1783431829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ssIeZPQ8k3eu/Xjr/6Cy1/vk5iru+MbzHzrBmjfLc+s=;
        b=SxTgPZG5heeyqtz2v6jvCiVy02w/4Y70gXy62xhU3dZIeWs1bBQg67EJhvPIh/iTZu
         d/9vm4LqtW5ZV1SWnkd8/VDuhvp2YqIcELiGCO1UDCacVy2JB0FchjBs8t7eqmqZSuST
         Mrbnhnfeyka/RzVGwrhcNpBSF7/8SR4WBsj2x4pgmMyBMaSb3zulfw8GnPCT+gCF0HvN
         Fhy/zR2ANwYHAPrcJDXGUSOcp9RpiBWmWSplUY5+47dZLjvvN7fWur+5H2foeGCVVcdE
         iRLFUvMFZYwzCjO3mqgrAvfaMxBPiwe7qJ+nHMoK8dwV3x98o1ZjtizTs6Bx58RVTPZz
         b1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827029; x=1783431829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssIeZPQ8k3eu/Xjr/6Cy1/vk5iru+MbzHzrBmjfLc+s=;
        b=PK2Ci++7L7Em4YzHqJOIbdDsPsCjn3yLMjMIJYDYQDSkl0Xdb/HXqwT0GzqpSMQSO/
         4BDDQwGlcBza1nZ8fvvCBiYQbQhCdfhZ4xtcRLNtKtTwEz+taHdEqrErZ3KeaTEtxbWI
         XqoH/MW3661Xebt3AkBbEpzj4Mg/6KErDyIsA8Dd4w9N+Tvvu8c1w2tzapRaU4GmVWSX
         aThC10g0Lrlrz/u4uStoizpH9Hc7hjgySYdIPDC1z+dkyLUQ3y7JohAUGgHOpjmPD1D8
         i3Gq7NHzLIqI7/fnEqEdMkrCP9KvyyKQr7ACAqDsLD39xdFsDaIxfvqBPA2HY6+9dbCa
         0OUw==
X-Gm-Message-State: AOJu0Yy7NQwrkybViUAheVwsA0BeQbkB+iO7TsLFR8R5WjbMAykM0bh3
	IQRE5mldVh/d99OVkByP5Jg1Yd+znIEhjQX6/76sO1Ok+1+yYPbbsnv4fIUpHojl+Q==
X-Gm-Gg: AfdE7ckfXQgQ+r4Sn6YUL+a+By83idEIrniqVQr2TudsgtGxtmnM4eYKeQ2xfIkKGv5
	0E7ryDeBD2JlvxtInts62TXw6sAPA/yGXKgke7Swa8fT7APv2099og5KfU//5pbxmUTv2vn4skP
	60ZUawdWRvFLxsW6EnJ7C6b9ajukDzJi1DtSIcW6oDg26uhOWfSIkL0eOxxWpIENJXV0X2S4bxx
	sWRdoWaEUFSjW81vwKJeCzPos9N4KX6iQe3iKYVBElTUArrsCZNlFye4APeCZ6+7PxhuBIZm4m8
	1PIkqEXGBHa5xUhwt/30cqGX5EMoms0NLzWnXDkKwG71+WZZrKRFqnFnoMHvjufa+JL1H4SheZy
	YGKvWKijXI8F9sqDeXfoswDB3CZwh6EyDFBZvcuFBPS77JzAgwmXmoUMS+t/xZX8TVMuswJ2l9i
	WLUueAf5QRjkaCCDiSNBqmXTVmehaTnOGMATXBzomp3PMEVZVRoesDVyoskiMoHsPWJLCr+kAaF
	kwy
X-Received: by 2002:a05:600c:4ecf:b0:493:b6e1:99f4 with SMTP id 5b1f17b1804b1-493b81471e9mr58154335e9.0.1782827028752;
        Tue, 30 Jun 2026 06:43:48 -0700 (PDT)
Message-ID: <140b91bf-3509-417e-8d45-1f4ce873d52b@suse.com>
Date: Tue, 30 Jun 2026 15:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: kexec is PV-only
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
 <akPG_67-QSnYfKwV@macbook.local>
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
In-Reply-To: <akPG_67-QSnYfKwV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782827029-4C5047C5-AFBEEDF8/0/0
X-purgate-type: clean
X-purgate-size: 639

On 30.06.2026 15:39, Roger Pau Monné wrote:
> On Tue, Jun 30, 2026 at 03:35:12PM +0200, Jan Beulich wrote:
>> Kexec is of no use without its hypercall, and that hypercall is wired up
>> only for PV. Allowing that code to be built when !PV therefore results in
>> a lot of unreachable code, violating Misra C:2012 rule 2.1.
> 
> Do you know what's missing for the hypercall to be functional on HVM
> environments?

No, and since I don't know I also didn't mean to take on enabling that mode
of operation. The Misra aspect, otoh, was simple enough to cover (without
introducing much code which later would need undoing).

Jan

