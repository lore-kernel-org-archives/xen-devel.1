From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] vpci: reduce verboseness of BAR
 write warnings
Date: Mon, 18 Feb 2019 09:45:07 -0700
Message-ID: <5C6AE1130200007800217C10@prv1-mh.provo.novell.com>
References: <20190218162428.19056-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gvm2h-0006X9-RC
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 16:45:19 +0000
In-Reply-To: <20190218162428.19056-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDE3OjI0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEF2b2lkIHByaW50aW5nIGEgd2FybmluZyBtZXNzYWdlIHdoZW4gd3JpdGluZyB0byBhIEJBUiBy
ZWdpc3RlciB3aXRoCj4gbWVtb3J5IGRlY29kaW5nIGVuYWJsZWQgaWYgdGhlIHZhbHVlIHdyaXR0
ZW4gaXMgdGhlIHNhbWUgYXMgdGhlCj4gY3VycmVudCBvbmUuCj4gCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3
aXRoIG9uZSBjb3NtZXRpYyBxdWVzdGlvbjoKCj4gQEAgLTM4MSw2ICszNzEsMTkgQEAgc3RhdGlj
IHZvaWQgYmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQg
cmVnLAo+ICAgICAgZWxzZQo+ICAgICAgICAgIHZhbCAmPSBQQ0lfQkFTRV9BRERSRVNTX01FTV9N
QVNLOwo+ICAKPiArICAgIGlmICggcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNlZywgcGRldi0+YnVz
LCBzbG90LCBmdW5jLCBQQ0lfQ09NTUFORCkgJgo+ICsgICAgICAgICBQQ0lfQ09NTUFORF9NRU1P
UlkgKQo+ICsgICAgewo+ICsgICAgICAgIC8qIElmIHRoZSB2YWx1ZSB3cml0dGVuIGlzIHRoZSBj
dXJyZW50IG9uZSBhdm9pZCBwcmludGluZyBhIHdhcm5pbmcuICovCj4gKyAgICAgICAgaWYgKCB2
YWwgIT0gKHVpbnQzMl90KShiYXItPmFkZHIgPj4gKGhpID8gMzIgOiAwKSkgKQo+ICsgICAgICAg
ICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLAo+ICsgICAgICAgICAgICAgICAgICAgICIlMDR4
OiUwMng6JTAyeC4ldTogaWdub3JlZCBCQVIgJWx1IHdyaXRlIHdpdGggbWVtb3J5IGRlY29kaW5n
IGVuYWJsZWRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgcGRldi0+c2VnLCBwZGV2LT5idXMs
IHNsb3QsIGZ1bmMsCj4gKyAgICAgICAgICAgICAgICAgICAgYmFyIC0gcGRldi0+dnBjaS0+aGVh
ZGVyLmJhcnMgKyAoaGkgPyAxIDogMCkpOwoKV2h5IHRoZSBjb25kaXRpb25hbCBvcGVyYXRvcj8g
Ym9vbCBjb252ZXJ0cyBmaW5lIHRvIGFuIGludGVnZXIKdmFsdWUgb2YgMCBvciAxLgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
