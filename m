Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DD7CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 15:39:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450825.1666217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNXk-0006Ep-J3; Thu, 15 Oct 2026 15:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450825.1666217; Thu, 15 Oct 2026 15:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNXk-0006Ei-Fb; Thu, 15 Oct 2026 15:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1450825;
 Thu, 15 Oct 2026 15:38:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHNXj-0006Ec-W9
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:38:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHNXj-00GBAt-Co
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 17:38:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0f368-8faa-0a2a0a5109dd-0a2a4501ab98-48
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 17:38:55 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0f38f-5984-0a2a45010019-d155dd29b0ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 17:38:55 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso4016567f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 08:38:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac37acsm19609478f8f.34.2026.10.15.08.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 08:38:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792078735; x=1792683535; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YK+AV1+2er6wAJ1yus0fSXYosno6BmC+IECP3KD/yQ=;
        b=mbuEuVP8XqXXDite00SCaOHrHCaiSoLYnCfUW2FKeMb3qUYgIF8NdDl3XlP9bxWxsr
         MOpbHMjeHXoEWB1g6LeM8AmiwoFAxR/ra6/rnyGtwTTiZ6OI0d8T+eZAipSp9Nvzn3bK
         4O+RfkfnEnhG5JP+ZDi6y+7IxMgg2f1N5AFC/D03IYwbxZS/L5p3LPwZ7QrzvbGyZ+gn
         J7f4ZQowa5rJRVGhkpWDZPlUybFSqhtHjdUyg8cYp1UZtwxobAqBd0qNNDpgImv3NWnU
         0rRexy8Rylczn1u82QIgGRzVIsZMnQsMLL9UmRofJz7pgDIYmFDomyqea67/AF/Ry8Wa
         USuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078735; x=1792683535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5YK+AV1+2er6wAJ1yus0fSXYosno6BmC+IECP3KD/yQ=;
        b=E9P7aOK/Bzve3FPi8Qy1Fpda/5y5to5rFhdVGh2KzRW6TcjmtW3oQdK+XEfIKE+RZq
         8/KJ2YHjl9UxQo7clmds3R+g8GhTvXnrcjuRlRaK1khKaC7U/cJkfaG2/wOM2lmhCDmp
         imJoW1KVL9IaclFYgBDf8B0ZSD1+cHF/vmNHMWDjmxfUdUAQSyFUZ4j7tlu1E+lsT1aX
         sNYXWfZqyeY8+LWnnQT6oWx9OIir1AD5G9wZEq3qmnz7CasY+G3rcCiT8pST1wdtTfp/
         FrorXGzMnb/4Y8t4KLskazHSkiM97zLREeizjWmHs3V3AtvKtwE2z1Z57jemSl7++MMf
         UPWw==
X-Forwarded-Encrypted: i=1; AKwUvBz0m1rtHKZ9TRqXeXE6F1sgXWXQMioRuOrQNf6NF7FrKOXNaoLJb4E1LhIFAcj5lP7Ny+akRgJEFqU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKfF80Bm1861ljqgKBUjF08ssQxrhpOgf7Qd+2ukBjG7CkCJKSb
	wj3ZiA9Czz5OO8lO0nCA372OjaB7KurjU2A5/hhFbkPWQ5F284LZLvTI
X-Gm-Gg: AYBFou0MDEoQjiB2Toqfl6ISbsmBoXQGpGJks73/WjMJjwvt0m5t+QmNmV9ejtSFXac
	iV+9VyXGEdkgeVbG9Zp3K2wPf3HEZF81NJTkqx3T/7pPm9T5Dfjf47I2jB0wewfqxw/RoNWPND7
	qwy45MzVhCFVUD7Hdu65Ch0GuCOdJX/fAQVIftZcHpnqeTXBDLl3U0/XVDjTxaY+X4XYIn1UkGZ
	DkY/8pnDDvI7y4D95Wy2hqGseVvAGvDopIOjZpVjLHzzzIUZYZxySJKmYePV52hhSneNNzbsHxN
	Wo01kCJe3v7SoH0yEZOLvRv2FPu93lgUzlrhqSc0yHqejGsR5X3ENKE1zuQqxwDYdnw/j9ODris
	SYwbKk4AiwGcAfTeMgAgsufWb4NIe6CfZ9Y5QjItYVG3DVYycCAAiJV5xVBHu2WjmMs5362jJEH
	X5J3ljXc2A8NdyfbvLAkvkHiHhcD7kHyJN3cozBD5FqGTjxkEVN2+2UllxRfXYVoK13QPcYqzKu
	Dwgfqm3UIFJ51MuWdWO7gA/YvaX3JeFKiXmVx1OUNLs/v2BYKU9p+eewg==
X-Received: by 2002:a05:6000:490a:b0:48c:490a:336b with SMTP id ffacd0b85a97d-48dba7bea0bmr37781681f8f.5.1792078734720;
        Thu, 15 Oct 2026 08:38:54 -0700 (PDT)
Message-ID: <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
Date: Thu, 15 Oct 2026 17:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1792078735-1DA7E757-017BC4FB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1377



On 10/15/26 10:41 AM, Jan Beulich wrote:
>>> Xen's internal behavior, but I'm unconvinced that it should also lead to
>>> marking extensions as available.

Could we use the probe mechanism solely to verify that the A/D bits 
behavior configured by the firmware matches what is advertised in the DTS?

In other words, rather than automatically setting the corresponding bit 
in riscv_isa here ...


>> Therefore, as far as I understood, you're not convinced of this:
>>
>>      /* Neither advertised: trust the probe. */
>>      __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>>                riscv_isa);
>>

... based on the probe result when neither extension is advertised, we 
could require riscv,isa to explicitly advertise the appropriate 
extension. If the probe result contradicts what is advertised in the 
DTS, we would fail to boot and print a message asking the user to update 
riscv,isa accordingly.

Then it seems we could cover all the cases we have and potentially will 
have.

Am I missing something?

>> If so, then, the only solution I have in mind in what I proposed in 2)
>> with the global variable that store the result of the real probe.
>> Am I correct?
> Possibly. What I'm missing is some clarification towards the underlying
> principle which we want to follow not just here.

~ Oleksii

