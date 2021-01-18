Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD0C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 19:05:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE6920715
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 19:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE6920715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69996.125539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZqL-0002sn-FY; Mon, 18 Jan 2021 19:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69996.125539; Mon, 18 Jan 2021 19:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZqL-0002sg-CF; Mon, 18 Jan 2021 19:05:37 +0000
Received: by outflank-mailman (input) for mailman id 69996;
 Mon, 18 Jan 2021 19:05:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skM3=GV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l1ZqJ-0002sZ-Mj
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 19:05:35 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac86f5ee-82ca-4adc-8e54-71894376a771;
 Mon, 18 Jan 2021 19:05:34 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10IJ5Sgm019975;
 Mon, 18 Jan 2021 20:05:28 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id CDBAC281D; Mon, 18 Jan 2021 20:05:28 +0100 (CET)
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
X-Inumbo-ID: ac86f5ee-82ca-4adc-8e54-71894376a771
Date: Mon, 18 Jan 2021 20:05:28 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] gdbsx: use right path for privcmd
Message-ID: <20210118190528.GA1106@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-8-bouyer@antioche.eu.org>
 <20210118180349.l52rbadmmfe4l6qm@Air-de-Roger>
 <c1375ce9-7750-8443-22aa-41e4cf4713d7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1375ce9-7750-8443-22aa-41e4cf4713d7@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 18 Jan 2021 20:05:29 +0100 (MET)

On Mon, Jan 18, 2021 at 06:45:42PM +0000, Andrew Cooper wrote:
> On 18/01/2021 18:03, Roger Pau Monné wrote:
> > On Tue, Jan 12, 2021 at 07:12:28PM +0100, Manuel Bouyer wrote:
> >> From: Manuel Bouyer <bouyer@netbsd.org>
> >>
> >> On NetBSD the privcmd interface node is /kern/xen/privcmd
> >>
> >> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> >> ---
> >>  tools/debugger/gdbsx/xg/xg_main.c | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
> >> index ce95648e7e..83a009c195 100644
> >> --- a/tools/debugger/gdbsx/xg/xg_main.c
> >> +++ b/tools/debugger/gdbsx/xg/xg_main.c
> >> @@ -130,11 +130,11 @@ xg_init()
> >>      int flags, saved_errno;
> >>  
> >>      XGTRC("E\n");
> >> -    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1) {
> >> -        if ((_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1) {
> >> -            perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd\n");
> >> -            return -1;
> >> -        }
> >> +    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1 &&
> >> +        (_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1 &&
> >> +	(_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {
> > Nit: hard tab instead of spaces.
> >
> >> +        perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or /kern/xen/privcmd\n");
> > I would have split the line, so:
> >
> >         perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or "
> > 	       "/kern/xen/privcmd\n");
> >
> > If you can resend with those fixed please add:
> >
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'd shorten it to just "Failed to open privcmd".  I can fix on commit if
> you're happy.

fine with me, thanks !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

