Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B346C44506
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 16:19:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358341.1612509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrST-0001m3-O3; Thu, 09 Jul 2026 16:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358341.1612509; Thu, 09 Jul 2026 16:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrST-0001lv-Jx; Thu, 09 Jul 2026 16:18:41 +0000
Received: by outflank-mailman (input) for mailman id 1358341;
 Thu, 09 Jul 2026 16:18:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whrSS-0001lp-2s
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 16:18:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whrSR-00EFLu-Fn
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:18:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9cf-e002-0a2a0a5209dd-0a2a450c961a-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:39 +0200
Received: from [98.137.69.30] (helo=sonic316-54.consmr.mail.gq1.yahoo.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9dc-e897-0a2a450c0019-6289451e8f51-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:38 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 16:18:36 +0000
Received: by hermes--production-ne1-7568ccb994-pgg8z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e91c25460b5bcef5e32390743f7fb9e1; 
 Thu, 09 Jul 2026 16:18:33 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783613916; bh=mrIU6GXNVPCZCBo3Qt2crz430oURssPqiAE0yjZSLD0=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=LQgaQdnOePf/lU3gW5Q0gx10apEkH17dbaTzc/kHtdmv5+9+dvpMlasd/dnoKEe33B80G+kNNMmzXA5Cd+s3YoGVvHOQbJG+efWMhaB4c+Lz7Tl+dVxOOX1jis1Xkxtrtnzm7V5uIKCXj9zyJRdH6HzQ43HyQCeZVYfStImK0XrFdQqHzGZqLYntrdbmKFHPiuXm9TFIy1NiG9ql2CoUpyAUnxz0bxjpLc18a6FE8d3cZaa4e2wGChXmweuimMyOXejfkiGKkDtRtKpYBUED10nUBs9o7xlBnHHyuXQKUJgMPG4LM12FCUwMDQ+lIHztzAgYXLDGn1wyjfSVj4KlxQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783613916; bh=zLaOhqK8l26+5z+ntFNKxd4Cp3LzLU+lZHwQnFulx6x=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=rqSgJItoWZSrEwch8OGUkTtyENtqtYmBE0n7J4mdw3JrTVC9/RPk58Mhy1l6odGX5IKOv7sMIaM830ul1T9upbv4FtKHr2fj8bieY8iXPcpB3JuBC8W/AcU8l12J3mkV02zjrz7BdalWgbSJXquDB6DiFgxZLL42EoEEqm1nmdAUpmhgyjkmaffVVSj3FPwH3NeKIFz5JCww+xIGcZgXsFPNheXnj302fK1h2tvm6fnKrO1daRZZjbkO7WWtCUiQKh65u4Yy7h/vZVmI1/zRjR8EoPpCtJTVFYy8GHKd37AphymxJJEcN23TlNOJ7sPehVUwGVq89g3fg9FNnnwU/A==
X-YMail-OSG: wTixmT8VM1lNkCcFOa9wH4gMN1tamo2oktVfoZHF1vui.ut_u.N9xaonzPjP_Zq
 rYEy2ILfSMU4HuLLsddaUMRITW2DJDvQsmHWln52GIK_mMmYzQhc066du_UgQMk0pk7My20DVw8d
 exgWGCpsA4QedcBMxIQjv8j.YDqkhzYi9TXQIRR0f5bCQxVydkXjmnk06WayVItVPJ5RghwlRYn8
 zXONvOr.QFEFhhGCMUfa2D5HCwaMunLFwYGGcQbAxOZHD1bfMH8lJDx0yrde4g.XicFt6DcTDTd4
 eIUuFEeiDV8ckwUezsq6HaP2DjSLD_MkjR248qIyiZ_YLcZJxfPtpOmnl0K4KZPUhQ9W2Mpn16fm
 .Xuxsrc.uHizUZh78oxsejle4.FX1JMOc0iQlVx_eqg1coo_eqU0RoM3sjMjnTbXViKTB6_0Eaim
 D1bh57ryzdE0aMDhxIHI7RbwK0lVmtXxpPotYwJKUKZpbmlE6Dtz.xPHX17P27HGK5Cp43P7SXV6
 4ZabwZyPATc8rscKGKX.Dd_OWBGZpwUWD702DyqIxtUsnDYRP7iRhIgJk9SyAGSgsXP4U_AWz9DU
 kWMsJ1LRD7hSztSoEz0Ve.UUilXqgKc1tqtShHgDchzgMkvMpCigTVdAv0RlzcqYzibPwVovWOHP
 IU5EdTX5rwaIInb6x.8Il0LYSEXkFtqvWaytczu7Tk7_KBEt9ugFnZMdo61KuBGhOOQ1e5PpkII_
 C2Kep31nvtGUn3TyfhPZHqniAdYLkQc1qD7ZTdIDDhExR.B7EGI2PBSesFcrCfpr6eZhCSrqeLMQ
 wpA89N_e2GaM7qxmCqOzHUeuJp1gAbueErWa.UY6g9QjeIs5Cnnf8NX4VORsDmVIwkK7DtdwWS8c
 mbBhf9hfkUVaFM2LDYcsQ3jbhBZIMUXHQIXRk2YzsTIor0ohMoJ1LGXPdpKFPJ.QZZHer7pl.2wk
 WW8adrKqq0DlRv2RuXQzMdvpYYzbxs8ZltiBlfo6wW3tw0PhjAsfaCUDAUhCOBB0V0tQhvq3nSYv
 kyLgQw3uvyB80ESNkhed4wvvw4UydQXoDRoO7KGL6pkSq99A63lKw87E8akJo6hhJiqd9rfjXTcg
 IN3YOuc6NLVQdtcNko3kFe2R0p9Y8wPLycbDTc7_gi2piQZ8UVm4e_M3lUHcHkeSITnWDKGRNRm.
 9TORjEwuAghqOq6u11lBqSxa9xNanplYMN.2LNpvlGwSOzu99nOH5ID21W1CoUb7.t0QfKS5GPer
 FqbDoxQ64O8dEmCM9ZYUm9vh5Dy5BArhanh833x9eSK7lmvEwtxPgLz83KXh2hTSyEtbLMRdj0G4
 ukERIpVFN.ptS6M3oQlQqhtTHNry8GvHN3qLtIsNL6ogEunZy3WxPnSPNjRL7_dB.rjgaQ.01ahr
 v72unQYiQqCUyuJkGuuaJmiE4WBRA90rwIvYJ9h7R3N.D9AbBUhxMp7c7Vg55W_jOWq.tA1wDHqn
 A25mAddNsIYvr.LiYREuuQD3w9SHrzb9B0XLqi2yXjkU0IfgG_FqjAUDirQSjVZpfMHrJdILUiPS
 QkhB750gmmnpq5pMOAcYsG7K4Tx7xnYTAluUbRlXpiSNhi4GJdxiUne_DSZe__Lj9VzIwrvXs8qM
 24vTaA92txOnOOpv_2j3YAAUK9PAPqQD2MLQU7hj8yk.InwcR9zGgEiF8vH6fxULAlPsJ8l.QvKG
 c8.FuzDdpsPlnfPuYFWarC6gPEj6IyD3bajz91eURUPnR.V5BQxPWk.LO4_O7mMnnYkdMq9Da8kb
 iRBTy8QYC3xyoyc67rz18zaeG.3fB2xA7QRLLZxgkmLKlTQrl.fno5vR8efIq_0DuebSaGzhfNFj
 sflnzndjqycusgwq1bgoSr13FMhUiDmE2xOcoOpUJRpyk1HHh.OO8Ztn3KkGeBH5cgTHdnnw3WtU
 adC..8D3NxblrdPlhzRp9WVb0eOc2M_RCk_XYj2cHEgnx7XH4y5aBZlU_36oQigU1J1hsOvNOrI7
 yVw.RcyVroE8FRJfgsxWrpIpRU1n2.GXgqbSk88twH3F08t67CCqkUW6DCk2rs5qelnwTr9lLfRQ
 GqA4260jRhM0BFx9fsgrRgrp18Ai0Y9swOsI7qs2d0h1kYm6KB6zz3wCPHInBGi_aVkWhu3diq.b
 ZZ3MTdtWDRCvg0LbAJP_N9hpREV2Wt7Fqa58.I6adAhRqy35fG1CfjjLvn7TPRxDRJK_Kj7TbmGT
 AnzHpJf.g2PtCg8zd4lTNGHPf9f0nb.F9Uk_y
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: f9312c22-5d12-4854-8ae8-c458d5f8e88a
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 0/3] xen/igd: fixes for Intel IGD passthrough
Date: Thu,  9 Jul 2026 12:18:28 -0400
Message-ID: <20260709161831.17753-1-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260709161831.17753-1-brchuckz.ref@aol.com>
X-purgate-ID: tlsNG-d25034/1783613918-D457E6B2-50E2990F/0/0
X-purgate-type: clean
X-purgate-size: 1246

This patch series aims to fix long-standing bugs that need
to be backported to all currently supported stable versions.

This series fixes three bugs that cause problems ranging from
a dark screen in the guest until the guest OS graphics drivers
are loaded to an assert failure that prevents the guest from
starting.

To test these patches, it is necessary to test with older Intel
IGD devices that have support for legacy VGA bios.

The patches have been tested using Xen 4.21 and Seabios 1.17
on Fedora 44 using an Intel NUC7i5BNK with an i5-7260U processor
and have been verified to fix the bugs as described in the
individual patches.

Changes in v2:
  - close open files before setting errp
  - improvements to readability and style
  - small corrections to the commit messages
  - add stable to Cc list

Chuck Zmudzinski (3):
  xen/igd: get PCH info from host sysfs
  xen/igd: don't register rom bar twice
  xen/igd: fixup device id before registering rom

 hw/xen/xen_pt.c          |  5 ++-
 hw/xen/xen_pt_graphics.c | 85 ++++++++++++++++++++++++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 18 ++++++---
 include/hw/xen/xen_igd.h |  3 +-
 4 files changed, 99 insertions(+), 12 deletions(-)

-- 
2.52.0


