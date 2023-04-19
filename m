Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E8C6FD18
	for <xen-devel@archiver.kernel.org>; Wed, 19 Apr 2023 12:07:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.523392.813395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6al-0003Ky-Bh; Wed, 19 Apr 2023 12:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523392.813395; Wed, 19 Apr 2023 12:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6al-0003Kq-8q; Wed, 19 Apr 2023 12:07:19 +0000
Received: by outflank-mailman (input) for mailman id 523392;
 Wed, 19 Apr 2023 12:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WT8v=AK=zen2.lab.linutronix.de=alex@srs-se1.protection.inumbo.net>)
 id 1pp6aj-0003Kg-Tb
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:07:17 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8ac257e-deaa-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:07:15 +0200 (CEST)
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
X-Inumbo-ID: b8ac257e-deaa-11ed-8611-37d641c3527e
From: Alexander Kanavin <alex@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681906034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uB/axOQ5En9PckK/Aq+OqwZra7JiQP1h450lnS9RVyM=;
	b=iF8gDbav+fN6Eyk58sDi7615PCC6ZzLC9zAHucwDBKETpxMhdI+XDS9+lfal4ZbN9C5OIN
	oHnhx2bUTq7xx1xNLjonuvFa4IwTbqNdHQ5fsW9DU4c1oIfylmH+O9xB8t3Z0kMGNdE81/
	Tq0Ag872mbLJYUVVDsYSa1qgFqT4HSbRGFUlkhYAf5sgT5inZ0/6KmZif4tpDKJEmRct+Z
	J31PCoKp8TUgm1NvEBcq8tZDOD3BHxvFISDflSKkDrC9UEcDalrKwRc4sqd9/mUCg0S5D/
	IzitHA3lUbvHM2/LKYzJcXdIR0lpn9uQTTPcABrFvqf+AK7ja5v7qUBTCfb7ZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681906034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uB/axOQ5En9PckK/Aq+OqwZra7JiQP1h450lnS9RVyM=;
	b=3slBlkz2qwt9oXtBNR+XVv1opP7r0DPcWckCgI9aPsIE2ggyok7RJW8g1OfMrQ0cgjyVdL
	q/96aaEPUpq6I7AQ==
To: xen-devel@lists.xenproject.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/xenstore/xenstored_control.c: correctly print time_t
Date: Wed, 19 Apr 2023 14:07:09 +0200
Message-Id: <20230419120710.855128-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
the following error occurs otherwise:

| xenstored_control.c: In function 'lu_reject_reason':
| xenstored_control.c:646:70: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'time_t' {aka 'long long int'} [-Werror=format=]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 tools/xenstore/xenstored_control.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index cbd62556c3..403295788a 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -666,12 +666,12 @@ static const char *lu_reject_reason(const void *ctx)
 	time_t now = time(NULL);
 
 	list_for_each_entry(conn, &connections, list) {
-		if (conn->ta_start_time &&
-		    (now - conn->ta_start_time >= lu_status->timeout)) {
+		unsigned long tdiff = now - conn->ta_start_time;
+
+		if (conn->ta_start_time && (tdiff >= lu_status->timeout)) {
 			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
 					      ret ? : "Domains with long running transactions:",
-					      conn->id,
-					      now - conn->ta_start_time);
+					      conn->id, tdiff);
 		}
 	}
 
-- 
2.30.2


