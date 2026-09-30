Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64D5CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:34:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437269.1656113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuRj-0004Jt-Tb; Wed, 30 Sep 2026 13:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437269.1656113; Wed, 30 Sep 2026 13:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuRj-0004Jm-Qk; Wed, 30 Sep 2026 13:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1437269;
 Wed, 30 Sep 2026 13:34:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBuRi-0004Jg-Fn
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:34:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBuRh-005vfi-B1
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:34:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd0fbf-bab6-0a2a0a5309dd-0a2a450bc284-32
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:34:05 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd0fcc-b7e8-0a2a450b0019-4a7de1639c6e-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:34:05 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-4887840c529so1902099f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:34:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01751693bsm60397735e9.5.2026.09.30.06.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:34:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790775244; x=1791380044; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywVpbWNW8Cw8tXigmyTRDH12ACq/f7EquMp3PGI0HaM=;
        b=WLCc3KVedO5aVMfOWt/70GzRs3msxlshMZqgLt9aYxgUzbVIbxkq2m82XUsR2AXNdB
         MjEf+bNCIx4jOenJrMPPuRPSGGe66C70IrT1KBIGLEmDDfvY0b2OYGHezpMLjOa/2Uyq
         580gPBVoGEZ7Ha7e1pV0LQiSaN3sRPe2FOsPxXJj/fB4eYbBtmihuFzQL082bM6g18zT
         E6ECrSvXJVI+RlEEWPMgj3jKjM6dGD0nPymef5gwbWkCEkyisqgUMGO4CMt8Mwo2HNIs
         26APsu1dYaqDvTm90rrlmjMyUDjQvqDBIIThZNxajTgV/k1OlNWuFWBSANquy/Z0gxU2
         hrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775244; x=1791380044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywVpbWNW8Cw8tXigmyTRDH12ACq/f7EquMp3PGI0HaM=;
        b=p9QgnK8Fk7VFO0jTqdcKDw5ZR9DipWXVuS/NHJS9K4ema5ZVVU9q+NpSeJZueTghjJ
         AIb/oT3ZNpk9V0loUxPLwBwm5Ro4oZgULdWTLMtHPmX470OjbdO3RhN+iKPNeFkfPP3e
         Ghs9m0sm8AxVdKfoEJUyJKgnU7DMIN+kfpwQmAbJltP6ZOCKzYkMxf/+XlMGHuUd5daZ
         o66pcvRJyJjxaSayAsgVJ3nHv6HnXfBcWbLFTmKoP2Ws5VJ7NWiA6/FXma/Nb4/IH6z8
         7OTAnUceYuMxDIS23xsXL2k1nwZUf8AZ5kAss2RLIYX96pM1ciuG4JLwWpF6BnSLfiya
         /R/g==
X-Forwarded-Encrypted: i=1; AKwUvBw8mC1+mPoRRuPm6eTqUix20gTAHsqE5SANSNmhpZiPcpvGy82UfGxyeAsTzG0jRUc/Q/5XqFxhTSA=@lists.xenproject.org
X-Gm-Message-State: AFuF++k8gyjX1dqIgNzHxtPNicAasbjQG2Y8EJi4EHLaue8T+qe/hsXg
	gZ/BsaIHcattD9rQMLKoI6Ip0EgswuT4C4DdXTUjeeB8p+DIvAYMxZR8
X-Gm-Gg: AYBFou16hDHEkONF3tQU1xA4B+/xUkRyaqATFzs4t6huBlJig/JRgbBVC3XHaPcyFqx
	KfCU+hlQFDKDJGF5vML7OQ1JwtZrj1nMoWbkjggH9k3nLolRfh/KuLglcsbZ7IX7k5BAZ/6HctZ
	UJy8dFxOyC68ucpEL/iAgO1g3ujdcje1766rlL1k03aaYpPf1nZinDpmk97Xd1MMTQW/cfbo34p
	bhsmlZ70gdgK7+YtTTlPJlWG10TDV229Ku5cZ6Tl2yGA2UTFAEWkGpcO24di34S1u84tuqDzNBd
	p6ONLLh1PwEKmIvjpPH3ccSfo6YWIYY8gI+yXszrSfyFg+3iTe0ftx0waZuiz5Ng3VoeD0r+bEF
	R7dDmadcmcYmbyuch/dq9bXzb21rL9/z9xMYzjmLBoz2oW5yTbg4G7KoXWTgMS0e7sM5JPfKl3v
	BLKsZ38CUsiIFlFKsqqhMtidFf5SMDhhbfLcnFBazTgcr+7d299fK1QrH+7HNUJaOqtYcH9iPK3
	Dpm7CI3Kmp6xGk6qtqLEmZDx3gX1ZhkBABh7x1WqeHhZiavKfAyrmrPIPHq
X-Received: by 2002:a05:600c:a09:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a01b1a2029mr23845645e9.7.1790775244450;
        Wed, 30 Sep 2026 06:34:04 -0700 (PDT)
Message-ID: <b496953b-3c43-4f00-830b-54363111321d@gmail.com>
Date: Wed, 30 Sep 2026 15:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
 <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1790775245-ABCD79EA-F3951F98/10/78276251493
X-purgate-type: spam
X-purgate-size: 1139



On 9/30/26 2:07 PM, Jan Beulich wrote:
> On 29.09.2026 18:32, Baptiste Le Duc wrote:
>> paddr_to_pte()'s "permissions" parameter, the matching local in
>>
>> setup_initial_mapping() and p2m_set_permission() don't only deal with
>>
>> permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
>>
>> PTE_DIRTY.
>>
>>
>>
>> Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
>>
>>
>>
>> No functional change.
>>
>>
>>
>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>
>> Assisted-by: Claude:claude-opus-5
>>
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> In principle
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I won't, however, be able to apply this patch as-is. As you can see both above
> and below, extra newlines were inserted everywhere on the way here. The list
> archive doesn't show this issue, but instead shows undue wrapped lines. It is
> also only this one patch in the series which has this issue. You will need to
> resend for me to properly consume.

I had the same issue but I resolved it with a small bash script.

~ Oleksii

