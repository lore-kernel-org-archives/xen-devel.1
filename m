Return-Path: <SRS0=Klnx=FJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F80DC433FE
	for <xen-devel@archiver.kernel.org>; Sat,  5 Dec 2020 01:06:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE56222D70
	for <xen-devel@archiver.kernel.org>; Sat,  5 Dec 2020 01:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE56222D70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.45153.80655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klM21-0007Qp-84; Sat, 05 Dec 2020 01:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45153.80655; Sat, 05 Dec 2020 01:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klM21-0007Qi-4f; Sat, 05 Dec 2020 01:06:37 +0000
Received: by outflank-mailman (input) for mailman id 45153;
 Sat, 05 Dec 2020 01:06:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klM1z-0007Qd-Qj
 for xen-devel@lists.xenproject.org; Sat, 05 Dec 2020 01:06:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 389a5772-acc8-479c-9534-81766603aa14;
 Sat, 05 Dec 2020 01:06:35 +0000 (UTC)
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
X-Inumbo-ID: 389a5772-acc8-479c-9534-81766603aa14
Date: Fri, 4 Dec 2020 17:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607130394;
	bh=iBU7bw6in51y2nRtJ6NGup3X29A4Q5AMNEUA6SQ1rF0=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=gO9uRt33cRAOwx8o/TFxtWlF5zTCHMd6kX1CDAw+buDbHWDvIvhY6dbPpzU0S6uS/
	 kBWCM0nCPwcx8MbH5V0h4U1AZfQEAwBj9Pyde0ZQB8AfQE/NdxOK+Lkx4upVvo+D/2
	 hUxfpnk2puBXZH/G3pTLvSvAcTiLOZ/zytzy3gJXXmx2NE4YeelSjTq5YGu9Yw5lt7
	 2ENGJgkfzYsfbsj9GohHx38TPIk+xhMKnc+usrt7n8qxXOCPaboQg6OaMUz9tJnvUD
	 oiV/BM18PTdE+/EoPQrCl3kyz8wX5FjPJmzFOI/pvGhThNxIafELtXAqxxN6VBW3hP
	 A1VDCChxdbbuw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
In-Reply-To: <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
Message-ID: <alpine.DEB.2.21.2012041706090.32240@sstabellini-ThinkPad-T480s>
References: <20201126080340.6154-1-jgross@suse.com> <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Nov 2020, Jan Beulich wrote:
> On 26.11.2020 09:03, Juergen Gross wrote:
> > When the host crashes it would sometimes be nice to have additional
> > debug data available which could be produced via debug keys, but
> > halting the server for manual intervention might be impossible due to
> > the need to reboot/kexec rather sooner than later.
> > 
> > Add support for automatic debug key actions in case of crashes which
> > can be activated via boot- or runtime-parameter.
> > 
> > Depending on the type of crash the desired data might be different, so
> > support different settings for the possible types of crashes.
> > 
> > The parameter is "crash-debug" with the following syntax:
> > 
> >   crash-debug-<type>=<string>
> > 
> > with <type> being one of:
> > 
> >   panic, hwdom, watchdog, kexeccmd, debugkey
> > 
> > and <string> a sequence of debug key characters with '+' having the
> > special semantics of a 10 millisecond pause.
> > 
> > So "crash-debug-watchdog=0+0qr" would result in special output in case
> > of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,
> > domain info, run queues).
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > ---
> > V2:
> > - switched special character '.' to '+' (Jan Beulich)
> > - 10 ms instead of 1 s pause (Jan Beulich)
> > - added more text to the boot parameter description (Jan Beulich)
> > 
> > V3:
> > - added const (Jan Beulich)
> > - thorough test of crash reason parameter (Jan Beulich)
> > - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
> > - added dummy get_irq_regs() helper on Arm
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Except for the Arm aspect, where I'm not sure using
> guest_cpu_user_regs() is correct in all cases,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 

for the trivial ARM bit:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

