Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E30C98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 10:59:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433757.1654133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3dw-0002KW-Nu; Fri, 25 Sep 2026 10:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433757.1654133; Fri, 25 Sep 2026 10:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3dw-0002KN-Kj; Fri, 25 Sep 2026 10:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1433757;
 Fri, 25 Sep 2026 10:59:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xA3dw-0002KH-3a
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 10:59:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA3dv-008FSE-Gn
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 12:59:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6ab653f6-e002-0a2a0a5209dd-0a2a4507adfa-2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:59:03 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6ab653f6-b4ea-0a2a45070019-a06583088a00-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:59:03 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 4CA52472119F;
 Fri, 25 Sep 2026 06:56:58 -0400 (EDT)
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
To: jbeulich@suse.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v5] x86/nSVM: Check injected event consistency
Date: Fri, 25 Sep 2026 11:53:12 +0100
Message-ID: <20260925105315.3349139-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <70f930b2-31ba-4278-ab82-03a3c67d573c@suse.com>
References: <70f930b2-31ba-4278-ab82-03a3c67d573c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790333943-A76D2AE4-43ABE318/0/0
X-purgate-type: clean
X-purgate-size: 850

On 25.09.2026 11:15, Jan Beulich wrote:
>On 25.09.2026 11:38, Abdelkareem Abdelsaamad wrote:
>> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
>> debugging complications, security and performance implications. The APM
>> volume #2 15.20 (40332—Rev. 4.10—July 2026) states the two possibilities that
>> VMRUN will immediately exit with VMEXIT_INVALID due to the injected event.
>
>This is confusing: Another variant of this was sent a little under half an hour
>earlier. Simply going from size, the two also aren't identical. What's going on
>here?
The difference is minor. It is a reformat of the testing matrix table in an
attempt to better fit the xen-devel mailing list display. There is also
a change in the git send-email configuration of Roger's mail. The former can be
safely dropped."

Jan


