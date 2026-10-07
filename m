Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A127DCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:21:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442469.1660021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETRd-0007mk-5X; Wed, 07 Oct 2026 15:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442469.1660021; Wed, 07 Oct 2026 15:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETRd-0007md-14; Wed, 07 Oct 2026 15:20:37 +0000
Received: by outflank-mailman (input) for mailman id 1442469;
 Wed, 07 Oct 2026 15:20:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xETRc-0007mX-GT
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:20:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xETRc-001gVi-0f
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:20:36 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xETRc-0037XS-0S
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:20:36 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5bad794b197so2029993e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 08:20:36 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=XgnzklmhT8bnP8wqwUCcRSgDGw8gGQNowfphipKGoTQ=; b=tsgYWdTRYYCpuNYzX76783GyDW
	8g1dilqpLzhHqTQzNnzpJVwKCA+ehmzGYuCDQeURKymr/W0w6dgWsBr9G15Z0KZNWcgGyR86kT7aP
	ZhAcdYtxGxcy+HE9GznrXDb1KFFiBCYlivbPvqwxq4D7zM285R+JpejNPOXmGTG+TZlo=;
X-Gm-Message-State: AFq9FYLx8/lhvlve8sd030SSvY1La84LbUCy4IyvWssZrGIDilzJQvcb
	ZwdTgA2ts07kaDTxYy+vRYyuLCSkzzhwzEyjmMHI7vKsQZtgupbhL5sxe1WXeqUGWTGhGdG6Igz
	owaOMVkY7u7uD/0bUC76xOoBvbPz+BnA=
X-Received: by 2002:a05:6512:6682:20b0:5bc:d17f:38b2 with SMTP id
 2adb3069b0e04-5bcd17f3bbfmr472123e87.22.1791386435051; Wed, 07 Oct 2026
 08:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-14-gwd@xenproject.org>
In-Reply-To: <20261007104051.48841-14-gwd@xenproject.org>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 7 Oct 2026 16:20:23 +0100
X-Gmail-Original-Message-ID: <CAFLBxZb8BD_eC8QBuRjt-09PCvmqFoW_03_571oQZ9aPu-Oerg@mail.gmail.com>
X-Gm-Features: AclHuK9FiueNVSk7bDR-F3LnyDod2Ns7j7cRMRrqM9Ch-YWCShOYECUUS6SNaaA
Message-ID: <CAFLBxZb8BD_eC8QBuRjt-09PCvmqFoW_03_571oQZ9aPu-Oerg@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] x86/mm: build and maintain a sparse view of the directmap
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 12:00=E2=80=AFPM George Dunlap <gwd@xenproject.org> =
wrote:
> The directmap maps all of RAM, and every root page-table carries it, so
> while any guest context runs, all guest memory is reachable from Xen's
> address space.  For ASI, guest contexts are to run on a view of the
> directmap which maps only what Xen must reach through it at all times,
> leaving guest memory to transient mappings (map_domain_page()).

Note that a deeper review has found a bunch of random corner-cases,
mostly to do with allocation failures when modifying the sparse view's
pagetables.  I'm going through them; my current plan is in most cases
to add fixes after this series, to make them easier to review, unless
they're obviously core to the functionality of this patch as it is.

 -George

