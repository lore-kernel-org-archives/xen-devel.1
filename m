Return-Path: <SRS0=Rr0c=E4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4BDC6379F
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 23:05:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761B520773
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2020 23:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="WmZvrZ8S";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="WmZvrZ8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761B520773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.33559.64647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgyPZ-0003KZ-V5; Sun, 22 Nov 2020 23:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33559.64647; Sun, 22 Nov 2020 23:04:49 +0000
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
	id 1kgyPZ-0003KS-S7; Sun, 22 Nov 2020 23:04:49 +0000
Received: by outflank-mailman (input) for mailman id 33559;
 Sun, 22 Nov 2020 23:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08CP=E4=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
 id 1kgyPX-0003KN-80
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 23:04:48 +0000
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f3f53ba-5a21-4a66-917e-69c99630a49f;
 Sun, 22 Nov 2020 23:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5C1741280900;
 Sun, 22 Nov 2020 15:04:41 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id PvG_3ynFL_Uj; Sun, 22 Nov 2020 15:04:41 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9178D12808F6;
 Sun, 22 Nov 2020 15:04:37 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=08CP=E4=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
	id 1kgyPX-0003KN-80
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 23:04:48 +0000
X-Inumbo-ID: 1f3f53ba-5a21-4a66-917e-69c99630a49f
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1f3f53ba-5a21-4a66-917e-69c99630a49f;
	Sun, 22 Nov 2020 23:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5C1741280900;
	Sun, 22 Nov 2020 15:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606086281;
	bh=ampKVWKUqLiKYyObj0dhEgltdPGbsuliUrstEBadWMw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WmZvrZ8SISP4O7CkmRRwRn7Ww4EqbFeoj9AudkGWHrTHPvBGVyYGXPtxxL5/3UBwZ
	 KEGMUiR7FBhAVO42W5uBkyouydambEWUMRvvMR32eyWutkJh8vdHwfKrPde3Z6lPQr
	 zwZuERjUvzNlbmlNByqn4M9h7sLDVk7BBiQeo3h4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvG_3ynFL_Uj; Sun, 22 Nov 2020 15:04:41 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9178D12808F6;
	Sun, 22 Nov 2020 15:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606086281;
	bh=ampKVWKUqLiKYyObj0dhEgltdPGbsuliUrstEBadWMw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=WmZvrZ8SISP4O7CkmRRwRn7Ww4EqbFeoj9AudkGWHrTHPvBGVyYGXPtxxL5/3UBwZ
	 KEGMUiR7FBhAVO42W5uBkyouydambEWUMRvvMR32eyWutkJh8vdHwfKrPde3Z6lPQr
	 zwZuERjUvzNlbmlNByqn4M9h7sLDVk7BBiQeo3h4=
Message-ID: <c3371b7c15ed30b92e9bb8609ff65bdaa0ef61fa.camel@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Finn Thain <fthain@telegraphics.com.au>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,  alsa-devel@alsa-project.org,
 amd-gfx@lists.freedesktop.org,  bridge@lists.linux-foundation.org,
 ceph-devel@vger.kernel.org,  cluster-devel@redhat.com,
 coreteam@netfilter.org, devel@driverdev.osuosl.org,  dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org, 
 GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com, 
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, 
 keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org, 
 linux-can@vger.kernel.org, linux-cifs@vger.kernel.org, Linux Crypto Mailing
 List <linux-crypto@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net,  Ext4 Developers List
 <linux-ext4@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-geode@lists.infradead.org,  linux-gpio@vger.kernel.org,
 linux-hams@vger.kernel.org,  linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input <linux-input@vger.kernel.org>,
 linux-integrity@vger.kernel.org,  linux-mediatek@lists.infradead.org, Linux
 Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-wireless
 <linux-wireless@vger.kernel.org>,  Network Development
 <netdev@vger.kernel.org>, netfilter-devel@vger.kernel.org,
 nouveau@lists.freedesktop.org,  op-tee@lists.trustedfirmware.org,
 oss-drivers@netronome.com,  patches@opensource.cirrus.com,
 rds-devel@oss.oracle.com,  reiserfs-devel@vger.kernel.org,
 samba-technical@lists.samba.org,  selinux@vger.kernel.org,
 target-devel@vger.kernel.org,  tipc-discussion@lists.sourceforge.net,
 usb-storage@lists.one-eyed-alien.net, 
 virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 xen-devel@lists.xenproject.org,  linux-hardening@vger.kernel.org, Nick
 Desaulniers <ndesaulniers@google.com>,  Nathan Chancellor
 <natechancellor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Joe Perches
 <joe@perches.com>
Date: Sun, 22 Nov 2020 15:04:36 -0800
In-Reply-To: <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
References: <cover.1605896059.git.gustavoars@kernel.org>
	 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011201129.B13FDB3C@keescook>
	 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	 <202011220816.8B6591A@keescook>
	 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	 <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 09:54 +1100, Finn Thain wrote:
> But is anyone keeping score of the regressions? If unreported bugs
> count, what about unreported regressions?

Well, I was curious about the former (obviously no tool will tell me
about the latter), so I asked git what patches had a fall-through
series named in a fixes tag and these three popped out:

9cf51446e686 bpf, powerpc: Fix misuse of fallthrough in bpf_jit_comp()
6a9dc5fd6170 lib: Revert use of fallthrough pseudo-keyword in lib/
91dbd73a1739 mips/oprofile: Fix fallthrough placement

I don't think any of these is fixing a significant problem, but they
did cause someone time and trouble to investigate.

James



