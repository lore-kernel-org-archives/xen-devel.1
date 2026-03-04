Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C8EFCE39
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2026 19:30:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1245939.1545257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxrur-0003ti-Ob; Wed, 04 Mar 2026 19:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245939.1545257; Wed, 04 Mar 2026 19:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxrur-0003tb-Lv; Wed, 04 Mar 2026 19:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1245939;
 Wed, 04 Mar 2026 19:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDHP=BE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vxruq-0003tT-M5
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:29:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ee16b5-1800-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:29:50 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso107980745e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 11:29:50 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c6129017sm9129316f8f.31.2026.03.04.11.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 11:29:49 -0800 (PST)
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
X-Inumbo-ID: 82ee16b5-1800-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652590; x=1773257390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Br0owAO4cMjtqobqDOXI/vXhN4+464FEXKnA6CShxks=;
        b=S5m1wfypIvX+2AgjELH0YxqqVPhqQrGs10M1SP5faNctMBHjMICoON36rf2gh8Ad3S
         xbNucnj43Cv0tkXeMHktlqlE4Q0iuWZgGipNfA2dDkFnXGt2g7/t+mWavMcVa2mSFXX7
         sRxO+J+VcufczGefnNehxp/UtDxjFgLO1ec0muKBsaXRLdqOQKWkQkIUGtAmUqJOL8h/
         UVhC8FfMM5RIU8TEfbEPilzAMIwhdFZdaj84STF/LAkPRbv/E0qaRrUm+Iji4p24uqDE
         sOL0bM4f8RDSAkI9FPxEfQwdQhdafnSdlNArTj159lomMpOdf4u2Q7q0VAdW8IlEUkGr
         KTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652590; x=1773257390;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Br0owAO4cMjtqobqDOXI/vXhN4+464FEXKnA6CShxks=;
        b=VQfvFjC4NDQ3J7oSEU8F+lDLkIUkyqBnIC1kJb06Y44PLK/bXmGZHw9e6RBRT7CjV0
         +JcudgtwzJ7SnuRtoUQqWJl3uMrup1e3+WfhDwTegNWcxBlgrqttqtO/YQHtxYhUCgaN
         vqoad9wz4TEPa7g0PbWRhSpD7xCkdmZqWg/WChs0cxHXJLPeP1IAYSvKb8YLJo89k6vn
         wZ/2+TKQ5a6HFXj/axnNXoFvvl0/9QKbvEsamopVGdyLC3CZwDY6i9Hz6Fwrt9CvlJVz
         UKx2y15Vu7CYl1J1kMUoeoktyR+GuuUMlfr1gvgKXn3yCcGL1frmhDI31Nl5ntncTKih
         VpMw==
X-Forwarded-Encrypted: i=1; AJvYcCWw2YbZd908UFvdkGNSYj55LgTkecU9USmtdp6JdqvJRy/QPYbIEZ/0TAp7dz3JwpvevwJpNduzpTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUT1DSfA2tG9NxHIxDPYuIKYoO3pBMBYE4eTCHk5gbTy17+SeQ
	6mGwZeuqpKUvcbVo86JOxB7LgPfgeDJi5vvK0qe8WeJOr9yBQeiLAAzl
X-Gm-Gg: ATEYQzwqDvAhwkU+vRw79JWwxrC7Nyc4T2SebbUDgKNOf9zVXClzgVhP7Nm+azgXY7A
	OKk1Dei3ETH7zprRfzvLzQhySdzDhw9B9Drb3ivWVFG3KLCArBPYHbdw2pAlnIqPbM/TTZNqmkB
	f8kKMPM5BpZCrDGs7E1Wt6swIOjKkUeHEneWZebdT3oYaTiiizZM63dQbx7USsXIeEFbKcS9y7k
	xyDPiZjcZwoS4J1GyxjO2iFFX15icnRiTQ+gKNcSw9dE6mdEuuM0GHdZBOD0pmuqtfhtwarrcCH
	mN3EZqjG5ZvEpmYqYzB+YtNPuitfXemiLQCFZDJzCJfR3ocEMc8TVe6ilfP2pzhS81tTZKZ3RvY
	zx29R1Re5Xb5nMwlaQ0HsPquDjdNenjqIJKzER6TwkpKr3PkUcZ2qcOVzZYt+3vDZpIVd2Ry6yq
	f1LVJ8jzMmhm9Z3d+ydzMrckomiHXF7QxgYy/mH/f1Fa4O22RYF/h+NJo15z9G/2xD1T9lY81ls
	Mwytn6dPb8bBg==
X-Received: by 2002:a05:600c:1986:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-48519897aa6mr51546315e9.27.1772652589413;
        Wed, 04 Mar 2026 11:29:49 -0800 (PST)
Message-ID: <23b77208-5321-4dad-8974-f943b38ef104@gmail.com>
Date: Wed, 4 Mar 2026 20:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a1954e9a30abace453f4604a47b43ecbcebe350a.1772016457.git.oleksii.kurochko@gmail.com>
 <6357ad3f-85c8-4fe4-a2c8-8b0a0a97f1b3@suse.com>
 <32bd2cc9-86ee-4470-af7c-f52838e0c4e1@gmail.com>
Content-Language: en-US
In-Reply-To: <32bd2cc9-86ee-4470-af7c-f52838e0c4e1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/4/26 4:07 PM, Oleksii Kurochko wrote:
>>
>>> +void vcpu_sync_interrupts(struct vcpu *v)
>> The sole caller passes "current". Are other uses of this function 
>> planned?
>> If not either "current" wants directly using here, or minimally the 
>> parameter
>> wants renaming to "curr". In fact ...
>>
>>> +{
>>> +    unsigned long hvip = csr_read(CSR_HVIP);
>> ... this suggests it's unlikely for the function to be valid to call 
>> with
>> other than "current".
>
> Agree, I will drop v argument and use current inside 
> vcpu_sync_interrupts().

Then would you be okay with using current instead of v argument inside vcpu_update_hvip()
and vcpu_flush_interrupts() introduced in the next patch?

~ Oleksii


