Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BA3C44506
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jan 2026 19:55:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1210255.1522037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vieIc-0003f0-EF; Wed, 21 Jan 2026 19:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210255.1522037; Wed, 21 Jan 2026 19:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vieIc-0003et-BC; Wed, 21 Jan 2026 19:55:30 +0000
Received: by outflank-mailman (input) for mailman id 1210255;
 Wed, 21 Jan 2026 19:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5F9=72=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vieIb-0003en-6U
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 19:55:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 215489ae-f703-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 20:55:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 82C7F600AA;
 Wed, 21 Jan 2026 19:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93150C4CEF1;
 Wed, 21 Jan 2026 19:55:24 +0000 (UTC)
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
X-Inumbo-ID: 215489ae-f703-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025325;
	bh=4YFQuSQdmutjU4oIbDaR0LBdGgXmLDotmJCaLOVfG/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d9nYAYukHBJdMaXtH+cD2mJshmiDRDkdQOgU/k+kaUZmF4E2QEtv7SzjciHXYmf/K
	 AzUGs6ddKirslE3/srltcioN9FUiALpVZhcLrw9gSpIKGnKkqB+/m4CVc1WPN0jukg
	 MZD+RKGhf1EYH1AEjXWrki/NHh0+NmDuz4VW8W9CzUsgyi22GaYJHYKKTU4dmgG7ES
	 bXe67bzDvthM0mjbkFGDb+j6NAPPw+9YMbQUwhfMdDBnzhGM7V/ERcs5+W8TpZzG0g
	 +eUE2nREzrjg205m4uAOFmDdd+Lgo5bbMjKfj5E4y6SWSZSjYafzMi1k0MFbdOK8oi
	 zJ2pYLQX1GLcg==
Date: Wed, 21 Jan 2026 11:55:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 5/5] automation: Disable ucode loading on AMD's analysis
 run
In-Reply-To: <95c6eb65-44ef-4a2d-8353-27363b952076@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2601211154560.7192@ubuntu-linux-20-04-desktop>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com> <20260120093852.2380-6-alejandro.garciavallejo@amd.com> <95c6eb65-44ef-4a2d-8353-27363b952076@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Jan 2026, Andrew Cooper wrote:
> On 20/01/2026 9:38 am, Alejandro Vallejo wrote:
> > Explicitly set CONFIG_MICROCODE_LOADING=n
> >
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I've discussed this enough with Stefano in the past to know that it's
> part of ThePlan(tm).

Yep, thanks Andrew. Ack from me as well.

