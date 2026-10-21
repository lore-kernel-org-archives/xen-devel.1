Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241A606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODb539Bf
Received: from list by lists.xenproject.org with outflank-mailman.1456965.1669989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJUgz-0008CZ-FA; Wed, 21 Oct 2026 11:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456965.1669989; Wed, 21 Oct 2026 11:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJUgz-0008CS-Bn; Wed, 21 Oct 2026 11:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1456965;
 Wed, 21 Oct 2026 11:41:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJUgy-0008CM-3o
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 11:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJUgx-005gAG-Gs
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:41:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad8a4d7-e002-0a2a0a5209dd-0a2a4507c1f2-0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 13:41:11 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad8a4d7-b4ea-0a2a45070019-d155dd2aacce-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 13:41:11 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so416859f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 04:41:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583f25asm4779096f8f.45.2026.10.21.04.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 04:41:10 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582871; x=1793187671; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=llresBdBQJEa+pUyBfMo3RMCjuevYB264QApIKbkTwM=;
        b=ODb539BfqfoQNtmRb20+U4NUifiIvJLK8zRN4eEBP92kBXgG9fV/AAkIieFzJEbfu0
         dC0UF3cJn+pzCZqEey0KReo7yb1So2Y82bjxG4H3dWBmQnny9RbvqqFbbdjkOw+NfTVk
         wgIrrXooG+Wa7RiEEq6ynN7aOGp3FfOgyR0hz/Ko5JEOfjZd7VrPy0xjkncqrEdhoNy/
         CT/Qq2Ba0jFPVs3LNVMfy2Ih1Y6viXhaIihjXL9sbB/E4Qcn2unpTbCKA8ra2PVIlYbe
         idFSCLb9vC8PYUvzFERXq1HtdWaE9YYpRkcaIqiSMkRHcHmYLunDUq5XAN+cawFzcpuU
         b1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582871; x=1793187671;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llresBdBQJEa+pUyBfMo3RMCjuevYB264QApIKbkTwM=;
        b=eDKeDppjoLo18PTcnOddv3UpIC/vSn3wSlhdjSrUBnyHmpXjWwuFLPYQdyueM8I6+i
         02dbzykre0+Z6x1FX7nXRVbD3ZkGxkmAOdQi8uT4lh10vEZmb13e7m8ZYKZiRouVE34F
         R3rqDK7482hrggNeBwNmGgvYRrnU50fJWn90bm8CHK3Dxo5gUM9LG8fcBZfkZoNdZagc
         R85McOnjOvoTkh7A3VMZ9JcuzRr6iKBFsmX/9jC1iVC7ZqAJExZTGf2bAG7dJSnlXd42
         9QZ7O8yM/JJlJn0EVuO4MbmOr0Pu+/HBFOkWxmTVr4lJb7mjRFDaACh2drIwbQsA59Ej
         sNlg==
X-Gm-Message-State: AFq9FYJ+hza8S+wmFNsLvotLieNupGvXCWIdRONfjJDszKEvJjdSQpag
	RH7BTxa3pEFe3RYIOiijyuVIp2ESnGIAuK6OpPGswdH6V9gyKYiQFa8fC4Bl1Q==
X-Gm-Gg: AYBFou2qd9KBBalZSRzhIQayWTBmEyvkHLC74so3w1V75oU5iTeXvedEykaVdUgWia+
	dKFq8a3VEXQY2elZaiLNFCw+kOAf1Y9ep9R9lHcTeP3v+OMVtH3xm/UPZUMoF8MAnpMKtq6BtJr
	tvp2oFhRZ+Ww5gWM+Llzru7CjMotSDomJhqn7GG34KQHh67xpBW05cDyTbO71jAGHiyqHAfWEEY
	0Pl19Rbqhdco5Rzlir/NqWeTyXW+0gHVfGu9FsMrZpDPxaQetAZD459c08Fev+HT6ZY+AY1wXSs
	v1hGsKNr3qPJTLBUJVwV4VNW2lPd5Cgj3n/oSNfl4Up31Yfxq8HspQ7KWkNADsM+2kjjl9eYshh
	kTV9ipOvD0zXiz7ROWT1+J7iAAzRoZ+un3moyO3lLeKDcNL8yZiqJFjIJaiNYzB+wv4YVfCNiOh
	X9paSOVo/CrQbRLlpAkhiHEZ5zQU7pLA/O9hjmQgWkbFVU7bcpqm0zdbwbzaH+KeIo0kNMdvYXZ
	f5naOPwy/UQ+wId0zorCv3oUou80tFD/i+bn3Ydjj7CQjvh+NS7KxIU88yDHM4RA2NxmWSK75ZZ
	4O57HYtEzZBdClhm4CeZ/WCAgolv
X-Received: by 2002:a05:6000:1a8a:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48e264ad992mr3872218f8f.27.1792582870555;
        Wed, 21 Oct 2026 04:41:10 -0700 (PDT)
Message-ID: <79b3daf0-6d97-4e30-a8f5-3df1c35dcfe9@gmail.com>
Date: Wed, 21 Oct 2026 13:41:09 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.23 schedule
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1792582871-35CC7AE4-33C7887E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1025
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

The release schedule for Xen 4.23 has been finalized. The key dates and 
milestones leading up to the release are listed below:

- Last posting date Fri Feb 05, 2027

Patches adding new features are expected to be posted to the mailing 
list by this date, although perhaps not in their final version.

- Code freeze / RC1 Fri Feb 26, 2027 (+3 weeks from Last posting date)

Features posted before the Last posting date can be committed until this 
date. From this point onwards, bug fixes only.

-RC2 Fri Mar 05, 2027 (+1 week from RC1)
-RC3 Fri Mar 12, 2027 (+1 week from RC2)

Fixes for serious bugs (including regressions) and low-risk fixes only.

- Final commits Fri Mar 19, 2027 (+1 week from RC3)

Branch off staging-4.23.

- Release Wed Mar 24, 2027


I've updated the Xen 4.23 Release Notes with this schedule, which can 
now be accessed via the RN link:
    https://xenbits.xen.org/docs/unstable/support-matrix.html

Thanks and have a good week!

Best regards,
  Oleksii

