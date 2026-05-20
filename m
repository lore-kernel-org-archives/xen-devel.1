Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10B1CD4F5E
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2026 06:40:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1313603.1583736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPab9-0005By-H5; Wed, 20 May 2026 06:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313603.1583736; Wed, 20 May 2026 06:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPab9-0005Bq-Cp; Wed, 20 May 2026 06:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1313603;
 Wed, 20 May 2026 06:40:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPab8-00055r-5B
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 06:40:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPab7-0090oG-HJ
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:40:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d5735-bab6-0a2a0a5309dd-0a2a4509a7ba-42
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:40:05 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d5745-2497-0a2a45090019-d1558035c079-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:40:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso36067425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:40:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab6aasm405073275e9.2.2026.05.19.23.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 23:40:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1779259205; x=1779864005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KYbnqpWizzz3hbTmvk1yGALIeF3YmXmKF0Fupo5IaBY=;
        b=Ar1R+PfjYIB3TU+4im0gT0Ppc1nNoexrFkvAevG1d5Jq3RQOWf9N6IshM6JlN90mtp
         ekQx8TQYKL+Bllcg3tJPL3iV+Tg8v4jJo4LiIpVEzgfTx7HeHhzT/EleyDaLp06m6S5A
         INvRbV6dwGvEqWoQcBQecbEhbUgSrNEhsWcOUq7Z1GhtjI+yXJjcOy8VN0cmWrfObca3
         g8Hbpizuo8LEyzR6d3HA1hDi5mu8OnDFXd4ulnui/36JGvTr0OWYxUqF2vjcvVlK7a/Q
         Q9xRjACPMqcKzQoCG8jBuw9YigSdNlL5VVmJrVqQadKsn2ZaZn0EiDzCVOsV4evGNCrq
         gB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259205; x=1779864005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYbnqpWizzz3hbTmvk1yGALIeF3YmXmKF0Fupo5IaBY=;
        b=JcMOYxfTwyy70oZBFCsair5TRWpWohtex8u+VCRs4qTn+D5tNI+DpI2qVC4rWuAxFg
         Mn+q8RM5oeTLE24E/SEilEv5zqIDDIutGtJJayHyRRJSzwawBLihXbbgxA2rRxFblLGt
         L0bYUL1GxFcYhPNHegUXUVwsEIv0YxrdarjSz+Nd1BT5miy2VuqQIMPDUTwwfT/WbZvb
         0HsCPxyaLkKfg8miEGdR9CWXpWUC70qmFxqTWmkMQQHf7ggg60MC2K4L8jaORRk73qcj
         YuNABjm+c45lWmkDf0U6su04a3yg43M3rgrc0IcFThz75nZ/i8EKx3X5vgWKudP7GPFD
         1anQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zS36l7DZkRjAzShgWns+jiTsrgjO2zB7nlG3WMFupPV6rkf+w8nFXmJPQwIyWVuRIuNiOeijIh2k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIqCn1ts/AUhBQBtE1juLJGjfqxAiZ001B10n6rjT6c28QNOKv
	la+WDDefBqOrIxjM9oyBSiEgWYcogsyeg7vekxlxLQ3PT4lbkdJESx8rutEl3juhCg==
X-Gm-Gg: Acq92OG+8W398ZCrpzN1clHzr2OiBsNoUajTW9wT/7PBgeyZfNZB8eIt/I72x3ExH5Y
	eVgDL1+FsrYszuYgxa4wWeWCnLNxipbDIAY54IetlbpVNLHVb/EZGGkMZAlCo8+kP/+m0acXp0J
	Mlbj6mWtyplAOM2YsY2661sfnlydGnWbDtMTEQdCbIQG0G4WZflNfw7/vpQN05KsRvqAPY+rrla
	RH+d4k8dk/BlmpDx38icROXah58yUO4H4LcLJlrRUnMfD0SnQdKXL4lYOkyNG5QtXKr0cX7Ualg
	ruSfXcVLChd0agCEb1WDFGRAkFDyywfkKzmEVIrUeP9fgwmr7CKf1ys+/wsbI6Ly8A9Dj3Y8JcQ
	sWPCql6JPVrzqG+JQdyUCQ1E2V/YRO2mxu2p43rvBLoUwyBpeCwAe4traismBsUl+uTthmvSXxW
	t01VzK9FJqenooxseeSkRMgUGgDczNW5gqZxGycILlIuuZ3CdGk1DRD/OBnBm5V7IK5Odkcc4G/
	7ZqvV6q1Bnq190=
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48fe61ed21amr364200145e9.20.1779259204878;
        Tue, 19 May 2026 23:40:04 -0700 (PDT)
Message-ID: <5aae861f-38c8-49c5-9881-fcd3a00b8e98@suse.com>
Date: Wed, 20 May 2026 08:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: fix sstc init to write vstimecmp instead of
 stimecmp
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1779207317.8631fc262581453bbf619ec5b2062170.19e4105277b000f373@vates.tech>
 <49d0cbe5-1366-4539-9754-371e9507a54d@gmail.com>
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
In-Reply-To: <49d0cbe5-1366-4539-9754-371e9507a54d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779259205-8816CA53-E18902CE/0/0
X-purgate-type: clean
X-purgate-size: 422

On 19.05.2026 18:28, Oleksii Kurochko wrote:
> On 5/19/26 6:14 PM, Baptiste Le Duc wrote:
>> According to the comment above initializing of CSR_VSTIMECMP should be used instead of CSR_STIMECM.
> 
> Probably, it is something wrong with my e-mail app but this line looks 
> long enough.
> 
> I think we have to follow 80 chars per line.

Just to mention - for commit messages I think the limit is 75 or 76.

Jan

