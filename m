Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCABC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F49564F80
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F49564F80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97232.184615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkaz-0006Or-EG; Fri, 12 Mar 2021 16:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97232.184615; Fri, 12 Mar 2021 16:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkaz-0006Ok-Aw; Fri, 12 Mar 2021 16:25:01 +0000
Received: by outflank-mailman (input) for mailman id 97232;
 Fri, 12 Mar 2021 16:24:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5fd=IK=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1lKkax-0006Of-LP
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:24:59 +0000
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ff54ed3-e586-44a1-be7b-be209a467974;
 Fri, 12 Mar 2021 16:24:57 +0000 (UTC)
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
X-Inumbo-ID: 6ff54ed3-e586-44a1-be7b-be209a467974
Date: Fri, 12 Mar 2021 16:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1615566295;
	bh=2ACfSekKEsr5YcE6yaI7EpKojSmgULgoHgJcvTn2nn8=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=eEIwNSrAH8GmtmhNXvUNoiQqCV27oeIKODQFsIfftDfeHz31DbRKUbMYiHfpA9n+s
	 2yInJDjp434cGGvmydRGu7aPXsnPJFFd8fHnQOyEtM32+WqFaV+mm8zI8GYIaejbmC
	 RVDCN4Hbm0JsmH5+WGoN5bXgwfL4oCXdtCa3i5xQ=
To: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com, Olivier Lambert <olivier.lambert@vates.fr>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: Working Group for Secure Boot
Message-ID: <YEuVx0NlQ3Z4+m5a@tiny>
In-Reply-To: <YEuHxZy1daBQjGma@mail-itl>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com> <YEuHxZy1daBQjGma@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 04:24:53PM +0100, Marek Marczykowski-G??recki wrote=
:
> On Thu, Mar 11, 2021 at 10:34:02AM -0800, Bob Eshleman wrote:
> > We would like to start a working group for secure boot support in Xen
> > to coordinate the various interested parties and set out a plan for
> > the feature and its implications for the whole Xen system.
> [...]
> > We'd love to hear from anyone interested in such a group and how the
> > community as a whole feels about such an effort.
>=20
> Count me in too.
>=20
> Also, I'm cc-ing Trammell, who might be interested too.

Thanks for the invite, Marek.

I'm also interested in discussing how to lockdown a running Xen system.
Now that the unified EFI image patches have been merged, we can boot
with a little more integrity and hopefully transfer the chain of trust
to a trustworthy system.

--=20
Trammell


