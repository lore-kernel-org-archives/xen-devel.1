Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDBBCD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:57:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340365.1601420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZotN-0001P0-Ot; Wed, 17 Jun 2026 11:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340365.1601420; Wed, 17 Jun 2026 11:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZotN-0001Ot-LC; Wed, 17 Jun 2026 11:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1340365;
 Wed, 17 Jun 2026 11:57:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZotM-0001Ol-Mi
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:57:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZotL-00FYE1-LJ
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:57:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328b8d-5cb7-0a2a0a5109dd-0a2a450ad2b0-20
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:57:11 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328b97-56b3-0a2a450a0019-d155802fd4ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:57:11 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so36862885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:57:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a9b45bsm128734775e9.15.2026.06.17.04.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:57:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781697431; x=1782302231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcEj/wX8+0v0s7gTYD+pD7os/25DvNNp/UVvbt2iki4=;
        b=JkMiV/i8klO9DqUi+mEJYBx/3rnFuBVSV8OTFofsOAaivL9Zr9KICa5nM+NokjV5AE
         ADFvS20JBeoP1okHdOc8LfnbcBBBN+c5MP/6voGKuslM7To7cVb1VXhwP7IkzsvykbIJ
         aUa9kZaRnQrq8wa7S+S+4yPVN3pL3XDEHm71N/o3Jj+DoR5MRjmVUoPs+be93QLx8dh8
         JH+Q5iqbudJmgNq84PVzo/2Q/BxgeZTjiCl/VZ0wMfruGddaqS/uDHCf1vDGbqkP79yn
         UOYfR1Puj34d7Fh7JNdsYONBznX2jYJ8xY6EBWl8XXcyxV+rx43sRKHcMneCby5zw21q
         6e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697431; x=1782302231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcEj/wX8+0v0s7gTYD+pD7os/25DvNNp/UVvbt2iki4=;
        b=pT4WmazrbTqQvYeZ+kt25Mvk6yeqwoKvt4CZCtzxY0YfBup4CPmfTsfZB7E4WQIrAv
         BXfR74lcRbpGiJ/J2VWNSYESs9A98175nUvg47oqiJjxBponNAYuP3T0uJI5R/Bp4ACC
         E/Gb1qQrKR/81eHGvlHTDurm5QzwdpxnSH/ZMeuXhf2SfemoQ392tQ9OgzcpPf4SwiwW
         Nn/0QEBd3XXY0cebFh8/Ns7PBdEGqsEIeUu1FR4QFt/JMI4mvVsHC6EFXygaGul+fwY7
         8wFBVSApYb1gxunjwEbjxFNRZygfqoligaDcsKvEknsC9b3xDQH4HvJrEEnX8zZQYrhd
         s2WQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VdYwPXwt42UyfYRBrqv9qE4wq9SkabTWUR7CUReWdEO+HsO+vzF7TEvMsOA76tbsxxkBJBlIFWqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL+Ti+PF6D7//aCeWKhTX9BMPVvaUWdksizlQ/04/KlzKrtIwV
	Q2MWAdkQFbgNuCDE9qcoX9+penmJezE+epHZmRhlxCy74Ip1Db/BWPv3v5lurw==
X-Gm-Gg: Acq92OFjFuxDBgQyOajW3dwGfUDU98yL500Hsdsjyj+2sr6vT2QMMkruG2AH7PGoRl6
	V1AB3ZDLtBsZjUW51dCI5rilRRtR1DrdB2hXEjGV1g/lw1nfh4aRPZpaltj/GugYJ7QIravhFEj
	nvDPZpYdMu9z79G24+vjBr5j/Gzqb+cucseIFkmlBXPkXUCa0BwoFJs/7mIlMSwD2W9m795CueR
	agOFD/DEvgziqfkAMq2KtLexuzrDEaWvbj+zUjldtDamT7reCAcG7YDJLc+kZiUPbqJ0uz9lCGz
	3OWzCKEcsFDGawvHzELZ62FCYyGQVKnOue5+7XnHc6yTVFfGRGe/LKQ9c06csWP1RFJpAy/ZB5A
	UjaZ2dZckf5rCt/aV3SprJVpNrIhI+dJ1WXLXUZfwqZB/sv/rZackcqVK2fPlqYxvnsjdPTioDi
	XOiSadpkGucwAzAdrRAsmWLje7Ix7ffY8+tUgtHwq+JWEqgTJlJU6Z3yZnGuo4qRD66Y8=
X-Received: by 2002:a05:600d:103:b0:492:10e8:3f92 with SMTP id 5b1f17b1804b1-492333c94f6mr41085095e9.17.1781697431025;
        Wed, 17 Jun 2026 04:57:11 -0700 (PDT)
Message-ID: <b25b051d-c37e-4110-b250-a3c2ce34a936@gmail.com>
Date: Wed, 17 Jun 2026 13:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 4/7] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781697431-7176D8B7-0AD39D5E/10/73395122804
X-purgate-type: spam
X-purgate-size: 414



On 6/17/26 11:27 AM, Jan Beulich wrote:
> While the granting of permissions when mapping was already removed from
> this operation, check whether permissions actually were granted when
> adding a mapping; the check of the requester having permission remains
> unaltered.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

