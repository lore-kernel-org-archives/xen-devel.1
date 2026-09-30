Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B010CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437571.1656615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6i-0007JE-1Q; Wed, 30 Sep 2026 16:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437571.1656615; Wed, 30 Sep 2026 16:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6h-0007Hy-2z; Wed, 30 Sep 2026 16:24:35 +0000
Received: by outflank-mailman (input) for mailman id 1437571;
 Wed, 30 Sep 2026 16:24:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6e-0006l7-Fj
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6d-006Nvr-Sk
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a8-2eae-0a2a0a5409dd-0a2a4507c4d4-34
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:31 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37bf-b4ea-0a2a45070019-4a7de18dd99e-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:31 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso42605905e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:31 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785471; x=1791390271; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/jp8PMzGlGGiWG+GmHZRyZuEBmMNWGF6eFnVc/o6uo=;
        b=TENrT3XYn7YGuR7i4dRvC2VhLVcPIxTFEGEVMOo9yWMCfTyPX4jGVWs+uImHxDhtoU
         7nZ+yD2JKflzxDwH8k27GIC7kHZnmeQ1MdvHEx+1ZHbRoqdVM9g+4GM4qvIvVD8wAeBi
         CciJdFwn6Zmu/p9g7yCpuiqw4xGbQYLbG+pVmPGgZoLXpYDjq5SjfpMLNznYQmxwMYuy
         fDEwlh3t7ND6UyMTFmyMmwSIuWc9F5YQwMtHabJBBNmwz0KDBWDwffqkdLWn4y4Avo+k
         0u5SWM1MZtW51AcAWaL52gxw82yxA9ttb9nbVoD+aJyjnY7rfyIKlYZjZx+1AwVWQLgx
         vf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785471; x=1791390271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/jp8PMzGlGGiWG+GmHZRyZuEBmMNWGF6eFnVc/o6uo=;
        b=ktNb5ieT65eUmsA9nh4Uadd6EP8BTPqOWvSGA4bIlxLprnzsm+BAVpDPb6PSO7jHGS
         Tfi65Evk4Vwrhml2Ic7FJ0DH2hLl6OOkQSaRIPH5zLigee14io72Wf9a9JzCm2KIY2qo
         QWrp/bEsXG1tZd2MQfpmzdBJsPVj/u0JSKR0yp3HpqIht4VWplW9bm/jR1I6cV5IHeQt
         o0JnAkOOyA0S8PWU3q74HEARGA/G0H1qqoTbtrPtVLotRkuHO+wjyxcwQKXTNy16mQw0
         ASivkNIo4vJHQQjWLogglGM3HqvRg4DIKe7ArLqLS7M74zgGt7DXCC9pA/5SxEsQ3yNz
         Sh0g==
X-Gm-Message-State: AFuF++kuNhY08glw3RCFZ0V6z3sxa7PeL+sVg9nfhzXzx2xWu+j+JzY0
	hlxY9MKFrZCXypEGXzny3hrMY0oM1hZbWBGGnTihPFwEX+GaaamiYR43OS9orQ==
X-Gm-Gg: AYBFou3OaELVrnj3FlF2bNwToq2vhzKkvAwlqlKU0S3pz3mzXLsF/7CgY/YEWLZPFcS
	CPYNCGUJhBkAIsi7e7ulxam1vsD71ZDBWkznNRR7KRf8/of3XdoNj4rL4iCgE/2ci9YbuxOk0mt
	O1wKWx4fYPjN0SRoCcNS/jte4P2LNw1m6LLHrSrWVL3eIV0RKXqukFf6k+oesM4kqN5Y6/F6eFV
	dIokSLNDJ2ycO47cpjUlKMArLmJSXVcv4fQDTj19iAiV8gu+NxhK5hVkTETaU2LctZFh/vNGn8r
	P3hJYjrqiuQCb8Ms3cDRKE9QbdXauZ6SmYNgySL5tb//ayoHzh9ycr+OXwGQoCo2OBbx5yytTTg
	R0Cu1b+q4lH8/28vUK5NKu0usFgLJVoSGckqGWIF158cEUzfbhwvTMZ2LakSiY67w8BmiFZCedd
	VQb1/CTVPeDWGkX2i0UXJ6zf+tBSZvC3575hTnBUO7p+Y+k8fLPJFuxm/kKHYAW0wf2S2S1Elz1
	U7Uzg/kJ/oGF22AxHeXuy/n5HJFL+HTC/+vVI8KSkUo8U/LlTowKtunPufG4Q==
X-Received: by 2002:a05:600c:46cf:b0:4a0:151e:f744 with SMTP id 5b1f17b1804b1-4a01b01bb16mr34637825e9.22.1790785471263;
        Wed, 30 Sep 2026 09:24:31 -0700 (PDT)
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
Subject: [PATCH v3 27/39] xen/riscv: handle the case when no vCPU migration is needed
Date: Wed, 30 Sep 2026 18:23:46 +0200
Message-ID: <dddd74313e8b64b61c797fba663cba5e9322911e.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790785471-362C4AE4-C5B3E5B0/10/73395122804
X-purgate-type: spam
X-purgate-size: 2084

The scheduler moves a vCPU's interrupts (arch_move_irqs(), i.e.
imsic_migrate_vcpu()) ahead of context_switch() whenever the unit is
picked up by a pCPU other than the one it was assigned to, which can
already happen for a freshly created vCPU on its very first run. No IMSIC
h/w interrupt file has been mapped for such a vCPU yet, so there is
nothing to migrate: return early while its last_cpu is still CPU_NONE,
i.e. while it hasn't run.

Keep the BUG_ON() at the end of the function until imsic_migrate_vcpu() is
fully implemented, to avoid ending up with a vCPU which isn't fully migrated
to the new IMSIC interrupt file.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Reword the last paragraph of the commit message: the BUG_ON() is already
   present in imsic_migrate_vcpu() before this patch, so it is kept rather
   than added.
 - Check last_cpu against CPU_NONE instead of NR_CPUS, as that is the
   value a vCPU which never ran holds now.
 - Describe in the commit message how imsic_migrate_vcpu() can be called
   for a vCPU which never ran, rather than referring to where the IMSIC
   interrupt file gets attached.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index c5fcdcf13b00..2f0bb29ae639 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -693,5 +693,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
 void imsic_migrate_vcpu(struct vcpu *v)
 {
+    /*
+     * The scheduler can mark a freshly created vCPU's unit as migrated and
+     * invoke this before the vCPU has ever run (see the migrated branch in
+     * schedule()). No need to do migration for such vCPUs as they aren't fully
+     * initialized (for example, context_switch() will be called after
+     * imsic_migrate_vcpu()).
+     */
+    if ( v->arch.last_cpu == CPU_NONE )
+        return;
+
     BUG_ON("unimplemented");
 }
-- 
2.55.0


