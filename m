Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6AC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:19:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366246.1616158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljDI-0006ZE-W3; Mon, 20 Jul 2026 08:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366246.1616158; Mon, 20 Jul 2026 08:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljDI-0006Z7-SS; Mon, 20 Jul 2026 08:19:00 +0000
Received: by outflank-mailman (input) for mailman id 1366246;
 Mon, 20 Jul 2026 08:19:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wljDI-0006YL-Fj
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:19:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljDH-00G43B-Se
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:18:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9f2-bab6-0a2a0a5309dd-0a2a45099b72-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:59 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9f3-be1a-0a2a45090019-c387df83e1da-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:59 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 576153E09;
 Mon, 20 Jul 2026 08:18:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16137779AA;
 Mon, 20 Jul 2026 08:18:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uuYdBPLZXWrOXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 20 Jul 2026 08:18:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784535539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7QVV4zU+HBTHHGxFIUYe6BxCNLKsfYFRbHiHIdGaFw=;
	b=e5QBiW4DM081VgGinkM1H6FkX2WP9eGvAl0tjrmsZcV9fdXHlArc5YoQ/oxAvcTopgZUPz
	uyCXkcOzJnuP20sAuFcOlx1lctZsrgoKcisIUP8lo2na8NSMcR3NQP4KuxVhFZUKyzeWZI
	LAwbTmTyFVcBq88SJBiyi9oBKNKua80=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784535538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7QVV4zU+HBTHHGxFIUYe6BxCNLKsfYFRbHiHIdGaFw=;
	b=AMtzWKtOeP9VfrP6vXd6FqT+F1BOfBc/xggTJGFNwcvNiBcF9S71Cx7/i6ruqhu+j2Oz8d
	NpvGnlmz5BvxI/enKVitmipLooFK0nawAqMZHy9vAynK0j+xakCdqicsR+z7uLFQfmxsus
	gM3iMszzHQxvSpGOTJydFNjyHxuWasE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/5] docs: remove stale stubdom entries from stubdom.txt
Date: Mon, 20 Jul 2026 10:18:31 +0200
Message-ID: <20260720081833.4122182-5-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
References: <20260720081833.4122182-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-bad1c0/1784535539-3BAD0034-3C750BC9/0/0
X-purgate-type: clean
X-purgate-size: 2552

There are several stubdoms mentioned in docs/misc/stubdom.txt which
no longer exist. Remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/stubdom.txt | 69 -------------------------------------------
 1 file changed, 69 deletions(-)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index cfcba4ba96..3ee96d5063 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -85,72 +85,3 @@ To change the CD-ROM medium, libxl will:
 
 The stubdom must internally add /dev/xvdc to an fdset in QEMU with opaque set
 to "stub-devid:$devid".  libxl will lookup the fdset with that string.
-
-                                   PV-GRUB
-                                   =======
-
-  This replaces pygrub to boot domU images safely: it runs the regular grub
-inside the created domain itself and uses regular domU facilities to read the
-disk / fetch files from network etc. ; it eventually loads the PV kernel and
-chain-boots it.
-  
-Configuration
-=============
-
-In your PV config,
-
-- use pv-grub.gz as kernel:
-
-kernel = "pv-grub.gz"
-
-- set the path to menu.lst, as seen from the domU, in extra:
-
-extra = "(hd0,0)/boot/grub/menu.lst"
-
-or you can provide the content of a menu.lst stored in dom0 by passing it as a
-ramdisk:
-
-ramdisk = "/boot/domU-1-menu.lst"
-
-or you can also use a tftp path (dhcp will be automatically performed):
-
-extra = "(nd)/somepath/menu.lst"
-
-or you can set it in option 150 of your dhcp server and leave extra and ramdisk
-empty (dhcp will be automatically performed)
-
-Limitations
-===========
-
-- You can not boot a 64bit kernel with a 32bit-compiled PV-GRUB and vice-versa.
-To cross-compile a 32bit PV-GRUB,
-
-export XEN_TARGET_ARCH=x86_32
-
-- bootsplash is supported, but the ioemu backend does not yet support restart
-for use by the booted kernel.
-
-- PV-GRUB doesn't support virtualized partitions. For instance:
-
-disk = [ 'phy:hda7,hda7,w' ]
-
-will be seen by PV-GRUB as (hd0), not (hd0,6), since GRUB will not see any
-partition table.
-
-
-                                Your own stubdom
-                                ================
-
-  By running
-
-cd stubdom/
-make c-stubdom
-
-  or
-
-cd stubdom/
-make caml-stubdom
-
-  you can compile examples of C or caml stub domain kernels.  You can use these
-and the relevant Makefile rules as basis to build your own stub domain kernel.
-Available libraries are libc, libxc, libxs, zlib and libpci.
-- 
2.54.0


