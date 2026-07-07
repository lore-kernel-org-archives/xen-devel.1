Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C46EC43458
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2026 07:34:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355985.1610651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh0Js-0007YP-AZ; Tue, 07 Jul 2026 07:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355985.1610651; Tue, 07 Jul 2026 07:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh0Js-0007YI-7i; Tue, 07 Jul 2026 07:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1355985;
 Tue, 07 Jul 2026 07:34:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wh0Jr-0007YC-Cw
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 07:34:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh0Jo-00CGi7-Q6
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 09:34:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4cabef-bab6-0a2a0a5309dd-0a2a450c8b4a-12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:34:12 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4cabf4-f399-0a2a450c0019-d155a72ed419-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:34:12 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5aebba706b3so3548974e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 00:34:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b4adf5f1dsm25939651fa.26.2026.07.07.00.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 00:34:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783409652; x=1784014452; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrJFWLicsUvUdRPe4aai5P4jIBINqdgc0aiTjMmxkXM=;
        b=R6I3ao0rDAjywFxC84iYsdHnci7GcqPiPe3mlGr7w6y8RhL6awe8wzKprFv/voTpYY
         7T9fG/zl/Vjus3T/kDhQ2Ma3upAcrnxpneT8YQmQuQEF5za2Jh71nRlC7A5CQ1Ejmr0i
         /R8tSsWcg+RJF6lWxABC50dGfh1aa+7cR0J0KczK7EbHZa8bUIlBLigXH6jkKDB2N2UW
         hxdAtydSlIT4H4oyGSfqElNGlBAPYbd4ohJ2pTYm/s9wGuF5CFA+GwofB5Oj/QrMNpiQ
         6ipG+jpsxJwGODnyVZxmo1E1b7GmAtwxyeFK4gNqexpg2RTvm64uRaEu+tgvII7NH8sr
         zjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409652; x=1784014452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrJFWLicsUvUdRPe4aai5P4jIBINqdgc0aiTjMmxkXM=;
        b=RKS2QGicoINR28nX98MkXSra2WaLzdQAogz0xYWqK+dg2/onlzwf1GIMhrG7A6TCIn
         EqdkWSzcvQnGGTlLmUV3i2UmPgiO9PZt/WR3O9q9CitzezTzO0DKQxF+jqI5MmRgWu69
         1Z1IvvzVnMorWsjf3DO1bZHGCoyJ3XkZeLxWcPm84l9x/FKtJImj4UiZ9g+uXSBGp9Qt
         gVOyb1phFfWLs4hzIP9JpDSqpULNDkjbSRgc2XzfJJvjG9T0A+Rnn+5n9VJNwCmwotDC
         m/gcWXL/YPitLj0hJwvY9FxbzHQX+v1O2AKhIM23dZfDGCGmhz8oC3hFF5Sb7pTUPiqv
         yiJg==
X-Forwarded-Encrypted: i=1; AHgh+RqIYvUAPdKqbG3Ul8J+N/d298uoY40Jgcufh8Ql1fgUge9M5TFMjrHgoS3LRuiO4RF9NTnBPLRVd0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwomJzGYe8IiXV6YKtQndr8Yosk++jWjoXcstlXpGglQhirMGaM
	maGcg9n7CqnjexzDmq/J+wwpdk+C71fKxvihZbuUnjBr8/luC0Jg4Vch
X-Gm-Gg: AfdE7ckD67gLH+jsgsM8ILMJgL8Aqzz3aDSjhIm1GFfz1X+yZpUj7POnQVkpFWCyMlx
	qi+GtGGbdfyAmvtA93ntYQlMx9jOWV/cFrEJoqpfPuDu2srS354rrvEXBul6dqI/x9W86lCh75x
	l9wJcIWY7d7lMytX71KwfonAVgkffZBjLK+m5iVcvFIGWhqZI6KDiPIm0V+KJaPjhLb9nY06Iup
	lYLuP/JSb1Fmzn9PZDmBThTrhwroZyQp0NEm5FXJYU0h8RgBqHBb4BUFd/Z2g9Dd7YIoES3QjOp
	pVu6BO67d2ycd/9TrnbXY6lP/6Xx52XYMSytz6ILPIXQLJH5BwCX0Aa5cjHDonp80OWr56SwZfP
	yo8nMwbaB2jrC6lWTx4a7Ei2cy5ddA7C4C/wReC+Ke4EjdiSIipYPBlUkK9xlFBSKgzSAEeikww
	6uE/kfbuxFIBB9+qnQeSnI123Sx0cQ/3EySaRi+uAsrgCr+Dsul7io0bEsaYOyYM+g+d8=
X-Received: by 2002:a05:6512:1304:b0:5ae:b7d1:161e with SMTP id 2adb3069b0e04-5b007c3e208mr850511e87.39.1783409651779;
        Tue, 07 Jul 2026 00:34:11 -0700 (PDT)
Message-ID: <025c0552-b31d-4c97-aecc-af9e170e6bfa@gmail.com>
Date: Tue, 7 Jul 2026 09:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/26] xen/riscv: rename enum intc_version to
 intc_variant
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <d8a27698b82abc2044ae33887af8132aa749c1f2.1783331040.git.oleksii.kurochko@gmail.com>
 <89ec62aa-dbcd-496c-8d0b-28bc395d63cf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <89ec62aa-dbcd-496c-8d0b-28bc395d63cf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783409652-93339D51-A83FF388/10/73395122804
X-purgate-type: spam
X-purgate-size: 701



On 7/6/26 6:05 PM, Jan Beulich wrote:
> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>> Rename the enum to intc_variant and the structure member from hw_version
>> to hw_variant to better reflect that these values select between
>> different controller variants, not versions of the same one.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Didn't you say you'd drop this if already committed by the posting of v5?

I just missed doing a proper rebase on top of staging, but I can see 
that this patch is already there.

Sorry for the inconvenience.

~ Oleksii

