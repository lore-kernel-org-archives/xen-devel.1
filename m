Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC59606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=4c9bOD0b
Received: from list by lists.xenproject.org with outflank-mailman.1481838.1685742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmGy-0002wr-TW; Tue, 10 Nov 2026 13:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481838.1685742; Tue, 10 Nov 2026 13:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmGy-0002wk-OT; Tue, 10 Nov 2026 13:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1481838;
 Tue, 10 Nov 2026 13:52:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xQmGx-0002wZ-O3
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:52:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xQmGx-00000006BNa-1P6N
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:52:27 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xQmGx-00000001VFt-3Kr4
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:52:27 +0000
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3ae0a5c1715so6165081fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 05:52:27 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=kBkzxCfv1JanXzUtPRtYBhoMBXxnkWjvgxff2v6IhyI=; b=4c9bOD0bCqk3vKhRVRoRo40QM2
	oAsOWrE92Gv86DrjwG0RgJC11LDxtN3mQNdRkSLvTGaBFOJjL9bBqr60pZB71g65h+zaJWFAj93IW
	BRxp1BBBRvjJivIxATSrvl4eJFc1t5hoqqR0mrjNTlNMD/2JvadptPWUmMeAxFAh4F7Y=;
X-Forwarded-Encrypted: i=1; AL+hErHZkCEV7Y+EdsLjg6EaNgpg8Ll289UA+R3ev96oz5Ym32D4avGW6cA/enzSAQKHm8M6w8SBH9Ttjx8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+cbye//FufvB0m1iRDHKIcyK2elbYv/sUrMFgjicls+Mf97As5
	+HoGTE3YrNcegJX7eJ4ss2WuNguaBHYBLx1UEfhrDvl9v0NF/nrdyT3TpzDevxLIfXeEOqPY/CJ
	9bH5zMWbUk4XaoH1Jt9mBVM2Tpgm+EfA=
X-Received: by 2002:a05:651c:2110:b0:3ad:ff5d:19b1 with SMTP id
 38308e7fff4ca-3ae0912e939mr5146131fa.20.1794318746523; Tue, 10 Nov 2026
 05:52:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110110500.27221-1-gwd@xenproject.org> <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
 <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com> <8d2ecf68-6c34-4a59-9fbf-0e3f67a338d7@suse.com>
In-Reply-To: <8d2ecf68-6c34-4a59-9fbf-0e3f67a338d7@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 10 Nov 2026 13:52:14 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZA0ZYrjHC5TCNt53HLuq-fDxkNyXdM1iOua8u2EaJnKg@mail.gmail.com>
X-Gm-Features: AclHuK-E6hLQF6nawm285hUns0pr3ACnMQbcP3Xo_d3_WqS--qkIsysnOFjtLPY
Message-ID: <CAFLBxZZA0ZYrjHC5TCNt53HLuq-fDxkNyXdM1iOua8u2EaJnKg@mail.gmail.com>
Subject: Re: [PATCH] x86/pv: free the shared_info page switch_compat() replaces
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 1:21=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> What I asked for here is that we free the page if its refcount is zero
> (the common case), exactly as you do (via RCU). Yet we would skip the
> freeing (and leak the page) in the unexpected case of the refcount not
> being zero after the put_page_alloc_ref().

OK, I think I see.  Yes, I'd considered that.  I mean, to be honest,
the whole xenheap allocation thing is janky; somehow we've taken a
useful, well-understood primitive that should work simply and
consistently (dropping the last ref causes a free) and added extra
bits so that it's fragile once again.  (If shared_info were a domheap
page, do_settime() would just grab a ref, map & access the page, then
drop the ref, knowing the page wouldn't be freed while it held the
ref, and *would* once it was dropped.)

Given that dropping a ref doesn't automatically / atomically free the
page, it seems like the rule should be that you *never* grab a ref to
a xenheap page, unless you've gone through the rest of the code and
verified that the freeing path works correctly.

And given *that*, since nobody else is currently grabbing the ref, not
checking the refcount should be safe.

I suppose you'll say, sure, but this is a non-hot path, and if we ever
*do* free with an outstanding refcount it's a security issue, so why
not be safe?  You have to draw the line on internal consistency checks
*somewhere*; I'd leave the check off, but I can add it if you really
want.

> > Now that we have the RCU version implemented and tested, I think we
> > should keep it.  It's safe now, and we can keep it safe in the future.
> > If you want we could add a comment to the field warning that no
> > references should be taken to it because it may change; but honestly
> > that seems like overkill to me.
>
> For the field I'm not concerned - it's purpose is clear, and anyone
> trying to add obtaining of a ref using it as input will hopefully be
> caught the latest during review. It's a ref existing ahead of the
> put_page_alloc_ref() which worries me (some).

For clarity, I meant a comment on d->shared_info, saying not to retain
pointers into it outside of a domain rcu_lock; and I guess now also
adding not to grab an additional reference to it without coordinating
free-on-last-reference properly.  But as I said, both should be a
general rule, not something we need to add to each data structure
affected.

 -George

