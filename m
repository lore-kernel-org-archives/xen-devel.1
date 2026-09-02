Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67944C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:44:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405830.1639278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kKP-0004uk-KB; Wed, 02 Sep 2026 12:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405830.1639278; Wed, 02 Sep 2026 12:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kKP-0004ud-HX; Wed, 02 Sep 2026 12:44:33 +0000
Received: by outflank-mailman (input) for mailman id 1405830;
 Wed, 02 Sep 2026 12:44:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1kKO-0004tW-9U
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:44:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1kKM-001tdk-2W;
 Wed, 02 Sep 2026 12:44:30 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1kKM-00EnmR-07;
 Wed, 02 Sep 2026 12:44:30 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=4RoCr/ElA62rsXRLeawXNvGDM03CtcjBTsrhIohHtyk=; b=AQEzP9gjbHtovUoeNWAhT/Lh8/
	zzPrbwm4gO00ES/FwT5Q65yqK+42l6DPFpHPAOuiCmnfgrK8CZ0Rld14YwlJs3Mo21NyCy4R1gKQQ
	QTyAcNFCaAzEjV0ANksCF+K8h1+THWe3KuKFIqeWsGo6e9vpYd7I19ykOo0Iup5RQL/E=;
Date: Wed, 2 Sep 2026 14:44:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 13/14] passthrough/PCI: rework (s,b,d,f) init of struct
 pci_dev
Message-ID: <apgaJh5ezRTmmyz2@macbook.local>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <baa05f9c-6787-44c3-9d53-e3adc0509140@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <baa05f9c-6787-44c3-9d53-e3adc0509140@suse.com>

On Wed, Sep 02, 2026 at 08:36:27AM +0200, Jan Beulich wrote:
> Right now we're casting away const-ness, to initialize the individual
> elements despite the field(s) being declared const. Eclair validly
> recognizes this as a Misra rule 11.8 violation. Hide this by switching to
> the use of memcpy(), deriving the destination address from the (mutable)
> struct pci_dev * which we hold in hands.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Subsequently we may want to further leverage the sbdf local variable we
> now have in the function. Yet of course the primary question is: Is this
> an okay game to play in the first place?

I've wondered the same, while this might be obfuscated enough for
Eclair to complain, aren't we still violating the spirit of the rule?

Regards, Roger.

