Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA0CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:22:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452546.1667378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHldS-0000Co-To; Fri, 16 Oct 2026 17:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452546.1667378; Fri, 16 Oct 2026 17:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHldS-0000Ch-RB; Fri, 16 Oct 2026 17:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1452546;
 Fri, 16 Oct 2026 17:22:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xHldR-0000Ca-TP
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:22:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHldR-00Bv2A-95
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:22:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad25d11-bab6-0a2a0a5309dd-0a2a4507e2be-48
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:22:25 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad25d4f-b4ea-0a2a45070019-4a68bc04ca29-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:22:24 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69GHMDWV012705
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 16 Oct 2026 13:22:18 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69GHMCOr012704;
 Fri, 16 Oct 2026 10:22:12 -0700 (PDT) (envelope-from ehem)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Fri, 16 Oct 2026 10:22:12 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: chunjie.zhu@citrix.com
Cc: anthony.perard@vates.tech, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] tools/xl: move some logic needed only once earlier in
Message-ID: <atJdRPV04y8NGPRz@mattapan.m5p.com.>
References: <92156ced183670bbbcb2d3f9e2dca4d12f37ee7c.1792017144.git.ehem+xen@m5p.com>
 <20261016050721.251856-1-chunjie.zhu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016050721.251856-1-chunjie.zhu@citrix.com>
X-purgate-ID: tlsNG-ef75cf/1792171345-A7ED6AE4-01232B43/0/0
X-purgate-type: clean
X-purgate-size: 3547

On Fri, Oct 16, 2026 at 01:07:21PM +0800, chunjie.zhu@citrix.com wrote:
> On Mon, Oct 12, 2026 at 06:03:49 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> 
> > The value of dom_info->console_autoconnect isn't going to change if a
> > domain is rebooted.  Nor does this logic need the lock to be held.  As
> > such moving this earlier makes sense.
> >
> > The policy domain is set once and then never changed.  Similar to above
> > simply move before the reboot start point.
> >
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> > ---
> >  tools/xl/xl_vmcontrol.c | 32 +++++++++++++++-----------------
> >  1 file changed, 15 insertions(+), 17 deletions(-)
> >
> > diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> > index 76c2a07ee8..ae7985122f 100644
> > --- a/tools/xl/xl_vmcontrol.c
> > +++ b/tools/xl/xl_vmcontrol.c
> > @@ -717,7 +717,8 @@ int create_domain(struct domain_create *dom_info)
> >      int restore_fd = -1;
> >      int restore_fd_to_close = -1;
> >      int send_back_fd = -1;
> > -    const libxl_asyncprogress_how *autoconnect_console_how;
> > +    const libxl_asyncprogress_how *autoconnect_console_how = NULL;
> > +    libxl_asyncprogress_how autoconnect_console_how_buf;
> >      int notify_pipe[2] = { -1, -1 };
> >      struct save_file_header hdr;
> >      uint32_t domid_soft_reset = INVALID_DOMID;
> > @@ -921,6 +922,19 @@ int create_domain(struct domain_create *dom_info)
> >      if (dryrun_only)
> >          goto out;
> >
> > +    if (dom_info->console_autoconnect) {
> > +        if (libxl_pipe(ctx, notify_pipe)) {
> > +            ret = ERROR_FAIL;
> > +            goto error_out;
> > +        }
> 
> It looks like a functional regression for the reboot path. Right before
> "goto start;" on the guest-reboot path there is:
> 
>     /*
>      * Do not attempt to reconnect if we come round again due to a
>      * guest reboot -- the stdin/out will be disconnected by then.
>      */
>     dom_info->console_autoconnect = 0;
> 
> On reboot, dom_info->console_autoconnect is cleared before "goto start",
> but autoconnect_console_how now stays non-NULL, since it is no longer
> recomputed after "start:". The second create call will invoke
> autoconnect_console with the already-closed notify_pipe[1], and the
> read(notify_pipe[0]) will fail with EBADF.

Yeah, I spotted this before you sent the message, but didn't get things
done before you'd sent the message.

It gets worse.  I'm pretty sure the patch is mostly correct, but this
needed to be propogated further.  The one and only consequence of the
above hunk is to cause the `autoconnect_console_how = 0;` line to
trigger.

In turn the one and only consequence of that setting is
`libxl_domain_soft_reset()` gets passed 0/NULL as its final argument.
The `libxl_domain_soft_reset()` call is only done on domain reboots.
Worse, `libxl_domain_soft_reset()` is *always* done on domain reboots.

I've got the patch in my tree with the hunk you noticed removed and the
call to `libxl_domain_soft_reset()` hard-coding the final argument as
NULL.  The only question is whether the comment should be preserved just
before the `libxl_domain_soft_reset()` call.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



