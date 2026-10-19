Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465C606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 23:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkdYFlrV
Received: from list by lists.xenproject.org with outflank-mailman.1455039.1668571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIwTS-0001yO-7w; Mon, 19 Oct 2026 23:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455039.1668571; Mon, 19 Oct 2026 23:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIwTS-0001yH-5G; Mon, 19 Oct 2026 23:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1455039;
 Mon, 19 Oct 2026 23:08:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kuba@kernel.org>) id 1xIwTQ-0001yB-KI
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 23:08:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIwTP-00D9ZL-Oz
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 01:08:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kuba@kernel.org>)
 id 6ad6a2c7-e002-0a2a0a5209dd-0a2a450bd022-20
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 01:08:55 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kuba@kernel.org>)
 id 6ad6a306-b7e8-0a2a450b0019-aceafc1fb9d6-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 01:08:55 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 54D1043E10;
 Mon, 19 Oct 2026 23:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0251F000C4;
 Mon, 19 Oct 2026 23:08:52 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792451333;
	bh=eLKM7MMeaqzoIZ75AVxnOBs7+cOS67Dja9Pr1r6VNKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NkdYFlrVNZLObvTMqbesr14pbD3trgw5L2H4TNqYNolXpHBvm0VC1bK38omiDO3Fa
	 fbASWjUz4Y+mxBOv7Oe/+5lfZy6Tv9f0jeU/7lUFPuSCc/5zBgIO4IHYm7aHHO0AlE
	 EKk51z1IAOvHRCTyFS/ZKGBLG1uwo/XKGAfG7H2cWCn1l1TYWMcfIRVB5uyohEbjHy
	 XKNzoa4NveXR4CfL86ig0/VYGiJo4QZ5oAdy5NICa9gP2biM7Tkl7+62MOXScL2R0C
	 JuLj10XXX4Z9gJ0TIeOQoZJJ+UonvzJlctKIAe3C2/mR8tnBXQowrGbiE+Q6lS9W6+
	 kaHvsfl0o+lqg==
Date: Mon, 19 Oct 2026 16:08:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Manish Chopra
 <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v2 00/10] net: stop calling __pskb_pull_tail()
 from drivers
Message-ID: <20261019160851.7eb2a889@kernel.org>
In-Reply-To: <CAEzrpqfgBrvwy0Q_AX8X1s3ogq3g1U=JmpqHAM8QUmMHAqWPsw@mail.gmail.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
	<20261008141131.0ac356dd@kernel.org>
	<CAEzrpqfgBrvwy0Q_AX8X1s3ogq3g1U=JmpqHAM8QUmMHAqWPsw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1792451335-A8CCF9EA-A0E3F2E3/0/0
X-purgate-type: clean
X-purgate-size: 1256
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 9 Oct 2026 09:43:31 -0400 Josef Bacik wrote:
> On Thu, Oct 8, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > On Thu, 08 Oct 2026 21:02:47 +0000 Josef Bacik wrote: =20
> > > v1->v2:
> > > - New 1/10: skb_drop_empty_frags(). xen-netfront, netxen and qlcnic
> > >   relied on __pskb_pull_tail() releasing zero-length frags even when
> > >   there's nothing to pull, which pskb_may_pull() doesn't do (Sashiko).
> > > - xen-netfront, netxen, qlcnic: call skb_drop_empty_frags() after
> > >   pskb_may_pull().
> > > - skb_drop_empty_frags() checked with a boot-time test under KASAN and
> > >   kmemleak, on cloned and uncloned skbs. =20
> >
> > Please keep in mind that we ask people to limit themselves to 15
> > outstanding patches per tree. You have 18 right now.
> > (200 active netdev contributors + an LLM) x 20 patches =3D=3D insanity =
:/ =20
>=20
> Eesh sorry Jakub, the skbuff BUG_ON() removal series is the more
> important one, this series is the followup so I can finish that work.
> By outstanding do you mean per-merge window or once I get
> notifications for things being merged I'm good to send the next batch?

Sorry for the silence, I've been mostly offline past week and a half :S

