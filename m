Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0D7C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:57:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 489522133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 489522133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEXO4-0006Xj-N8; Thu, 11 Apr 2019 10:56:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SOEG=SN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEXO3-0006Xe-PE
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:56:55 +0000
X-Inumbo-ID: 84b2976f-5c48-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 84b2976f-5c48-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:56:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42BDC374;
 Thu, 11 Apr 2019 03:56:24 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAADA3F59C;
 Thu, 11 Apr 2019 03:56:22 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <30339f8e-70c0-792b-7f05-8567d4e99f85@arm.com>
Date: Thu, 11 Apr 2019 11:56:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190410142408.22848-22-ian.jackson@eu.citrix.com>
Content-Language: en-US
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411105621.NYlDqWIl5AsodvRFouIuzijDzXimCiwPmAsu1fDmidY@z>

SGksCgpPbiA0LzEwLzE5IDM6MjMgUE0sIElhbiBKYWNrc29uIHdyb3RlOgo+IEZyb206IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gRW1waXJpY2FsbHksIG9uIHN0cmV0Y2ggYXJt
aGY6Cj4gCj4gICAgZHJpdmVycy9ncHUvaG9zdDF4L2NkbWEuYzogSW4gZnVuY3Rpb24gYGhvc3Qx
eF9wdXNoYnVmZmVyX2luaXQnOgo+ICAgIGRyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmM6OTQ6NDg6
IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2YgYGRtYV9hbGxvY193YycgZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlIFstV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+
ICAgICAgIHBiLT5tYXBwZWQgPSBkbWFfYWxsb2Nfd2MoaG9zdDF4LT5kZXYsIHNpemUsICZwYi0+
cGh5cywKPiAJCQkJCQkgIF4KPiBldGMuCj4gCj4gVGhpcyBpcyBibG9ja2luZyB0aGUgdXBncmFk
ZSBvZiB0aGUgWGVuIFByb2plY3QgQ0kgdG8gRGViaWFuIHN0cmV0Y2gKPiBzbyBkaXNhYmxlIGl0
IGZvciBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENDOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CkNoZWVycywKCj4gLS0tCj4gICB0cy1rZXJuZWwtYnVpbGQgfCAzICsrKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90cy1rZXJuZWwtYnVpbGQg
Yi90cy1rZXJuZWwtYnVpbGQKPiBpbmRleCAyMWI4Zjc4YS4uMGJjNDQzZGUgMTAwNzU1Cj4gLS0t
IGEvdHMta2VybmVsLWJ1aWxkCj4gKysrIGIvdHMta2VybmVsLWJ1aWxkCj4gQEAgLTU5NCw2ICs1
OTQsOSBAQCBjYXNlICR7WEVOX1RBUkdFVF9BUkNIfSBpbgo+ICAgICAgICopIDs7Cj4gICBlc2Fj
Cj4gICAKPiArIyBEaXNhYmxlIGNvbXBvbmVudHMgdGhhdCBkb24ndCBidWlsZAo+ICtzZXRvcHQg
Q09ORklHX1RFR1JBX0hPU1QxWCBuCj4gKwo+ICAgZXhpdCAwCj4gICBFTkQKPiAgIH0KPiAKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
