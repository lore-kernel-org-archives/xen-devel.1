Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC86CD5BD1
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 00:22:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324318.1589940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCtZ-0001Nz-0T; Tue, 02 Jun 2026 00:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324318.1589940; Tue, 02 Jun 2026 00:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCtY-0001Ns-SY; Tue, 02 Jun 2026 00:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1324318;
 Tue, 02 Jun 2026 00:22:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCtY-0001N0-C7
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:22:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCtX-00F48a-ES
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:22:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2216-5cb7-0a2a0a5109dd-0a2a4509b95a-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:22:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e21ba-2497-0a2a45090019-ac6904fee97e-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:20:10 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E7E76001A;
 Tue,  2 Jun 2026 00:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85DE1F00899;
 Tue,  2 Jun 2026 00:20:08 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780359609;
	bh=zFWWWdg8mapYQ9CM6egymitihblA04rJ/04j1DIBtpo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FBo+BWgWzc9Js/Pc9au5yBRAMI2JYYxjOpe9pHrxujcQhU6hgmoDCvEFEwP36gaRN
	 Jo0zPuyZray/sYJM+B9bFEtx6i/Z2SynfUrQ3Ti5ra7Fc3a8nnT0bT9Bn9vTrGkWei
	 vlnIBe6hfuskKOGe/NLoZ57KgQprKu2Oa21Tqqix9QHSygZYsIVCM/GwTDJvci5vI4
	 1Bxs7DmdzI1OvSGwdqAoKYCmn40fxcg3ScaDLOqryknbTHxX2BI2Yz5Fkkk5/YsctS
	 YJz6dAa0Py5hVipQoe5KUAPT7mJUjIZfIisTIVS6GgrPXZgrOl0SUF0QeRq+R1ppXe
	 j5arDdcJWdm/g==
Date: Mon, 1 Jun 2026 17:20:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Re: [PATCH v3 6/6] automation: enable Argo debugging in CI
In-Reply-To: <20260526215823.1452619-7-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011720021.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-7-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1780359611-8B392A53-39A91C01/0/0
X-purgate-type: clean
X-purgate-size: 283

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Enable extra Argo traces in CI to help analyze any potential Argo issues.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

