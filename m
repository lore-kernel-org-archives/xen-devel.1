Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AACD73E87
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jan 2026 22:06:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1217037.1526866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vla9V-0008J3-4c; Thu, 29 Jan 2026 22:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217037.1526866; Thu, 29 Jan 2026 22:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vla9V-0008Iw-21; Thu, 29 Jan 2026 22:06:13 +0000
Received: by outflank-mailman (input) for mailman id 1217037;
 Thu, 29 Jan 2026 22:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vla9T-0008Iq-5X
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 22:06:11 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6cd97b3-fd5e-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 23:06:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2EAC6001A;
 Thu, 29 Jan 2026 22:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0672EC4CEF7;
 Thu, 29 Jan 2026 22:06:05 +0000 (UTC)
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
X-Inumbo-ID: b6cd97b3-fd5e-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769724367;
	bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
	h=Date:From:To:cc:Subject:From;
	b=bhlJaGDfsxtsGJJu+IAA2VQXRjl3vZkr13Rby2K90GBWT7s6aYzEy6ZqIF2z4nMD/
	 OBnSqcdff2jVuY+WMbN0oji2H7jUUN9lE/0sCG/v7DHDi9KTSBNISyarpj7c44AmLo
	 bgi7GAFwjyH+ICY1VGEq3XlH0N10+FH2syReW4g5PV1Vne7jI55ucL4Is8fEkIJnPe
	 C6g2lINfYQjLDemNYQlEqaboi9SFPx4HRfTJYXpSjefg4ETNzjh9/0j+nV+Up+IyNC
	 CVtfoQedbTdxDmoYpPP9+Jwa2fXRLbuOUj6W9vZX4VdFSjniJfNmIaPFnfL6gbp602
	 cisR8GyzkVrMw==
Date: Thu, 29 Jan 2026 14:06:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: [PATCH v8 0/2] xen: console_io for dom0less guests
Message-ID: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short patch series enable the usage of console_io hypercalls for
dom0less guests.

Cheers,

Stefano

