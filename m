Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDB7C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:27:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430103.1652697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBu-0002ik-23; Wed, 23 Sep 2026 10:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430103.1652697; Wed, 23 Sep 2026 10:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBt-0002iZ-Ul; Wed, 23 Sep 2026 10:27:05 +0000
Received: by outflank-mailman (input) for mailman id 1430103;
 Wed, 23 Sep 2026 10:27:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KBr-0002Hw-V6
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:27:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KBr-00Cn1P-Az
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:27:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a974-2eae-0a2a0a5409dd-0a2a4506a1fe-12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:03 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a977-195a-0a2a45060019-4a7de14cdc18-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:03 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so271340f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:27:03 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c50da7sm32786515e9.3.2026.09.23.03.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 03:27:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790159223; x=1790764023; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kx8u+4+gN/f3jyrEZQ5/Z1zPXMqe+olQFMfcDsueDo=;
        b=Bana6F6Unq8kmsd8fa29mucl0S7hcJ+oQWnNczEAlv05nTJotwZ2+PXY0FbNlXMn2Z
         ozoIMEAPxLgMltbvtmBbP50ZnBAfirbgamZ/E+dlFgVQy1pT9Pg9W08n1wLsW4dRTzrO
         lfZamerfMKX/LpSlg4VImzUlpZaEL3zk8JOgsmtwCmwNL/TiN5rnd7Nnxbi7M5Y48RIt
         1ey0HzDRGDTSK2+VUiieLHeZQkT/I4JuvGzFALirQs4Ez9ZRZ18zTrUY9/P01GjXm32B
         wKWa7Ob3i0a4X3+/XsEhSq3I5OrcFMh44m3ofjbtGfq1zklOPvDPaP5YDe1vL6jmcnjU
         pMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159223; x=1790764023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kx8u+4+gN/f3jyrEZQ5/Z1zPXMqe+olQFMfcDsueDo=;
        b=xoeSGuNfNwGBjowYiv8KydXuDLYwx/gzVMehVFTxXbl2Sl2uOuaN/TTwJe14i/eyAe
         NoU1gJb7Q18EhVoaMVnUcXry1hG3PjMPJTjzk/NLEhdMPXOeI7oeqzbzEBcTHBbJ1fQG
         Loq4S0bOmZ3lWCq5sfP36ngYRl+DXjLKwzDZ3q+4H2JbRFetuyVKXWQmfwOYYKBdrFQF
         +xL+IEu9rgYik4h2Yf97U2xKG0t+UWC7JkhTHGy+AaySbVl1TyWY6gX1OljcNfq2DLLv
         SN6O63+z7sTUwoImNJ5pnLTkKDPFcJN1NjASQclu/n7JmpYY/g3jOUABg3P0PHrzN4oP
         rcMA==
X-Gm-Message-State: AFuF++lT0MYo3wUSioV70qIeCjRLWJTXQm4yfcM/fCfB61pb4tYtMsOA
	tsdNCx4IBpf4V9+xsiStysnsmQyRI5hHZiNoW+7EZ3tXOKzRUOlSWmSlpevzCg==
X-Gm-Gg: AYBFou0/I6a0o6cXpsc0+2gnrAZegfs4QJChejjLsNlver3aTWhNgduLCXQSy6iUBI7
	4reqvElN3tPE45hIy6uMTNxV+JJablC3CftYDQ0N5GzBPpfLt+yPhPJU7IbQmzOFpgCjGjadn+F
	Ea21m3WCSVDYvmds2ulg3DOom7HpJwRZ1bjWPJFTGRNnTNbEHekMdWHb8DfSZuKRzLt23BUKmwx
	T/TKdw8rSbPN3SZNIfQO6Arv1Fqf41kWzTyZhB/n2qwPI6lqzfeVlQipOgtup6Iuxau72tv8UYI
	waCxUHulC7NKI7pWHvQEoUPvZoBqo0ssemiZ5MlXhiTsA9Q9xksn1egTZvFjo1XLPkD3GOlJYka
	ZSCobKQLTvN1FxgNjtck7mdKEHjVRM1n2xJrzwO0CRbzXHLz0X1RzYBRnf9qIMBCQTT6+f+SnA6
	nlXlEpMUdjQW9MpCyWhkwAFOG4eIu9LsusgWQprMuJnQbJIaCpLbYox5zhVMlTCaVPbVKi5t2cG
	Wl/YcanB91rG3JIjQGSl9QjPa4/ksHKJRdCgswJ
X-Received: by 2002:a05:600c:c491:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fde4972e0mr28673935e9.10.1790159222733;
        Wed, 23 Sep 2026 03:27:02 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
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
Subject: [PATCH v10 4/5] xen/riscv: provide init_vuart()
Date: Wed, 23 Sep 2026 12:26:48 +0200
Message-ID: <38e68bf92ed375d644d89e474b23e6b767356ea3.1790158750.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790158750.git.oleksii.kurochko@gmail.com>
References: <cover.1790158750.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790159223-FEC7777B-DE04DC65/10/73395122804
X-purgate-type: spam
X-purgate-size: 1392

For debug purpose is enough to have only print messages from guest what is
now implemented in vsbi_legacy_ecall_handler().

For full guesst console support it will better to have something similar to
[1], thereby there is nothing specific should be done, at least, for now
and init_vuart() is provided to make dom0less code buildable.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-v10:
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


