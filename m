Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4EBCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:20:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446074.1662041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD90-00040n-4G; Mon, 12 Oct 2026 10:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446074.1662041; Mon, 12 Oct 2026 10:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD90-00040g-1b; Mon, 12 Oct 2026 10:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1446074;
 Mon, 12 Oct 2026 10:20:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGD8z-00040a-39
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:20:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGD8y-00000001hJr-3wc3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:20:32 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGD8y-00000008Ieh-0ztF
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:20:32 +0000
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3a9a1ed66b9so11071041fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 03:20:32 -0700 (PDT)
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
	bh=7Pt+Ofwt0tmS2+oPk/E9CzhtrxJcTTP5V/Chtb4aBs4=; b=FspKBzRwIWQDoiHjtcufz2J4UC
	FKNu41vrytC267slrhtjg5rZu1L3KAt8Ph5FH3ssil/iUf/DbItziODNKkGVis8hDxteLUCgD/alw
	uzg9+VZFBXmE5ZU2SradYf6pXFJdfujhsj9GBoUl13ey7vMcwLzo9wn65Le1sEP+TEWY=;
X-Gm-Message-State: AFq9FYLj23A8AieS7qjUBA+yWC9WTvdZOQF+CCsWt0JOjirUT9BYriLO
	JPSfXMfZ0hkRedJzNNEDbz1LpYjAZCi3ps5Y0tP6WLKv2+BHdbcP+R7GDG4A2nAlN9xkpn+W5S0
	8KZKPCPGAGCN6cy1MJD872v4RCUmYMrc=
X-Received: by 2002:a05:651c:19a4:b0:3a6:660d:a83b with SMTP id
 38308e7fff4ca-3a9c4eba022mr25764151fa.3.1791800431481; Mon, 12 Oct 2026
 03:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com> <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com>
In-Reply-To: <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 11:20:18 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbOTQ=BoAU6Q=kweUSTVi_MxnDANTKSVn7TSgZ+YZ6vgg@mail.gmail.com>
X-Gm-Features: AclHuK99Fe3TnwNGYlKC18D1KG1fimxkAmbPnrRNXB632P3xbqYnf3irgskcWSI
Message-ID: <CAFLBxZbOTQ=BoAU6Q=kweUSTVi_MxnDANTKSVn7TSgZ+YZ6vgg@mail.gmail.com>
Subject: Re: [PATCH 03/15] x86/setup: break out E820_RAM accumulation
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> We already have two instances of this, and we're about to gain a third.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <gwd@laleolanguage.com>

