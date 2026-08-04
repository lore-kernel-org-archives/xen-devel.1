Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3C2C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382290.1625757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNo-0003FX-Py; Tue, 04 Aug 2026 15:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382290.1625757; Tue, 04 Aug 2026 15:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNn-0003BB-DT; Tue, 04 Aug 2026 15:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1382290;
 Tue, 04 Aug 2026 15:48:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNh-00025v-UD
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNh-009QPZ-Ag
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d6-2eae-0a2a0a5409dd-0a2a4504c160-8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:41 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d9-b57f-0a2a45040019-d155dd2ce4e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:41 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so2912747f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:41 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785858521; x=1786463321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAWkDWNVTDEeajRUovPN0Ndt/ZkdBsFcfwqhXKheFEA=;
        b=BEMNLqjCMBlrrpVC5UiKeqk/4aIGkgCQb/6Xrt/fQ19RHuIQAiohM1nV06FouG1b3u
         t3f43xQPmyICYVF9B1MAfLngQYpKYyPhrqfWPVNOBWv+nrq9oITE0XVad1qMp169z9B1
         eC62Nss6jT6AYgjwl8w96qsnb7P0t9KT2qr+jPmiUmWubexoFPQWe/yJxgfMErFoilGD
         G2Adz9jU30Kxsd7mV+Dbv6Vhome4ZdsU3XNtAkZGyDt/l7VCo7upCHknT6J1sfbSZvmL
         8u650YLPq369RFm7BXCO42oLl6G3h+3MadgJVZvdP1Tj83xQ8/N/Kf4Rf8W+xdTixwWC
         G4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858521; x=1786463321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAWkDWNVTDEeajRUovPN0Ndt/ZkdBsFcfwqhXKheFEA=;
        b=QZ1WqELJczrgF6FpDa3S77hFvXnIfAxeADZ/WwcMPkAKtyMMKrBY6sEJDyvuzFAl4u
         MQUx7ai94/FLvHvmsc+QDtaRJpGIyW58VoH+4PilVDdcOUpW5bBCHjLB9nE9wIsaMGmQ
         DOmlyNfrkg/lLAq3tXZZLikUnaDZVFub391s7g6vDvTYoyBlkODyv7/aM/uduVJ+gywS
         yIqFIZGruXiUe5dEQUNncFJe5VLylNVeXemAjVIZXSoNAcbo5l8bbfaXvpz/HT8Aw/ul
         Ywfyl3kHFY6udHtWeRjFK7P4kIbNZQcTFFy62kRFHywvqZxocjxE5XodIZplwVQNTFRV
         2CPA==
X-Gm-Message-State: AOJu0YxluezbycgJKtFLoVTHwXwSzJuJ5i6kfdNZDD3fX3eG7bgxXDbu
	Dl3EaCPR2qK/R5x1uGIMkOzpOdbVP3Ckq1B5A2y/N0eGHtC7vgjUvi9z3EoZNQ==
X-Gm-Gg: AR+sD111E5mS8nTTEZp0QJGzy8czL4GJs78+0TuUO3tA8HU4HoOcos0SmPJ0v9gJLwr
	x+HLdTP4v+4hmuQuQqZ4M6brb3dKrTPtcHbmI2LbGfCNDKrAHJ0/4EIVPeQud3hClcjD3tihuta
	AFBg202K62NKhRq1j94GYhQG5Qx5nVwN60nA5TXvX3qGmCCv+2vioMYxRdeahQ9Jm9Jj7GW7YIX
	eQ2XBaaLU1bMIx/X9xV0QGQSQ8+CfBuRGTiyTi+BByY9f4iWVLBhoQRQQlOwL3R5Vron6TanL4r
	sqK8yZxbJ5j+ED1pmVXgcJNluwcUzmVHl5eCehPJr37uhFS7ev31OdyGCUR8Q+D6MCCX6yPpEtN
	VPQAd695A3fwtH0v4CnfzLGhqvW5frES7XK2wzVicxdPm6ac3++T1bm6XGOuEUGIMu1OnKIN3NK
	24KQGo1+BC3jbiyNixLGgE9kiH3IxnEMFM1HClJs2HSlmn0fZK7QO+GIX+BlcmESPLTz3W7O0wI
	Zq3jHUxJ51hLrRtruGVWkSRMxLIzZQc+A==
X-Received: by 2002:a05:600c:c8c:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4980c6564d5mr316112725e9.13.1785858520601;
        Tue, 04 Aug 2026 08:48:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 19/20] xen/riscv: provide init_vuart()
Date: Tue,  4 Aug 2026 17:48:09 +0200
Message-ID: <41598060f3f96d27da1c90299592bb908edd8910.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785858521-C0CDFB50-679FDBBD/10/73395122804
X-purgate-type: spam
X-purgate-size: 1391

For debug purpose is enough to have only print messages from guest what is
now implemented in vsbi_legacy_ecall_handler().

For full guesst console support it will better to have something similar to
[1], thereby there is nothing specific should be done, at least, for now
and init_vuart() is provided to make dom0less code buildable.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-v7:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a1fa51b996a7..d1a51b92936a 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -8,6 +8,14 @@
 
 #include <asm/p2m.h>
 
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
+{
+    /* Nothing to do at the moment */
+
+    return 0;
+}
+
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
                              const int node_next, const void *pfdt)
 {
-- 
2.55.0


