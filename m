Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC40AC04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 15:42:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB2D2084A
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 15:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB2D2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQZZB-0006sx-Ua; Tue, 14 May 2019 15:42:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQZZA-0006ss-HR
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:42:08 +0000
X-Inumbo-ID: d3c2edcd-765e-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3c2edcd-765e-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 15:42:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="85449415"
Date: Tue, 14 May 2019 16:42:04 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190514154204.GI2798@zion.uk.xensource.com>
References: <20190514080558.14540-1-olaf@aepfle.de>
 <20190514101452.10c40b6e.olaf@aepfle.de>
 <20190514143855.GH2798@zion.uk.xensource.com>
 <20190514164419.23f9f545.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514164419.23f9f545.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514154204.u41-2KFWo-T237fNEBoMK5AyW1WUxWcAmOdlXUbYMC0@z>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDQ6NDQ6MTlQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVHVlLCAxNCBNYXkgMjAxOSAxNTozODo1NSArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiA+IFdoaWxlIGl0IGlzIGVhc3kgZm9yIHRo
ZSByZXN1bWUgcGF0aCwgZG9pbmcgdGhlIHNhbWUgaW4gdGhlIHN1c3BlbmQgcGF0aAo+ID4gPiBu
ZWVkcyBtb3JlIGNoYW5nZXMuIGxpYnhsX19kb21haW5fc3VzcGVuZF9kZXZpY2VfbW9kZWwgd291
bGQgbmVlZCB0byByZWNlaXZlCj4gPiA+IHRoZSBjYWxsYmFjayBhbmQgc2V0IGl0IGlmIGEgZGV2
aWNlIG1vZGVsIGlzIGFjdGl2ZS4gIAo+ID4gCj4gPiBXaGF0IGRvIHlvdSBtZWFuIGhlcmU/IENh
bid0IHlvdSBoYW5kbGUgdGhlIE5PTkUgY2FzZSBqdXN0IGxpa2UgeW91IGRvCj4gPiBpbiB0aGUg
cmVzdW1lIGZ1bmN0aW9uPwo+IAo+IEl0IG1lYW5zIGNhbGxpbmcgbGlieGxfX2RvbWFpbl9zdXNw
ZW5kX2RldmljZV9tb2RlbCB1bmNvbmRpdGlvbmFsbHksIGFuZAo+IGxldCB0aGF0IGZ1bmN0aW9u
IGRlY2lkZSB3aGF0IHRvIGRvLiBNYXliZSB0aGVyZSBpcyBubyBkb3duc2lkZSB0byBzZXQgdGhl
Cj4gY2FsbGJhY2sgdW5jb25kaXRpb25hbGx5LCBJIHdpbGwgY2hlY2sgdGhhdC4KClN1cmUuIElu
IHRoZSBtZWFudGltZSBJIHdpbGwgYXBwbHkgdGhpcyBwYXRjaCBhdCBzb21lIHBvaW50IHRvIGZp
eCB0aGUKYnVnIGZpcnN0LgoKV2VpLgoKPiAKPiBPbGFmCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
