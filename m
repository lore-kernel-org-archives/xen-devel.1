Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661CDC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 08:03:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401732.1637260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzrYm-0001kz-Sq; Fri, 28 Aug 2026 08:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401732.1637260; Fri, 28 Aug 2026 08:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzrYm-0001ks-PL; Fri, 28 Aug 2026 08:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1401732;
 Fri, 28 Aug 2026 08:03:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzrYl-0001kl-Er
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:03:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzrYj-00DkPf-SJ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:03:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9140ce-e002-0a2a0a5209dd-0a2a450ac80a-36
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:03:33 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9140d4-f2d2-0a2a450a0019-d1558036e4be-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:03:32 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso4808975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 01:03:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dc103dsm30117025e9.1.2026.08.28.01.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 01:03:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787904212; x=1788509012; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cJF/HoN1wOCB58ermvleAmL+gdV99qSTk4qZnLTG4jQ=;
        b=RtIbAWBgUb8tBifYAc/ysU7nUxo65lTAqOLpN5ZhpLjK/Ey0T21fANXlNQXORGSsiR
         +rzX/2gWnoXgI5viHx4g9kMSGqcdg2Z0CnmbtNU4dyJeAmyCkwNeb9iDTV4/DO2vOxaJ
         nKwam+pmBQTxcb5EXCSPDrIr5Gs5Dvo8N474RtonXAC4xYRUPj6tNeDmx+0GKYrc62jD
         6cliKLqQcUBACCkYiz+elIgsnx3pNrbW+GEVE15z/bjydcWozNCAwHKDJNP+9J8kGyog
         86hKoEtyfBwVYhR4bj4iJhSa4SeIfY1RLEJS7KfbAzmA4jgIo/1+2/aYNZBTy10ubSU4
         zPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904212; x=1788509012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJF/HoN1wOCB58ermvleAmL+gdV99qSTk4qZnLTG4jQ=;
        b=FjE3QeIK6/ZTJ3Yw4u2eVMNDhMIIBBmfAgwQkt1jTZTGcDtnv9vuf3cQZX/syHpYWe
         0cXYOW3Fh5UdwfS0jI3KNI9ezP8XZe3gY3LkD66jeADVeehCORrGVwiix377Zy8vkXAK
         WEcCygYy3SHkI/uAUSXmU0JAmHnMsQIThD0ERqJS3AB00PomtqfMkdxTrqOtzHzP03cb
         qYo3fAFx/x8jIXDXl3nbUL7z24tZZ9jbqBHpg/liUGX5e5UGtCtJn/yIw1gzpjMb9H9+
         va2b45jIaeSYfT2x45mtTHtePz6IzfU+E4dSSUiAVBdKoitXfEDJ4URBdetnKJQK1DMD
         tPTA==
X-Forwarded-Encrypted: i=1; AHgh+Rqyal1iW3+Nxbk6WAV1D7XNHPNTOBl+0Ysz2dTScYF2fxf+KncAd6WtYqrjL2jf8DcJjUJ+fvqKL74=@lists.xenproject.org
X-Gm-Message-State: AFuF++nTytTx6OYA/uoSaVEPRuasvk1OdJ9dns6UkEKvQ0CRFRjCTwNr
	INNWwpJdW+UtXxEX8QwDT/kEjETxfK9Fe3xj/z2fBim1Y6k07T5lLc2g
X-Gm-Gg: AR+sD13s3CgEe5oV5ROqHymF7/PU5994GVvyyDFONfu7GxjKDZdM5EfuAcjR0T4aBtv
	LkfUw04ZCXcqtkJWaoXMQLXuRPupVgTq/tq0q7OB5QpgR2IdsjglzV+sLLVSX6C5QeJe8GTIwdE
	GSY+BPGJclQYKEJ9uvcRnvxOqfieiWg7V6lVv5H/+N00fBCvbOdFvy+FdFLLN7t1t/nFN9Ja7o4
	GnJvArTqt1zQvNdcpNLvtawAVxk/DZTXkgDxLpIScJbqvzsXp5geWFvoDlfN6mGgHkHlyyRE+ph
	R9f3CQuA8DhYoe8SxktLpLs2j8HLV/I5i+7P7xBQabTDvesspfJaOWOXY6WgeFFGRxsK9uJnSJs
	tAyKeyCy45SPdTjZBU766/yVqTxKE69bOdn9E9+d0NFghd6EAjTLhgw2GbOJYtXNo0ngjs+GlTg
	unp0WcpxmqyNF4FtXCcLTK88wK9Wfwp0/GPHolBchbHg58EUU9TN+UxTa0WsXUwFaextLKo2gLm
	DbN0LLuwfnnVUo0eFGPm0AIPRG94c7JUdxqS7phUg==
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr57738155e9.10.1787904211730;
        Fri, 28 Aug 2026 01:03:31 -0700 (PDT)
Message-ID: <8c135fde-2e50-463f-91f9-e70007ecd725@gmail.com>
Date: Fri, 28 Aug 2026 10:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/riscv: add SFENCE.VMA after enabling paging
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: zhangzheng@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
 <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
 <86ea652a-69ab-4920-bed7-3e28ce64fb1d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <86ea652a-69ab-4920-bed7-3e28ce64fb1d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787904212-59DDFCFC-60DA45DF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1930



On 8/28/26 9:13 AM, Jan Beulich wrote:
> On 27.08.2026 18:53, Oleksii Kurochko wrote:
>> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
>>>            srli    t1, t1, PAGE_SHIFT
>>>            or      t1, t1, t0
>>>            csrw    CSR_SATP, t1
>>
>> ... ASID isn't used as we are in Bare mode.
>>
>> What am I missing?
>>
>>> +        sfence.vma
>>
>> The one thing which possibly matters here, and could explain why
>> sfence.vma is needed, is:
>> ```
>> Implementations with virtual memory are permitted to perform address
>> translations speculatively and earlier than required by an explicit
>> memory access, and are permitted to cache them in address translation
>> cache structures—including possibly caching the identity mappings from
>> effective address to physical address used in Bare translation modes and
>> M-mode.
>> ```
>>
>> So the TLB could potentially be populated with identity mappings, and I
>> agree that it would be better to flush those.
> 
> First: Does (or at least may) the TLB come into play in Bare mode? If not,
> there's nothing to invalidate.

In the quote from the spec I mentioned above it is written the answer is 
yes, the TLB (address-translation cache) absolutely can come into play 
in Bare mode.

> If so, the next question would be whether
> it's indeed ASID 0 which is (or again may be) used in such TLB entries.

I re-read the spec and ASID 0 will be really used even in Bare mode as 
to select MODE=Bare, software must write zero to the remaining fields of 
satp (bits 30–0 when SXLEN=32, or bits 59–0 when SXLEN=64) what 
automatically includes field ASID (so it will be zero).

And considering that idendentity mapping could be cached in TLB even in 
Bare mode they will taged with ASID = 0.

~ Oleksii

