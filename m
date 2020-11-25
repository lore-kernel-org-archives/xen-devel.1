Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED03EC63777
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:28:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9368620789
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+9Cxijp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9368620789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37179.69463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPp-0001oM-UT; Wed, 25 Nov 2020 04:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37179.69463; Wed, 25 Nov 2020 04:28:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPp-0001o9-Pb; Wed, 25 Nov 2020 04:28:25 +0000
Received: by outflank-mailman (input) for mailman id 37179;
 Wed, 25 Nov 2020 04:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPo-0000sM-0t
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f610be8-a076-4b62-aa4f-4b94e3612db5;
 Wed, 25 Nov 2020 04:27:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BD122173E;
 Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPo-0000sM-0t
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:24 +0000
X-Inumbo-ID: 3f610be8-a076-4b62-aa4f-4b94e3612db5
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3f610be8-a076-4b62-aa4f-4b94e3612db5;
	Wed, 25 Nov 2020 04:27:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1BD122173E;
	Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278472;
	bh=Ue92qEDF50KpJfvuNM6M4wzRTD3agPXEU66URBcepBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+9CxijplI5rPgATSgIdxhc7CsWdTP3/RcYTwsQnz6O9K4WwaxX4XJywdKxbPqPF+
	 Zv7A1PzIRAiVvgUP3i25rhO2fQyiarakXi91gV6Il4gmlC6NCNWG/xz5sW//VzlOeg
	 OjH45tXb5hjdfFbIyiVUluBpt131nKIAN+65g1e4=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 11/12] automation: use the tests-artifacts kernel for qemu-smoke-arm64-gcc
Date: Tue, 24 Nov 2020 20:27:44 -0800
Message-Id: <20201125042745.31986-11-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Use the tests-artifacts kernel, instead of the Debian kernel, for the
qemu-smoke-arm64-gcc job.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/test.yaml         | 1 +
 automation/scripts/qemu-smoke-arm64.sh | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index a291538d68..9448651187 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -55,6 +55,7 @@ qemu-smoke-arm64-gcc:
     - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   dependencies:
     - debian-unstable-gcc-arm64
+    - kernel-5.9.9-arm64-export
   artifacts:
     paths:
       - smoke.serial
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 9bf4488115..d614227f0a 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -12,12 +12,6 @@ apt-get -qy install --no-install-recommends qemu-system-aarch64 \
                                             busybox-static \
                                             cpio
 
-cd binaries
-apt-get download linux-image-*[0-9]-arm64
-dpkg -i --ignore-depends=initramfs-tools ./linux-image-*arm64.deb || true
-cp /boot/vmlinuz-*arm64 ./Image
-cd ..
-
 # XXX Silly workaround to get the following QEMU command to work
 cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
 qemu-system-aarch64 \
-- 
2.17.1


