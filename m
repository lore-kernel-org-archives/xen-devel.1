Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B452C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 06:36:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410576.1641379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3SxD-0004iT-2V; Mon, 07 Sep 2026 06:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410576.1641379; Mon, 07 Sep 2026 06:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3SxC-0004iL-VY; Mon, 07 Sep 2026 06:35:42 +0000
Received: by outflank-mailman (input) for mailman id 1410576;
 Mon, 07 Sep 2026 06:35:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hemanth.selam@gmail.com>) id 1x3SxB-0004iD-VB
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 06:35:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Sx9-00GrDN-1C
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:35:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hemanth.selam@gmail.com>)
 id 6a9e5b35-2eae-0a2a0a5409dd-0a2a4504953c-42
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:35:38 +0200
Received: from [209.85.210.177] (helo=mail-pf1-f177.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hemanth.selam@gmail.com>)
 id 6a9e5b39-b57f-0a2a45040019-d155d2b1d1ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 08:35:38 +0200
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-85377c8bc96so2873947b3a.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 23:35:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3339aa37dbdsm21319326eec.11.2026.09.06.23.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2026 23:35:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762937; x=1789367737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4J4rYjNQoetFmHhwvDThjrrPfLTRssIW7zzZbk53w90=;
        b=UwuWVn/oINxUVovpKDiCvsZ/rd8qNTOFJV2EOfQPPlNjo9GECw+ZxY0S7SSFX7JHwd
         ePgCKq3shzw0K8gsddgZUPFBMwx17dvGjKLurinzsPz2Q+riiDkRLzTf9ukfj+OKn2Nx
         WYf8VDw/NqRQWhvfLiTXQk0VdYrkXch+Qq+67m5fP3QJeOjsATg3eLsj0Ylnur/2gOiX
         6VHPkwZUmszO9ty2Tw1M9NT2CARmh5GOK/TnxFXDlD+DhIhzPftJOqSM4K0unwwbPhKK
         zZXAljtJRIzFmxzAKRkVLZcAOY7tZhh9H/sKoZQPHLWpUgFkxBk8KrjG/jIZ3mydREYa
         d76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762937; x=1789367737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J4rYjNQoetFmHhwvDThjrrPfLTRssIW7zzZbk53w90=;
        b=O7ZPP0xU4ePJ95i+WsN7MyLMepuEK5atq3I0yZs19Pical5iEs+Xckoyxx9LsYtsvQ
         7w23HX2sstw4+Tx00I1etZV0mN5R5fLFU7EfYsBAsbKkCbs2j4O22HOGbs5bXWIUw/kj
         UYUp42agVx+ugs9v4TnlImIjTWzWBtzbjGXDP+ghEgzyhtPFqomSnu2pMs/RxufyIrJ5
         RoI2XfcQKpXLsPiy0VwFkOGR1GJu+df0SMBRbBeLxhsZO8VUtXmB4fbtm2O57X9YzOOy
         qOk5GZrAh/hNzqdWsjbe2ibS45nWyU3Ko4lSlVNrYBD5DmRvGNeXzf7XqGqcPA+uyEqP
         h1kg==
X-Gm-Message-State: AFuF++mAi9W/4YFNOBz9OWBFP8laoGmdusvYOGAYuHV4fIJNUK2CUs1Q
	FO9Og5zLE7LNLqZahpC0lL5DN2vMKOSnnKFOIdYFb4irwAPm8znrrkZW
X-Gm-Gg: AYBFou1CkfN/jK8c9x+aTTNw0Xn8Er1zyHyqjedIspDhYVhNeERFcNdP9XTLSs5Ilbp
	pWohgElqLtJSAwaJv6GHEpJLr9rtmWolr5uAdsYVjyW4gnqdOWqIDQmNseZdxh60dgjj0wkDtrQ
	G0MvQyN5nDIpMghalcwVlEWZbctjJDBsQX0mjkF7XeDtFfUDyciRd1TVVTFOsYOlKv9rltGs4pz
	qgIDqY1AaSr4bXwqWAJhJt7xTD++vmEfRTjFme0FRzVbp6q31hpbRBSzb8SVgyOvG0KmCRMNFCo
	0xLbZob+Ir1T30u/cj0Dlxcc7PudJ6PhWiyruWRyyzCCs2sEsgMkwhcgIgqKlmY4+DrQjXsgtgn
	vSH7SC23rVgtizbmlqAMYL3gSNgpbjp8ayMjBj0M2RWrqiHVG/pRJnpgzT3JVhhl/y8wNWX50jj
	se1AFI4RpBE3ZaraWbq5hBJ+aulh5197+LdVQUTHyD9wtWs5SZr+mVt4CFVnNFwNjDb8AF5chRu
	jkkw53NziwMQA==
X-Received: by 2002:a05:6a21:2983:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3da39fd0822mr34557933637.17.1788762936771;
        Sun, 06 Sep 2026 23:35:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: fix typos in comments
Date: Mon,  7 Sep 2026 12:05:31 +0530
Message-ID: <20260907063531.23981-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788762938-C08D9B50-967823B3/0/0
X-purgate-type: clean
X-purgate-size: 3588

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/scsi/xen-scsifront.c     | 2 +-
 drivers/xen/mcelog.c             | 2 +-
 include/xen/interface/platform.h | 4 ++--
 include/xen/interface/xen.h      | 2 +-
 include/xen/xenbus.h             | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 989bcaee42ca..f86a47056ea8 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -1076,7 +1076,7 @@ static void scsifront_do_lun_hotplug(struct vscsifrnt_info *info, int op)
 
 		/*
 		 * Front device state path, used in sdev_configure called
-		 * on successfull scsi_add_device, and in sdev_destroy called
+		 * on successful scsi_add_device, and in sdev_destroy called
 		 * on remove of a device.
 		 */
 		snprintf(info->dev_state_path, sizeof(info->dev_state_path),
diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 32ab419bb503..f19cc7a67f36 100644
--- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -1,6 +1,6 @@
 /******************************************************************************
  * mcelog.c
- * Driver for receiving and transferring machine check error infomation
+ * Driver for receiving and transferring machine check error information
  *
  * Copyright (c) 2012 Intel Corporation
  * Author: Liu, Jinsong <jinsong.liu@intel.com>
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index 79a443c65ea9..462e36392a9f 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -421,10 +421,10 @@ struct xenpf_pcpuinfo {
 	/* IN */
 	uint32_t xen_cpuid;
 	/* OUT */
-	/* The maxium cpu_id that is present */
+	/* The maximum cpu_id that is present */
 	uint32_t max_present;
 #define XEN_PCPU_FLAGS_ONLINE   1
-	/* Correponding xen_cpuid is not present*/
+	/* Corresponding xen_cpuid is not present*/
 #define XEN_PCPU_FLAGS_INVALID  2
 	uint32_t flags;
 	uint32_t apic_id;
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 40c9793e9880..f9acb21875cf 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -94,7 +94,7 @@
 #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
 #define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
 #define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
-#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occured           */
+#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred           */
 #define VIRQ_XC_RESERVED 11 /* G. Reserved for XenClient                     */
 #define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
 #define VIRQ_XENPMU     13  /* PMC interrupt                                 */
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 8ca15743af7f..6424c5cf8ef5 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -63,7 +63,7 @@ struct xenbus_watch
 	unsigned int nr_pending;
 
 	/*
-	 * Called just before enqueing new event while a spinlock is held.
+	 * Called just before enqueuing new event while a spinlock is held.
 	 * The event will be discarded if this callback returns false.
 	 */
 	bool (*will_handle)(struct xenbus_watch *,
-- 
2.48.1


