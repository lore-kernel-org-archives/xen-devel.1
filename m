Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFEA606A31B
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 18:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=lkKga06Z;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qQ3AJEIe
Received: from list by lists.xenproject.org with outflank-mailman.1458541.1670718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJxzh-0003kr-GU; Thu, 22 Oct 2026 18:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458541.1670718; Thu, 22 Oct 2026 18:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJxzh-0003kk-Ct; Thu, 22 Oct 2026 18:58:29 +0000
Received: by outflank-mailman (input) for mailman id 1458541;
 Thu, 22 Oct 2026 18:58:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xJxzg-0003ke-H9
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 18:58:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJxzf-007vPs-8z
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 20:58:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ada5cc9-e002-0a2a0a5209dd-0a2a450b8570-8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 20:58:27 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ada5cd1-b7e8-0a2a450b0019-ca0c7c90c4bd-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 20:58:26 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id DD2091D001BE
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:58:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 22 Oct 2026 14:58:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 14:58:23 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1792695504;
	 x=1792781904; bh=SmpmP6LX2MozVamlzq2gAt0cJuWdWugaPpMNfN4jt7E=; b=
	lkKga06ZdN3YVHM1hOJaphdmZ5pAn1svkDpCs7dRKMEHGPxQEhthUB91aLxiEjNs
	gN0o+BdIbRMZ8zcOzmyU14MXtHwRuKXTd0BD30TRJ52oM0+/ZrRzuUWrPNNqifPV
	aIvwHUAY3drIFiKh+jQBAXkP6pKAPFzFHXr0fWvESFfGJep6QWNm91ZeZHNMXskw
	Hq9fDNmbvHXdlVdenTVzjAkArGTkmxMdWmlFEH1nxs0aiAZC34SIThyGNG5neDmG
	P1r15gflRweQ943C/9Wps947ltzZ+I2P21+XQV7MHlJSDl5nbJ8jkZ7Fqsvlqjv/
	A9Uk1actmqFTWYRki5O5WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792695504; x=1792781904; bh=SmpmP6LX2MozVamlzq2gAt0cJuWdWugaPpM
	NfN4jt7E=; b=qQ3AJEIeTfq934cZSXsRTPYavaVnDvK6KsH4GZO2zmdg88KIB9P
	nXdwOaDrJv6B46XN8WV7PAr2Pzz8t2B7YtwWa0amdQJrnIdKkm9m+z/VG+aai0GL
	rHut38ymo+zH5/ulMWoFS6wID2VkB5fNWkimn8J595NpGBj/xG5ckfYiJm/m8Jtx
	3GX6FpxGP8Xu2C7SrJel2N0kSK8KURtKbpAipiZICqotMSA/BPUMCkN7DQtOb10r
	hzX6vrxkOipnvE6kDyDU5XkJ0B1Iql27lgh+90YcjH/HGqNjdyX5DvEFBO5RhqcA
	+FxK1xegkn7WwwfSPvQZVzhvObgugcGC7uQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792695504; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:D4ICtQR6eG9t536ECQSSj3T7m/L0UTtks7haXWyuX6Bj6G5
	HYNx8h3+HJywJzZPrkCzFbH3lzW69LgrHyQcuj4e9+b4BFhg0XtCBtUzKn3PI4Vl
	mqNIRt5zJlSSg8Dx+z+FbnTBm2YmdBW0M2Oa4zoZue+j+Y2xibWg8Em0G0I7ivAD
	+6BiD6K+CXnizGUsokwv0+aGi8A9HVkb2PkaD3581M/Ya9MoiLigi4WMt6v/rim+
	Ztmptq1kW0NMI1G2G/6wl70YzQ9K2RAQMXB6wpOkGpgd/V7ksZMfgfizvKGGRB9T
	XEct1aYJk7xn8+tWN9upAlSb3/cRKt1n9aHEqTA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MgmAxUXIqr83ScGsGHusOeAfukxu1TjyOF7HMTKZMNg=:CZM9KCNPkYTj9z44sfTuwbf+fq/mLgwt/o3MxzNb5CE=;
X-ME-Sender: <xms:0FzaauhY5MuXWa5H4YlMbysOApX23UR9X_couaKmhNYKDACv8tbaxg>
    <xme:0FzaalDqjfZUeBkRpHVFyV7YLyTtpE47NxOgoH2G59rYwtjKIeVsa03eDC6W1oicA
    DlKFYwDil4J70Xf7h0cSALfI2Vo7sLM94Rs-SMypC9afxmFWA>
X-ME-Received: <xmr:0Fzaajua-RBAEhknDZKK4cDRWg8vlIr-fxzB8tou6Ax3yQdTcO1qPh3vBwyqSwf-DQfOqZLejdg6Z9-w8vVXtRvboaeZqSRcAFaunMub4J0>
X-ME-Proxy-Cause: dmFkZTFNl1hVVzhz2dvusx1RozNBkKxbCtfrxfeFl01tThkhsiM19ClTX5RHVDNlY9i3Wm
    KePn+Y2RLHoNawnlXHcCnUHY7H8MMbleTSDG4W5EnyTIgpeetXgApHj9OLb9xclBMejaM1
    BfGDTDo4TWB+0FtELhazsFGhzBueDNlIoDL8nvrYkPLHDumy6lSixWE3v9C9uXN0QjRwzq
    fCyp+1A/aqCoQfVAzJYHVw0fe/U6AumxdaEJ76V4Cf4RPQqbVqvw5CLkqBMNU4diBHvlES
    azZ1ynTq9tww3p8DYdVbF85QicEEWn/MogNwlAlROpg7LURB3i2PYSKJupDcle0zcDicXF
    64j7E6jELzUmX+ZO6kVK5YX/JaV5UlHv41tRpcxAN/RnCG8f/vsyII8LJ0nHb2H/TjyNg+
    YhgP59P/Me+OcNtQIZOSOYCvlwBaqIdR9C6VVXxu3wMSONGeciyq1vCyYzX047Wt1yOSwU
    G4arFfm9qf/sCHyuG63/PIz9sFPitCFauSPpIBIgStFxmPiGyFKS50hdnr7XY0PUAjD4BC
    OgXtoZAOtzcgQWLSaHnKuRMrSrpwK6Z4cDAw0OKJw+kw/87QRTCqrz/HYeusZ53DUNgEUA
    0uf+xLxHXgsaMuwNrY6MAkP4VCtBDGeIgw5VO2AZjbEH3hfS80ir9iWFDcqA
X-ME-Proxy: <xmx:0Fzaaib2Ffv5sj67ukHEo12egVO6rqe73GOZDrv41KKsS8XKXbJwiw>
    <xmx:0FzaauVvTmw-EUrgJZ5EtQ1PXDGVKeY0cHrI5oOHz-kz2ie1DyT-2w>
    <xmx:0Fzaau5NofAPTS_bcS6EACKKXgYW6g203DoRYAWhoyn70S9oy-KcqQ>
    <xmx:0Fzaahi1rndwB9dOh_048yG-VqfeMMuUigET1vVaK6viFFneRGcMUQ>
    <xmx:0Fzaaq05DOcpe6h_BBrF2jQJyXk48L-LCgjNrYgo9vhK-pzerw0rerJm>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 22 Oct 2026 20:58:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd
Message-ID: <atpczcx_5KIxumIg@mail-itl>
References: <aY6iVr990vWeO2p5@mail-itl>
 <56cdf5c7-2a2f-4d46-91ed-ba0a361ea649@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FmuGHjoxYaDKyr38"
Content-Disposition: inline
In-Reply-To: <56cdf5c7-2a2f-4d46-91ed-ba0a361ea649@suse.com>
X-purgate-ID: tlsNG-42698a/1792695507-19CC79EA-954BAECD/0/0
X-purgate-type: clean
X-purgate-size: 2694
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--FmuGHjoxYaDKyr38
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 20:58:21 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd

On Mon, Oct 12, 2026 at 10:32:47AM +0200, Jan Beulich wrote:
> On 13.02.2026 05:02, Marek Marczykowski-G=C3=B3recki wrote:
> > After fixing the xhci crash, I hit another issue - booting with 236MB
> > initrd doesn't work, I get:
> >=20
> >     (XEN) [    3.151856] *** Building a PVH Dom0 ***
> >     ...
> >     (XEN) [    3.593940] Unable to allocate memory with order 0!
> >     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
> >     (XEN) [    3.599884]=20
> >     (XEN) [    3.602482] ****************************************
> >     (XEN) [    3.605272] Panic on CPU 0:
> >     (XEN) [    3.607928] Could not construct d0
> >     (XEN) [    3.610692] ****************************************
> >     (XEN) [    3.613463]=20
> >     (XEN) [    3.616035] Reboot in five seconds...
> >     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> >=20
> > Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f28997=
81755762f565
> >=20
> > If I skip initrd, then it boots just fine (but dom0 is not happy about
> > that). 164MB initrd failed too, but 13MB started ok.
> > Just in case, I tried skipping XHCI console, but it didn't change
> > anything.
>=20
> You may want to give [1] a try, minimally up to patch 11 (patches 01
> and 02 are unrelated, so could be omitted as well).

I've tested with the full series, and yes, it does fix booting PVH dom0
on this hardware. The console log looks like this now:
https://gist.github.com/marmarek/7a418274520d66468908a1f1ff56aede

Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FmuGHjoxYaDKyr38
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmraXM0ACgkQ24/THMrX
1yxJtgf/as9DvGwiuTnKne4yJF4iG8WCNb+JAijs/nlwepmfW4LZaPQEjgzn9RfK
NibQvfK8p8OzO4IuJiJ+1/86hggeagZW5J9/+OBSGeP48gql52mbwv6LzvpZRaOS
16blYsSzSg/XReg1jIxLjX7ltmXZd+p7FefMdsf9GY22cdNEBQxji+L+KS+qHGSj
MB1BJisP0TChPrAUEwrHM9h8w9DIXySPyEXT9u8DT2XyGVdm86GRNQrv3xFthWfz
a1Ddz73t1U9NPJ5/m69CX17I8HLQszEWlVIePF0M6ohrGAYObchaprwYIwc244dm
HIdQCfc934j8izmAbYr0IRYZPaXAKg==
=JhfN
-----END PGP SIGNATURE-----

--FmuGHjoxYaDKyr38--

