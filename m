Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9393BC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:33:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428157.1650862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8u3h-0002K9-97; Tue, 22 Sep 2026 06:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428157.1650862; Tue, 22 Sep 2026 06:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8u3h-0002K1-52; Tue, 22 Sep 2026 06:32:53 +0000
Received: by outflank-mailman (input) for mailman id 1428157;
 Tue, 22 Sep 2026 06:32:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8u3f-0002Jv-GI
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:32:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8u3e-003Fsu-Ds
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:32:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab22112-2eae-0a2a0a5409dd-0a2a4509a1a6-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:32:50 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab22112-be1a-0a2a45090019-4a7de14c985e-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:32:50 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f633cd80so1756274f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:32:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774543sm2789232f8f.11.2026.09.21.23.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 23:32:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1790058770; x=1790663570; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TO59/nBjTVigmtq+fqciQQ+MZL7u5Nzo1s2mKXfA8Q=;
        b=fV4cq2ARzFDyWS4Fv3YmWcxyFr/sLUIqRU2cjvZNiQb9DygXVb31qZg9g3KA3aO0PA
         L2MZ0L3dTvuqqxHA/xE2U/e5kKR7A9IpZCYCjzztBjCjP2JHT9912uMMCs0LqPfHfBo2
         swAOLBPhgttHTCoPh3uofXKbztOvLsTNWyARH7ZCDonAshjvxtvXKHI2o3lhpSn22n1c
         lc3mMCxCShGAkiy/AWK9cLwxm1pe2v7uTtPOB0ioflZZl4cCuCwXdGU2qKQt13sEjp5M
         U3wf0/9OvrCLLISG35U6bUQNJusOY8EN5/qYh/IEvshKx34gw8xTBXdif+eSutiT+cj3
         mSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058770; x=1790663570;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TO59/nBjTVigmtq+fqciQQ+MZL7u5Nzo1s2mKXfA8Q=;
        b=tlR+hOWrQaFm+bT0pRh4G9CKRQb19dPhK7VfF7dMXkCDlCQXzkCJPG4nTVRXr28tdo
         XONyBsbuB4pYvienU0gmvNe1V/VAoViQtKrLYnIQqCkhYhmGVQRdH0K5FT/PEDgXCIwJ
         kU+sgYmZmWyIdhGdVQHXeAUytNwh7uUhjt35s8G6nxF94SKBWR8Mxg++E0hvFbd0P0dv
         ESPp+XzJPIs0834RL85xBB2fZV8WMaBBjjCEywBpC2ZxHOG4p0GjdLIltm1Zd3lYyehk
         ra+6jEvKvfo85vOcIeM0XMJJR5AGQWQQHzUumldQBKWX+00VOmB0Oys8kBbyEJpv7csy
         clvA==
X-Forwarded-Encrypted: i=1; AKwUvBwlC7U3zrYsfX3HKD441hQMthx+Qt/mNkmJQq5vYjbbxvXMne12q+7g/JmhwPDCt8DMBAMJZWZCfE8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kjOwx84r77cxfYsp+qOZwPyeVUooXA+dLVIRWh4I4uhMSeBDzs
	36nA/BoGquyQrgKk2xrdWGZLlcHQSxe8p46SgwhS9JReCA4XfcgCrlRIt6iVFfGOFg==
X-Gm-Gg: AYBFou3zvno+oPieQ3t6el8IYqVQDVWRDuUHg5LhvmQTEyayEFhdePuvO5pezM3+N2q
	hc2h0ZycMQ1EVJdhMzIRvd9INXBr0AQk3/r1AqO30hbUNPC2q4ubUoSaHlLyIqWFfWmbjp/BtIh
	QVajFIXNtIRw1NBP5Wy8pTc/IUyw3AoYnHgsz/2nv7Qi5dcYtmuEcJaEU2WQKQqEblnO0/LlpeP
	3Ok2VeXzjg3/Q2h4+L4uB/ECTWjwEie6vfwdllcujKxZ9XKIdzdXX2MSAuTNnph0n19ntTN22AH
	bsCZowfe3bSFN3B7wUv7I55siSs08V9v0hFmRXNEX0TIIimKCpaHoKIwFJnoXJNbHQmk4ntkojA
	YlwF9BhKMbUS3/XxgOVtEmHw6bjcA6AWsKXXDq9E/TUWm6CpnUqrgYUSFJ7QuQEYweptYQzxy0I
	uMJmDRI1/qF+VPJo7kQSlVkjwK0vS315it5WpZECSXGbehctJUxUoI+5dzyU+U859MVzsl+iHWg
	SKX6iqctiBHUcDaqGgT6kiLANhwi1KR+PhiM0/r5PJhjmhr459hoJC+zT0aXw==
X-Received: by 2002:a5d:5d84:0:b0:485:ac0e:6fb2 with SMTP id ffacd0b85a97d-4871e2279f7mr20035744f8f.18.1790058769709;
        Mon, 21 Sep 2026 23:32:49 -0700 (PDT)
Message-ID: <8419536a-5e73-4718-a700-6bce5b8c71f8@suse.com>
Date: Tue, 22 Sep 2026 08:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
 <1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@vates.tech>
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
In-Reply-To: <1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790058770-FD06B034-2E59D5B0/0/0
X-purgate-type: clean
X-purgate-size: 2677

On 21.09.2026 18:15, Baptiste Le Duc wrote:
> On 8/27/26 5:24 PM, Oleksii Kurochko wrote:
>> @@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
>>       return 0;
>>   }
>>   
>> +/*
>> + * Arguments of the imsic_vsfile_local_*() helpers, which are executed by the
>> + * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
>> + */
>> +struct imsic_vsfile_data {
>> +    unsigned int hgei;
>> +    unsigned int nr_eix;
>> +    struct imsic_mrif *mrif;
>> +};
>> +
>> +/*
>> + * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
>> + * going to work with.
>> + *
>> + * An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart the
>> + * file belongs to, and a guest interrupt file index is meaningless on any
>> + * other hart, so such work always has to be done by that very hart.
>> + *
>> + * The local case runs with IRQs disabled to provide func() with the same
>> + * environment it is given when it is called from the function call IPI
>> + * handler.
>> + */
>> +static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>> +                              void *data)
>> +{
>> +    if ( cpu == smp_processor_id() )
>> +    {
>> +        unsigned long flags;
>> +
>> +        local_irq_save(flags);
>> +        func(data);
>> +        local_irq_restore(flags);
>> +    }
>> +    else
>> +        on_selected_cpus(cpumask_of(cpu), func, data, 1);
>> +}
>> +
>> +static void cf_check imsic_vsfile_local_clear(void *data)
> I think the remark from Jan to direclty pass the type instead of void
> could be applied here.

No, the function pointer is passed to ...

>> @@ -699,5 +836,27 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       if ( v->arch.last_cpu == NR_CPUS )
>>           return;
>>   
>> +    /*
>> +     * At this point, all interrupt producers are still using the old IMSIC
>> +     * VS-file.
>> +     */
>> +
>> +    /*
>> +     * Latch the pCPU the new interrupt file is taken from: vgein_assign()
>> +     * allocates it from v->processor's pool of guest interrupt files, and
>> +     * only that hart can access the file afterwards.
>> +     */
>> +    new_vsfile_cpu = v->processor;
>> +
>> +    new_vsfile_hgei = vgein_assign(v);
>> +
>> +    /* We don't support SW interrupt files at the moment. */
>> +    BUG_ON(!new_vsfile_hgei);
>> +
>> +    vsfile_data.hgei = new_vsfile_hgei;
>> +
>> +    /* Zero-out new IMSIC VS-file */
>> +    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);

... imsic_call_on_cpu() here, which in turn passes it to on_selected_cpus().

Jan

