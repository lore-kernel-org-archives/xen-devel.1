From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH v4 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Mon, 27 Aug 2018 12:38:52 +0300
Message-ID: <20180827093852.GB1307@hel>
References: <20180725111857.22995-1-apop@bitdefender.com>
 <20180725111857.22995-4-apop@bitdefender.com>
 <5B604B8302000078001D9692@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pdfo=lk=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fuDz4-0007JH-9x
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 09:38:54 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id B622A305FFA6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 12:38:52 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (unknown [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 9D6487FE6B
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 12:38:52 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <5B604B8302000078001D9692@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDU6NDQ6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI1LjA3LjE4IGF0IDEzOjE4LCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+ID4gKysrIGIv
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+ID4gQEAgLTM4LDcgKzM4LDcgQEAgc3Ry
dWN0IHhlbl9odm1fcGFyYW0gewo+ID4gIHR5cGVkZWYgc3RydWN0IHhlbl9odm1fcGFyYW0geGVu
X2h2bV9wYXJhbV90Owo+ID4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9odm1fcGFyYW1f
dCk7Cj4gPiAgCj4gPiAtc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9zdXBwcmVzc192ZSB7Cj4g
PiArc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsKPiAKPiBQbGVhc2UgYWRkIHRo
aXMgd2l0aG91dCB0aGUgInNldF8iIHJpZ2h0IGF3YXkgaW4gcGF0Y2ggMi4KClN1cmUuICBUaGFu
a3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
