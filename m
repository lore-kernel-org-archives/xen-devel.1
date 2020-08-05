Return-Path: <SRS0=fGkr=BP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0F5C433DF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2020 10:13:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C58E2177B
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2020 10:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="hX1Lgsj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C58E2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3GQM-00069e-Kn; Wed, 05 Aug 2020 10:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gIoy=BP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k3GQL-00069Z-JS
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 10:13:29 +0000
X-Inumbo-ID: 3e590cc4-dab6-4703-818b-1afd6e1d0db2
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e590cc4-dab6-4703-818b-1afd6e1d0db2;
 Wed, 05 Aug 2020 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596622408;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=pjG3v7tmHzM7X0me8MnApuXBjsCzdEESNfqc7e2/qxU=;
 b=hX1Lgsj6uIzwhgzlk2Dcsd7KKZMhE+J+/v6bz5gKL1oAdNsIBdYvwtIw
 4wncaiX4MwfsFMSmxfE0DPdQNJnb3tnFKuRZ3ldEdJDw9dCvdwgj4Rur8
 GTHp1NjxdU7RjkSsd3uwXYDMFm8KL3gIA0CF4H2MBu4+qLEEpZmhaXUG+ k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ablncfU/hRROiiFatEA3enkULTpRhqCFDPWlbDAwFm2fG0LCxhl/JF3sd8LkANW4vfRFIxxBE+
 k/nw0YqgJbOsWqskSwXHJYPAw0OdmYpgMjYRFMI/mQA20poD/R+ULlVubKzssD7pfb5wM8dIzU
 56DPeOjiq7slsjbRCS1zzmsVCTIvLgclZndanBteOVbpd4xNIgTQ3tvhfKg/GcLtdvtpqk40/x
 Jr9h++69hBj4B9f+Hq9UFnoiiWKmBSpan7bp6YL7jDNOm9UbtoF74bcl7QydbONESSZEKqq0T8
 Cvw=
X-SBRS: 3.7
X-MesageID: 24804478
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24804478"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24362.34372.501505.911622@mariner.uk.xensource.com>
Date: Wed, 5 Aug 2020 11:13:24 +0100
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
In-Reply-To: <f1e3c392c45246e1aba7329d1b03da5b@EX13D32EUC003.ant.amazon.com>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-5-paul@xen.org>
 <24361.17132.762055.478992@mariner.uk.xensource.com>
 <002001d66a51$3cd055f0$b67101d0$@xen.org>
 <24361.18433.500622.984594@mariner.uk.xensource.com>
 <002801d66a63$85fb8c10$91f2a430$@xen.org>
 <24362.31810.819871.943707@mariner.uk.xensource.com>
 <f1e3c392c45246e1aba7329d1b03da5b@EX13D32EUC003.ant.amazon.com>
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
 'Wei Liu' <wl@xen.org>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Durrant, Paul writes ("RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
...
> Well, I guess we address the driver domain issue in this way
> too... I will add a patch to libxl to write the libxl_device_nic mtu
> value into xenstore,

Do you mean libxl in dom0 or libxl in the driver domain ?

libxl contains code that runs in both contexts.

See device_hotplug in libxl_device.c, in particular notice
    if (aodev->dev->backend_domid != domid) {

If you want the mtu to be read from the bridge, it can only be
determined by the driver domain, because the bridge is in the driver
domain.

In v2 of this series you arrange for the hotplug script to copy the
mtu from the bridge into the frontend path.  That won't work because
the hotplug script can't write to that xenstore node because (unlike a
domo0 backend) a driver domain backend doesn't have write access to
the frontend so can't create a new node there.

ISTM that it is correct that it is the hotplug script that does this
interface setup.  If it weren't for this erroneous use of the frontend
path I think the right design would be:
  * toolstack libxl reads the config file to find whether there is an MTU
  * toolstack libxl writes mtu node in backend iff one was in config
    (and leaves the node absent otherwise)
  * driver domain libxl runs hotplug script
  * driver domain hotplug script looks for mtu in backend; if there
    isn't one, it gets the value from the bridge and writes it to
    the backend in xenstore
  * driver domain backend driver reads mtu value from backend path
  * guest domain frontend driver reads mtu value from backend path
  * on domain save/migrate, toolstack libxl will record the mtu
    value as the actual configuration so that the migrated domain
    will get the same mtu

I don't think I understand what (in these kind of terms) you are
proposing, in order to support the frontends that want to read the mtu
from the frontend.

>  I think the current setting of 1492 can be changed to 1500 safely
> (since nothing appears to currently use that value).

Right, that seems correct to me.

> The hotplug script should then have sufficient access to update, and
> a subsequent patch can add a mechanism to set the value from the
> config.

I think what I am missing is how this "subsequent patch" would work ?
Ie what design are we aiming for, that we are now implementing part
of ?

Ian.

