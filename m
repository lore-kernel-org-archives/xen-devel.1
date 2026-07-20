Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6357CC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367029.1616924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQO-0003DX-J2; Mon, 20 Jul 2026 16:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367029.1616924; Mon, 20 Jul 2026 16:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQO-0003B6-41; Mon, 20 Jul 2026 16:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1367029;
 Mon, 20 Jul 2026 16:00:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQL-0002Vb-2P
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQK-00AdLl-Ei
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e462d-5cb7-0a2a0a5109dd-0a2a4505c1fe-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:56 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4638-4cb1-0a2a45050019-d155dd2ed001-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:56 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so7492535f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:56 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563256; x=1785168056; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RL+fNVvhfSSFDFHK7c1euVp7Huy4szKsBRgrEGEPIw=;
        b=bo5HY5+pqP7n/rTSHGkUBzPp+UXR4790XxrLRlsZo9RpjOXeNhYet8BHQT3fslCMy6
         qKeLkgHn31EW1Zz/BLxr4xvN5j8RI2xPny7NibKg9Qgvo77FdnRTos52h/hdiJBacLV+
         LlMOQZzSwh9Pa1sEzVWFuQxu1znt0jfQ99/35ADRhKLg4b2ytrb/C7AtmTze5Hp9EEjQ
         oCTr3Lzk/Gc3g2x0wP0G+Qz+vMB5blxiKeglIS9dPWEXz9zGwq1OdUxTD+FgzmSSIMN6
         eKlkLbiRfj0emwnle7pMjn5AKAJkl5O9WgUqVlCfcKLZmzZjE2seJWOqtq72SHOwVVYr
         KFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563256; x=1785168056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RL+fNVvhfSSFDFHK7c1euVp7Huy4szKsBRgrEGEPIw=;
        b=Vp9O07gWILQ6NzhNGhm6jtPJNP3bDEhMkeLFcVNkM31CVUecfxdzZvV7GQIfPgkwMM
         Zf25oAwRpWw6vCSIxeylkOpUFjK1RzNr3sdeRrqrWMiMxwvsV6e8uMWa2uAtm96+fEhU
         uaNYmspPntpJ5EoNxo++sbHQ9HTc2UzyzXkdp9u7BawTq9AXLrgTvqMXFDm1OfeuF1Lu
         4QDQtCOGKqhRNr4d79DL+IiJwIh1RsfD+uC1XRXzydGnpP3qVq+UvqxrEXMfP0WE0f+B
         GI17/vpRhEPqRsPMP7lKYVM8giippd6mleO0kO7Hhzfaixw6cMGLYTNcFoJMNx2Dj6yt
         iRXA==
X-Gm-Message-State: AOJu0Yx7asguPJ4YYvR4NeZpZuQusAsQMOPCpBpANXofS8aVgZdUrW4Y
	rPH/qTz/lMuovFRn7NHRmxNzdBjqeHFetyPriKtovDb/2t4xCly95lmD+IFAyg==
X-Gm-Gg: AR+sD13vTDrR99QX3rjTdfQRBANjTJ/wOfx0znv/HwCNCZAl3rkbsH90vdpp2h8TZKY
	KOEpZxvWC1VjCgZDblhg3wL6I4W3SA8YeLMZzEfBCcceoLM53E8L4ueCmf4AyvbVJ1SYlbW2Blx
	xPCDHvocstIKeq5YfNUcS9YJ82XpsN3iSGo3G7VbvclNojVyYnwNPVmOk2JgUuzs3Lk5lwJFTZR
	hAQ3JVVd3puXJ7qJfX0Bjj+1W7C17jjaC+dNXJzBsKV3f+Gc0eJ2jo+sRIXeeuUIgL1ZUPHkdtz
	opFcWiidfOKqk0xLM3UB+lGlRedYkGu7bW/wtFJdVYp2xGvkiMtnDiNbUOc/BU8lhf5c6Nvl6hR
	Bdy45SYi4/eZj/uQ8TYhJFUnupJ1x/aNB67WOMPjPD7SNCpkLya7CZ/zUP5IweeENE7DnFWRpTJ
	np1OSIEmOubgGsXU94I8iMqC29uP+P5pmsy94NvpE/paHP6xs=
X-Received: by 2002:a5d:5d0e:0:b0:46e:8226:96ba with SMTP id ffacd0b85a97d-47f623036aamr18227330f8f.13.1784563255708;
        Mon, 20 Jul 2026 09:00:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 23/23] xen/riscv: do a 4th linking pass if necessary
Date: Mon, 20 Jul 2026 18:00:04 +0200
Message-ID: <ff85121d7aea88f5e1e8eec729a11512f22c168c.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784563256-247132A1-BF3EEEF7/10/73395122804
X-purgate-type: spam
X-purgate-size: 2901

Embedding the symbol table can shift sections and flip relaxation
decisions, changing code size and thus the set of emitted tools/symbols
(e.g. gap end markers).  Re-link with a regenerated table when its
size differs from the previous pass.

This takes the same remedy as commit 35de7285d508 ("Arm: do a 4th
linking pass if necessary"), though the underlying cause differs:
here no symbol (dis)appears from the ELF symbol table; instead the
set of end markers emitted by tools/symbols legitimately changes,
because want_symbol_end() depends on code layout, and layout differs
between passes due to linker relaxation.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
I faced this issue again in downstream:
  https://gitlab.com/xen-project/people/olkur/xen/-/jobs/15171254706

Root cause: embedding the symbol table shifts .init.text far enough
that 4 JAL call sites from .text into .init.text (e.g. to
alloc_boot_pages()) exceed the ±1MB range the linker can relax, so
they fall back to auipc+jalr, growing .text by 16 bytes total. That
shift moves simple_strtoull() by the same amount, closing a 16-byte
alignment gap that used to precede turn_on_mmu(). Since
want_symbol_end() no longer sees a gap, tools/symbols stops emitting
the synthetic "end of symbol" marker for simple_strtoull(), which is
why symbols_addresses/symbols_names differ in size between pass 1
and pass 2.
---
Changes in v6:
 - Update the commit message and footer after it.
---
Changes in v5:
 - New patch.
---
---
 xen/arch/riscv/Makefile | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fc6b34661111..046f73f4d87c 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -50,9 +50,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
-	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
+	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
+	then \
+		set -e; \
+		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+		    $(dot-target).2.o -o $(dot-target).2; \
+		$(NM) -pa --format=sysv $(dot-target).2 \
+			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+			> $(dot-target).3.S; \
+		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
+		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
+	else \
+		ln -sf $(dot-target).2.o $(dot-target).3.o; \
+	fi
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).2.o -o $@
+	    $(dot-target).3.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-- 
2.54.0


