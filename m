Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D643AD2FEDD
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jan 2026 19:52:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1215162.1525411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkp6K-0007kL-VA; Tue, 27 Jan 2026 19:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215162.1525411; Tue, 27 Jan 2026 19:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkp6K-0007kE-S6; Tue, 27 Jan 2026 19:51:48 +0000
Received: by outflank-mailman (input) for mailman id 1215162;
 Tue, 27 Jan 2026 19:51:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vkp6J-0007k8-0Z
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 19:51:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vkp6I-006MYG-0P;
 Tue, 27 Jan 2026 19:51:45 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vkp6H-00532Z-1T;
 Tue, 27 Jan 2026 19:51:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=v+y7yzBEh5WO3EedzhjUvSPlIbaJvw1xDziXsNuvfF8=; b=
	1nGQfPUxbsBrpUQl731IErQWULu0DxDQNONzZS4k4+uuwTDFR0j4/kj52Z2AiWzkgzT1iDVrPxBZP
	DFEBXzmLdem+iMQbE8KGVFQh3jZakhG2tRzHEETKIvFrEQ7Ij475GqMez9DoSOFpv0qT7L6khSVY5
	0QlrZlfc9xYSk0Ep8=;
From: dmukhin@xen.org
Date: Tue, 27 Jan 2026 11:51:44 -0800
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v1 4/4] scripts/config: hook to automation build script
Message-ID: <aXkXUJUrEloLXg9y@kraken>
References: <20260116043458.730728-1-dmukhin@ford.com>
 <20260116043458.730728-5-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2601231631200.7192@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2601231631200.7192@ubuntu-linux-20-04-desktop>

On Fri, Jan 23, 2026 at 04:32:00PM -0800, Stefano Stabellini wrote:
> On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Use the new .config manipulation tool to toggle CONFIG_DEBUG in the
> > Xen automation build script.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  automation/scripts/build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index 7a81d229decd..ee1127c53dc5 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -27,7 +27,7 @@ else
> >      # Start off with arch's defconfig
> >      make -C xen defconfig
> >  
> > -    echo "CONFIG_DEBUG=${debug}" >> xen/.config
> > +    xen/scripts/config --file xen/.config -${debug} DEBUG
> 
> I'd suggest to add:
> 
> debug="${debug:-n}"
> 
> before calling xen/scripts/config to avoid errors in case debug is not
> set
> 
> I could make the change on commit if you are OK with it

Yes, will appreciate help!
Thanks!

> 
> 
> >      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
> >          echo "${EXTRA_XEN_CONFIG}" >> xen/.config
> > -- 
> > 2.52.0
> > 

