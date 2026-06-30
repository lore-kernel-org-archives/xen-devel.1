Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40144C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 09:40:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348607.1606329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUwj-0007BT-Om; Tue, 30 Jun 2026 09:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348607.1606329; Tue, 30 Jun 2026 09:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUwj-0007BM-LW; Tue, 30 Jun 2026 09:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1348607;
 Tue, 30 Jun 2026 09:40:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weUwi-0007BG-8Z
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:40:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUwh-00GxR4-LJ
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:39:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a438ee8-5cb7-0a2a0a5109dd-0a2a4505bd94-30
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:39:59 +0200
Received: from [209.85.167.51] (helo=mail-lf1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a438eef-3cb2-0a2a45050019-d155a733d1f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:39:59 +0200
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5aea9d606f0so3558659e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 02:39:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b1da4d298sm4053911fa.30.2026.06.30.02.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 02:39:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782812399; x=1783417199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFiJGory1+5LN2kiJlZj9dzEqEs62oHjO3JoZKfmWSI=;
        b=eG9l7idqRNt32yoWXxTNYXC1EAMZ/28MfyTTjGlEzFC8hbNoeasQSjcbmNOx1MKx7G
         rjpSsaA+dfRXXKznFhzI3VE+6fFqsS3wAu2RNqrlFpk+lhPIdG1+543zpAaxR5r9BWJr
         VttaGnyc3RNsWkHKBAgBV1b0O8vml8r1g+4OdKFeB5RpaG8tZOgOGycTosmrg6xvWday
         VO7peSGyVdmTlncyLcajvkw1FjBwTY/OS5voNqlgQxUOSVwK/0ZlraXORAVuJZ6WOcKJ
         7RpMd0+LDf+lmdWI9aIv/6EiQkMFzPUk1riWzxbwJVDXeIrGCYbbK5kXlNNisD74/Qr8
         gqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812399; x=1783417199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFiJGory1+5LN2kiJlZj9dzEqEs62oHjO3JoZKfmWSI=;
        b=B8HIdldJAunsNx5u/Z45Y6WbDcPkMxf5dcnvbvTe7qBo+w8zsGgE60b8spahPyLf1I
         0Xm3A47EhYAkXd0us+nJeggI7606/56XbL/2gLz2qPaLMi58Khu0C8it+Jb2pYJ5sRRG
         1wDAgpnambz4emXNkBMxS//4Ta36G067G0barS9mw7I9LadrhV1PxzZfeCq9lZSRhgnr
         bmF7JHDs5/6e/Osnw/2fn+C/hgn9ZolqrRo2qeyHqwC5pOf1e8MsbtHQVjFEMu9IqYS1
         kBW5qb5GFOQMYlfpFxJNatlBe8wxkTnl0un4KrzsZAS3AcFoxmIQy6soo75thKwCH9vy
         /Vfg==
X-Forwarded-Encrypted: i=1; AHgh+RohAVGzdmmyV3/Phe7QMd+W2be6/oi2fXbsZDvCM9XVvetWHuXvLWwS1r3nEAYKWSAJHe/JVc1PHUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsQHmp9YHR/1Z+4/GCtDWj3EvukOFuxn81PvQDyElroPzKKX+f
	GD41SejYUou+EVmDBND7cXYxyG2ilsHZtZw4pcCZIlgYIVQdFz+qxSUA
X-Gm-Gg: AfdE7clgqM6kirrn44ESceaFjyXZj2Olc7FZBSRX2o6s4aBJkeRSfsGHG8uSZovMMe6
	W5N41KJZ1pKq1kCkpvt1xT5isDZJpGnhxmWutTRtrAPYiBIawjlKhMpxEAFNFaHPUkZVpVKawtc
	VcBZmfpgtPhz6M242zWhuEsWowBz0mkKvcIE/7whIR276uxMYFjt+mLMWop1Hdoic6GSWTtDdgB
	i8Z9F5vAcQK0d6/+sGmwkNbR5C15vc7hTQc2JLmq8kAVAgGV7rABJ7cMSSpVNR5soZLM8UhCoUl
	9n0eodSc4gsclNUEAQd51dTuo+Xjc3L+zJfEdpWirOWevxaMTZW0xiHCY6u3sZ7Eq2pDBp0CpiU
	M35loJVuTIlYrAQg838Ittmndfd0ecogqWLXVSoNodoOdsizLwtV8EBDhCO8BnXCkbStnO5dPq9
	ZlsGzSPTGFy3csMqykCmq1Aswx03J4UfaO/8ZcAZf4CXMMX11MOnNeoWb/fOpdvj/KHV8=
X-Received: by 2002:a05:6512:3daa:b0:5ae:bdaa:df02 with SMTP id 2adb3069b0e04-5aebdbd97a9mr736987e87.45.1782812398609;
        Tue, 30 Jun 2026 02:39:58 -0700 (PDT)
Message-ID: <2c0731f2-eb5e-4bff-b41b-50e484e18cd0@gmail.com>
Date: Tue, 30 Jun 2026 11:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2] xen/mm: Remove INVALID_{MFN,GFN}_INITIALIZER
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20260630083441.726684-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260630083441.726684-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782812399-14D062B8-273111F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 1523



On 6/30/26 10:34 AM, Andrew Cooper wrote:
> These existed to work around a bug in older GCC when using struct-casting for
> variable initialisation.  However, our baseline toolchain is new enough to not
> suffer this bug.
> 
> Removing these resolves two MISRA Rule 9.2 violations which exist in release
> builds of Xen only, where "= { ... }" is disallowed for simple scalar
> initialisation.
> 
> The BUILD_BUG_ON() in xenmem_add_to_physmap() cannot stay as it is, because
> INVALID_GFN is not an Integer Constant Expression.  Replace it BUILD_ERROR()
> which is the nearest available alternative.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> v2:
>   * Drop INVALID_{MFN,GFN}_INITIALIZER entirely.
> 
> For 4.22.  staging-4.22 is currently blocked by this bug, following the switch
> from debug builds to release builds.
> 
> Passing pipeline:
>    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2638483933
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

