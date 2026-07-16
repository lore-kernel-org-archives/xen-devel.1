Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3D7C44511
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 15:45:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364306.1615584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOGb-0006AZ-UH; Thu, 16 Jul 2026 15:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364306.1615584; Thu, 16 Jul 2026 15:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOGb-0006AS-RI; Thu, 16 Jul 2026 15:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1364306;
 Thu, 16 Jul 2026 15:44:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkOGa-0006AM-Ei
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:44:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkOGZ-001D5P-Rs
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:44:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58fc68-bab6-0a2a0a5309dd-0a2a4506e9e2-12
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:44:51 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58fc73-195a-0a2a45060019-d155dd33b833-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:44:51 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47362928f65so6140926f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 08:44:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49547988756sm3155405e9.6.2026.07.16.08.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 08:44:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1784216691; x=1784821491; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9dbz4JNFR4UV32l1Nw0r+zranNunCCnRzqZ7+4x30c=;
        b=SSCmYi+Eps6Upyw5fl7jH3vYfsmgDn5p5X9xHxc4WoCSTuYBWlWRTM91tLTX2cJrnq
         DW2rZnKKg7smU4JeWKyhRH8dvbpfQWlpQtTntQ1tLDQasJm8F9GaKvw6WRbH5xE/eXtL
         rpAXg1Bp7gRng4Ill1yg6OQ5NhOFnpLd3UoNsPPpBGqJ1BgdO9scVn+Ne+F8O+KtHuNA
         bhowlRcsKGCn3pHsab15PTcgaVbLx5NaN8cDP7OgH/ZjUBDWndJyzlCcKQRdWXuQye8C
         h5ujGwsUKV9BMgOJJtt9XjZgO1QMDTPk6jGJavGCbMUTpO0na05A3PfwQ6Ln+YKEuPrs
         8GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784216691; x=1784821491;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9dbz4JNFR4UV32l1Nw0r+zranNunCCnRzqZ7+4x30c=;
        b=Y1slZM7REtbao71UD8fv5rq1fxq7UBT3Blj3jEDA34RGATpbzqsqsJIYMeGUss2y+u
         wrhn3isrcDao8pTAi8RMf4otte4WZ386Uxayjejk1lc3VWKHrpeVpoUb7oMp8Pta5jxW
         N5wzkL6cw4LZr68N8FxEJXi161uNhPE14JPkX+bo0KSFNFF3bsYKpvxeRtl+uAqNb5Ja
         NOAQ2QSQql8VxMqLADLYc6qP9V9HhdlJtdn9Jed5tALHyhc681EYj5S2OThL8y9C5wYz
         n0Da0TQ5Hs1BOOGXSUQUCkHKZ1tZ03tSPy09II+MrpWQgzhf6ClxwdYAo+Tud1hFzIpi
         yjhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSlLACb6rWn7ec2A1nA9aquHZm4DZOqtd3QtqNN9930izPmJlxR7MjV6tNoGRTOo9MFw3GHUR02eE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsFe6OnUhFw8CVWj0c/TjEsfRR7x9d3eZvqq98NURguqRl0T+x
	dnliNi22NVNmHtRDSJdLco7hv9COk5c+kvU6to7BTgmwsCf8wUUOBPPVCE958jd55Q==
X-Gm-Gg: AfdE7clmL9MsW5oKVIHZXCyu7CdDwNclSIb2IyHNVf7hX2xVtQeoI9ou+b3UjcA3G5D
	kYe0CNeTH0TX18s8FCpf1bg5osaETMJLNEexDJXiuFJNMTqdh1r5Ke8vXcsgHDBN+FQL5Tgpbxk
	JPs+uPAUYpCqrBNg6nQIJ9EU1/Hm8SrUDbcaTGENXoqc+Rs/lZTCFWVDX8YHFmzDybweTi4zIso
	MsfUR1TBFTV1F0J4FRBwSWmKyaTf5z2YywBmcWsdyWSqMltH8yeeoOMre1JMeLG1Vy1GLtoxeGf
	o463dIfWtAz9BO6JGJr5MogzJmqizKtqxI5FjQ2m/6f0oTxaYOcHWjn4KYNk1kcoDTEk1wYOQ+V
	fXzhVBjksUAo3zMdPdUSpJgzyHFlEV3EW+HLOIz8g8LTOJbOuIvIG/uggmDJd6UiETe1MIDVYF+
	6ZGp2lIWyjdpKwGtzcjGDpOGQpcyzcliCLPq0SiLyul24DCkJRXyfgs42gRuQTuXTLew==
X-Received: by 2002:a05:600c:1d9a:b0:493:f78f:cd70 with SMTP id 5b1f17b1804b1-49538a01b3dmr123202435e9.18.1784216691216;
        Thu, 16 Jul 2026 08:44:51 -0700 (PDT)
Message-ID: <611f2170-7d57-43d5-bbd4-7aaa46c93704@suse.com>
Date: Thu, 16 Jul 2026 17:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen/console: add build-time rate-limiting controls
To: Teddy Astie <teddy.astie@vates.tech>, dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-4-dmukhin@ford.com>
 <1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@vates.tech>
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
In-Reply-To: <1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784216691-FDA0C77B-1C105676/0/0
X-purgate-type: clean
X-purgate-size: 2362

On 16.07.2026 11:59, Teddy Astie wrote:
> Le 15/07/2026 à 22:24, dmukhin@ford.com a écrit :
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -672,4 +672,33 @@ config PM_STATS
>>   	  Enable collection of performance management statistics to aid in
>>   	  analyzing and tuning power/performance characteristics of the system
>>   
>> +menu "Console rate-limiting"
>> +
>> +config PRINTK_RATELIMIT_MS
>> +	int "printk rate-limiting time window (milliseconds)"
>> +	default 5000
>> +	help
>> +	  Specifies the time window, in milliseconds, for rate-limited printk
>> +	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
>> +	  printed within this window.
>> +
>> +	  Setting this value to 0 disables rate-limiting entirely.
>> +
>> +	  Rate-limited messages are those controlled by the `loglvl` and
>> +	  `guest_loglvl` command-line parameters.
>> +
>> +config PRINTK_RATELIMIT_BURST
>> +	int "printk rate-limited message burst size"
>> +	default 10
>> +	help
>> +	  Defines the maximum number of rate-limited printk messages that may be
>> +	  printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
>> +
>> +	  Setting this value to 0 disables rate-limiting entirely.
>> +
>> +	  Rate-limited messages are those controlled by the `loglvl` and
>> +	  `guest_loglvl` command-line parameters.
>> +
>> +endmenu
>> +
>>   endmenu
> 
> Given that setting 0 to either will disable rate limiting, would it be 
> preferable instead to have a more general PRINTK_RATELIMIT toggle, where :
> 
> Setting it to true would enable configuration of ms and burst (rejecting 
> 0 if possible).
> Setting it to false would set both to 0 hence disabling rate limiting by 
> default.
> 
> And we do something like
> 
> static const unsigned int printk_ratelimit_ms =
>    IS_ENABLED(CONFIG_PRINTK_RATELIMIT) ? CONFIG_PRINTK_RATELIMIT_MS : 0;
> 
> (similarly for burst)
> 
> ?

While I'm not quite sure we need to go this far (it's tidier overall, but
as it is right now the effect of disabling rate limiting is also clearly
stated), there's a security angle here: Disabling rate limiting altogether
must be clearly documented as not security supported. But we may need to
go beyond that, and also document as not security supported any lowering
of the default values.

Jan

