Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FDAC433E6
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 10:47:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DFF64ECF
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 10:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DFF64ECF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77959.141587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RIr-0000Pp-Ih; Fri, 29 Jan 2021 10:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77959.141587; Fri, 29 Jan 2021 10:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RIr-0000Pi-FY; Fri, 29 Jan 2021 10:47:01 +0000
Received: by outflank-mailman (input) for mailman id 77959;
 Fri, 29 Jan 2021 10:47:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5RIq-0000PX-11
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:47:00 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 803ed90d-24f7-4d7d-9ea8-4832063cbd92;
 Fri, 29 Jan 2021 10:46:59 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TAkr7x014070;
 Fri, 29 Jan 2021 11:46:53 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 1F2BA281D; Fri, 29 Jan 2021 11:46:53 +0100 (CET)
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
X-Inumbo-ID: 803ed90d-24f7-4d7d-9ea8-4832063cbd92
Date: Fri, 29 Jan 2021 11:46:53 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <20210129104653.GG2015@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org>
 <YBKbEhavZlpD75fU@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBKbEhavZlpD75fU@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Fri, 29 Jan 2021 11:46:53 +0100 (MET)

On Thu, Jan 28, 2021 at 12:08:02PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 11:47:58PM +0100, Manuel Bouyer wrote:
> > Pass bridge name to qemu as command line option
> > When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> > to be used by qemu helper scripts
> > The only functional difference of using the br parameter is that the
> > bridge name gets passed to the QEMU script.
> > NetBSD doesn't have the ioctl to rename network interfaces implemented, and
> > thus cannot rename the interface from tapX to vifX.Y-emu. Only qemu knowns
> > the tap interface name, so we need to use the qemu script from qemu itself.
> > 
> > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> If you have a moment might be worth adding a note in
> xl-network-configuration.5.pod that NetBSD in HVM mode requires
> bridged networking I think?

With the default qemu-ifup script only. As you can do whatever you want
in the script, you can support whatever network configuration you want.
It's quite easy to do IP routing for example.

> 
> Also, the qemu-ifup script doesn't seem to be part of the NetBSD
> scripts that are upstream, is this something carried by the NetBSD
> package?

Ha maybe I overlooked this. I'll add it, but maybe it can be submitted in
a separate patch ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

