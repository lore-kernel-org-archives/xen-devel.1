Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE9DCA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:17:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438173.1657041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEmH-0008TF-TZ; Thu, 01 Oct 2026 11:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438173.1657041; Thu, 01 Oct 2026 11:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEmH-0008T8-QH; Thu, 01 Oct 2026 11:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1438173;
 Thu, 01 Oct 2026 11:16:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCEmF-0008S9-RQ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:16:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCEmE-001fY2-MJ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:16:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abe410d-2eae-0a2a0a5409dd-0a2a4508b10a-30
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:16:38 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abe4116-f659-0a2a45080019-4a7de163bdf5-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:16:38 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48b05fdb2f9so881654f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:16:38 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff994sm5610427f8f.6.2026.10.01.04.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 04:16:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790853398; x=1791458198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnYzFbS1hSrt6OOinoAyibvEI4DxtFMfxt2gfSKVtJ8=;
        b=ZF5nyIP6EH55B9YTBtOn0GHYPo7sCa3SdI+j3qfa0PKKHTt4/VZ5Igy9bTlYVyaO4L
         B53PF7x5HJFgOcT+wa80cXhuIlI0vaPP6wIqd0XHyLDsng366arIebn++Ax5ZTLc6Vm3
         HGEZvocMKMWGcZHrm4l1r8NNJi7V82D2k9eX6zuP5s6S61kHVS5m4Yfp+rmm+vnxxaB/
         sqBP3zsybscu7liyzdJQGMXYrOP98SsyMjbRqsqJUxuOK2bSbKm72Nwv0yKOzeWUXIO0
         P0KwNRPZoJiGy/S/5ozbXGfLTwkW7DE5E2zVYXPKkd42flLRrNxMmrRf5YRVFgWyspSv
         UjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853398; x=1791458198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnYzFbS1hSrt6OOinoAyibvEI4DxtFMfxt2gfSKVtJ8=;
        b=C6dIXtc5ubjcLzYr7dijuNCqXwZeClkAeYglQlpCUEdL4ElEPT3xNtZ3OvJ4BdXeoV
         d4OObqMC4V+XlbxwPjyxPFn63eZpoCl83O/Vk89r5MxdlYABHjlCcu14Oaypu0drmNxL
         x0Z8Xt0rTOBk+rpy539AOMAuDAc1BSqXbPYv+Fg/0zjlSgpdHxkd9YIm4ZfIVzkJ5iPf
         ycNUqOpi98Zv0FipqfLSfRg5Wq+5QRsG5GVWY1DaySoBMUCJ0YixFjndwkeoHZhrJVj4
         Cd43OQBYWwyAeJqlDD+NtScCbXdaPl2VsL0/tTv2ZnQaJ1qE1kgutmwMnHn6XVIMijDK
         bGhQ==
X-Gm-Message-State: AFq9FYIUy2gj6sboDPb5lU1tedkl/GJJfT3EVrKAwboyErzTysOndn/T
	VdCmtJwJ4AIiyUSZHhkffFdRj8zZR6qmmWVN7b64y23lzjqw9Licf7BuJU7IrQ==
X-Gm-Gg: AYBFou1gxZWUblXokkjrl/0qJ+IYhFp+IGE/U66ZOgmjMmbOXIY1lMfsssX/e+Nwdy3
	sUJC2AesWq45oD13wNFz71J/Jl8RBXb4tIGea+uwXwo37Ej0hxAaocxxOaz+Ko099Rgii0kECuH
	Sax5Y5nlxVxaq9xT3zspCuXRxTPa4n19b37vdjFiybxiLw2gvC2PeRbCv9O/H0si/sl4s6StAiT
	0QPjc4jP7iM9IRS6YMX+5st9qNj3JiehlExvQNwXXPbeGfmQiY1oic4v/0oZviOQi3K1O/geOIf
	5Hw3n3tdM+u4TV8l3pmK+m3fguicKIMcqCpgwDEYvZgtIYkMma8zTFvH1Xmj5c1s1rXVE0vV4mn
	q5tipsOGyhscHOD2B9bGNQ60DwcXveN6th8HYBmXVeQ2s/cdpj/j3GhkxcI1eboDjSvduEIFYjZ
	/eMN3v66m6i/+bja8MYkGZlOES+1ESQq+ZEDupJxpsUF+DkrOZjeL/he3Tp73mIHCvb0990QlOb
	WVtSE9/a6OH7C6rMdAKwrMvsc+pI254qGYEu4NE
X-Received: by 2002:adf:e19d:0:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48b04a2819bmr6160815f8f.43.1790853397836;
        Thu, 01 Oct 2026 04:16:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/device-tree: FDT dump helper and common discard_initial_modules()
Date: Thu,  1 Oct 2026 13:16:28 +0200
Message-ID: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790853398-DFAD487B-A230D8A0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1475

Two small, independent device-tree changes. Arm is the only user of both
at the moment; RISC-V is going to use them as well.

Patch 1 adds device_tree_dump(), which prints an FDT in a DTS-like format
under CONFIG_DEVICE_TREE_DEBUG, to make it possible to inspect the device
tree Xen generates for a dom0less domain.

Patch 2 moves discard_initial_modules() from Arm to common device-tree
code, as everything it uses is already common, so that other device-tree
based architectures can reuse it. No functional change.

Build-tested on arm64 and arm32.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2900841778


Oleksii Kurochko (2):
  xen/device-tree: add a helper to dump an FDT in DTS-like format
  xen/device-tree: move discard_initial_modules() to common code

 xen/Kconfig.debug                       |   3 +-
 xen/arch/arm/include/asm/setup.h        |   2 -
 xen/arch/arm/setup.c                    |  35 +----
 xen/common/device-tree/Makefile         |   1 +
 xen/common/device-tree/bootinfo.c       |  30 ++++
 xen/common/device-tree/dom0less-build.c |   4 +
 xen/common/device-tree/fdt-dump.c       | 180 ++++++++++++++++++++++++
 xen/include/xen/bootfdt.h               |  13 ++
 xen/include/xen/bootinfo.h              |   8 ++
 9 files changed, 240 insertions(+), 36 deletions(-)
 create mode 100644 xen/common/device-tree/fdt-dump.c


base-commit: f9b72572c8d5b6d312fd0b5014f65bed20efac40
-- 
2.55.0


