Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419F6C561E6
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383616.1626964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3T-0003eS-Ni; Wed, 05 Aug 2026 14:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383616.1626964; Wed, 05 Aug 2026 14:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3T-0003dO-5U; Wed, 05 Aug 2026 14:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1383616;
 Wed, 05 Aug 2026 14:57:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3R-0003Ff-Ee
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3Q-00A5Sr-RK
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f36-bab6-0a2a0a5309dd-0a2a4504c650-38
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:12 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f46-b57f-0a2a45040019-ca0c7c96abd5-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:10 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id AF0361D00112;
 Wed,  5 Aug 2026 10:57:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 05 Aug 2026 10:57:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:08 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941829; x=1786028229; bh=KBUzmph2e2
	g7I3mmWwGwHw/D0ca5oikmXyWa2C9D49g=; b=xu1sYIIreeAU8R7FTNLSiqLMoG
	29pO+JjSoqH0ASq2tt54TPJ9tGW/ckQqXNTiD0R8+gpRmtc1Lzd+eAXqUWgXDm89
	k8jL3b80CVAEsPGdyE+U9YRM0DrhoWS79YnvczA42lMSQ+VwFW7NJgp/EsZUCLXz
	9elZIJFCg2yfDbackBH0K/myWxy9C35IJspThNsZ2mpQ87wPNfTm+j8WjIftj3vW
	a03Rduyp+y4CxH9XYGLctPFAl8PYHJUgb5U4FvFEOgPQRzBtGIHzzW4x5SkmHZsp
	s4lx18jOBFLUs7ICxLiHp7trj5awBrTwAtu03GD6g81U8SIfmKHKy4aZVBmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941829; x=
	1786028229; bh=KBUzmph2e2g7I3mmWwGwHw/D0ca5oikmXyWa2C9D49g=; b=P
	K6gpp2S4gd3y+Ik7IUPwOwmYrYb2vDe/iknrK3BMduzhEL3aUZVv0KKpQHlxyzp0
	5Mf4Op6nKEy5eiZ8Fp7O15lSY2k3uBmedQCdy2k01jA07MsM+xkxnvEwfb2uO1xP
	sc8X2lYfnT14hWrat83mO6D95tAmthmOojS7+P/Uk475R5YS10u0wd/1y/JbBjyB
	l2NimBuSyKfsOeYPs6BR1XAvhHaSjf+Ninb0TXrDJm81GFrcXBL8FsRDTjd70jle
	DsrDnL4x9jlTSCJ+AAoShzg7Q5rPU2vq8eUaHA/bxV9/lmTUi9SLfHi2ffEqoox8
	UaezNEnVzwedcSs3ju1Fg==
X-ME-Sender: <xms:RU9zagaokAb3Ru--jrdY07Vccz4c2lhJD088Z-WxLC8AgJKxa7mTeQ>
    <xme:RU9zaiTVQffIGZPM9IcgZzralmdeABPo3BHIPbtMIr_SovHExmyQFx5TvVINPfS20
    gvGpGP2SZ3zU9WBWaJmEo6yIXC16JCIsCcnF29qoSySntuFvnY>
X-ME-Received: <xmr:RU9zajSryMR1t2pZFSZmhcVparK9lxEgE9-xe0OSPc38KKnoP_EuOnGeW93sbcvOtJ3-oBip0hhK_wDqOIT71x0b62hwNptGhewxEmmsEkk>
X-ME-Proxy-Cause: dmFkZTFg5HWH/RDqdPpR88i/6M1gtPWzLlXDm7puE44YW+OQRkCu0ypR/9JOPRDl1te3/p
    2ugUGdWUlQb8kocRthjZN7vvr6IWWNFcyKYmBFPe+BzKMnxGjKoBahL5VCHV3UAfs0EHAg
    nj3sYoDmr7GyZbFXABfsR3rbdQAxCafinJpMUI+6VqMVy7guc3dUP2M2goerpX03cWT8GB
    3tIsn5JiFR3GjgHhPz/r2yz7V7NDg477JFOnzakkhw9w+L8/GP2qYPPRO39CHuug0G7Ubo
    N42GUSC5i0XOiRx9MufeivVdVi29Q812Jc2LJ90UxPjSbThjlODlkTjM/Zl+lF8/E+2aWA
    rexhyc6F6J6Gg4kgL+ELyn4KdQJdvDLu9RZg5NJLg5n5i7/HT1VBjffulld9VrKKT8I4yw
    zn4vJPGmvQUAC0x+7g7TORoqIh/IrKo/gMepIB3an1eH4e9iWAS6pcj2OU9v4YslFGx2qz
    iA0zhbv/ofO32duhlX8Uv7QCSaESivnvSQOF72N1n6N8+/0nuGQ8Ypi53GsHpMwWWb0Yiq
    e9gLXwfhrfmXtBRE9FYpPW0vATiPvbD3+Xzo4oPZjIgvGhddca+y7vZK1oSSH3Wyh9n08+
    nA1zDi73ncHshzXsSgCQnfsXjHLjyEnWP4q6WEta/3a4J/4V1RMWcXrh+clg
X-ME-Proxy: <xmx:RU9zamTH0oR6K2uw4k1MZdqdw84d25Ha-UC7JdMPhg03vAkuxtjOIQ>
    <xmx:RU9zao56KKoDXCe3Yi7f99lPEoyaiktgAihDGC-rocEfz6LH4Ae78w>
    <xmx:RU9zai0cPPTWSC2d_DkulyWaO0xAWm31Q4bsq5ON9DvifEoFHMp8ow>
    <xmx:RU9zajC1nVQ94A2CQLvs-LEwg8jWIlmvvYEG8ZWoHtkcKxrsEC_MZQ>
    <xmx:RU9zajdnBzd4M-7bPdA94Ab6TAxQkN_xU9KhlKe9kEJs3CKUb1RgEJ0i>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 11/13] CI: Extend qemu-alpine-lib.sh to allow simple networking test
Date: Wed,  5 Aug 2026 16:55:39 +0200
Message-ID: <22516b48ec472a1c507cf62a44856a4912037eaf.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785941831-C10DDB50-6305D1A3/0/0
X-purgate-type: clean
X-purgate-size: 1842

Allow some tests do a little more reliable test if a domU is still
alive.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/scripts/qemu-alpine-lib.sh | 31 +++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/qemu-alpine-lib.sh b/automation/scripts/qemu-alpine-lib.sh
index 2d306f384f6f..7f0046888325 100755
--- a/automation/scripts/qemu-alpine-lib.sh
+++ b/automation/scripts/qemu-alpine-lib.sh
@@ -1,5 +1,25 @@
 #!/bin/bash
 
+dom0_test="
+xl list
+
+xl -vvv create -c /root/domU.cfg
+"
+
+domU_test=""
+domU_config_add=""
+
+# snippets to be used in $dom[0U]_test
+dom0_setup_network="
+brctl addbr xenbr0
+ip link set xenbr0 up
+ip addr add 192.168.0.1/24 dev xenbr0
+"
+domU_setup_network="
+ip link set eth0 up
+ip addr add 192.168.0.2/24 dev eth0
+"
+
 build_domU() {
     # DomU Busybox
     mkdir -p initrd
@@ -19,6 +39,9 @@ build_domU() {
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 mount -t devtmpfs devtmpfs /dev
+
+$domU_test
+
 /bin/sh" > initrd/init
     chmod +x initrd/init
     # DomU rootfs
@@ -46,7 +69,8 @@ build_dom0() {
     vcpus=1
     kernel=\"/root/bzImage\"
     ramdisk=\"/root/domU-rootfs.cpio.gz\"
-    extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh oops=panic\"
+    extra=\"console=hvc0 root=/dev/ram0 rdinit=/init oops=panic\"
+    $domU_config_add
     " > root/domU.cfg
     echo "#!/bin/bash
 
@@ -54,10 +78,7 @@ build_dom0() {
 
     bash /etc/init.d/xencommons start
 
-    xl list
-
-    xl -vvv create -c /root/domU.cfg
-
+    $dom0_test
     " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
     find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
-- 
git-series 0.9.1

