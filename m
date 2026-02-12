Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C83EE3697
	for <xen-devel@archiver.kernel.org>; Thu, 12 Feb 2026 15:33:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1229316.1535280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYgj-0000Cf-0l; Thu, 12 Feb 2026 15:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229316.1535280; Thu, 12 Feb 2026 15:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYgi-0000CY-TA; Thu, 12 Feb 2026 15:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1229316;
 Thu, 12 Feb 2026 15:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqYgh-0000CR-34
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:33:03 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cada1ec-0828-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:33:01 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4E9CE7A0087;
 Thu, 12 Feb 2026 10:32:59 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 12 Feb 2026 10:32:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 10:32:58 -0500 (EST)
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
X-Inumbo-ID: 1cada1ec-0828-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770910379;
	 x=1770996779; bh=pzE9KKW6qafWHwPYCp/i7IiR/YM3KW7UQdsEwQKUmS8=; b=
	RfRQL2c5ZgjDgxF6+X5wPK+KDnZVtt7x8F7sn+L3jmyhGYq5vZ0Nj4NnqVhcBeXz
	3b3ZL3GlRS4RLWjw8xOBoQKo7Zus2rNqiWhXgZzov3WlafFUK3GQOmfa40L0spZ/
	wLcwMr9P2UAjtl08vtSUDkTrhnBi0ipOHRi/s2AhzzOKGvFVqDYzE12KFf0uBKjm
	qhRQrySBcYhg8zSwZifS4sj6tw0tPaUagQleu1cWn9B2v49LOrIHtVp3wHWCxZDI
	tgjkPhjwYsp5/9/htXKiXl3PVbdJX6nL3wCaPM1nNvo7vG1h7OlCEo31MkpJ/0uJ
	voiS3batfyjsip3F1wqcyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770910379; x=1770996779; bh=pzE9KKW6qafWHwPYCp/i7IiR/YM3KW7UQds
	EwQKUmS8=; b=k/YJier428BKIWUIKaTE1jGxgEiyoNTJ1m/OLB06XTXad9qVakj
	i9X07Xe0kd5b+wjZfiKRSVJri/nEoO+VN/FCkFCMUkjOYZAu7i8mD5Mazq97TSGq
	MSAMqvTBzEKo12TzElaOTQj5nIl+HNPmGcBsd6nQY1sc4FM4U2XDnW32bRKAVrXw
	/DsAkIZFAls6l6ZEbOMkhnL4ib6oLSbOauKF/zr1wY8ICVp+5+l/oknioshVI2Ue
	HWkGEf0c2cs567xjX1RKNqAg70jP5vkVecLJDNLOwmDhnixA8LE0Ja+mOGKlwkVj
	1JbPuVMliZqo5D83EoQjkJsrQ9azRZXjuyA==
X-ME-Sender: <xms:qvKNabg2ZyWCBbMOojXR5MSrzhPRbhBuB9VjyxUnYOTVea3mYmXCzA>
    <xme:qvKNafwfhpKv22dPbOag1ORwTDYT1PD-cKnIMM9K9kLVTKexRgfS92RJiQq2wjVDo
    XHEuDoNXj_7dCxjXmBqomfy9eyhTcjTOaQl7pYYJaCr6qzzaA>
X-ME-Received: <xmr:qvKNaeKBiVLR1UlBJpP0znOkVEjQYHqakWWYlO6WA9y7U2SIbw5Dw7wc7U_jw8y7x6xT9uoBJ_Se-PU20YmRMqGFaogExIWwFJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepihhnthgvlhdqgigvsehlihhsthhsrdhfrhgvvggu
    vghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:qvKNaWTaJnIu7td7tTrWxMsFwcNNNFEuFoP7MF0RmjvuxxZHZAV_6g>
    <xmx:qvKNaWrew_yWRZvXbXOSJjhOirLuQQgN7n3MF78-1QgLSb7_RmuPCw>
    <xmx:qvKNabqvH_JWvWFqooDybznYqw1CEyCelmOt1PYT-kiekrEM0jtlVA>
    <xmx:qvKNaQP8wEjJQ5WULMsNQpDrj2Z0g_SOvzlFVZXnYuLfINddiV378A>
    <xmx:q_KNad37uCiWeRSuB-JhMmzXvpbu3C8YJq2e5WZbNSp2glKt-nNv3iBF>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 12 Feb 2026 16:32:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY3yqOTn9EQfO4rF@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vmipi+t4vizlqmlG"
Content-Disposition: inline
In-Reply-To: <aY3ttvtxGCPTNgsj@Mac.lan>


--vmipi+t4vizlqmlG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Feb 2026 16:32:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > Recently I started testing compatibility with Intel Lunar Lake. This is
> > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > Linux 6.17.9 in this test.
>=20
> Not sure it's going to help a lot, but does using a PVH dom0 make any
> difference?

Yes, it makes a difference. I end up with black screen as soon as dom0
starts... And due to unrelated bug (in xhci console code?), I don't have
kernel messages :/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vmipi+t4vizlqmlG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmN8qgACgkQ24/THMrX
1yzIigf8DClXXn/Ct3Uin0Vtdqw1ArhHRlBp17Xrhbde9xjRAMtiof9tkY8P+Fd8
/bDr68vAmiMoUQhIQXEuO8gwC9aYa+j4U3oArcf56dxInnH2T5HCEnC/YA/WVmn5
rp3NK/m7pTeUiWxuISi18zi9du+ifpR+BclQcAOq/zJft3OhpxWxknFs7Z4rpN7B
KiCSpHYPAZmi9Pevh/ewooN5Zw5FWAXmX15M+zNArIBTu+R2LhzDN6lhEHF5SBZw
mWlUK5ad18B1LJEAMhD17V5mxPlD1Msh4dJqtB2Zd/vGv6ExA7E8QKCY6QcF1Vm/
CylDBDUSU/eQtzGvCk/kgwfOKxf/tw==
=zCHo
-----END PGP SIGNATURE-----

--vmipi+t4vizlqmlG--

