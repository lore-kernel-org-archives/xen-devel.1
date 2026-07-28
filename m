Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8AC54EFC
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 08:25:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372239.1619621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wod7D-0000IU-P7; Tue, 28 Jul 2026 08:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372239.1619621; Tue, 28 Jul 2026 08:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wod7D-0000IN-MU; Tue, 28 Jul 2026 08:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1372239;
 Tue, 28 Jul 2026 08:24:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wod7B-0000IH-QK
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:24:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wod7A-00GJ2J-If
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:24:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686738-e002-0a2a0a5209dd-0a2a4504e432-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:24:40 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686748-b57f-0a2a45040019-d1558034a44b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:24:40 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso5239365e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 01:24:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45bb2e7sm62771935e9.7.2026.07.28.01.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 01:24:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1785227080; x=1785831880; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAYMBxegxquPWH8lsakcVuIbtocL6e1ZeH4h5g9F8hI=;
        b=FqQwQ9urC2Z/j8+SRGyKfp9wvT6fIt5/MAYg/AhIeN9S1fMQ27UgQwPKoFGK5JG13C
         HQhS7PmF2ob9iFaE3wGi3Em7eFvjbuMtmeOzV6k+bJQ8N5MnCC8cTIOGdzsmza6ddYua
         Hc8xULY4yF4YxXuWsCF+WaOpiTDhHaautMdgKjcqj68keKcH+9bUq27s2eddIU4cUw/v
         8Pv20gROlYJJD2EuCY4ojZ/suneaD5zFBJNXqc0zkiN3NxD2Knv16/ZOp/7v3a/hSxKw
         +7WaWMEFALSx0wRlJ8bEchF9FAoUc0VJvYlsDT03WpV34DUXbz8Tqq9Nojq77ov9rzg0
         9IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227080; x=1785831880;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAYMBxegxquPWH8lsakcVuIbtocL6e1ZeH4h5g9F8hI=;
        b=apn9IARXsUrUxMPRA78M8K2/fslfOMJ+ELzUG0n8T9HU7rQAZX/IXLn8etFz2Ydg/w
         /estFpp2lQu2EDDU3U6rE46FCksGpZc+bU8wDlY9QiPJU4xYLWvUdX0GDnQLim4OIdQO
         t4C/4jTfCnABBXbCaZg55kt6gRt0X19UMg4wZdLTwOqV+cE59mDUSPn7Ty4VNdJ5Nrzm
         KrzcxZ2sWqepltHoDw53wJ6zDEPpFOEpurs0+g4wa4u/GnRuQ4Ym72QGNeF1AB3Ewb+1
         upigOwPRgXYreVm90ejKo4HVPnLRGo1/NoeFASEIGIRUn+dFJJ6alMcAMekjEeaRe13j
         JxZA==
X-Gm-Message-State: AOJu0YzEFmFIqW+Dk3ogrx8LaJLeToCXVtn4RL2qI+mC9nb4/PDnQ0Ls
	iNk5r+6crCr4PuuZNUUoIbtqozYK3OpecgAUIOLm7dom3gsAhoCHMC7nYqVVryTG2g==
X-Gm-Gg: AR+sD10C2dQRkep3uYnj+Zteo1tZPVfpE6ieR2X/ichFgcYXoRQYFNwK37vUm3Iy8Uq
	5zN/DhG2JbbkOa2ABRS7vGGjgh98Jf7SKGeXzcAFsLUamGIJZU+6NGHgEAV3q6scvNW73F1Es54
	mfkWjF4CWNCa0/BkXqJ7cA/Ytx0meic8ACnmMpfk6dZQo3ppqg0CfhCtP7WgqDzGwWOriPZ/d1W
	5j/hSR7Q/UfLOyoAFN2aGnmYa2aSW+cIh0Io5bceFvE4xQbPPqvbPWmfK83QCCfQfBNl4ndILQ5
	N0DdEUpFVXa7oKJCyZk0fdf4ccayYHBQkX9W/RRRKtQ0woKC++3gnPuE2NMkCwU8tKfjiDRFlJs
	JCiR8x1WZwthefRsFHQl3o2sU42bzkQi56FdlXlkAPTsS25bcRNGjeJgdxowQSuGIv5e6qMB3mD
	qhrJGBku2NeQq4ZH0ZGCJyvVSltFl0yfz2WRnqtUp5ZL8h9BLFn4SIndA1ZhNiHkVzPg==
X-Received: by 2002:a05:600c:628d:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-496c658c582mr12428805e9.16.1785227079933;
        Tue, 28 Jul 2026 01:24:39 -0700 (PDT)
Message-ID: <baddc2f7-deab-4727-a688-a6fe30f7fb89@suse.com>
Date: Tue, 28 Jul 2026 10:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
 <amhlnWAwF-AS_sH7@macbook.local>
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
In-Reply-To: <amhlnWAwF-AS_sH7@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785227080-C0EDEB50-40AE5D8E/0/0
X-purgate-type: clean
X-purgate-size: 714

On 28.07.2026 10:17, Roger Pau Monné wrote:
> On Tue, Jun 30, 2026 at 04:06:00PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -2660,6 +2660,7 @@ void __init early_time_init(void)
>>  
>>      set_time_scale(&t->tsc_scale, tmp);
>>      t->stamp.local_tsc = boot_tsc_stamp;
>> +    NOW_good = true;
> 
> Would you need a barrier here to ensure compiler doesn't re-order the
> writes?  Maybe using ACCESS_ONCE(), or a smp_wmb() like it's used in
> other arches?

Aiui it isn't needed here. The compiler can't re-order the two writes,
due to our use of -fno-strict-aliasing. The barrier is there on other
arch-es to avoid re-ordering in hardware.

Jan

