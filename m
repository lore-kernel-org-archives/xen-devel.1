Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC00C56207
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383608.1626931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3L-0002Y6-RY; Wed, 05 Aug 2026 14:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383608.1626931; Wed, 05 Aug 2026 14:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3L-0002Xl-Nj; Wed, 05 Aug 2026 14:57:07 +0000
Received: by outflank-mailman (input) for mailman id 1383608;
 Wed, 05 Aug 2026 14:57:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3K-0002Kl-Q5
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3K-00A5Sr-6T
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f41-bab6-0a2a0a5309dd-0a2a4506aaa0-4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:06 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f41-195a-0a2a45060019-ca0c7c98ac8f-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:05 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A90017A00C0;
 Wed,  5 Aug 2026 10:57:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 10:57:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:03 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941824; x=1786028224; bh=llNtFQlQYr
	7PILGy+20tguUtKJuL+FX+u1XXE52nbb0=; b=wu9hYmcLMZxkhllF1qZl+f4epq
	OXOA0ZcpGU1OFgPjGHtqevarlAzDzWlyL1R/66KONJop+0o3BadnQjMwo7fVdAyZ
	xOVYO0b1KDiVqHs/qpbEcC2pOrpTm3XIlBIqEsICnzeoJshqpcdYXeS7lRGljtta
	Rjpl6QMclcERy4+QBr1KcKuLBjtyZJ8Blm/9zJ0Cz3OxEhJXX09eOErdNM33BrAN
	bmnl6LYyfYSOhPWmSYkgMKbzqqt5MTBrhV+LNt/sOrUwJzeduuJFQaSlFqit9Pze
	VQeuUYjvL30iW9A4I1yeelnitZMut5MHW+rekHRZ6aeKtogjzSk0qYJWJz8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941824; x=
	1786028224; bh=llNtFQlQYr7PILGy+20tguUtKJuL+FX+u1XXE52nbb0=; b=O
	HpOn8zBtsjG1XTpVSXWn8hCHW0f5fb67Y/D1+Mcd2E6EiVIJ8scIGiDtOvMqPaLs
	tmQ7mEPHunYsWJAQl5TAdeT658WUmHLrPx9+di9K5kEUu+nbOvo/hJPS6B+HeA3+
	rQHjwVl+fNCrhrwkSvlJTgXhBSCZOh7b9PEza1ETkWJtG+uidWIaKhVNRP+qXznj
	S99Tc504t5C5LjMXW1Sl6XYb81KKboQLKMSbax0TKHLsCePvKE7PNyjZAfpe4bfM
	bHbczxDnmQ/ndZFfexZ5zrK5ToQITgBey9svvCEoKAhy1Qou/qAyt24mwyiYn+Dj
	5+NEpx4oL4NPLfFbIYncw==
X-ME-Sender: <xms:QE9zallsdyVKT2X0xJjrEQ9UtrFNDs3LrEQzuF3WgXtfcQaxW_wUSg>
    <xme:QE9zanv-aWqgTkQf2ax6xIXdokCJO6XBw88eRUY-10HxCgWH-GeeMMpPitUSsj31A
    k5gc29nCgCV9Bhtcq2KkQiZi9-9yNzVBRI7t9kXpTGjvlKOrVw>
X-ME-Received: <xmr:QE9zaj9vOnDIjoRn3cd6onNGHoby_KmWM_w0NMyYxlkzuERGVBXPJveTQ9g73oyB6KqkWtqmJGg6no7i8zt00NiLx5ajUhGnAsDugUoUKlM>
X-ME-Proxy-Cause: dmFkZTFg5HWH/RDqdPpR88i/6M1gtPWzLlXDm7puE44YW+OQRkCu0ypR/9JOPRDl1te3/p
    2ugUGdWUlQb8kocRthjZN7vvr6IWWNFcyKYmBFPe+BzKMnxGjKoBahL5VCHV3UAfs0EHAg
    nj3sYoDmr7GyZbFXABfsR3rbdQAxCafinJpMUI+6VqMVy7guc3dUP2M2goerpX03cWT8GB
    3tIsn5JiFR3GjgHhPz/r2yz7V7NDg477JFOnzakkhw9w+L8/GP2qYPPRO39CHuug0G7Ubo
    N42GUSC5i0XOiRx9MufeivVdVi29Q812Jc2LJ90UxPjSbThjlODlkTjM/Zl+lF8/E+2aG7
    aOyEBHoV8EgKgIvYVDmRxD7FYtA8R9JSO6Q6iTa1qhDfTedO6kcBPv2Zc7fFOGSBjVj4If
    EK9LBVBNO+tASBhg/3jgvdFnTHv19oF8tdtHz6iY9gcgZoN0LEy0UNhXaFqQ1lGv6zx5mk
    InjPTLPm44ggMAKBkGvYFgISlyb9HnoK0/6OxJTDDH0bSp36V0YHYUhP6qsYkx+ThWQPjs
    i854as250OH2ovH2HZgWjrxZ4rlm+uOXYtWtzCHg4aIMg5rOrLyZLUb/TpArYrI1PyO8VG
    seLT7bP+LnHOfcaE0JRpOnagI6j9WEgu3HoBCJFAQXGYJj5OjjqOWpwfEsoA
X-ME-Proxy: <xmx:QE9zahMiif7_80k1JeSpE5_NJXYrmjnQ1BaZaBjsUEbhyylv8MD7Yw>
    <xmx:QE9zahFRmq1BKSLKe_LdJ8AAl2S4iMlGl7GzW1_xrHibOrvoXKIUgw>
    <xmx:QE9zavQjMg30q-sS8cQszvZIs_TQ70IbNGNClARmVLS89Pbma_zHyQ>
    <xmx:QE9zauvOz72dWIUamRzp8GYeeTVGx2MlLjdAosaF30o6UnS9PkSFYg>
    <xmx:QE9zagh70fA4Bv4ymp3WmH2jEpyBIVKNs5463Hwy6BJ1gp01OZ39jYC0>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 08/13] CI: add tests booting UKI via grub
Date: Wed,  5 Aug 2026 16:55:36 +0200
Message-ID: <8f7e40b5f544677321d994fa6168e2090333635a.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785941826-F6A7477B-7C654A22/0/0
X-purgate-type: clean
X-purgate-size: 3746

Test booting unified xen.efi via grub. The new test (grub2-pv) simply
loads the same xen.efi as the earlier test but via Grub's "chainloader"
command. In theory it should be the same as loading it directly from
firmware, but practice shows there are some corner cases sometimes
(especially before calling ExitBootServices).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5

Needs containers rebuild
---
 automation/build/debian/13-x86_64.dockerfile    |  1 +-
 automation/gitlab-ci/test.yaml                  |  8 ++++-
 automation/scripts/qemu-smoke-x86-64-efi-uki.sh | 36 ++++++++++++++++--
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 8a36774f1155..3ae1d27fb257 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -59,6 +59,7 @@ RUN <<EOF
         e2fsprogs
         expect
         fakeroot
+        grub-efi
         ovmf
         qemu-system-x86
         systemctl
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8e2db8c33528..1359d70ff2b4 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -812,6 +812,14 @@ qemu-smoke-x86-64-gcc-efi-uki:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
+qemu-smoke-x86-64-gcc-efi-uki-grub:
+  extends: .qemu-smoke-x86_64
+  script:
+    - ./automation/scripts/qemu-smoke-x86-64-efi-uki.sh grub2-pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
diff --git a/automation/scripts/qemu-smoke-x86-64-efi-uki.sh b/automation/scripts/qemu-smoke-x86-64-efi-uki.sh
index 8275dd1a81b3..82702fdcb682 100755
--- a/automation/scripts/qemu-smoke-x86-64-efi-uki.sh
+++ b/automation/scripts/qemu-smoke-x86-64-efi-uki.sh
@@ -11,9 +11,14 @@ build_dom0
 # variant should be either pv or pvh
 variant=$1
 
+extra=
+grub2_chain=false
+grub2_linux=false
+
 case $variant in
     pvh) extra="dom0-iommu=none dom0=pvh" ;;
     pv)  extra= ;;
+    grub2-pv) grub2_chain=true; extra= ;;
     *)   echo "Unknown test variant!" >&2; exit 2;;
 esac
 
@@ -32,15 +37,40 @@ vma=$(objdump -h xen.efi \
     | perl -ane 'if (/\..*/) { $vma=hex($F[2]) + hex($F[3]) }
     END { printf "0x%016x\n", ($vma + 0xfff) & ~0xfff }')
 
+UKI_PATH=boot-esp/EFI/BOOT/BOOTX64.EFI
+ramdisk_section=(
+    --add-section .ramdisk=dom0-rootfs.cpio.gz
+    --change-section-vma .ramdisk=$(( $vma + 0x2000000 ))
+)
+if $grub2_chain; then
+    grub-mkimage \
+        -p /EFI/BOOT \
+        -O x86_64-efi \
+        -o boot-esp/EFI/BOOT/BOOTX64.EFI \
+        chain \
+        ext2 \
+        fat \
+        linux \
+        normal \
+        part_gpt \
+        part_msdos
+    if $grub2_chain; then
+        echo "chainloader /EFI/BOOT/xen.efi" > boot-esp/EFI/BOOT/grub.cfg
+        echo "boot" >> boot-esp/EFI/BOOT/grub.cfg
+        UKI_PATH=boot-esp/EFI/BOOT/xen.efi
+    fi
+fi
+
 objcopy \
     --add-section .config=xen.cfg \
     --change-section-vma .config=$vma \
     --add-section .kernel=bzImage \
     --change-section-vma .kernel=$(( $vma + 0x100000 )) \
-    --add-section .ramdisk=dom0-rootfs.cpio.gz \
-    --change-section-vma .ramdisk=$(( $vma + 0x2000000 )) \
+    "${ramdisk_section[@]}" \
     xen.efi \
-    boot-esp/EFI/BOOT/BOOTX64.EFI
+    $UKI_PATH
+
+ls -l boot-esp/EFI/BOOT/ ./
 
 cp /usr/share/OVMF/OVMF_CODE_4M.fd OVMF_CODE.fd
 cp /usr/share/OVMF/OVMF_VARS_4M.fd OVMF_VARS.fd
-- 
git-series 0.9.1

