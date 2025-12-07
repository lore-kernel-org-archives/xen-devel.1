Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B5D1CDC6
	for <xen-devel@archiver.kernel.org>; Sun,  7 Dec 2025 14:53:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1179993.1503273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSG83-00061X-AS; Sun, 07 Dec 2025 14:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179993.1503273; Sun, 07 Dec 2025 14:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSG83-00061M-5c; Sun, 07 Dec 2025 14:52:51 +0000
Received: by outflank-mailman (input) for mailman id 1179993;
 Sun, 07 Dec 2025 14:52:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vSG82-00061G-0z
 for xen-devel@lists.xenproject.org; Sun, 07 Dec 2025 14:52:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vSG81-00BfAV-1E;
 Sun, 07 Dec 2025 14:52:49 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vSG80-00G3Ob-1H;
 Sun, 07 Dec 2025 14:52:49 +0000
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
	Message-ID:Date:Subject:Cc:To:From;
	bh=ThX5TW+CBlEWXMjsmrCQp5zwBhHOA8v5j1XL6AMBcfQ=; b=evG4W/NMor/4Uok696PEBh750S
	c9EvgFFhHKvxjU7xKR3sJn3dRk5KbprAeeYwArlBI4KnAN7yW419wrJHTxWXYF+HoyAQTOQp4H6aS
	gxyBIiNGkGTAV1FssgZq5jzKkMzp/lh70xGj9qP2X7q6TInn1URQh8n7tBn1Y53a/9r0=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] CI: Fix container build jobs
Date: Sun,  7 Dec 2025 15:52:16 +0100
Message-ID: <20251207145216.35234-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

`docker:stable` tag hasn't been updated in 5 years, and has been
deprecated, according to https://hub.docker.com/_/docker, while
`docker:dind` (image use for the service) is using a recent version of
docker.

Now, `docker info` fails with:
    Error response from daemon: client version 1.40 is too old. ...

Switch to a newer tag, and just the "cli" version which contains only
the docker client. With that, both `:dind` and `:cli` should keep
using the same version of version. (`:cli` seems to be the base image
used to build `:dind`.)

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    pipeline:
        https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/2200667790
    which actually pushed the updated containers, despite the name of the
    top commit.

 automation/gitlab-ci/containers.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
index 25e8bdc34b..8b702a1d82 100644
--- a/automation/gitlab-ci/containers.yaml
+++ b/automation/gitlab-ci/containers.yaml
@@ -1,6 +1,6 @@
 .container-build-tmpl:
   stage: containers
-  image: docker:stable
+  image: docker:cli
   tags:
     - container-builder
   rules:
-- 
Anthony PERARD


