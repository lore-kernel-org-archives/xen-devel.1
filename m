Return-Path: <SRS0=7n4I=7S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AE2C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 08:54:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C1B207D0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 08:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C1B207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh87I-0007yj-Fy; Fri, 05 Jun 2020 08:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jh87H-0007ye-02
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:54:19 +0000
X-Inumbo-ID: 239672ae-a70a-11ea-9b55-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 239672ae-a70a-11ea-9b55-bc764e2007e4;
 Fri, 05 Jun 2020 08:54:18 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aZMt2FD1IV9QWwNk8SKVGu61Py02cuLTD6W6fo2h9CuTR5FocdgXdWUusNyxbIQs/DsB14qbk8
 QA6FxinrgLmRrz2Two4GCQIKfSxqHwkBnQ/awUvEecH14I199y/QgFaiRrzXA8vXFY8mcZ8WTt
 fozyh9FktrIDSLF3gI6zY1zeUGAzutcNqoM+8MH+/d6HNXCPZpXoAJnNGBB1FyjmkbaAMHJX6H
 y2yDIZKqe0XzT5XNe0+9d666EUMyYVRvR1AmsWXRgEFsu1u4g5g3sYBwT+sT7m4FhnhcPQngKZ
 D84=
X-SBRS: 2.7
X-MesageID: 19599463
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,475,1583211600"; d="scan'208";a="19599463"
Date: Fri, 5 Jun 2020 10:54:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
Message-ID: <20200605085150.GK1195@Air-de-Roger>
References: <20200605075006.51238-1-roger.pau@citrix.com>
 <000201d63b0f$c2d27910$48776b30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000201d63b0f$c2d27910$48776b30$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 09:03:11AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 05 June 2020 08:50
> > To: xen-devel@lists.xenproject.org
> > Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew
> > Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> > Subject: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH dom0
> > 
> > At some point (maybe PVHv1?) mediated access to the RTC was provided
> > for PVH dom0 using the PV code paths (guest_io_{write/read}). At some
> > point this code has been made PV specific and unhooked from the
> > current PVH IO path. This patch provides such mediated access to the
> > RTC for PVH dom0, just like it's provided for a classic PV dom0.
> > 
> > Instead of re-using the PV paths implement such handler together with
> > the vRTC code for HVM, so that calling rtc_init will setup the
> > appropriate handlers for all HVM based guests.
> > 
> > Without this a Linux PVH dom0 will read garbage when trying to access
> > the RTC, and one vCPU will be constantly looping in
> > rtc_timer_do_work.
> > 
> > Note that such issue doesn't happen on domUs because the ACPI
> > NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> > the RTC.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > for-4.14 reasoning: the fix is completely isolated to PVH dom0, and as
> > such the risk is very low of causing issues to other guests types, but
> > without this fix one vCPU when using a Linux dom0 will be constantly
> > looping over rtc_timer_do_work with 100% CPU usage, at least when
> > using Linux 4.19 or newer.
> > ---
> 
> I can't say I'm a big fan of the code duplication with emul-priv-op.c, but it's not much code and it does keep this patch small. If the maintainers are happy to ack then consider this...

Calling guest_io_{write/read} straight away is no acceptable IMO (and it
would have to be moved out of emul-priv-op.c), and splitting the RTC
accessors into separate helpers seemed like a lot of churn for the
actual code that such helpers would contain.

> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks.

