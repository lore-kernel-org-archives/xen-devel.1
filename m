Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0175DCCA469
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451119.1666313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdt-0001mq-LH; Thu, 15 Oct 2026 21:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451119.1666313; Thu, 15 Oct 2026 21:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdt-0001md-FZ; Thu, 15 Oct 2026 21:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1451119;
 Thu, 15 Oct 2026 21:05:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHSds-0001Xs-8m
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:05:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHSdr-00Gq26-Lt
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 23:05:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad14003-bab6-0a2a0a5309dd-0a2a45089e60-24
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:35 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad1401f-f659-0a2a45080019-d155dd29dc79-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:35 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so721909f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:05:35 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm501163f8f.35.2026.10.15.14.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:05:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1792098335; x=1792703135; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VW67AVN3J4LJdnkkC/kdo+PQC4U/8r9vrNzku1xFB4=;
        b=QWfMZ5BMAvkpcI434Fxhg3SPpBAhq9eOy/AdfBGhwp0NOH/mQFJaCrSOSIVe5fUKrh
         3dlinZgUYctRBW9XW8k1JTDujjhx0Pxd4F5m+IeINw76MfauJNu2ffarSS82vvgbwJ06
         0ofeCCs3zJq1iNZXbYqU+z+K+mcCJbfxEiwV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098335; x=1792703135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VW67AVN3J4LJdnkkC/kdo+PQC4U/8r9vrNzku1xFB4=;
        b=OXLOCHUo4WrVC6DTCEalovNqDmdjCg09herVGtl6fEk7oytO4saTU63pA9KMIs6j2Q
         mPzJT6Bos/lJw6WYFkJydjxwrsg7t5ZHVjfxIGq8JiZyDppTgSzQicQpkkmAtgoEQcG5
         cb5KD1lU+rPu8jEFPqw8Fxinb46B5Ynx4Xcb3fEmHVPkfNdzkhQFaR60L+1nQSMWQiQq
         YSu1oS8/wRd1FUOjTHFSDdlOZzrkM6hauoE0h+hij43xl+eyNCkulTtl9+AMGN3rx1nY
         KhZCyUaAnTOaHdvMq6E6VFwv+jW+0oqUobMAnXaUpeRr0jm5XODpc6kJjGjL1G5G56lh
         ++JA==
X-Gm-Message-State: AFq9FYJ6ctl0CVEhwrp8VQzOI4XVjv3dJEbp1nxO21lI4lVZoGML6HhV
	TjeFqzAHozmSTpwFxfGeYbiZCf2gatrwxaNCCx5hPmbYOYBJ1+BBVWAUChdPomqpRtRubBtyZmU
	KBELXCFE=
X-Gm-Gg: AYBFou0eYx7RPBgI/U3GUoP4DDhL8szcdVJsiMgP5bh2frrHzsrpEPD8VpilvziVbuY
	zUA+pGeajtjGTsnEKRS9dwY7XsjmCzWxehX+O6WHC7nsRc7F+PSHo9GORj99f36rIlTvpbv7F51
	3tUIzF7C4DFhpMfqte0LC80++M+BPo660RJrRdi700yK3IWvmXv0IbJjhGWGHOCBFUhTcWbV/kx
	arV82rTLWWl2I9Dxrp6FjjE7XMFOqo9fKPhOhq/lGBlmWj2CeSNpnhIfGrJlvfyVb4c3Ywu3IYl
	PMLQI8aAtVX05u2B3g8Gbcx32f1NbcOrxOz5wl4usBVGJZigbVTQb0shWNeDpuQis6M0CMcez5g
	IvpQik4kqX6Tex2oKkCj5nzn7mZaDJvACJJpTHEh3M5+Z9ZYdXG3LgL/ztSy3R9MNIhPHLXwgff
	MvPk6ugDxcUB09wn23GwsP7FdQNonuxlB7IWOUomPg+30icyH47mlYxbuZBUdD23jS1nC7AXUWZ
	hOsAkrVpWV5WNlr7Mqu/IeYT5RUuDXnfY+bacYGv+icuq+R
X-Received: by 2002:a05:6000:2503:b0:48c:7083:be67 with SMTP id ffacd0b85a97d-48dbace462emr36869264f8f.42.1792098334736;
        Thu, 15 Oct 2026 14:05:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 2/5] tests/x86: Introduce a userspace test harness for x86_decode_lite()
Date: Thu, 15 Oct 2026 22:05:27 +0100
Message-Id: <20261015210530.786604-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015210530.786604-1-andrew.cooper3@citrix.com>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1792098335-D654487B-D164D8EE/10/78276251493
X-purgate-type: spam
X-purgate-size: 31293

All the interesting behaviour is in insns.S.

There are 4 interesting cases; "not an instruction we tolerate", and one we do
tolerate, split by no relation, disp8 or disp32.  The DECL()/END() macros
start and terminate the tests_*[] arrays used by C.

Between DECL()/END(), a macro named _ adds an entry into the array, including
a name and the length of the instruction according to the assembler, while
being as visually unintrusive as possible.

Plain labels are ad-hoc and there to aid legibility during disassembly.  In a
couple of cases, the macro named n (for name) allows for choosing a name
manually, and is used for cases where the assembler doesn't like the mnemonic.

Clang IAS doesn't like the convenience macro, and Binutils of around 2.30
don't like sysexitl or movsxd with a 32bit operand.  As it's only Ubuntu 18.04
affected by this, skip building the harness in old environments.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v4:
 * Fix %dl/%bh confusion in ModRM testing
 * Rebase over header rework
 * Uppercase some identifiers

v3:
 * Force disable Clang IAS.  It doesn't like the _ macro.
 * Support 32bit builds

v2:
 * New
---
 tools/tests/Makefile                      |   1 +
 tools/tests/x86-decode-lite/.gitignore    |   1 +
 tools/tests/x86-decode-lite/Makefile      |  56 ++
 tools/tests/x86-decode-lite/insns.S       | 711 ++++++++++++++++++++++
 tools/tests/x86-decode-lite/macro-magic.h |  62 ++
 tools/tests/x86-decode-lite/main.c        | 113 ++++
 tools/tests/x86-decode-lite/x86-emulate.h |  29 +
 7 files changed, 973 insertions(+)
 create mode 100644 tools/tests/x86-decode-lite/.gitignore
 create mode 100644 tools/tests/x86-decode-lite/Makefile
 create mode 100644 tools/tests/x86-decode-lite/insns.S
 create mode 100644 tools/tests/x86-decode-lite/macro-magic.h
 create mode 100644 tools/tests/x86-decode-lite/main.c
 create mode 100644 tools/tests/x86-decode-lite/x86-emulate.h

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index fc0ed8091510..ca4f0c707638 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -14,6 +14,7 @@ SUBDIRS-y += xenstore
 
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += tsx
+SUBDIRS-$(CONFIG_X86) += x86-decode-lite
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
diff --git a/tools/tests/x86-decode-lite/.gitignore b/tools/tests/x86-decode-lite/.gitignore
new file mode 100644
index 000000000000..e726b493c993
--- /dev/null
+++ b/tools/tests/x86-decode-lite/.gitignore
@@ -0,0 +1 @@
+test-x86-decode-lite
diff --git a/tools/tests/x86-decode-lite/Makefile b/tools/tests/x86-decode-lite/Makefile
new file mode 100644
index 000000000000..dc33d5fd173a
--- /dev/null
+++ b/tools/tests/x86-decode-lite/Makefile
@@ -0,0 +1,56 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET :=
+
+# Clang IAS doesn't like the convenience macros we use
+$(call cc-option-add,CFLAGS,CC,-no-integrated-as)
+
+# Binutils around 2.30 have mutually exclusive expectations of instruction
+# suffix validities compared to later versions.  Among the distro we test,
+# this only excludes Ubuntu 18.04.
+ifeq ($(shell echo 'asm(".code64;sysexitl");' | $(CC) -x c -c -o /dev/null 2>/dev/null - && echo y),y)
+TARGET += test-x86-decode-lite
+endif
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: run
+run: $(TARGET)
+	./$<
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGET) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)/tests
+	$(if $(TARGET),$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)/tests)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
+
+.PHONY: uninstall
+uninstall:
+
+vpath decode-lite.c $(XEN_ROOT)/xen/arch/x86/x86_emulate
+
+CFLAGS += $(CFLAGS_xeninclude) -I. -I$(XEN_ROOT)/xen/arch/x86
+CFLAGS += $(APPEND_CFLAGS)
+
+
+LDFLAGS += $(APPEND_LDFLAGS)
+
+%.o: Makefile
+
+$(TARGET): main.o insns.o decode-lite.o
+	$(CC) -o $@ $^ $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/x86-decode-lite/insns.S b/tools/tests/x86-decode-lite/insns.S
new file mode 100644
index 000000000000..dc017016b2d2
--- /dev/null
+++ b/tools/tests/x86-decode-lite/insns.S
@@ -0,0 +1,711 @@
+#include "macro-magic.h"
+
+        .code64
+
+        .allow_index_reg
+
+        .text
+
+DECL(tests_rel0)
+modrm:
+        /* Mod=0, Reg=0, RM {0..f} */
+        _ add %al, (%rax)
+        _ add %al, (%rcx)
+        _ add %al, (%rdx)
+        _ add %al, (%rbx)
+        _ add %al, (%rsp) /* SIB */
+        /*add %al, (%rbp)    RIP --> tests_rel4 */
+        _ add %al, (%rsi)
+        _ add %al, (%rdi)
+        _ add %al, (%r8)
+        _ add %al, (%r9)
+        _ add %al, (%r10)
+        _ add %al, (%r11)
+        _ add %al, (%r12) /* SIB */
+        /*add %al, (%r13)    RIP --> tests_rel4 */
+        _ add %al, (%r14)
+        _ add %al, (%r15)
+
+        /* Mod=1, Reg=0, RM {0..f} */
+        _ add %al, 0x01(%rax)
+        _ add %al, 0x01(%rcx)
+        _ add %al, 0x01(%rdx)
+        _ add %al, 0x01(%rbx)
+        _ add %al, 0x01(%rsp) /* SIB */
+        _ add %al, 0x01(%rbp)
+        _ add %al, 0x01(%rsi)
+        _ add %al, 0x01(%rdi)
+        _ add %al, 0x01(%r8)
+        _ add %al, 0x01(%r9)
+        _ add %al, 0x01(%r10)
+        _ add %al, 0x01(%r11)
+        _ add %al, 0x01(%r12) /* SIB */
+        _ add %al, 0x01(%r13)
+        _ add %al, 0x01(%r14)
+        _ add %al, 0x01(%r15)
+
+        /* Mod=2, Reg=0, RM {0..f} */
+        _ add %al, 0x7f000001(%rax)
+        _ add %al, 0x7f000001(%rcx)
+        _ add %al, 0x7f000001(%rdx)
+        _ add %al, 0x7f000001(%rbx)
+        _ add %al, 0x7f000001(%rsp) /* SIB */
+        _ add %al, 0x7f000001(%rbp)
+        _ add %al, 0x7f000001(%rsi)
+        _ add %al, 0x7f000001(%rdi)
+        _ add %al, 0x7f000001(%r8)
+        _ add %al, 0x7f000001(%r9)
+        _ add %al, 0x7f000001(%r10)
+        _ add %al, 0x7f000001(%r11)
+        _ add %al, 0x7f000001(%r12) /* SIB */
+        _ add %al, 0x7f000001(%r13)
+        _ add %al, 0x7f000001(%r14)
+        _ add %al, 0x7f000001(%r15)
+
+        /* Mod=3, Reg=0, RM {0..f} */
+        _ add %al, %al
+        _ add %al, %cl
+        _ add %al, %dl
+        _ add %al, %bl
+        _ add %al, %ah
+        _ add %al, %ch
+        _ add %al, %dh
+        _ add %al, %bh
+        _ add %al, %r8b
+        _ add %al, %r9b
+        _ add %al, %r10b
+        _ add %al, %r11b
+        _ add %al, %r12b
+        _ add %al, %r13b
+        _ add %al, %r14b
+        _ add %al, %r15b
+
+sib:
+        /* Mod=0, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
+        _ add %al, (%rax, %rax, 8)
+        _ add %al, (%rcx, %rax, 8)
+        _ add %al, (%rdx, %rax, 8)
+        _ add %al, (%rbx, %rax, 8)
+        _ add %al, (%rsp, %rax, 8)
+        _ add %al, (    , %rax, 8) /* "none", %rbp encoded with mod=1/2 */
+        _ add %al, (%rsi, %rax, 8)
+        _ add %al, (%rdi, %rax, 8)
+        _ add %al, (%r8,  %rax, 8)
+        _ add %al, (%r9,  %rax, 8)
+        _ add %al, (%r10, %rax, 8)
+        _ add %al, (%r11, %rax, 8)
+        _ add %al, (%r12, %rax, 8)
+        _ rex.b add %al,(,%rax, 8) /* "none", %r13 encoded with mod=1/2 */
+        _ add %al, (%r14, %rax, 8)
+        _ add %al, (%r15, %rax, 8)
+
+        /* Mod=1, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
+        _ add %al, 0x01(%rax, %rax, 8)
+        _ add %al, 0x01(%rcx, %rax, 8)
+        _ add %al, 0x01(%rdx, %rax, 8)
+        _ add %al, 0x01(%rbx, %rax, 8)
+        _ add %al, 0x01(%rsp, %rax, 8)
+        _ add %al, 0x01(%rbp, %rax, 8)
+        _ add %al, 0x01(%rsi, %rax, 8)
+        _ add %al, 0x01(%rdi, %rax, 8)
+        _ add %al, 0x01(%r8,  %rax, 8)
+        _ add %al, 0x01(%r9,  %rax, 8)
+        _ add %al, 0x01(%r10, %rax, 8)
+        _ add %al, 0x01(%r11, %rax, 8)
+        _ add %al, 0x01(%r12, %rax, 8)
+        _ add %al, 0x01(%r13, %rax, 8)
+        _ add %al, 0x01(%r14, %rax, 8)
+        _ add %al, 0x01(%r15, %rax, 8)
+
+        /* Mod=2, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
+        _ add %al, 0x7f000001(%rax, %rax, 8)
+        _ add %al, 0x7f000001(%rcx, %rax, 8)
+        _ add %al, 0x7f000001(%rdx, %rax, 8)
+        _ add %al, 0x7f000001(%rbx, %rax, 8)
+        _ add %al, 0x7f000001(%rsp, %rax, 8)
+        _ add %al, 0x7f000001(%rbp, %rax, 8)
+        _ add %al, 0x7f000001(%rsi, %rax, 8)
+        _ add %al, 0x7f000001(%rdi, %rax, 8)
+        _ add %al, 0x7f000001(%r8,  %rax, 8)
+        _ add %al, 0x7f000001(%r9,  %rax, 8)
+        _ add %al, 0x7f000001(%r10, %rax, 8)
+        _ add %al, 0x7f000001(%r11, %rax, 8)
+        _ add %al, 0x7f000001(%r12, %rax, 8)
+        _ add %al, 0x7f000001(%r13, %rax, 8)
+        _ add %al, 0x7f000001(%r14, %rax, 8)
+        _ add %al, 0x7f000001(%r15, %rax, 8)
+
+        /* Mod=0, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
+        _ add %al, (%rax, %riz, 8)
+        _ add %al, (%rcx, %riz, 8)
+        _ add %al, (%rdx, %riz, 8)
+        _ add %al, (%rbx, %riz, 8)
+        _ add %al, (%rsp, %riz, 8)
+        _ add %al, (    , %riz, 8) /* %rbp encoded with mod=1/2 */
+        _ add %al, (%rsi, %riz, 8)
+        _ add %al, (%rdi, %riz, 8)
+        _ add %al, (%r8,  %riz, 8)
+        _ add %al, (%r9,  %riz, 8)
+        _ add %al, (%r10, %riz, 8)
+        _ add %al, (%r11, %riz, 8)
+        _ add %al, (%r12, %riz, 8)
+        _ rex.b add %al,(,%riz, 8) /* %r13 encoded with mod=1/2 */
+        _ add %al, (%r14, %riz, 8)
+        _ add %al, (%r15, %riz, 8)
+
+        /* Mod=1, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
+        _ add %al, 0x01(%rax, %riz, 8)
+        _ add %al, 0x01(%rcx, %riz, 8)
+        _ add %al, 0x01(%rdx, %riz, 8)
+        _ add %al, 0x01(%rbx, %riz, 8)
+        _ add %al, 0x01(%rsp, %riz, 8)
+        _ add %al, 0x01(%rbp, %riz, 8)
+        _ add %al, 0x01(%rsi, %riz, 8)
+        _ add %al, 0x01(%rdi, %riz, 8)
+        _ add %al, 0x01(%r8,  %riz, 8)
+        _ add %al, 0x01(%r9,  %riz, 8)
+        _ add %al, 0x01(%r10, %riz, 8)
+        _ add %al, 0x01(%r11, %riz, 8)
+        _ add %al, 0x01(%r12, %riz, 8)
+        _ add %al, 0x01(%r13, %riz, 8)
+        _ add %al, 0x01(%r14, %riz, 8)
+        _ add %al, 0x01(%r15, %riz, 8)
+
+        /* Mod=2, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
+        _ add %al, 0x7f000001(%rax, %riz, 8)
+        _ add %al, 0x7f000001(%rcx, %riz, 8)
+        _ add %al, 0x7f000001(%rdx, %riz, 8)
+        _ add %al, 0x7f000001(%rbx, %riz, 8)
+        _ add %al, 0x7f000001(%rsp, %riz, 8)
+        _ add %al, 0x7f000001(%rbp, %riz, 8)
+        _ add %al, 0x7f000001(%rsi, %riz, 8)
+        _ add %al, 0x7f000001(%rdi, %riz, 8)
+        _ add %al, 0x7f000001(%r8,  %riz, 8)
+        _ add %al, 0x7f000001(%r9,  %riz, 8)
+        _ add %al, 0x7f000001(%r10, %riz, 8)
+        _ add %al, 0x7f000001(%r11, %riz, 8)
+        _ add %al, 0x7f000001(%r12, %riz, 8)
+        _ add %al, 0x7f000001(%r13, %riz, 8)
+        _ add %al, 0x7f000001(%r14, %riz, 8)
+        _ add %al, 0x7f000001(%r15, %riz, 8)
+
+
+.macro alu_ops op
+        _ \op %al, (%rax)
+        _ \op %eax, (%rax)
+        _ \op (%rax), %al
+        _ \op (%rax), %eax
+        _ \op $1, %al
+        _ \op $0x7f000001, %eax
+
+        /* Vary osize on imm fields */
+        _ data16 \op $1, %al
+        _ rex.w \op $1, %al
+        _ data16 rex.w \op $1, %al
+
+        _ \op $0x7f01, %ax
+        _ \op $0x7f000001, %rax
+        _ data16 \op $0x7f000001, %rax
+.endm
+
+onebyte_row_0x:
+        alu_ops add
+        alu_ops or
+
+onebyte_row_1x:
+        alu_ops adc
+        alu_ops sbb
+
+onebyte_row_2x:
+        alu_ops and
+        .code32
+        _ es nop
+        .code64
+        alu_ops sub
+        _ cs nop
+
+onebyte_row_3x:
+        alu_ops xor
+        .code32
+        _ ss nop
+        .code64
+        alu_ops cmp
+        _ ds nop
+
+/* onebyte_row_4x --> rex prefixes */
+
+onebyte_row_5x:
+        _ push %rax
+        _ push %rcx
+        _ push %rdx
+        _ push %rbx
+        _ push %rsp
+        _ push %rbp
+        _ push %rsi
+        _ push %rdi
+        _ pop %rax
+        _ pop %rcx
+        _ pop %rdx
+        _ pop %rbx
+        _ pop %rsp
+        _ pop %rbp
+        _ pop %rsi
+        _ pop %rdi
+
+onebyte_row_6x:
+        /*pusha,popa,bound --> not supported */
+        _ movsxd (%rax), %eax
+        _ movslq (%rax), %rax
+        _ fs nop
+        _ gs nop
+        _ data16 nop
+        /* addr32 --> not supported */
+        _ pushq $0x7f000001
+        _ pushw $0x7f01
+        _ rex.w pushq $0x7f000001
+        _ imul $0x7f01, %ax, %ax
+        _ imul $0x7f000001, %eax, %eax
+        _ imul $0x7f000001, %rax, %rax
+        _ pushq $0
+        _ pushw $0
+        _ rex.w pushq $0
+        _ imul $0, %ax, %ax
+        _ imul $0, %eax, %eax
+        _ imul $0, %rax, %rax
+        _ insb
+        _ insw
+        _ insl
+        _ outsb
+        _ outsw
+        _ outsl
+
+/* onebyte_row_7x: --> Jcc disp8 */
+
+onebyte_row_8x:
+        _ add $0, %cl /* Grp1 */
+        _ data16 add $0, %cl
+        _ rex.w add $0, %cl
+        _ add $0x7f01, %cx
+        _ add $0x7f000001, %ecx
+        _ add $0x7f000001, %rcx
+        _ add $0, %cx
+        _ add $0, %ecx
+        _ add $0, %rcx
+        _ test %cl, %cl
+        _ test %ecx, %ecx
+        _ xchg %cl, %cl
+        _ xchg %ecx, %ecx
+        _ mov %cl, (%rax)
+        _ mov %ecx, (%rax)
+        _ mov (%rax), %cl
+        _ mov (%rax), %ecx
+        _ mov %cs, (%rax)
+        _ lea (%rax), %eax
+        _ mov (%rax), %cs
+        /*pop mem --> Grp1a, Not supported (XOP prefix adjacent) */
+
+onebyte_row_9x:
+        _ nop
+        _ pause
+        _ xchg %ax, %ax
+        _ xchg %eax, %eax
+        _ xchg %rax, %rax
+        _ rex.w xchg %rax, %rax
+        _ cltq
+        _ cqto
+        _ wait
+        _ pushf
+        _ popf
+        _ sahf
+        _ lahf
+
+onebyte_row_Ax:
+        _ mov 0x8000000000000001, %al
+        _ mov 0x8000000000000001, %ax
+        _ mov 0x8000000000000001, %eax
+        _ mov 0x8000000000000001, %rax
+        _ mov %al,  0x8000000000000001
+        _ mov %ax,  0x8000000000000001
+        _ mov %eax, 0x8000000000000001
+        _ mov %rax, 0x8000000000000001
+        _ movsb
+        _ movsl
+        _ cmpsb
+        _ cmpsl
+        _ test $0, %al
+        _ test $0x80000001, %eax
+        _ test $0x7f000001, %rax
+        _ stosb
+        _ stosl
+        _ lodsb
+        _ lodsl
+        _ scasb
+        _ scasl
+
+onebyte_row_Bx:
+        _ mov $0, %al
+        _ mov $0, %cl
+        _ mov $0x7f01, %ax
+        _ mov $0x7f01, %cx
+        _ mov $0x7f000001, %eax
+        _ mov $0x7f000001, %ecx
+        _ mov $0x7f00000000000001, %rax
+        _ mov $0x7f00000000000001, %rcx
+
+onebyte_row_Cx:
+        _ rol $0, %al /* Grp2 */
+        _ rol $0, %ax
+        _ rol $0, %eax
+        _ rol $0, %rax
+        /*ret $0 --> not supported */
+        _ ret
+        /*les,lds --> not supported */
+        _ movb $0, (%rax) /* Grp11 */
+        _ movw $0, (%rax)
+        _ movl $0, (%rax)
+        _ movq $0, (%rax)
+        /*xbegin (Grp11) --> disp32 */
+        /*enter,leave,lretq $0 --> not supported */
+        _ lretq
+        _ int3
+        _ int $0
+        /*into,iret --> not supported */
+
+onebyte_row_Dx:
+        _ rol $1, %al /* Grp2 */
+        _ rol $1, %ax
+        _ rol $1, %eax
+        _ rol $1, %rax
+        _ rol %cl, %al
+        _ rol %cl, %ax
+        _ rol %cl, %eax
+        _ rol %cl, %rax
+        /*aam,aad --> not supported */
+        n "udb" .byte 0xd6
+        /*xlat,d8...df --> not supported */
+
+onebyte_row_Ex:
+        /*loop{ne,e,},jrcxz --> not supported */
+        _ in $0, %al
+        _ in $0, %eax
+        _ out %al,  $0
+        _ out %eax, $0
+        /*call,jmp --> disp32 */
+        /*ljmp --> not supported */
+        /*jmp --> disp8 */
+        _ in %dx, %al
+        _ in %dx, %eax
+        _ out %al,  %dx
+        _ out %eax, %dx
+
+onebyte_row_Fx:
+        _ lock addb $0, (%rax)
+        n "icebp" .byte 0xf1
+        _ repne nop
+        _ repe nop
+        _ hlt
+        _ cmc
+        _ test $0, %cl /* Grp3, /0 has extra Imm{8,} */
+        _ not %cl
+        _ test $0x7f01, %cx
+        _ not %cx
+        _ test $0x7f000001, %ecx
+        _ not %ecx
+        _ test $0x7f000001, %rcx
+        _ not %rcx
+        _ clc
+        _ stc
+        _ cli
+        _ sti
+        _ cld
+        _ std
+        _ inc %cl /* Grp4 */
+        _ dec %cl
+        _ inc %ecx /* Grp5 */
+        _ dec %ecx
+        _ call *(%rax)
+        _ lcall *(%rax)
+        _ jmp *(%rax)
+        _ ljmp *(%rax)
+        _ push (%rax)
+
+twobyte_row_0x:
+        _ sldt (%rax) /* Grp6 */
+        _ sgdt (%rax) /* Grp7 */
+        _ lar (%rax), %eax
+        _ lsl (%rax), %eax
+        _ ud2a
+
+twobyte_row_1x:
+        _ prefetchnta (%rax) /* Grp16 (Hint Nop) */
+        _ nopl (%rax)
+
+twobyte_row_2x:
+        _ mov %cr0, %rax
+        _ mov %dr0, %rax
+        _ mov %rax, %cr0
+        _ mov %rax, %dr0
+
+twobyte_row_3x:
+        _ wrmsr
+        _ rdtsc
+        _ rdmsr
+        _ rdpmc
+
+twobyte_row_4x:
+        _ cmovo (%rax), %eax
+        _ cmovg (%rax), %eax
+
+/* twobyte_row_8x: --> Jcc disp32 */
+
+twobyte_row_9x:
+        _ seto (%rax)
+        _ setg (%rax)
+
+twobyte_row_Ax:
+        _ push %fs
+        _ pop %fs
+        _ cpuid
+        _ bt %eax, (%rax)
+        _ shld $0, %ax, (%rax)
+        _ shld $0, %eax, (%rax)
+        _ shld $0, %rax, (%rax)
+        _ shld %cl, %ax, (%rax)
+        _ shld %cl, %eax, (%rax)
+        _ shld %cl, %rax, (%rax)
+        _ push %gs
+        _ pop %gs
+        /*rsm --> not supported */
+        _ bts %eax, (%rax)
+        _ shrd $0, %ax, (%rax)
+        _ shrd $0, %eax, (%rax)
+        _ shrd $0, %rax, (%rax)
+        _ shrd %cl, %ax, (%rax)
+        _ shrd %cl, %eax, (%rax)
+        _ shrd %cl, %rax, (%rax)
+        _ fxsave (%rax) /* Grp15 */
+        _ imul (%rax), %eax
+
+twobyte_row_Bx:
+        _ cmpxchg %al, (%rax)
+        _ cmpxchg %eax, (%rax)
+        _ lss (%rax), %eax
+        _ btr %eax, (%rax)
+        _ lfs (%rax), %eax
+        _ lgs (%rax), %eax
+        _ movzbl (%rax), %eax
+        _ movzwl (%rax), %eax
+        _ popcnt (%rax), %eax
+        _ ud1 (%rax), %eax /* Grp10 */
+        _ bt $0, %ax /* Grp8 */
+        _ bt $0, %eax
+        _ bt $0, %rax
+        _ btc %eax, (%rax)
+        _ bsf (%rax), %eax
+        _ bsr (%rax), %eax
+        _ movsbl (%rax), %eax
+        _ movswl (%rax), %eax
+
+twobyte_row_Cx:
+        _ xadd %al, (%rax)
+        _ xadd %eax, (%rax)
+        _ cmpxchg8b (%rax) /* Grp9 */
+        _ bswap %eax
+        _ bswap %edi
+
+END(tests_rel0)
+
+DECL(tests_rel1)
+disp8:
+1:
+        _ jo   1b
+        _ jno  1b
+        _ jb   1b
+        _ jae  1b
+        _ je   1b
+        _ jne  1b
+        _ jbe  1b
+        _ ja   1b
+        _ js   1b
+        _ jns  1b
+        _ jp   1b
+        _ jnp  1b
+        _ jl   1b
+        _ jge  1b
+        _ jle  1b
+        _ jg   1b
+        _ jmp  1b
+
+disp8_rex:
+        _ rex.w jo   1b
+        _ rex.w jno  1b
+        _ rex.w jb   1b
+        _ rex.w jae  1b
+        _ rex.w je   1b
+        _ rex.w jne  1b
+        _ rex.w jbe  1b
+        _ rex.w ja   1b
+        _ rex.w js   1b
+        _ rex.w jns  1b
+        _ rex.w jp   1b
+        _ rex.w jnp  1b
+        _ rex.w jl   1b
+        _ rex.w jge  1b
+        _ rex.w jle  1b
+        _ rex.w jg   1b
+        _ rex.w jmp  1b
+END(tests_rel1)
+
+DECL(tests_rel4)
+disp32:
+        _ call   other_section
+        _ jmp    other_section
+        _ jo     other_section
+        _ jno    other_section
+        _ jb     other_section
+        _ jae    other_section
+        _ je     other_section
+        _ jne    other_section
+        _ jbe    other_section
+        _ ja     other_section
+        _ js     other_section
+        _ jns    other_section
+        _ jp     other_section
+        _ jnp    other_section
+        _ jl     other_section
+        _ jge    other_section
+        _ jle    other_section
+        _ jg     other_section
+        _ xbegin other_section
+
+disp32_rex:
+        _ rex.w call   other_section
+        _ rex.w jmp    other_section
+        _ rex.w jo     other_section
+        _ rex.w jno    other_section
+        _ rex.w jb     other_section
+        _ rex.w jae    other_section
+        _ rex.w je     other_section
+        _ rex.w jne    other_section
+        _ rex.w jbe    other_section
+        _ rex.w ja     other_section
+        _ rex.w js     other_section
+        _ rex.w jns    other_section
+        _ rex.w jp     other_section
+        _ rex.w jnp    other_section
+        _ rex.w jl     other_section
+        _ rex.w jge    other_section
+        _ rex.w jle    other_section
+        _ rex.w jg     other_section
+        _ rex.w xbegin other_section
+
+riprel:
+        _ add %al, 0(%rip)
+        _ rex.b add %al, 0(%rip)
+
+        _ addb $1, 0(%rip)
+        _ rex.b addb $1, 0(%rip)
+
+        _ addl $0x7f000001, 0(%rip)
+        _ rex.b addl $0x7f000001, 0(%rip)
+END(tests_rel4)
+
+DECL(tests_unsup)
+
+unsup_prefix: /* Prefixes unimplemented for simplicity. */
+        _ vaddpd %zmm0, %zmm0, %zmm0 /* 0x62 EVEX */
+        _ addr32 nop                 /* 0x67 Address size override */
+        _ bextr $0, %eax, %eax       /* 0x8f XOP */
+        _ bextr %eax, %eax, %eax     /* 0xc4 VEX3 */
+        _ vaddpd %ymm0, %ymm0, %ymm0 /* 0xc5 VEX2 */
+        n "jmpabs 0" .byte 0xd5, 0x00, 0xa1, 0x01, 0, 0, 0, 0, 0, 0, 0x80 /* 0xd5 REX2 */
+        _ fadds (%rax)               /* 0xd8 ... 0xdf ESCAPE (x87) */
+        _ femms                      /* 0x0f,0x0e ... 0x0f 3DNOW */
+
+unsup_branch:
+1:
+        _ loopne 1b
+        _ loope  1b
+        _ loop   1b
+        _ jrcxz  1b
+
+opsize_branch: /* 66-prefixed branches are decoded differently by vendors */
+        _ data16 call   other_section
+        _ data16 jmp    other_section
+        _ data16 jo     other_section
+        _ data16 jno    other_section
+        _ data16 jb     other_section
+        _ data16 jae    other_section
+        _ data16 je     other_section
+        _ data16 jne    other_section
+        _ data16 jbe    other_section
+        _ data16 ja     other_section
+        _ data16 js     other_section
+        _ data16 jns    other_section
+        _ data16 jp     other_section
+        _ data16 jnp    other_section
+        _ data16 jl     other_section
+        _ data16 jge    other_section
+        _ data16 jle    other_section
+        _ data16 jg     other_section
+        _ data16 xbegin other_section
+
+not_64bit: /* Not valid/encodable in 64bit mode */
+        .code32
+        _ push %es
+        _ pop %es
+        _ push %cs
+        _ push %ss
+        _ pop %ss
+        _ push %ds
+        _ pop %ds
+        _ daa
+        _ das
+        _ aaa
+        _ aas
+        _ pusha
+        _ popa
+        _ bound %eax, (%eax)
+        /*arpl %ax, %ax --> movsxd in 64bit mode */
+        /* Grp1 */
+        _ lcall $-1, $-1
+        _ les (%eax), %eax
+        _ lds (%eax), %eax
+        _ into
+        _ aam $0
+        _ aad $0 /* Also REX2, also not supported */
+        _ ljmp $-1, $-1
+        .code64
+
+unsup_insn: /* Instructions that would complicated decode, or shouldn't be used */
+        _ ret $0
+        _ enter $0, $0
+        _ leave
+        _ lretq $0
+        _ iretq
+        _ xlat
+        _ clts
+        _ wbinvd
+        _ syscall
+        _ sysretl
+        _ invd
+        _ sysenter
+        _ sysexitl
+        _ rsm
+
+END(tests_unsup)
+
+        /*
+         * For improved diagnostics, we allow some overreading of the
+         * instruction under test.  Ensure there are good bytes to read.
+         */
+overread_padding:
+        .skip 20
+
+        /* This is here to cause jmps to use their disp32 form. */
+        .section .text.other_section, "ax", @progbits
+other_section:
+        int3
+
+        /* Mark this file as not needing executable stacks. */
+        .section  .note.GNU-stack, "", @progbits
diff --git a/tools/tests/x86-decode-lite/macro-magic.h b/tools/tests/x86-decode-lite/macro-magic.h
new file mode 100644
index 000000000000..b3c8aae39acd
--- /dev/null
+++ b/tools/tests/x86-decode-lite/macro-magic.h
@@ -0,0 +1,62 @@
+#ifndef X86_DECODE_LITE_LINKAGE_H
+#define X86_DECODE_LITE_LINKAGE_H
+
+#ifdef __i386__
+# define PTR_ALIGN 4
+# define PTR .long
+#else
+# define PTR_ALIGN 8
+# define PTR .quad
+#endif
+
+
+/* Start a 'struct test' array */
+.macro start_arr aname
+    .pushsection .data.rel.ro.\aname, "aw", @progbits
+    .globl \aname
+    .align PTR_ALIGN
+    .type \aname, STT_OBJECT
+\aname:
+    .popsection
+
+    /* Declare a macro wrapping \aname */
+    .macro pushsection_arr
+    .pushsection .data.rel.ro.\aname, "aw", @progbits
+    .endm
+.endm
+
+/* Macro 'n' to wrap the metadata of an instruction.  Name can be different. */
+.macro n name:req insn:vararg
+    /* Emit the instruction, with start & end markers. */
+.Ls\@: \insn
+.Le\@:
+
+    /* Emit \name as a string. */
+    .pushsection .rodata.str1, "aMS", @progbits, 1
+.Ln\@: .asciz "\name"
+    .popsection
+
+    /* Emit an entry into the array. */
+    pushsection_arr
+    PTR .Ln\@, .Ls\@, .Le\@ - .Ls\@
+    .popsection
+.endm
+
+/* Macro '_' where the name is the instruction itself. */
+.macro _ insn:vararg
+    n "\insn" \insn
+.endm
+
+/* Finish a 'struct test' array */
+.macro finish_arr aname
+    pushsection_arr
+    PTR 0, 0, 0
+    .size \aname, . - \aname
+    .popsection
+    .purgem pushsection_arr
+.endm
+
+#define DECL(aname) start_arr aname
+#define END(aname) finish_arr aname
+
+#endif /* X86_DECODE_LITE_LINKAGE_H */
diff --git a/tools/tests/x86-decode-lite/main.c b/tools/tests/x86-decode-lite/main.c
new file mode 100644
index 000000000000..08e9e8ad231a
--- /dev/null
+++ b/tools/tests/x86-decode-lite/main.c
@@ -0,0 +1,113 @@
+/*
+ * Userspace test harness for x86_decode_lite().
+ */
+#include <stdio.h>
+
+#include "x86-emulate.h"
+
+static unsigned int nr_failures;
+#define fail(t, fmt, ...)                                       \
+({                                                              \
+    const unsigned char *insn = (t)->ip;                        \
+                                                                \
+    nr_failures++;                                              \
+                                                                \
+    (void)printf("  Fail '%s' [%02x", (t)->name, *insn);        \
+    for ( unsigned int i = 1; i < (t)->len; i++ )               \
+        printf(" %02x", insn[i]);                               \
+    printf("]\n");                                              \
+                                                                \
+    (void)printf(fmt, ##__VA_ARGS__);                           \
+})
+
+struct test {
+    const char *name;
+    void *ip;
+    unsigned long len;
+};
+
+extern const struct test
+/* Defined in insns.S, ends with sentinel */
+    tests_rel0[], /* No relocatable entry */
+    tests_rel1[], /* disp8 */
+    tests_rel4[], /* disp32 or RIP-relative */
+    tests_unsup[]; /* Unsupported instructions */
+
+static inline void run_tests(const struct test *tests, unsigned int rel_sz)
+{
+    printf("Test rel%u\n", rel_sz);
+
+    for ( unsigned int i = 0; tests[i].name; ++i )
+    {
+        const struct test *t = &tests[i];
+        x86_decode_lite_t r;
+
+        /*
+         * Don't end strictly at t->len.  This provides better diagnostics if
+         * too many bytes end up getting consumed.  (Because of the tests
+         * being one single section, this doesn't read out of bounds
+         * anywhere)
+         */
+        r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
+
+        if ( r.len == 0 )
+        {
+            fail(t, "    Failed to decode instruction\n");
+
+            if ( r.rel_sz != 0 || r.rel )
+                fail(t, "    Rel/sz despite no decode\n");
+
+            continue;
+        }
+
+        if ( r.len != t->len )
+        {
+            fail(t, "    Expected length %lu, got %u\n",
+                 t->len, r.len);
+            continue;
+        }
+
+        if ( r.rel_sz != rel_sz )
+        {
+            fail(t, "    Expected relocation size %u, got %u\n",
+                 rel_sz, r.rel_sz);
+            continue;
+        }
+
+        if ( r.rel_sz &&
+             (r.rel < t->ip ||
+              r.rel > t->ip + t->len ||
+              r.rel + r.rel_sz > t->ip + t->len) )
+        {
+            fail(t, "    Rel [%p,+%u) outside insn [%p,+%lu)\n",
+                 r.rel, r.rel_sz, t->ip, t->len);
+            continue;
+        }
+    }
+}
+
+static void run_tests_unsup(const struct test *tests)
+{
+    printf("Test unsup\n");
+
+    for ( unsigned int i = 0; tests[i].name; ++i )
+    {
+        const struct test *t = &tests[i];
+        x86_decode_lite_t r = x86_decode_lite(t->ip, t->ip + t->len);
+
+        if ( r.len )
+            fail(t, "    Got len %u\n", r.len);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    printf("Tests for x86_decode_lite()\n");
+
+    run_tests(tests_rel0, 0);
+    run_tests(tests_rel1, 1);
+    run_tests(tests_rel4, 4);
+    run_tests_unsup(tests_unsup);
+
+    return !!nr_failures;
+}
diff --git a/tools/tests/x86-decode-lite/x86-emulate.h b/tools/tests/x86-decode-lite/x86-emulate.h
new file mode 100644
index 000000000000..337718869435
--- /dev/null
+++ b/tools/tests/x86-decode-lite/x86-emulate.h
@@ -0,0 +1,29 @@
+#ifndef X86_EMULATE_H
+#define X86_EMULATE_H
+
+#include <assert.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xen/asm/x86-defns.h>
+#include <xen/asm/x86-event.h>
+#include <xen/asm/x86-types.h>
+#include <xen/asm/x86-vendors.h>
+
+#include <xen-tools/common-macros.h>
+
+#define ASSERT assert
+
+#define printk(...)
+
+#define likely
+#define unlikely
+#define cf_check
+#define init_or_livepatch
+#define init_or_livepatch_const
+
+#include "x86_emulate/x86_emulate.h"
+
+#endif /* X86_EMULATE_H */
-- 
2.39.5


