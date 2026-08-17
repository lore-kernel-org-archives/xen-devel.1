Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11366C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 16:37:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393131.1632027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww0Kq-0005Wv-5h; Mon, 17 Aug 2026 16:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393131.1632027; Mon, 17 Aug 2026 16:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww0Kq-0005Wo-2G; Mon, 17 Aug 2026 16:37:16 +0000
Received: by outflank-mailman (input) for mailman id 1393131;
 Mon, 17 Aug 2026 16:37:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1ww0Kp-0005Wi-O5
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:37:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww0Ko-0099ew-Cb
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 18:37:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a833885-bab6-0a2a0a5309dd-0a2a450c8b8a-34
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:37:14 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a8338b9-f479-0a2a450c0019-8c4da68ab6b6-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:37:14 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id B9E60A1AB6;
 Mon, 17 Aug 2026 18:37:13 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O95i-BvYQ_GZ; Mon, 17 Aug 2026 18:37:13 +0200 (CEST)
Received: from end (lfbn-orl-1-1611-126.w90-107.abo.wanadoo.fr
 [90.107.165.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 856E8A1A90;
 Mon, 17 Aug 2026 18:37:13 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ww0Kn-0000000Crmt-0NVk; Mon, 17 Aug 2026 18:37:13 +0200
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
	t=1786984633; bh=ZWx2q5QHX8DeCiM3ATZX3m7E39EtQ/oytXNyWT0yTKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJ80pqWHW8AOgE6jhXEMsLjSDqkwouFYkH3ww7O3BshFBKr+04plfmXrTsydBQLAa
	 iXUP+Z73QDzfh8upufYwQ3yKRmdO8uJc38pgaYc8HWidTUGatXDlweN/O+mlciPW1B
	 9Y44qHXty9pNlKnzxeZaIy5xJ0ZfOvAW/o/mAh0ArpVsgp7QvOVGB3bUKdax8/DI8e
	 RHuGDIyqfJi1v+iLDLOseA66wdSAxCywbbN2QPXdPCDXnhAnj115nyRleyf8bHBsbS
	 dvJOdhDfCcfPBwhEI8EIvjci+5n/+iP03D1aNMsxyB29Nmbswpz23zrW4DymaIMmqa
	 0XOuorsTHV5hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786984633; bh=ZWx2q5QHX8DeCiM3ATZX3m7E39EtQ/oytXNyWT0yTKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJ80pqWHW8AOgE6jhXEMsLjSDqkwouFYkH3ww7O3BshFBKr+04plfmXrTsydBQLAa
	 iXUP+Z73QDzfh8upufYwQ3yKRmdO8uJc38pgaYc8HWidTUGatXDlweN/O+mlciPW1B
	 9Y44qHXty9pNlKnzxeZaIy5xJ0ZfOvAW/o/mAh0ArpVsgp7QvOVGB3bUKdax8/DI8e
	 RHuGDIyqfJi1v+iLDLOseA66wdSAxCywbbN2QPXdPCDXnhAnj115nyRleyf8bHBsbS
	 dvJOdhDfCcfPBwhEI8EIvjci+5n/+iP03D1aNMsxyB29Nmbswpz23zrW4DymaIMmqa
	 0XOuorsTHV5hQ==
Date: Mon, 17 Aug 2026 18:37:13 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <aoM4ufGg8QO51XB9@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com>
 <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-d25034/1786984634-5290EA5B-8FA1C616/0/0
X-purgate-type: clean
X-purgate-size: 936

Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
> On 17.08.26 09:48, Samuel Thibault wrote:
> > Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
> > > There is no user of libpci left in stubdoms.
> > > 
> > > Remove libpci from the stubdom build system.
> > 
> > Wouldn't it be useful to keep this for anybody who would want to drive a
> > PCI card from a stubdomain?
> > 
> > I mean, in the zlib case, it's really a mere question of build & link,
> > so we don't need to ship it, people can do it themselves easily like for
> > any other library.
> > 
> > But here there is actual porting work, that we'd better not lose but
> > keep shipping.
> 
> This is all still available via git.

No, it is not really.

I keep reading this argument, but people will not know that something
exists in the git history, and will just assume that it does not exist
and has to be written.

Samuel

