Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB44CFCB61E
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2026 16:26:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247919.1546297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyXzu-0000xD-NN; Fri, 06 Mar 2026 16:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247919.1546297; Fri, 06 Mar 2026 16:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyXzu-0000wN-JU; Fri, 06 Mar 2026 16:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1247919;
 Fri, 06 Mar 2026 16:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/aL=BG=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vyXzt-0000to-MV
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:25:53 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 220ad409-1979-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:25:48 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 093EE81CB7A9;
 Fri,  6 Mar 2026 11:25:12 -0500 (EST)
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
X-Inumbo-ID: 220ad409-1979-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 0/1] avoid duplicate symbol errors with clang
Date: Fri,  6 Mar 2026 16:25:42 +0000
Message-ID: <cover.1772813802.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous attempt with .ifndef is not necessarily always correct,
and may lead to subtle bugs. The instructions executed from the
emulator would always come from the first (and now only) labeled block.
Although the approach worked with the existing tests, it may have broken
again when more instructions are added in the future.

Using -O0 achieves the same outcome as the .ifndef patch (being able to
compile the tests with clang), without the drawbacks.
Only added -O0 to the test runner code, which is not performance
critical.

This is a workaround, if a better solution is found then this can be
removed.

Edwin Török (1):
  tools/tests/x86_emulator: avoid duplicate symbol error with clang: use
    -O0

 tools/tests/x86_emulator/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.47.3


