Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70CDCD6E5D
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 09:16:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329256.1593450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQfD-0007m2-RB; Fri, 05 Jun 2026 09:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329256.1593450; Fri, 05 Jun 2026 09:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQfD-0007lv-Oh; Fri, 05 Jun 2026 09:16:27 +0000
Received: by outflank-mailman (input) for mailman id 1329256;
 Fri, 05 Jun 2026 09:16:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVQfC-0007lp-8k
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:16:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVQfB-000SMm-Lb
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 11:16:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2293e2-e002-0a2a0a5209dd-0a2a4501a808-26
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:16:25 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2293e9-c1f2-0a2a45010019-d1558031d115-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 11:16:25 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso19851655e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:16:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcad5sm26154012f8f.5.2026.06.05.02.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 02:16:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780650985; x=1781255785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPK2z2QR2RqSKAe912EFG+nrh8B9U4S7Qo4maNc9ZBw=;
        b=Lz0jfExKztZCypgpENyyzovV9e547s2j1KQ49D/CChju80W34YIcXVaAyb/mFDC3EF
         Vu2ROJKQ06HuLB1GYDthMd5AJHvG3Oy7OqsjtJ6HxCvnAXMx+KDu8HWhagYJ1a3TM0nh
         G+BhCH6KNLOPQ8qKVJ/FrxC7H+Wz16NPm+0VwVQJrQkf+TmSjDtodOY7v/GvCMqEsJ3q
         lbvoH1DAiU3z2eZk5VtLFhTRG3iOX0bxec4jgsoukYDCeflrins8NxWojLKtcFTvkk1K
         bdNxE7Iohm2sDUKIkHdjrkLMQN4SGE3bUNBDoakdThk46aORqT4+G4oEfh+CKpQMSAvi
         x9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650985; x=1781255785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPK2z2QR2RqSKAe912EFG+nrh8B9U4S7Qo4maNc9ZBw=;
        b=rP+a6PqnaPUmlGJ+0hFuEUHZZpI56OCuw0QBVEeivp48tl21+UlW9L1CCGED5PZmAD
         odjlDVaWeV8nseQaHR62MW2AtlJd2kysbjUgf8qYiXNuPJqnYQRklGZC8BurW02+6HFQ
         wRdKWG27J57kVQ9Fdc2NwyjOvmESLQkkSFYLoFbPdbzawVwEeOSzymOT6KYPMyDYM3oe
         tBkeHdawgfkYKDcBuiFLWd5O+feSOfBTWDJc0VIuVxdX0iu8Swex72jc1+vZ1vVxQ1S2
         8qCGwUz3X0wMgJtQ61G9eKx03BNs3SQTegKgWR7gvcc8XDMboE6+3pgKW1oX+r5zXNsd
         ma4A==
X-Gm-Message-State: AOJu0YziHZNj87e5HEP1TLQrMW/GqJU7OPF4znwxfxz3GXebwlCRm5M9
	ZAxos/WO+GQx5+drcY0Bu+QkI97t8iutQmG5IY1xLRvoCyTJWk7FoO2uZ41JKA==
X-Gm-Gg: Acq92OHrVZsXRcWpYjP0JMTVSnI/9YdOT/dzp4vpTq5r13xKaGXAAejdhaMsSDCXz6b
	In1zkWG7PFjcYi3e7CJc13mCrXfIrIBVvX7P5zpwd1ztxzg80LWWA4EFoQjvmC3iLfpkIOINViC
	zwZmOpXxPDn4BeeKtvimdPF9/oUFiGMY66SspM+i4dyLvBVEe5eKVS+TWRvXKLnUkLJN7ccBkKQ
	i/1isfxxo/2Ep5Kzdy4QC5InSLaL3+cnPykiYwUc/umW2sTKSmmsOqPsp+r6e4tJ2Hswc6ZDpK3
	qbBgBne0nzokicBaM7vIXhcs+aV+y3XhIYPI8NY/ND6hQm/8UQN/xl4tdWJwjk7hJZyXVnPb6ZH
	bG/gyMxbByUqd8FzudIIvVuUnEzcCA/WXOxdD3XARRNACxZO5BP3jqCnpEI2QwU+LWeOhY+w0Bg
	ofM+NVq05McoNfllKTV8+Lb02V2RwvShlehzochlnO3rf08HQ2QXf4A67LOiRGOnlHINZyo9S0i
	Z1B3CtlTI6chBsVdR53h/F6aGs=
X-Received: by 2002:a05:600c:37c9:b0:490:b629:286c with SMTP id 5b1f17b1804b1-490c259ec1cmr42587675e9.12.1780650984987;
        Fri, 05 Jun 2026 02:16:24 -0700 (PDT)
Message-ID: <b881f46f-6e2d-4a5c-a522-76141ef1093b@gmail.com>
Date: Fri, 5 Jun 2026 11:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 0/2] xen/arm: validate hwdom first bank boot
 placement
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
 <6e35fc10-5281-4015-a5ad-78f8697aee95@gmail.com>
 <CAGeoDV_RRjMm7dHa4VJ4AwUypUg4kUx7kPYjM6Sg5_NafHQX1A@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV_RRjMm7dHa4VJ4AwUypUg4kUx7kPYjM6Sg5_NafHQX1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780650985-ADF40FF4-960B656D/10/73395122804
X-purgate-type: spam
X-purgate-size: 825



On 6/5/26 10:42 AM, Mykola Kvach wrote:
> Hi Oleksii,
> 
> On Fri, Jun 5, 2026 at 11:00 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
>>
>> Hello Mykola,
>>
>> On 6/5/26 7:19 AM, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>
>> Just out of curiosity, is it okay that the email address listed here
>> differs from the one you're using to send patches? (By the way, nice
>> email address ;))
> 
> Yes, this is intentional. The patch author and Signed-off-by use my work
> address, while I send patches through another account because that is the
> mailing-list setup I currently have configured.
> 
> Please let me know if this is a problem for Xen submissions.

No, I don’t think it’s a problem. I was just curious whether it was 
intentional.

~ Oleksii

