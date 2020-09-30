Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75491C4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 12:33:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193612071E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 12:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="A0IYyq6W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193612071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.649.2177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbIK-0005Ae-BA; Wed, 30 Sep 2020 12:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649.2177; Wed, 30 Sep 2020 12:33:16 +0000
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
	id 1kNbIK-0005AX-7r; Wed, 30 Sep 2020 12:33:16 +0000
Received: by outflank-mailman (input) for mailman id 649;
 Wed, 30 Sep 2020 12:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNbII-00059o-En
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:33:14 +0000
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 559db315-18ef-4b28-a37c-badf8bd6aba1;
 Wed, 30 Sep 2020 12:33:12 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNbII-00059o-En
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:33:14 +0000
X-Inumbo-ID: 559db315-18ef-4b28-a37c-badf8bd6aba1
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 559db315-18ef-4b28-a37c-badf8bd6aba1;
	Wed, 30 Sep 2020 12:33:12 +0000 (UTC)
Date: Wed, 30 Sep 2020 12:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1601469190;
	bh=PONbxKCexWQAx19BUtgm/JK5VpH4+doA4FidI9P6SfM=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=A0IYyq6W6z6FQoeookQvMbmTYTQ9cJTohzjws4vqyftMDtAFYoKGnUsbPCbub1Fj1
	 LjW4xSgiAX5MMNijf+tZx3P5v3dodHzpUUiRNPs68yK3vzwWqYCUrxnJsVhiIhBitB
	 EPf2Z4Ar+Xcu5ETarLAm0e64uK7PnjuCe3x1tCqA=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v8 3/5] efi/boot.c: wrap PrintStr/PrintErr to allow const CHAR16* arguments
Message-ID: <zEG_fZiNPkshvgNuwKymVlc9A0B1N3c_HeEGsYIrC_NU3G9zeUoS3Fbe8oTcEIizMCY4CzyqAVOQ-iDf7sCnaoQrJLyknVRaMljp3CMnZOM=@trmm.net>
In-Reply-To: <29fe9a2b-aeea-14a7-1ba9-99979f235373@suse.com>
References: <20200930120011.1622924-1-hudson@trmm.net> <20200930120011.1622924-4-hudson@trmm.net> <29fe9a2b-aeea-14a7-1ba9-99979f235373@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, September 30, 2020 8:15 AM, Jan Beulich <jbeulich@suse.com> w=
rote:
> On 30.09.2020 14:00, Trammell Hudson wrote:
> > This patch wraps the EFI OutputString() method so that they can be
> > called with const arguments. The OutputString method does not modify
> > its argument, although the prototype is missing const, so it is necssar=
y
> > to cast away the const when calling it.
> > It also updates callers of PrintStr/PrintErr to remove unneeded un-cons=
t casts.
> > Signed-off-by: Trammell Hudson hudson@trmm.net
> > Reviewed-by: Jan Beulich jbeulich@suse.com
>
> This one got committed earlier today, sadly ...

Ah, I had missed it when I rebased onto upstream/master, instead
of upstream/staging.

> [...]
> > @@ -540,7 +547,7 @@ static char * __init split_string(char *s)
> > return NULL;
> > }
> > -static void __init handle_file_info(CHAR16 *name,
> > +static void __init handle_file_info(const CHAR16 *name,
> > const struct file *file, const char *options)
> > {
> > if ( file =3D=3D &cfg )
>
> Obviously I had to drop this hunk, which should now be folded
> into patch 2. (If no other need for a v9 arises, I'll try to
> remember to do so while committing that one.)

I've squashed them in my tree in case there is a v9. Hopefully
it doesn't come to that...

--
Trammell

