Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F314C53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 16:16:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376362.1623121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6wW-0004OP-QT; Wed, 29 Jul 2026 16:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376362.1623121; Wed, 29 Jul 2026 16:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6wW-0004OF-Lb; Wed, 29 Jul 2026 16:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1376362;
 Wed, 29 Jul 2026 16:15:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp6wV-0004LE-10
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:15:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp6wU-008W3G-Du
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:15:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6a271c-e002-0a2a0a5209dd-0a2a4504de32-16
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:15:38 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6a272a-b57f-0a2a45040019-d1558036c5f3-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:15:38 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so8090785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:15:38 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d70144sm68720345e9.2.2026.07.29.09.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 09:15:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785341738; x=1785946538; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaVjSQBAqdZw/2Vakv+WgA8kKddWhHRsm8IIY8XerFg=;
        b=Agnphxxq80YdW08up7rwSMgl2qHReI0q7EPLM1N35m65Zrs5bku+g8ToL7/WlKasR4
         QHrgmGP4ciWr4cNPQV0SzEVCEm7/5NqMKapjk9PVqvSMBKyML+sCUuodEaxTIhG9hOzX
         aDluDZ/lWRVZfeTmpmZTIgWaw+bD9FfICDxTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341738; x=1785946538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaVjSQBAqdZw/2Vakv+WgA8kKddWhHRsm8IIY8XerFg=;
        b=Mox4IjfNEF5OXpgiIveOPNEjK9i9GCHYo9jRNx500OBWqnB98YfPQxQhPDPqILl8DN
         /OdcJdoPrfl38nvswiyBzEJ7hembr11WhoRtlvUXLYQmF9/1ACuaB2gJsDT6vahvEPor
         sh7eIsOmqtmlp7rSvBB8OiFG5bNQgT7KUgUrSUdpmmHlByBhajWewStsFpe/lI1tWDP2
         p3DqmqobwUa4vsey+URzCQqKBhlpevmTpF1L/kF3sTS3X/bSvGC6QrUvus5Kdis2Hz3D
         YPlSTDB4BnlcdQrZEAeskFjikvztisaisZCM5XQmMvD8n6aec7kzMpEOkdEYlGlufV6H
         v9RQ==
X-Gm-Message-State: AOJu0YwWpZ5BKiD3gjYSrPLNZI06XV33qGoXzANPWa86K4elEK9gIeF6
	AXLGGWEZ/eAgI5btQiyAf2GdMHydOol6iRJgN80J2AvZ6eG5oYtydteeYeejN/xMDUKjOGZnD8E
	J4gsV8jI=
X-Gm-Gg: AR+sD13HtrVeSaFuE+/bU507oTlEUp7IQs6KzltabTeHD4jz94/JLKSOo97RnRTCz5t
	nUdRi+XqldECJRzTBClxYv02nWYi5FpXc/G2Q0zNM5ywMcTw3U3amoNBlBSHUg9X2UF+6VVnACG
	UeWosokSdngbLUZCU6GqxbsDvOp4CH84rI9xY6aEhPs7UHvfeqrmigG2UXp604kHlPBSdKXoj0j
	tEoAMeRuwPgHp42ktu0nYUUg1NeV9nATPGRoGWLIzaH0iO2mU87ukHZHj8I45L9pnX5vruTN7Nt
	cro+IThuv6aNnwyefqXlaWoqb4KmhXQHoFK0soH3jbOB5cm/yq4vCjLy1nv3u64uppGlkKBCr//
	zUjsZDu7NAp48+31ihhlNBhNq4iEq9aCdDvQzN5aNoiTMMdpuJhsESa9U2JoPwj8DtT09xgKTwt
	SA0lg7BlpseWmVIvaZLSCNqfR3dZbWXoOpLgsJJQYsBT+r/vT/T44/8NKzhSSncN00eBoabqewU
	meN98dgOOmkrQOE/MkwM7l13QIgF3Yl7RUnUvlbstdUG7Vf9w==
X-Received: by 2002:a05:600c:1d19:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-496c641518dmr96249005e9.2.1785341737678;
        Wed, 29 Jul 2026 09:15:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] CHANGELOG: Set release date for 4.22
Date: Wed, 29 Jul 2026 17:15:28 +0100
Message-Id: <20260729161529.164017-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260729161529.164017-1-andrew.cooper3@citrix.com>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785341738-51AD0B50-1182D268/10/73395122804
X-purgate-type: spam
X-purgate-size: 1081

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For staging and backport into 4.22
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1435855615ae..6f879c97962d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+## [4.22.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2026-07-30
 
 ### Changed
  - Users of XEN_DOMCTL_createdomain/xc_domain_create() must now pass DOMID_ANY
-- 
2.39.5


