Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAAAC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 17:27:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393191.1632064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww16r-0005cI-AV; Mon, 17 Aug 2026 17:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393191.1632064; Mon, 17 Aug 2026 17:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww16r-0005cB-6s; Mon, 17 Aug 2026 17:26:53 +0000
Received: by outflank-mailman (input) for mailman id 1393191;
 Mon, 17 Aug 2026 17:26:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1ww16q-0005c5-4l
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:26:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww16n-00Cabu-VN
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 19:26:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a83442c-8faa-0a2a0a5109dd-0a2a45029fcc-26
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:26:49 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a834458-6ca4-0a2a45020019-a0658309d8b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:26:49 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 0B35982E492B;
 Mon, 17 Aug 2026 13:24:53 -0400 (EDT)
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
To: xen-devel@lists.xenproject.org,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: Re: Re: [PATCH v3] x86/nSVM: Check the L1 IOPM_BASE assigned physical address
Date: Mon, 17 Aug 2026 18:22:59 +0100
Message-ID: <20260817172259.2743705-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0cec914c-e52f-41ee-873b-6bdbc1d1ed82@suse.com>
References: <0cec914c-e52f-41ee-873b-6bdbc1d1ed82@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1786987609-F04A62AC-A0E2E694/14/0
X-purgate-type: clean.empty-body
X-purgate-size: 0


