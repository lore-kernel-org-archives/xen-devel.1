Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E61CC4727F
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 11:12:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74AD206F7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 11:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="xNyok8XE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74AD206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.582.1954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNa1i-0004mE-NK; Wed, 30 Sep 2020 11:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582.1954; Wed, 30 Sep 2020 11:12:02 +0000
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
	id 1kNa1i-0004m7-KN; Wed, 30 Sep 2020 11:12:02 +0000
Received: by outflank-mailman (input) for mailman id 582;
 Wed, 30 Sep 2020 11:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNa1h-0004lz-91
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:12:01 +0000
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d85d170-cc69-4fcf-9cdc-58ccc03a348f;
 Wed, 30 Sep 2020 11:11:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNa1h-0004lz-91
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:12:01 +0000
X-Inumbo-ID: 2d85d170-cc69-4fcf-9cdc-58ccc03a348f
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2d85d170-cc69-4fcf-9cdc-58ccc03a348f;
	Wed, 30 Sep 2020 11:11:59 +0000 (UTC)
Date: Wed, 30 Sep 2020 11:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1601464317;
	bh=imp635jJa3iL4NpQGjJJxCQnz0Vh7SsZBMFaBKYhfwc=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=xNyok8XE4bsQXCi1hQ0cb76sMetQqtWwdI6lJk/uYi1tiWAjqyMdKkXEYtvBqYfCg
	 4F/WK8bueW+k2UoOc0rrZO8UaOQKG8h11vHpHAtCkOJaK6BUWmTDf51kX+3kvYmy4U
	 DmH+3uyodBT1sPTkAAxlh0Gluo0TkT2z8wvqM9q0=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v7 1/5] efi/boot.c: add file.need_to_free
Message-ID: <NeOsS0l9cobBgjrZe88P_y0tt80FE6nNo5EM_J7TxLvjIbKmPhaZYU6glmwOaUPqVDT1E24NOaiFikRAzY_CYwDenVyfkI2Gv2ctLCwczEg=@trmm.net>
In-Reply-To: <25429a64-2b60-19a2-c7d5-987eecd63c56@suse.com>
References: <20200929181717.1596965-1-hudson@trmm.net> <20200929181717.1596965-2-hudson@trmm.net> <25429a64-2b60-19a2-c7d5-987eecd63c56@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, September 30, 2020 2:49 AM, Jan Beulich <jbeulich@suse.com> w=
rote:
> On 29.09.2020 20:17, Trammell Hudson wrote:
> > -   if ( dtbfile.addr && dtbfile.size )
> > -   if ( dtbfile.need_to_free )
> >     efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
> >     if ( memmap )
> >     efi_bs->FreePool(memmap);
> >
>
> I'm afraid this isn't enough of a change for Arm, due to what
> fdt_increase_size() may do.

You're right.  It looks like there are also potential memory leaks
in the fdt_increase_size() error paths as well.  I've added free
calls in v8.

--
Trammell


