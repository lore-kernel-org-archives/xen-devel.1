Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BC6C5620A
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383602.1626886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3E-0001JF-8B; Wed, 05 Aug 2026 14:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383602.1626886; Wed, 05 Aug 2026 14:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3E-0001J5-48; Wed, 05 Aug 2026 14:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1383602;
 Wed, 05 Aug 2026 14:56:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3C-00015x-QJ
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3C-00Cdp1-6c
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:56:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f20-e002-0a2a0a5209dd-0a2a4503d7c8-38
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:58 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f39-fae8-0a2a45030019-ca0c7c96eddb-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:57 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id A81F11D00112;
 Wed,  5 Aug 2026 10:56:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 05 Aug 2026 10:56:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:56:55 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785941816; x=1786028216; bh=If8iCaUuEU
	VvExp6X8arU9RVZ07EdT9hQbyHaLfCGsI=; b=BKxRI+UeLWnwHMgldypAuxkp4B
	sAhPF4dDpp0+iZVUhwDc2eIxzKEIzToOoiNBuHrUHTnrr0FIMwlyhC0FAHpO1hkt
	mfmTUhOE7UOAscOiLYyW+M5l2aIMDA0ibf706YtQW8/Pux5GZ8kzeQLkXKTAnX2T
	lktIo8gbK5xfvQHqiDHw62gSM552SFZpUBq1AN5caiNKoX1U/z/IGQjgpCJo/wSQ
	hsTuzXp6/eBhgj2U6IA67dy6OBYFXEmBW/Fp1UE2+CJMkKsSoR+5f8Q3wKV5f9XW
	weCCruNpm1xUIwprX2IT1kn0ndQ4/qFdzIBdpE1Do3lpbF7Zf2BHjlaLo3LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941816; x=
	1786028216; bh=If8iCaUuEUVvExp6X8arU9RVZ07EdT9hQbyHaLfCGsI=; b=O
	l4tHmUjfe8ZhMaDLMq6E7KD+QxGkkIjsDCi9GBszronts+gyX4VsjansEpk3NS9F
	9EFLCHX+JICZ/DRPwI6SpL/aSqWyVxuI/cBYQ92cFLJM59kccZ2ezug5bypNMAna
	1pFQ1UExX/sL+2ulRE0GxYQgUd5ihQtbQhNPbCCt/cauvnu4IOrLl1UNSz9TGq3X
	gf3fBz8X7qS37i69Q/FVhKFJYM6VD4yABjB75a8wnT2VwuR6Hgaz8WfMbRaAYp0+
	drMOnTHsj+RN531Qf0qkHMyz0R0QcHpuokLnxn30AjcNj3zLWyiY7Um+djoprceC
	I1F2AogWztUmgjuJopddg==
X-ME-Sender: <xms:OE9zanSTxSkPeqkUD4EIMN8nW-F8LTgT0a3yAtHKzZ3skut7NbhaFQ>
    <xme:OE9zavrmtu2_KWvO7FVO0lmCfXRybQulnlXpAkObJpz7aAPEMtSddb2cpO7XyAjXL
    xGcTBuNlTqzlRpV3BDyA_88SKDUNd60BABIcfjm6k26Bw3Z5g>
X-ME-Received: <xmr:OE9zalKH7-f-_i8j_xNagir3RheLuPQJz8R3QIxF81UNvoYLsasaLESA_Nircol8PeQru5fdcehm426xjU7woRWFNpRBYeTx67t7FoquZn4>
X-ME-Proxy-Cause: dmFkZTFg5HWH/RDqdPpR88i/6M1gtPWzLlXDm7puE44YW+OQRkCu0ypR/9JOPRDl1te3/p
    2ugUGdWUlQb8kocRthjZN7vvr6IWWNFcyKYmBFPe+BzKMnxGjKoBahL5VCHV3UAfs0EHAg
    nj3sYoDmr7GyZbFXABfsR3rbdQAxCafinJpMUI+6VqMVy7guc3dUP2M2goerpX03cWT8GB
    3tIsn5JiFR3GjgHhPz/r2yz7V7NDg477JFOnzakkhw9w+L8/GP2qYPPRO39CHuug0G7Ubo
    N42GUSC5i0XOiRx9MufeivVdVi29Q812Jc2LJ90UxPjSbThjlODlkTjM/Zl+lF8/E+2ahn
    is+bRSV1dAKf+3WxH9+prVq11Vy45YWKlbNbiCrUBO4C04CBMR49ODI1BGXvU81EfFnMcR
    yJNuMZTdimaUPAfhBnBegsmDDqegTWMsNbq7Cf5fGuC4MzRrG5bsJh8ApZyuiKE548EiMP
    xHdto99MpuSSifVixRyp7mCJf2Y03CzI+zmXDa760m0p0lnAyGy4w/J98Dt1WBHQoGCZY4
    dz90z4nsVqfSe8hnTtAsKKeRJst0PGohEAE8C9kRi8ZlKfyabM1ItPXG+rc5tNKazpDfrg
    ZrAIhGLT2jkoWixnEOZ0TH1Zk8GMSGeHV6DNSy0CSm++0JasOabEJFXXPgUQ
X-ME-Proxy: <xmx:OE9zaip0yVVY7xZHWyG74bQnBUJclspaCsZzfzNcHokjrek7jjRy-A>
    <xmx:OE9zatzu8TxnMl9QA-1UipHfz_6UR1L5imGFBxWFUGICJ7UYVK2XPA>
    <xmx:OE9zamO1aE4cIZPjZl9SoNLjz2a_e0FOxlqUW-An0jJYJUX-qP5u1Q>
    <xmx:OE9zai51Cd039mgKdBmLhT0a5hFa-NvwO__yX6jEgC_iBc4NbKvRfA>
    <xmx:OE9zapcQD4ZuK9LTewgok6Hm68x3-jPBdfb155i4unocalH84EqlxJAW>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 03/13] CI: Add driver domains tests
Date: Wed,  5 Aug 2026 16:55:31 +0200
Message-ID: <20b70bd488f533cdaa8e72a92a69afc0d5de4d7d.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785941818-6E2D04E9-85FFADF0/0/0
X-purgate-type: clean
X-purgate-size: 6516

Setup a simple two domU system. One with network backend, running
xendriverdomain service, and one with frontend, trying to ping the
backend.

Contrary to other similar tests, use disk image instead of initrd, to
allow bigger rootfs without adding more RAM (for both dom0 and domU).
But keep using pxelinux as a bootloader as it's easier to setup than
installing grub on the disk. Theoretically, it could be started via direct
kernel boot in QEMU, but pxelinux is slightly closer to real-world
deployment.

Use fakeroot to preserve file owners/permissions. This is especially
important for suid binaries like /bin/mount - without fakeroot, they
will end up as suid into non-root user.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v5:
- add code comment about sparse files
Changes in v3:
- add fakeroot
- run ldconfig at the disk image creation time, to avoid running it at
  dom0/domU boot time (which is much slower)
Changes in v2:
- use heredoc
- limit ping loop iterations
- use full "backend" / "frontend" in disk image names
- print domU consoles directly to /dev/console, to avoid systemd-added
  messages prefix
- terminate test on failure, don't wait for timeout

Needs debian/13-x86_64 container rebuild.
---
 automation/build/debian/13-x86_64.dockerfile    |   2 +-
 automation/gitlab-ci/test.yaml                  |   8 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 135 +++++++++++++++++-
 3 files changed, 145 insertions(+)
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 784299d52dc3..5088f7435c1e 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -56,7 +56,9 @@ RUN <<EOF
 
         # for test phase, qemu-* jobs
         busybox-static
+        e2fsprogs
         expect
+        fakeroot
         ovmf
         qemu-system-x86
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 61adc1baff30..566d1f4287d7 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -733,6 +733,14 @@ qemu-alpine-x86_64-gcc:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc
 
+qemu-alpine-driverdomains-x86_64-gcc:
+  extends: .qemu-x86_64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc
+
 qemu-smoke-x86_64-gcc:
   extends: .qemu-smoke-x86_64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
new file mode 100755
index 000000000000..bada6599842e
--- /dev/null
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -0,0 +1,135 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+cd binaries
+
+# DomU rootfs
+
+mkdir -p rootfs
+cd rootfs
+mkdir -p etc/local.d
+passed="ping test passed"
+failed="TEST FAILED"
+cat > etc/local.d/xen.start << EOF
+#!/bin/bash
+
+set -x
+
+if grep -q test=backend /proc/cmdline; then
+    brctl addbr xenbr0
+    ip link set xenbr0 up
+    ip addr add 192.168.0.1/24 dev xenbr0
+    bash /etc/init.d/xendriverdomain start
+    # log backend-related logs to the console
+    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
+else
+    ip link set eth0 up
+    ip addr add 192.168.0.2/24 dev eth0
+    timeout=6 # 6*10s
+    until ping -c 10 192.168.0.1; do
+        sleep 1
+        if [ \$timeout -le 0 ]; then
+            echo "${failed}"
+            exit 1
+        fi
+        ((timeout--))
+    done
+    echo "${passed}"
+fi
+EOF
+chmod +x etc/local.d/xen.start
+fakeroot sh -c "
+    zcat ../rootfs.cpio.gz | cpio -imd
+    zcat ../xen-tools.cpio.gz | cpio -imd
+    ldconfig -r .
+    touch etc/.updated
+    # this is a sparse file, not really using full 1GiB
+    mkfs.ext4 -d . ../domU-rootfs.img 1024M
+"
+cd ..
+rm -rf rootfs
+
+# Dom0 rootfs
+mkdir -p rootfs
+cd rootfs
+fakeroot -s ../fakeroot-save sh -c "
+    zcat ../rootfs.cpio.gz | cpio -imd
+    zcat ../xen-tools.cpio.gz | cpio -imd
+    ldconfig -r .
+    touch etc/.updated
+"
+mkdir -p root etc/local.d
+cat > root/backend.cfg << EOF
+name="backend"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=backend"
+disk=[ '/root/domU-rootfs-backend.img,raw,xvda,rw' ]
+EOF
+cat > root/frontend.cfg << EOF
+name="frontend"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=frontend"
+disk=[ '/root/domU-rootfs-frontend.img,raw,xvda,rw' ]
+vif=[ 'bridge=xenbr0,backend=backend' ]
+EOF
+
+cat > etc/local.d/xen.start << EOF
+#!/bin/bash
+
+set -x
+
+bash /etc/init.d/xencommons start
+
+xl list
+
+tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e "s/^/(backend) /" >>/dev/console &
+tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e "s/^/(frontend) /" >>/dev/console &
+xl -vvv create /root/backend.cfg
+xl -vvv create /root/frontend.cfg
+EOF
+chmod +x etc/local.d/xen.start
+
+cp ../domU-rootfs.img ./root/domU-rootfs-backend.img
+cp ../domU-rootfs.img ./root/domU-rootfs-frontend.img
+cp ../bzImage ./root/
+mkdir -p etc/default
+echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
+mkdir -p var/log/xen/console
+# this is a sparse file, not really using full 2GiB
+fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
+cd ..
+rm -rf rootfs
+
+cd ..
+
+cat >> binaries/pxelinux.0 << EOF
+#!ipxe
+
+kernel xen console=com1 console_timestamps=boot
+module bzImage console=hvc0 root=/dev/sda net.ifnames=0
+boot
+EOF
+
+# Run the test
+rm -f smoke.serial
+export TEST_CMD="qemu-system-x86_64 \
+    -cpu qemu64,+svm \
+    -m 2G -smp 2 \
+    -monitor none -serial stdio \
+    -nographic \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 \
+    -drive file=binaries/dom0-rootfs.img,format=raw"
+
+export TEST_LOG="smoke.serial"
+export BOOT_MSG="Latest ChangeSet: "
+# exit early on test failure too, check if it was success below
+export LOG_MSG="$passed|$failed"
+export PASSED="$passed"
+
+./automation/scripts/console.exp | sed 's/\r\+$//'
-- 
git-series 0.9.1

