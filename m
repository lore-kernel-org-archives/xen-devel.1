Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16A1C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:34:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8084464EA2
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8084464EA2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79987.146016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bD9-0000Fw-2s; Mon, 01 Feb 2021 15:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79987.146016; Mon, 01 Feb 2021 15:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bD8-0000Fp-WB; Mon, 01 Feb 2021 15:33:54 +0000
Received: by outflank-mailman (input) for mailman id 79987;
 Mon, 01 Feb 2021 15:33:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6bD8-0000Fk-Fi
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:33:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6bD8-0004mp-C8
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:33:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6bD8-0006Yr-Ak
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:33:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6bD5-0007qn-1G; Mon, 01 Feb 2021 15:33:51 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=nkBRSlzmBwKRZLlNLozRCLgU5gDK5KyhbACypTekpcM=; b=4ELd+8uSHu1bG/mw4nPVI/10+h
	Byxu8SH75vNazZaF9K3Oaqf7fvWgJuY26AjP+eHyT+XbjWWqnxY2pWkb95BFyLgTw6cE/FcE0Be4N
	7w1pVl5+QsVDKBkScv6dDy6eJAlB9Zx70CRCzmG15XcXUkkfkpluU0H0GwiANK7Alb0c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.8030.769396.165224@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:33:50 +0000
To: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: [ANNOUNCE] Xen 4.15 release schedule - feature freeze now in effect

Thanks everyone for your hard work so far.  We are now in feature
freeze, as of the end of Friday.  No new features should be committed
to xen.git#staging.

You may continue to commit straightforward bugfixes, docs changes, and
new tests, without a release-ack.  Anything involving reorganisation
or refactoring should get a release ack.  If in doubt please ask me
and I will grant (or withhold) permission.

Codefreeze will occur on the 12th of February as planned.

  As a reminder, here is the release schedule:
  (unchanged information indented with spaces):

   Friday 15th January    Last posting date

       Patches adding new features should be posted to the mailing list
       by this cate, although perhaps not in their final version.

   Friday 29th January    Feature freeze

       Patches adding new features should be committed by this date.
       Straightforward bugfixes may continue to be accepted by
       maintainers.

+  Friday 12th February   Code freeze

       Bugfixes only, all changes to be approved by the Release Manager.

   Week of 12th March **tentative**    Release
       (probably Tuesday or Wednesday)

  Any patches containing substantial refactoring are to treated as
  new features, even if they intent is to fix bugs.

  Freeze exceptions will not be routine, but may be granted in
  exceptional cases for small changes on the basis of risk assessment.
  Large series will not get exceptions.  Contributors *must not* rely on
  getting, or expect, a freeze exception.

  New or improved tests (supposing they do not involve refactoring,
  even build system reorganisation), and documentation improvements,
  will generally be treated as bugfixes.

  The release dates is provisional and will be adjusted in the light
  of apparent code quality etc.

Thanks,
Ian.

