Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3AFC44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 07:18:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362772.1614520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjts5-0003FI-7j; Wed, 15 Jul 2026 07:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362772.1614520; Wed, 15 Jul 2026 07:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjts5-0003FB-5D; Wed, 15 Jul 2026 07:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1362772;
 Wed, 15 Jul 2026 07:17:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjts4-0003Es-5f
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 07:17:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjts2-00CRdK-Mh
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 09:17:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5733fb-bab6-0a2a0a5309dd-0a2a45029a46-18
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 09:17:30 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a57340a-6ca4-0a2a45020019-d155dd2de9a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 09:17:30 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so1317742f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 00:17:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a33a926sm119840585e9.15.2026.07.15.00.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 00:17:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784099850; x=1784704650; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPehq+ker6oxXZylSQ4xG7L9FR9cUThlL28wP0uO6II=;
        b=VOiIAeRwYCdtJYcGIT1SvWhb5cegWqzN6B8UG7kr+bxZPyL2hqYsJqeuZJwD29MON3
         CKhhLvFM3Bil8Cg4PO4tC6oCBq04BLN8sTIpwC4t8olGmNU3ScOtiOVJ8eDxH56LfqYr
         avXJ6qcyR/BjVf+0NKFSv+LSWAdlztp2NX11XhIUH382NPlB2DAwtyMinzUDcCXX+sTP
         117m5XwtmK6NuMmCyXHEuIzW8l6pZXXdkHKEodFUSeVUBeNmcCVbW9I7QHuZa2G4+5SD
         /O/GdAeTnK9HbaSuyMEEOwOZcl9ckMh8vqx4x+DzbZcazmmcZX24Xz+AaTtvtKQk7frz
         JGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099850; x=1784704650;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPehq+ker6oxXZylSQ4xG7L9FR9cUThlL28wP0uO6II=;
        b=UFReKRBrrLFiNVmlkbaCcS6MTZvowqfdKro4rlqgjxy27HWzqcgd3CHFk+LhqO9iNe
         dHTv7MwpzSH0ZV4+FRqJtQJZWN2KsKa15rMCCwcxxgds5YvZVuBJU6xroNwLuyvf6RKf
         o2kp9v6DSi9hSJu7pnz/HuL+OHUsmvX+FuDdxBUl/eGEJuW1ZnTE/CYFO2YNSeJR6EWf
         rBiGjiwbSTkw5pLSU0Hswgh5FI5PBZnff9SvZmgnHZmiAdWgZE0T60+rmv4tHrzE62cs
         BZzPDUpAHNJJwdnL/l41LcOLu+i0BLjSuTQOfIcgWUmP2fLAFZS0ssmBgat91SMyrwKq
         TklA==
X-Gm-Message-State: AOJu0YwGQ0YEvYW1NsjqYCxYXlZ8yopMagan37JSklXi3iduVx93CoBD
	flZaBOB4Q67UiKRmDEdXQaCwPwIhD5+Kh01h9OOwZduKCP2GLOOhBwLtyUes9Q==
X-Gm-Gg: AfdE7ckJxOlekG4b84P+GO+viDP/N5+h+Kfr51SwYCH0FfOvCq8FMZ4/upZSF2/n4q5
	iUc0vdsoYSl2ZWQ5tk4lnGPlmVx9Z7lhaVYtS82bkg9co9j+f+pkboizrRFSO4PnSCz5GorD29R
	DduvgJlBGvTx0/4ehP99k4S9XiZk7nK9tI69piO+N/lyKdJmK4nQVBNV6DvSpe6gXeVAuIUF3JZ
	seueYr4Oi4QjUGIDKy60gid+FGyCSiydbCrXn3n8XtofePJRK1xmDsVRB2PvH7HfiBEYxQ/I31+
	VWt3DzyHwaSIA2A5dl6xX+br9ugxwGdIMwYLgjYFkDbeTJk03viwdt55BJOpNmgkzoD206R3l7V
	WQ+x/2RpqdD2XPvavB2Qq1jvUZkf2RChwWHWL/ARuhEXRLmDNdwPrdYVtRLIFxT3ajffKHaSwE4
	QxF3ENQp7fFu227kg7Gd+LvPQTcEdnWpYeDtCDRRAvXeqtqGs8jVE6t8mDc7yRGAnk8uE=
X-Received: by 2002:a05:600c:45c3:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-4953e08adb6mr6511245e9.9.1784099849599;
        Wed, 15 Jul 2026 00:17:29 -0700 (PDT)
Message-ID: <ba151020-55ee-4df3-ad40-5d889b19d8ab@gmail.com>
Date: Wed, 15 Jul 2026 09:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.22.0-rc4 is tagged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1784099850-31BC82AC-87142A1E/10/73395122804
X-purgate-type: spam
X-purgate-size: 420

Hello everyone,

Xen 4.22 rc4 is tagged. You can check that out from xen.git:
git://xenbits.xen.org/xen.git 4.22.0-rc4

For your convenience there is also a tarball and the signature at:

https://downloads.xenproject.org/release/xen/4.22.0-rc4/xen-4.22.0-rc4.tar.gz

And the signature is at:

https://downloads.xenproject.org/release/xen/4.22.0-rc4/xen-4.22.0-rc4.tar.gz.sig

Have a nice day!

~ Oleksii

