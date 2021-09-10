Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_03_06,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD66C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 16:13:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B7A6124D
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 16:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20B7A6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184576.333279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj9D-0006de-Cb; Fri, 10 Sep 2021 16:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184576.333279; Fri, 10 Sep 2021 16:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj9D-0006dV-94; Fri, 10 Sep 2021 16:13:03 +0000
Received: by outflank-mailman (input) for mailman id 184576;
 Fri, 10 Sep 2021 16:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOj9C-0006Mo-8Z
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 16:13:02 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5969009-43a6-454c-8afc-04b5103295e9;
 Fri, 10 Sep 2021 16:13:01 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631290372344276.49709791440694;
 Fri, 10 Sep 2021 09:12:52 -0700 (PDT)
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
X-Inumbo-ID: e5969009-43a6-454c-8afc-04b5103295e9
ARC-Seal: i=1; a=rsa-sha256; t=1631290375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NbcvrcfBQp9+lo4wOZaNruDGRNjgGTsmc/WlQ0wfS3uPwT8RmDhZqESzWGo5D8zqqP6aADEy78h8KOt99J+Ka60zOvjFJQy+6hcLBJG9M5ENwsQ0m4Ww18GyrqGGYo56pChthlBVaspsl0bnrFZdqs8mAVIh+mwxzd+glODztho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631290375; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tLQ4wb+FrQv7YprfemUlYGSVQiae5X1F/rSp63hNSzo=; 
	b=BqW/PhIxreNOFzDfzGghyPUJXNjckJ4PuCCBTpm9KQWEl7zWI0iVnqcwrwxg8KKU6oEj6d8i7ZT7l4SHA6XczoG2iuVOPxAR0fdsw6vXVSHj0/4t8HaPIsiCOpfL2OrWAC7YAwvnl8z9L0hALGGb2NTjXfXqpZmDNeAvH3fAdDk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631290375;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tLQ4wb+FrQv7YprfemUlYGSVQiae5X1F/rSp63hNSzo=;
	b=Y1NDr+IeQvHJnFHw3K9gOCe0QP4uipoZhPVw0XLjaLmwta1fUBNx9pZou4khacaU
	nzOJ61ipmq7gTYJePV7KKECJDW/1f1HP3mX4RpwHct0HbuKd61rxryMqfO9NirsWKEI
	L64L5Bgian5hVSzR504RcgwP/CwisP6v65skoajo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 01/10] xen: Implement xen/alternative-call.h for use in common code
Date: Fri, 10 Sep 2021 16:12:56 -0400
Message-Id: <20210910201305.32526-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910201305.32526-1-dpsmith@apertussolutions.com>
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Andrew Cooper <andrew.cooper3@citrix.com>

The alternative call infrastructure is x86-only for now, but the common iommu
code has a variant and more common code wants to use the infrastructure.

Introduce CONFIG_ALTERNATIVE_CALL and a conditional implemetnation so common
code can use the optimisation when available, without requiring all
architectures to implement no-op stubs.

Write some documentation, which was thus far entirely absent, covering the
requirements for an architecture to implement this optimsiation, and how to
use the infrastructure in general code.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v3:
 * Drop __alt_call_maybe_initconst

This is a pre-requisite to "xsm: refactor xsm_ops handling" to avoid breaking
the ARM build.

Build test for the XSM code:

  diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
  index 5eab21e1b168..592074e8f41c 100644
  --- a/xen/xsm/xsm_core.c
  +++ b/xen/xsm/xsm_core.c
  @@ -195,6 +195,16 @@ bool __init has_xsm_magic(paddr_t start)
   }
    #endif

  +#include <xen/alternative-call.h>
  +struct foo {
  +    int (*bar)(void *);
  +} foo __alt_call_maybe_initdata;
  +
  +int test_alternative_call(void)
  +{
  +    return alternative_call(foo.bar, NULL);
  +}
  +
   int __init register_xsm(struct xsm_operations *ops)
    {
         if ( verify(ops) )
---
 xen/arch/x86/Kconfig               |  1 +
 xen/common/Kconfig                 |  3 ++
 xen/include/xen/alternative-call.h | 63 ++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 xen/include/xen/alternative-call.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9b164db641..1f83518ee0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..ac5491b1cc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -22,6 +22,9 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config ALTERNATIVE_CALL
+	bool
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
new file mode 100644
index 0000000000..c0be270e28
--- /dev/null
+++ b/xen/include/xen/alternative-call.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef XEN_ALTERNATIVE_CALL
+#define XEN_ALTERNATIVE_CALL
+
+/*
+ * Some subsystems in Xen may have multiple implementions, which can be
+ * resolved to a single implementation at boot time.  By default, this will
+ * result in the use of function pointers.
+ *
+ * Some architectures may have mechanisms for dynamically modifying .text.
+ * Using this mechnaism, function pointers can be converted to direct calls
+ * which are typically more efficient at runtime.
+ *
+ * For architectures to support:
+ *
+ * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
+ *   requirements are to emit a function pointer call at build time, and stash
+ *   enough metadata to simplify the call at boot once the implementation has
+ *   been resolved.
+ * - Select ALTERNATIVE_CALL in Kconfig.
+ *
+ * To use:
+ *
+ * Consider the following simplified example.
+ *
+ *  1) struct foo_ops __alt_call_maybe_initdata ops;
+ *
+ *  2) const struct foo_ops __initconstrel foo_a_ops = { ... };
+ *     const struct foo_ops __initconstrel foo_b_ops = { ... };
+ *
+ *     void __init foo_init(void)
+ *     {
+ *         ...
+ *         if ( use_impl_a )
+ *             ops = *foo_a_ops;
+ *         else if ( use_impl_b )
+ *             ops = *foo_b_ops;
+ *         ...
+ *     }
+ *
+ *  3) alternative_call(ops.bar, ...);
+ *
+ * There needs to a single ops object (1) which will eventually contain the
+ * function pointers.  This should be populated in foo's init() function (2)
+ * by one of the available implementations.  To call functions, use
+ * alternative_{,v}call() referencing the main ops object (3).
+ */
+
+#ifdef CONFIG_ALTERNATIVE_CALL
+
+#include <asm/alternative.h>
+
+#define __alt_call_maybe_initdata __initdata
+
+#else
+
+#define alternative_call(func, args...)  (func)(args)
+#define alternative_vcall(func, args...) (func)(args)
+
+#define __alt_call_maybe_initdata __read_mostly
+
+#endif /* !CONFIG_ALTERNATIVE_CALL */
+#endif /* XEN_ALTERNATIVE_CALL */
-- 
2.20.1


