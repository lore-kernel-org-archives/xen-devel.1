Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B296606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MjEjZdZu;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MjEjZdZu
Received: from list by lists.xenproject.org with outflank-mailman.1500862.1696903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpFn-0002sR-4t; Tue, 24 Nov 2026 12:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500862.1696903; Tue, 24 Nov 2026 12:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpFn-0002sK-1u; Tue, 24 Nov 2026 12:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1500862;
 Tue, 24 Nov 2026 12:04:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xVpFm-0002sE-DS
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:04:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVpFl-008WLu-DT
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:04:05 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6b057d31-8faa-0a2a0a5109dd-0a2a45028dd0-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:04:05 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6b057d35-4900-0a2a45020019-c387df83d1f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:04:05 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DBE0D1F7A0;
 Tue, 24 Nov 2026 12:04:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84E821339F;
 Tue, 24 Nov 2026 12:04:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /VhHFjR9BWuoaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 24 Nov 2026 12:04:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795521844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=by6Vo62854VdoomsJD6S50kxOu3avTaaO1WyinojdYk=;
	b=MjEjZdZu6eHUhJPUDJQV2L4iafPRbsi0IpKvPlnirzHL6sEEmhvPOCIBQcgK8wZu5P+h9H
	ltE0x0aNF6xphESXOYzH7XPtgxOftm8gy8JdzTGNwaclRoXnWjYsRdGPCgnmfXMCiSfEv4
	rBmgbvE9R+LRD4gO1Ob8E6ecEnOTPy4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795521844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=by6Vo62854VdoomsJD6S50kxOu3avTaaO1WyinojdYk=;
	b=MjEjZdZu6eHUhJPUDJQV2L4iafPRbsi0IpKvPlnirzHL6sEEmhvPOCIBQcgK8wZu5P+h9H
	ltE0x0aNF6xphESXOYzH7XPtgxOftm8gy8JdzTGNwaclRoXnWjYsRdGPCgnmfXMCiSfEv4
	rBmgbvE9R+LRD4gO1Ob8E6ecEnOTPy4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/domain: fail vcpu_create() if init_waitqueue_vcpu() fails
Date: Tue, 24 Nov 2026 13:04:02 +0100
Message-ID: <20261124120402.2486249-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-purgate-ID: tlsNG-720697/1795521845-F89276C6-C34683EE/35/110847
X-purgate-type: clean
X-purgate-size: 996
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_waitqueue_vcpu() can fail in case of memory shortage. Don't let
vcpu_create() succeed in this case.

As destroy_waitqueue_vcpu() is tolerating a NULL waitqueue_vcpu, just
reuse the existing fail_wq label.

Fixes: 9b231b6bc20b ("Wait queues, allowing conditional sleep in hypervisor context.")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index f3a2634d5f..060f0e7a9d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -496,7 +496,8 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
         v->runstate.state_entry_time = NOW();
         set_bit(_VPF_down, &v->pause_flags);
         vcpu_info_reset(v);
-        init_waitqueue_vcpu(v);
+        if ( init_waitqueue_vcpu(v) != 0 )
+            goto fail_wq;
 
         if ( vmtrace_alloc_buffer(v) != 0 )
             goto fail_wq;
-- 
2.56.0


