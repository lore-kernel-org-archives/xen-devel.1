Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B32ECC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:18:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446823.1662919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYdx-0001H9-8z; Tue, 13 Oct 2026 09:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446823.1662919; Tue, 13 Oct 2026 09:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYdx-0001H2-5j; Tue, 13 Oct 2026 09:17:57 +0000
Received: by outflank-mailman (input) for mailman id 1446823;
 Tue, 13 Oct 2026 09:17:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGYdw-0001Gw-M9
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:17:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGYdw-008CJI-19
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:17:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdf734-bab6-0a2a0a5309dd-0a2a450ba658-46
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:17:55 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdf743-b7e8-0a2a450b0019-d1558031e003-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:17:55 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so27293625e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 02:17:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19303d518sm322254105e9.0.2026.10.13.02.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 02:17:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1791883075; x=1792487875; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wb+X1sF4zeDymNFCbZercNQDUON3NVbLmz8q5ryD980=;
        b=Ykw9sTC+rTieT35LxTn8+mR0c+eVlmtBKkLkfJsrF9t0WDKYOT17SJDfJOz2PmZVve
         oW+Zmq3MfsyQeQZBIa0mEvT3l0Bc6hv8K5+z4YMrFJKBwX/+Pl2zOYAusFpcBLig+ouZ
         A+OOOdAxNzq75MQ4wDbvVWucMa3mIiYD1ilYpaVqUzreW7vcO0oE7Pf3fy7B9aYAJGY5
         G6XdGLoEhqLT0TZxkcH0MLwyzW4/XpdaM0KmEtJ9vx9xu3Je5j6FiRJJW6ZVkf/t2htU
         iHwUD06of0yW/ZIBNZuLZ/D1Hw3zoqM2D7Ayuo3ftFSTPuN3Kf6w3l8p3BO0/pwFAppr
         jSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883075; x=1792487875;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wb+X1sF4zeDymNFCbZercNQDUON3NVbLmz8q5ryD980=;
        b=MSo+S1Xq6iAOg3Z3k/2dbfGmnz/SPJ/HpqzOImSFp4M2/HnCCYWtoLfTlfVeoPb+kC
         6++SRyEGdAc9MrATnHq4BayeEOQKPYZw/HYZhHGxKDZ4jDtyRkgt85S/+OSRdyygiKqv
         +6odf0uSzhsJecX0kl8aW5G6NmfuayX9+y1uoVEeIxbjBlPjrMwR6OsWsVeqjUSekkGb
         A9Iv0hEf0n9fZtMFLUBTwDIPKR2pwRjlYMBCSI7jcCL5C497GXp11AUMe5q4WfgC69CA
         mTuubaAXE6mRlpw0bavAoiGBJcW8hvW22okEbFpa2Rbi4L5RdbKkNpbypfQncUFji2Pw
         paFg==
X-Forwarded-Encrypted: i=1; AKwUvBxKVQAqrb2bTWEANUkaz0BAG3npgbzTYiC/D6cy4HhNNXn49eKFjm+VKPJeG6McoeCYWaCWQLjLBZk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJtubaikb0wpRNWCgTWeUe4vyPmKDdvu2s02B7YaGO7Psuuh9FA
	ZIhZ2HMsfH35F5wlijjqfuZNmujwStDPskxfW2MmIih9XVbPhf8HHh/60z44eXSr1A==
X-Gm-Gg: AYBFou0lLldR8VpyszvTRZZ4VxEy3jxEQSJCC2AWEjD6QiE478VnpQy/UQJRxnuRrFA
	LEsZurTaBLi97vEHPawsfCB3yG07a/PvaCFSN0gAFkPSgqZbJzGO9x3LeQC8F9lBcJmd/lg01k7
	7Sy1bmyi16Ztxd7w3fd3dmP4IM+2hkjKVGO2LgkWcjU0ICD+uTs3bjTZwUqcIshQGGoKDzcmM0m
	38ZWuCWnuuLQHOmtloE1Bc+4Tr0JexZMyCCxJMNv+e2Cy5joQ3A39jN4oaCr6xHTkAhc6HxgPIO
	elUEtibtspCqzZ8A2hgQ9/iB0mX91RmKoquL0J9eBPoyDQbGThMaTqRwgdY21ZOkmzid8B0R0hF
	sAU3s6uVsiPllcM2a2SwWYfKd7dLwNDKkLfSeWIK0A7+vgyIOQlxe9WYTofKZHyPCWTJnzOZFnT
	8O8xAn8am24gTUw4/qyMDDF829o4nDokEpOBjZYqy87Z27iN+ZlHI+I8e0QxSkNbLgZ5G03FZBq
	it0TU6sXqw5HGtJcmxM7VEWPZw/G73x84U3raU++l39JcK+Hy6UU/3Lg0eI8A==
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr238764075e9.2.1791883075082;
        Tue, 13 Oct 2026 02:17:55 -0700 (PDT)
Message-ID: <acbc8b4c-0192-4c0c-929a-f532ad01502c@suse.com>
Date: Tue, 13 Oct 2026 11:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] common: dom0less-bindings: introduce XSM labels
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
 <DM3LCK9H20XV.UWY7ZO59FMAE@amd.com>
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
In-Reply-To: <DM3LCK9H20XV.UWY7ZO59FMAE@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791883075-198C19EA-401DE54A/10/78276251493
X-purgate-type: spam
X-purgate-size: 751

On 13.10.2026 11:09, Alejandro Vallejo wrote:
> On Mon Oct 12, 2026 at 12:15 PM CEST, Sergiy Kibrik wrote:
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -823,4 +823,11 @@ static XSM_INLINE int xsm_domain_resource_map(
>>      return xsm_default_action(action, current->domain, d);
>>  }
>>  
>> +static XSM_INLINE int xsm_lookup_sid(
>> +    XSM_DEFAULT_ARG const char *ctx, uint32_t len, uint32_t *sid)
>> +{
>> +    /* dummy policy has no security contexts */
>> +    return -EPERM;
> 
> nit: Perhaps -ENOSYS? or something like that. It's not that any
> permission was violated, it's that the real version of this function is
> absent.

Yet then still e.g. -EOPNOTSUPP, but certainly not -ENOSYS.

Jan

