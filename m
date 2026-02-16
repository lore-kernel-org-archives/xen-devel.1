Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED55CE81A3C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Feb 2026 16:14:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1234347.1537637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1ES-0001F3-R9; Mon, 16 Feb 2026 16:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234347.1537637; Mon, 16 Feb 2026 16:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1ES-0001Ew-OT; Mon, 16 Feb 2026 16:13:56 +0000
Received: by outflank-mailman (input) for mailman id 1234347;
 Mon, 16 Feb 2026 16:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=feiu=AU=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vs1ER-0001Ep-3i
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:13:55 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c7df79a-0b52-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 17:13:53 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 76AA98111991;
 Mon, 16 Feb 2026 11:13:26 -0500 (EST)
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
X-Inumbo-ID: 7c7df79a-0b52-11f1-b163-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: teddy.astie@vates.tech,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	jason.andryuk@amd.com
Subject: Re: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
Date: Mon, 16 Feb 2026 16:10:11 +0000
Message-ID: <20260216161023.148269-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f06b7e86-4188-485b-8f0e-c55bc72929e5@citrix.com>
References: <f06b7e86-4188-485b-8f0e-c55bc72929e5@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 16/02/2026 10:15 am, Andrew Cooper wrote:
>So what happens to the NMI we're trying to inject when NMIs are
>currently blocked?

Ah, I see this...
The handling flow will eventually land on the function svm_enable_intr_window
with HVM_INTR_SHADOW_NMI. The logic inside the function svm_enable_intr_window
will drive it to create a vintr and set up the VMCB to intercept that created
vintr. I see that the code logic in svm_enable_intr_window should be extended
to skip creating such vintr and just return the same as the handling with
Event injected NMI when the GENERAL1_INTERCEPT_IRET is already set.

>~Andrew

--Abdelkareem

