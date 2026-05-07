Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E857ECD3436
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2026 00:55:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1302123.1576142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKn0s-0007n5-5g; Thu, 07 May 2026 00:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302123.1576142; Thu, 07 May 2026 00:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKn0s-0007my-2K; Thu, 07 May 2026 00:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1302123;
 Thu, 07 May 2026 00:54:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wKn0r-0007mp-7v
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 00:54:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKn0q-0007Jm-5b
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 02:54:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fbe21c-5cb7-0a2a0a5109dd-0a2a4503b7a2-38
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 02:54:48 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fbe2d7-672d-0a2a45030019-ac6904fed348-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 02:54:48 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B19356015B;
 Thu,  7 May 2026 00:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472D7C2BCB0;
 Thu,  7 May 2026 00:54:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778115286;
	bh=Ek9bTwceeuiXv/WjhJvVjjRg1bG1EaP6Qb0v8Nf8Pyk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J3aCLhxPyF3J2dzgx6oGACMc+1Fwtxm+TPhkmZic7491Rhyk+39pfpUO9BPCyQUEt
	 h7JzaxjhI0eFbs3q39hKF8kSDTS3ncdetI21UFDTzFy9f6EXy/sOGWTumk9I2PTJ6P
	 c+uKWTbb1FyOqz2MiCHGvOST+tdotsA2irfABDGM4iYmXBGEn/qZ9AeTEY/2G5EJSO
	 oqQCpYw8dJ27osvfgjTcVnZ6ERHSyokADzHVEiP54sI7MGDMOLOb6ocdBIGwRhsNLE
	 zgkPyPwA4tKQpR23dztRwUjSXGABYmj4Wbh6T3yLr6p1rCRb4fENv6vLwZMh8iiYYG
	 EMe1bbqpBwv4g==
Date: Wed, 6 May 2026 17:54:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
In-Reply-To: <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2605061753050.1744448@ubuntu-linux-20-04-desktop>
References: <6d9345e7-7ad9-48f4-8447-3a955305430a@suse.com> <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1778115288-3B96D938-4AB74556/0/0
X-purgate-type: clean
X-purgate-size: 2254

On Wed, 6 May 2026, Stefano Stabellini wrote:
> On Wed, 6 May 2026, Jan Beulich wrote:
> > When one of the linking passes fails, additional intermediate files are
> > still in place. Having them available for analysis of the underlying
> > problem can be pretty helpful. Collect some into a new intermediates/
> > directory. (Nothing new will be collected if linking succeeds.)
> > 
> > While there also make sure xen-syms is collected (into binaries/). This
> > is rather more useful for analysis of possible problems than its stripped
> > counterpart.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > As the issue this is meant to help with didn't re-occur with this in
> > place, the new logic wasn't really tested yet.
> 
> It looks OK but please provide a link to a successful pipeline
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Actually, I see that the build script is run with bash -ex so I wonder
if collect_xen_artefacts would even run if make fails. I think we need: 

trap collect_xen_artefacts EXIT


> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -6,6 +6,7 @@
> >    artifacts:
> >      paths:
> >        - binaries/
> > +      - intermediates/
> >        - xen-config
> >        - xen-cppcheck.txt
> >        - '*.log'
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -41,18 +41,24 @@ fi
> >  # to exit early -- bash is invoked with -e.
> >  cp xen/.config xen-config
> >  
> > -# Directory for the artefacts to be dumped into
> > -mkdir -p binaries
> > +# Directories for the artefacts to be dumped into
> > +mkdir -p binaries intermediates
> >  
> >  collect_xen_artefacts()
> >  {
> >      local f
> >  
> > -    for f in xen/xen xen/xen.efi; do
> > +    for f in xen/xen xen/xen-syms xen/xen.efi; do
> >          if [[ -f $f ]]; then
> >              cp $f binaries/
> >          fi
> >      done
> > +
> > +    for f in xen/.xen-syms.* xen/.xen.efi.*; do
> > +        if [[ -f $f ]]; then
> > +            cp $f intermediates/
> > +        fi
> > +    done
> >  }
> >  
> >  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> > 
> 

