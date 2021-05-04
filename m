Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F35C433ED
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 13:32:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EB6610A7
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 13:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6EB6610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122397.230882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvA1-0003y3-1j; Tue, 04 May 2021 13:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122397.230882; Tue, 04 May 2021 13:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvA0-0003xw-UV; Tue, 04 May 2021 13:32:24 +0000
Received: by outflank-mailman (input) for mailman id 122397;
 Tue, 04 May 2021 13:32:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8884=J7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ldv9z-0003nw-9s
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:32:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4ce2a06-0283-4f51-99ab-0c1796251262;
 Tue, 04 May 2021 13:32:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06073ED1;
 Tue,  4 May 2021 06:31:54 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E25F3F73B;
 Tue,  4 May 2021 06:31:52 -0700 (PDT)
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
X-Inumbo-ID: c4ce2a06-0283-4f51-99ab-0c1796251262
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/3] Use Doxygen and sphinx for html documentation
Date: Tue,  4 May 2021 14:31:42 +0100
Message-Id: <20210504133145.767-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduce doxygen in the sphinx html docs generation.
One benefit is to keep most of the documentation in the source
files of xen so that it's more maintainable, on the other hand
there are some limitation of doxygen that should be addressed
modifying the current codebase (for example doxygen can't parse
anonymous structure/union).

To reproduce the documentation xen must be compiled because
most of the headers are generated on compilation time from
the makefiles.

Here follows the steps to generate the sphinx html docs, some
package may be required on your machine, everything is suggested
by the autoconf script.
Here I'm building the arm64 docs (the only introduced for now by
this serie):

./configure
make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-" menuconfig
make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-"
make -C docs XEN_TARGET_ARCH="arm64" sphinx-html

now in docs/sphinx/html/ we have the generated docs starting
from the index.html page.

Luca Fancellu (3):
  docs: add doxygen support for html documentation
  docs: hypercalls sphinx skeleton for generated html
  docs/doxygen: doxygen documentation for grant_table.h

 .gitignore                                    |    7 +
 config/Docs.mk.in                             |    2 +
 docs/Makefile                                 |   46 +-
 docs/conf.py                                  |   48 +-
 docs/configure                                |  258 ++
 docs/configure.ac                             |   15 +
 docs/hypercall-interfaces/arm32.rst           |    4 +
 docs/hypercall-interfaces/arm64.rst           |   33 +
 .../common/grant_tables.rst                   |    8 +
 docs/hypercall-interfaces/index.rst.in        |    7 +
 docs/hypercall-interfaces/x86_64.rst          |    4 +
 docs/index.rst                                |    8 +
 docs/xen-doxygen/customdoxygen.css            |   36 +
 docs/xen-doxygen/doxy-preprocessor.py         |  110 +
 docs/xen-doxygen/doxy_input.list              |    1 +
 docs/xen-doxygen/doxygen_include.h.in         |   32 +
 docs/xen-doxygen/footer.html                  |   21 +
 docs/xen-doxygen/header.html                  |   56 +
 docs/xen-doxygen/mainpage.md                  |    5 +
 docs/xen-doxygen/xen_project_logo_165x67.png  |  Bin 0 -> 18223 bytes
 docs/xen.doxyfile.in                          | 2316 +++++++++++++++++
 m4/ax_python_module.m4                        |   56 +
 m4/docs_tool.m4                               |    9 +
 xen/include/public/grant_table.h              |   66 +-
 24 files changed, 3118 insertions(+), 30 deletions(-)
 create mode 100644 docs/hypercall-interfaces/arm32.rst
 create mode 100644 docs/hypercall-interfaces/arm64.rst
 create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
 create mode 100644 docs/hypercall-interfaces/index.rst.in
 create mode 100644 docs/hypercall-interfaces/x86_64.rst
 create mode 100644 docs/xen-doxygen/customdoxygen.css
 create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
 create mode 100644 docs/xen-doxygen/doxy_input.list
 create mode 100644 docs/xen-doxygen/doxygen_include.h.in
 create mode 100644 docs/xen-doxygen/footer.html
 create mode 100644 docs/xen-doxygen/header.html
 create mode 100644 docs/xen-doxygen/mainpage.md
 create mode 100644 docs/xen-doxygen/xen_project_logo_165x67.png
 create mode 100644 docs/xen.doxyfile.in
 create mode 100644 m4/ax_python_module.m4

-- 
2.17.1


