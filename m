Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB2CCD5BAC
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2026 19:31:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1315857.1585517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ96R-0005PV-Fj; Thu, 21 May 2026 19:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315857.1585517; Thu, 21 May 2026 19:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ96R-0005PO-CA; Thu, 21 May 2026 19:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1315857;
 Thu, 21 May 2026 19:30:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wQ96P-0005PI-Kb
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:30:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ96O-008ZcB-Dq
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:30:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0f5d4b-5cb7-0a2a0a5109dd-0a2a4503b72e-26
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 21:30:40 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0f5d5f-672d-0a2a45030019-ac6904fea68a-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 21:30:40 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F5BA60138;
 Thu, 21 May 2026 19:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A541F000E9;
 Thu, 21 May 2026 19:30:37 +0000 (UTC)
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
	s=k20260515; t=1779391838;
	bh=l1yAdQ2QHe1xE2WaVhmsySMvO+Wp1NH1plgIq8vy5A0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Zu1fnxtLALCAt5kfT2j6qSXUr+DhBWaBEhi/zP/RyzdyNJ/TyWUExKLkAuKof6ozG
	 MmIqwQEcup9heVMljoNJX7qhOr+A3jGvWhl7nD2WU/WKPh+Mw7ermim9oYcDVDPLG5
	 ZxRk1FNwaqQSfVcN5ZKfUo2cKQ6I9Mj5kmWIq8bhNlM5w9mI2FoeYl5RpwIBYsBAnP
	 WlmgvM80aduO2QSUFf4e4MvHwyfuHxu5Yy3aGCsct4dQUXpvkxWdLxTpXqXguZBFNN
	 QG0V/5tWMkGcTMI7AbqjNP2rrQhwPT18ltG6BqG34QOHTzpcj4PhAVbLaTp5eNp3IM
	 SeJLvTxEsNZ4w==
Date: Thu, 21 May 2026 12:30:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Cody Zuschlag <cody.zuschlag@gmail.com>, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org, 
    roger.pau@citrix.com, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/process: document AI-assisted patch tags
In-Reply-To: <3e2ad5b9-ef65-41fd-87bf-823b98fa0c3d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605211229550.182011@ubuntu-linux-20-04-desktop>
References: <20260519142011.30276-2-cody.zuschlag@gmail.com> <3e2ad5b9-ef65-41fd-87bf-823b98fa0c3d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1779391840-3AD63938-510CD7E4/0/0
X-purgate-type: clean
X-purgate-size: 1945

On Thu, 21 May 2026, Jan Beulich wrote:
> On 19.05.2026 16:20, Cody Zuschlag wrote:
> > --- a/docs/process/sending-patches.pandoc
> > +++ b/docs/process/sending-patches.pandoc
> > @@ -195,6 +195,25 @@ E.g.:
> >  
> >      Requested-by: Jane Doe <jane.doe@example.org>
> >  
> > +### Assisted-by:
> > +
> > +This optional tag can be used when AI-assisted tooling contributed to the
> > +preparation of a patch.
> 
> Noticed only while reading your other email, plus checking the Linux
> wording: s/can/should/ at the very least? (Personally I'd make it a
> requirement.)
> 
> > It is in the format:
> > +
> > +    Assisted-by: <tool-name>[:<model-version>] [tool...]
> > +
> > +E.g.:
> > +
> > +    Assisted-by: Claude:claude-3-opus coccinelle sparse
> > +    Assisted-by: ChatGPT:gpt-5.5
> > +
> > +Basic development tools, such as git, compilers, make, and editors, should
> > +not be listed.
> > +
> > +The person submitting the patch remains responsible for reviewing any
> > +AI-generated content and ensuring the contribution is correct, appropriate,
> > +and compliant with Xen's contribution and licensing requirements.
> > +
> >  ### Signed-off-by:
> >  
> >  This mandatory tag specifies the author(s) of a patch (for each author a
> > @@ -209,6 +228,9 @@ E.g.:
> >  The author must be a natural person (not a team or just a company) and the
> >  `Signed-off-by:` tag must include the real name of the author (no pseudonym).
> >  
> > +AI tools must not add `Signed-off-by:` tags, as only natural
> > +persons can certify the `Developer's Certificate of Origin`.
> 
> Linux emphasizes "MUST NOT". I think that's advisable for us as well. I
> also wonder whether some of their other wording might be worth taking
> verbatim, rather than making our own, slightly different variant.

I agree with Jan's suggestion. Other than that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


