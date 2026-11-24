Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5E606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=F3V9qQRK;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=MXzFRXAA
Received: from list by lists.xenproject.org with outflank-mailman.1500876.1696924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpVL-0006Md-Ec; Tue, 24 Nov 2026 12:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500876.1696924; Tue, 24 Nov 2026 12:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVpVL-0006MW-C1; Tue, 24 Nov 2026 12:20:11 +0000
Received: by outflank-mailman (input) for mailman id 1500876;
 Tue, 24 Nov 2026 12:20:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xVpVK-0006La-8h
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:20:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVpVJ-001fpM-5C
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:20:09 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6b0580f2-bab6-0a2a0a5309dd-0a2a4505e750-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:20:09 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6b0580f8-4cb1-0a2a45050019-c387df838964-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:20:08 +0100
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52DB51F452;
 Tue, 24 Nov 2026 12:20:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D7F81339F;
 Tue, 24 Nov 2026 12:20:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7ZREN/aABWtbegAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 24 Nov 2026 12:20:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795522808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HCrRVjJlHtp5gNK+LUHhPT+e0CLG5PXTa/x6Xbl5zOs=;
	b=F3V9qQRKAvQ24ngwUOXFriwZGyuRrB9KG6QCPCVplq03Mjv62eHQ2PDMpLG3+ggh++Ld6+
	DcGaIBc3YH3FvNDitl2BifU/kMWrMw7SdVAIxBkCTJNCThuq7VvQ6eFRdgy0LwHyl9+Axg
	zzmvhK+pbACTFJ5pSIvOhFxxC6F66gM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=MXzFRXAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795522807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HCrRVjJlHtp5gNK+LUHhPT+e0CLG5PXTa/x6Xbl5zOs=;
	b=MXzFRXAAUeFt97mDhE46nX4vihQ9apSXUqm9Ax3nNwA2MAaNoJh+xdBsQ3yvcdazDlA/Lx
	G+iJLA6exIqjhZ+42oEyJGPdhm/ZXFimQOAam1MrerCt09pelKpFxQhq9t+pf10sn7YOwL
	1T/gDgKLkBJv8oD69tD7o9Y1jv8lrZM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@amd.com>
Subject: [PATCH] xen/sched: fix potential NULL dereference in sched_move_domain()
Date: Tue, 24 Nov 2026 13:20:02 +0100
Message-ID: <20261124122004.2487366-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 52DB51F452
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,amd.com:email,suse.com:dkim,suse.com:email];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -12.51
X-purgate-ID: tlsNG-c201ff/1795522808-F58AE2A1-50ED3BD4/35/110847
X-purgate-type: clean
X-purgate-size: 2024
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If a dying domain has not all of its vcpus filled and it is moved from
a cpupool with gran=socket to one with gran=core, it might happen that
during assignment of the new units to the vcpus a NULL pointer is
being dereferenced:

- system has 2 sockets with 2 cores each, each core has 2 threads
- Pool-0 has gran=core, other cpupool has gran=socket
- domain with max_vcpus=4 has only 3 vcpus and is in cpupool with
  gran=socket
- domain is dying and is moved to Pool-0
- in sched_move_domain() this results in vcpu_failed being set to
  true for the last unit of the domain, resulting in the unit not
  being allocated ("continue" statement is being hit)
- in the for_each_vcpu() loop of sched_move_domain() for vcpu 2
  the unit pointer will be set to NULL, as unit->next_in_list is not
  populated due to above "continue"

Fixes: 4835c078e5cf ("xen/sched: core: skip missing vcpu slots in sched_move_domain()")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 10b6eecccd..ee7077b870 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -830,10 +830,13 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
         if ( unit->unit_id + gran == v->vcpu_id )
             unit = unit->next_in_list;
 
-        unit->state_entry_time = old_unit->state_entry_time;
-        unit->runstate_cnt[v->runstate.state]++;
-        /* Temporarily use old resource assignment */
-        unit->res = get_sched_res(new_cpu);
+        if ( unit )
+        {
+            unit->state_entry_time = old_unit->state_entry_time;
+            unit->runstate_cnt[v->runstate.state]++;
+            /* Temporarily use old resource assignment */
+            unit->res = get_sched_res(new_cpu);
+        }
 
         v->sched_unit = unit;
     }
-- 
2.56.0


