Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEC0C4363D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 10:53:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D35207EA
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 10:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="grYwN+vE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D35207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1884.5701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIg0-0007fu-GA; Fri, 02 Oct 2020 10:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1884.5701; Fri, 02 Oct 2020 10:52:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIg0-0007fn-CX; Fri, 02 Oct 2020 10:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1884;
 Fri, 02 Oct 2020 10:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kOIfy-0007fi-TK
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:52:35 +0000
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184f53c7-8e07-4cfb-b81d-b714945d0b18;
 Fri, 02 Oct 2020 10:52:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kOIfy-0007fi-TK
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:52:35 +0000
X-Inumbo-ID: 184f53c7-8e07-4cfb-b81d-b714945d0b18
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 184f53c7-8e07-4cfb-b81d-b714945d0b18;
	Fri, 02 Oct 2020 10:52:32 +0000 (UTC)
Date: Fri, 02 Oct 2020 10:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1601635951;
	bh=yd/hwExLFuNJpHJStPSBc7XEKqrOAe/xdydm8JCy+EA=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=grYwN+vEBaAbokQoYpH1Gg+wSszaZhiWpXl1OO98go0nKtX6oH9Uf1/uEDtvKbekr
	 oqhhzR/LnUXhmCme+41neRdgHPhtj96B7IyyiLG7z1ZVlWl+u/K+NW2SLpySgrxd1a
	 GFvNz8F1dg2EdcTYJfAlUzQSganDE0gBNJYXDuLA=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v8 4/5] efi: Enable booting unified hypervisor/kernel/initrd images
Message-ID: <s3f2INKZyF2RmtGWXAIMvThTOOBmykDEZvbEAlTOvNW6J3GaMSr7Q5oMo-IXI2E9cXGOzyqefPTMt6BhBL3-M0B40Otjgw0ANKS-Iuo3q7g=@trmm.net>
In-Reply-To: <ab61cb4b-bcbe-fb61-50d7-8d93bcfca4ab@suse.com>
References: <20200930120011.1622924-1-hudson@trmm.net> <20200930120011.1622924-5-hudson@trmm.net> <ab61cb4b-bcbe-fb61-50d7-8d93bcfca4ab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, October 2, 2020 4:27 AM, Jan Beulich <jbeulich@suse.com> wrote:
> On 30.09.2020 14:00, Trammell Hudson wrote:
> > -              /* Read and parse the config file. */
>
> I'm sorry for noticing this only now, but I don't think this comment
> should be moved. If no other need for a v9 arises, this can likely
> be undone while committing.

I'll relocate it.

> > -   if ( sect->Name[0] !=3D '.' )
> > -          return -1;
>
> I was about to say "'true' please", but you really mean 'false"
> now. (Could perhaps again be fixed while committing.)

oops oops. Yes, that is a mistake.  Should be false; I'll
fix it.

> [...]
> Just as a remark (and again spotting only now) this could be had
> with one less comparison:
>
> if ( cw !=3D c )
> return false;
> if ( c =3D=3D '\0' )
> return true;
>
> At which the need for cw also disappears.

Sure.  I'll fix that, too.

Since there are a few patches to the patch, I'll send out a v9 so
that we don't forget any of the ones that we wanted to remember to make.

--
Trammell


