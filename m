Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A503EC25B75
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2024 00:46:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.722734.1127001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PGI-0001XT-RS; Thu, 16 May 2024 00:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722734.1127001; Thu, 16 May 2024 00:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PGI-0001XM-Oj; Thu, 16 May 2024 00:46:22 +0000
Received: by outflank-mailman (input) for mailman id 722734;
 Thu, 16 May 2024 00:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7PGH-0001X0-Id
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:46:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4514dca-131d-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 02:46:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E76BF615F7;
 Thu, 16 May 2024 00:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885C6C116B1;
 Thu, 16 May 2024 00:46:15 +0000 (UTC)
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
X-Inumbo-ID: b4514dca-131d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820376;
	bh=Ywx0ivV5tmJ3US9Cz8KoOFAzjmhBYnAUBKluw6FBhBM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DHSj11xJgObeQhXinNetbsOQZBKwkO13t6a0hbc3PzjeYGjF9aVSAuPIlT/p2qsaD
	 eUsFopVLFiEeUkBSxKZEEGydT7er1dZsQkv/sY19NGKLcrqZpLPUqcRicSxEoMwJHP
	 YdaWGU68nhFLgGYuDTkJfRRpBtoF2BGjRfYHGIkCGFUZMTpFrpRNMQwcwW94aiFdHI
	 XE0KA+u3ukcaAWJm8fXBhtjN+R5PE9RaYxinioXc3tQD5MCl+C7yXPlnzCG7Q0kjwm
	 vtbVtQJt9hhtueaX+LxusfFGclsgq4vX4hMKj5ATIKcYzlG60c9DraNjxGX0OwSFk5
	 vVEdpwRpkamSw==
Date: Wed, 15 May 2024 17:46:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 10/15] x86/domain: clean up superfluous #idef-s
In-Reply-To: <67d6604e8f66468c02f0c2e60315fc9251b69beb.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151746070.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <67d6604e8f66468c02f0c2e60315fc9251b69beb.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Remove preprocessor checks for CONFIG_HVM option, because expressions covered
> by these checks are already guarded by cpu_has_svm, which itself depends
> on CONFIG_HVM option (via CONFIG_SVM).
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


