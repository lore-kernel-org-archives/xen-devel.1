Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15BEC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:34:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413425.1643669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4KJE-0007Rj-8b; Wed, 09 Sep 2026 15:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413425.1643669; Wed, 09 Sep 2026 15:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4KJE-0007Rc-63; Wed, 09 Sep 2026 15:34:00 +0000
Received: by outflank-mailman (input) for mailman id 1413425;
 Wed, 09 Sep 2026 15:33:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4KJD-0007RT-GJ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:33:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4KJC-00CxjB-Ss
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:33:58 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17c66-8faa-0a2a0a5109dd-0a2a4501beb4-2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:33:58 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17c66-5984-0a2a45010019-4a7de44cc0ff-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:33:58 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a6249b76a8so582740a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:33:58 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788968038; x=1789572838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHF1dWy+i1zH0Zv8Fgb2tmZxyyTHJFjQ0vjmPRcM214=;
        b=P1v5vTKInZqBUHWgGrguDpfjmOaqO5VjPRnUG4dD05youW0WmOOSzn+kcmmz4PMLmp
         Wc4cYqDF4EurXS7soHfGLvPQIGPrPHeJGOckm7QE7AFV7lcO/y0YRvUwtm4YQDyGcoeD
         ocDLqe5SJbH40/LvLiZJpyXr+MdqqneBVxI3ZnxbxkdkE0inzQ0dCrrq4FSK72o48Xvc
         +lpWUQKP8ewdWFBx46lvy0kAPpYa/f25bNLBt4l1YWIqA1MymxLYt/Cn9tR6NpsT3NpC
         XHP9DEVJkBL658Qy8Thbfy9/15fBINFaL292OKAtN/5pIgigWoM+ccn1pYyPhfPS8Cmh
         7YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968038; x=1789572838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHF1dWy+i1zH0Zv8Fgb2tmZxyyTHJFjQ0vjmPRcM214=;
        b=n2kDFrv3NFgiH0TmAXw+igMNqYLjUp7Bh8j8la1cjLKfu5RTeJ5cfjKJ5lnYxF0VaK
         TLMkAVh4GnjVVp+rS0rA9nMnErM5gi8iktgQcNFzZsvR3IYxMLJF9BnDrTLUet80ll0k
         Ph6EC8rL4pGYQUBvnG0j+miFqVz7TxRaeCfynJNsTcWpLKGBucC9LclH4PhE+awmEOz7
         Wp1n8P898wzZp0yym65AN+v7j9LqKlc4IEKQlE1NYnum/GKXwHecfKJwwSmcoLvokPVK
         +VcBOFHPlOTQffeVaj2aPBXwtsq9YeFZnvKmzPaFY2AaG/780OC+S8RZNt37ETO1m0jm
         DvFg==
X-Gm-Message-State: AFuF++km/EBhXsOf8FWhtxTZuBa7UWvFyVHCZ4+wByrGDspm2pow5XPL
	jgIJYjgdtEdmEg5tcwm4S4z9Lbzfw1sWxaokYjQMScMg2gC226UY+6buOXXYXYd4
X-Gm-Gg: AYBFou0ADIJqe0rzw0yAJ8P91JWIm08YtXkA0048GcC4bHn3twkLQhEVLLvlQK9iUCH
	hr2hFR1+/IQTGbdJs5IZInQPMul6C0QpeIoJw2z522JufucfBDQ2H3DAYfaIIZs9wFTE4sVAu7b
	EFIRrfThx02sbY3Ul/TYJNQPLRAaXA0aO4YJ7ZuGS6CXajzXFPRPCA0qbz58M1OKReoe4U2zHaz
	WZTMKGBIH6keaIkKDfcDXs+J1fP7ZhxI/xcIxPMwV9euvIdbc14Yfeiuspmah5e8pivojBveecq
	IJy0xjmgYwO/eXKORumf6NJbug6r7k9iAOV55g1mrPwn1cIDF555WDNylpgbNcM8ZAkmATC00z6
	InRsnENKDdGhB4mLYkiCZVdIAx4YK1eIyl9MDXtbFLfi3qD7NUUxTpnnlMacXr5+kmOX79g8YQ4
	SKiiI/6mjd7NqDeG7FaDM7lIQKdVLbsNB9z2sF4zClKw7D2RwmnTK78p4/JYwZVtg0Q2nWNnyC4
	kc/BOtpQyvAsa+6S+U=
X-Received: by 2002:a17:907:c408:b0:c26:1648:a075 with SMTP id a640c23a62f3a-c2941be4cddmr61403866b.48.1788966500181;
        Wed, 09 Sep 2026 08:08:20 -0700 (PDT)
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
Subject: [PATCH v9 06/20] xen/riscv: implement make_timer_node()
Date: Wed,  9 Sep 2026 17:07:24 +0200
Message-ID: <63d5e0a7f9e8d9891b248d503c33498a5bca4225.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788968038-BE664757-B6A07A71/10/73395122804
X-purgate-type: spam
X-purgate-size: 1618

Generally, in DT for RISC-V there is a document which describes a timer
node (riscv,timer.yaml or sifive,clint.yaml), but the Linux timer driver
is declared with TIMER_OF_DECLARE(riscv_timer, "riscv", ...).
It matches the CPU node (compatible "riscv"), not the timer node itself.
It then calls of_find_compatible_node(NULL, NULL, "riscv,timer") only to
read the optional riscv,timer-cannot-wake-cpu property.

Since Xen does not care about that property for now, make_timer_node() is
implemented to return 0, as no timer node needs to be created for RISC-V
guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-9:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - Update the commit message.
---
---
 xen/arch/riscv/domain-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 1af4c48fb30c..d7613721db95 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
@@ -154,3 +155,10 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 
     return fdt_end_node(fdt);
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.55.0


