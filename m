Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3C5C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:22:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382949.1626208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWsv-0002XA-H9; Wed, 05 Aug 2026 08:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382949.1626208; Wed, 05 Aug 2026 08:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWsv-0002X1-D4; Wed, 05 Aug 2026 08:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1382949;
 Wed, 05 Aug 2026 08:21:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrWsu-0002Wa-Fi
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:21:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWst-00BT1X-BI
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:21:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f296-bab6-0a2a0a5309dd-0a2a4508bcde-32
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:21:55 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2a3-f659-0a2a45080019-c387df83d376-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:21:55 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A9A03EE8;
 Wed,  5 Aug 2026 08:21:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 441B5779C3;
 Wed,  5 Aug 2026 08:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iCFSD5rycmoKcQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Aug 2026 08:21:46 +0000
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
	t=1785918110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnKrqMmp33/ctRIhxID+//YqIMVJKj3PyOBSZaP2xuU=;
	b=U0We0YVgtE6Lxr5fhgkZV4EPZV4UcNMdx3VBu/3Izclwsm7Hnj9w7gorTh5rQe13AD+/69
	xXh21lfM+lTYYlEGZH0XpHEhCoLJicV76a8THubZMQ0w7UsuNrynMImvBie915Rl1dzayG
	W50M4W4wCMy1AZoEUW1rFEympNqdWJ8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnKrqMmp33/ctRIhxID+//YqIMVJKj3PyOBSZaP2xuU=;
	b=d/1ekcpK9nnUZFXy4S14oeT+Xd9XtV0nWExr3VJY/OyzjkbB7z++Xy5zWJxldQAaNRQ6w9
	8lPrfsBJqWdxX4WbBOBk8xqYbHC3PINbhZA+wZLnPIuG0NKpPyx9VrCIjTXAGg7NvTpBfP
	bknonSPBSw93SQAOzDJLLpO+jfnj3Dk=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/4] x86/xen: Remove redundant config dependency on X86_LOCAL_APIC
Date: Wed,  5 Aug 2026 10:21:34 +0200
Message-ID: <20260805082137.1214967-2-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805082137.1214967-1-jgross@suse.com>
References: <20260805082137.1214967-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.79 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.957];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-c1860d/1785918115-CDD4887B-6AB42BB5/0/0
X-purgate-type: clean
X-purgate-size: 607

CONFIG_XEN depends on CONFIG_X86_LOCAL_APIC already, so the dependency
of CONFIG_XEN_PVHVM on CONFIG_X86_LOCAL_APIC can be dropped.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 99b06f5c47cd..bb420a4cb75f 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -52,7 +52,7 @@ config XEN_PV_DOM0
 
 config XEN_PVHVM
 	def_bool y
-	depends on XEN && X86_LOCAL_APIC
+	depends on XEN
 
 config XEN_PVHVM_SMP
 	def_bool y
-- 
2.55.0


