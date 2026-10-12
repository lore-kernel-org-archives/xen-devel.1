Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61608CA9EDE
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 18:59:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446564.1662688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGLEW-0004e4-N3; Mon, 12 Oct 2026 18:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446564.1662688; Mon, 12 Oct 2026 18:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGLEW-0004dx-KP; Mon, 12 Oct 2026 18:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1446564;
 Mon, 12 Oct 2026 18:58:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGLEV-0004dr-1l
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 18:58:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGLEU-00000001r31-3zCs
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 18:58:46 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGLEU-00000004IZp-12dp
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 18:58:46 +0000
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3a9787a15bdso18646021fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 11:58:46 -0700 (PDT)
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
	bh=3SkwKd9YVjIqZr1KjbBgqpe3Yw+FpjEvGaoLeOvyvgo=; b=5fKlHHRUmNw2qcfpprL/fCMDMj
	hD3Xf6VH4jwS6Apk0ltqpm4mBzgeYqQVNRNY6Md8RjLiEsDhTBPScTKxpVn0ssKZZofAK+DoQYFCL
	krKWftqdFn6Kl8TTrXqOqk5nnE+srt3wF/NwuavD7lseAj1ACkUoOVKb1MljAcQEES1Y=;
X-Gm-Message-State: AFq9FYIp0/wopv+A2NfjKxb69+LgdnigL2afjbicvpvWTjJUvMZ4J4yF
	Mq6qXe83y4YwMXuR+gwBp5ttZSge0xKCSFRH77X9JJpUcLorE/yc9vi/eEk9wq0NkZsskOU/Ufd
	x3slYEnhT8r1ImeromHmSoCzHwEZ/4uM=
X-Received: by 2002:a05:651c:2209:b0:3a9:d9db:61a9 with SMTP id
 38308e7fff4ca-3a9d9db6beemr14716171fa.23.1791831525638; Mon, 12 Oct 2026
 11:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <125982a7-f491-4a10-98e9-d31f9f3b6444@suse.com> <CAFLBxZaArNWG6G-OQ7oEvHFRaZ-UjwmyjyuustuJggt48+qHpg@mail.gmail.com>
 <90fbdbb4-be0c-4916-926e-0327a73b082d@suse.com>
In-Reply-To: <90fbdbb4-be0c-4916-926e-0327a73b082d@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 19:58:33 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaOGsRWUsYnQpYZvE_uaH_qBZLPLgpaQXrGmisbawF=hg@mail.gmail.com>
X-Gm-Features: AclHuK960tpMafSxDlRnZrM5CbAqGHZsLcPiyeXVqx0vn-zrGd9AyHDzDRnHUAw
Message-ID: <CAFLBxZaOGsRWUsYnQpYZvE_uaH_qBZLPLgpaQXrGmisbawF=hg@mail.gmail.com>
Subject: Re: [PATCH 04/15] x86/setup: special treatment of initrd for PVH Dom0
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> Thank you very much for spotting both of these flaws.

Both were first spotted by Opus 5.5; I mostly filtered and verified
the issues then wrote a response in my own words.  I figured it would
be a useful way to contribute back that wouldn't delay the ASI series
too much.  (And I'm a bit torn between adding "Claude noticed.." all
over the place, which sounds kind of pretentious or like shilling, or
not mentioning it, and making it sound like I did all the work.)

 -George

