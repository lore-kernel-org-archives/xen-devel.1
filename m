Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEE1C88E5A
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 03:27:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419481.1646625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5asT-0003FD-0A; Sun, 13 Sep 2026 03:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419481.1646625; Sun, 13 Sep 2026 03:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5asS-0003F6-TT; Sun, 13 Sep 2026 03:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1419481;
 Sun, 13 Sep 2026 03:27:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1x5asR-00035r-Fk
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 03:27:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5asQ-00HW2u-Gm
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 05:27:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa617ef-8faa-0a2a0a5109dd-0a2a450783d0-8
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 05:27:34 +0200
Received: from [98.137.65.148] (helo=sonic309-22.consmr.mail.gq1.yahoo.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa61824-b4ea-0a2a45070019-628941948780-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 05:27:34 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sun, 13 Sep 2026 03:27:32 +0000
Received: by hermes--production-ne1-6dbcb84f44-w9zrq (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 14c5b846713c82b711c43225786a63a7; 
 Sun, 13 Sep 2026 03:27:26 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="From:To:Cc:Subject:Date:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1789270052; bh=HkouYZw2OX7f6dDmS69vbQfS6RgsxVv51DceW+67D44=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=gRqxbTCykPi4d9t+y28sXXjLI8DiSA8TZEqlmAqEJg9+0bIA8D+0QkAVMFHuv5NGjVJziOROO5keW1NQcxHetjsdTHyuYUc+iE02GVmKmRDGmpaHIsN8a5qeb1mf/hW/RLt+19WqvGFRH5fN64IDizUisnQnilmX5lPwyb2TveP0fWYHZeky5TAHKUfyhHm6Wm6CKRO0U6Eg2QIb38d9Qe8p2onZw4pPvKheSzCiFMHalh3HTqFayO1ThZ/H+rP6Hd+EU1IL6x1JyOERfxQzFRxOTEcpZU8sMHDJFRUs6NZ4k1cYCj7rk4Y4HBK6/bhbDZn+t+Qb//+u0z+3CIv9cw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789270052; bh=WbPqrxs+NjO8G6mKw+TZVDB1erA7MoDgNa0UeFFjBXE=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=GpJ+AJeaPJXEuhjRnGmLwuxTkP2DgfRWCrx+Z+Sxmv2kxX3A2SzFsG+tsoRCPG8WYHqAOtGdC6DhlbxgsmKMh0IPgsI8jaha+8KIiWV/VApIaIpRapIf57HKDuXGlZUkMzW56BgtCgbYihgSqHIb8fq1j22rL3IjPmOMYsGO5L9mz6JLooWHI0u85NwFz6+hYtND/st5E92eRqlU3gTo4DFgrHWH6ZS903WutM+p6Hle4/lAKOEGX3ZInxEckNmpF7o3lLwl2UUM9PyMQVhGzVLRur0qRUvNFDSdDVo5o1GJc9ZjrO+SKXq+WHvvJVPE8ZUTkzNp3JLH6flenqPPCg==
X-YMail-OSG: iQUPos4VM1mvQ12dnxXVn72jDFlgX72YQvOl4iKHJQZGnSd3noD_KulfJAkrd8e
 4vsJPXLEpMK305IR80BrgouKmXQ5OSlkPIJidBRy8WNJVgKgfs2DhLaRLuGCzPWVC8ItW0anBVpG
 DdUAkWExj5Rqvozx2lgw9L4K09ufYGCJOV634gXBmKjNFMlkkqdNiNkXowKV0Ik7fT8vct98YcDm
 7lZZKmAFA3MZZGLLWdzDGSE7LWlDkRu8MG9eUDG6QrJ_itL5yDqy2mFM63b5mgPyzz1cBRodE8ZB
 oTnzISRYGsIKAZIzIa5f2um24uHmci2QjT4tvrbk0FCcwNXfJIaFgs22bqGuI_3Hw9gu6jUN0NIw
 oxtvoUTlRh3ViisR.PCCfkLiC0NkyCbordSQWl9CHgCVxz3__4lTqBIDlpZm3zPmNB2MUBR.fJq4
 gB2btE5MtemRFbp7gx63uB1O6MdzrCupPCwrz2MBGYPtwFXIKf2vcDg2aKr.w9QPq.wJm33Q9zL.
 DAH4DQ_0z0GTJHIwSZei0UR11Ns8OTElrjf8qS4thNvlw9DbcsVE1e075ZnAQ04q3ZX8_652GO_Q
 dGyBo0CvlWqCTLv6z_ykiduyHNDzaOmemmorU6w3AIAcjuEeuNa4xYHwjvIRL0Rg9jlGY7d5totk
 qYLf_jLVUqhRBqtgjr3H8Zb8gOXKRebdfpGke7gWW6f5RhBnie839wwNJepys_ZnQNbYuuIekNYH
 4jokAWg73bhVjpiC8juuXlVp2EDjW84xEj2Sv3iEXtwxrd2W9Bznc3bbfACvGBl5R5_Ng1sihArH
 5aXrp3fCn8l8e_my0YzQKNHJu1OcBFPX6Q.iGTBV4gz6e95ecHMuyJvc9wUrou5C_tXAEzOKYlhp
 0i3ceCvGZD6pfG6u6xIEebA8aYhAAwi.pus.m6vR8v9DgIGTqfSbAtXxoyOrIMl8VvoFoGbqfhCL
 aJFduF_1zyLZeJIHeR2QPW0M8SJIF0riEwyWGgmiYOA5qw_yyMxRb2qtsvZVTPRqa_f4exYuJZ9m
 HpzsJwhXEK82RCzYjVrkN6ejYO_VCnOMMZNB.XXBu.dZwmHCGIiKfGjWEmJWG_wxSPqTSKPUqjsD
 qcO5W_QwURr90MmeTQLq7yr1fFS0zbz8.dEup1ajAKSf8aEJyQ3XhkFUaFDG_0E0ylrhKE3SyJl7
 8Ltlj_KqrX0P5QIX6zhuI6V9Uygh2YSIFOWRSIj6Puox0nYNLEVHmG8LmUVOe_VeLpaaUYoa0wvZ
 0HH59Q1_wRgLMH2wHTPMaY6hwUbcOZf8o5ZyN2U7wzadF6WNTieEn8q2FRQx4s8de1wLI69wKasG
 hKRwQQ6QCRkVgCGkICJ4uZBI3cOEGDqSBJK.yOcoKUe.wJeE3o.xx81H1nKGgO1X1y.a0PHRx_yd
 qFdLIWrXFo.BzUcxi14UkXbrclt3jvB3BZgViAurf564_BFp8.msHe9PtyY.abbugfxWoLalmxlj
 WgmWo5hSLYxwatpqnQBrHhWGnGggfIEVP4Wb.Zb2hojPHo3qSJqFt6TlqkIdzcysrtMTDcHbXPZJ
 zktu7VuGObtg40jkLUPSBkHmUdJcpzAxlgkntCrXEpAMxM3fqQUwiWM0egoSPKpBjjGwZ.Ft4GLe
 XX6yovJlpqXSZbAAX2NtVNqyaeGAJN_YaWccSn28Q5AOpw_0Aze.NI01OuYaUs6EQMR4BGBKzyLO
 np54Cexgs51VZcjlwiVlbdjXsO1Wy9S1KjJvGV04t.BAlEenMiX2IMlH7_pj6Th8P4zwkFsAuUJm
 4ngouOfOOJJ1pRsiYYVipOYTPLL3Mrqcw6iv3NvZA4M2Ay7uELHcEyCAbZJe9_GQOYA3cmQhFf3T
 Xc9e85C4Ax4oKRAnayeTRfg_lC7vypG2KdkpyLM6hUzVowTqfm5trecxbcIUvUbDqaSp87lZggcW
 Qe4yuR1kYVH2VtT8Fmgem29BfFLxTfHluR5nMPYsb9BCrLoUag0mHlE.q1p0E1vYRh2bT28K87J2
 LVq2pZHkQ5mDYi8x0sTdLzkg5mNjQ4e5jTQhNc6TAcxyEKqDhWg6hVcGBGtms8cCHh5z3mioI5l3
 lOp5w0isi4KRTSA2opCcUUmnwOgAZfLFlLuVROotT.G9Uz_B5AJbWGMNrcZzkhGye7wlNKWcmv0K
 gEK_FAIh9_bvqnYCIdMD80vE9zr5gLErCgvrVvxCuWqlZt84qkVdxPOU4asIa4H60BSBYJZEL3fq
 P4NQukyTRxXARHntCXrUxTfcpFwsUqU1Z2rwM
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: c76bfcf0-05e9-45f7-a584-afc9f234363e
From: Chuck Zmudzinski <brchuckz@aol.com>
To: xen-devel@lists.xenproject.org
Cc: qemu-devel@nongnu.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/2] tools: Intel IGD fixes 
Date: Sat, 12 Sep 2026 23:27:22 -0400
Message-ID: <20260913032724.62438-1-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260913032724.62438-1-brchuckz.ref@aol.com>
X-purgate-ID: tlsNG-ef75cf/1789270054-A68D9AE4-E29C1FCB/0/0
X-purgate-type: clean
X-purgate-size: 1736

The goal of this series is to provide improved support for Intel graphics
device (IGD) passthrough to Xen HVM guests which is currently not good. It
started with a 3-patch series for the Qemu device model and has grown to a
seven-patch series for the Qemu device model and this 2-patch series for
the Xen tools.

Most of the fixes needed for Intel IGD passthrough are in the device
model but help is also needed from the Xen tools to provide proper support
for newer Intel IGD devices with an extended video bios table (VBT).

For the purpose of reviewing the two patches in this series, by far the most
relevant patch in the patch series for the Qemu device model is Patch 6. At
the least, reviewers of these two patches should also be familiar with Patch 6
of the companion patch series to the Qemu device model that is available here:

https://lore.kernel.org/qemu-devel/20260911072453.46256-7-brchuckz@aol.com/

For further reference, the link to the cover letter of the latest version (v6)
of the companion Qemu device model patch series is available here:

https://lore.kernel.org/qemu-devel/20260911072453.46256-1-brchuckz@aol.com/

Please refer to each patch in this series and in the companion patch series
for the Qemu device model for further details.

Chuck Zmudzinski (2):
  tools/hvmloader: implement Intel IGD extended VBT support
  libxl: add OpRegion and VBT to firmware when assigning IGD

 tools/firmware/hvmloader/config.h |  6 +-
 tools/firmware/hvmloader/e820.c   |  4 +-
 tools/firmware/hvmloader/pci.c    | 96 ++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_pci.c      | 82 ++++++++++++++++++++++++++
 4 files changed, 182 insertions(+), 6 deletions(-)

-- 
2.52.0


