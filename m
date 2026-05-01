Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B753ECCFA13
	for <xen-devel@archiver.kernel.org>; Fri,  1 May 2026 17:08:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1298809.1573834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIrLg-0005oj-Bg; Fri, 01 May 2026 17:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298809.1573834; Fri, 01 May 2026 17:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIrLg-0005ob-6j; Fri, 01 May 2026 17:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1298809;
 Fri, 01 May 2026 17:08:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wIrLe-0005oV-RR
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 17:08:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIrLc-009ywS-ID
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 19:08:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69f4ddbe-2eae-0a2a0a5409dd-0a2a4504adaa-46
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 19:08:17 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69f4de00-1dec-0a2a45040019-aceafc1fbdb6-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 19:08:17 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A1E0C419CE;
 Fri,  1 May 2026 17:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20073C2BCB4;
 Fri,  1 May 2026 17:08:15 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777655295;
	bh=XcC+ppb7QWoUQwvJACnJzBK0iM4QcyPixryI8dPC6M0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iZQqXWfkJ7G/uX0MQD43Cy2mng+g7WQ6MeFXlQkzUb5bXXAxv4lYU5yunWFJMq7YB
	 8dIcGhNMyig1jlYOtsC0cID+ztrgyj+efmnVQMIlqA8xGCc7fKvByNSQIKnohxPhqp
	 mpQNijy4yT0DGYH4aljQE/W5PuLtsEvLkD4Jy2M+JzOQXKEJsv4kPwkdoEIhrzCRKE
	 lJL04CGQcmLHjM3og8wgP4RTlxs3jeKfoIPe93LijZg3KH3c541wrX8Ud4Q7rJs3BT
	 qPEebeq541mcid6qhU5DLITB8VnVJn1afS9H3M6Av0f3mgXUzOHA542m+AYk8PPz2X
	 L4/7D6CYej7/A==
Date: Fri, 1 May 2026 10:08:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
In-Reply-To: <9CEA7814-0ED6-401A-A5E9-2361278D9859@arm.com>
Message-ID: <alpine.DEB.2.22.394.2605011008010.512397@ubuntu-linux-20-04-desktop>
References: <20260430125103.401811-1-michal.orzel@amd.com> <20260430125103.401811-2-michal.orzel@amd.com> <9CEA7814-0ED6-401A-A5E9-2361278D9859@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1693967578-1777655295=:512397"
X-purgate-ID: tlsNG-ebf023/1777655297-28F753FF-84C3535E/0/0
X-purgate-type: clean
X-purgate-size: 622

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1693967578-1777655295=:512397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 May 2026, Luca Fancellu wrote:
> The changes looks good to me, for the Arm and common part:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> # arm, common
> 
> I’ve also tested on Arm64, Arm32, x86_64 with virtual platforms.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1693967578-1777655295=:512397--

