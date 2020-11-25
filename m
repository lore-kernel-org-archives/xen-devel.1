Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD5CC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:27:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE96A20789
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRYj1Cre"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE96A20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37136.69331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmP2-0000p7-5Z; Wed, 25 Nov 2020 04:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37136.69331; Wed, 25 Nov 2020 04:27:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmP2-0000p0-2S; Wed, 25 Nov 2020 04:27:36 +0000
Received: by outflank-mailman (input) for mailman id 37136;
 Wed, 25 Nov 2020 04:27:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmP1-0000ov-1y
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0be4d2de-51ca-4a82-947b-60e109efc04f;
 Wed, 25 Nov 2020 04:27:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10C1920789;
 Wed, 25 Nov 2020 04:27:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmP1-0000ov-1y
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:35 +0000
X-Inumbo-ID: 0be4d2de-51ca-4a82-947b-60e109efc04f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0be4d2de-51ca-4a82-947b-60e109efc04f;
	Wed, 25 Nov 2020 04:27:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 10C1920789;
	Wed, 25 Nov 2020 04:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278453;
	bh=PCH4N6dBQbNnVLc5jc5mn5eoHUGnxd6iVPbT0sBVRFY=;
	h=Date:From:To:cc:Subject:From;
	b=FRYj1Cre31TaU6QNRKRYoLBpyfRrdjeXdIDRGjdO+5E22R7UVRKqakhm9h5TFQnIg
	 79NSGv4zmureoLOwSzxLigwN0PeXGgH7h4pqzCG8kTeIMyTqOU1AD+1BLJDp4RXahn
	 /vh7hdq1axyXCOUuT+/x44aawAK5iYvO6ubSXOzU=
Date: Tue, 24 Nov 2020 20:27:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH v3 00/12] automation: improvements (mostly) for arm64
Message-ID: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This series does a few things:

1) it introduces a simple Xen arm64 dom0less smoke test based on QEMU
2) it introduces alpine linux builds x86 and arm64
3) it introduces two tests artifacts containers
4) it uses said artifacts to create a dom0/domU arm64 test based on QEMU

The series is v3, but in reality only 1) above was sent out before (the
first two patches). Everything else is new. All tests succeed currently.



Stefano Stabellini (12):
      automation: add a QEMU aarch64 smoke test
      automation: add dom0less to the QEMU aarch64 smoke test
      automation: pass --disable-werror for QEMUU builds if libc is musl
      automation: add alpine linux 3.12 arm64 build container
      automation: add alpine linux arm64 build test
      automation: add alpine linux 3.12 x86 build container
      automation: add alpine linux x86 build jobs
      automation: add tests artifacts
      automation: make available the tests artifacts to the pipeline
      automation: create an alpine linux arm64 test job
      automation: use the tests-artifacts kernel for qemu-smoke-arm64-gcc
      automation: add domU creation to dom0 alpine linux test

 automation/build/alpine/3.12-arm64v8.dockerfile    |  52 +++++++++
 automation/build/alpine/3.12.dockerfile            |  52 +++++++++
 automation/gitlab-ci/build.yaml                    |  60 ++++++++++
 automation/gitlab-ci/test.yaml                     |  47 ++++++++
 automation/scripts/build                           |  12 +-
 automation/scripts/qemu-alpine-arm64.sh            | 121 +++++++++++++++++++++
 automation/scripts/qemu-smoke-arm64.sh             |  93 ++++++++++++++++
 automation/tests-artifacts/Makefile                |  19 ++++
 .../tests-artifacts/alpine/3.12-arm64v8.dockerfile |  67 ++++++++++++
 .../kernel/5.9.9-arm64v8.dockerfile                |  34 ++++++
 10 files changed, 554 insertions(+), 3 deletions(-)
 create mode 100644 automation/build/alpine/3.12-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.12.dockerfile
 create mode 100755 automation/scripts/qemu-alpine-arm64.sh
 create mode 100755 automation/scripts/qemu-smoke-arm64.sh
 create mode 100644 automation/tests-artifacts/Makefile
 create mode 100644 automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile

