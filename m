Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B821C433E6
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 21:28:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F33F2208C7
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 21:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F33F2208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74506.133940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Oh-00080P-5e; Mon, 25 Jan 2021 21:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74506.133940; Mon, 25 Jan 2021 21:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Oh-00080I-2Y; Mon, 25 Jan 2021 21:27:43 +0000
Received: by outflank-mailman (input) for mailman id 74506;
 Mon, 25 Jan 2021 21:27:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l49Of-00080D-Pw
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 21:27:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 448583ee-dc51-4a2b-8be9-999e21168847;
 Mon, 25 Jan 2021 21:27:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFB422083E;
 Mon, 25 Jan 2021 21:27:39 +0000 (UTC)
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
X-Inumbo-ID: 448583ee-dc51-4a2b-8be9-999e21168847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611610060;
	bh=qqeqBYELeNSc0TmPXJE2Qaq2UbaTLYybJ5PHON6WvsM=;
	h=Date:From:To:cc:Subject:From;
	b=qAN992bTrcV7WcGxgGy36jtzrH5GsRzG5xSHVTaYj5JZ1+UOTm7BrkrMAx8oBpJ2/
	 /YbbHNvu4ONbpmlXRSw/9MFAEtgdnWPMfaA76rc13ST6jPLSuKSr3HswBQ9hgAHvIr
	 FD48Jle9xhfTEZNG1WKvJnbVzVyiDvLEX3AQd/I2inC1gd9A7abWXvRq7FVFV3vHmq
	 wfx9+ss4pKpEXHjVZnzoacauslnKEQxIbFLk5CKbAOTWs/sbWbWhwu8oTPYIGkZF6J
	 zCidUCQwVMDNtXTs+P92ElkcPu5dFHot8ftubHWF8AeGXMxZoFBMjQ+rpO6rSzdULO
	 c8szBbQaFvEmg==
Date: Mon, 25 Jan 2021 13:27:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com, 
    julien@xen.org, wl@xen.org
Subject: [PATCH v4 0/2] introduce UNSUPPORTED
Message-ID: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

A recent thread [1] has exposed a couple of issues with our current way
of handling EXPERT.

1) It is not obvious that "Configure standard Xen features (expert
users)" is actually the famous EXPERT we keep talking about on xen-devel

2) It is not obvious when we need to enable EXPERT to get a specific
feature

In particular if you want to enable ACPI support so that you can boot
Xen on an ACPI platform, you have to enable EXPERT first. But searching
through the kconfig menu it is really not clear (type '/' and "ACPI"):
nothing in the description tells you that you need to enable EXPERT to
get the option.

This series makes things easier by doing the following:

- introduce a new kconfig option UNSUPPORTED which is clearly to enable
  UNSUPPORTED features as defined by SUPPORT.md

- change EXPERT options to UNSUPPORTED where it makes sense: keep
  depending on EXPERT for features made for experts

- tag unsupported features by adding (UNSUPPORTED) to the one-line
  description

- clarify the EXPERT one-line description

[1] https://marc.info/?l=xen-devel&m=160333101228981

Cheers,

Stefano



Stefano Stabellini (2):
      xen: EXPERT clean-up and introduce UNSUPPORTED
      xen: add (EXPERT) to one-line descriptions when appropriate

 xen/Kconfig              | 11 ++++++++++-
 xen/arch/arm/Kconfig     | 10 +++++-----
 xen/arch/x86/Kconfig     |  8 ++++----
 xen/common/Kconfig       | 14 +++++++-------
 xen/common/sched/Kconfig |  8 ++++----
 5 files changed, 30 insertions(+), 21 deletions(-)


