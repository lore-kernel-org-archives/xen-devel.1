Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8912C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 17:43:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382508.1625862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJAe-0004U4-Oh; Tue, 04 Aug 2026 17:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382508.1625862; Tue, 04 Aug 2026 17:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJAe-0004Tx-M5; Tue, 04 Aug 2026 17:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1382508;
 Tue, 04 Aug 2026 17:43:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrJAd-0004Ti-MG
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:43:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrJAd-001NYu-36
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:43:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7224b3-bab6-0a2a0a5309dd-0a2a45098d02-10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:43:19 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7224b6-be1a-0a2a45090019-d155dd33d504-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:43:19 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso51476f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:43:19 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994dfe64e0sm17657735e9.6.2026.08.04.10.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 10:43:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785865398; x=1786470198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJbe7BqS6R6E73aZnDhX1SHtM9ZoBc4H0nu3Jn4E/GA=;
        b=DqYzRCwxbpS0JBRR9yh85QOfeJrEXYjOciB+ggM3H6dy4SEN6CTBXzOLLM05GVPBVQ
         kx4sBSV2nJyNhe8RRvIy1Bh07NytXOofvod+4xnLIOK+zO6v68NVe/ROz/0G0FJdbekH
         zdRLxC2NnWnpUF5EeDvjHwFKT9ZocFWXoBc6+cVA52Tjw3eZJKOnjqXBB+HV8ww4UqZo
         VOO0CMsMbqFHx0xPs/12H3a2Civ//tFz1nDZ8G3PmcZhGIS/18L6msW65rq4Kqju9xnA
         B7ZeZQUp2nadvHVexvxMkZszIYAiBIX7wnfYaKVugxPkdN6BIeVkC4holbRjepveD87w
         vosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865398; x=1786470198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJbe7BqS6R6E73aZnDhX1SHtM9ZoBc4H0nu3Jn4E/GA=;
        b=HsEmDmuDwxNPHK0ICBO6oDoSYCOGLYtkuuoQh+MOpaZbcQbiYzPqmzTslsiuNRVSF3
         CmTDpspq0Lo+3LvSP2eHOx0FWD7oW0pWjnHsE2VMjbFs6cBHycCheTf4g7Gfu/nFa+lM
         6SzlUy3vuJqigxr4obqOhoX6VuHOgszkTy9wMlY+N5GyXX1tr6yrg+oeBf5dV/dIlrdL
         zxlCVUJpF4gisrOEbVGTgo8HHagOtQL/NPLdeAUXLsaUXRvgrJbscuawIEzx/xmKMGlt
         ++E9WSXO14hsL7B00F8p0iWOKgRCrmnscbEQhB1zsLitTgFHkWx7wAuXnAp0gQUBV9Sy
         8Wnw==
X-Gm-Message-State: AOJu0YwHGndAcSUQM+5ptEgmGIegh6T4Z/TNtcN/aeIPq8vfCp2ZIEXW
	ujujA2HJCTP4MzaOzy0f8Wcy/LiZLzUHxmPITc2Bn934SxW33vEWTXJwvKaQDZqraL0=
X-Gm-Gg: AR+sD12yCGX+3K4nGMTNxNLIgjgm0ds4ti+Egfx93rl4HcHWLtzXkymJL1Z4jy5voYf
	eLdJ4Bm9GLPXf8JPE2bhkwtszYU6QRx7PAHBGLxEtMzcUbWQAhJTUHrsCXorZ6xkN/Wj/BS+Ukx
	JWITU2p9cZf7rU3z2YDVvTw48qFDZNZ68QVDrqbO6/VTsfCIkiWsIiQF54GxtlzXDotZElkyC+H
	6v3aO9qoL5JpDJcyySDl9OXsm6lC2CCxlU0kLoSVKTwTmBW4ISr0vSCq+SmqJGt7uD07r1VA95x
	c+zeKusMU7Y4jORix5zS3ASXoFdwprd3vp44/xyVrcelqaVMPVn02j1ER4hZKTfCR+X+iWz60We
	BoxmM01o9R+W1va+aabcox5uYtd5zyG98ipUK7CSs4M+hEVMVcM+OQgOZ1eEsY+T7OZjzdlGpDG
	H4VHS9utpP56SdSuoa6sohML/Ud6eheSOUa/xIXVn02leUfHhj99oDYpGOWUxouw1yFqnDTQJXi
	H+ZOfYNF0tV1rvZftlQHUL14jHAZpONUb120FNi
X-Received: by 2002:a05:600c:840f:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4994e72605emr742705e9.4.1785865398418;
        Tue, 04 Aug 2026 10:43:18 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/2] CI: Check save/restore of PV domain as part of qemu-alpine-x86_64
Date: Tue,  4 Aug 2026 18:42:18 +0100
Message-ID: <20260804174219.835096-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804174219.835096-1-frediano.ziglio@citrix.com>
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785865399-FD668034-4C7677C1/0/0
X-purgate-type: clean
X-purgate-size: 2998

Make sure that save/restore continue to work.
The check save and restore twice to check for corrupted status.
Also a command is launched in the guest to make sure that the
machine is not crashed but working.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 automation/scripts/console.exp           |  8 +++++
 automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index e27886bbef..ff58ed29b8 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
     system "$env(WAKEUP_CMD)"
 }
 
+if {[info exists env(EXPECT_TEXTS)]} {
+    set lines [split "$env(EXPECT_TEXTS)" "\n"]
+    foreach {exp snd} $lines {
+        expect -re "$exp"
+        send "$snd\n"
+    }
+}
+
 if {[info exists env(LOG_MSG)]} {
     expect {
         -notransfer -re "$env(PASSED)" {
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 60f5cc49fc..409a601c34 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
+
+# Script to test save and restore.
+# It saves and restores domU domain twice to check if the domain was corrupted
+# during the first sequence.
+# At the end open the console to check if the domain is working.
+cat > root/save_restore_test << "EOF"
+#!/bin/sh
+set -ex
+xl list | grep -q domU
+rm -f save.dat
+xl save "$(xl list | awk '$1=="domU" { print $2 }')" save.dat /root/domU.cfg
+xl restore /root/domU.cfg save.dat
+xl list | grep -q domU
+rm -f save.dat
+xl save "$(xl list | awk '$1=="domU" { print $2 }')" save.dat /root/domU.cfg
+xl restore /root/domU.cfg save.dat
+xl list | grep -q domU
+rm -f save.dat
+xl console "$(xl list | awk '$1=="domU" { print $2 }')"
+EOF
+chmod +x root/save_restore_test
+
 find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
 cd ../..
 
@@ -70,9 +92,23 @@ export TEST_CMD="qemu-system-x86_64 \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
 
+# Sequence of expect/send strings:
+# 1. wait domain start and close console;
+# 2. wait login prompt and login as root
+# 3. wait login and launch save/restore test;
+# 4. wait restore from domain console and send a command.
+gs=$'\x1d'
+export EXPECT_TEXTS="BusyBox
+$gs $gs
+login:
+root
+login on
+/root/save_restore_test
+Restarting tasks
+dmesg | grep suspending | tr o 0"
+
 export TEST_LOG="smoke.serial"
 export BOOT_MSG="Latest ChangeSet: "
-export LOG_MSG="Domain-0"
-export PASSED="BusyBox"
+export PASSED="suspending xenst0re"
 
 ./automation/scripts/console.exp |& sed 's/\r\+$//'
-- 
2.43.0


