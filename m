From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH v2 2/2] x86/altp2m: Add a subop for
 obtaining the memaccess of a page
Date: Wed, 18 Jul 2018 12:24:50 +0300
Message-ID: <20180718092450.GA7520@hel>
References: <20180705104445.8048-1-apop@bitdefender.com>
 <20180705104445.8048-3-apop@bitdefender.com>
 <5B431E5202000078001D2313@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h/vn=kc=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1ffihp-0002ml-3d
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:25:09 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 85832307FB18
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jul 2018 13:41:21 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id C81917FE69
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jul 2018 12:25:06 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <5B431E5202000078001D2313@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDI6MzU6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjA3LjE4IGF0IDEyOjQ0LCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+ID4gQm90aCBhbHRwMm0gZ2V0L3NldCBtZW1hY2Nlc3MgZnVuY3Rpb25zIHVzZSB0aGUg
c3RydWN0Cj4gPiB4ZW5faHZtX2FsdHAybV9tZW1fYWNjZXNzIHdoaWNoIGhhcyBub3cgZHJvcHBl
ZCB0aGUgYHNldCcgcGFydCBhbmQgaGFzCj4gPiBiZWVuIHJlbmFtZWQgZnJvbSB4ZW5faHZtX2Fs
dHAybV9zZXRfbWVtX2FjY2Vzcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8
YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4gCj4gTG9va2luZyB0aHJvdWdoIHRoaXMgcGF0Y2ggLSB3
aGF0J3MgdGhlIHBvaW50IG9mIHBhdGNoIDE/IFRoZXJlJ3Mgbm8KPiBmdXJ0aGVyIHVzZXIgYmVp
bmcgaW50cm9kdWNlZCBoZXJlLgoKSXQncyBub3QgZW50aXJlbHkgbmVjZXNzYXJ5LiAgSXQganVz
dCBjbGVhbnMgdXAgX3AybV9nZXRfbWVtX2FjY2VzcygpCnNsaWdodGx5LCB3aGljaCB3b3VsZCBi
ZSB0aGUgb25seSB1c2VyIG9mIHRoZSBuZXcgZnVuY3Rpb24uICBJIGNvdWxkCmRyb3AgcGF0Y2gg
MSBhbmQgaWYgaXQncyBkZWVtZWQgZGVzaXJhYmxlIEkgY291bGQgc2VuZCBpdCBzZXBhcmF0ZWx5
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
