Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C7D358CC
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jan 2026 07:37:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1216108.1526075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlMaT-00039Y-Qz; Thu, 29 Jan 2026 07:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216108.1526075; Thu, 29 Jan 2026 07:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlMaT-00039R-OE; Thu, 29 Jan 2026 07:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1216108;
 Thu, 29 Jan 2026 07:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZ39=AC=codewreck.org=asmadeus@srs-se1.protection.inumbo.net>)
 id 1vlMaR-00039L-Sr
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 07:37:08 +0000
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ede1266-fce5-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 08:37:05 +0100 (CET)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id 3CEA914C2D6;
 Thu, 29 Jan 2026 08:36:56 +0100 (CET)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id d3792bec;
 Thu, 29 Jan 2026 07:36:55 +0000 (UTC)
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
X-Inumbo-ID: 4ede1266-fce5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1769672219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pQDqB+mpzOzpDLWettESVpWi4zTuQoKZ83rJ5PXlXsE=;
	b=Utfzl1e36A2wZv76F17RVhsSsXY0plzYVCueTuT85WwlXMo1A38GOI7w8DmPKUgsaSjKLY
	28kUw9EOU1a7YYghh+r3TM9fBC9H/6y8hiA0QFzI8vWSTFunw8BsAJj7liML7O8AKuimDm
	IbGyQKd+g0qg7xNLiGdA+9hR43thY5644oMToIvD+kV4qTqWXU3TPHzp35/HebnU5aaL9q
	NoyKrZjsOYhLZIrtCWCmhAYJx+QOQ9E6GQKL86rZwsGsu/kFpPbptpWBw8lB0kW5YACTew
	VgjRwkmTHrfUE3s9f/ndkr+YkoahiOK5WRpl56T1bfBo7pXfQDA3EWG2R4lFmQ==
Date: Thu, 29 Jan 2026 16:36:40 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	xen-devel@lists.xenproject.org, jgross@suse.com,
	v9fs@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH] 9p/xen: protect xen_9pfs_front_free against concurrent
 calls
Message-ID: <aXsOCNkLvUHex-YT@codewreck.org>
References: <20260123184009.1298536-1-stefano.stabellini@amd.com>
 <aXRXbFVmilATqvfO@codewreck.org>
 <alpine.DEB.2.22.394.2601261354410.7192@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2601261354410.7192@ubuntu-linux-20-04-desktop>

Stefano Stabellini wrote on Mon, Jan 26, 2026 at 02:09:01PM -0800:
> > I don't understand this priv->rings != NULL check here;
> > if it's guarding for front_free() called before front_init() then it
> > doesn't need to be checked at every iteration, and if it can change in
> > another thread I don't see why it would be safe.
> 
> xen_9pfs_front_free() can be reached from the error paths before any
> rings are allocated, so we need to handle a NULL priv->rings but it
> doesn't have to be checked at every iteration. I can move it before the
> for loop as you suggested.

Yes, please move it above the loop

> > > @@ -310,9 +306,18 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
> > >  
> > >  static void xen_9pfs_front_remove(struct xenbus_device *dev)
> > >  {
> > > -	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
> > > +	struct xen_9pfs_front_priv *priv;
> > >  
> > > +	write_lock(&xen_9pfs_lock);
> > > +	priv = dev_get_drvdata(&dev->dev);
> > > +	if (priv == NULL) {
> > > +		write_unlock(&xen_9pfs_lock);
> > > +		return;
> > > +	}
> > >  	dev_set_drvdata(&dev->dev, NULL);
> > > +	list_del_init(&priv->list);
> > 
> > There's nothing wrong with using the del_init() variant here, but it
> > would imply someone else could still access it after the unlock here,
> > which means to me they could still access it after priv is freed in
> > xen_9pfs_front_free().
> > >From your commit message I think the priv == NULL check and
> > dev_set_drvdata() under lock above is enough, can you confirm?
> 
> Yes you are right. I can replace list_del_init with list_del if you
> think it is clearer.

Since you'll send a v2 for the loop check, might as well do this as well
if you don't mind.


> > > @@ -473,6 +482,11 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
> > >  		goto error;
> > >  	}
> > >  
> > > +	write_lock(&xen_9pfs_lock);
> > > +	dev_set_drvdata(&dev->dev, priv);
> > 
> > Honest question: could xen_9pfs_front_init() also be called multiple
> > times as well?
> > (if so this should check for the previous drvdata and free the priv
> > that was just built if it was non-null)
> > 
> > Please ignore this if you think that can't happen, I really don't
> > know.
> 
> That should not be possible before freeing priv first:
> xen_9pfs_front_init is only called when the frontend is in the
> XenbusStateInitialising state (see xen_9pfs_front_changed). Once we
> store priv we immediately switch the state to XenbusStateInitialised,
> and there will be no more calls to xen_9pfs_front_init. If the backend
> forces a re-probe, xenbus invokes xen_9pfs_front_remove first, which
> frees priv.

Ok, this makes sense to me.
I don't have any setup to test xen so trusting you here, but this looks
sane enough so will apply v2 when you send it

-- 
Dominique Martinet | Asmadeus

