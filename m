Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA20ACD98C5
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 21:02:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334770.1597571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ3r-0001fm-Th; Wed, 10 Jun 2026 21:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334770.1597571; Wed, 10 Jun 2026 21:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ3r-0001ff-QB; Wed, 10 Jun 2026 21:02:07 +0000
Received: by outflank-mailman (input) for mailman id 1334770;
 Wed, 10 Jun 2026 21:02:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wXQ3q-0001fT-Gf
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 21:02:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXQ3p-00Aa9r-DV
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 23:02:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d0af-2eae-0a2a0a5409dd-0a2a4508b3ae-18
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:02:05 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d0cc-63b5-0a2a45080019-ac6904fec698-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:02:05 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8885F601FC;
 Wed, 10 Jun 2026 21:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65B91F00893;
 Wed, 10 Jun 2026 21:02:02 +0000 (UTC)
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
	s=k20260515; t=1781125323;
	bh=7LvkrGPlvKUxxAcZ5C5MrkJVWLDXbW3opvnSMnwIiP0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UTYynPg6PLWHEU1ekhceF+Cc/T+QM5kRxL3P/cIF2TJz8j75DDlNzlaDjZYUT7Q92
	 944strVjM3OKMQyr4Nk6EDRlTGFidm2zeTg9NHNnkg0dsB96dhCHRpeJ/WrYnP+KCy
	 hGU0Sah1fWJuAGfLHC+MkGPMy7qnKHGbBsusK9yP7GH/yAr4bG4aPoOggM3Pd55gdT
	 ztIOQ8SoYKPuy7fQLk/ZCzSUsF+TM+ESHCr2Z8K9RJ5FhGDfP+Et/FrCwv79BHD1Xb
	 X4dWld8qYBOGj+l5xGv7823xCO8zNH8Cufa6rptGgzMp9nUm7p9RaNFfoKBBPsjP8M
	 BBQ1vZNjJRNkA==
Date: Wed, 10 Jun 2026 14:02:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/4] CI: Fixes to containerize
In-Reply-To: <1781083314.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2606101401560.368315@ubuntu-linux-20-04-desktop>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com> <20260609173102.2908514-2-andrew.cooper3@citrix.com> <1781083314.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1781125325-BF171DB1-36271340/0/0
X-purgate-type: clean
X-purgate-size: 341

On Wed, 10 Jun 2026, Anthony PERARD wrote:
> On Tue, Jun 09, 2026 at 06:30:59PM +0100, Andrew Cooper wrote:
> > These were missed from prior changes.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

