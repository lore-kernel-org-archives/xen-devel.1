Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F077606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPKsI/Zm
Received: from list by lists.xenproject.org with outflank-mailman.1496676.1695101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU51w-0005xI-6p; Thu, 19 Nov 2026 16:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496676.1695101; Thu, 19 Nov 2026 16:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU51w-0005xB-4D; Thu, 19 Nov 2026 16:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1496676;
 Thu, 19 Nov 2026 16:30:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jarkko@kernel.org>) id 1xU51u-0005x1-16
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:30:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU51t-008v0Q-6S
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 17:30:33 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff241f-8faa-0a2a0a5109dd-0a2a4503bf7a-34
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:30:33 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff2427-fae8-0a2a45030019-ac6904fe8c30-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:30:32 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id ED3CC6232E;
 Thu, 19 Nov 2026 16:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 215A91F000C8;
 Thu, 19 Nov 2026 16:30:29 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105830;
	bh=Z5ALnx+mCjWDmQkyVJCJZJkL4hw8lOcz/TYf9JnJauM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XPKsI/ZmHUUyElXZoORb7e711VheBLAms6JGdYgH0xQbJtpCXz72XHt/OwVfFv51s
	 K5Df6N53Bc3GAp+6PWEyOzQaLTUew9uQkJl+sMvv7SxSvrBVeCGG/4yvC9b+D5UvR0
	 kfSjyQMEMV2BopIRmGVuG5ruZ/xNishFkEYvl1be9Ws2e7YIFnA2Y9Wd7C2w81AR/a
	 9j96X3ROGzgJyP468ZaOmmoWtcFsBuG/E8TWsCc0ffmNOZlnTXYCbLBzy0MFs3+hzn
	 pk580VZC0zllB4V5clC8ITtdk8gHeNW3GBiWq6/bXiJzVVV2jb8DWg18ThyK+AtRuQ
	 j6QzcthVcfkvw==
Date: Thu, 19 Nov 2026 18:30:26 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: shyckless@gmail.com, jgg@ziepe.ca, linux-kernel@vger.kernel.org,
	sstabellini@kernel.org, linux-integrity@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
Message-ID: <av8kIqYC04D5QdXf@kernel.org>
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org>
 <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
X-purgate-ID: tlsNG-33051d/1795105832-754844E9-0D4C2F1D/0/0
X-purgate-type: clean
X-purgate-size: 2720
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 04:35:02PM +0100, Jürgen Groß wrote:
> On 19.11.26 16:20, Jarkko Sakkinen wrote:
> > On Thu, Nov 19, 2026 at 11:20:33AM +0000, Suyuan Wang via B4 Relay wrote:
> > > From: Suyuan Wang <stevewong@hust.edu.cn>
> > > 
> > > When the backend moves to Closing or Closed, backend_changed()
> > > unregisters the device and then keeps using it:
> > > 
> > > 	device_unregister(&dev->dev);
> > > 	xenbus_frontend_closed(dev);
> > > 
> > > The xenbus watch callback that calls backend_changed() does not hold a
> > > reference to the device. The tpm_chip registered by xen-tpmfront has dev
> > > as its parent and holds a reference to it, but tpmfront_remove() drops
> > > that reference when it unregisters the chip. So device_unregister() can
> > > release the last reference and free the xenbus_device, and
> > > xenbus_frontend_closed(dev) then accesses freed memory.
> > > 
> > > Take a temporary reference before unregistering and drop it after
> > > xenbus_frontend_closed(). This keeps dev alive for the last access and
> > > keeps the existing order, in which TPM operations are stopped before
> > > the frontend is marked Closed.
> > > 
> > > Found with a static analysis tool and checked by hand.
> > > 
> > > Fixes: e2683957fb26 ("drivers/tpm: add xen tpmfront interface")
> > > Cc: stable@vger.kernel.org
> > > Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > > Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > > Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> > > ---
> > > Compile tested on x86_64 (W=1, no new warnings). Not run with a Xen vTPM
> > > backend.
> > > ---
> > >   drivers/char/tpm/xen-tpmfront.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
> > > index 3c0cce57c4ae..1be925cca535 100644
> > > --- a/drivers/char/tpm/xen-tpmfront.c
> > > +++ b/drivers/char/tpm/xen-tpmfront.c
> > > @@ -397,8 +397,11 @@ static void backend_changed(struct xenbus_device *dev,
> > >   	case XenbusStateClosing:
> > >   	case XenbusStateClosed:
> > > +		/* device_unregister() can drop the last reference to dev */
> > > +		get_device(&dev->dev);
> > >   		device_unregister(&dev->dev);
> > >   		xenbus_frontend_closed(dev);
> > > +		put_device(&dev->dev);
> > 
> > Not a NAK but makes me wonder why this has not hit the wall ever.
> > 
> > I.e. "feeling confused".
> Is there any vtpm backend other than the stubdom based one?
> 
> If not, then it is quite easy: this backend never switches state to
> XenbusStateClosing or XenbusStateClosed.
> 
> 
> Juergen

Should it be removed use the default-fallback?

Br, Jarkko

