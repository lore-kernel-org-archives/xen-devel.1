Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1B1C5B561
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:31:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387332.1628653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHQ-0005wj-BT; Mon, 10 Aug 2026 10:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387332.1628653; Mon, 10 Aug 2026 10:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHQ-0005wW-7O; Mon, 10 Aug 2026 10:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1387332;
 Mon, 10 Aug 2026 10:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHO-0005mI-Re
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHO-00Dyin-8C
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a854-bab6-0a2a0a5309dd-0a2a450799ec-14
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:50 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a85a-b4ea-0a2a45070019-d1558035a911-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:50 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so22911205e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:50 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357849; x=1786962649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+Xmp4HOhS3Pe3sNnwkV9Nev075F3jzmTYNfYLmJyJ8=;
        b=gtDSvt3XLEF0+lvQmQpagPOxD+0HfyCi9SY4SgOtI34Q71fF520A50KI3R6asKiy7o
         EcYlQ3rf4vzvzkchvPC01UnKK++WMHlUXH5OH706GiBiqvJmi+8U6zknAp+RHmOuY0Tm
         Hdp4ppYkczqspONQlul4iFdjhg/pVXFFOo/CPqeM5m/7HBN2E8w5pSC17iPxKzAgZ25S
         uOKOV4HqmTJFIXMyJVIfJgSyvCcNZ4r+OpQMO9LMWYVp1FgrISAx7+4gLTMyaTZqnoay
         hAkRBTQPbtx2qHVGzVMwATUKSGA7uhSiwtjyvijDYIQCm9+fuL6BKjsmeJ/nvGY5rMYo
         icZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357849; x=1786962649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+Xmp4HOhS3Pe3sNnwkV9Nev075F3jzmTYNfYLmJyJ8=;
        b=nNMea2ZxnrskLsVM7ZtZTuExUNL9p7rztECnxYx/Jyh9bjzpg5GpAPiPipHYJ/Qpik
         EMZ3yoAbdHImBimhP0g8Hc5mlCUW5vkXbLUij9OSBdgsf4riDudsERx6HrqpejkAqFDF
         iv7X3xzGZJ50P5crPIcj1xzbh/MvcsOPtIk6QJL9u5kEaVM/fN6EWlj0BQSBOOKBDUte
         fk+vMm3m7Tm0engIlvzKElhTuWl1ITEiKfzw7j0YabFyH6JTadG0mlf7C70IC4D5fFnd
         brNLTg3s76yB8zvmRP7qA0RHIf8TjXNPQiWKcS7duVSCGH/11Ux1qruDJ8/yMfcG+qRk
         9Zdw==
X-Gm-Message-State: AOJu0YyhS9Da4dMD8o5+/DCwl3AeCosrtOZm0jGpyyVd74k48sUEVIBm
	Pfbcaps3+vtKSJSk4oK1i7D8WHeRBM7YInfadNtMttnFqAys1LWEhCv546Wn0ljjjFs=
X-Gm-Gg: AR+sD11E9+7ILZ58VGN/7jJlVXLWJNpaGETrhUnec912ha4u18E6sqbVHs5zAhEYzsB
	TM1YunT6CHuk1seD3h+az2jpbweExOvp2Ui0X6UMWw47+GAdIMTfyYdESfF4FSXZ3TXxEsDfdGz
	msitmMpjZVoatZYA6WCr0EWYmXTreM55GGnx4sqRv89hxakWY5/0edBZ687FOXHi04TkUqWD1CN
	U3xFJ8OgmR9NlHmDZc98w92yo0oBvxNnj14n3w8f67SDBCra55FaiyEWyFtPpMT3f7JYjqcpBLs
	cJgIcOy6CoWtr6gj/WWBAY35lKSWhimmbXi3vRjanX/JovtP2p/yFdDQCNl/jD6Bfhkx3llsLBc
	q1YDmTlUsgQVDGXaGTb9tu41AByUxiybfpJ0+68mHoZoCRhKNHwxAG4hqK7drROyrtJ/0Oc12Ut
	8MGGOiG7MofJyEwlmspeDEyxIQv7mfXQw4r26RdhNOuVjy+MOE7MLeCr4P3ba6yF7u27Pcp1VAy
	YVnfjMOzSG1VJaixXneYAEIWJZPJT1nFaLOoVFm
X-Received: by 2002:a05:600c:3154:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-49962453c45mr201315725e9.2.1786357848475;
        Mon, 10 Aug 2026 03:30:48 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 8/10] privcmd: Add definition for new Linux privcmd to access new Xen hypercall
Date: Mon, 10 Aug 2026 11:30:11 +0100
Message-ID: <20260810103018.54564-9-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1786357850-374D3AE4-0A5726EE/0/0
X-purgate-type: clean
X-purgate-size: 1401

Userspace should use new ioctl to access new hypercall.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v4:
- update comment.
---
 tools/include/xen-sys/Linux/privcmd.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index 607dfa2287..7a3c41308b 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -100,6 +100,14 @@ typedef struct privcmd_pcidev_get_gsi {
 	__u32 gsi;
 } privcmd_pcidev_get_gsi_t;
 
+typedef struct privcmd_foreigncopy {
+	domid_t dom;          /* Foreign domain. */
+	__u16 dir;            /* Direction,  0 from, 1 to. */
+	__u32 num;            /* Number of pages to copy. */
+	const xen_pfn_t __user *pfns; /* Array of pfns. */
+	void __user *buffer;  /* Buffer to copy to/from. */
+} privcmd_foreigncopy_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -121,6 +129,8 @@ typedef struct privcmd_pcidev_get_gsi {
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
+#define IOCTL_PRIVCMD_FOREIGNCOPY				\
+	_IOWR('P', 11, privcmd_foreigncopy_t)
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
-- 
2.43.0


