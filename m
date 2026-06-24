Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1525CDB47F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 12:33:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344869.1603882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMnC-0004wf-37; Wed, 24 Jun 2026 12:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344869.1603882; Wed, 24 Jun 2026 12:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMnC-0004wY-0W; Wed, 24 Jun 2026 12:33:22 +0000
Received: by outflank-mailman (input) for mailman id 1344869;
 Wed, 24 Jun 2026 12:33:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcMnB-0004wR-JH
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:33:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcMnA-00H78P-No
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:33:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bce8b-bab6-0a2a0a5309dd-0a2a4504bca6-28
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:33:20 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bce90-a01d-0a2a45040019-d1558036d0ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:33:20 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso10765015e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 05:33:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fc47720sm796246935e9.0.2026.06.24.05.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 05:33:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304400; x=1782909200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQaP2q6JfoXSdfdwNJe/dNTh+2bFU1ftbokuL7TDMYQ=;
        b=ZZuM7DzrzBOTsbHdmpPz5gIDPQKM7jjMmPYfPeAHZtpgkjD92vfZp9e0JSDzGezegU
         douVrbsS78pa7HJPFJYsHOT4foe91WhIN0s0EDmz29DtE3PIs2IScreOvJFJV/ud2ljI
         IZvN3VlhEpEo7hVjT0hQYq6EHy7vDgmGYjSl78pyqh+TZcfMQ4tWOYXzelLXfTqG061X
         kP83LLGSD0qH1tGjJdp6ig6CtTrv/smkPUWggyRjorDRn6mWgi0L5knkNt87DOVOXhur
         JzRcVxL3IpTCUY6SoaFB9WkArGyD2FOIKl+M7RgflJDlieJ2ZVvmK39ziJ97nJWBk8wz
         zwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304400; x=1782909200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQaP2q6JfoXSdfdwNJe/dNTh+2bFU1ftbokuL7TDMYQ=;
        b=XQFIow1qN95cVUvwSmNbWq563qWOGlSPij9lMg+67HXvyOEeGiPCVFnOp/z39r91CJ
         +Es+mCEDavS6iu0QX7FQx0dYc3dJwBeVfzss39qaNYJefGDZ+6DM7XA/4Ng23qb9EBs/
         Muqd7SBv99XoNfT8H9b99j8VA6zbPPPFgRobejjZpnge82NoiZTOSompcyscdkRnkx3p
         JeSl6GDBKnm/4y4RCFZIbkr1JrJVHqlGJtiMINl4A1Ac+Q0nb1cYwnWTa+Lt28crabTz
         Uzp4RH/PCKgHGaVN2P1dYm5E7gxaWEQjimotVgUKojb6hcU1ygtJ315kuJmmnU8i2skM
         71aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9m4Ms/+LlTrXA5r5JL/C1SzjU+H1dqyq5xlOViduNxU6ISkrfkbzw3Axr96Br9oXBfeuxuXNnHDu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy40AXLP2v/QpI2YVOTUIvvtBbyLljbhG60K1i5SY3aZpnBvI64
	J2bpnbG/NwZ46vRNqrng95fer69FUhNrpcU+6v2Bk+o/TDkNMGxe8iAT
X-Gm-Gg: AfdE7cnCAlYlsynTB4HwnY3yohhwPsdvDabZNsqj5LR0rUDa3FB1QJH0yRU4MhvZEtw
	Xpbu881l389alDTDpQuc3Cq3UmTu1gFg1qzwjmP7VlCVd2qrl9FOB8ZHV62Y+HTklyB8JJL32xU
	Tecl2xHZXqbRTzuWOrtTTXSE16AKFMXT8ID81Xgz3rMcb+josNVVHBI8B0gdgIJbunE9twzr7F5
	sHUNbLAwy3Poc3xh7shaIAzqTqIcdntCIX4SlR9XjuXM34v/Tg51jl9a0Z2Z5lvTC0o/dUeJ1a4
	pk3SHG5rDS8X/FX8MuBCWH933uuEBooA+Ovw1HxUV8kn/cpa3b/2ymeThsGdQhjTqZyJgmOcZF4
	79vxtXji7EeNYZj+S0kdwKJ6qyJzhnip95McXZyWqC6/+89fFr+9d3smXkgeHV3j7vdO1zlCLj2
	U/uPUPWoGkGrpk70zc43e7p02BT4Bx6pF86DUEZdFdoKP1bRg0SkyaZOBQYF641N1Zc2E=
X-Received: by 2002:a05:600c:8109:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-49260878cbbmr47310995e9.25.1782304399968;
        Wed, 24 Jun 2026 05:33:19 -0700 (PDT)
Message-ID: <04d68981-c9e7-4f8e-849f-a6ce1c96a192@gmail.com>
Date: Wed, 24 Jun 2026 14:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <9dc992009d0c1f9d1c6b6e88c0ea8bceabcb4d72.1781693963.git.oleksii.kurochko@gmail.com>
 <3fef3dcc-9fd2-4ccc-a3ec-36971aab1d28@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3fef3dcc-9fd2-4ccc-a3ec-36971aab1d28@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782304400-AFF251CC-BB8D45B5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1357



On 6/22/26 4:55 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
> 
> What does "very early" in the subject signify? This isn't about (very) early
> boot at all, so it's not quite clear on what scale of time the "early" is to
> be applied.

By "very early" I meant that this patch introduces only some very basic 
pieces and the vAPLIC driver isn't fully functional yet, so it was 
intended in the sense of an early development stage / first increment, 
not early boot.

I agree it would be better to rename it to:
   xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure

> 
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -15,6 +15,7 @@
>>   
>>   #include <asm/imsic.h>
>>   
>> +#define APLIC_DOMAINCFG_RO80    (0x80U << 24)
> 
> Is the 80 in the identifier actually relevant? As the use site alll you care
> about is that you make sure to set r/o bits which aren't 0. Which ones these
> are can be entirely contained to the #define here.

Good point, the value doesn't need to be in the name. I'll rename it to 
APLIC_DOMAINCFG_RO and move the spec detail (bits 31:24 are read-only 
0x80) into a comment on the #define

/* domaincfg bits 31:24 are read-only 0x80 */
#define APLIC_DOMAINCFG_RO  (0x80U << 24)

Thanks.

~ Oleksii


