Return-Path: <SRS0=Q/fq=BX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4ABC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 10:02:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2797020781
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 10:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Rc188J3P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2797020781
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6A4C-0008Dn-M8; Thu, 13 Aug 2020 10:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k6A4B-0008Di-QH
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 10:02:35 +0000
X-Inumbo-ID: 157eb5a9-ca11-4808-bdf3-7cd3763e4473
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 157eb5a9-ca11-4808-bdf3-7cd3763e4473;
 Thu, 13 Aug 2020 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597312954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kkFMyNBbOdtaKP3s0IKVuqUHyo7Vk4EymQC6D+Rwakc=;
 b=Rc188J3Ps3oRYU00AsDTa1+Y+SB2tH10tfMeBK/g8iYgSv4+pcrwka9q
 DVknnN1SulQYeo1DKWY4HVnM3T/e51Of7gdbvcdHqP3FJcT1GwByHOMgL
 weBVYWy/QJ1Kd9R+OC+RUQ3P4tqdwFGutcwtnqNHqD6OL8TOVsDI5Kqsr w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wDtbUOGkC+v+QIiO9GW5InSj95+N5bZvHh0cz2sCfx8x8/0y/wKXIBeFTsdWA5IVAl9fHYeLN9
 bkgatnmpc6dbgREHUynY40qpDjj/p707iFysIZlm+vriXLDuiKG2hWjEZM5lJMCBJKbBHnmRzT
 Ek4wVev1cfJou5ZUSJS2/wZJUJSBFN8IxZXcndS/Kdi0ZOoHWEwqy1VaqoDA1I5FfmKdrqia00
 lv846+KFNsoIoemtWsa3un39WI8J3cPm1e5CBVfxjR5zuJsQM3Dozc/9+9CouCiP2ZBQIjfCnw
 Sa8=
X-SBRS: 2.7
X-MesageID: 24601489
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="24601489"
Date: Thu, 13 Aug 2020 12:02:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: Christoph Hellwig <hch@infradead.org>, <linux-kernel@vger.kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, David Airlie
 <airlied@linux.ie>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>, Yan Yankovskyi
 <yyankovskyi@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Michal Hocko <mhocko@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813100226.GG975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
 <20200813094946.GJ2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200813094946.GJ2352366@phenom.ffwll.local>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Your email client seems to set 'Reply-to:' to point to everyone on the
'Cc:' field, but not yourself, which is kind of weird. I've manually
fixed it on this reply by moving everyone to the 'Cc:' field and
setting you on 'To:'.

On Thu, Aug 13, 2020 at 11:49:46AM +0200, Daniel Vetter wrote:
> On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monné wrote:
> > On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> > > On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > > unpopulated physical memory ranges to map foreign pages, which is the
> > > > correct thing to do in order to avoid mappings of foreign pages depend
> > > > on memory hotplug.
> > > 
> > > So please just select ZONE_DEVICE if this is so much better rather
> > > than maintaining two variants.
> > 
> > We still need to other variant for Arm at least, so both need to be
> > maintained anyway, even if we force ZONE_DEVICE on x86.
> 
> Why does arm not have ZONE_DEVICE?

It's not that Arm doesn't have ZONE_DEVICE, it's just that the
approach used here won't work correctly on an Arm Xen dom0 as-is.

This is due to the usage of an identity second stage translation in
order to workaround the lack of an IOMMU in some Arm boards.

It can be made to work on Arm, but will likely require someone from
the Arm side doing that.

Roger.

