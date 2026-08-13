Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BE5C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:46:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390273.1630775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXd6-0003fq-H6; Thu, 13 Aug 2026 15:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390273.1630775; Thu, 13 Aug 2026 15:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXd6-0003fj-E9; Thu, 13 Aug 2026 15:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1390273;
 Thu, 13 Aug 2026 15:46:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuXd4-0003fd-F6
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:46:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXd3-00DZxS-KN
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:46:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7de6b2-2eae-0a2a0a5409dd-0a2a450380b6-22
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:46:01 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7de6b9-fae8-0a2a45030019-d1558033c105-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:46:01 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so582215e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:46:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499821652dbsm72151245e9.9.2026.08.13.08.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 08:46:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1786635961; x=1787240761; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeLyY3tc1GZGkQymfgswaTEayfpXt6RYygApgC17uGE=;
        b=Hn13d7B4BkQj/FHV+yQZSwvdH4Gw5yY4a8U5Q1OzpaZyRGeBAa1hOwHXzYx14RBCIy
         7QZOPDarZx4v/2t6FDroPZ76yKy68S+13IUGmvueb5oaDEPP8vKG8C9T39Q1NXy7ka3+
         Hza1aZ0eR112+5T8XOEFrx/oh0RPbZ6ptfCxWGAAxdSIpHWp7jFeLXdjdGhx34UEamkt
         3iDqRjKYyZJDzcYmxeJWbRbHY5MHj8Drt4T1UlstJqG9xzAQuRNkBtF/nDvDmkW8GQiB
         kuVqdl3FFB5XLtDXMZISSTQhKUmF7PWldtpz83k2KpnK/41+ESaoADVxkC1m2co+VsUo
         UhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635961; x=1787240761;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeLyY3tc1GZGkQymfgswaTEayfpXt6RYygApgC17uGE=;
        b=iFIf99T0s3+Uq6cxN1gOoTiVwsG6pLVkbno9LofQK5Npgch+DZ077ACxry+eBRmMD0
         nVwpTVpMLXPr9hGOblTtEceN4JcfSAOWdw4dK5coAUuE5jPtusRnDMX/SZdpLN9WuytT
         sn4fPZ39bvTqwVvwUV8dFdsD2IxlJ7QAOYQ6OojArwKKUOVLl6BPwaalksdikpHMwq0Y
         CL3I/htB3PTwWu/BzN/mOGeMvDU8G3XHpJmZ9BI38EIj9CtS9uxtwL+droBJYbYXfCdp
         T0UiFbBaaaZH6PK8fp+oPsFn7GwhIVQs6hQmvjpm2ubXdolLNts7l4Y7+7GPB5K0kgvM
         HLjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJUz0UYwxmFQpOmD+3vSal+UrOChiaqA7W3yL80BLD7pRXHP6Xbo3rvPBVBgQDTK41x7CS5Xp1x7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3+mfoCo5E4+ohvvO3CLGUEIr68PZyywHpReyLss6JSo3yWaem
	d7mF1J7Cw9VLw394dHpaK8vfnoH8bCdbyqORxvoHrErYfeK4k+rPj5NJl4Xss6gINA==
X-Gm-Gg: AR+sD10kgy9sp+/38oY1FZ4Azf7+Adzs8WIEDm5oJSstX4aspAVxPBSkBoQGPqFrGKE
	pQELYK81wmtStxrvDhP8NTRIlg/ApFpH5GcW6jAUvqFh21rwa/ddE/Uas0kc3HjE9hk8xOXbsPH
	n5C0Ckih2t8ZnVVYAAZ7t5Est55jjW6qc0K5XVaNjmMSqqeKi9WE7Okrr8IweaDpsHViTGIth7p
	rJZAgOV9OfQfDfrGP+pDgffb1/qRWTwcYHGPkaMfNVIfzNUMe/ahFBJ+wbW2OvgI7QiCXIJ0W7B
	+ZvnlR9eYgpwaZAX3kW03POKvp8oZHnRNmFOnzzNmZix8Xmw6w9gw3arpXCo4vw1qWnVoF4zgpg
	cmCO3ORxpxExgyrM/tS0DedEMA9ub797NvucLMCDhyivp7LNa843GEnaEwA1/b9zekuOa8TFsxV
	2qOLvadiduOGr3TwzP1IsseyDBMeStJS42wYZykBXhKERvG8E1h5go6pF+q25/xNhzDHW1zYbR0
	RvnlvcmDJ1Yb2amjNbiAAq0R69NstypjIh49av1EIfSAans1UfY
X-Received: by 2002:a05:600c:3113:b0:493:c634:952 with SMTP id 5b1f17b1804b1-499821aa438mr75304445e9.7.1786635961072;
        Thu, 13 Aug 2026 08:46:01 -0700 (PDT)
Message-ID: <3a4c363b-d847-4fc6-a44e-7484c7f650d3@suse.com>
Date: Thu, 13 Aug 2026 17:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/20] xen/riscv: introduce per-vCPU IMSIC state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <d78555b8b7b683f72a2668d8d2e2da3f89a4fc06.1785836421.git.oleksii.kurochko@gmail.com>
 <efc18770-3889-4d87-969d-c75ad82cfbc0@gmail.com>
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
In-Reply-To: <efc18770-3889-4d87-969d-c75ad82cfbc0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786635961-75C804E9-4D7E2F50/0/0
X-purgate-type: clean
X-purgate-size: 1301

On 13.08.2026 17:39, Oleksii Kurochko wrote:
> On 8/4/26 5:48 PM, Oleksii Kurochko wrote:
>> @@ -312,6 +318,35 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>       return 0;
>>   }
>>   
>> +int vcpu_imsic_init(struct vcpu *v)
>> +{
>> +    struct vimsic_state *imsic_state;
>> +
>> +    /* Allocate IMSIC context */
>> +    imsic_state = xvzalloc(struct vimsic_state);
>> +    if ( !imsic_state )
>> +        return -ENOMEM;
>> +
>> +    /* Setup IMSIC context  */
>> +    rwlock_init(&imsic_state->vsfile_lock);
>> +
>> +    /*
>> +     * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
>> +     * always-available s/w IMSIC VS-file. Only vsfile_pcpu needs an explicit
>> +     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
>> +     */
>> +    imsic_state->vsfile_pcpu = NR_CPUS;
>> +
> Considering our conversation in another patch series vsfile_cpu would be 
> better name. Don't you mind if I will change vsfile_pcpu -> vsfile_cpu 
> and everywhere it is needed in this patch with saving of your Acked-by?

Such a rename won't invalidate my ack. What's important is that (here and/or
elsewhere) you make sure you only ever store CPU numbers there, not - like
you had it somewhere - hart IDs.

Jan

