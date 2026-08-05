Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D392C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:22:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382957.1626234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWtC-0003U5-AH; Wed, 05 Aug 2026 08:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382957.1626234; Wed, 05 Aug 2026 08:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWtC-0003Tt-72; Wed, 05 Aug 2026 08:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1382957;
 Wed, 05 Aug 2026 08:22:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrWtA-0003QP-QT
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:22:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWt9-0036dz-Ud
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:22:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2b1-5cb7-0a2a0a5109dd-0a2a450aa3f2-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:22:11 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2b3-f2d2-0a2a450a0019-c387df8285d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:22:11 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 717A67FC46;
 Wed,  5 Aug 2026 08:22:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AD8B779B6;
 Wed,  5 Aug 2026 08:22:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kWcaCavycmohcQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Aug 2026 08:22:03 +0000
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
	t=1785918127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPDqya+4UA57J3GUJhbUC4MCTBzBvrkl/Z2toy8Sr1k=;
	b=ZoGUiQsj0jyqR8egDB6TgaUfolmQBnQi1EashLbUpEn9JMdtMrIgLSHNpTtJXjrYXCeDKw
	R3YHsrovTBo+1vz/RXS20N/cv10G2LLDnDVoozg98STi8eOF8ZpSZuE9Z5HiJQTJzuNYju
	tq5iViYKyQrSu0vC9Cx984N5YONY5Nc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPDqya+4UA57J3GUJhbUC4MCTBzBvrkl/Z2toy8Sr1k=;
	b=mo44s7jJ01TikRPeLn+M7SzLNQoKze3eAxQ4UHYFODcY4riiv0QCSJnyczh3TFIu1NDoOy
	HMcPUpmkdfSt0h+nx86nxIPWVbyGP0dvshsoT8uyF88sKCYLQGR/NY4BXdU6YQYC5UaKVJ
	Y3cGuKyyN+V46bgtJruvIgsMvqkW4YI=
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
Subject: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
Date: Wed,  5 Aug 2026 10:21:37 +0200
Message-ID: <20260805082137.1214967-5-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805082137.1214967-1-jgross@suse.com>
References: <20260805082137.1214967-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.79 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.958];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-4011c0/1785918131-59DDFCFC-F698A839/0/0
X-purgate-type: clean
X-purgate-size: 1145

CONFIG_XEN_PVHVM_SMP is referenced only on x86 in Xen specific code,
so it can be replaced with CONFIG_SMP.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/Kconfig  | 4 ----
 arch/x86/xen/Makefile | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 9e5bb51eecf4..609e79942fcb 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -50,10 +50,6 @@ config XEN_PV_DOM0
 	def_bool y
 	depends on XEN_PV && XEN_DOM0
 
-config XEN_PVHVM_SMP
-	def_bool y
-	depends on XEN && SMP
-
 config XEN_PVHVM_GUEST
 	bool "Xen PVHVM guest support"
 	default y
diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 32d651aa9bc2..9c7e9ffffb85 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -37,8 +37,8 @@ obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
 obj-$(CONFIG_EVENT_TRACING)	+= trace.o
 
 obj-$(CONFIG_SMP)		+= smp.o
+obj-$(CONFIG_SMP)		+= smp_hvm.o
 obj-$(CONFIG_XEN_PV_SMP)  	+= smp_pv.o
-obj-$(CONFIG_XEN_PVHVM_SMP)  	+= smp_hvm.o
 
 obj-$(CONFIG_PARAVIRT_SPINLOCKS)+= spinlock.o
 
-- 
2.55.0


