Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BD2EB26E7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Feb 2026 16:35:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1226677.1533179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqhP-0000Tt-Cy; Tue, 10 Feb 2026 16:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226677.1533179; Tue, 10 Feb 2026 16:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqhP-0000Tm-9z; Tue, 10 Feb 2026 16:34:51 +0000
Received: by outflank-mailman (input) for mailman id 1226677;
 Tue, 10 Feb 2026 16:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x5eZ=AO=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vpqhN-0000TT-SN
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:34:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab98203-069e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 17:34:49 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43767807da6so751083f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:34:49 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376b62b835sm22714448f8f.12.2026.02.10.08.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:34:47 -0800 (PST)
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
X-Inumbo-ID: 6ab98203-069e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1770741288; x=1771346088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x7nAeewFr31vBi9j3A96hFNs423wcP4z1XIUhPV3jTM=;
        b=pIbfzL2ZR1tJlqUmPhv2cYvoyvQM4+JV3D0y/Nc7lh639lUAgKIUlOs2YsBP0d2H6G
         oS3ewWXN8+3BHQ0IX88fmDmZUaf3Dsj+lOpgqpuZuGVFJnA6q9tJfeBNpNlYyeC/AKsH
         3e/qeH3dqWx0w+qUfKbKVSRSb7g562g/SdNys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741288; x=1771346088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7nAeewFr31vBi9j3A96hFNs423wcP4z1XIUhPV3jTM=;
        b=TF3K5HiVN/jZUeXX7drWfJliXz4wGsG8A36Vm9MzJh1xJZt64J/NlQgNmHxB1pD9Ui
         lioL7OxM3rZKKQ7V9DqzebYwpV4r/Zgy/HB0OnzBgbWWpK52LJecsSNsIY//qb/H1EM9
         WhZAprGjvsZBxz0O2pkpud8g9m402a0Os0ZVzdfwQIh39NHJOguCVTBWO7np5HKFQREu
         IAmSm40kYbP7CylsiMCFuboGOqn4VuoHw6UcKPZrzKqXe+tToVX+Ffv+sHFQDiBXCBp7
         kRF2f72eBwcSwHTG4utvCX6G90kymYdUBKVApIvVTt9htv3WRLLBuDEtxjyB4ddzsO8N
         OOjA==
X-Gm-Message-State: AOJu0YymyMR1EJ1xsVmcBk9evznlmGMkpSwE9StJH16ueZ/bcCWGSoqO
	v1dMWUH7NzLZXgyvqZAE3EEC7Cmp4fX71KBykXqGrkOyQoIjGkQaIB2zGKtcwygW9tRPf0tYQ28
	ZLKw1qKF3kw==
X-Gm-Gg: AZuq6aJW+IbUe8LjcxFQCZlJEbfliDpNbu1O5uQDlOBOo2bgxRupwpLlZcx5KdHSMU3
	T9DEEup8ZHxZIwH/LBOiwB9sORFoTcGVGSfpMQHDjbAzfauuE0lc5GSMVjERLjf4kJlRTHhx3BK
	WP13BQy3z5i8X0a3X6KJIPIafrc0bD5/2pruVtUPCTLw+Aek6vTOXrS3DGUQle17479Qd+hgb0g
	DDy4kSz/XwHFMUhWsvsy4JCkzgYH/42pD3c7K1J4uXZYJpf4sGhbOk93I16NxfCGsV+59tvUSJZ
	kN1/MaHxMAiGRPPVEV46aUlODOIpxuZFD9mSg5P/2wWiOYY1Yna5OBwqtSgSy7Htz85U2ej33zv
	EtUeVmPAVi/r2CUX7iJTpLprYdaNpk7rrDs51FxaSlQYNxZXKj4FU2O0VgEqIJrR8UoJZWZzrdT
	PiDSrAK2CRw7bPMFWkGLbFHBdlspo3e2f7rwM1hUDwuUeuY7HrYFGvvxUtZiam4LpjskDhZDU=
X-Received: by 2002:a05:6000:2303:b0:435:9612:2d24 with SMTP id ffacd0b85a97d-4362937e1d7mr26246844f8f.53.1770741288232;
        Tue, 10 Feb 2026 08:34:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Strip vcpu_switch_to_aarch64_mode() from PPC and RISC-V stubs
Date: Tue, 10 Feb 2026 16:34:45 +0000
Message-Id: <20260210163445.2796291-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is absolutely too much copy&paste from ARM.  All other stubs look
somewhat reasonable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Timothy Pearson <tpearson@raptorengineering.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/ppc/stubs.c   | 5 -----
 xen/arch/riscv/stubs.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index f7f6e7ed97af..a333f06119a0 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -162,11 +162,6 @@ void arch_vcpu_destroy(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-void vcpu_switch_to_aarch64_mode(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbfde79b5a7..d071c8b86d07 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -126,11 +126,6 @@ void arch_vcpu_destroy(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-void vcpu_switch_to_aarch64_mode(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     BUG_ON("unimplemented");

base-commit: 2fa468919c39aac189623b6c580ce4ff8592d799
-- 
2.39.5


