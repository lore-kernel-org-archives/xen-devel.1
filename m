Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCDC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:43:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405695.1639145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNZ-00069c-Ta; Wed, 02 Sep 2026 11:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405695.1639145; Wed, 02 Sep 2026 11:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jNZ-00069V-O0; Wed, 02 Sep 2026 11:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1405695;
 Wed, 02 Sep 2026 11:43:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1jNX-00069G-Qc
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:43:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jNX-00GR2t-7G
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:43:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980be4-8faa-0a2a0a5109dd-0a2a4501b802-28
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:43 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a980bef-5984-0a2a45010019-d1558033e5a3-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:43:43 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so6257155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 04:43:43 -0700 (PDT)
Received: from andrew-laptop.. ([185.110.61.35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46422desm61190055e9.1.2026.09.02.04.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 04:43:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788349422; x=1788954222; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNHNJ5oP6qc80904CbFCtBGISp3TOMtzo4M993nbReA=;
        b=ChjnjY8IQc5VNzdTrE8Qm9uD8gSfSXpWY+8uNVo2mr/Oy1RhzVGXTRJA8L4C9dSH/f
         ptec0qv+z8KLoKf4dZaW6N8yp70ni4E1CgoRPvDFLkvOK2CllvP/nNAgAkJ9b22qJ+oU
         crQicPd8hgPyyDfMAONgSTZE4W1PzEny1/cME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349422; x=1788954222;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNHNJ5oP6qc80904CbFCtBGISp3TOMtzo4M993nbReA=;
        b=YnYXYP7mZeXR5Fc9k1Cd85GT7EYckgtPloIIvZCKYDNvDxyz84uYXY2Bxkvx3UC7gO
         M+hFFiDo2bRoz/I4JWn+7PBykL3mDKxQPJq4niIwPUmUgwIcUrhhJ8Plz4Zgy6sxVa/c
         xZcZRK2qIF4N67LcJF+4I8WejR3VSEOqosj4A0C6tMu5x1pY2DcuXq40kkub0eDtJMeE
         I1KLnk8d2Vv6ZF9bf08N2BBGXNLdgwO9ZZa9sZF3GVCzVKEOB5rGKgcYaFWFR0hLqipx
         jpEb/EOt6TliqVNGRUYwFYkZlvrgVkw/QCNwjSjT2N/TnLS7x4ZNW3Tq3rTZPHBrglFA
         Zcig==
X-Gm-Message-State: AFuF++mgIxyFy7/6pWVBrg3FaFZKo73v4pvWFp9TzdA2GyXOWQikR0RQ
	I/bJbOmJcuzRtPT7dxEtYnQssvRQUBotiRPpaMGdt0zt5aex7ncJZ4Siwd6VAOvi5/02DoUY5Mb
	8ERK3
X-Gm-Gg: AR+sD12av10pJaGFNnFlkNOREdjed0LXc0AEEfrTPKkbSiQQKAqlCbDF10+p1XZ9vRw
	9eh6X8mW0G+9LQoAPh9zCminHLbI852b/vu2D85VHfQ+hVGgKQxAlRlbmcqwkWjfpZdct5L4lOR
	mvARaVgTFqW646nP1m8grnXzuTBgIieJnl9sJs5hs7euMkvNOa84YKjXmeMPY+3OBBVRG//QgW2
	baZWUgu4m+TqWV++tX2SrfhmgtkVu+4aAjUMWcCNanUR0Kl/NbSwib9kO3rqr6k0393Qn9ynSFv
	+Y+qFAfqCVDE/n9VhpKgy9V9FtNk1QnN/+FuRjKW60Qx/LIzXk8ZlF58R6sPUBnxnYmG+LA/WXb
	7g3T68pgNJKSzVRVC1bty/lxVHp2+eADIAT6tSakeiqu2DbPgwBL2OHDxSoKFm/z1qM91081w1e
	bQpI/nPUl1JjWgPOaMKgfjxs/kIbHCxR7Dl2Jk3WDZONjLTxu4tUZyYflqK1lgW1MWtVrB8Z0=
X-Received: by 2002:a05:600c:3f08:b0:49c:e1ed:26b1 with SMTP id 5b1f17b1804b1-49ce5850cefmr78059665e9.16.1788349422028;
        Wed, 02 Sep 2026 04:43:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/4] xen/bitops: ADDR removal
Date: Wed,  2 Sep 2026 12:43:35 +0100
Message-Id: <20260902114339.62043-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788349423-BF063757-78E4D738/0/0
X-purgate-type: clean
X-purgate-size: 417

Andrew Cooper (3):
  arm/bitops: Drop unused ADDR macros
  x86/bitops: Remove CONST_ADDR
  x86/bitops: Remove ADDR

Jan Beulich (1):
  x86/bitops: don't cast away volatile-ness

 docs/misra/rules.rst              |  3 +-
 xen/arch/arm/include/asm/bitops.h |  3 --
 xen/arch/x86/include/asm/bitops.h | 51 ++++++++++++++++++-------------
 3 files changed, 32 insertions(+), 25 deletions(-)

-- 
2.34.1


