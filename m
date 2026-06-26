Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC32C43458
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 22:38:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346560.1604961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBs-0001Lp-KU; Fri, 26 Jun 2026 22:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346560.1604961; Fri, 26 Jun 2026 22:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBs-0001Lf-Hm; Fri, 26 Jun 2026 22:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1346560;
 Fri, 26 Jun 2026 22:38:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1wdFBr-0001LA-KF
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 22:38:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wdFBr-009Icy-11
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2026 00:38:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff01-5cb7-0a2a0a5109dd-0a2a4509be28-34
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:38:27 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff61-97e6-0a2a45090019-d15580acc058-3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:38:26 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7fe36f1be74so19316147b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 15:38:26 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-80abc3d1734sm23177557b3.15.2026.06.26.15.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 15:38:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782513505; x=1783118305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBo303ZgWe06b+c3DpyLbageNFD263eKZHcTV1IiJqg=;
        b=mCgwg1/08YaxQxt19iXhDoH5kfu1LX6QGSX6DePRmnoCj3zWlbOJ3YnA9YkKCheVdP
         6AYdonCp/bIfT0qGPT1xS9nq/k447pXfU1NcPHcgKX/1CHUD38HulwbtPzAt+cFR/tzh
         8J31Y2tHqMUPmiI/0jKRn9oFS2DUitX5q6d5kZ6JonnAl4SdctzddAfJcxPo0NlQTFBo
         fWFTReL3YwnADQ/y8K04elPKWQlZjsXnppS/qcoV+A4ZZgIcx88mkR3n5Ev6yZ3ttDMe
         jd9qMh5PQvKiLGNKTMQfczfo3EviJu0zTnhGjuDoa9Vrbw+ke4IwJJM3c6873tSDVfym
         0ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782513505; x=1783118305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBo303ZgWe06b+c3DpyLbageNFD263eKZHcTV1IiJqg=;
        b=X0FOoe4PmOPfqqIF7bcR6lK2w3hhwnFDYw7eK2DPtnhR917EsFiKoEnVIO5mZ1bpxw
         wscqwMapLHHSKx7+0mDriVcYj/RXLVZAAGyW/urlSqAN7wtPg5AlsfCA6BAwOUB4saOi
         x3JKxjpqj0yFrU/JxFOyyD9vK+rFi9lMaGSl7iZw1Vt04ntP19sgnUiQqFkxOU06LRXC
         hITfbN32IYE8h/23lmSkOeajQqpE85v7RoNhMgxaKCf6NBQ+vxj0UaDpzwFsaO33ELr3
         tNxNsbGARY+joMjsmgwctw3c4u7OPYsJR+l6aew20WKCDOFRJu/fduA2XIm6TYZWK1fk
         t/rA==
X-Gm-Message-State: AOJu0Yw6YX1Keqy7TDZreDNAdaMsDEgFClRWT9j5TxjMA6DkcWHOUVaa
	GyksjOFO3yXonKLCW8mNpLJZJeZ3MuCxafMLb7WGhe6UxpcyOEnP2gox
X-Gm-Gg: AfdE7clsHTqQ8tud4FGuUriwQfEFyrD4/8c4YJJlrkm/jCA2K0H7D5bV8tkQMuw8mKs
	Tdbm7L9LXk64j/pFC4BsIkUX8+apDbVQAFNMfrXblolcC+hu+WeNOxf5xR4rpl+s4hcs3D9a2mf
	ZGbtpGx4niQvWphVRX2/NJ0gm96BFqocbnXG5aMm8+qQ4X+3qlVnE2Cm3rwf3Au1fiEHSfWmSsV
	GBZIyTHOGmwe6z2giRs09vBP6xmzZC+kFQbAq2JqNPEJ5yx/ywf2wYmwmy/HpxtwssyNrSh1bKh
	6EHRxBiG1fIbQngQJtHRRBca1P2UjmBJKl8tSTCqxfbqFoTNgaSfSXvu5TR2XZ45YVZXsc7LbVm
	xAR+i3FdAjVmi74k6iD0ICMMnhuS4CyWo5qcgwqWvOQ7SKJjY3qWRUqPzxsUKOmrTsbsC27JaUj
	GSv7Q+CqxL+TEGRZR+8U3lFqy2UKPIDyBs+ICO
X-Received: by 2002:a05:690c:7243:b0:80c:85b6:75b0 with SMTP id 00721157ae682-80c85b68489mr22744667b3.57.1782513505253;
        Fri, 26 Jun 2026 15:38:25 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2 1/2] xen/gntalloc: make grant counters unsigned
Date: Sat, 27 Jun 2026 00:38:04 +0200
Message-ID: <20260626223805.43781-2-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626223805.43781-1-alhouseenyousef@gmail.com>
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
 <20260626223805.43781-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782513506-5F530986-A4A0AF3C/0/0
X-purgate-type: clean
X-purgate-size: 1209

The module limit and current allocation count cannot validly be
negative. Give both variables unsigned types so their representation
matches the u32 grant count supplied through the ioctl and negative
module parameter values are rejected by parameter parsing.

This also prepares the limit check for overflow-safe unsigned
arithmetic.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/xen/gntalloc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index eadedd1e9..9279f1521 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -70,14 +70,14 @@
 #include <xen/gntalloc.h>
 #include <xen/events.h>
 
-static int limit = 1024;
-module_param(limit, int, 0644);
+static unsigned int limit = 1024;
+module_param(limit, uint, 0644);
 MODULE_PARM_DESC(limit, "Maximum number of grants that may be allocated by "
 		"the gntalloc device");
 
 static LIST_HEAD(gref_list);
 static DEFINE_MUTEX(gref_mutex);
-static int gref_size;
+static unsigned int gref_size;
 
 struct notify_info {
 	uint16_t pgoff:12;    /* Bits 0-11: Offset of the byte to clear */
-- 
2.54.0


