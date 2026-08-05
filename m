Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771B9C55184
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 01:53:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382729.1626044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQoT-0007Ex-Pr; Wed, 05 Aug 2026 01:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382729.1626044; Wed, 05 Aug 2026 01:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQoT-0007Eq-NG; Wed, 05 Aug 2026 01:52:57 +0000
Received: by outflank-mailman (input) for mailman id 1382729;
 Wed, 05 Aug 2026 01:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrQoS-0007Ek-PD
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:52:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoS-0068PF-1k
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:52:56 +0000
Received: from [203.221.94.45] (helo=Mac.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoR-00CujO-2b
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:52:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From;
	bh=x1Sp3yZQN5Q3kV7fZfg+oIULJI60NzjOq6ViWln5I7o=; b=jdUO+UwKAnwNwdG/itA1p46kMo
	4LAQBfcukIBBnaLSpEiSBkQ5QGa2yHcOf3frP65ZppqANnJCJazsyoH8FfkzYaLEOVAutmdbtI3eo
	+zIQbdwVuVYMI1scogRS8aIg2Y4LrqeJLOg9pRQDV48ku6wzpeJaGbjt09EIva2IAE5Q=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] Add compile_commands.json target
Date: Wed,  5 Aug 2026 11:52:37 +1000
Message-ID: <20260805015247.41943-1-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modern tools like emacs' `eglot` rely on compile_commands.json to
gather information about the project.  Import the build script from Linux,
adapting it to the core Xen binary.


