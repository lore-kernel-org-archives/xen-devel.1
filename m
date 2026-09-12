Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42257C79FB6
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 08:49:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418292.1646465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5JQN-0003z9-HK; Sat, 12 Sep 2026 08:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418292.1646465; Sat, 12 Sep 2026 08:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5JQN-0003z1-Cv; Sat, 12 Sep 2026 08:49:27 +0000
Received: by outflank-mailman (input) for mailman id 1418292;
 Sat, 12 Sep 2026 08:49:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a094ce8ccb000c4f3@swg.vates.tech>)
 id 1x5JQM-0003yv-5H
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 08:49:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5JQL-004L2T-FE
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 10:49:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a094ce8ccb000c4f3@swg.vates.tech>)
 id 6aa511eb-8faa-0a2a0a5109dd-0a2a4509d364-22
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 10:49:25 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a094ce8ccb000c4f3@swg.vates.tech>)
 id 6aa51213-be1a-0a2a45090019-b9ff1c22a2cb-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 10:49:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a094ce8ccb000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 12 Sep 2026 08:49:19 +0000
Received: from [192.168.1.46] (88-183-178-13.subs.proxad.net [88.183.178.13])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C8C3581C9B;
 Sat, 12 Sep 2026 10:49:14 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=9ds9os1bCD8ftijN8a/IzEw6y6RSqfDObnnO6Ib1gzg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Hew6zxYX2tI0AT5t8KCA5AzMRIl9tjbIjAvEHuQkgkV/ZGMHb9DxsWXdEYN1uc7Uj6kovi4hs
 wvOngk3YyCePN+xDpdzS6/sG/v0A5TSde4Hs7WGZ5bML//SMtPJOiHYOXfbgsvEuAh8D84kL52W
 RqObMTe7a3mSfodydFMgadPq5YDYfT1Jg3dFqlIWedEBRkfrlYObmdpxTivO/6teVMGaygix+S1
 J93On+IEwTLCiiplJws98FblfbZWwOiZ6XVs7jXkqjlRQV+xV3nXy7MHTGZJFs6otD8lS9imtut
 rhk7ZsktmzC2snD/PFEt358IKzrXZRXd0qWNR2DESbQw==
X-Zone-Loop: 23f04bb1aedf245a9df8f5ce3f5877ad2fc6eaee4665
x-campaign-type: default
x-transaction-id: bb7b05b2-88f9-4ad1-9db6-bfbca1634416
x-swg-uid: 01-0203a3e2-e025-4893-a6c7-2687883c8a24
X-Mailer: Sweego
Message-ID:
 <1789202959.8631fc262581453bbf619ec5b2062170.1a094ce8ccb000c4f3@vates.tech>
x-swg-bid: 1789202959.8631fc262581453bbf619ec5b2062170.1a094ce8ccb000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Add basic b4 config file
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <89c7c026-3986-440a-b2d1-158eb5f0fbbe@citrix.com>
References: <1789133309.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@vates.tech>
 <89c7c026-3986-440a-b2d1-158eb5f0fbbe@citrix.com>
Date: Sat, 12 Sep 2026 10:49:07 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789202947; l=2458;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ZYeDOhJpAcGq2IenvR4OpMIVcfyFogtM5bp2pwbw9ZQ=;
 b=CRrz4yyPdLuNkcuZooo5xpZJQGC53XsXqHaR8wWw54vkzr7vAF5rBK/HBmUA0H7B1OIZPMOEb
 SJ6C+q0LCoHBslUvxPspTRlgiSkcZf9pJoD/zVJU7T1gB5T2ziGBcgN
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789202958849
X-purgate-ID: tlsNG-bad1c0/1789202965-3A8D9034-7FE7CECF/0/0
X-purgate-type: clean
X-purgate-size: 2462

On 2026-09-11 17:45:37+01:00, Andrew Cooper wrote:
> On 11/09/2026 2:28 pm, Baptiste Le Duc wrote:
> 
> > b4[1] is a convenient tool for mail-based contribution. A config file[2]
> > tracked in the tree lets the project ship a few defaults that match the Xen
> > patch submission rules.
> >
> > This aims to help new contributors who have never used a mailing list avoid
> > mistakes when sending their patch series.
> >
> > The tree has no scripts/checkpatch.pl or equivalent, so there is nothing
> > for b4 to run per patch. Disable the needs-checking pre-flight check so a
> > series can be sent without first running b4 prep --check.
> >
> > [1] https://pypi.org/project/b4/
> > [2] https://b4.docs.kernel.org/en/latest/config.html
> >
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> I don't use b4 for preparing series myself, but I can see how this would
> be useful for newcomers.
> 
> > ---
> >  .b4-config | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/.b4-config b/.b4-config
> > new file mode 100644
> > index 0000000000..1ca1f0625e
> > --- /dev/null
> > +++ b/.b4-config
> > @@ -0,0 +1,13 @@
> > +#
> > +# Common b4 settings for sending patches to the Xen Project upstream.
> > +# https://b4.docs.kernel.org/
> > +#
> > +# See docs/process/sending-patches.pandoc for the patch submission rules
> > +# these settings implement.
> 
> I doubt people will be reading this file to discover how to send
> patches, and that piece of documentation is in the process of moving
> into the handbook.
> 
> I suggest dropping this sentence.  All that's going to happen to it is
> becoming stale shortly.
You're right, I'll drop it in v2, thanks.
> 
> > +#
> > +
> > +[b4]
> > +	send-series-to = xen-devel@lists.xenproject.org
> > +	send-auto-to-cmd = echo
> > +	send-auto-cc-cmd = ./scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback
> 
> Where did this come from?   Because it didn't come from Xen's version of
> get_maintainers, which is a long way removed from Linux's

It came from QEMU. I double-checked, and indeed Xen's get_maintainer.pl
doesn't support the negated form of these options, except for --nogit.
However, --nogit is already part of the default options, so none of
these flags are actually needed. I'd suggest:

  send-auto-cc-cmd = ./scripts/get_maintainer.pl

What do you think?
> 
> ~Andrew



