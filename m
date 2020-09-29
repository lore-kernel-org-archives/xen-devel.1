Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6E9C4727C
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 17:53:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A03207F7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 17:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="VrJIJINM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A03207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.330.945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJot-0007LD-5j; Tue, 29 Sep 2020 17:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330.945; Tue, 29 Sep 2020 17:53:43 +0000
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
	id 1kNJot-0007L4-2O; Tue, 29 Sep 2020 17:53:43 +0000
Received: by outflank-mailman (input) for mailman id 330;
 Tue, 29 Sep 2020 17:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNJoq-0007Kz-VJ
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:53:41 +0000
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1bcbe4f-8f41-4b72-81dd-aaf9085dd636;
 Tue, 29 Sep 2020 17:53:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNJoq-0007Kz-VJ
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:53:41 +0000
X-Inumbo-ID: c1bcbe4f-8f41-4b72-81dd-aaf9085dd636
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1bcbe4f-8f41-4b72-81dd-aaf9085dd636;
	Tue, 29 Sep 2020 17:53:39 +0000 (UTC)
Date: Tue, 29 Sep 2020 17:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1601402018;
	bh=El1FdZZIm/piWq7aesD/1CvcR56buELVEO02FcYssYU=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=VrJIJINMIIDIkrr3m4DT/QQ5y0tnczmtZIBJP0Jjn775l+yPCekGvZIGV3gWLbbbD
	 BFAzLjSBooFupgLI0xVasG6ML4zBSFJANQaYkX13F/2SHWm6ivAVJVoysEkTnSyHVG
	 tQxK+6XErEhs91q/jDQ3L27ZNOqpNIP+Y66Y9WzA=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v6 2/5] efi/boot.c: add file.need_to_free
Message-ID: <L6OrPSlho_3FXM64l9Kdq02iwIn1pWxJEbzrnNb-emsJjfdlS9mg4Fbdzusf83Fad4Nmwh0p_cCcmgXgeHGe-0I2Fsui92fR6zca7VYFVwM=@trmm.net>
In-Reply-To: <b0ab3d15-39e2-9543-d8c1-967e7af66908@suse.com>
References: <20200921115113.1278655-1-hudson@trmm.net> <20200921115113.1278655-3-hudson@trmm.net> <b0ab3d15-39e2-9543-d8c1-967e7af66908@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, September 29, 2020 6:17 AM, Jan Beulich <jbeulich@suse.com> wro=
te:
> On 21.09.2020 13:51, Trammell Hudson wrote:
> [...]
> > Reviewed-by: Roger Pau Monn=C3=A9 roger.pau@citrix.com
>
> Strictly speaking with the changes done from v5 to v6 this tag
> would have needed dropping. I guess Roger is fine with it being
> kept, though.

Ok.

> [...]
> Doesn't this need similar changes in both efi_arch_blexit()?

It does -- I had missed that there was a place to free them
and had assumed that they were just leaked.  Fixed in v7.

--
Trammell

