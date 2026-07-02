Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA50C43327
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 08:28:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351390.1608567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfClb-0001Xa-Gx; Thu, 02 Jul 2026 08:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351390.1608567; Thu, 02 Jul 2026 08:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfClb-0001XT-CN; Thu, 02 Jul 2026 08:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1351390;
 Thu, 02 Jul 2026 08:27:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfClZ-0001XN-S7
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:27:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfClY-004xj1-C6
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:27:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4620e0-5cb7-0a2a0a5109dd-0a2a4503a562-36
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:27:24 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4620ec-ec1a-0a2a45030019-d155dd30d83a-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:27:24 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-472055b0efaso1044809f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 01:27:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dcf59sm7162237f8f.34.2026.07.02.01.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 01:27:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782980844; x=1783585644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKHg2RP9zwp0jh1QYT0fbAawl8DbSSyIAAMqCg9UC9Y=;
        b=AA+ky+ORzK6kJMFgse6LkMcsT3bNmfzp0C4pIdXU17/CNRO/TwLGoOc+Ud1F6PWQP9
         7qPfrlM+IwrPw5p5yvKPuJWMzvg02VzxX9Sx9R1zSb5rp5d1HxL4H+cmbhIU7yPpecgW
         10cfDnor3Gj4lMVq27cZuc512oMLlmy090T9rNfPcsg1toYj+XTh7L/0gXBgsYqy1QpH
         S6yT6MogDF7w2yQ6sXtpz7xrSNSVp24Q/URp4E7UNeXwGAiy8YfD2a6hx9O4N0R2venb
         a/v/hsO+Xotc/ReOidSXdYwHWzYC14SaZltt7OOGnz3BBDAEC3BAIi1sEZ04IaHtcupM
         Ws5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782980844; x=1783585644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKHg2RP9zwp0jh1QYT0fbAawl8DbSSyIAAMqCg9UC9Y=;
        b=Zd2mVp3x8879g72SpNSMwQTr1OqpmsgQdJtK7Ods26ZiUvra+kAPxUTvpkVT9NyiWQ
         lj0L4shWSvW8G0JAOQ2DPq1PwkCsGSVkKjsSBAMMUjU2Y9XkkuF2mmdaGnRWPlI0U2RX
         4oC4nyzQ8NMJVAln45QOdB8n7gs2MafM0N2b7J2SGclEqc8r5m/1CCJzC1h+SNLK1qeD
         0Ht2QQ32lQ8C0q0yq9tNRDngVo4pXK+u2kk3+wBEg9Q4klH914HyJZTqeARtreLeJIgV
         t1mqiPm+V4ouxdx1gT+BQlUXCHzEgPErvvVBF6ERct7QI6tV1R7ZFz4q4DmJ6NLHa+PY
         +seQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSa2XWwRCaeim9kYng70fuCBskVdmrqDqCYo0asKrUG37cha0MLyDLAxz7PQ2NdndZc8S4B1p23eI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYHQq2Z37Z06Diukomu0qL3FVIs0usAJB2uOROETqsFFQXrzd6
	K8XTLpkiG1ACl3Sgf5OXf460KSFEp8iZzuquvPjM+fcGvtEvSkrK+4Yweho78g==
X-Gm-Gg: AfdE7clS5VXq+BAGVwzuGkwAAdNBLSeaYNRGBOjiF1egqmKdlsLm026nKL15oxohQYa
	DkmAhX2b3NdDT/cOrzayxAtxEjWk4p8IWWC5PxNha5pgjX8YHl5qsH8136I0cYi16sOiRheLhxB
	FLtC2h/X1Ukbb/HA5poVEmeO2/FGyde5vV+BqzFjo4NBeWQZE2HVGU66AQABAGAdf5f1FL1gdVG
	ywprNaKPcrFPJXEs5Xs+V5OAUfr+rIdbWaX5pgBu2xU7yrAOP07woI8jJp+ySUF140PzzIBCBsS
	AsC4msgTYSnQRfK1VvYPKDGFrEw1UM2CRmeLOZv95zuoRUuKLQpCpAdDEyzgrs9SksHoamwmvHi
	jKL/VEAIolHJvpqEV204aOAV5a/kUgQtmbIP8qWXa9suWysepw/tZXdcpBry3fY3GGYCAcxadir
	jyCDSwmmIQp6zDX42G1lAL0MObl3kvgXX1X7xlOkgbT+Ivdpwu58hTVpNQwFi+0gDg2MM=
X-Received: by 2002:a5d:5d82:0:b0:473:fe94:9bf1 with SMTP id ffacd0b85a97d-47757f4c487mr8036896f8f.26.1782980843477;
        Thu, 02 Jul 2026 01:27:23 -0700 (PDT)
Message-ID: <16226695-aaf9-47b7-8726-7986837c8a1e@gmail.com>
Date: Thu, 2 Jul 2026 10:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782980844-B71295D1-EB1BAB7C/10/73395122804
X-purgate-type: spam
X-purgate-size: 392



On 6/30/26 4:06 PM, Jan Beulich wrote:
> printk_start_of_line() checks for a value of 0 right now. In order to be
> able to have NOW() return at least monotonically increasing values, that
> needs replacing by an explicit indicator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


