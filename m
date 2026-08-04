Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E27C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 17:43:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382507.1625854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJAc-0004HL-JF; Tue, 04 Aug 2026 17:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382507.1625854; Tue, 04 Aug 2026 17:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJAc-0004HE-FS; Tue, 04 Aug 2026 17:43:18 +0000
Received: by outflank-mailman (input) for mailman id 1382507;
 Tue, 04 Aug 2026 17:43:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrJAb-0004H7-CC
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:43:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrJAa-001NYu-PP
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:43:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a72247a-bab6-0a2a0a5309dd-0a2a450ab7d0-42
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:43:16 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7224b4-f2d2-0a2a450a0019-d1558031f1b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:43:16 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so551155e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:43:16 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994dfe64e0sm17657735e9.6.2026.08.04.10.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 10:43:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785865396; x=1786470196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhcQEnEut2xAAreQwODiVE7doxB7Jsdq8IAHiAi9kX0=;
        b=bFsJNWfxrZDnotwsthDQHRligR74wV1Yf63ba+bANB2BJMddjVo23AX3Srm1c276pD
         zf4bSmJjoPVhN2I8sQ0FLEcHZk0t/zLqi6b1IwiRfuFEGIghtt7q4WmaeM5FcnIMXDrW
         JFQzQeDprL/u+9VqqjhH6FGUSQLnK73qcVmAp/loTTvtQ70A+21951SvQ1obMt+znAcx
         tZw5ACqXsnZ8t0aBgoB7FyEc3CLQ5uQL635+Qv7Ku2bcrqizWlM5I7QBsW+H+ct5t22g
         ALup4uHxUHksE3BN/U/J5Zbo8k1YsmqTnYBjCiHebhzyi0ZcRWeeIeASA01IPTiI6wFP
         PnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865396; x=1786470196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhcQEnEut2xAAreQwODiVE7doxB7Jsdq8IAHiAi9kX0=;
        b=fHpeYBAUENlJ6kFDLbWHQCIH+7X3iw7g0oD3DqAgOe3zVi38lcsGadycKzD+6LTjsi
         OvdYTQzcS1Jah1EiRfO+8jaXTKggxoVof6e1jKtQrj1bu0667sKTRfoFGpBquiofy9sX
         l4CX2XuZgSqjX0au+F2lMgaEGPDrSxYRJPbTHS8kbOR//dOsWulbpaMs/XD0Qk077q+q
         IVFXtC/kUMGWgbM2Ei8mRAko7COf7WJlqFOJM8uQ4KOk97co+tFVB+rfafmAA2xMyjFs
         ofJj52FtCERHSXPCKhFyEViiaSZZnpm2Pl1VejjIdUHQnmcmQOWg+GhYq0upTMubZKJX
         Ue0g==
X-Gm-Message-State: AOJu0YxYSRNYgvvBYPiXV0WZJAKc2XLhKLajwDfiyO494NhyUfHUw7Hp
	yp7+UqZ5TYjIAB8+oZvMleVBeyA8jIT7SGajqmnG29PLe4qG2tDN9qDCa3TpwZsaviU=
X-Gm-Gg: AR+sD10+avuvoJ2/d+lJfhLeuz7z1bhzY2mz8GEDnxOVNs5n+4qN3LbLD1ZIFjmWf+P
	UWGzkIcSDfvrYxW9o3E+72JDYhOMI6mb0oBrzFiyDFxxsyd4ftzAOrjrshBIPiBTb1mpsAPDpLg
	lAmKTdQ1+xZosZvaTaB+IMTtkTO1eMugUAVwZj8e9QxHe0uwnSHaZcjFvZA0htGe/LEM3IH93BT
	YaGWXlBi0ZneEFWpOm+ri7/Bf/kSr2hfXfrwxzjexwiBHKs6MeG5jKru3Bldy8zgEMbvP+2/yhk
	xkCWs3+yKLUPTShG+LYkmz5TqCMTf2KTLCSlMzUEXmP8+CvA3pUCF259VVORvO/7OC/7EetVcbK
	Od+xJ8aivgKcv87Z4Vr7UISKVE8XUcFV/ZVVeJ/3y1YXX19uIso670jMnRaMd92oTBUNRMypn5Y
	07J4yf5S0OdjyPmDoWai4aynx8VmeJCDY4KATPqXQELIMvQB8o3uivxndQ5Ciam7kd6F4nAYdRI
	2lHjPndiaMGjvvciVatolckoH1lFAjaNewim3U2fNJmEjgI03k=
X-Received: by 2002:a05:600c:e48a:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-4980c695d6emr250589315e9.19.1785865395972;
        Tue, 04 Aug 2026 10:43:15 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] CI: Check save/restore, minor style update
Date: Tue,  4 Aug 2026 18:42:16 +0100
Message-ID: <20260804174219.835096-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785865396-530D9CFC-369CA70B/0/0
X-purgate-type: clean
X-purgate-size: 483

Main change is the second commit implementing a test for save and restore.
First commit is just a style change to reduce number of commands (and lines).

Frediano Ziglio (2):
  CI: Simplify directories creation
  CI: Check save/restore of PV domain as part of qemu-alpine-x86_64

 automation/scripts/console.exp           |  8 ++++
 automation/scripts/qemu-alpine-x86_64.sh | 51 ++++++++++++++++++------
 2 files changed, 47 insertions(+), 12 deletions(-)

-- 
2.43.0


