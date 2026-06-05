Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3AACD6E74
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 07:42:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329114.1593324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPCE-0000kj-Ve; Fri, 05 Jun 2026 07:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329114.1593324; Fri, 05 Jun 2026 07:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPCE-0000kc-T3; Fri, 05 Jun 2026 07:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1329114;
 Fri, 05 Jun 2026 07:42:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVPCD-0000ig-FP
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPCC-006bR5-SK
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:42:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a227dc4-5cb7-0a2a0a5109dd-0a2a4502b096-46
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:42:24 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a227de0-af86-0a2a45020019-d155dd36b90a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:42:24 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so871590f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:42:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm23245333f8f.18.2026.06.05.00.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:42:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780645344; x=1781250144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvryGODgbOzgXS1AfKF5gbmQJHahukzlKpGhtIDkmUo=;
        b=SLa3KqF+aPX2lcAqf9GBnPcah4hhCMLwKQ2cm2kWFNTMElgd9plEjGpR9PT6PRg5+2
         7ZUYE6osiQlHdtPpE6yBG79rEyxctttxNr+CW2ltRU6vhgfjnmpQk0L6R5/HQ753bv03
         rllc0ygvBN3STN0tufQQLBk0uGOMT3t0X8xzjId7iZ1r1lhg6qA538BRYrDsYV3R7G0p
         /JoZlAl2jyApUA6rb2dNBZ9NFXYDPWJxu0Yo609uGl7wOngmT5RRqAcIU2N/mzytU9gs
         i6WxsJsP4CdGTZaqYw8nlNYRIXj164E88ftbXjESJ5RWnzNTRIGzbk7eQ7gwUS0DHsbJ
         YDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780645344; x=1781250144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvryGODgbOzgXS1AfKF5gbmQJHahukzlKpGhtIDkmUo=;
        b=heFFthfrpT79tmxjAH6wYgaWI48MteOlN3+dePWcmX8FlUhWen9lsWwQT/vdta5S7l
         eDmpWLnveezPYeXacSM0R9D6ebe8gZnX+v3vGfTpDw+Lp0AKnTB0hU9VQmXhIRPSpgPU
         EkToFvAipRF3YV/kyrvJpNDI3nuQTTjDkbT24AUpmGY78geLGn2m7A0VKmsn1n7ev0Kh
         ZLd2OgIz7gLe+w8XWBq1VfcRZgx63Ey58fNUObHBnfOiz3SPbKNXe6uQXsaGGgVx5LiN
         nKzIKe6QBW84YNQ6koYIND13vjDenirrEsdcYDr0GHuzZx9BVKm1FO2qB6QQ+79fhREe
         du0g==
X-Forwarded-Encrypted: i=1; AFNElJ8iYEcod9GO5rnG/M4YOLJzP/ONALzz4OZem2ldvrAOQfvy5SuCXbwtERDeUYLw9C+nKZHalgjuznE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsyf7taIF6hi4hLmp3qsA8C7RM5J1s8ual6DZb6GfoIV6wLYTy
	meNUZxALSNiUqukvd4At6dBQ2TBE9BJDmtzEtOn42RHMM4oV1RBkhdk+
X-Gm-Gg: Acq92OGdQGBMJ/scPwuEOkmKsS4RKfnieIHu86DuhCGOceatm7Zwym3tnhzyR79LEEd
	pHoF4vy2Jut9jk+6C8hvQwejZA2WGxY6C2XAJsVZGN81NkN8bDfNRs93CjQ4Oj/W0rD4QC3El3y
	niW4CIWKlKZcXThxBZpIckzIIQxZKWw0VFrsIbhCp7Zol2gmghwR08OooiO4DX9SQzVxKliSC7G
	1dKas3dWOPex/bSBnpT268WCj9n3cHa967GojdHFDVixsXqXQIja99HHSumP0F6pRUrQttHSnjw
	OmSH89f1nWWu3WZg96bnEOXvbwcjr0P7G1ANWMKHe4pJio0iJ6QwkeRGbL/C4H0EYJt6dwrpc87
	Z62vbOBuyzyU9+k8wcK0bItiaWh6ManMFBmqGQwVuEynfxXjqFV+URclgaJNmq0NNRW4n9a22FU
	HHCpsB1rRLZSM5FD9i090ufEMfXByFfDprM3MGlT3i36yW4sKuTOl+vmDnyUCaUy7q2g+vKbU5U
	L/KOQQcfoDSOlSz
X-Received: by 2002:adf:f24d:0:b0:45e:ed7f:1d9 with SMTP id ffacd0b85a97d-46030615ab8mr2928224f8f.17.1780645344024;
        Fri, 05 Jun 2026 00:42:24 -0700 (PDT)
Message-ID: <b189d8f2-ef56-483c-a9e9-c0f961d1fdf9@gmail.com>
Date: Fri, 5 Jun 2026 09:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Ocaml maintainers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604151303.2720636-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780645344-8336C161-C8A00473/10/73395122804
X-purgate-type: spam
X-purgate-size: 892



On 6/4/26 5:13 PM, Andrew Cooper wrote:
> Christian has just left Citrix, and Dave almost a decade ago.
> 
> Andrii (a XAPI committer) has worked on oxenstored before and has agreed to
> step up as a maintainer, and Guillaume wishes to get involved and learn too.
> In practice I do a lot of the bindings work, so lets make things official.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

