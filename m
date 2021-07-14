Return-Path: <SRS0=2EqH=MG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6474AC07E95
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 00:49:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201BC6136E
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 00:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201BC6136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155850.287637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3T55-0003F6-BS; Wed, 14 Jul 2021 00:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155850.287637; Wed, 14 Jul 2021 00:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3T55-0003Ez-8c; Wed, 14 Jul 2021 00:48:55 +0000
Received: by outflank-mailman (input) for mailman id 155850;
 Wed, 14 Jul 2021 00:48:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3T53-0003Et-UP
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 00:48:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4280be9d-e43d-11eb-87c6-12813bfff9fa;
 Wed, 14 Jul 2021 00:48:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CD87611AC;
 Wed, 14 Jul 2021 00:48:52 +0000 (UTC)
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
X-Inumbo-ID: 4280be9d-e43d-11eb-87c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626223732;
	bh=PSgjFaicbdDJlSNhJzqCdyS3I93jKywfZ4jbI8KWxI4=;
	h=Date:From:To:cc:Subject:From;
	b=Ta+RcJKlR2AnrpiW/1oUpgdYhIasq3Xk/mpo9wecqPh/2yPuvE57AtgDuK8ozDIl6
	 5o6mkybIZvnYDGCUiecqUTMUz69Z+Vg1dQ3AhSw70j4mBQF9uDBAFLtqbqjvMtDeYh
	 3kfRCDXX7/pDJIEAGYxeuO+zUkdpm2oYcX+d0Yp5wTRUjI6aezznMjr0Bb4bbVo/DU
	 otbKSmTqL22CwF/iHgdv8wXCggPsgcGxRWqrhOmywejpJIZFz2j0I+g8AcL8On5U0o
	 d/hkdp3fzSH9Xjb8W7E00q8ch4Je3n/3aG6Flsqg0cEneq9XMKCmGEiokGyUl1BdSU
	 VLWLVIdLyVw3w==
Date: Tue, 13 Jul 2021 17:48:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH RESEND 0/2] gitlab-ci: add a qemu-based arm32 test
Message-ID: <alpine.DEB.2.21.2107131747070.23286@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short series adds a minimal ARM32 test based on QEMU. It just runs
Xen and Dom0 up to a Busybox prompt.

Cheers,

Stefano


Stefano Stabellini (2):
      Add qemu-system-arm to the existing tests-artifacts container
      Add an ARM32 qemu-based smoke test

 automation/gitlab-ci/build.yaml                    | 14 ++++-
 automation/gitlab-ci/test.yaml                     | 27 +++++++-
 automation/scripts/qemu-smoke-arm32.sh             | 72 ++++++++++++++++++++++
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
 4 files changed, 112 insertions(+), 6 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)


