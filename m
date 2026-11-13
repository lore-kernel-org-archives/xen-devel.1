Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA5606A88F
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=WgMxrg0z
Received: from list by lists.xenproject.org with outflank-mailman.1487423.1689855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqF8-0006KV-HV; Fri, 13 Nov 2026 12:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487423.1689855; Fri, 13 Nov 2026 12:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqF8-0006KO-Ev; Fri, 13 Nov 2026 12:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1487423;
 Fri, 13 Nov 2026 12:18:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRqF7-0006KC-A1
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:18:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRqF6-002xnM-N2
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:18:56 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af70023-e002-0a2a0a5209dd-0a2a4509899c-28
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:18:56 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af70030-be1a-0a2a45090019-d155dd29f067-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:18:56 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-491971ac844so1090055f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c608c5debsm4825237f8f.42.2026.11.13.04.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 04:18:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794572336; x=1795177136; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icHw+7+BEaIPv6qNiV1pDdXJebzX17Hn5m/7YAJVtpU=;
        b=WgMxrg0zqtE5Eti6NN6rMAJT6LfnMYCEiKEhz2GO6g/VQ+3Rpp9t1ryHyQzX20xk++
         tdfMy8InsmXcGbmopH0vOnSCiRmX0N82VBn9jl0rkoRbADdUV2O31V9adgshptyfs3br
         JEQK6D04vxIk5VwfFX0csbFTtI5SitzjdJeTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572336; x=1795177136;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=icHw+7+BEaIPv6qNiV1pDdXJebzX17Hn5m/7YAJVtpU=;
        b=0zouxQEeGU4O6rMUmWnk+swdxK7qiCba1ZgVuxvPn0jfCiOaoBMNrDNGTvbTRzPT6a
         jIzA8krEAAETHfhiZopsDGuSTOJsGvnFOPkHY7UO3pFnaJKplATyG5x1Y9dfUCDqkPUM
         yb6cPT3hvW+L+OQxv8XosB8u5W27pbFKPIXSxJjXdvjUmgQC8mFWajKn+JSux6GdFmxr
         2J6guEo8Wyv36S4xJKdGL7hxhCFcf6SIT/oQHqmZigt5pblPCWVDamcGOax+tNr3WmRD
         QRzrnHOVMt6m6/Ee5LX1GkZg4yrrcAEeKGiIEA6nvVNn+9zZkPc0BwrGxQtReT1zDUIY
         wn3w==
X-Gm-Message-State: APuU4Z+ZyJh4nq6AX3RtZ71bT4nQdBecvsO3HbH+oRMS9tNH1KT3xXw1
	Xc0un/VvahqoRlQj+3uKeridhYuX+geaetrp5DvPwEVa90xsgnm2M0ATr/ciYQekKvwMGTGWRFB
	Xnozw
X-Gm-Gg: AYBFou3b3QImlgfNGSQRBU1gl6HY/gXZaJdUYrHpTmt2FbyLfJU3yRb0sU8WgRsdWkj
	/WV3ji6FEiJwrx1GxLJ4++NuGBeDhArz3ZZ31a/ifMc7hTUVvS9Q+igxmexy6kHMUmwGQwnoDsN
	xjWm2NDotGmTasXYiC6m8zb+WiOa/KsXf7GQGC9WW8/TzpDEKgoPBWzaniiiMK4xub0NdW5cosp
	dr85UK6zs6GOI89Nyfh3ABZnWNyCzjiORaJmLO5jURweOYblH/5tv+QhrFTAsn6DE/kGWgfbhBy
	9RzFZroMys9lgKeFzYxDKLQv8HQeB30+mATDfNFT8CGrG1kQiCcJuXg2oTf6wp6bBE3NTDVr6it
	4lUeVUW4r+Da6IBm7sTpS4joqHCkzmktZDM2eBIwJnAX1f+2QlEH9Po7RlTI+PeI7XOdbcCp7em
	X8zthKRHgpWw+7Jg+N3g/phrJdjmkRSRXT8RkdK8l6JATHEuT7KJIUqzzXCLQrXmpjWE7eKVr7L
	QChu5SJ5CdY+PNACE2OBXX2ukE/GUOgOYLL3LECbq8Wp+jL7motTRaYVSgzcyo8ngWqF28BlMNt
	2LiRutJbb6tAtzhqOqIlJm7gX9CRY2uctjuIjzzSskxPW/u2R/KIWYI3P6nl7uv99TQK8nb3gD8
	Ku34=
X-Received: by 2002:a05:6000:2508:b0:498:a72d:c097 with SMTP id ffacd0b85a97d-49c70ed7c56mr5855212f8f.19.1794572335163;
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/aepi: Fully remove dead code
Date: Fri, 13 Nov 2026 12:18:50 +0000
Message-Id: <20261113121850.3423155-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794572336-BC2F4034-65DA628B/10/78276251493
X-purgate-type: spam
X-purgate-size: 9527
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These were marked "currently dead" in commit e681c0408564 ("ACPI/ERST: fix
signed/unsigned type conflicts") in 2014.  They're no-less dead 12 years
later.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/mcheck/mce-apei.c |  40 ----
 xen/drivers/acpi/apei/erst.c       | 286 -----------------------------
 2 files changed, 326 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c b/xen/arch/x86/cpu/mcheck/mce-apei.c
index 0b1c9902c0bd..f5737aa14630 100644
--- a/xen/arch/x86/cpu/mcheck/mce-apei.c
+++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
@@ -87,43 +87,3 @@ int apei_write_mce(struct mce *m)
 
 	return erst_write(&rcd.hdr);
 }
-
-#ifndef NDEBUG /* currently dead code */
-
-ssize_t apei_read_mce(struct mce *m, u64 *record_id)
-{
-	struct cper_mce_record rcd;
-	ssize_t len;
-
-	if (!m || !record_id)
-		return -EINVAL;
-
-	len = erst_read_next(&rcd.hdr, sizeof(rcd));
-	if (len <= 0)
-		return len;
-	/* Can not skip other records in storage via ERST unless clear them */
-	else if (len != sizeof(rcd) ||
-		 uuid_le_cmp(rcd.hdr.creator_id, CPER_CREATOR_MCE)) {
-		printk(KERN_WARNING
-			"MCE-APEI: Can not skip the unknown record in ERST");
-		return -EIO;
-	}
-
-	memcpy(m, &rcd.mce, sizeof(*m));
-	*record_id = rcd.hdr.record_id;
-
-	return sizeof(*m);
-}
-
-/* Check whether there is record in ERST */
-bool apei_check_mce(void)
-{
-	return erst_get_record_count() > 0;
-}
-
-int apei_clear_mce(u64 record_id)
-{
-	return erst_clear(record_id);
-}
-
-#endif /* currently dead code */
diff --git a/xen/drivers/acpi/apei/erst.c b/xen/drivers/acpi/apei/erst.c
index 76f799c0ab44..195b527cfda4 100644
--- a/xen/drivers/acpi/apei/erst.c
+++ b/xen/drivers/acpi/apei/erst.c
@@ -382,74 +382,6 @@ static int erst_get_erange(struct erst_erange *range)
 	return 0;
 }
 
-#ifndef NDEBUG /* currently dead code */
-
-static ssize_t __erst_get_record_count(void)
-{
-	struct apei_exec_context ctx;
-	int rc;
-	u64 output;
-	ssize_t count;
-
-	erst_exec_ctx_init(&ctx);
-	rc = apei_exec_run(&ctx, ACPI_ERST_GET_RECORD_COUNT);
-	if (rc)
-		return rc;
-	count = output = apei_exec_ctx_get_output(&ctx);
-	return count >= 0 && count == output ? count : -ERANGE;
-}
-
-ssize_t erst_get_record_count(void)
-{
-	ssize_t count;
-	unsigned long flags;
-
-	if (!erst_enabled)
-		return -ENODEV;
-
-	spin_lock_irqsave(&erst_lock, flags);
-	count = __erst_get_record_count();
-	spin_unlock_irqrestore(&erst_lock, flags);
-
-	return count;
-}
-
-static int __erst_get_next_record_id(u64 *record_id)
-{
-	struct apei_exec_context ctx;
-	int rc;
-
-	erst_exec_ctx_init(&ctx);
-	rc = apei_exec_run(&ctx, ACPI_ERST_GET_RECORD_ID);
-	if (rc)
-		return rc;
-	*record_id = apei_exec_ctx_get_output(&ctx);
-
-	return 0;
-}
-
-/*
- * Get the record ID of an existing error record on the persistent
- * storage. If there is no error record on the persistent storage, the
- * returned record_id is APEI_ERST_INVALID_RECORD_ID.
- */
-int erst_get_next_record_id(u64 *record_id)
-{
-	int rc;
-	unsigned long flags;
-
-	if (!erst_enabled)
-		return -ENODEV;
-
-	spin_lock_irqsave(&erst_lock, flags);
-	rc = __erst_get_next_record_id(record_id);
-	spin_unlock_irqrestore(&erst_lock, flags);
-
-	return rc;
-}
-
-#endif /* currently dead code */
-
 static int __erst_write_to_storage(u64 offset)
 {
 	struct apei_exec_context ctx;
@@ -489,92 +421,6 @@ static int __erst_write_to_storage(u64 offset)
 	return erst_errno(val);
 }
 
-#ifndef NDEBUG /* currently dead code */
-
-static int __erst_read_from_storage(u64 record_id, u64 offset)
-{
-	struct apei_exec_context ctx;
-	u64 timeout = FIRMWARE_TIMEOUT;
-	u64 val;
-	int rc;
-
-	erst_exec_ctx_init(&ctx);
-	rc = apei_exec_run(&ctx, ACPI_ERST_BEGIN_READ);
-	if (rc)
-		return rc;
-	apei_exec_ctx_set_input(&ctx, offset);
-	rc = apei_exec_run(&ctx, ACPI_ERST_SET_RECORD_OFFSET);
-	if (rc)
-		return rc;
-	apei_exec_ctx_set_input(&ctx, record_id);
-	rc = apei_exec_run(&ctx, ACPI_ERST_SET_RECORD_ID);
-	if (rc)
-		return rc;
-	rc = apei_exec_run(&ctx, ACPI_ERST_EXECUTE_OPERATION);
-	if (rc)
-		return rc;
-	for (;;) {
-		rc = apei_exec_run(&ctx, ACPI_ERST_CHECK_BUSY_STATUS);
-		if (rc)
-			return rc;
-		val = apei_exec_ctx_get_output(&ctx);
-		if (!val)
-			break;
-		if (erst_timedout(&timeout, SPIN_UNIT))
-			return -EIO;
-	};
-	rc = apei_exec_run(&ctx, ACPI_ERST_GET_COMMAND_STATUS);
-	if (rc)
-		return rc;
-	val = apei_exec_ctx_get_output(&ctx);
-	rc = apei_exec_run(&ctx, ACPI_ERST_END);
-	if (rc)
-		return rc;
-
-	return erst_errno(val);
-}
-
-static int __erst_clear_from_storage(u64 record_id)
-{
-	struct apei_exec_context ctx;
-	u64 timeout = FIRMWARE_TIMEOUT;
-	u64 val;
-	int rc;
-
-	erst_exec_ctx_init(&ctx);
-	rc = apei_exec_run(&ctx, ACPI_ERST_BEGIN_CLEAR);
-	if (rc)
-		return rc;
-	apei_exec_ctx_set_input(&ctx, record_id);
-	rc = apei_exec_run(&ctx, ACPI_ERST_SET_RECORD_ID);
-	if (rc)
-		return rc;
-	rc = apei_exec_run(&ctx, ACPI_ERST_EXECUTE_OPERATION);
-	if (rc)
-		return rc;
-	for (;;) {
-		rc = apei_exec_run(&ctx, ACPI_ERST_CHECK_BUSY_STATUS);
-		if (rc)
-			return rc;
-		val = apei_exec_ctx_get_output(&ctx);
-		if (!val)
-			break;
-		if (erst_timedout(&timeout, SPIN_UNIT))
-			return -EIO;
-	}
-	rc = apei_exec_run(&ctx, ACPI_ERST_GET_COMMAND_STATUS);
-	if (rc)
-		return rc;
-	val = apei_exec_ctx_get_output(&ctx);
-	rc = apei_exec_run(&ctx, ACPI_ERST_END);
-	if (rc)
-		return rc;
-
-	return erst_errno(val);
-}
-
-#endif /* currently dead code */
-
 /* NVRAM ERST Error Log Address Range is not supported yet */
 static int __erst_write_to_nvram(const struct cper_record_header *record)
 {
@@ -582,24 +428,6 @@ static int __erst_write_to_nvram(const struct cper_record_header *record)
 	return -ENOSYS;
 }
 
-#ifndef NDEBUG /* currently dead code */
-
-static int __erst_read_to_erange_from_nvram(u64 record_id, u64 *offset)
-{
-	printk(KERN_WARNING
-		"NVRAM ERST Log Address Range is not implemented yet\n");
-	return -ENOSYS;
-}
-
-static int __erst_clear_from_nvram(u64 record_id)
-{
-	printk(KERN_WARNING
-		"NVRAM ERST Log Address Range is not implemented yet\n");
-	return -ENOSYS;
-}
-
-#endif /* currently dead code */
-
 int erst_write(const struct cper_record_header *record)
 {
 	int rc;
@@ -639,120 +467,6 @@ int erst_write(const struct cper_record_header *record)
 	return rc;
 }
 
-#ifndef NDEBUG /* currently dead code */
-
-static int __erst_read_to_erange(u64 record_id, u64 *offset)
-{
-	int rc;
-
-	if (erst_erange.attr & ERST_RANGE_NVRAM)
-		return __erst_read_to_erange_from_nvram(
-			record_id, offset);
-
-	rc = __erst_read_from_storage(record_id, 0);
-	if (rc)
-		return rc;
-	*offset = 0;
-
-	return 0;
-}
-
-static ssize_t __erst_read(u64 record_id, struct cper_record_header *record,
-			   size_t buflen)
-{
-	int rc;
-	u64 offset;
-	ssize_t len;
-	struct cper_record_header *rcd_tmp;
-
-	rc = __erst_read_to_erange(record_id, &offset);
-	if (rc)
-		return rc;
-	rcd_tmp = erst_erange.vaddr + offset;
-	if (rcd_tmp->record_length > buflen)
-		return -ENOBUFS;
-	len = rcd_tmp->record_length;
-	if (len < 0)
-		return -ERANGE;
-	memcpy(record, rcd_tmp, len);
-
-	return len;
-}
-
-/*
- * If return value > buflen, the buffer size is not big enough,
- * else if return value < 0, something goes wrong,
- * else everything is OK, and return value is record length
- */
-ssize_t erst_read(u64 record_id, struct cper_record_header *record,
-		  size_t buflen)
-{
-	ssize_t len;
-	unsigned long flags;
-
-	if (!erst_enabled)
-		return -ENODEV;
-
-	spin_lock_irqsave(&erst_lock, flags);
-	len = __erst_read(record_id, record, buflen);
-	spin_unlock_irqrestore(&erst_lock, flags);
-	return len;
-}
-
-/*
- * If return value > buflen, the buffer size is not big enough,
- * else if return value = 0, there is no more record to read,
- * else if return value < 0, something goes wrong,
- * else everything is OK, and return value is record length
- */
-ssize_t erst_read_next(struct cper_record_header *record, size_t buflen)
-{
-	int rc;
-	ssize_t len;
-	unsigned long flags;
-	u64 record_id;
-
-	if (!erst_enabled)
-		return -ENODEV;
-
-	spin_lock_irqsave(&erst_lock, flags);
-	rc = __erst_get_next_record_id(&record_id);
-	if (rc) {
-		spin_unlock_irqrestore(&erst_lock, flags);
-		return rc;
-	}
-	/* no more record */
-	if (record_id == APEI_ERST_INVALID_RECORD_ID) {
-		spin_unlock_irqrestore(&erst_lock, flags);
-		return 0;
-	}
-
-	len = __erst_read(record_id, record, buflen);
-	spin_unlock_irqrestore(&erst_lock, flags);
-
-	return len;
-}
-
-int erst_clear(u64 record_id)
-{
-	int rc;
-	unsigned long flags;
-
-	if (!erst_enabled)
-		return -ENODEV;
-
-	spin_lock_irqsave(&erst_lock, flags);
-	if (erst_erange.attr & ERST_RANGE_NVRAM)
-		rc = __erst_clear_from_nvram(record_id);
-	else
-		rc = __erst_clear_from_storage(record_id);
-	spin_unlock_irqrestore(&erst_lock, flags);
-
-	return rc;
-}
-
-#endif /* currently dead code */
-
 static int __init erst_check_table(struct acpi_table_erst *erst_tab)
 {
 	if (erst_tab->header.length < sizeof(*erst_tab))
-- 
2.39.5


