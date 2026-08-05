Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7A3C561E6
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383604.1626905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3I-0001nP-0A; Wed, 05 Aug 2026 14:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383604.1626905; Wed, 05 Aug 2026 14:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3H-0001n8-OC; Wed, 05 Aug 2026 14:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1383604;
 Wed, 05 Aug 2026 14:57:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3G-0001db-47
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3F-00A5Sr-HC
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f30-bab6-0a2a0a5309dd-0a2a4505ce0c-22
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:01 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f3c-4cb1-0a2a45050019-ca0c7c98dfed-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:01 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id F10037A008E;
 Wed,  5 Aug 2026 10:56:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 10:57:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:56:58 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941819; x=1786028219; bh=VIHXaX1e+f
	fgdFqzeWyvSlfdqJI5vq9gFySsJjLA51g=; b=bulDFjky/O6MBmdY6opnGgaFXC
	UU08ORMuosrIGedJpG1TBpuidEYA2Ze8EWlvRaNU3PTos/5pShOmM47pl6NEetLV
	wYandMud6QOR5XR39HNtT2WsibgANJrbAju/VQzYEHsj4WjWjktUeSRbeis1gC4N
	XGcn4MSd08orJvYQkA9Cvh2iANFqLNWo1UzGTL7a55BMIJhn5fW78MzXQ7hiP/MH
	h9cHep4xx72Fiphka8co4WiOqeHlR+UbvQ7YDCDnvONjqaICrHz/B/duiOhcZ37/
	8IWuc7ka8jrCRhx7H0gQyWdQmBPYB0/AWi0zWqvbRL3cWJjlcAa+Ps3Cdm3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941819; x=
	1786028219; bh=VIHXaX1e+ffgdFqzeWyvSlfdqJI5vq9gFySsJjLA51g=; b=C
	2DmdOwu/f9N3SoLHK3Xs1vZ++r2SSALR0O1QAacHN0OXpnIADY0mw3lPcbRi2IZD
	964+gVgyKREZ+jHjqyzFMeEI+oK3y8YsZqfWmAmIAKKiieicVUR6hu4sWGUWx5uL
	snmDhfh0rgsmbh7yAEB4QiNHOBOWMRzrj2waXnEb1R17oST/QsaDyOIEQesUBaZ+
	D+zBd7NN3u43iumv8E6n8jz/2pxkpE7XI/Tf35Y9AC9eJ0NcicEnfxSTpkKgGJ/I
	nwdOfvQwnDvjo5VJOZVJkdSyjTMndb0ltKmoP6jqhfg/rQA8jAC/a8U5JAlPQJPz
	0F2IOQNH9VHpGtMgOjsPg==
X-ME-Sender: <xms:O09zanBhnh-ABZNqErvuhrFHwwE04-oD2YeSV0gjNSWgBGWPsNKjPQ>
    <xme:O09zakYDZ9AOLZzuLiNUAEF_IVL5xy2oxbpvPcmkITFyJxI7zKyMp-x-r72RfJ-6K
    ItAmWkspUyDEtfB_fIMUbtsN-Ks4wguZkwSZHYWDg5kp31aGQ>
X-ME-Received: <xmr:O09zaq7bZ6T6BLtI5mkI7dYz8_oU0rx2mXjFqDPRUtfxwmLE1ADGV-FJNavsRi-D3Mv3OnIQcF3n9n0-cJu746WfgE_s0-rHJlFxasb0IX4>
X-ME-Proxy-Cause: dmFkZTFg5HWH/RDqdPpR88i/6M1gtPWzLlXDm7puE44YW+OQRkCu0ypR/9JOPRDl1te3/p
    2ugUGdWUlQb8kocRthjZN7vvr6IWWNFcyKYmBFPe+BzKMnxGjKoBahL5VCHV3UAfs0EHAg
    nj3sYoDmr7GyZbFXABfsR3rbdQAxCafinJpMUI+6VqMVy7guc3dUP2M2goerpX03cWT8GB
    3tIsn5JiFR3GjgHhPz/r2yz7V7NDg477JFOnzakkhw9w+L8/GP2qYPPRO39CHuug0G7Ubo
    N42GUSC5i0XOiRx9MufeivVdVi29Q812Jc2LJ90UxPjSbThjlODlkTjM/Zl+lF8/E+2aqt
    yLt1OCe/nhAJMu2CJUS7qRdrtLxh2jFsE6WK4OVh+oT2+FC56uWyodULwj6z4RYpvXMpDn
    ewuSorjvwbszn0rU/9FzOXB23lxuSQdgnDfmmO00Hvw8LbpbTYmtiqViV7RFvxunh50c3G
    8VXisn+B7wyNhjl+xzIq5pMSVC7JZtPn2QiYC9iodIB1U6smXPV4xHBYegFH/vB2XAhqIJ
    Dfq6UY98Zv5LIJAw15Ciy1EI0oCl+sMiLPNQ68YPpEzBsNGDmbcL5gnje631EYYPqZK7QR
    /bOjS3BtFN/loXp192R7t9b32urTvDsuoKVrkyU3gvTDrnQiaWpCtVqW/TfQ
X-ME-Proxy: <xmx:O09zalYHoD0fl8bfjwn2HujCqeRp9Q83q0D95yyNvj50BOa16kPl7A>
    <xmx:O09zapggGJDqU_ufBrEJH0gXM0H-aJi1KsBHrZ5ozTsqWKuBAOXpZA>
    <xmx:O09zam_KqudWhQP23OOJ14kaGl9E6dHAq_adDqcGAxUZAOrK2Z8CQQ>
    <xmx:O09zakozJUzz63UB6mP0I1rb72RYtr3OH-pWFAN41JSg-jXPCjrXiQ>
    <xmx:O09zaiOs77kzefBTQ3YWeaX0xEcpm1jw9pWxrxA0b-n3ebJrXHj3Qqv->
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 05/13] CI: Run driver domains test on Debian too
Date: Wed,  5 Aug 2026 16:55:33 +0200
Message-ID: <372962629561e96b83fc87039b0e6e31e4f9b6e6.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785941821-F54AC2A1-1B0081E9/0/0
X-purgate-type: clean
X-purgate-size: 3655

The recent failure affected only glibc-based systems, so do the test on
Debian too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- update to trixie
Changes in v2:
- use systemd in Debian

Needs debian/13-x86_64 container rebuild.
---
 automation/build/debian/13-x86_64.dockerfile    |  1 +-
 automation/gitlab-ci/test.yaml                  | 19 ++++++++++++++++++-
 automation/scripts/qemu-driverdomains-x86_64.sh | 18 +++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 5088f7435c1e..8a36774f1155 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -61,6 +61,7 @@ RUN <<EOF
         fakeroot
         ovmf
         qemu-system-x86
+        systemctl
 
         # for build-each-commit-gcc
         ccache
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 566d1f4287d7..184cf9b47d46 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -27,6 +27,17 @@
     job: microcode-x86
     ref: $ARTIFACTS_BRANCH
 
+.debian-x86-64-test-needs: &debian-x86-64-test-needs
+  - project: xen-project/hardware/test-artifacts
+    job: linux-6.6.56-x86_64
+    ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: debian-13-x86_64-rootfs
+    ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: microcode-x86
+    ref: master
+
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
@@ -741,6 +752,14 @@ qemu-alpine-driverdomains-x86_64-gcc:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc
 
+qemu-debian-13-driverdomains-x86_64-gcc:
+  extends: .qemu-x86_64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *debian-x86-64-test-needs
+    - debian-13-x86_64-gcc-debug
+
 qemu-smoke-x86_64-gcc:
   extends: .qemu-smoke-x86_64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
index bada6599842e..07bc617058f9 100755
--- a/automation/scripts/qemu-driverdomains-x86_64.sh
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -20,7 +20,11 @@ if grep -q test=backend /proc/cmdline; then
     brctl addbr xenbr0
     ip link set xenbr0 up
     ip addr add 192.168.0.1/24 dev xenbr0
-    bash /etc/init.d/xendriverdomain start
+    if [ -d /run/systemd ]; then
+        systemctl start xendriverdomain
+    else
+        bash /etc/init.d/xendriverdomain start
+    fi
     # log backend-related logs to the console
     tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
 else
@@ -83,7 +87,11 @@ cat > etc/local.d/xen.start << EOF
 
 set -x
 
-bash /etc/init.d/xencommons start
+if [ -d /run/systemd ]; then
+    systemctl start xen-init-dom0.service
+else
+    bash /etc/init.d/xencommons start
+fi
 
 xl list
 
@@ -100,6 +108,12 @@ cp ../bzImage ./root/
 mkdir -p etc/default
 echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
 mkdir -p var/log/xen/console
+if [ -e etc/systemd/system.conf ]; then
+    systemctl --root=. enable \
+        xenstored.service \
+        xenconsoled.service \
+        xen-init-dom0.service
+fi
 # this is a sparse file, not really using full 2GiB
 fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
 cd ..
-- 
git-series 0.9.1

