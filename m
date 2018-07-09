From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 2/2] x86/altp2m: Add a subop for
 obtaining the memaccess of a page
Date: Mon, 9 Jul 2018 11:44:44 +0300
Message-ID: <30617831-b556-9454-1c58-bdb4d76b3f76@bitdefender.com>
References: <20180705104445.8048-1-apop@bitdefender.com>
 <20180705104445.8048-3-apop@bitdefender.com>
 <5B431E5202000078001D2313@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6lqt=jz=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fcRmt-0004Is-Ni
 for xen-devel@lists.xenproject.org; Mon, 09 Jul 2018 08:44:51 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id E8672307FB19
 for <xen-devel@lists.xenproject.org>; Mon,  9 Jul 2018 13:01:01 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 0B9607FC42
 for <xen-devel@lists.xenproject.org>; Mon,  9 Jul 2018 11:44:49 +0300 (EEST)
In-Reply-To: <5B431E5202000078001D2313@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMjAxOCAxMTozNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMDcu
MTggYXQgMTI6NDQsIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IEJvdGggYWx0cDJt
IGdldC9zZXQgbWVtYWNjZXNzIGZ1bmN0aW9ucyB1c2UgdGhlIHN0cnVjdAo+PiB4ZW5faHZtX2Fs
dHAybV9tZW1fYWNjZXNzIHdoaWNoIGhhcyBub3cgZHJvcHBlZCB0aGUgYHNldCcgcGFydCBhbmQg
aGFzCj4+IGJlZW4gcmVuYW1lZCBmcm9tIHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4KPiAK
PiBMb29raW5nIHRocm91Z2ggdGhpcyBwYXRjaCAtIHdoYXQncyB0aGUgcG9pbnQgb2YgcGF0Y2gg
MT8gVGhlcmUncyBubwo+IGZ1cnRoZXIgdXNlciBiZWluZyBpbnRyb2R1Y2VkIGhlcmUuCgpJIHRo
aW5rIGl0IHdhcyBtZWFudCBqdXN0IGFzIGNvZGUgY2xlYW51cCBmb3Igbm93LCBwcm9iYWJseSBh
bHNvIHRvIGJlCnVzZWQgaW4gbGF0ZXIgcGF0Y2hlcy4KCgpUaGFua3MsClJhenZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
