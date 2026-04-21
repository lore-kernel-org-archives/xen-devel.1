Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54F8F8FA80
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 14:27:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289041.1569265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFC4E-0003vI-WC; Tue, 21 Apr 2026 14:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289041.1569265; Tue, 21 Apr 2026 14:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFC4E-0003vB-TX; Tue, 21 Apr 2026 14:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1289041;
 Tue, 21 Apr 2026 14:27:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <thuth@redhat.com>) id 1wFC4D-0003v5-No
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 14:27:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFC4C-00BXYE-W5
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:27:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <thuth@redhat.com>)
 id 69e78937-e002-0a2a0a5209dd-0a2a4505e5dc-20
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:27:08 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <thuth@redhat.com>)
 id 69e7893b-aaa8-0a2a45050019-aa0a817cdedf-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 16:27:08 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-aNzvu0kYNpe-BCfSi7bC5Q-1; Tue,
 21 Apr 2026 10:27:05 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95FF91956089; Tue, 21 Apr 2026 14:27:04 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.140])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7BDB4180047F; Tue, 21 Apr 2026 14:27:02 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:content-type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776781627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8OFS7cyWvYenINAYlZhvmiwwCjJ2oV+n9qF7Hqe8c0=;
	b=YnNi/rLOPBxSPkcE5Yw2A8hO/PgYOV7w5jLvQTQ9FEfIIjmqsKe8bLBILwAPWt/ONFRYjl
	n7PdplwSNwrc9TxA0mkKHsszuhnt/YLBvW73JdziqdbeA1FCwklvI9OkzuZh0izWH3Tnwm
	5gta37YlAHXmt4r/h0V1gj0ilR4eQEo=
X-MC-Unique: aNzvu0kYNpe-BCfSi7bC5Q-1
X-Mimecast-MFC-AGG-ID: aNzvu0kYNpe-BCfSi7bC5Q_1776781624
From: Thomas Huth <thuth@redhat.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in interface.h
Date: Tue, 21 Apr 2026 16:27:01 +0200
Message-ID: <20260421142701.548978-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Fo9w7dORjlthjzKwaPWORily0J5vC8aJ69GQ_ePpzDg_1776781624
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-purgate-ID: tlsNG-c201ff/1776781628-E09AD443-79164B1D/0/0
X-purgate-type: clean
X-purgate-size: 1269

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier patch series of mine
 to ease reviewing.

 include/xen/arm/interface.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/arm/interface.h b/include/xen/arm/interface.h
index c3eada2642aa9..61360b89da405 100644
--- a/include/xen/arm/interface.h
+++ b/include/xen/arm/interface.h
@@ -30,7 +30,7 @@
 
 #define __HYPERVISOR_platform_op_raw __HYPERVISOR_platform_op
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /* Explicitly size integers that represent pfns in the interface with
  * Xen so that we can have one ABI that works for 32 and 64 bit guests.
  * Note that this means that the xen_pfn_t type may be capable of
-- 
2.53.0


