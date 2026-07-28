Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE17C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:48:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374913.1622255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok2m-00026p-15; Tue, 28 Jul 2026 15:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374913.1622255; Tue, 28 Jul 2026 15:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok2l-00026a-U5; Tue, 28 Jul 2026 15:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1374913;
 Tue, 28 Jul 2026 15:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wok2k-00025V-NQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok2j-00FCsc-Sg
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:48:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68cf45-5cb7-0a2a0a5109dd-0a2a4504c9e6-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:48:33 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a68cf51-b57f-0a2a45040019-d155802de0c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:48:33 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4956242332dso35314025e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:48:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44b6b93sm88807765e9.4.2026.07.28.08.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 08:48:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785253713; x=1785858513; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6L63Ny7GTkbTal1OI3F5CsjBl3w3ve+x1CwzJJJxFs=;
        b=lfakUPO9G2zUklMG9keejPXXZ47bNJqCY5583sh/q0wavl//o0FxjKQR8seczdfypw
         O2MYrQGpM5AO+/vkco8Yz0R6AMerHkZV0yqR0/4TTugEatnIdQExT+E9rcyHxVeycG/z
         cwTI7MOk1qAIJ9PtGHt9efTVAt3feKz7PcFz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253713; x=1785858513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6L63Ny7GTkbTal1OI3F5CsjBl3w3ve+x1CwzJJJxFs=;
        b=McqCNqRLprPiZ7FJSnpdNyfHgW8M++/Ua9y5h/D1A/2dWyHg7/PBh0nk+MPmZcxsyI
         psRVExMEWmNxF7rvMkKENgtV2YX/D7T+w7oYuY7+27XPiEQtnHfZz/d0VeKD+hg3z8ok
         gEeVl/RpHtACSsDLctKjOcAUBtQ1aOS0dFdhYDUuC5uplBGXuGw9USV6eo10sq71DT5G
         HUBYpxUFyMcgimyiogiPw7TsIWSFEmKKCYc3st3kogks3p67lmXVkfEyCUr5VUZTPnhA
         vmH3bSrPR1QPeIFxbhPfVJBcLiXst0Qvx+jZdh+nuCBGXBZTudbz9+qTno/4E7dIRw4/
         w33w==
X-Gm-Message-State: AOJu0YxIb1EwyCbAnirNLcJwqmq0dENvGR9BFl/EGe12sdTIToRegNJh
	yQr+yn/lTdCmZSxZY7o5Gl4B14XsJkbsk8v3GDYluWTUtEaKJR5uqlaAXDNMVUq2VD11OVPQJHg
	1RRQS+CI=
X-Gm-Gg: AR+sD10fojjV7is817Dl0uRm0iv/3lvlfksfzJj6GMpF7kgLdDL1PbCO8UmoHZNGH6/
	Ptg577rPkst/WHsQ6ph2KiT73tdEi84lOJ7N614bDRZqHBV+TUDs9SSjrHwkj1IdxTs4ytO9frA
	PeDhZjleg72UgaqsOYmpvt5lLh+Wn4RdwW7zpCba7QyIpeHxF5qeSmUmVeI1mutb38yHVnmDcvR
	qEFrLMeBX5LeZdFbJq1uaXRs7dJlW4mrOwbE2ojwjJqTMXBzME4pEVil2x6NyxYvNBsqyivwp1I
	cC/5Ep/0lcTPV/UiFoWWMsiWv0zZHI2OFXofvwtNRTgsmpTjYD0xAIVl/hrIqVflVcc700ljDPJ
	3LQ+J3wb0I0/sF/4p8KN73xoDK6qHN2PycA623XAj6ADHSsv7ZkHsmzKEFlwFljgAHeTstvhqRk
	i/tGUIyyjw8/8aLqpwqYlBOTt1l+gZeM1jdDGTh0l74wDBum40+JI5jGCj6E1PUcQ=
X-Received: by 2002:a05:600c:6992:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-496c6590745mr32635345e9.18.1785253712958;
        Tue, 28 Jul 2026 08:48:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 0/2] tools/ocaml: Fixes to Xenctrl.domain_getinfo{,list}()
Date: Tue, 28 Jul 2026 16:48:28 +0100
Message-Id: <20260728154830.67734-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785253713-C0CDFB50-26ECCA0A/0/0
X-purgate-type: clean
X-purgate-size: 639

For 4.22(?). This fixes a segfault in the Ocaml runtime on ARM.

It's not a regression vs 4.21, but it is deterministic and easy to fix.
Technically patch 1 is sufficient to fix the segfault, but producing an
unconditional exception is almost as useless.

Andrew Cooper (1):
  tools/ocaml: Fix crash in Xenctrl.domain_getinfo{,list} on ARM

Julian Vetter (1):
  tools/ocaml: Fill arch_config for ARM in domain_getinfo{,list}()

 tools/ocaml/libs/xc/xenctrl_stubs.c | 37 +++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 10 deletions(-)


base-commit: 75f920bd47a4f59eaaa4596aa3f4e12a447d26d2
-- 
2.39.5


