Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95381CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 09:27:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446038.1661971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGCJY-0002FW-IX; Mon, 12 Oct 2026 09:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446038.1661971; Mon, 12 Oct 2026 09:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGCJY-0002FP-EY; Mon, 12 Oct 2026 09:27:24 +0000
Received: by outflank-mailman (input) for mailman id 1446038;
 Mon, 12 Oct 2026 09:27:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGCJX-0002FJ-7F
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:27:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGCJW-008rzM-Jm
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:27:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acca7f4-8faa-0a2a0a5109dd-0a2a450c89c6-30
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 11:27:22 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acca7fa-f479-0a2a450c0019-d1558035a899-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 11:27:22 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso19322955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 02:27:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm280466585e9.4.2026.10.12.02.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 02:27:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797242; x=1792402042; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+R+Ozgj8ePuSD4uGVGZV2JHC5UGWebd97SVsY/IAlM=;
        b=ft2EWqTjqNh2hTr5PM+vrcfk96c8ioZaSeOOwdtp7EMU9fJOj+EO6wukL1jcjtJtpJ
         LXb/DLoTSOOJ9jHf8Oj75o56wZRznwREGAiEru/8q+rjk2D1j0hc1UIiRYcHrBkisB3s
         CZCBqWd1JDnw/9FnH7KuIm/wMQ1TCEzMvJme2WOU/EpGb9lDJ9NGMHkZuk/PXgK8sVXO
         iHWuw04fAdQbiNeDmrCYl31sG75/gK4TxlHxLqUfU6tLkyBGx/8eGca1VRmW2jEd52GL
         26imIIgmY9jYOe9vNhiw+mlBk/tYVpuHJ2MZlvT2zeRg9T8gARQ67u+PAYszG6Cgp2UY
         OJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797242; x=1792402042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+R+Ozgj8ePuSD4uGVGZV2JHC5UGWebd97SVsY/IAlM=;
        b=Dfzknew8OxTzxaCw8Xl3vO/WTf0iwv3qlWaQHRZ9oZdxwlN39gUIlomOYg/v109EPJ
         sonYXZOUeyRD/ujyB0DcxnU1rftBFZ62TS5pWsl6+z/+P8GlkReWnEgS0X4yZjCm7EhD
         fQw+yaMtDW6X1Rx8ohxySND5qitkTgMSCaLYwh63XhK/1b2yjw+aSW37C3pDyD7+ImZ8
         z2TdrKTYW+Zut0SZGJ1BukVyr714TwGgUmnu4iQ95ID/rRUdUrGXgYVMSjAXWJwuMpD9
         BTK8l3dqhDA5Gc8Vpu/YgL+Y80WKcNzU2Dy0plqO2rk2Y12J7lKQGk/GvwLhDMX8bslD
         N9wg==
X-Gm-Message-State: AFq9FYJCb2LScLsw8JCEUto1b042GeNepVJZbGrYMafuHaDxm8Q7tAim
	1NBqHxBdflwr9811nlIl36ANh5eSVD5GP/xJCYHqkZBVynsERbdgMuxI
X-Gm-Gg: AYBFou3xliskcOG/A9Jb7xy35VYBLuB5u9aGaPqmEFIb57RVy56g6WbdJ1Mn/0Hqfx3
	YD41fZI6XQKh3E8GqweSCaGDqFrhXB5VivZ8kqY8R9gmklNX6/wP5t6lhatpLQqvR3g40fbDp1K
	GHZW7xhpRUblMhguZ4UUImkNx6aLj4IZVaezAOpF9+kyIJi2Oy2+gfpOCHKgmVJFTp39NqvgaIg
	KMX1aTSjHIkX3dWx92udmAZyuE2ctkGCKcfnR5s02/r3pJnuJLMaUZSJpoue+QQfQzyUTq5q756
	ZDvEhwmX+A2nK2cGma2GOMhTP/GY9RZwcIYeSFlH7fkx/DIIalE4Uj9KohHyoj0BVjEbWH+elG5
	cyaXdoF7ua+aVXLQDwwL94105ncKmIjXSl+4UUmCrh4kK/mr3DN6NqTtN9VVRbA9AytzSRpcckz
	5Uu0E92pabxzz8eyO2U6HOrExFVWiA4M+BZjUB/TQ0QwK27Y6MuID48YZHHqExMR0LYLshK0km1
	VYiVNhqANRyjgu0JkiaU1d0GprFJRYtvcYT5sowmTRRLHZZwQ==
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr161117315e9.2.1791797241821;
        Mon, 12 Oct 2026 02:27:21 -0700 (PDT)
Message-ID: <8b6d4953-07a8-4ba1-90d9-351032c95814@gmail.com>
Date: Mon, 12 Oct 2026 11:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <1791670290.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791670290.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791797242-76EDAA5B-C6E2FF19/10/73395122804
X-purgate-type: spam
X-purgate-size: 3052



On 10/11/26 12:11 AM, Baptiste Le Duc wrote:
>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>> index 593d208483..953d166314 100644
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>       /* No interrupts. */
>>       ns_write_reg(uart, UART_IER, 0);
> Do we know of a UART where UUE reads back as 1 whatever is written? I
> could not find any such hardware, so I am not sure the check is needed
> but it might be wrong. If not, then we could drop this write but if so,
> then I propose to move it in a dedicated function:
> 
>          ```
>          static bool ns_is_xscale(const struct ns16550 *uart)
>          {
>              /*
>              * We're going to explicitly set the UUE bit to 0 before
>              * trying to write and read a 1 just to make sure it's not
>              * already a 1 and maybe locked there before we even start.
>              */
>              ns_write_reg(uart, UART_IER, 0);
> 
>              if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) ) {
>                  /* Now we are in a 0 state */
>                  ns_write_reg(uart, UART_IER, UART_IER_UUE);
>                  if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
>                      return true;
>              }
>              return false;
>          }
>          ```
>> +    uart->xscale = false;
>> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> 
> 
>> +    {
>> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
>> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
>> +            uart->xscale = true;
>> +    }
>> +
>>       /* Handle the DesignWare 8250 'busy-detect' quirk. */
>>       handle_dw_usr_busy_quirk(uart);
>>   
>> @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
>>                        UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
>>   
>>           /* Enable receive interrupts. */
>> -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
>> +        ns_write_reg(uart, UART_IER,
>> +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
>>
> Every IER write has to keep UUE on an XScale UART, otherwise the UART is
> switched off. Open-coding the ternary at each call site makes it easy
> for a future caller to forget. Would it be better to add a helper, e.g.:
> 
>        static void ns_write_ier(const struct ns16550 *uart, unsigned int val)
>        {
>            ns_write_reg(uart, UART_IER,
>                         uart->xscale ? val | UART_IER_UUE : val);
>        }

We could avoid ternary operator here:

static void ns_write_ier(const struct ns16550 *uart, unsigned int val)
{
     ns_write_reg(uart, UART_IER,
                  val | (UART_IER_UUE & -(unsigned int)uart->xscale));
}

but it is less readable...

~ Oleksii

> 
> and use it for all futures IER writes?
> 
> Thanks for contributing!
> 


