Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAC4FF8867
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2026 07:23:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1297022.1573168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHzFu-00016x-R7; Wed, 29 Apr 2026 07:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297022.1573168; Wed, 29 Apr 2026 07:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHzFu-00016q-OT; Wed, 29 Apr 2026 07:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1297022;
 Wed, 29 Apr 2026 07:22:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wHzFt-00016k-W8
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:22:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHzFr-001Yuw-Bi
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 09:22:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f1b1bf-5cb7-0a2a0a5109dd-0a2a4508e4ea-46
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 09:22:44 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f1b1c3-63b5-0a2a45080019-a0658309baa8-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 09:22:44 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id AE9E081D7239;
 Wed, 29 Apr 2026 03:21:42 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Improved reStructuredText formatting of Misra C Rules
Date: Wed, 29 Apr 2026 08:22:13 +0100
Message-Id: <c6dffce6d424e98911a8a12ad0a868ff00c89345.1777447317.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777447364-C0965DB1-8E1E7D20/0/0
X-purgate-type: clean
X-purgate-size: 6351

Code blocks in the RFC rules can be converted as C syntax-highlighted
pretty pieces of code using `.. code:: C` inline elements:
https://docutils.sourceforge.io/docs/ref/rst/directives.html#code

For reference, the current formatting used are 'Indented Literal Blocks':
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#toc-entry-23

In this example, docs/misra/rules.rst, line 128 starts an Indented
Literal Block by ending the paragraph with "violations::"
(note the :: at then end of the paragraph which is enables it):

         - Functions that are no-return due to calls to the `ASSERT_UNREACHABLE()`
           macro in debug build configurations are not considered violations::

              static inline bool
              arch_vcpu_ioreq_completion(enum vio_completion completion)
              {
                  ASSERT_UNREACHABLE();
                  return false;
              }

Format such code blocks as C code blocks and apply ``function()`` around
functions to make them inline linterals for monospace formatting.
Also make some code blocks less wide to fit into the column of the table.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
Of course, this is only a 1st step,
it may be extended further in further merges.

Preview based on the theme update submitted yesterday:
https://lists.xen.org/archives/html/xen-devel/2026-04/msg01375.html:

https://bernhard-xen.readthedocs.io/en/misra-rules-format-rfc/misra/rules.html

BTW: The way the ReadTheDocs (RTD) theme has another issue where it
applies: 'td { white-space: nowrap; }' to all table data,
preventing wrapping lines inside long table cells:
https://xenbits.xen.org/docs/sphinx-unstable/misra/rules.html

This mostly shows on xenbits for me, but this is a widely known RTD bug.
The RTD Sphinx devs see this bug as a feature, and are unwilling to fix:
https://github.com/readthedocs/sphinx_rtd_theme/issues/139 (example bug)

There are workarounds, but to better address this 1st step, I propose to
add a theme which does not appear to have this issue (and also has a
more modern look and feel with auto dark mode support (can be switched
to bright mode and darm mode directly as well):

https://lists.xen.org/archives/html/xen-devel/2026-04/msg01375.html
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 docs/misra/rules.rst | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index fc6fdfd313d0..82412e819846 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -115,20 +115,29 @@ maintainers if you want to suggest a change.
      - Required
      - A project shall not contain unreachable code
      - The following are allowed:
-         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
+         - Invariantly constant conditions, e.g.
+
+           .. code:: C
+
+              if ( IS_ENABLED(CONFIG_HVM) ) {
+                S;
+              }
+
          - Switch with a controlling value statically determined not to
            match one or more case statements
          - Functions that are intended to be referenced only from
-           assembly code (e.g. 'do_trap_fiq')
-         - asm-offsets.c, as they are not linked deliberately, because
+           assembly code (e.g. ``do_trap_fiq``)
+         - ``asm-offsets.c``, as they are not linked deliberately, because
            they are used to generate definitions for asm modules
          - Declarations without initializer are safe, as they are not
            executed
-         - Functions that are no-return due to calls to the `ASSERT_UNREACHABLE()`
-           macro in debug build configurations are not considered violations::
+         - Functions that are no-return due to calls to the ``ASSERT_UNREACHABLE()``
+           macro in debug build configurations are not considered violations:
+
+           .. code:: C
 
               static inline bool
-              arch_vcpu_ioreq_completion(enum vio_completion completion)
+              arch_vcpu_ioreq_completion(int c)
               {
                   ASSERT_UNREACHABLE();
                   return false;
@@ -141,13 +150,13 @@ maintainers if you want to suggest a change.
 
    * - `Rule 3.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_01.c>`_
      - Required
-     - The character sequences /* and // shall not be used within a
+     - The character sequences ``/*`` and ``//`` shall not be used within a
        comment
      - Comments containing URLs inside C-style block comments are safe
 
    * - `Rule 3.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c>`_
      - Required
-     - Line-splicing shall not be used in // comments
+     - Line-splicing shall not be used in ``//`` comments
      -
 
    * - `Rule 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_04_01.c>`_
@@ -207,16 +216,20 @@ maintainers if you want to suggest a change.
 
        Clashes between bitops functions and macro names are allowed
        because they are used for input validation and error handling.
-       Example::
+       Example:
 
-           static inline void set_bit(int nr, volatile void *addr)
+       .. code:: C
+
+           static inline void set_bit(int nr, volatile void *a)
            {
-               asm volatile ( "lock btsl %1,%0"
-                              : "+m" (ADDR) : "Ir" (nr) : "memory");
+               asm volatile ( "lock btsl %1,%0 "
+                              : "+m" (a)
+                              : "Ir" (nr) : "memory");
            }
-           #define set_bit(nr, addr) ({                            \
-               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-               set_bit(nr, addr);                                  \
+
+           #define set_bit(nr, addr) ({                       \
+               if ( bitop_bad_size(addr) ) __bitop_bad_size();\
+               set_bit(nr, addr);                             \
            })
 
        Clashes between grant table functions and macro names are allowed
-- 
2.39.5


