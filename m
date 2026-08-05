Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B6FC56209
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383605.1626913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3J-00022O-4j; Wed, 05 Aug 2026 14:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383605.1626913; Wed, 05 Aug 2026 14:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3J-00021X-17; Wed, 05 Aug 2026 14:57:05 +0000
Received: by outflank-mailman (input) for mailman id 1383605;
 Wed, 05 Aug 2026 14:57:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3H-0001mW-Gs
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3G-004zD5-Tn
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f32-e002-0a2a0a5209dd-0a2a45079ea8-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:02 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f3d-b4ea-0a2a45070019-ca0c7c98bcbd-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:02 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 7C30F7A00CD;
 Wed,  5 Aug 2026 10:57:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 05 Aug 2026 10:57:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:00 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941821; x=1786028221; bh=NJqCn/CpFS
	hQ4iywkQBEF1/M0+zfv/NLrkPB9AYJeCY=; b=0l/iKxUU+2hwwvEKxPktRRLuar
	Pfw/dYsXbJ571858vogWyyUq7IiHNpW6wDKcglyiSeYRHwxvS/CBtPv34WLIV1ZY
	rnvTW01Wq860M1V5zU1HXzAPikk9r88pu2rHNHOvHYgEf1B04Jn8tJEygqQ0877+
	sMILnqr372ZS5vuPhhPRuqCICbWH9d08yMCFYF4Gf9XBNdp5DUdNOLJdrl+7g8py
	qmzQNzqfe48FitDQvkUQys4ktXbJcFV8Y3qiXuUWEFX3nJQT5R45Oh7sEQy9DAIw
	m0s+hR5LJ/zSPiMpjEeW2lcq2fbekEA4Lpr2w1lp/cReqxYsLCJghi3gRHgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941821; x=
	1786028221; bh=NJqCn/CpFShQ4iywkQBEF1/M0+zfv/NLrkPB9AYJeCY=; b=H
	GzAdrxOkUp3hBBSaJwOHv5CfVzqSNaf/m8Qizq+/IrAHIJ0ZIP9MitMrHEwgGkd3
	hW8vdzLmxddYXbUjHJhLhkp20djA4FX5xW+FXwzB/CWWNOOLxsssZ5fipijsKu1H
	OksV5W2vp5ExMCD6qeKuXFmyh042D2kQsoUko+kn/UGb3hyZPewkERd0YvY8zd8x
	MdgFOyAyTSID474PDSegCYfmw8zds8woS3Q7W6Y5Ai7sFfrxBQ14ZVwhvlQSybOO
	zbN0QSlGHrbO/ky8yBuPA576gX9DhRbUcrv06JBzH993sXo66RiD2oEqBgULXZqm
	cD9aWcMq+47J4mHuqGOIA==
X-ME-Sender: <xms:PU9zapJg__N98i6FbDSklH4yMKtqbDHC3dDUaQAVzSMB4SGriU24jQ>
    <xme:PU9zasAwRBL0MZDbCYnn_jnQZaf-N2ViX-28wuGlKbrfzncrY-lkg-kqd2kvlKY5h
    WGLtRRu4m-4uMELGL6wqP_4ZfSkAFqVmzDyhpsmzOQ6vuD5Uw>
X-ME-Received: <xmr:PU9zaqDU5x47Q1f4nivOH1I27y5C2WB-_4I_0c6OFycIGfk1B21LG4I6T9lo_C7HncBb-S4IH-cG7Mv2WkoDKYPhzX_G0bcg42RojNmaXFY>
X-ME-Proxy-Cause: dmFkZTE1tKvhsT+Fhei0Yg+G27SZQPQVopYNzanoImCL8xkq2oL6bKpGea3H8hzYRKHrGC
    B6kQUNlF+nZ7bYZBt1/dQdXqlMW9NJlyslPcE0+Pa5JNi0jTkDFxiuq8QbvTIJJx2SeYvk
    MURT57H+uIHzESnQrqQOd471thhd85FLBD10JZToXtKcwAL2lIl13tKixe9zx9R8K6lDVh
    KmpaTBDrNZA6jwf9idIZL/vdHPuMsaLOe+zilHC5z0fnjufSdy4lnRs2QJOWeDUP+W5tLW
    UzmcKwTf1aOSEOg4bUbniMBRaVMDpagjyVQAluXe6sHMhg18pP5cC9VjXvgw8aCZHU5tcV
    JRg0Dl83yyuPeVOfv1CsBEx7Rt+EWXR/sDFDuKWCf7D2Fzsq7L0xpbqq95ejzCCqrSu5O7
    YdglTevOLDxzB+X1v2mF5+NCpPaGwCX835GKY6koo1LlZ+ULHFm4jD3R+jsPdprbEgaihM
    /fw6zto9NmRt893XgnqD5y4J5qV8HITW5ZppAFXmfZbf6Z9eoTg5/UEEzGD4nKfIbymrpj
    zFUsBdy4F4VMb1RdPpDuv4mquGjr7D15Yn+Nfo0qxUBr1d3kVm8LaeNKsi7OKO/zr5EdDV
    6LEzyNotZaaRUBZaIQ1/91fAtLdhqXj04aI4iG7VBuFhOmGX8sotuwl+RpzQ
X-ME-Proxy: <xmx:PU9zamBy3rrDINh0oBMjtlVNL8AmJvMAEFtdTC26vYA4J4xpfMyG4A>
    <xmx:PU9zatqvDlFdttl8XiO8EOwdXsMWF3TblrtRlIXgmF_TeSLuwl2PGw>
    <xmx:PU9zaokVM-J7LmHy4urvUa0Z98SZL_6AppzISodiESJOJNQCUwaUlA>
    <xmx:PU9zalyJnjOPrROTAKIg7ArQ1UFIFryUAIJdPnLgLbfwYDzHBSh6Cw>
    <xmx:PU9zav2_GJ1wYcmVxyHVGUosN3DhkbinHXf5b3AJ9lif6HauJAxyru8g>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 06/13] CI: extract building domU/dom0 out of qemu-alpine-x86_64.sh
Date: Wed,  5 Aug 2026 16:55:34 +0200
Message-ID: <ddb2b1dbebaa662c15957587ac2aeb74007464b3.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785941822-A50CDAE4-2B5DB2C4/0/0
X-purgate-type: clean
X-purgate-size: 3993

Add qemu-alpine-lib.sh with utility functions that build dom0/domU out
of container binaries.
This will be used in further tests that re-use similar structure.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/scripts/qemu-alpine-lib.sh    | 62 +++++++++++++++++++++++++-
 automation/scripts/qemu-alpine-x86_64.sh | 59 +-----------------------
 2 files changed, 66 insertions(+), 55 deletions(-)
 create mode 100755 automation/scripts/qemu-alpine-lib.sh

diff --git a/automation/scripts/qemu-alpine-lib.sh b/automation/scripts/qemu-alpine-lib.sh
new file mode 100755
index 000000000000..29fdff4f562a
--- /dev/null
+++ b/automation/scripts/qemu-alpine-lib.sh
@@ -0,0 +1,62 @@
+#!/bin/bash
+
+build_domU() {
+    # DomU Busybox
+    mkdir -p initrd
+    mkdir -p initrd/bin
+    mkdir -p initrd/sbin
+    mkdir -p initrd/etc
+    mkdir -p initrd/dev
+    mkdir -p initrd/proc
+    mkdir -p initrd/sys
+    mkdir -p initrd/lib
+    mkdir -p initrd/var
+    mkdir -p initrd/mnt
+    cp /bin/busybox initrd/bin/busybox
+    initrd/bin/busybox --install initrd/bin
+    echo "#!/bin/sh
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs devtmpfs /dev
+/bin/sh" > initrd/init
+    chmod +x initrd/init
+    # DomU rootfs
+    cd initrd
+    find . | cpio -R 0:0 -H newc -o | gzip > ../domU-rootfs.cpio.gz
+    cd ..
+}
+
+build_dom0() {
+    # Dom0 rootfs
+    cp rootfs.cpio.gz dom0-rootfs.cpio.gz
+    cat xen-tools.cpio.gz >> dom0-rootfs.cpio.gz
+
+    # test-local configuration
+    mkdir -p rootfs
+    cd rootfs
+    mkdir -p root etc/local.d
+    mv ../domU-rootfs.cpio.gz ./root
+    cp ../bzImage ./root
+    echo "name=\"domU\"
+    memory=512
+    vcpus=1
+    kernel=\"/root/bzImage\"
+    ramdisk=\"/root/domU-rootfs.cpio.gz\"
+    extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
+    " > root/domU.cfg
+    echo "#!/bin/bash
+
+    set -x
+
+    bash /etc/init.d/xencommons start
+
+    xl list
+
+    xl -vvv create -c /root/domU.cfg
+
+    " > etc/local.d/xen.start
+    chmod +x etc/local.d/xen.start
+    find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
+    cd ..
+}
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 0c60b2503858..e1b5060f4490 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -2,64 +2,13 @@
 
 set -ex -o pipefail
 
-# DomU Busybox
-cd binaries
-mkdir -p initrd
-mkdir -p initrd/bin
-mkdir -p initrd/sbin
-mkdir -p initrd/etc
-mkdir -p initrd/dev
-mkdir -p initrd/proc
-mkdir -p initrd/sys
-mkdir -p initrd/lib
-mkdir -p initrd/var
-mkdir -p initrd/mnt
-cp /bin/busybox initrd/bin/busybox
-initrd/bin/busybox --install initrd/bin
-echo "#!/bin/sh
+. "$(dirname "$0")"/qemu-alpine-lib.sh
 
-mount -t proc proc /proc
-mount -t sysfs sysfs /sys
-mount -t devtmpfs devtmpfs /dev
-/bin/sh" > initrd/init
-chmod +x initrd/init
-# DomU rootfs
-cd initrd
-find . | cpio -R 0:0 -H newc -o | gzip > ../domU-rootfs.cpio.gz
+cd binaries
+build_domU
+build_dom0
 cd ..
 
-# Dom0 rootfs
-cp rootfs.cpio.gz dom0-rootfs.cpio.gz
-cat xen-tools.cpio.gz >> dom0-rootfs.cpio.gz
-
-# test-local configuration
-mkdir -p rootfs
-cd rootfs
-mkdir -p root etc/local.d
-mv ../domU-rootfs.cpio.gz ./root
-cp ../bzImage ./root
-echo "name=\"domU\"
-memory=512
-vcpus=1
-kernel=\"/root/bzImage\"
-ramdisk=\"/root/domU-rootfs.cpio.gz\"
-extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
-" > root/domU.cfg
-echo "#!/bin/bash
-
-set -x
-
-bash /etc/init.d/xencommons start
-
-xl list
-
-xl -vvv create -c /root/domU.cfg
-
-" > etc/local.d/xen.start
-chmod +x etc/local.d/xen.start
-find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
-cd ../..
-
 cat >> binaries/pxelinux.0 << EOF
 #!ipxe
 
-- 
git-series 0.9.1

