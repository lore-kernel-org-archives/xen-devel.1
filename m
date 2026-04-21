Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3E4F94CB0
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 22:18:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289544.1569481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJQ7-0002Uo-My; Tue, 21 Apr 2026 22:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289544.1569481; Tue, 21 Apr 2026 22:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJQ7-0002Uh-Jb; Tue, 21 Apr 2026 22:18:15 +0000
Received: by outflank-mailman (input) for mailman id 1289544;
 Tue, 21 Apr 2026 22:18:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJQ6-0002RD-5o
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:18:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJQ5-00CV3J-Iw
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:18:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f795-bab6-0a2a0a5309dd-0a2a450cc294-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:18:13 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f7a4-62f1-0a2a450c0019-aceafc1f8c9a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:18:13 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 921DD442F6;
 Tue, 21 Apr 2026 22:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D2FC2BCB0;
 Tue, 21 Apr 2026 22:18:11 +0000 (UTC)
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
	s=k20201202; t=1776809891;
	bh=2xeBObuedmJATaRuUNLkyPnDkO0LC0/L6UFg5lUnibI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ryPDxwZGTu0dKSqz6U10NYCRcfQ7FTiz80TfcN8ceh1r3zXykUeLEhqSJK6rwlROE
	 oE9ES3QGJ2XfWm5341uSLnuOnRUe0Iku5m5nA4Y2zj+vpQWq5lUjWgwd7ho6OJraWX
	 +9fsMvzXUFtANqGDuj6MNIOuEd5nwhkWmk7fCmTpnxUVvjENp+wq9qe43qV4WKeMRg
	 CgMivQSG8zlsdeQklXt5cfMTgTQTN2vEp8sQYXEbqjbnQL/P7NjcTUNB3vfqo2ox+6
	 uK3IvD6SAXmt0i2upZaY7+Q4vympL62s5TdGyZorhYBLBKEIT4IkR3ItKDo9OQJ/3y
	 6+83NCuKaPjSA==
Date: Tue, 21 Apr 2026 15:18:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: "Orzel, Michal" <Michal.Orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
In-Reply-To: <2CD46F3B-C978-47F3-ACBC-BF2F39985B42@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211518000.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-6-michal.orzel@amd.com> <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com> <1ab0c888-e890-490e-adad-938222f31a62@amd.com> <6E811F82-6F9F-4894-B2A3-03AA166E78F4@arm.com>
 <de3ed940-c788-480b-8820-66afb3c8dc82@amd.com> <2CD46F3B-C978-47F3-ACBC-BF2F39985B42@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2027018740-1776809891=:2712345"
X-purgate-ID: tlsNG-d25034/1776809893-6FB7CCF5-2F89B701/0/0
X-purgate-type: clean
X-purgate-size: 745

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2027018740-1776809891=:2712345
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Apr 2026, Luca Fancellu wrote:
> >> Ok, do we also want to print a warning in case of malformed properties instead
> >> of ignoring and continue?
> > That's really a matter of taste. I would not do it unless you really want to.
> 
> I’ll leave this to the other maintainer, with the fix above:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-2027018740-1776809891=:2712345--

