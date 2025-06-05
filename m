Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27CCC5B543
	for <xen-devel@archiver.kernel.org>; Thu,  5 Jun 2025 01:18:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1006129.1385377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMzEv-0008HI-JL; Thu, 05 Jun 2025 01:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006129.1385377; Thu, 05 Jun 2025 01:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMzEv-0008HB-Fz; Thu, 05 Jun 2025 01:17:53 +0000
Received: by outflank-mailman (input) for mailman id 1006129;
 Thu, 05 Jun 2025 01:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nB46=YU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMzEt-0008H4-JJ
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 01:17:52 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e553ee60-41aa-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 03:17:49 +0200 (CEST)
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
X-Inumbo-ID: e553ee60-41aa-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749086268; x=1749345468;
	bh=ZYlzHNGcktA7wOygRVP7CHnmUsOYcMDd1aY869XyxRA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OhgRVC18gxnpGXhvNVj016Cbsv5VFhc4U7/pW//qg3+MAXMAou2zmC1N3oeAvgsi2
	 I9InYjTYolTAAr2UsLgF4k8skyuIgR6sWa5l9AMwTxBkssHernwcCXxOTlHCmKADP/
	 Zm+37zkBj1tp7nrWaSiANN8VttScZ/wBkgN0TwZLpILUMX4W3zAwNhvL0h5CRXNU2X
	 ZuKy5izx5ppVtchKISrGL0wqsXFz05tDq3iuZrZPeUm49uFMw0N4XgK4SDTJR0GTxf
	 c0gPJVlERmvzbxKI/ObciheMxNlKY2+ZfvQTjADynisaNySQs1mhf73I5IQ7O2quuM
	 NWvEd8aAlsuEQ==
Date: Thu, 05 Jun 2025 01:17:43 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] xen/domain: introduce common hardware emulation flags
Message-ID: <aEDwMrVu+3PVSh+Y@kraken>
In-Reply-To: <093dc85d-ebf3-4982-8888-db4e7cfd0e45@suse.com>
References: <20250602191717.148361-1-dmukhin@ford.com> <20250602191717.148361-2-dmukhin@ford.com> <093dc85d-ebf3-4982-8888-db4e7cfd0e45@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5062ddf93c492581c5ee289e0055ecfb1c123e7b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 12:36:17PM +0200, Jan Beulich wrote:
> On 02.06.2025 21:17, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add common emulation_flags for configuring domain emulation features.
> >
> > Print d->emulation_flags from 'q' keyhandler for better traceability wh=
ile
> > debugging.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> It's not becoming clear why this would want doing, nor in how far some of
> the bits there may gain "common" meaning, too. Imo this kind of change is
> meaningful only in a series where later the common-ness is also used.

I have a set of upcoming changes here:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-framework?=
ref_type=3Dheads

Specifically,
 https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/17f44d23c190437=
4963c4ec839bc8219041b5d26

enables the use of emulation_flags on Arm.

I can move this patch to the upcoming series, if needed, but looks like it =
is
OK to have it for Arm even now.

>=20
> Jan


