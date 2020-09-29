Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2001DC4727C
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 18:07:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCFB2145D
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 18:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="c6IwSSXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCFB2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.334.961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNK1Y-0008RX-E2; Tue, 29 Sep 2020 18:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334.961; Tue, 29 Sep 2020 18:06:48 +0000
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
	id 1kNK1Y-0008RQ-As; Tue, 29 Sep 2020 18:06:48 +0000
Received: by outflank-mailman (input) for mailman id 334;
 Tue, 29 Sep 2020 18:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNK1X-0008RL-JR
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:06:47 +0000
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd5c730b-46ba-4547-9a54-f87f187f7a66;
 Tue, 29 Sep 2020 18:06:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNK1X-0008RL-JR
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:06:47 +0000
X-Inumbo-ID: bd5c730b-46ba-4547-9a54-f87f187f7a66
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bd5c730b-46ba-4547-9a54-f87f187f7a66;
	Tue, 29 Sep 2020 18:06:45 +0000 (UTC)
Date: Tue, 29 Sep 2020 18:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1601402803;
	bh=2EaPzfO1ZSzd1JPW5RS0sn/71OCaAHrquxmaXRoHC/8=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=c6IwSSXOKafFl7b1iFu7gj96hWVWLNHuSvc6jcpLDEYM1AvrNwuFZS2Tos3RCrGUh
	 L0eswzLO3NMb6/bapVH4yC497KF7llv1oJazQx+7Ye+CF6bppBhJs+PoXMhMHnjM8M
	 AB79Q64MzjFnai6gQFI+m98wQl5aGbbKHHs7bbmI=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v6 4/5] efi: Enable booting unified hypervisor/kernel/initrd images
Message-ID: <CYKsqzD4rNFBl3V_4PRVKI1eseJCxmipZTqcV0XBTZ7GS8Kt_Fe-h1gjnjj9R45I9POOSjZxSoauFqrOGlAWb814Oe2kEz4tjs1bn7Zw2kM=@trmm.net>
In-Reply-To: <6062d534-70b7-d8db-7526-ade453c373f8@suse.com>
References: <20200921115113.1278655-1-hudson@trmm.net> <20200921115113.1278655-5-hudson@trmm.net> <6062d534-70b7-d8db-7526-ade453c373f8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, September 29, 2020 11:37 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:
> On 21.09.2020 13:51, Trammell Hudson wrote:
> [...]
> > -   file->need_to_free =3D false;
>
> In patch 2 you don't bother clearing the field, presumably because
> it's static data and hence zero-filled anyway. This same assumption
> would then hold here. Or else, to be consistent, the earlier patch
> would want clearing added.

Removed.

> [...]
> > -          const char c =3D sect->Name[i];
> > -          const CHAR16 cw =3D name[i-1];
> > -          if ( cw =3D=3D 0 && c =3D=3D 0 )
>
> Blank line between declarations and statements please.

Added.

> [...]
> > -       if ( name[i-1] < 0 )
> > -           return -1;
>
> I'm afraid this is liable to trigger compiler warnings, for checking
> an unsigned quantity to be negative.

The compare function had strcmp() like semantics, but since it was
not used, I've modified it to just return a 0 or -1 in all cases.
So the comparison against < 0 goes away.

> Also throughout here "i-1" wants spelling "i - 1".

Fixed in both places.

> > -   /* PE32+ Subsystem type */
> > -   if ( pe->FileHeader.Machine !=3D PE_HEADER_MACHINE )
> > -          return NULL;
>
> Comment and code don't look to be in line.

Yeah, comment had drifted out of sync as some of the other tests
moved around.  I've removed it in the v7 version.

--
Trammell


