Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65DAC5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 21:40:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394442.1633215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwRXc-0004H1-UI; Tue, 18 Aug 2026 21:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394442.1633215; Tue, 18 Aug 2026 21:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwRXc-0004Gu-Rg; Tue, 18 Aug 2026 21:40:16 +0000
Received: by outflank-mailman (input) for mailman id 1394442;
 Tue, 18 Aug 2026 21:40:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUIi=GL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wwRXb-0004Go-PG
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 21:40:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwRXa-00CmFp-Bb
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 23:40:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=bUIi=GL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a84d10a-8faa-0a2a0a5109dd-0a2a4506bc92-28
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:40:14 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=bUIi=GL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a84d13d-195a-0a2a45060019-8c4da68aae9a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:40:14 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 8D620A1B8D;
 Tue, 18 Aug 2026 23:40:13 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVpbww5Fr_Lg; Tue, 18 Aug 2026 23:40:13 +0200 (CEST)
Received: from end (154.106.204.77.rev.sfr.net [77.204.106.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 53C16A1AB6;
 Tue, 18 Aug 2026 23:40:13 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wwRXY-0000000EOsT-2RNV; Tue, 18 Aug 2026 23:40:12 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787089213; bh=HQMWrRs5H+9ct9exSbTeLZP+vaq/xaCZ84D6cWM6/7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgkcT6xcRS3bRnmei4C4L8RUb6kwB2dOcLVhHanG4huRrOHc4RwSQYPuOP0ctvHNa
	 ADVjWIYlQ+Vx08/+NrplLMH0HNN0rEqVToavyZWJxQIpq5uxu+qWNsmM9KUatmF63b
	 4YdPllNGI9p7HVIYpZfn2+QoNeBqs0M/g2D3XKiY1nXzqwcGD8qA2zMSUM43eXm369
	 JvILzIdGVYlQbQkdJy498oERMFkstxkZJhPhSPF93PuqDhTFsrr8k/RPYrmpKfexmc
	 6/yc5TtN0uAeuvv23w5aDxm/DykfHuiRRMH1KZ3YK0AtSOnh0N2KUj8OwoXX0H+73V
	 vwlun3JCDYCWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787089213; bh=HQMWrRs5H+9ct9exSbTeLZP+vaq/xaCZ84D6cWM6/7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgkcT6xcRS3bRnmei4C4L8RUb6kwB2dOcLVhHanG4huRrOHc4RwSQYPuOP0ctvHNa
	 ADVjWIYlQ+Vx08/+NrplLMH0HNN0rEqVToavyZWJxQIpq5uxu+qWNsmM9KUatmF63b
	 4YdPllNGI9p7HVIYpZfn2+QoNeBqs0M/g2D3XKiY1nXzqwcGD8qA2zMSUM43eXm369
	 JvILzIdGVYlQbQkdJy498oERMFkstxkZJhPhSPF93PuqDhTFsrr8k/RPYrmpKfexmc
	 6/yc5TtN0uAeuvv23w5aDxm/DykfHuiRRMH1KZ3YK0AtSOnh0N2KUj8OwoXX0H+73V
	 vwlun3JCDYCWQ==
Date: Tue, 18 Aug 2026 23:40:12 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <aoTRPKeD6__D7Qra@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com>
 <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com>
 <aoM4ufGg8QO51XB9@end>
 <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-16d1c6/1787089214-FDA0C77B-7AAADA4E/0/0
X-purgate-type: clean
X-purgate-size: 1540

Jan Beulich, le mar. 18 août 2026 08:03:51 +0200, a ecrit:
> On 17.08.2026 18:37, Samuel Thibault wrote:
> > Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
> >> On 17.08.26 09:48, Samuel Thibault wrote:
> >>> Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
> >>>> There is no user of libpci left in stubdoms.
> >>>>
> >>>> Remove libpci from the stubdom build system.
> >>>
> >>> Wouldn't it be useful to keep this for anybody who would want to drive a
> >>> PCI card from a stubdomain?
> >>>
> >>> I mean, in the zlib case, it's really a mere question of build & link,
> >>> so we don't need to ship it, people can do it themselves easily like for
> >>> any other library.
> >>>
> >>> But here there is actual porting work, that we'd better not lose but
> >>> keep shipping.
> >>
> >> This is all still available via git.
> > 
> > No, it is not really.
> 
> Question is - does this matter in the first place? If someone wanted to
> drive e.g. a USB device, would we include USB code?

Why not? I mean, better centralize the maintenance of such code instead
of possibly several people having to maintain their own USB layer each.

> I'm with Jürgen that we should have in the upstream tree only what is
> also used in-tree.

But then there's probably quite a few things that could be dropped
from mini-os because the mini-os and xen trees don't use them, e.g.
the fbfront. But is that really a service to make to people using this
infrastructure, or planning to?

Samuel

