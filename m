Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6A606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O+b9vChP
Received: from list by lists.xenproject.org with outflank-mailman.1490254.1691187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsB7-00043O-GP; Mon, 16 Nov 2026 08:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490254.1691187; Mon, 16 Nov 2026 08:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsB7-00043H-Dh; Mon, 16 Nov 2026 08:35:05 +0000
Received: by outflank-mailman (input) for mailman id 1490254;
 Mon, 16 Nov 2026 08:35:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSsB6-000437-Sy
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:35:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsB6-00HNkQ-9D
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:35:04 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac02d-2eae-0a2a0a5409dd-0a2a450ae898-30
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:35:04 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac038-f2d2-0a2a450a0019-d155dd2db8d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:35:04 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48fd2e38825so1943646f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 00:35:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c6d079a2asm18767179f8f.16.2026.11.16.00.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 00:35:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794818104; x=1795422904; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dtmaPidFJs1rZjWJU1CFBFrx2C9lFDjszE3vZEqEzu8=;
        b=O+b9vChPJmFDDBr829EUcnufJye1vOSTidC13i2MeL/tU9HFhE1CYjz66/lMEZ1og2
         TykJg7mFFtKKZqWCSB189WZWCtbmNJ6MtAK7s9X637rh0D1DSbDQ5n1GhT9FIjTwon4h
         Q9JLNWjDoOLp/BnGePws858mqBgjqs3JwWIRyVRpjelKu2CtWBSwDwsoVB8o1m1REkwC
         XccPDOLVmYztSw24mPdDv3783ElZDKHLwDt/L06mJ8XN4Ryf0oDGIAX4xBiLJcwM9Phk
         UOflqsDxGEafUk3Eg3IIltcLnEAivpnhfjVKYLG3EE7nzpQuQ3VCkJTk6gcTVAR093oZ
         fUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818104; x=1795422904;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dtmaPidFJs1rZjWJU1CFBFrx2C9lFDjszE3vZEqEzu8=;
        b=IkHurY6Mm+VbLHz1KFzmAyyXti7ryY+wVeIvgTB1PxSF/OqCuGiVyfpKTDCOmVQuXA
         NB4doL/qaQ4JLRTeuD1oWzD+bl8VEosVfKT9G3F7YjHr2sVpBy9sTrnUnj66t7vvRw09
         Hipliuvv55j4qtIBmMAgvada156uXTtUplE9QZwxvAYgvfq7DsaQE+iJ21DXmKiF10ia
         DzYBNMZcueUlvz+lShTz+p22hs9V2+SGO7xiCjxzVmGIIVae88Q+30u4hx7XtZley1r3
         3kYNlZ+Y+kVLTc4cGKchYhGXIXeHATqgx40gRyx978VAZ5SWlfBZhkZsG4xmDfG8/7Dh
         cbQQ==
X-Forwarded-Encrypted: i=1; AL+hErHQnP1ig/4noib2FKP3nvAx3gDO8QlDTsmneygEbS+gH7gtiTVf2z5/PmRw1qV2SrlLxmEF3T95eOI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/ZJHr2Kv+1UkVdrxpDVWUjd41lKF6xavGb3dHf+70wVQqWYTm+
	asSFo7MKP2SCNw+6D8ssgXXvlxmVaTE/zM2SkiMfeqyIMx5KmGyV5h+2X2xqRaNXgA==
X-Gm-Gg: AZFdTZdqZ1GeC9bdjOio76AbCcN1dsRq55vgFesVhi69v7ls2i3GaSx22PsKcS6KvxJ
	Q6nSbvpchJ4cbFtI31enaap5HzdyfnX95tmO/QYKbgrxPAbNg5s3s5c8mK1QaQwMQ5XkwoMRwH3
	oh0CcxTtRJweXq6hDXz57WgIrs2eCjdF9IFsHGvEWLVl45Nw8ffofvwdR07ZwTgrVeFdJFRN1wv
	gDYp00aHy3zGss009mJNCwZcHEuhdfTqal770BK7w04D/carCMXCZglZAJAzYoP/yaeBrBqt1nN
	zfidrnZAYYQNteVpGQLNRTTUGOI4buO113fhfPaEmWPHYmdfyIP4h/gtEWENoXJgcJpIUQtrE7J
	nKmLsHNfGxBpdCwuWOIAerofUCIRwtNsYOXlfspLteJcisUKdgGiZeb0LO6RpdVKoxBCIdvMs8q
	9E10bX3mfh+YgVW4owAMDiaDkqmlezJElQy76VEsOfCji0ncEb/6T41uz8jADh9BfPwakQB1bCP
	bLLFgG9uc6xJQk2eFXHB9dOMWw1uhHjd/zSXNMYHIOS9uC5E0WxpShpmHyqPzmsy7YzyNHF3zu9
	3YqmxDhbM/whlpnnrrS9NjDbCOg2E3UhB7XVjsvh+Y+QnRkFLlJ1QBzMiNIKVCND4F8PBKL10Rd
	CK+aTl+HOShhOvkJK88sxbb9MMwMb8PDUs6el5Q==
X-Received: by 2002:a05:6000:4a07:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-49c70de3590mr20359396f8f.15.1794818103677;
        Mon, 16 Nov 2026 00:35:03 -0800 (PST)
Message-ID: <e1b518e3-f39a-4529-b367-3a767063e8be@suse.com>
Date: Mon, 16 Nov 2026 09:35:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/aepi: Fully remove dead code
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261113121850.3423155-1-andrew.cooper3@citrix.com>
 <5e3c152e-d483-475b-b04f-87a3314e966e@suse.com>
Content-Language: en-US
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
In-Reply-To: <5e3c152e-d483-475b-b04f-87a3314e966e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794818104-504CFCFC-ECB83EF9/10/78276251493
X-purgate-type: spam
X-purgate-size: 456
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 09:34, Jan Beulich wrote:
> On 13.11.2026 13:18, Andrew Cooper wrote:
>> These were marked "currently dead" in commit e681c0408564 ("ACPI/ERST: fix
>> signed/unsigned type conflicts") in 2014.  They're no-less dead 12 years
>> later.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

With (nit) s/aepi/apei/ in the subject, that is.

Jan

