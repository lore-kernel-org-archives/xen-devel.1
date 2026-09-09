Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E6C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:23:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412936.1643213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HKI-0006UW-DY; Wed, 09 Sep 2026 12:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412936.1643213; Wed, 09 Sep 2026 12:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HKI-0006UP-A4; Wed, 09 Sep 2026 12:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1412936;
 Wed, 09 Sep 2026 12:22:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4HKG-0006UJ-6B
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:22:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HKF-00ExDP-J5
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:22:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa14f8f-8faa-0a2a0a5109dd-0a2a4508cf48-32
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:22:51 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa14f9b-f659-0a2a45080019-d1558034e8e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:22:51 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so34620405e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:22:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d1fd58c31sm46583475e9.1.2026.09.09.05.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:22:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788956571; x=1789561371; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVDU/bjjPFMfmCPUgJPWFMURmw36Oro4ApkU4yUs6tA=;
        b=ayF3NdXXf68YMaFf7mRcbx+OhZE4GquDT5G39Z0HnOMCEOyd5nkfWEGjIDWRnB43MI
         8ut2b4mXayCifKHcXDHxMrlBCuxnptTfA6/Wz1+kG2g6NpwF2OtFZw3yoEU8tl8GfwkO
         XwnWJTFXQ+8RUrIYT69wTa/TGOUd5URuXrNrhRAS9L7zVp+uoVaPPpf5ei8glrTZnc63
         VaRjVRNAxjlxFSRCYoroOK8AF8hbfTHuB5f2JUrL5GQ3sTOZb7OdDiNFNl1FmJhKZGNv
         4fMF2u3LzcMY72ZUdLIHq+CZ55fc7PJIpm1yFH4hpDjnl22HH59PxBDN1ToMjQpU7K/V
         pDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956571; x=1789561371;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVDU/bjjPFMfmCPUgJPWFMURmw36Oro4ApkU4yUs6tA=;
        b=ln4WmEx4d1I5zT+a/zb/rUtZqokOIOEOwSN7VhxtIAfa7o2J/Vb24Ddh83XW2rOZmV
         9WFDdQvTVbJuXwV5KhPikltlRJMG2iqlQyn8MflFvP3IiFHM8U7/nNjGwwfJAUVwSR3x
         ND2zYn+3PmB946eJtvuGRKT4FRz6Oz+j2STXSXdU8Q7XASOcDIh93rUVnngFxXPjuTar
         xOLr7VrtkL/vHqXLk7WRbE3Ql/+couiTpnVYtYanKlVEZ9WVz4FOOwGKzMryHiL9DG6f
         v3fQq5gvESYnVgeenYypJYsWwm1xSw5d39mBgWUPevx6bNQ2galS7aBt7ZJ9ecQFa2+N
         C5VA==
X-Forwarded-Encrypted: i=1; AKwUvBwgUgTOaT+aFasluWTFdJkcyz03OJOUlkLcumaLKEafiUierHdz0l89NIDOuZvJs+uFyjPHH+FK06A=@lists.xenproject.org
X-Gm-Message-State: AFuF++maM5BGAblqMu5SQKY1aKAhO3fm6kQpJINlQb2YVQJfY/0eyvb6
	uwquRfwsKKYHxOZXuVTGW2kFhLI3sHp2WAYJL6BYYUuUP9VQsKkEdtmgFNn1j7MqWw==
X-Gm-Gg: AYBFou34OpbCG/zRPJcRBqcNq1r0cFDdrqNNZFbgaAsDzaLRIqH1k5MhjAvsAowhGFS
	Byx3Kr1djq16srUn60+hRvhOa84sENRI20SgZqRudjfBVzsA5roZySZ9H3xPw2KtSX5KI9s3y4N
	TOjN5fMSEU633nSFfMojN0jR+zEEU3XjwBd/Ois2rc/SbhU0sKhbQQkVolwmfhXUci/DpsKibVx
	yymxMCHCeiQUYJZ6h9aVaeB3xsYGb2gtga883kNan6WtcHPQ6auauOlaklSzKa8QZuHc+A8MmSZ
	ZjpkrPwH2ixS/Ct+79MG2EwUeoejHlBJS1FaZB78NuYGI7h+SzoTimmvfc041FXe7niK8sgWQlN
	d8DBbEfd7JPCU2ULoYCPnR90uROTSvmy36i3af7pAqyCJhXggYupZWEPS9ytu64P5m95QtDYcPP
	xpTAGW/wrdziDNa+P2u/nTo2A9SChLj2XNz4SpfYfLl5Cm9fBWljfRXro15FK2yxrEI7hZQPXBJ
	IgOoehWljhXEmePfLXtL6NZBytd3FqY/CnzjCzmGMi8VkWvdH+KoxVY1pctlN22
X-Received: by 2002:a05:600c:3b0e:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49cfc6ea726mr310616355e9.20.1788956570805;
        Wed, 09 Sep 2026 05:22:50 -0700 (PDT)
Message-ID: <40c2524b-ab7e-461a-9113-ceee0560a918@suse.com>
Date: Wed, 9 Sep 2026 14:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type and
 data fields
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <39841f44-2b18-4368-a9f8-7c0db307ff6d@suse.com>
 <09c883b1-38fd-423c-b516-d39865729e18@gmail.com>
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
In-Reply-To: <09c883b1-38fd-423c-b516-d39865729e18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788956571-D514E87B-6DD5891E/0/0
X-purgate-type: clean
X-purgate-size: 2587

On 09.09.2026 13:20, Oleksii Kurochko wrote:
> On 9/8/26 3:44 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> @@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>       regs->sepc = ex_fixup(ex);
>>>   }
>>>   
>>> -bool fixup_exception(struct cpu_user_regs *regs)
>>> +#define CHECK_GPR_INDEX(num, name)                      \
>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
>>> +                 != (num) * sizeof(unsigned long));
>>
>> Nit: Placement of the !=. Also there should be no semicolon here; it wants
>> to ...
>>
>>> +static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>> +                                  unsigned int num)
>>> +{
>>> +    /*
>>> +     * The GPR number -> struct index mapping below relies on x0..x31 being
>>> +     * laid out at the start of struct cpu_user_regs in architectural order,
>>> +     * matching the register numbers GPR_LIST() hands to the assembler.
>>> +     */
>>> +    GPR_LIST(CHECK_GPR_INDEX)
>>
>> ... appear here instead, for this to actually look like a statement.
> 
> I will apply that.
> 
>>
>>> +    ASSERT(num < 32);
>>> +
>>> +    return ((const unsigned long *)regs)[num];
>>
>> What about release builds? You'd happily overrun the array there. Maybe
>> (ab)use array_index_nospec() here?
> 
> num is coming not from guest, not from calculation in runtume, it is 
> generated by assembler at the build time. So it should be always correct.
> 
> So just having the following looks okay to me:
> 
> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>                                    unsigned int num)
> {
> #define CHECK_GPR_INDEX(num, name) \
>      BUILD_BUG_ON(offsetof(struct cpu_user_regs, name) != \
>                   (num) * sizeof(unsigned long))
> 
> #define GPR_CASE(nr, name) case nr: return regs->name;
> 
>      /*
>       * The GPR number -> struct index mapping below relies on x0..x31 being
>       * laid out at the start of struct cpu_user_regs in architectural 
> order,
>       * matching the register numbers GPR_LIST() hands to the assembler.
>       */
>      GPR_LIST(CHECK_GPR_INDEX);
> 
> #undef CHECK_GPR_INDEX
> 
>      switch ( num )
>      {
>      GPR_LIST(GPR_CASE)
>      }
> 
> #undef GPR_CASE
> 
>      ASSERT_UNREACHABLE();
> 
>      return 0;
> }
> 
> Any thoughts on that regard?

Depends very much on how efficiently the compiler translates this (as opposed
to the other variant).

Jan

