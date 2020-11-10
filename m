Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5341C388F9
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 05:24:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603FD20729
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 05:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603FD20729
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenbits.xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23821.51344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcibh-0001Zu-JM; Wed, 11 Nov 2020 05:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23821.51344; Wed, 11 Nov 2020 05:23:45 +0000
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
	id 1kcibh-0001Zn-Fq; Wed, 11 Nov 2020 05:23:45 +0000
Received: by outflank-mailman (input) for mailman id 23821;
 Tue, 10 Nov 2020 18:59:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xenproject.org>) id 1kcYrZ-00045J-P8
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:59:29 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xenproject.org>) id 1kcYrZ-0007Lw-OM
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:59:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenbits.xenproject.org>)
	id 1kcYrZ-00045J-P8
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:59:29 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
	(envelope-from <iwj@xenbits.xenproject.org>)
	id 1kcYrZ-0007Lw-OM
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:59:29 +0000
Subject: test
To: <xen-devel@lists.xenproject.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <E1kcYrZ-0007Lw-OM@xenbits.xenproject.org>
From: Ian Jackson <iwj@xenbits.xenproject.org>
Date: Tue, 10 Nov 2020 18:59:29 +0000

Please don't reply.
.

