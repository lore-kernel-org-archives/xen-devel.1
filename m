Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A8F31E3B
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2026 15:34:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1277922.1563000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wArOg-0006Mh-Jb; Thu, 09 Apr 2026 15:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277922.1563000; Thu, 09 Apr 2026 15:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wArOg-0006Ma-GC; Thu, 09 Apr 2026 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1277922;
 Thu, 09 Apr 2026 15:34:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wArOe-0006MU-T2
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:34:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wArOe-00BkNY-5Q
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:34:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c6ed-bab6-0a2a0a5309dd-0a2a45079d74-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:34:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7c6fb-ba2d-0a2a45070019-d1558033b52b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:34:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488b150559bso8246015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:34:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e1fe0b0sm70117501f8f.0.2026.04.09.08.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:34:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1775748859; x=1776353659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jjpkTm+R04l4fxBGDDnQULEkG1hj9yfEAGXe38dI92U=;
        b=e06TeNckO9MohcEC26plJbaFgG1kyP6LvkYtQ7IHO2ujKRWPYeKLgNaMaez8BqchSA
         Hvs2rfLCdhi+jhhTGSpswRKD0q1Bf4HVL034dTwbYJsxKx+VxN0BOJZGX0Z8hA+aybR1
         FBdl8/EGgxWHfidq5WhPg/EWErk6MRBMbjBsu9Y4raInxrZdiShEf5p5NzW8W3c5uRok
         81BjLXV4U80FDDnKS1M+x7uKMPk7AWlgftHIMenIhJuNjy1SQTQrxfE++BiUgpZedzdr
         5HhfySAHjqncCARFMvr08V89nkhBS8zXt1MlpKdRzUmol3p58XR14JuxfN2SvT5xYcPk
         2nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748859; x=1776353659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjpkTm+R04l4fxBGDDnQULEkG1hj9yfEAGXe38dI92U=;
        b=VTsDLr8H9YJwE/OQ24VQ2tDMWygDHEFunJt4FEfnqg4Q6hWgdCbirqk/F6ggFuJ81S
         slWqwatbNslWKSxqk+NH8lqwI3L8TE9flRRjf+YIzEWmoZIAWxi8xLERko/TOjKijilE
         v+6yiQvw4UGXi6vY1cJhc/smDuh0CV1Xw9RQFS2VNFENbrudl0ZC7sqlZ9wtX2BQmjWf
         /8Gyi68NGLG/ExAN5KDW7bcypDX+ej/KMN9b7AP87Pf0ndnMsJnMrl3j9ud+8a/J10Hw
         Yay5SnwJIoGSWh6twtCmQIvw+e68gaYAnOdXe/Five9SPlK3+9aTudUBx4Aug1S/FuBI
         oOeA==
X-Forwarded-Encrypted: i=1; AJvYcCU5vNKlFEL0op4QRpcwViRfnZgvaq/ll7v4TxmsofZUG6+WGOVHpXQoIq660AKP6tum2232GQKN5z4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywun34DXCaKhItFHNeUD1QqFiIH+6OQTrfWjitJrZQlKaQUiAlW
	LfEQjEVnE26LJ9ppQq0aVphmkdcgMSeFBkI7JQ+6Y8HZn1nFfkDFeKQMDBCsoWpn/A==
X-Gm-Gg: AeBDieuUzYdK/fyjjECOTFT27W96BOiX83HBR7NAW4+RWIXun5B7sJiyMRhSF0Y2KMf
	R66cMqQdHOHvEvjPxj+SFX4ROKomWPxgDss5tr6/nEpT4cmpsY+U7Z6K5p+Q7QDm6sm3TprIvMZ
	t8WDQsd+ga8lD5s7Qo4XNJBudOL5++k1E0xS3F+tlswcXohLg3VZuF5BDSwJKYEq1AJ9Pbp3fL4
	SAHUejmjkLNEo0VdOYDy6lpr0EpeCoRVsLTVBWCA0+vndLnoTyYEU6sPvaELfpAkUT/mm+yC4v7
	yQZchdBhFtAuSB6NZn2R+6zgjD/7dkN9Kxyilox8uPBfGmy+PvqEhxpulFlv9wkoBflRXqLpX5L
	ol2fcFUk1yJ6eheFCaNcnaVypZEOvnSoHlVI9VioawP4NhiXmYx//qCW8yfnd6kXtpL/ZhdRpKa
	sARgwu+yhzcXcC+L5dGaa5HpObar42Jm09SKqtJ4M8UujclAD22skEnxTpJnJbU3+5O6fOak9Ed
	wxOzX+fXkFBJEA=
X-Received: by 2002:a05:600c:6305:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-4889978da75mr352125395e9.17.1775748859321;
        Thu, 09 Apr 2026 08:34:19 -0700 (PDT)
Message-ID: <467df79c-e583-495a-bbe6-4d4b7dc8f0a3@suse.com>
Date: Thu, 9 Apr 2026 17:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <9ac96559ed00257f347bd61b1e074fc3f6ce8a32.1774871881.git.mykyta_poturai@epam.com>
 <d8622bdf-9ccf-488d-af9a-3eccf6fd3226@suse.com>
 <b320e53c-f794-43fc-8095-d5b4b92d7362@epam.com>
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
In-Reply-To: <b320e53c-f794-43fc-8095-d5b4b92d7362@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775748859-8A15541E-A325F571/0/0
X-purgate-type: clean
X-purgate-size: 793

On 09.04.2026 16:34, Mykyta Poturai wrote:
> On 3/30/26 15:28, Jan Beulich wrote:
>> On 30.03.2026 13:59, Mykyta Poturai wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -638,9 +638,9 @@ config SYSTEM_SUSPEND
>>>   	  If unsure, say N.
>>>   
>>>   config CPU_HOTPLUG
>>> -	bool "CPU online/offline support"
>>> -	depends on X86
>>> -	default y
>>> +	bool "CPU online/offline support" if EXPERT || X86
>>
>> Why not just EXPERT?
> 
> Should it be marked as EXPERT on x86? I considered that if the option 
> was non configurable (always enabled), it should stay enabled by default 
> and always visible.

As you say, it wasn't configurable before. Imo that's a good sign that, at
least for starters, we should limit its disabling to experts.

Jan

