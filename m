From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Wed, 12 Sep 2018 07:01:40 +0300
Message-ID: <20180912040140.GA17195@hel>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
 <CABfawhmgzWvZJF-uD-ro7aUHFcZruBWQsRMAZz=rpUc7aa2BEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mfac=l2=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fzwLa-0005Di-Gj
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 04:01:46 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 5D7E5301AB28
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 07:01:44 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 4938A7FBFF
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 07:01:44 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <CABfawhmgzWvZJF-uD-ro7aUHFcZruBWQsRMAZz=rpUc7aa2BEg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMTI6MDI6MzlQTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDMsIDIwMTggYXQgOTo0OCBBTSBBZHJpYW4gUG9wIDxhcG9w
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBv
cCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4gCj4gQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXNAdGtsZW5neWVsLmNvbT4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
