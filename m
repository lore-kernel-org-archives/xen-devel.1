Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9EAC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400990.1636772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw1-0006ns-0f; Thu, 27 Aug 2026 15:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400990.1636772; Thu, 27 Aug 2026 15:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw0-0006h8-46; Thu, 27 Aug 2026 15:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1400990;
 Thu, 27 Aug 2026 15:22:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvs-0005Hc-EX
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvr-00C7F4-Pr
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562c-e002-0a2a0a5209dd-0a2a4505e5e4-6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:23 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562f-4cb1-0a2a45050019-d155dd35c0ad-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:23 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-480001972b8so454855f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:23 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844143; x=1788448943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ldkqFQjndFbNw/I9T05JUW6mqsTU4X6qRLWNgFjU/Y=;
        b=MsEJwDeXQ9PUqJmqj7nd9UqEW9/ZnxdTCo3euYydnLkqn5w+I8I4TYjRLC5VHL73t9
         0pno9VFf0bMeIXmLDeadhgX1PBRF3vFYufgiToYDt1eWRqOnsKiVePy6bekDgS92zLhM
         ONq9F6hLbaojmGpcoaSsVttt9md0CYzTP41sSbYOGKaAgyAZvmjmJ8/7jgbn+iTCgNqG
         aJtM5uD3GK0uXk7DBqjoNlubUdDmX26r6W9Q6hrUuQEfhRMDd0MYV/GX97zSWYgOibvR
         Hoco9YXQdKR1Cbwe4A0l/r2IgCnd6guUJh6LC+vgHiToif4QIdzVBZ4FtamvK8RY/dU0
         X7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844143; x=1788448943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ldkqFQjndFbNw/I9T05JUW6mqsTU4X6qRLWNgFjU/Y=;
        b=rxezR4t8+qrlUiBvYxEkiKLEJKyN3c7M5oflKDqxBVyn2xbBpMJfZB5qprx/MkOJsF
         PMZvFyH7NymDpF8eAmQLYiUzeZCqQExe/Ms/bEoK5cXZh2bR5EeWpa+dnqZxdibLkjfT
         2EqQiC/ckqAnpU7wkNYA4bx8hYg3c8HKivpgZiSQJiubuQyL6hfyf738TnRxRiz2+X8a
         UUBatLaJ/JLQj5nwWSH20Vhtn3D3Lb9HrdyWtfm8MBnIalLq9cGcUh2b2b3aHtFjN9uu
         f2lGeXdrQVHXRGQG2K1YXiJgBLj19qZby+8zikoDm8SuJzxUzbOfSlDnHqFgWSz/BfGB
         sxtg==
X-Gm-Message-State: AFuF++nREAsPmDSkdcOBk2gfVF8yx48CI8mQy5kL7fdvtEK6eYrfHlwu
	q0/rrUKORkCP4yLeC+4iLhNs302d4PhWxC2LaxrcCjV9TsVnnwHpeQ0mXpuU/Q==
X-Gm-Gg: AR+sD12uitjBgfUc+gJA9ql4MPQEoEbuaDz3q0qqwLOM9G90wVJ2us74U38GWyvaF/e
	iMjEhTYqvvvWszvwI7XiVZst3k5Sr++aMPtv0v0bLwX5fBZOTfjnNI9QylZ5xEKrAgH8kXVV/UG
	Ew+HDK+kvNLzvFXNNV8z+adA4C7WYl2S8h9M0srlm2IFuFkrDKri+xdN+xOeL8tvJlkgYX+M9om
	qXQVuAMr5S8xgqRYZmRKKci5SnCmAKsCqLCbIU+7o55hkp+6v8NMUZcu4cGtGQQAw+hQUGXAG0I
	fOmiw4SuKZEIKaYKq0rGcbaRXbYfu5e3EqSjO1X7+sd6V0DgnqvCBXNRVjw+K/kU7kLnBAt17aj
	zZoxpTlGf7EWXRrAzMy+eYGqoV2hK9Gi3sQApYvc4x6LnYup0dPjnxdXrkSVrxhkj2OMi5tzpR/
	fs6vZILom10g44l/OszJvBPDMEPl/yqlmAHSvigZc9KbgU589VDNWMm6Kj57Ow7rUtJmAvkBx2q
	w7AZl0B4zwU/psIgpXbL96H7g+JMJpo
X-Received: by 2002:a05:600c:4712:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-499dc7260e5mr180627895e9.12.1787844143153;
        Thu, 27 Aug 2026 08:22:23 -0700 (PDT)
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
Subject: [PATCH v2 28/39] xen/riscv: handle the case when no vCPU migration is needed
Date: Thu, 27 Aug 2026 17:21:12 +0200
Message-ID: <c4f78f50022bd7a75a4deb71199e979beafb4906.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787844143-F62AB2A1-B7CCD5AB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1447

The IMSIC vsfile mapping is performed in continue_new_vcpu(), since the
target pCPU must be known at that point. It is therefore possible for
imsic_migrate_vcpu() to be called before continue_new_vcpu() has
executed, in which case v->arch.last_pcpu is NR_CPUS and there is nothing
to migrate.

Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
against silent incorrect behaviour or unexpected panics in guest VMs until
the function is fully implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index b0c4a9e2d728..ad7fbe708bfd 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
 void imsic_migrate_vcpu(struct vcpu *v)
 {
+    /*
+     * The scheduler can mark a freshly created vCPU's unit as migrated and
+     * invoke this before the vCPU has ever run (see the migrated branch in
+     * schedule()). No need to do migration for such vCPUs as they aren't fully
+     * initialized (for example, context_switch() will be called after
+     * imsic_migrate_vcpu()).
+     */
+    if ( v->arch.last_cpu == NR_CPUS )
+        return;
+
     BUG_ON("unimplemented");
 }
-- 
2.55.0


