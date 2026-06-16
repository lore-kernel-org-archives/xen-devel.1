Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ACECD98E1
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 15:20:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339400.1600606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVa9-0000gi-01; Tue, 16 Jun 2026 15:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339400.1600606; Tue, 16 Jun 2026 15:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVa8-0000gH-T8; Tue, 16 Jun 2026 15:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1339400;
 Tue, 16 Jun 2026 15:20:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZVa7-0000Gg-9E
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:20:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVa6-00BvY4-6K
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:20:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316989-e002-0a2a0a5209dd-0a2a4501e966-34
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:20:02 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3169a2-c1f2-0a2a45010019-d155da32a4f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:20:02 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-beb1bee8c16so535192766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:20:02 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb4b22136sm690860366b.15.2026.06.16.08.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:20:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781623202; x=1782228002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fv0yqf5Dr8irv/PZF1l097JC0vyPYalD4x7Q/c5z0R8=;
        b=rxAkZh59Jqo+zycJJaaudHBC22iZmsJFbjZWhGeUMRUb76/+ujFaFJmmE//2WVfEPh
         hfm4TEqxpmj3N45kCfpcLZnK2lB/7121ouEKm/QgLYJl6cR0A6FTE9i0Vc9W3L9OsL6J
         xzhy2cTGk/+dJ3k+xIYrilUXUcrLIMDYrZ+o9Vgq5vRWm2toKcEnT7FDBqPBHJcN4IOE
         fp2T6Z8yPJ2JH9f3uOFK+hBrELNC0hwVOwKgH8SZDXxDzA3g98n7/LfoY5bCBpeJFO37
         P0Fhh5vQ0OrpJRZvkOUQP1QgZR52sh1XLSLVbXJRZ0Kn98/w0o6JmCrlSwZXxvbY/Awz
         4yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623202; x=1782228002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv0yqf5Dr8irv/PZF1l097JC0vyPYalD4x7Q/c5z0R8=;
        b=HGpRUXUroBvAvakyEKOhm7TYQQbn85ibJiGPkzaU9TrHzVrDRpbSkQTQKSs4w999oX
         C467Nt2Tr/DdG4l88lu9VD1QmbzRKgyhMg8IZ8J5wGbSp4jVCSkP5+sL3zlMt4EaSl9d
         udf1RPNUzZhRBMa6v/tfWbFM4M8aq6ayRj4Mz12lJ49gfE41OxTra+a95YE1cpPO/6Wi
         FZSm/IcaJ7AOaIjk8MwsTigoEIh1PA/4mIJtqOX0n6Jc1mEYm2tpQNjSMcg50mdIVkwQ
         N0NmGuszxb8fgXKVuYw1sfBS4ojjYlnMlAyeO1bmSadqkvhsnDtzWZpAneM2lE2EIVNK
         FDYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Dbcr41PmvCF+tJ4ITh+acm2KlWEWGSpNhYfSfK4hjNrJ4CDin4/HI2HW90QniXbS///aQxGULeu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl2yb3eAD9lH81NQb0xOWmKmDZuCuPrSy+MXm6o+DcHGVDiClu
	ml+c+SgPFYHpMf5I5gsv+tQEkG17DC/Osb7KalIG2NhRsvjGtEGriEuM
X-Gm-Gg: Acq92OHwoPt0yET90VH7+0VZ3IaXRnVWqGN8kNFr1gvG73M3WPMVMi0gwBxjDxhLOhz
	0UBAMF8IHWfCVoaxIlWSsYjdUDPktlSa7sXp7P9ezKdUzP2FfYYJYuV1oxCamNmPn7bJskGsS3z
	EYFn/50vVR9paADWHuXKPHySWqRpCF65iS/BytqlWgWdA3Xq7uMwD+BJB7xeWRB+SnHVqEszGdC
	saIjDJOWWlqxdiEUpGhSNivfv00SFw1d6pPNjCdIjTBDvpoHfORqoE5RP3wQXvyHPGfkaZEl3Sg
	NW3uJ0DQFxaiL2yJuCkjLhsn31rwZeiMmqZJs19wTLR01EtRnSRrOCbcm8BODXxUDI2ZDwMBNls
	pNAqraKoiOKr9ymfWVSqYAF6SeNhgonLzYxamBvhPsqt7FD9dI95+31m3SG4A33H/cbSLB70ldP
	QGjSX2fRqpBFePIdJswMjBg1IbUgPXch3IQiwc8zhXDT2XTTHi4D3Qla1gO/EDHnodE8WA41/oR
	4roQA==
X-Received: by 2002:a17:906:f59c:b0:bf0:e345:68b with SMTP id a640c23a62f3a-c05a7bbc507mr5008466b.18.1781623201227;
        Tue, 16 Jun 2026 08:20:01 -0700 (PDT)
Message-ID: <79fac688-34e1-42b6-92ac-6c8c665af0bd@gmail.com>
Date: Tue, 16 Jun 2026 17:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/ucode: Exclude Zen6 from entrysign digest
 checking
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260616104534.22995-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260616104534.22995-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781623202-AD1ADFF4-56172E14/10/73395122804
X-purgate-type: spam
X-purgate-size: 636



On 6/16/26 12:45 PM, Andrew Cooper wrote:
> There is a 3rd path which should have gained an is_zen6_uarch() check to
> exclude Zen6 from entrysign mitigations.
> 
> Fixes: bd15fdedafb3 ("x86/ucode: Exclude Zen6 from entrysign mitigations")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.22.  This wants backporting too.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

