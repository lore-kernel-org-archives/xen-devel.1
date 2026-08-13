Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EE2C5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:04:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389804.1630425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTEh-00043t-7B; Thu, 13 Aug 2026 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389804.1630425; Thu, 13 Aug 2026 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTEh-00043m-4L; Thu, 13 Aug 2026 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 1389804;
 Thu, 13 Aug 2026 11:04:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuTEg-00043g-7G
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:04:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTEf-00FSq7-Gr
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:04:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7da4bf-2eae-0a2a0a5409dd-0a2a4503c442-8
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:04:33 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7da4c1-fae8-0a2a45030019-d155dd2dade9-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:04:33 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so1221588f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 04:04:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af441sm6217610f8f.22.2026.08.13.04.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 04:04:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1786619073; x=1787223873; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd+Zntht+ldhKQihKRW1iwzhN5kFLSBmJy8vG/MddVY=;
        b=DYpcJEfVW0hvmqVgN9mkUImhg81teJdtkzqo2WTYXZr4DSUWUWbW1OtF9hXqIvS15n
         0Kp7Z174u9AsgxGjy4dFlprD7Ol4T2qloIQMr7xjVYqukJDIvBzUl9a5bKFEnqCB5FCQ
         C8h/NGBBDMmJ74fYBU6rJUbXQqNUTRF7SF0Yb3XiIKcj0u3yorP2cINcGQ7oUrA6pkhe
         wDdUstRKaiebWxEgtKMZprPKp8dZMJF138r2V1bAgqEeyGgc3v8IhhGAge48Wv+gWpYJ
         DQPPCv6Ha45+FloqP1DZIC5rgQIeSJWa8jRThWzur/hDhWNqWBcHrI2XACHzhwMhyqaY
         NygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619073; x=1787223873;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bd+Zntht+ldhKQihKRW1iwzhN5kFLSBmJy8vG/MddVY=;
        b=j7Yavb9zm1T+8+uY5PLo0p1Wdcfq8TVKgKjEGBBZPEdJxZuB/5N9/ea+spWSLv339P
         b9jxwjYiKBAumNTuavfIlGi7+ZR6Bqq8qcQOPnhOjZnm7fJIvi+XNSWUrCMW/PZdfMSI
         LV0Mr4GQpBHvT7c4U1uUEFXm6tK84TsleL4X3LMoeyOh3lWIm0ST7KWJHknuLscnVFNG
         mAG8pMR1MMK0VE2e1yUJn+NfUlAm1JWQdSM4u4r6d6dvinU+IXoX/m2nbxGhl/X6cpQd
         /i3fxmDFg9xnUz/KQOA0ZLC3OGnBZNgnZ22qkobHLyfyQALB0ktvROq6b8q8RU8pu0GI
         DZCA==
X-Gm-Message-State: AOJu0YzTRHnsEtd84gmdT2vdHFccv+VazZ+px8rfl/wrcxFYw2jc8rNF
	8NJob9U/Xupk5cgwxke0oy/Ep9xrVKodtW8d8P+meiJC1hdfFw2wyX0k4MNTlCqOhQ==
X-Gm-Gg: AR+sD13PHuygeONXJgMVeFxyD/7uhqC5c63API+Awgzcrdf3KvdV0qOFWMDfkkwE767
	uqPjOfGzt+AkxXevMlPPRxcL6eSEQeyD1r+7DG8U6Pe4Mp8MyA419f5UcicIXZDsoDcusyEyS/Y
	HCVDGT34aC8Hq1ERZJkKt3UKEQRyUaIv43HMBdgrUiuJ7ksogNa1noI/W2OWyCQ3j8F6wAYQxUP
	kGzULPGdQvRbfkMi4YxIvorE4h4tSkP2Tv6XaRDSc5zEwFbh4qxKShXmYBiDbRaY06LEOWwZB2l
	2WMN0eHY4RN1kPTXctTi7pCkZx17UzP0QVJY9mHlU8hj/nhxYG60FovkGROgJE+CV9U1Y4waHnq
	Ie2JACJYEvumXUZ++a8ocVW2+XCZOqul5NBxAAYaQjQU2M38FcdH1Kc37lBCinFIJj2yRmwI2oo
	+8csTxnzchv99uN4PKhsF/D+yViPspK6wOwctn5gF3PMcuzRUwP7DnrCNvnXbT4kQeXkCEZBQFa
	PkHx81tFJka6RnhsInuIHzY3VR6CC6qi6jkuMTOTJPxEU+YlHeD
X-Received: by 2002:a05:6000:144a:b0:481:98d:b24 with SMTP id ffacd0b85a97d-48159eecc97mr7251160f8f.19.1786619072878;
        Thu, 13 Aug 2026 04:04:32 -0700 (PDT)
Message-ID: <988bf876-e30a-4dcf-9935-ffe7e1b82920@suse.com>
Date: Thu, 13 Aug 2026 13:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
 <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
 <82011389-489e-4076-9d3a-8c393e4a8e76@suse.com>
 <bf2c9455-dd88-444a-8a94-a3a519d951e2@gmail.com>
 <a88930bc-e11a-4da1-b545-9474b5295d84@suse.com>
 <fa8d8a9d-04ce-4ce8-80e0-8164fea774ff@gmail.com>
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
In-Reply-To: <fa8d8a9d-04ce-4ce8-80e0-8164fea774ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1786619073-6E8CD4E9-D6708A63/0/0
X-purgate-type: clean
X-purgate-size: 1078

On 13.08.2026 12:56, Oleksii Kurochko wrote:
> On 8/13/26 12:44 PM, Jan Beulich wrote:
>>>> Also, can both of you please adjust Roger's email address when replying?
>>> Could you please clarify what is wrong with it? For example, in this
>>> patch series:
>>>     [PATCH v2 0/2] vpci: allow unaligned accesses by the hardware domain
>>>
>>> This one is used: Roger Pau Monne<roger@xenproject.org>
>> Whereas in your mail it was still Roger Pau Monné<roger.pau@citrix.com>.
>> When you originally posted the series, that was still correct. But in the
>> meantime it has changed (and I expect sending mail to the old address
>> wouldn't reach him anymore).
> 
> Thank for claryfing, that e-mail was added by ./add_mainterners.pl so it 
> returns incorrect e-mail...

No, I don't think it does. See commit ed3df2522ac7 from 2026-07-21. Your
series was sent a day earlier, so correctly with the Citrix address. But
when replying, people want to try to remember to switch stale email
addresses (in general; Roger merely happens to be affected right now).

Jan

