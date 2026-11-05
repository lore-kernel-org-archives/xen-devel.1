Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A512606A329
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcvclZ7K
Received: from list by lists.xenproject.org with outflank-mailman.1475246.1682092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0WV-0001jL-QF; Thu, 05 Nov 2026 16:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475246.1682092; Thu, 05 Nov 2026 16:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0WV-0001jE-MM; Thu, 05 Nov 2026 16:41:11 +0000
Received: by outflank-mailman (input) for mailman id 1475246;
 Thu, 05 Nov 2026 16:41:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xP0WU-0001hw-FM
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:41:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP0WT-00Efq7-SS
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 17:41:09 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aecb176-e002-0a2a0a5209dd-0a2a4504b4f8-40
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:41:09 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aecb1a5-b57f-0a2a45040019-d1558035c536-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:41:09 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso16188575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 08:41:09 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e58fcc6sm140773205e9.2.2026.11.05.08.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 08:41:08 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896869; x=1794501669; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My9+F1xNt+fGV/uocE/2p6QDB4njnXMZQHAomdCWdiM=;
        b=vcvclZ7Kbzg6hYWtVklAdQ60VoJr+v1Cp6NFGn2rHUsYgH12qALX6Y5d7zfPCQ/7Hr
         naj01G2Eu1+xPtlGPg9xqV1lJExf6PUQue5BUv0pnT08HsDQUG4hVj+fp1w051upcbQY
         YGU+4xi1GlvBp+pfdW7uid8HNFKQsPBmBfmVdU+zhBdw2CiAqNnaQYQ2WqnOKZoIEc78
         +JSCaSoMVM1EzhX3Q93hrotZrqlruDzIWqal2dMaZGvo8+jZpy0EEElbVeBeqDovEeMZ
         wxpuLCJtc4u33ebd+0S92msCwGiT4nmeIrSr7dSj0teYAf9LU+uU+uOwmqAFiE+EnxKx
         l2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896869; x=1794501669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My9+F1xNt+fGV/uocE/2p6QDB4njnXMZQHAomdCWdiM=;
        b=LfafE6qFZ7tOr92U5c04IIUp76DlzOCl2srOY9m35BLSDvT6Y8jJ3kfw4nRpNyYFIS
         L7zNkJBUUT7yhqutkxYkH9TcMfvKTlJuM3Ba1Z8lBERM5y+FeYqIko5eAwIDxzaiNDst
         BQTnjaK+0+Jxa+ZJDMgBdmePjpRHNVq+wl9PUeOU56aMcdpjj30UMHBFLKDXEOE+CjM8
         OMLF24ePEf786qr1JyHwJ5fKFDnDCnDr4gE3x7kcNpNeJcl6WfbbEcOCJjMySAESFoiu
         20Ho+1Y7OJhxz1vD/8SNkx55IATDKCxpKtd03SaDLEn64uGkIagIc/Z0wIz30qIH1pdX
         nJ7g==
X-Gm-Message-State: APuU4Z/Wn0YD0MPIV9MEaxsMk6+BUKD7hagrDJyOM9vr4lK2NOkfhj5D
	vbNa9u+E8Lt91gXANNj20MHyHOBaSvb9IjvnLz6i5vXmEcRABFBsclYH
X-Gm-Gg: AYBFou3rxx17vpOxW03bnU3FzX1DZ8yURiWTsc9PKQ6uJqoM1Tw6VagOS6anIvkDLUr
	7c53vK5WlT+MC7ZhkE8Cu3JMooXagpXdTfmaL8HioXnsv4zyv97G5/9i6vClVB6NJPD0d7BEt9u
	XkjbLZF9euYEKRRXxkvHIAHmvQnbrkdkkvtG39XpRWwdPAOM9QPCA/B1ZvyRweDtR8MYmlWe8mh
	lS/h41Vd6bw2R9uQYr2c2xQfXNl0+YpAwONAtszkhf4WYDlVlxbp532jav0d1q4b6H/xwodb0+X
	5dNE/xphBU7WWC+qb200kYEAjcPvWhp7ln7Yj6bkEyYizTxdTMnWuGkAikLhaYtGYYHRa0NT3C1
	r76JPo0fVUA83v1bcERZzQ/VhFhulI1MMdqTKGxSe2reZzF8ABX8jESWgCy5DwsBT/IrixB8U+a
	jwfZu789ca3lmNzi1VooLtvioRwW5ZmgGY407ZVZmieiZE//cdpz2zqvs7dNpStUDL+gdCRTK3B
	ea/Cbzok4QLP0yzPKumVTliGhwU0OJFAFY2hCUHX/S5M2zzxiJPftAk/i48xQgygxkjE0TLQWq2
	JxAzLlgTSZ/nI3xAr6Bjc5DpKB1njPa+sGEK/+/iYjgbmC4Cd/uUt/jtDw9Se4FRp9hmBXobMgk
	5
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr417049585e9.0.1793896869269;
        Thu, 05 Nov 2026 08:41:09 -0800 (PST)
Message-ID: <d6f1f2a9-a6be-46c1-9777-e7e710b809ad@gmail.com>
Date: Thu, 5 Nov 2026 17:41:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/39] xen/riscv: prepare new IMSIC VS-file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <7f00946a6b1b67e79f94e3c665f8f0ce9d5d0e5a.1790779209.git.oleksii.kurochko@gmail.com>
 <1792760165.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@vates.tech>
 <81b0b1fa-1aa4-4646-bdfa-5e773cb876f4@gmail.com>
 <1793892454.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793892454.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793896869-C0AD8B50-FF22F614/10/73395122804
X-purgate-type: spam
X-purgate-size: 2314
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 4:27 PM, Baptiste Le Duc wrote:
> On 2026-11-05 13:49 +0100, Oleksii Kurochko wrote:
>> [ ... 79 lines skipped ... ]
>>>> +
>>> What does the switch buy? ireg only ends up as the value written to
>>> vsiselect, not as a CSR number, so it doesn't need to be a compile-time
>>> constant. imsic_vs_csr_write(ireg, val) does the same, without the 128 case
>>> labels and the macro pyramid. If there's a reason, it wants stating in a
>>> comment; otherwise please drop the pyramid (an ASSERT() on the range can
>>> stay if you want one).
>>
>> Good point.
>>
>> I will drop it and use the following instead:
>>
>> /*
>>    * On RV64 a 64-bit EIx group is the even-numbered register alone,
>> whereas on
>>    * RV32 it is split into the even-numbered (low half) and the following
>>    * odd-numbered (high half) register. ireg names the first, even-numbered
>>    * register of such a group, among eip0..eip63 or eie0..eie63.
>>    */
>> static void imsic_eix_check(unsigned int ireg)
>> {
>>       ASSERT(!(ireg & 1));
>>       ASSERT((ireg >= IMSIC_EIP0 && ireg < IMSIC_EIP0 + 64) ||
>>              (ireg >= IMSIC_EIE0 && ireg < IMSIC_EIE0 + 64));
>> }
>>
>> /* Write a whole 64-bit EIx group, laid out as described above. */
> Nit: "above" may go stale if the code moves. Better to name the function
> you are referring to.
> 

Agree with that.

> Also, the parameter isn't an *ireg value. It is the register number
> written to *iselect; *ireg is only the data window. Per AIA (IMSIC
> chapter, "Interrupt files"), values 0x80-0xFF of *iselect select
> eip0-63/eie0-63, and imsic_csr_write() uses its first argument that way:
> 
> #define imsic_csr_write(c, v)   \
> do {                            \
>      csr_write(CSR_SISELECT, c); \
>      csr_write(CSR_SIREG, v);    \
> } while (0)
> 
> So I'd rename it to "iselect" (here and in the other helpers taking
> the same argument).
> 

As to the name: I'd rather keep ireg. The value does go into *iselect,
but what it denotes is a register of the interrupt file: per the AIA
spec, values of *iselect in the range 0x70-0xFF select the registers
of the interrupt file (eidelivery, eithreshold, eip0-63, eie0-63), and
ireg is the number of such a register, eip0-63/eie0-63 here.

~ Oleksii

