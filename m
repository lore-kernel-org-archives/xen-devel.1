Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1342EC61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:20:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403955.1637880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zP-0006nX-J3; Mon, 31 Aug 2026 12:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403955.1637880; Mon, 31 Aug 2026 12:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zP-0006nQ-EC; Mon, 31 Aug 2026 12:19:51 +0000
Received: by outflank-mailman (input) for mailman id 1403955;
 Mon, 31 Aug 2026 12:19:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x10zO-0006nK-OY
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:19:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x10zN-00Dc7p-MC
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:19:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a957164-8faa-0a2a0a5109dd-0a2a4507b388-8
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:49 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a957165-b4ea-0a2a45070019-d155dd2fcdb2-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:49 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so2964333f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:19:49 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48440e094d0sm847709f8f.23.2026.08.31.05.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 05:19:47 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788178789; x=1788783589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NG648HPaf7qwInbMqQdYHDK/TmVROUa07Mg3m1YSEg0=;
        b=rnNBHg/FmUCHjG2dBRodLD7EBgQYyIMXwONrDKO2rzIEa9iVfpuqJaCISxS+kVcYWS
         RS+7EoXqcy/4s4Fgfb5ArmTHODTNyNgSOhp6B++620qqSCbSCesDuC112X3l5acokIv3
         48EJijBgVKwtT8vp/tAa2+YhZ2kjrDPl9rglo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178789; x=1788783589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NG648HPaf7qwInbMqQdYHDK/TmVROUa07Mg3m1YSEg0=;
        b=UEQ4QgE06qyJ4aInjSvjsBOl7guX50VZ+DxpTMhZsMJBf9z4P2bR3qu6CnRuARmjXV
         gOZmupV+A2fb/Exahem1JMJvSm2l51PiWDNg5c9d8Tpq2Iz8C7l8GkUqanPxQsn7O9hS
         m4cT/0yQ6TrnMeOnKNKVvbq4Rwo/4ZdPXqTiYXjXhSMgp+LqpKCAMfv8srNWU7cIy+Ty
         kBiRFfRUS44O3NUKC3fSfYwwYnx0yYbV0Wc/7fxH1QpXWctr3KEjHwnFSGj4wr1uF3k2
         Iez+IrBzGOKbSwIAc1kk7J7ZlV92p/Qpmql4OPkOlAP4wdaL5PDJlETeJfvud8LFSS+s
         IjOw==
X-Gm-Message-State: AFuF++mZ8Pno8np0BRlItOYkGQZr/unr1Agm8hQRLAId3mwYwfu/Pnxv
	J3kM0oDpzJFNO2ax7pkcZ4I6Ewfv3sZx8g3la34qCpRUxi7vr7cjBlILxeKIgB7V51Ub1jycdYO
	MN7Exqdg=
X-Gm-Gg: AYBFou0GEN1fHWp/k54W/GzjpzRB7FF0nUQiTjM2nKXt7cqxOJMpkPIdjXhIhEmZPDo
	KF6EoF2pZfn7iOLmzBP9ipw9tRjv9Vm9Ir1vQhImHSQ3iRLHaS+/HoCXDr0IBcqNNudVL/nb2u4
	OK8dzNHr5EJpISP1XB+qTfoddw5nX8aeFTE4/7VTjxmXdaGiSSJxdH9v7Up1ayeZcjOhnblsPE+
	j2Rh43QjfuagVwD9JR1XBDj1x9vu60kR7+RM22ysaF1tKx0cexJEWhnKHemQnhYsmVGs8yOpUQi
	LzS+wlgWwj33DdF0VeN3UoYCjGDrsNYhu4vh9KWbaL9TC0HW4Ijqz9USGAFCIb2++UnAQmfAc9V
	QFm0ajeSSMTLQ5/KN3ewZY0Tm6tdn8MbdzbeZA5QN1qQ78jA9w3sOKwggwrmyJ2vcFdvGbOow7F
	SEghsDe52QBSete43/TnljIW5FIlYXB5gO+/4f7n9ERP5bcBPXcqyFqZqTpLxlX6ntatSuy2ivp
	axd+lHDkomsRA6EPjeyHGVJVRA4tdI/2HQBLPUd
X-Received: by 2002:a05:6000:4a1b:b0:484:3311:3702 with SMTP id ffacd0b85a97d-4843fce530bmr2884410f8f.25.1788178788537;
        Mon, 31 Aug 2026 05:19:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH 0/5] xen/arm: Fixes and improvements to SMCCC
Date: Mon, 31 Aug 2026 13:19:39 +0100
Message-Id: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788178789-A4ECEAE4-4526886B/0/0
X-purgate-type: clean
X-purgate-size: 1243

Patch 1 is a bugfix for the issue reported by Jan Setje-Eilers.  It needs
backporting to Xen 4.22.

Everything else is because I couldn't bear to leave the code generation in
such a bad state.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2805409790

Andrew Cooper (5):
  xen/arm: Fix evaluation of parameters for SMCCC calls
  xen/arm: Introduce arm_smccc_guest_smc()
  xen/arm: Clean up 32bit arm_smccc_1_1_smc()
  xen/arm: Rewrite arm_smccc_smc() for arm64
  xen/arm: Rewrite arm_smccc_*() to return by value

 xen/arch/arm/arm64/smc.S                    |  16 --
 xen/arch/arm/cpuerrata.c                    |  18 +-
 xen/arch/arm/firmware/scmi-smc.c            |  16 +-
 xen/arch/arm/include/asm/smccc.h            | 241 +++++++++++---------
 xen/arch/arm/platforms/exynos5.c            |   2 +-
 xen/arch/arm/platforms/imx8m.c              |  16 +-
 xen/arch/arm/platforms/imx8qm.c             |  16 +-
 xen/arch/arm/platforms/seattle.c            |   4 +-
 xen/arch/arm/platforms/xilinx-zynqmp-eemi.c |  17 +-
 xen/arch/arm/psci.c                         |  17 +-
 xen/arch/arm/traps.c                        |   4 +-
 11 files changed, 165 insertions(+), 202 deletions(-)

-- 
2.39.5


