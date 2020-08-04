Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81C2C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 11:36:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8C320738
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 11:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GvyadbTW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8C320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2vEF-0005P9-Fa; Tue, 04 Aug 2020 11:35:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MwBG=BO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k2vEE-0005P4-Ez
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:35:34 +0000
X-Inumbo-ID: 4ba57c47-3bab-41d7-a3d1-ef4d43c6abb3
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ba57c47-3bab-41d7-a3d1-ef4d43c6abb3;
 Tue, 04 Aug 2020 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596540934;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=xHGxEqLb1d3XP+GToLDqmxMFCU2q6yG9payxSnf3CRc=;
 b=GvyadbTWHy4J+mCqOL07UqPJjXrSZAayYS1mQMym+yqtqyvw8W965jmz
 0A49xkH1JF1ESKi93NIJ2lELNCvo5PT10LRtRk+U9TD/Gj9Nl0/FQx0sH
 zDtisyhkBhr9Q9jH6x04+wUGUrJc/k7Y7TSfbZb/Sc4SGhyexeXhQ9KPK U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0ZpsD4Fll3JfMsMxbR53dUoSCU8buiSAMBxphrNHYIjByu7eT1jx4jQgAX17eugdX++O27KyqF
 gUm/WRXuJXYFN67fZesn0X/E2ZkPZB0n6u4PK5YuP0XQV9Hoywf1xuLhCppliZuqlbTEg/PH+w
 8lSq+m+QdIKVtiYYnOOA/3zhY7wTG7/tr4bpkLgVEesaOUUMY1XjPWzvHaTTIeCm808866atZL
 yp1A168Vjm21p43zgDhU3SZPrYL1rcMs9VokP8bRzs6c6Z7w+Qt29ZIMwPT+xr4H1qH9nQlWKr
 cAQ=
X-SBRS: 3.7
X-MesageID: 23796862
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,433,1589256000"; d="scan'208";a="23796862"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24361.18433.500622.984594@mariner.uk.xensource.com>
Date: Tue, 4 Aug 2020 12:35:29 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
In-Reply-To: <002001d66a51$3cd055f0$b67101d0$@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-5-paul@xen.org>
 <24361.17132.762055.478992@mariner.uk.xensource.com>
 <002001d66a51$3cd055f0$b67101d0$@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 'Paul
 Durrant' <pdurrant@amazon.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
> > Sent: 04 August 2020 12:14
> > To: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>
> > Subject: Re: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore
> > 
> > Paul Durrant writes ("[PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via
> > xenstore"):
> > > +       XENBUS_PATH="/local/domain/$domid/device/vif/$devid"
> > > +       xenstore_write "$XENBUS_PATH/mtu" ${mtu}
> > 
> > It's surprising to me that this code doesn't have the xenbus path
> > already in some variable.  But I guess from the fact that you've added
> > this code, that it doesn't.
> 
> It is set, but set to the backend path. For safety I guess it's probably best if I use a local in this instance. Can I keep your R-b
> with such a change?

Oh, wow.  I hadn't realised that.  I take back my earlier R-b :-).

Can you please use a different variable name for the frontend path ?

...

Actually.

This shouldn't be in the frontend at all, should it ?  In general the
backend writes to the backend and the frontend to the frontend.

So maybe I need to take back my R-b of
  [PATCH v2 3/4] public/io/netif: specify MTU override node

Sorry for the confusion.  I seem rather undercaffienated today.

Ian.

