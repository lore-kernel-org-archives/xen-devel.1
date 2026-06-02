Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7249BCD6E60
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 15:10:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325147.1590653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQkn-0006we-EF; Tue, 02 Jun 2026 15:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325147.1590653; Tue, 02 Jun 2026 15:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQkn-0006w3-9w; Tue, 02 Jun 2026 15:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1325147;
 Tue, 02 Jun 2026 15:10:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUQkl-0006Wh-RO
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:10:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQkk-00011m-Jg
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:10:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1ef237-bab6-0a2a0a5309dd-0a2a45019006-22
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:10:02 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1ef249-c1f2-0a2a45010019-ac6904feda6a-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:10:02 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 94DD460138;
 Tue,  2 Jun 2026 15:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C431F00893;
 Tue,  2 Jun 2026 15:09:59 +0000 (UTC)
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
	s=k20260515; t=1780413000;
	bh=S2KseaV7qgO+CUbxvtmiLhnZ1SCZ/+YdYd2MLSYNDaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Qh4TQbYd0X2c+2T3iNHuqjbvRxEclZCN8S9fX50azkm9IoqT/4ZUIKuJsitys/PdF
	 uzWvylXGYPUkbnbrkOU0rI9RxWXXh5hybNoaWZ9GFu+NXVDvW8WMyPSX6wLfqjvsZM
	 I2SFKE6XV+lIBHEYcDumxnF93Tq+LxQn/vKNCYyg28kKdPfmGeH30DK/3j7ynUgb8v
	 ShnXkwEouHlV2akLRvWRqIuVPQO208l2kUo0YhCvquLEmkir40r+3PaH1Ha6b0sdoi
	 3IP9xiRYNbBYaLCDd+K+CUeG5dFZ+ifo+bB1ART24eMEIHkLlBCgHEwFrryO9YPIHU
	 sm8T8gB2dmMMA==
Date: Tue, 2 Jun 2026 08:09:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: disable debug info for analysis jobs
In-Reply-To: <6ed5a037c10e2b896e1269c6856508f5@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2606020809500.550703@ubuntu-linux-20-04-desktop>
References: <4f3a0cf9-63cf-405a-a19c-c8fc0473b2ce@suse.com> <6ed5a037c10e2b896e1269c6856508f5@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d62444/1780413002-AD1ADFF4-E2909373/0/0
X-purgate-type: clean
X-purgate-size: 892

On Wed, 20 May 2026, Nicola Vetrini wrote:
> On 2026-05-20 10:20, Jan Beulich wrote:
> > Its generating and linking takes time (and space), while at the same time
> > Eclair should be entirely independent of its presence.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Sadly the setting of EXTRA_XEN_CONFIG doesn't look to be cumulative
> > (across "extends:"), so the addition needs making to all four eclair-*
> > jobs.
> > 
> 
> Maybe with anchors and variable expansion it could be made to work, having a
> base template EXTRA_XEN_CONFIG and then adding variables as needed, but let's
> not complicate this unless needed. Indeed ECLAIR is not affected by stripping
> flags currently (though I don't exclude it may in the future).
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

