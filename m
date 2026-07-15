Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF97C44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 07:25:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362785.1614531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjtzC-0004wG-2Y; Wed, 15 Jul 2026 07:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362785.1614531; Wed, 15 Jul 2026 07:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjtzB-0004w9-Tx; Wed, 15 Jul 2026 07:24:53 +0000
Received: by outflank-mailman (input) for mailman id 1362785;
 Wed, 15 Jul 2026 07:24:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjtzA-0004w3-Gu
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 07:24:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjtz9-002GcI-Tg
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 09:24:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5735b1-2eae-0a2a0a5409dd-0a2a4503b4cc-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 09:24:51 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5735c3-fae8-0a2a45030019-d155dd35e48f-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 09:24:51 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-470174001a0so916713f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 00:24:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464d6fa7sm13890315f8f.37.2026.07.15.00.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 00:24:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784100291; x=1784705091; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h8G81wEFX++uMuj4xtPbL7BBy8MBUfXYEBGWYEtIBVY=;
        b=fSes+lcFjTIa36hYi0I1LmoQOLvHJ6YUt/VIkEs9Ml568a/VCkP3m4cyHjipTAIBcr
         MCfgpbBcWsUZoCaexQwi9TPtWHAfcOFWWJ6kUPYL/htPJW/coYKWPKSqT1GYljE1hXob
         gKyJB9tIZUiSsOvYpk3FSMI1cUhQufAPyfkxEsPkf6UEsHkxJCfTu/xp8K/rWZk1NdyT
         lgUIQe1RVulyyTdZxOwxs4IUijP397/LOjroFXvCHTP5wmJENifbDI4lPkuyhfZtYKyp
         AmRWUZq3sk342F/dC+xf4WCPTBiKgYW0tsGGuDl00Ww2q3MXjjaQ3A/ICqEQLfZ7gNlO
         p/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100291; x=1784705091;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8G81wEFX++uMuj4xtPbL7BBy8MBUfXYEBGWYEtIBVY=;
        b=Rmu5Mk9CF2iTPVnxD2wR9q9ax9uhYj7unXtfSjZaZvm7loHC9LWHPC1k+Di7d/O+Tn
         BRdWQ2FP0R/eGi4IWQnnzS9dreX1UsFXBrbQZmRPCWhSOdhnLFKroXXJAoHYxc8ON0EN
         X6TZHK2GMFjV+ll5Srb5pNWbrUzWhqF+MT0Zu3XXdXG6EV3z1c9JJRkHrlH4vgg3KZ0+
         gu4UTfd4fGzwmWNvqk2AXlC/7DSi6+1BgFqqO9Nsb60XpiGY4RAZwAmITUGxLb/4kpEI
         CF62cM5nD03j6HyfYvN78PIipol7v4uGFAABJ2z4ZKy/+pq8Yd7glUm+cHtyNMJYXaAV
         CqZQ==
X-Gm-Message-State: AOJu0YwJrILZI++FJLAXPGMLQsOAwzYlAuHVmkb8BEkuRUQ9V7mSe6J8
	x5QkMJs1ZuhVJg9VR0Rv1r4Ar+S3VQXKCYPDvUkN56axw2fSRvwn7BX2oCrhbg==
X-Gm-Gg: AfdE7cka/nRunfyPFqJzov3no/n6trAsEF7qP+pnQ1wWBD+11ghG2KFyf3Xa+EB14bV
	16/Qj/PCdPZqQFYVOW8Bb1wSbnwVqvrRCga07v3Rl2gi8e1Mq0DNFQvgYT57lT/pHa+uV7gqcKt
	w0EtWfY6srVBZ7X5zgmrpbTf0+cSkA6uLFmG2pW845vl+uDQw9ckOwK0xH/gPLD+oL6egESZRdC
	0AEGdY5eyZ74z2goQz2o8UrjM3OvsJ6ZSW4pOlEGSpwwmf7u9+oAHorrmANcQHp0xSOriefRvPg
	clm7D08LMQoS+tciOOYwq8HgQNljnpm0mpglTa+nKM3OfTYst2xQik8905OU2I0dksGol1BENPw
	2Mol5K+btUuVVcHtj1YzQnKyGgARzFKX+Qb7SscvPCFzxnxfm9fx3OZyno78vxVsm+jyqSaVQeD
	tCwdugKnCKX/5Mb1kWsTxSSYF115oxcUuRFlS4ox5s/OyJ8iGDMs7M734Zv6Okorc+DII=
X-Received: by 2002:a05:6000:471c:b0:479:e6a8:c0f1 with SMTP id ffacd0b85a97d-47f2dc8d79fmr16470155f8f.9.1784100291178;
        Wed, 15 Jul 2026 00:24:51 -0700 (PDT)
Message-ID: <e88d25a6-8d2e-49a6-9cac-702251bb8df2@gmail.com>
Date: Wed, 15 Jul 2026 09:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.22 Release Postponed to 30 July
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784100291-6F4C74E9-95783E1E/10/73395122804
X-purgate-type: spam
X-purgate-size: 431

Hello everyone,

The Xen 4.22 release has been postponed to 30 July.

The reason for the delay is that a set of Xen Security Advisories (XSAs) 
has been pre-disclosed under the standard two-week embargo. To ensure 
that the security fixes are included in the public release and become 
available at the same time the embargo expires, the Xen 4.22 release 
date has been moved accordingly.

Have a good day.

~ Oleksii

