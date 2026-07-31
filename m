Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34810C55167
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 10:04:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378949.1623919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpk62-0000Js-Ox; Fri, 31 Jul 2026 10:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378949.1623919; Fri, 31 Jul 2026 10:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpk62-0000Jl-MR; Fri, 31 Jul 2026 10:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1378949;
 Fri, 31 Jul 2026 10:04:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wpk61-0000Jf-GI
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 10:04:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpk60-006E8r-LL
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 12:04:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a6c730f-2eae-0a2a0a5409dd-0a2a45028dfa-28
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 12:04:04 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a6c7313-6ca4-0a2a45020019-a06583098c8a-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 12:04:04 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 375FC832E6A3;
 Fri, 31 Jul 2026 06:02:17 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: PING: Re: [PATCH v2] nSVM: Check injected event consistency
Date: Fri, 31 Jul 2026 11:01:05 +0100
Message-ID: <20260731100110.2204957-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d7f21b51072743e5fb8743db53148231fef6fbb7.1784190077.git.abdelkareem.abdelsaamad@citrix.com>
References: <d7f21b51072743e5fb8743db53148231fef6fbb7.1784190077.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785492244-F0EA32AC-98BE6D7B/0/0
X-purgate-type: clean
X-purgate-size: 333

Hey,

Friendly ping on this patch.

This revision, I think, is addressing all comments\feedback received from
revision 1.

Could you please take another look when you have the time? If it looks good,
I would appreciate an Acked-by or Reviewed-by; otherwise, I’m happy to
iterate on any further feedback.

--Abdelkareem

