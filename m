Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB4C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383615.1626957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3S-0003b0-Ty; Wed, 05 Aug 2026 14:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383615.1626957; Wed, 05 Aug 2026 14:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3S-0003aQ-Pd; Wed, 05 Aug 2026 14:57:14 +0000
Received: by outflank-mailman (input) for mailman id 1383615;
 Wed, 05 Aug 2026 14:57:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3R-0003Du-BJ
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3Q-000x73-Ns
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f3c-5cb7-0a2a0a5109dd-0a2a45039e98-32
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:12 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f47-fae8-0a2a45030019-ca0c7c98d795-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:12 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 51A607A0036;
 Wed,  5 Aug 2026 10:57:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 05 Aug 2026 10:57:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:10 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941831; x=1786028231; bh=AtMWHKAIdG
	HRUVSdbCNClD81EvWMYyNJcMteHXAqTCA=; b=RlYV4alhVoFuXVE3Pd+sGcU+Fb
	SBq1fqrKR0MkQO7u2XaYtffJyWv3jnM2u9CyqP02qe9Pz9V4KsYP3U+mxk7Y/Q/F
	S0vqkWSXnYtaLtDJbjaSltW5mlQ/rXWlVbINAwnilVM1TGHhu56yx3oGCpF4h1n1
	m5LWkVwzc+eC0D3jtayoog5RJOEwE6B7jP6iqw0+3QcYYUYBTLKy7kWeoUt7Bz8i
	hwxDK87NQjBHjpsLUQatZBbMbHEIiSnIl/nVDLextekJj1Csb21yZnAsxRmTzKy6
	FpQJBNFE9ByE+S5xEAhjqfGBx2xhzUXQdv1rycB8KOBKbYo0OIgNLUQ0KXsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941831; x=
	1786028231; bh=AtMWHKAIdGHRUVSdbCNClD81EvWMYyNJcMteHXAqTCA=; b=e
	IzWCS7WjIFceauE0YnCvNqNc9jT4CcUExCcULOwUEKXMzouNxiwEeqHmSI+SjqGb
	3DZ6PEFMTuz+ynNv2KfZaeFbC4aIeu+1ORpTXHTNAd6+axQBYXKiCdE3RVIYv3cn
	pqbzaahjplYX3rE4PZ6nMVW+ag/qI8AYa34YXvSHvVmQDNK6lKeEnPeUPMQQ95O4
	1Jf+FTOQ46J/TiXz6J8CKlr0RWk+H1XWLMlsbnFfcfYx2PfFHuyVOSNy92Z4RNzA
	F7gf8abr9b99hhrnP1zK+6PVc/t6nWENxI2pDpgnFYcSCTnhHhbAVESS5FkX+IS1
	0Nr3OCeg2bOlhPok2f3cA==
X-ME-Sender: <xms:R09zarE5_mWbsl2I1p_GMdt5Bg82F04TujgOxVxevX-bCn2bmpBZ2g>
    <xme:R09zavN8bJ3opn-cab1eW9RFxc2ir1R9ICxtarfozqdZLXRbVDaHvJH5CCwzuo-q5
    j1aboBpMRRqp0te-m3SF5YYyhy2ARrb8-V5ZJCT6s1rhvWCWw>
X-ME-Received: <xmr:R09zalcYigwZahcfC7DKm4QcyC8Mxy2ARtVABd9P5NpFUxZ58dKlpyNIaC872Efb6VBzKje3MGlA1ktsNKnu7TBzYmlm8tGUSa6I9PBpTX8>
X-ME-Proxy-Cause: dmFkZTE0EKbTjmPNLZDegeYJdEvPSKSCO9s22HLtuTKYZ7HLLcaPOQZvc2gjx+GpVjK1KQ
    jrioOGZanX06/wIhePYLadU4DobC5qkSj8L7MnsO15xCkd0z3P7cB6csRPqHGlKuTaZb5h
    bM8drPp/PFHwerIiCnTVd0Vgi6099jSCpXjCLjIJdn4zWBCVR6N9uvmLz0rWPjgF7BHWOt
    vZlPGCN6uONSy4YX7Yy4Wn3rLisBe4bDC6tE4xTe6rnrMqnP5QjyYvMtgRyYANegauBYoF
    kML4/02DYXlfbad4N9Brad2EsuDCdJwSnqfO7HDbcHdezGZGbNsN6UDmvsoEPXJBAd6vtz
    mYRIaVy7tNuBhjd4t1GM2v0qfBu6bmE9e3SxBcsv1S69ZJNVNK3r996hIL74kmOFL1NLfl
    PCG5FfvZl+akhjVy9VIK/zpS9sx5iBoeuuLSChYzkM0EQ86VRSCvxAVH3bd7xx7kuWT3FL
    XMSR6dNqO5XE/rxJb5VTp1/YazROxPPhiz84dADYQNrBJqLiRJZOcH3CGp0RbDzehJJS4+
    9AYchQUb0k4D/fCOLoc7CuO/GaQvUJaENnDARbzhsKip6aEAhLy6S7TZgjG7Lxcs8h6/xo
    /rRKQDTO7MIB3/7nveTu1R+YHrluFxy5YhOQLKVGMwYHgTnUAS7Erdz3rCdw
X-ME-Proxy: <xmx:R09zakuxf9AiwdL2QNLy37FY4SFuibBvS46taG0ff65Abae0zgd0VA>
    <xmx:R09zaumb4S_T7WoXlHVxRWaOZ6rWjTQWhIVMEIEBnuoNj9o4Vv78ug>
    <xmx:R09zauwR6-HC9MWUrrIi8EErtyZlAK7mF5amd2Gopd2rTq_c70Kd9Q>
    <xmx:R09zaoPx-eZS_ZgIowFZokBXzrzlB00Q7wTDH9cXOp8HjUmNyU611Q>
    <xmx:R09zagA6yR7zotDLfG17cRVfQOczG4J5X16zTgv7pSnYklGF94F4dXtf>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 12/13] CI: Add simple domU suspend test
Date: Wed,  5 Aug 2026 16:55:40 +0200
Message-ID: <dc30d924d8c2fa51275b660943f05da0ad541ee3.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785941832-762FD4E9-E6B7DA1C/0/0
X-purgate-type: clean
X-purgate-size: 2936

Regression test for https://lore.kernel.org/xen-devel/ajUm2SQtMD6Y-K9S@mail-itl/

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/gitlab-ci/test.yaml                        |  8 +-
 automation/scripts/qemu-alpine-domU-suspend-x86_64.sh | 71 ++++++++++++-
 2 files changed, 79 insertions(+)
 create mode 100755 automation/scripts/qemu-alpine-domU-suspend-x86_64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1359d70ff2b4..b7cdb3a3eb09 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -752,6 +752,14 @@ qemu-alpine-driverdomains-x86_64-gcc:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc
 
+qemu-alpine-domU-suspend-x86_64-gcc:
+  extends: .qemu-x86_64
+  script:
+    - ./automation/scripts/qemu-alpine-domU-suspend-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc
+
 qemu-debian-13-driverdomains-x86_64-gcc:
   extends: .qemu-x86_64
   script:
diff --git a/automation/scripts/qemu-alpine-domU-suspend-x86_64.sh b/automation/scripts/qemu-alpine-domU-suspend-x86_64.sh
new file mode 100755
index 000000000000..f46a40b67306
--- /dev/null
+++ b/automation/scripts/qemu-alpine-domU-suspend-x86_64.sh
@@ -0,0 +1,71 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+. "$(dirname "$0")"/qemu-alpine-lib.sh
+
+dom0_test="
+
+$dom0_setup_network
+
+set -ex
+
+tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
+xl -vvv create /root/domU.cfg
+sleep 10
+ping -c 3 192.168.0.2
+xl -vvv suspend domU
+sleep 2
+xl -vvv resume domU
+sleep 2
+xl list domU
+alive_test=\$(nc 192.168.0.2 8888 </dev/null)
+test \"\$alive_test\" = \"Still alive\"
+# try again
+xl -vvv suspend domU
+sleep 2
+xl -vvv resume domU
+sleep 2
+xl list domU
+alive_test=\$(nc 192.168.0.2 8888 </dev/null)
+test \"\$alive_test\" = \"Still alive\"
+echo Test result: \$?
+"
+
+domU_test="$domU_setup_network
+
+nc -ll -p 8888 -e sh -c 'echo Still alive'
+"
+domU_config_add="vif=[ 'bridge=xenbr0' ]"
+
+cd binaries
+build_domU
+build_dom0
+cd ..
+
+cat >> binaries/pxelinux.0 << EOF
+#!ipxe
+
+kernel xen console=com1 console_timestamps=boot dom0_mem=1024M
+module bzImage console=hvc0 oops=panic
+module dom0-rootfs.cpio.gz
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
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
+
+export TEST_LOG="smoke.serial"
+export BOOT_MSG="Latest ChangeSet: "
+export LOG_MSG="Welcome to Alpine"
+export PASSED="Test result: 0"
+export TEST_TIMEOUT="180"
+
+./automation/scripts/console.exp |& sed 's/\r\+$//'
-- 
git-series 0.9.1

