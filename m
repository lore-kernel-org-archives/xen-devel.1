Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F81EC2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 19:18:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C096C206B5
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 19:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="S4WlolLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C096C206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36877.68943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp5-0003MN-4t; Tue, 24 Nov 2020 19:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36877.68943; Tue, 24 Nov 2020 19:17:55 +0000
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
	id 1khdp5-0003MG-1q; Tue, 24 Nov 2020 19:17:55 +0000
Received: by outflank-mailman (input) for mailman id 36877;
 Tue, 24 Nov 2020 19:17:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdp3-0003MB-5T
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp3-00046u-09; Tue, 24 Nov 2020 19:17:53 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp2-0001af-KZ; Tue, 24 Nov 2020 19:17:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp3-0003MB-5T
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=U1nqXdkQgZ7asiK/N8GRlF/923RFJ4xg2wwzpCkLx9s=; b=S4Wlol
	LY5jVQhN0L6M8Lyr5VwCh7nFwqo9Z2PL11fMFzCz95tVnxrB/PSQW7+58g0lBfv8CpoPanOjzD5Tv
	dYftnHZX/Xx5MK7V0kWDkhSDqcXxlBf/V5TR0W21wFnSTzG2KOqpNAP/TuupsAiH29YUzXBivck3U
	2QkNnOsY/BY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp3-00046u-09; Tue, 24 Nov 2020 19:17:53 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp2-0001af-KZ; Tue, 24 Nov 2020 19:17:52 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v4 0/3] evtchn: Introduce a per-guest knob to control FIFO ABI
Date: Tue, 24 Nov 2020 19:17:48 +0000
Message-Id: <20201124191751.11472-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This series is the next version of what was originally a single patch sent
by Eslam Elnikety <elnikety@amazon.com>. I have re-based and slightly expanded
the modifications.

Paul Durrant (3):
  domctl: introduce a new domain create flag,
    XEN_DOMCTL_CDF_disable_fifo, ...
  libxl: add a 'disable_fifo_evtchn' flag to libxl_domain_build_info ...
  xl: add 'disable_evtchn_fifo' boolean option into xl.cfg(5) ...

 docs/man/xl.cfg.5.pod.in         |  8 ++++++++
 tools/include/libxl.h            |  8 ++++++++
 tools/libs/light/libxl_create.c  |  5 +++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/ocaml/libs/xc/xenctrl.ml   |  1 +
 tools/ocaml/libs/xc/xenctrl.mli  |  1 +
 tools/xl/xl_parse.c              |  3 +++
 xen/common/domain.c              |  2 +-
 xen/common/event_channel.c       | 17 +++++++++++++++++
 xen/include/public/domctl.h      |  4 +++-
 10 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.20.1


