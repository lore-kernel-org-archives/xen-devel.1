Return-Path: <SRS0=ZzRU=AG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6CEC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2020 16:36:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1948206C3
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2020 16:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1948206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joUqo-00046k-TM; Thu, 25 Jun 2020 16:35:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrHH=AG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1joUqn-00046f-RG
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 16:35:45 +0000
X-Inumbo-ID: ea1ac5e0-b701-11ea-8206-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea1ac5e0-b701-11ea-8206-12813bfff9fa;
 Thu, 25 Jun 2020 16:35:44 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: e9fzRMj/o4Fb/tv2uOXovEqPKGrjRfdWcLhgSbiRFHtGGH/ZpgjD2h0syg+5T4IwGfrWO9LXhy
 BsdxTTO0L+3aLycimaihhQOkNjfZXcN37QIYG2cwNsAaY0Oc0YMNuSFA4S7zWb04hSd76vVc2z
 Y5LmI8FDDncYhMroruH8EHUeCGYgIKREbzEbOBI2gA50riEzaLXPpz0/481iWzZfw14IwfiIJ+
 T+U9tPsQRGT/z/PT0IJ0qvLoasBQZ0wyuXGyI8LbIu3mI29a5QcOmAUBb0lXdvDnk5qXZ4ySvB
 lIM=
X-SBRS: 2.7
X-MesageID: 21287700
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,280,1589256000"; d="scan'208";a="21287700"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24308.53852.871947.61151@mariner.uk.xensource.com>
Date: Thu, 25 Jun 2020 17:35:40 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] scripts: don't rely on "stat -" support
In-Reply-To: <CAKf6xpuAHCDc-O_CwXCrRYQojDLi9Abjjphud076OCeU_eoidg@mail.gmail.com>
References: <691aebb4-87af-60df-b6ad-07cb6fef4167@suse.com>
 <24308.50838.149966.847431@mariner.uk.xensource.com>
 <64c6a187-bf90-ae69-793b-0651bedd4f88@suse.com>
 <CAKf6xpuAHCDc-O_CwXCrRYQojDLi9Abjjphud076OCeU_eoidg@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [PATCH] scripts: don't rely on "stat -" support"):
> On Thu, Jun 25, 2020 at 11:47 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 25.06.2020 17:45, Ian Jackson wrote:
> > > Jan Beulich writes ("[PATCH] scripts: don't rely on "stat -" support"):
> > >> While commit b72682c602b8 ("scripts: Use stat to check lock claim")
> > >> validly indicates that stat has gained support for the special "-"
> > >> command line option in 2009, we should still try to avoid breaking being
> > >> able to run on even older distros. As it has been determined, contary to
> > >> the comment in the script using /dev/stdin (/proc/self/fd/$_lockfd) is
> > >> fine here, as Linux specially treats these /proc inodes.
> > >>
> > >> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >
> > > Thanks.
> > >
> > > The only code change here is this:
> > >
> > >> --- a/tools/hotplug/Linux/locking.sh
> > >> +++ b/tools/hotplug/Linux/locking.sh
> > >> @@ -45,18 +45,14 @@ claim_lock()
> > >> -        if stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
> > >> +        if stat=$( stat -L -c '%D.%i' /dev/stdin $_lockfile 0<&$_lockfd 2>/dev/null )
> > >
> > > Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > >
> > > Has anyone executed this ?
> >
> > I have, of course, to confirm this fixes my issue. But I'm not sure
> > that's what you've meant to ask - you may have wanted assurance
> > that someone else has also tried it.
> 
> Tested-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

:-).

Thanks,
Ian.

