Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C921CC5AC76
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383606.1626922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3K-0002HS-DL; Wed, 05 Aug 2026 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383606.1626922; Wed, 05 Aug 2026 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3K-0002HD-8I; Wed, 05 Aug 2026 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1383606;
 Wed, 05 Aug 2026 14:57:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3J-00020K-4a
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3I-00Cdrb-HA
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f34-5cb7-0a2a0a5109dd-0a2a45098958-38
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:04 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f3f-be1a-0a2a45090019-ca0c7c98c8ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:04 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1BECE7A008E;
 Wed,  5 Aug 2026 10:57:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 05 Aug 2026 10:57:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:01 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941822; x=1786028222; bh=D4TMGAPIXT
	KE8KLggURHTOvWsEJPhlI6eLx2c1m5BIU=; b=ohubngivkCKQVuc545HNXHpP6/
	+s7e7NmX1I7isyjFwEj/Q3mdwiG95YuM6Y10dWhnVoP+67rxgOK6rrkEPP1xM4r7
	GtVuLWk5fhet6HReTwVjb/6/i4eI0Y5ymga4qWHMYNEq2PcILh9r3/hREX6IZsM4
	owpyy38F3LN2dIHxGxN6/55PXZbSAqBjrAiHmohqYhTY0oZECAgA7iDkyNZEzugZ
	nTF48K3cY/OCs6GgRtGR7avVu18fOn9cpJNKg5lnijXRxM7NroXYCthtFsxkDsWR
	Ja53xMXfJIbRi4z8UpzUP1qlb/SvqwdXZ8DKx/VEWFoqAg2AmUsejltqnEwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941822; x=
	1786028222; bh=D4TMGAPIXTKE8KLggURHTOvWsEJPhlI6eLx2c1m5BIU=; b=j
	0avhJJQ/IsdWWu4NSI5uVM1bY2HUiFuofzythMYdIKrKimDXtDO2JYvaxKv8KM0Y
	XpJK5PSyxLiTCNXdGuR5E9Pu0c3RFT+Nwc69kyN2Z8tZ8NGEALwnPttL4rjKLZRG
	gey0vQr5k6Zfa48Ku+juoueSQvY1fVOiolezkGnzXJQjlCP3WeK2l2syBCJdGdh7
	RXveyDn50m3JDeOHOyNZsZONNmQTfLdHdAWZa7XEnP/zVlWnx/0iZ07dbUPZBWjj
	mp6b9O74gXGmDskT2hS3nAiMQPYPFqqM3mytToTuO/Ej5q7y8/luDlUnf3sx0BaN
	qzWrJL/yTN+em/aqcU5Sw==
X-ME-Sender: <xms:Pk9zaqa7Cwfw8o6U4qNx-k2xs7GusK84OZL5aPIe7NW0LbqLU5JqSw>
    <xme:Pk9zakTwypYBoTu1Fw7Gu4EopRrJkXmV4UJrTJ4U-1OEQ0YSItGcEW0d8bfFTuAvV
    q8bwrg_agGO6n0sWQaQdxPG8dLc275OJEX-6_7bvFxKxnq1sUU>
X-ME-Received: <xmr:Pk9zatT3B6JGKmWgoQIh1cnA494i1iIB6QJ5l50r6SeZHiru-Z45BEOCIzB0iAhIRsJaC5wPaDK6lrd_lP8zEo0wp4doX4desJ17zKBaAUk>
X-ME-Proxy-Cause: dmFkZTFg5HWH/RDqdPpR88i/6M1gtPWzLlXDm7puE44YW+OQRkCu0ypR/9JOPRDl1te3/p
    2ugUGdWUlQb8kocRthjZN7vvr6IWWNFcyKYmBFPe+BzKMnxGjKoBahL5VCHV3UAfs0EHAg
    nj3sYoDmr7GyZbFXABfsR3rbdQAxCafinJpMUI+6VqMVy7guc3dUP2M2goerpX03cWT8GB
    3tIsn5JiFR3GjgHhPz/r2yz7V7NDg477JFOnzakkhw9w+L8/GP2qYPPRO39CHuug0G7Ubo
    N42GUSC5i0XOiRx9MufeivVdVi29Q812Jc2LJ90UxPjSbThjlODlkTjM/Zl+lF8/E+2ajc
    I8e4yupEnk/I7m2P4LYPmY0lkBVs/oS6MiW8d+RZvksuW60ckAKttxjQebuSBcn7dNi7zi
    yYUrIntPstk/r96xUMuBjLaSpqpyqEEs81sxL765Hj2yE87S2VasrSZ305//Rm33ZjBu67
    CjL5KLoeHME7mHkfB6nCh3KfETG7004vHb5/bFGf+uL1iTatYcZPuaGwv+/tMFetoYKKK5
    u09P80XM9rJeJmjAhV0kZXFfAAUi4DQapWwdZTL0RTsTzTip+6WBQP0TEyqW7eK8iLrrIy
    hGRZ7ERl7bZVEesG8E+pvrbEmezSJaujXl8NHBlD6uQQf4yKBXgoopxhw11g
X-ME-Proxy: <xmx:Pk9zaoQnHvt_eYTdxFZMRJ0TYANlTS1a-HDdTED2j8VZAXTpx7Z5qA>
    <xmx:Pk9zai4oHR5j3plZ_VUh7F0rG6B-s0CsioVssMqhK7Tl6fa5JY-Xhw>
    <xmx:Pk9zak3J5_aeqAnRLkH8phD5T98NUedISDwDLOCC9D-Rk4JoYXiHZQ>
    <xmx:Pk9zatArwQ6gybkAw5rRM6XdqvkPkCEAfgBlyoOhMIjxS29-4gCzSA>
    <xmx:Pk9zakEzxyWM0tTBK5JLs8tPCtY5wklfZjKg8mIbiw_GaxW5Erat_rGw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 07/13] CI: add a smoke test for UKI xen.efi
Date: Wed,  5 Aug 2026 16:55:35 +0200
Message-ID: <bdb2ef7b0a351687f6c160e7e244e0d757726b8b.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785941824-BE8D9034-63D63DDD/0/0
X-purgate-type: clean
X-purgate-size: 3267

Combine xen.efi test with alpine smoke test. This one should not use
XTF, as having initrd is an important part of the test.
The command to build UKI is constructed based on the documentation.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5

The documentation says to put extra sections after .pad section, but I
don't see it anymore...
---
 automation/gitlab-ci/test.yaml                  |  8 ++-
 automation/scripts/qemu-smoke-x86-64-efi-uki.sh | 62 ++++++++++++++++++-
 2 files changed, 70 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-x86-64-efi-uki.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 184cf9b47d46..8e2db8c33528 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -804,6 +804,14 @@ qemu-xtf-argo-x86_64-gcc-debug:
   needs:
     - alpine-3.24-x86_64-gcc-debug
 
+qemu-smoke-x86-64-gcc-efi-uki:
+  extends: .qemu-smoke-x86_64
+  script:
+    - ./automation/scripts/qemu-smoke-x86-64-efi-uki.sh pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
diff --git a/automation/scripts/qemu-smoke-x86-64-efi-uki.sh b/automation/scripts/qemu-smoke-x86-64-efi-uki.sh
new file mode 100755
index 000000000000..8275dd1a81b3
--- /dev/null
+++ b/automation/scripts/qemu-smoke-x86-64-efi-uki.sh
@@ -0,0 +1,62 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+. "$(dirname "$0")"/qemu-alpine-lib.sh
+
+cd binaries
+build_domU
+build_dom0
+
+# variant should be either pv or pvh
+variant=$1
+
+case $variant in
+    pvh) extra="dom0-iommu=none dom0=pvh" ;;
+    pv)  extra= ;;
+    *)   echo "Unknown test variant!" >&2; exit 2;;
+esac
+
+mkdir -p boot-esp/EFI/BOOT
+
+cat > xen.cfg <<EOF
+[global]
+default=test
+
+[test]
+options=loglvl=all console=com1 noreboot console_timestamps=boot $extra
+kernel=kernel console=hvc0
+EOF
+
+vma=$(objdump -h xen.efi \
+    | perl -ane 'if (/\..*/) { $vma=hex($F[2]) + hex($F[3]) }
+    END { printf "0x%016x\n", ($vma + 0xfff) & ~0xfff }')
+
+objcopy \
+    --add-section .config=xen.cfg \
+    --change-section-vma .config=$vma \
+    --add-section .kernel=bzImage \
+    --change-section-vma .kernel=$(( $vma + 0x100000 )) \
+    --add-section .ramdisk=dom0-rootfs.cpio.gz \
+    --change-section-vma .ramdisk=$(( $vma + 0x2000000 )) \
+    xen.efi \
+    boot-esp/EFI/BOOT/BOOTX64.EFI
+
+cp /usr/share/OVMF/OVMF_CODE_4M.fd OVMF_CODE.fd
+cp /usr/share/OVMF/OVMF_VARS_4M.fd OVMF_VARS.fd
+
+rm -f smoke.serial
+export TEST_CMD="qemu-system-x86_64 -nographic -M q35,kernel-irqchip=split \
+        -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd \
+        -drive if=pflash,format=raw,file=OVMF_VARS.fd \
+        -device virtio-net-pci,netdev=n0 \
+        -netdev user,id=n0 \
+        -drive file=fat:rw:boot-esp,media=disk,index=0,format=raw \
+        -m 1024 -monitor none -serial stdio"
+
+export TEST_LOG="smoke.serial"
+export BOOT_MSG="Latest ChangeSet: "
+export PASSED="Welcome to Alpine"
+
+../automation/scripts/console.exp | sed 's/\r\+$//'
+
-- 
git-series 0.9.1

