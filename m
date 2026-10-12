Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927F1CA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 07:35:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445854.1661709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAYf-0005h1-HC; Mon, 12 Oct 2026 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445854.1661709; Mon, 12 Oct 2026 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAYf-0005gu-EA; Mon, 12 Oct 2026 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1445854;
 Mon, 12 Oct 2026 07:34:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGAYd-0005gV-AP
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 07:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGAYc-008U87-3i
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:34:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8d91-2eae-0a2a0a5409dd-0a2a4505dbaa-28
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:34:50 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8d99-4cb1-0a2a45050019-d155dd35b0d2-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:34:50 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso991510f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 00:34:50 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9aba3e5sm17622702f8f.31.2026.10.12.00.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 00:34:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791790489; x=1792395289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zHGX4VtiBD6X9kVo3dl0fflqY4sIieR53kMuKpSIpfg=;
        b=DftGgjSe2QU9KF7+6Tu/VvVc+RXR2GWz91KmQkvmcOP4hhgjain7wHx9hpphbqKaNg
         uGlWVin1Bp/RA5Y/VVlFMlUO3PXVxm4LUoVYbyfb1mCt3EqFCBQFiB+gx1sFphfoMdka
         pAsqgXQv/uVgOnpIAl16LXk/y77AGBxgJBuA2PYg3LEarhKNetlQWTayGXpt2udx/wSQ
         5IaAuUW9bqdN7nYtG/XnUO47f2BaOrU8N30VPkqb7V+25FrY29SSwyOLmjZbXXybks1q
         RiUV02BYAhOyzzn/yar/k5VDQnZJvRbjKUtp3bLxqztjgpeAq3iVEKDQliD94iquEWOB
         7evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790489; x=1792395289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHGX4VtiBD6X9kVo3dl0fflqY4sIieR53kMuKpSIpfg=;
        b=LHRefIHtQdQkw800Iylv9wPhf7Y4NAy/iQgdBMEXnRHd3Qk6reju+iNhIF506eqRWp
         hEGEfmBMUD/4aRPphkTJLiPqeX93mYMd3bkJPzxKlitM++kXIClaG6c1ZF0Hxu73VqZ9
         bGfb4e2rFFpHVxS7PYtzq/2mEnAZt0DbjcGklWi2qRu1xmnS+7Glgy0G84fyVOwj7Loe
         wcec94RIFfTkT3eZi7IbeiZKMll11MeRE9ZaENEGyPKXL1VHK4kpJ8VAvcXTdoHwyJmT
         5lIGzPdH6LgNk7E+lNQ9WOr1jCY5Q76L8zJCgrgvKRkE83CfNTFGzdQ2Xn6BwM5zgfU4
         zqPg==
X-Gm-Message-State: AFq9FYLY7xxPZ/+fFLw6OuQyYtAkw4XqtKN9MWr8NQzN79VndnklddJ8
	TaSQpqJuAizYqNp+lrkrcLaQb6R1j/bwkJpc/almYh5xn9lZZVzoTsi3W2XqMg==
X-Gm-Gg: AYBFou3hmVRkvqxo391eBiCFX/9gwEe90xFThiamDJ1g0hfnXc0NQjUtA1kTvAUiExN
	CgW3DdgrjnKFeP2ebOe1yYvtxdmhoUZeUs1d/7MnuKBY/IQEYRYfZKEs+UMMjyZGaoK/woMI35W
	2v8Khx8naDGKGI3Ityg6+flbsK/oZFInY5VVNF4pTRsClSNCBdLDhCiGF3wMiqIupL7RvMz4OlG
	0KHcKVDyvERpFHvW+AHYJDDdPPvS4n7/WsQENHN9Uu/G9DCG05mKBgQ4c6ewHeyIA/3hfa194wn
	mp7E5yStGce/fjoD6zQhbyyWFBPb94eIRD+NeIYDKqtis0EFIbAds2+dzw9rgAl084gW12QprUz
	X5ZYbUl+YzyjF+6AYawV31B9bNsP+mBCKJ+rvmCn2PduoNJMi12j0Jh5aaMwBZqGSeNlR02ks+M
	2steApKLhjjSW9YkwN3roNYEvk0M7Onb7cA1ugbFCF4T++LmExaHTl07njO0Y5cdxCt0DsJVfKF
	CJrRBgnBczptHSIEKYzJJp+X0ZvQdFehTsjW9Ip
X-Received: by 2002:a05:6000:dc8:b0:48c:7768:9ee6 with SMTP id ffacd0b85a97d-48dbad18258mr12359283f8f.38.1791790489229;
        Mon, 12 Oct 2026 00:34:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 0/2] xen/device-tree: FDT dump helper and common discard_initial_modules()
Date: Mon, 12 Oct 2026 09:34:40 +0200
Message-ID: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1791790490-716AD2A1-8EFAC805/10/73395122804
X-purgate-type: spam
X-purgate-size: 1614

Two small, independent device-tree changes. Arm is the only user of both
at the moment; RISC-V is going to use them as well.

Patch 1 moves discard_initial_modules() from Arm to common device-tree
code, as everything it uses is already common, so that other device-tree
based architectures can reuse it. No functional change.

Patch 2 adds device_tree_dump(), which prints an FDT in a DTS-like format
under CONFIG_DEVICE_TREE_DEBUG, to make it possible to inspect the device
tree Xen generates for a dom0less domain.

Build-tested on arm64 and arm32.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2930332473

---
v2:
 - Update the order of the patches.
 - Address other comments from ML.
 ---

Oleksii Kurochko (2):
  xen/device-tree: move discard_initial_modules() to common code
  xen/device-tree: add a helper to dump an FDT in DTS-like format

 xen/Kconfig.debug                       |  10 ++
 xen/arch/arm/domain_build.c             |   2 +
 xen/arch/arm/include/asm/setup.h        |   2 -
 xen/arch/arm/setup.c                    |  39 +----
 xen/common/device-tree/Makefile         |   1 +
 xen/common/device-tree/bootinfo.c       |  30 ++++
 xen/common/device-tree/dom0less-build.c |   3 +
 xen/common/device-tree/fdt-dump.c       | 185 ++++++++++++++++++++++++
 xen/include/xen/bootfdt.h               |  16 ++
 xen/include/xen/bootinfo.h              |   8 +
 10 files changed, 257 insertions(+), 39 deletions(-)
 create mode 100644 xen/common/device-tree/fdt-dump.c


base-commit: 63d0e8cc842975e786455f8a2e6502e85685f258
-- 
2.55.0


