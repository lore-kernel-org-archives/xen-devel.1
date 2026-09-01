Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4BCC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:26:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404533.1638211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1ItA-0004NO-Ln; Tue, 01 Sep 2026 07:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404533.1638211; Tue, 01 Sep 2026 07:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1ItA-0004NH-J5; Tue, 01 Sep 2026 07:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1404533;
 Tue, 01 Sep 2026 07:26:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1It9-0004N9-9Y
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:26:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1It8-00HGN6-5t
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:26:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967e1e-8faa-0a2a0a5109dd-0a2a45088454-22
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:26:33 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967e29-f659-0a2a45080019-d155802bc8e1-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:26:33 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4956869750eso29465625e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:26:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10148sm45772695e9.5.2026.09.01.00.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:26:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1788247593; x=1788852393; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrnB7ehHghPyMBvV43bgAIx2p0LAhKrgbOKYigT7tLg=;
        b=MBrbJzBg8w/0J8kjO05F4Nxjx1ca1EcrmKxkX46H3zV5aQyum9wQHJiO2kTZiWAflE
         Cm7lf7H6yJTVfT2F7wIhXXuEP5y2RUJJCS8sa2ERJArwk57nTwmnkgmuYmkavOVGMO5t
         xpUDOnVZ5C7mlZQsVTV4456FIWhKOCACNS+VKn1tMDQ1XXJJxTAGa94YTic0WDrzE7hm
         APC0RDyeXy1fifIHpHeoRy3ed5GfsymXkNUfXZDjgxffhTW3XN8wov7JQ7779hw1zZN4
         sHHkGe5FAYQyBHvv4nueWbDxx5fTMJ4cYLcOjHayKTFy2bSMDmLcOavu+mdou2tbQdB+
         gBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247593; x=1788852393;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrnB7ehHghPyMBvV43bgAIx2p0LAhKrgbOKYigT7tLg=;
        b=qtYvIgd+ckNrPnx6rnIFTRHoQzP6IqJa6Bkxehivw3RHAoLHmrzM3CsUc378R91xEh
         HmFlm8IZFQS36c3rBU7G2+A/f7ef3vWBx9yFbuYdLgy+z1SPFLxTZ+N1YMZjGJMp6VLU
         8I2kHSC/DN0Cv6wINf4u0/ONimHFOtyhD6bjT3Ww2iBq7V2vPzZa3BeSRz0zXYVYZutK
         jfkTmD7N2fCmXDLybURYZU6u4iCs7Vu+c6cKxd/O1TU/ZEfJDmRBv6tt7bYfROXdGnlU
         wPmm/BS5E53oF3gR/zcvKwJ1MACfidIu+kaCcD11lVWizFdy74/6yHWI/Uho7Mytvztg
         Ikrw==
X-Forwarded-Encrypted: i=1; AHgh+RpfPeku9o1xfBvd3mirjT3rhNhvJjeMKOrYv6nCy023o4G3qgk4kkeDxbFft1CnPRFiRc+XDbIWB78=@lists.xenproject.org
X-Gm-Message-State: AFuF++niYKBOVrwpzG3cfnYdohaaLSsLvdA0jzOt87YK2BOfy66QBrjt
	P2yM3Aq5Gj1vjyk9UUC9igdFibfIdueu0vpMILebqcDmUwn+dWu5vSWMAJIAzTsw9A==
X-Gm-Gg: AR+sD11ATVLrnuLjNYZMLdcjdofIYUKTKH4D0SMCvgrvEOCW574CAjDrT3/hSl0pPrz
	z3vHsV3r9DolWM+CUqd0oJ6ELVRfWIjTv2zB6se/G2ZBmSQdcjYIFx0FxjOsWSO4dg5FRPwTEjM
	JVEozi3kZoCy1+noFyXCiw89esgN4Awbf2FDbpbtx8dMXDbQXn+WVaiyTFCi+ysh+SzXtcAsYCy
	JrlYcrwaXMJ+rA7iQYO6gLwjH91urGRffq4q/lPSbQixxJy061XhAUHkyZTjr8Y34G9ZRTJWjlJ
	ovaCOLUSn5LnYtCfTHD6DuEOVvYYVM1akCf8iVG1tqwiDTwt4BeWBRlDM81wmdiOrkg1GrM49dS
	N3wpxN6BARXegwxLtchZLY0jMa1z4h6bipudmjd0qvEdC+5fTazmq9xTzcom5Mhy8WkfvLgkmRn
	i/eLRHev2dAp3PcfbT6c1B2Nzj04v+JHmj0kyptNDJRUKwhqnN/igbT6iFiBA7DZOQVuFvIe4Cp
	ut/kuzsR89by4IJal5mbbIGzk4Teu1h9NxnF77ErGotWqCbKaok
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr488324785e9.13.1788247592707;
        Tue, 01 Sep 2026 00:26:32 -0700 (PDT)
Message-ID: <351a5219-16e2-4eb8-8cb0-0f5a3b0a3f2a@suse.com>
Date: Tue, 1 Sep 2026 09:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] xen/dom0less: turn max_init_domid into a common
 variable
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
 <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
 <885cb732-1814-4971-b554-9041c35c4347@suse.com>
 <8737a6d8-cab7-4aab-9bbc-d5b155a4a076@amd.com>
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
In-Reply-To: <8737a6d8-cab7-4aab-9bbc-d5b155a4a076@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788247593-D6F5F87B-36794E49/0/0
X-purgate-type: clean
X-purgate-size: 1223

On 01.09.2026 09:14, Orzel, Michal wrote:
> On 01-Sep-26 08:54, Jan Beulich wrote:
>> On 31.08.2026 17:48, Orzel, Michal wrote:
>>> On 27-Aug-26 17:18, Oleksii Kurochko wrote:
>>>> --- a/xen/drivers/char/console.c
>>>> +++ b/xen/drivers/char/console.c
>>>> @@ -31,6 +31,7 @@
>>>>  #include <xen/warning.h>
>>>>  #include <xen/pv_console.h>
>>>>  #include <asm/setup.h>
>>> NIT: This can be dropped - I don't see anything relying on it in this file.
>>
>> Did you mean to ask for asm/setup.h to be dropped here, when that's entirely
>> unrelated? If not, the other change you are asking for could surely be done
> Why are you saying that this is unrelated? Before this change `max_init_domid`
> declaration was in asm/setup.h and this was the reason for this header to be
> included here. With this patch, the declaration is moved to dom0less.h and
> therefore asm/setup.h is no longer needed to be included. I consider it very
> much related unless I'm missing something.

Hmm, fair point. Yet I'm then still somewhat concerned that asm/setup.h may
have supplied something else. IOW I'd thus rather leave it to Oleksii to
make the adjustment in v9, once suitably verified to be correct to do.

Jan

