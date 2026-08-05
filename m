Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7036EC56203
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383600.1626864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3A-0000jb-Ls; Wed, 05 Aug 2026 14:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383600.1626864; Wed, 05 Aug 2026 14:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3A-0000j6-Hh; Wed, 05 Aug 2026 14:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1383600;
 Wed, 05 Aug 2026 14:56:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd39-0000gL-3c
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:56:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd38-00Cdp1-GR
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:56:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f2b-e002-0a2a0a5209dd-0a2a4501c102-14
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:54 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f35-5984-0a2a45010019-ca0c7c969577-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:54 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 0A1B61D00141;
 Wed,  5 Aug 2026 10:56:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 10:56:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:56:51 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941812; x=1786028212; bh=ZR1d1bGRuW
	7PkpYXNT/MSUaHwUt8D8/XKZCozOxnmOo=; b=vRq70RxyIF7I4jufZwP/UbDIMa
	ae5kBZB/LeAG7dK2DBrpmeSZOsg7CZ1GXg8BG44IxbEjq0eUPc/+jjXOomdtw5CJ
	HuiMn+jxtn0GOFJt1mxf+oMZ+dKJfxr97mgmDHN4VKH9OSOjJBohJAuTWnqJSO/e
	WSjOiLshyq32RGc2TLXv6H1G+BIEcBkZlhmWeg3Hz9Fh+VGY0AF1gDqSJAR4neVI
	hQBjQXxSiNGpZNmu2RPJwOX4inygBJ+J6Z5eM0leAjSmMvawR97apwChuvVYJAq/
	kguPg9dLaUsT8mZfjGElriKcsVSNyfA+6o0SURqQ3xOb9GZFxAiM1S3o5U/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941812; x=
	1786028212; bh=ZR1d1bGRuW7PkpYXNT/MSUaHwUt8D8/XKZCozOxnmOo=; b=O
	cpOX6rtQ1SWfMcY2UsgEx6B7W8piD3gKamXRpE3RKInvXLrCILucVG4Ja0MtAYLg
	8Kgd7Qz78Y7q92b29uIvzLdRwdaG7wIbRTAYr8Fpgv79G85Tn3zsUvtE9dnGioc+
	Mef1MSv1sU91TWk/c82e+Aq6JCw1+5yVhExS7X5lSl13t7Ix75TeKA6Hg1kk59mv
	ax4k2Ywhzb9KrK22iirYwtpBo0er/nt2xz1kQgUtc/gVm+Ib3T04c2voaWr/7cwc
	YjsXxCSc6AN8028R/DwECp/taSnJxnDts+K6fH0+HQyd2Aas6e51u7mzf9e7Xt1n
	R9chyGGrqFxFuyWwX5p8g==
X-ME-Sender: <xms:NE9zappkLM1cIdRwWHZT9R1vTaGrItDmghoiD03TPvjBHK8v4PoO5w>
    <xme:NE9zaigYbqNRWCguozHrpBi1vc1kQwB9j6LAM0v6pl_Cnuzw2vBbD8ZBZOZKySc8k
    DrLH7rtYNvIpe_SLubTezi3l9jOnRAA52tvwW1BBHhAhepu1qk>
X-ME-Received: <xmr:NE9zaujLhheOTynhj5Po4hE7MnwrhWNzr0RTIrUBhlb3d6rQ0HCQCVMPfrJ8MURx4l0hOYN1ee5ROrXQXzQuz2ODyxGF5iAUfd0pHlVPDbc>
X-ME-Proxy-Cause: dmFkZTFg5HWH/RDqdPpR88i/6M1gtPWzLlXDm7puE44YW+OQRkCu0ypR/9JOPRDl1te3/p
    2ugUGdWUlQb8kocRthjZN7vvr6IWWNFcyKYmBFPe+BzKMnxGjKoBahL5VCHV3UAfs0EHAg
    nj3sYoDmr7GyZbFXABfsR3rbdQAxCafinJpMUI+6VqMVy7guc3dUP2M2goerpX03cWT8GB
    3tIsn5JiFR3GjgHhPz/r2yz7V7NDg477JFOnzakkhw9w+L8/GP2qYPPRO39CHuug0G7Ubo
    N42GUSC5i0XOiRx9MufeivVdVi29Q812Jc2LJ90UxPjSbThjlODlkTjM/Zl+lF8/E+2aXQ
    K57x5zBbETIFSPxn/glgXCEXI5Rd5omb7Rl9K0RE2BeAtMwCZ0c8U4ZMWkXw9ZMEZTz0RL
    OKo0euqiJNUWJvCkgiR1XXxX8UjQn2EcgSU95KvZktQVlqmkSJW6SrX7eSZtO7u0FLxXFC
    +6eMrs9ZGOWvo0W6EVGjorhGjfSTq2dn2cyNLMf1aA79VNRk14OTFLmAUYBet/ylkfmWj6
    bblUIr7WrdCSerBW2Kz1BrDyJW8KxJoQ2Q5Q0D7TfY49vlQQLtfThuXNYjePMTOZx9i96e
    iWsaoEND85aEUGHz6cEZEW4XI4r8UKX3UwdQ08gANR6AExLKijMDWrUcdCWA
X-ME-Proxy: <xmx:NE9zaghsGM9_u-MCiKJjCjyxu4OEou7D83-AVYgx8t_0tY2QTZmilg>
    <xmx:NE9zamLs6tqKAiBIjrtGag2eOmHbdvupWMhWb-xF0pXsF9cyDhdeaA>
    <xmx:NE9zanELuzDB65V6DaiNhfSDc-SaAXDDjIHa_FtmA2OWty3Oh0Lu7w>
    <xmx:NE9zaiStUKxFFjH_qiNdto1NrOhIGqcaua2YjzgNbPJ1a8NrtVv68w>
    <xmx:NE9zauWon1p1BS9hGiFolrNWG0F8_gIG8WR6i1_t3gIhokFUmeVTnvyY>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 01/13] CI: set LOG_MSG as end-of-test marker consistently
Date: Wed,  5 Aug 2026 16:55:29 +0200
Message-ID: <6a0c80ab0f09bf471679f811e22ba51c034b29e2.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785941814-C5341757-CA20101A/0/0
X-purgate-type: clean
X-purgate-size: 3715

Especially, do not set it to either empty string (not the same as
unset), nor to a message found earlier in the test execution. This
change will allow more consistent waiting for test end regardless of its
result.

Note for dom0less tests - waiting for dom0 prompt is not the right thing
to do, as the actual test is executed in domU, and those are started
asynchronously.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/scripts/qemu-alpine-x86_64.sh        | 1 -
 automation/scripts/qemu-smoke-dom0-arm32.sh     | 1 -
 automation/scripts/qemu-smoke-dom0-arm64.sh     | 1 -
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 5 ++++-
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 1 -
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 242ffca693fe..0c60b2503858 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -81,7 +81,6 @@ export TEST_CMD="qemu-system-x86_64 \
 
 export TEST_LOG="smoke.serial"
 export BOOT_MSG="Latest ChangeSet: "
-export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
 ./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 5dc348c71aa9..4cda80843a84 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -91,7 +91,6 @@ export TEST_CMD="qemu-system-arm \
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
 export TEST_LOG="${serial_log}"
 export BOOT_MSG="Latest ChangeSet: "
-export LOG_MSG="Domain-0"
 export PASSED="/ #"
 
 ../automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 1d673f184251..6defd51ca449 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -101,7 +101,6 @@ export TEST_CMD="qemu-system-aarch64 \
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
 export BOOT_MSG="Latest ChangeSet: "
 export TEST_LOG="smoke.serial"
-export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
 ./automation/scripts/console.exp |& sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 20e43b4f049d..fff6d3b56df2 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -144,7 +144,10 @@ export TEST_CMD="qemu-system-arm \
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
 export BOOT_MSG="Latest ChangeSet: "
 export TEST_LOG="${serial_log}"
-export LOG_MSG="${dom0_prompt}"
 export PASSED="${passed}"
 
 ../automation/scripts/console.exp |& sed 's/\r\+$//'
+
+if [ -n "$dom0_prompt" ]; then
+    grep "$dom0_prompt" "${serial_log}"
+fi
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index a9e99f1ae392..0d1244d3dc90 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -213,7 +213,6 @@ export TEST_CMD="qemu-system-aarch64 \
 
 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
 export TEST_LOG="smoke.serial"
-export LOG_MSG="Welcome to Alpine Linux"
 export PASSED="${passed}"
 
 ./automation/scripts/console.exp |& sed 's/\r\+$//'
-- 
git-series 0.9.1

