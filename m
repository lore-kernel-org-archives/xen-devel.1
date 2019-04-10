Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C68EC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:48:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3414D20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3414D20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFS6-0003pe-LS; Wed, 10 Apr 2019 15:47:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEFS5-0003pU-Io
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:47:53 +0000
X-Inumbo-ID: ffa0c0b3-5ba7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ffa0c0b3-5ba7-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:47:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83242052"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23726.4132.637193.17047@mariner.uk.xensource.com>
Date: Wed, 10 Apr 2019 16:47:48 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fd1db931-034d-3de5-439a-d78be62a9517@arm.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
 <20190410152749.GA1460@ulmo>	<fd1db931-034d-3de5-439a-d78be62a9517@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 21/62] ts-kernel-build: disable
 host1x, which doesn't build
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thierry Reding <thierry.reding@gmail.com>, Wei Liu <wei.liu2@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410154748.oJV5Sy1dHdbd5n5bWkhyDD9aU_GWu3pCfRgxK5QcwU0@z>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAyMS82Ml0gdHMta2VybmVs
LWJ1aWxkOiBkaXNhYmxlIGhvc3QxeCwgd2hpY2ggZG9lc24ndCBidWlsZCIpOgo+IElhbiBhcmUg
d2UgdXNpbmcgYSBkaWZmZXJlbnQgY29uZmlnIGJldHdlZW4gSmVzc2llIGFuZCBTdHJldGNoPwoK
Tm90IHZlcnkgWzFdLCBidXQgd2UgKmFyZSogdXNpbmcgYSBkaWZmZXJlbnQgY29tcGlsZXIgKHNp
bmNlIHdlIGp1c3QKdXNlIHRoZSBvbmUgZnJvbSB0aGUgZGlzdHJvKS4KClsxXSBUaGVyZSBhcmUg
c29tZSBjaGFuZ2VzIHRvIGFkZCBzb21lIFRodW5kZXJYIGRyaXZlcnMsIGluIGEgcGF0Y2gKdGhh
dCB5b3Ugc3VnZ2VzdGVkIDotKToKCitzZXRvcHQgQ09ORklHX1BDSV9IT1NUX1RIVU5ERVJfUEVN
PXkKK3NldG9wdCBDT05GSUdfUENJX0hPU1RfVEhVTkRFUl9FQ0FNPXkKK3NldG9wdCBDT05GSUdf
VEhVTkRFUl9OSUNfUEY9bQorc2V0b3B0IENPTkZJR19USFVOREVSX05JQ19WRj1tCitzZXRvcHQg
Q09ORklHX1RIVU5ERVJfTklDX0JHWD1tCitzZXRvcHQgQ09ORklHX1RIVU5ERVJfTklDX1JHWD1t
CitzZXRvcHQgQ09ORklHX01ESU9fVEhVTkRFUj1tCitzZXRvcHQgQ09ORklHX0kyQ19USFVOREVS
WD1tCitzZXRvcHQgQ09ORklHX1NQSV9USFVOREVSWD1tCgpJIGRvdWJ0IHRoZXNlIGFyZSByZWxh
dGVkLgoKSXQncyBuaWNlIHRvIGtub3cgdGhhdCBpdCdzIGZpeGVkIGluIDQuMTguICBJIGRvbid0
IGtub3cgaG93CmRpc3J1cHRpdmUgaXQgd291bGQgYmUgdG8gYmFja3BvcnQgaXQuICBJIGNvdWxk
IHBlcmhhcHMgbWFrZSB0aGUKY29uZmlnIG9wdGlvbiB0byBkaXNhYmxlIGhvc3QxeCBjb25kaXRp
b25hbCBvbiB0aGUgTGludXgga2VybmVsCnZlcnNpb24gYnV0IGl0IHNlZW1zIGVhc2llciB0byBq
dXN0IGxlYXZlIHRoaW5ncyBhcyB0aGV5IGFyZSBhbmQgdGFrZQp0aGUgd29ya2Fyb3VuZCBvdXQg
YXQgc29tZSBwb2ludCBpbiB0aGUgZGlzdGFudCBmdXR1cmUgd2hlbiBhbGwKa2VybmVscyB3ZSBj
YXJlIGFib3V0IGhhdmUgdGhlIGZpeC4KClRoYW5rcyBhbGwsCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
