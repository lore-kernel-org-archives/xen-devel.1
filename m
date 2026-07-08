Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91CDC43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 17:17:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357245.1611716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whVtq-0006Tr-OP; Wed, 08 Jul 2026 17:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357245.1611716; Wed, 08 Jul 2026 17:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whVtq-0006Tk-LP; Wed, 08 Jul 2026 17:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1357245;
 Wed, 08 Jul 2026 17:17:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1whVto-0006TZ-MP
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 17:17:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whVto-009H4K-3A
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 19:17:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a4e8616-e002-0a2a0a5209dd-0a2a4504af40-16
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:17:27 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a4e8626-a01d-0a2a45040019-aceafc1fe976-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:17:27 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B212643AAC;
 Wed,  8 Jul 2026 17:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5168F1F000E9;
 Wed,  8 Jul 2026 17:17:25 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783531045;
	bh=Ge8ooVaW1Q9Agw4T66f0y/B7KixgqnMwwdAua40Ug5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=gMXzUb3jUmME2yBlB7xl3pwqCp+cue6XcbjahuVPtkWVFgqHc2kE6rKOUW/VInz6z
	 tvR7sz54JkIbPGyJ4vXGYDn+o1Ih2D29uYtb8xtNp8WctuqOcmVFUBjxh8T5W60fbq
	 NTCUVigWC9E2AT9wgnRrSWuqrutwgFJp5GV+QOhhCQbH2I8Dq1FqWWtPFpn+PXy7dq
	 JXKQ4iJz4VSujB78/D6ufyD9W4r50dpZh4eMGT5VLBGtlrGftJ38E7YWJndsuHmmrL
	 /Qrv4zXP1+lYf/Q6fWqNWeS21thvhnb4eE40JrfReEZIhydb+lXesSHEuNVKvlqIEN
	 QoJgm/tk0PNxg==
Date: Wed, 8 Jul 2026 10:17:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Add PantherLake microcode
In-Reply-To: <ak55rFeP3DPEg6vm@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2607081017120.89083@ubuntu-linux-20-04-desktop>
References: <20260708145623.1441067-1-andrew.cooper3@citrix.com> <ak55rFeP3DPEg6vm@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2004075172-1783531045=:89083"
X-purgate-ID: tlsNG-ebf023/1783531047-AF7211CC-3F57C759/0/0
X-purgate-type: clean
X-purgate-size: 1850

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2004075172-1783531045=:89083
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 8 Jul 2026, Marek Marczykowski-Górecki wrote:
> On Wed, Jul 08, 2026 at 03:56:23PM +0100, Andrew Cooper wrote:
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> And it seems to already apply to the new runner:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2662156525
> 
>     (XEN) [0000001882e96f95] microcode: CPU0 updated from revision 0x115 to 0x11b, date = 2026-03-24

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> > ---
> > CC: Anthony PERARD <anthony.perard@vates.tech>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Michal Orzel <michal.orzel@amd.com>
> > CC: Doug Goldstein <cardoe@cardoe.com>
> > CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > ---
> >  scripts/x86-microcode.sh | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/scripts/x86-microcode.sh b/scripts/x86-microcode.sh
> > index cb55a3bd2d52..7442e0ae9671 100755
> > --- a/scripts/x86-microcode.sh
> > +++ b/scripts/x86-microcode.sh
> > @@ -21,6 +21,7 @@ tar xf intel-latest.tar --strip-components=1
> >      cd intel-ucode
> >      cat 06-97-02 # adl-*
> >      cat 06-8e-09 # kbl-*
> > +    cat 06-cc-03 # ptl-*
> >  ) > "${UCODEDIR}/GenuineIntel.bin"
> >  
> >  #
> > 
> > base-commit: fe26bfd25cf09cd5ad11ecdf69699d3dde2c865d
> > -- 
> > 2.39.5
> > 
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> 
--8323329-2004075172-1783531045=:89083--

