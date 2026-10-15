Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640AACC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 07:16:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449942.1665464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFhe-0007Ae-FB; Thu, 15 Oct 2026 07:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449942.1665464; Thu, 15 Oct 2026 07:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFhe-0007AW-9z; Thu, 15 Oct 2026 07:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1449942;
 Thu, 15 Oct 2026 07:16:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHFhd-0007AQ-5Z
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 07:16:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHFhc-007p92-EE
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:16:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad07dc2-8faa-0a2a0a5109dd-0a2a450bb02e-28
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:16:36 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad07dd4-b7e8-0a2a450b0019-d155dd36b998-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:16:36 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48dd33a7bd4so1313564f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 00:16:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bdc036a4sm55667735e9.11.2026.10.15.00.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 00:16:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1792048595; x=1792653395; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8/VQiu6eoAG4fmUf4GeFTK9Hkh0eoTuflUyr8fi7G0=;
        b=R3EMk3u1/OktDxnzuyRNX33GNhb+YkSBkmL4jVhzCJ+F1mBJAJZ+YbAcmBzYxz/haJ
         VdIJbpVI55hhxWH/XDBpEJAfRshtQ2Hmk86pRgA1sLAST7KAMYQ/YzzC/UQU4s9UtbX3
         2+jLUP1VUAcZQRbeReD5A0ge+0Ll/4MIbzYLnRryFhX5E8bspUfEpPhNoJJRVk/zZEJA
         YdoqwVm9+t2SwNPzyGl78ub8yZTzHXzJn3vrA24pifxgNcIwM7DFBgFjbEqh70JKCk68
         /lBekGEcdqTUMXZBf/ZISDG4CsVH5tW8+mruPYB2SUDM6TUUwyN0tnR3sUFfyriUT5jL
         Vq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048595; x=1792653395;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8/VQiu6eoAG4fmUf4GeFTK9Hkh0eoTuflUyr8fi7G0=;
        b=VmdEZLMdPPkPLx72w669yCltpbzI5vFCB1l3mRF8KY2SSYjCWCa6uLRd2h81ulN39P
         a7oaYWbTFQQ6KOvSHBPtIOuVoBpEE+R84Ehc8gWLkEEd8Kd2RUAljqFi+RMc20fgcb34
         zS+6qPxUBqOIXpGnPgP/1mRscXQqWob2+7aNFzbjH6YqWPmJnTijxrQIcrhtnRpDXSfu
         3bw+aU4nWonh7LJMImpD5fToKacaZNLUWfB0yMv7Up33QOED49P30cx9BL3+Pepao0Xq
         JxlhWsxuQUMLPO1hQ96lpvrd3Stwt/1APCGuAw4umsz7LXqyzwTspOrTBs7EB8fTEvCK
         WH/A==
X-Forwarded-Encrypted: i=1; AKwUvByWpWJAsC2jEuDN0Vna/ftAHi3iHDtyfkWbBalyl7sQEhDIGwYi2L76bB8X0C/4B2vy3jTqaInFGjk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJZh+Gp9kGeH6oEgD6UP+30DxYK3+b0+nK0PhYPPTlvCP5qWbfb
	hlUi3vy1CjZw0L5Ut7Azgy5gdWqBX3lFpuXMJee5V56645cF+dc3A+Ex4xZJkdtJlA==
X-Gm-Gg: AYBFou1s+r2hCd2u/YSFks4TUaoJAiDdTFliAPNUsUHLb9hWvauibW7i5iu6DWAgx0H
	kDHAs7vzB93xRbn7S2u51ziRO19HAU21hNZFUlCoKdI15vOJNylFTsCrNw9i0wGfcjz3r7tHj7y
	tg63sEEhqY7RD8hp+g5NYlOl6Lsf6hQoIS8T1bqlgK3g+7VyJmxJb8nnDdaQjM6A4Nf+Z2F4JVL
	zMSLR4qD6Oo0qmbCGhmsVez2GZT+J8kGBy4KM99vjkn5h4MZAsk8lAfqFYP/uWTv6tkiVW2iK5T
	Dtdll681UT7lFQ3HSfa7Wku7SO6+wrZ8suVxJi1/Bg70/CaU88JusW3x//DkMB0iCjaTFlKzZX0
	YKR9CyYm/ZMVmItb+C/pM9PCrSnli5Levpvh3HjjJD28uafAAISyVvItr4P3miY8eRJlobDLJmA
	sMgtQm+Lbk8wGodZPHMJGlwnFvX0LFOYyXCk9QP3XlZhiAP9q/xBl6Hu22bxpUrfI2wbHgIqsu/
	oqC2a/brYwbjvBAhFWRDptBYifPnn4hyz+HFhcrQLbC1GIXjS3YdPR8PC3Ylw==
X-Received: by 2002:a05:600c:3ba8:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a18e4ab221mr417286145e9.28.1792048595191;
        Thu, 15 Oct 2026 00:16:35 -0700 (PDT)
Message-ID: <b46f625b-95c0-427a-942e-c810616a2e0e@suse.com>
Date: Thu, 15 Oct 2026 09:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <5bc2e923-4265-484f-9236-25a56560e2c3@suse.com> <atBVo8O91QHtxPFI@iscas-ws>
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
In-Reply-To: <atBVo8O91QHtxPFI@iscas-ws>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1792048596-ABED69EA-5AE9C44D/10/78276251493
X-purgate-type: spam
X-purgate-size: 1520

On 15.10.2026 06:40, Zhang Zheng wrote:
> On Mon, Oct 12, 2026 at 02:52:06PM +0200, Jan Beulich wrote:
>> On 10.10.2026 05:14, Zhang Zheng wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -64,6 +64,7 @@ static struct ns16550 {
>>>      bool intr_works;
>>>      bool force_polling;
>>>      bool dw_usr_bsy;
>>> +    bool xscale;
>>>  #ifdef NS16550_PCI
>>>      /* PCI card parameters. */
>>>      bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
>>> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>>      /* No interrupts. */
>>>      ns_write_reg(uart, UART_IER, 0);
>>>  
>>> +    uart->xscale = false;
>>> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
>>> +    {
>>> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
>>> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
>>> +            uart->xscale = true;
>>> +    }
>>
>> Linux'es detection is a little more involved, plus: It doesn't clobber the
>> value originally present in the other 7 bits.
> 
> I noticed that Linux saves the original IER value and clears only UUE:
> 
> iersave = serial_in(up, UART_IER);
> serial_out(up, UART_IER, iersave & ~UART_IER_UUE);
> 
> Xen clears IER immediately before this probe, so I think there is no previous
> IER state to preserve. So I did not add `iersave` here.

Oh, right, I didn't pay attention to that, despite it even being visible in
patch context.

Jan

