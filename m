Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC36DC55166
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 16:24:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378189.1623763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTYK-0002EJ-En; Thu, 30 Jul 2026 16:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378189.1623763; Thu, 30 Jul 2026 16:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTYK-0002EC-BS; Thu, 30 Jul 2026 16:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1378189;
 Thu, 30 Jul 2026 16:24:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dfaggioli@suse.com>) id 1wpTYJ-0002E6-Ai
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpTYI-003nqn-Np
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:24:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a6b7aa5-e002-0a2a0a5209dd-0a2a4507d668-10
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:24:10 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a6b7aaa-b4ea-0a2a45070019-c387df829dbe-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:24:10 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1CA97D44E;
 Thu, 30 Jul 2026 16:24:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7157A779CC;
 Thu, 30 Jul 2026 16:24:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CxAmGaF6a2qGEgAAD6G6ig
 (envelope-from <dfaggioli@suse.com>); Thu, 30 Jul 2026 16:24:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785428646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DW9g/0CRlwYVHg/ukVqiiLsP9W6XmMsTesm4A4QPhNY=;
	b=oVXIp1MTkLjE00xUGObRqp/RwqMUq1TVOlqXFeScHl6bACPSJzjpTnNRObehxyF1oD/SRO
	wIaNlJBBbUIrSJlYaLswlVGTr532lVkIEIZYSbSGoKqwoBooq9qokh4YLq5tqFO1/UxRiZ
	EQ6iOVNnSH7eou1Iju7z7p21VmOmm0A=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785428641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DW9g/0CRlwYVHg/ukVqiiLsP9W6XmMsTesm4A4QPhNY=;
	b=POoP3IRq+2/v4dKYhiGAIuwnOgT6W0831PnzyMlgRD/SptvV7Zhx60nSv8SpDeCMZyStQY
	XlC2POQsLhehhmopw+xOmpmgHfHt6bqM7NXYkp0QxclNdWSFNHbE4xs5Ctp7WVWHjtHP1e
	XT6LTgj3Z8GxRmULdCyt6zxR5BIpbWQ=
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	Dario Faggioli <dfaggioli@suse.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] hw/i386/pc: xen: reinstate the "xenfv" machine alias
Date: Thu, 30 Jul 2026 18:22:38 +0200
Message-ID: <20260730162238.3308286-1-dfaggioli@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-ef75cf/1785428650-A7AD0AE4-35650D56/0/0
X-purgate-type: clean
X-purgate-size: 1165

Commit 7d2778dea32a4924a469f1cc5767042c8f5b4eea ("hw/i386/pc:
Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines") removed
the Xen machine type that was providing the "xenfv" alias. As a
consequence, since the tools are apparently relying on such alias,
we're getting this, as soon as one tries to start a Xen (HVM) VM:

  qemu-system-i386: unsupported machine type: "xenfv"
  Use -machine help to list supported machines

Reinstate the alias and let it point to the only Xen machine we
still have.

Fixes: 7d2778dea3 hw/i386/pc: Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
 hw/i386/pc_piix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 82457bdb16..0a911ce59e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -658,6 +658,7 @@ static void xenfv_machine_4_2_options(MachineClass *m)
 {
     pc_i440fx_machine_4_2_options(m);
     m->desc = "Xen Fully-virtualized PC";
+    m->alias = "xenfv";
     m->max_cpus = HVM_MAX_VCPUS;
     m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
 }
-- 
2.55.0


