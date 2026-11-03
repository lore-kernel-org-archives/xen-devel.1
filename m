Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E8606D807
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:46:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1470223.1678958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHeI-0002YV-9c; Tue, 03 Nov 2026 16:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470223.1678958; Tue, 03 Nov 2026 16:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHeI-0002YO-6S; Tue, 03 Nov 2026 16:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1470223;
 Tue, 03 Nov 2026 16:46:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xOHeG-0002Wt-81
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:46:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHeF-003TTk-L3
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:46:11 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6aea0fcc-bab6-0a2a0a5309dd-0a2a450784b8-12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:46:11 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6aea0fd2-b4ea-0a2a45070019-a0658309a696-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:46:11 +0100
Received: from fedora (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id DC994845A16C;
 Tue,  3 Nov 2026 11:45:06 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: abdelkareem.abdelsaamad@citrix.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Tue,  3 Nov 2026 16:46:02 +0000
Message-ID: <20261103164602.381041-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f191a87071f790867eddd24dc3a7c823095c12e6.1793709558.git.abdelkareem.abdelsaamad@citrix.com>
References: <f191a87071f790867eddd24dc3a7c823095c12e6.1793709558.git.abdelkareem.abdelsaamad@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793724371-A64DBAE4-85E48A1B/0/0
X-purgate-type: clean
X-purgate-size: 98
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I apologize. This is not the correct one. Please dreop this one. I will resend.

--Abdelkareem

