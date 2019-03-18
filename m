From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 10/11] viridian: add implementation of
 synthetic timers
Date: Mon, 18 Mar 2019 10:22:34 -0600
Message-ID: <5C8FC5CA020000780021FF9A@prv1-mh.provo.novell.com>
References: <20190318112059.21910-1-paul.durrant@citrix.com>
 <20190318112059.21910-11-paul.durrant@citrix.com>
 <5C8FAA00020000780021FE95@prv1-mh.provo.novell.com>
 <f742ebef90204de1ac1044c100620a2b@AMSPEX02CL02.citrite.net>
 <6001528cc0ae46f481f156802d8bcdd4@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5v28-0001Va-Jh
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:22:40 +0000
In-Reply-To: <6001528cc0ae46f481f156802d8bcdd4@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAzLjE5IGF0IDE2OjQ2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiA+ID4gKyAgICB7Cj4+ID4gPiArICAgICAgICBleHBpcmF0aW9uID0gdnMtPmNvdW50Owo+
PiA+ID4gKyAgICAgICAgaWYgKCBleHBpcmF0aW9uIC0gbm93IDw9IDAgKQo+PiA+ID4gKyAgICAg
ICAgewo+PiA+ID4gKyAgICAgICAgICAgIHZzLT5leHBpcmF0aW9uID0gZXhwaXJhdGlvbjsKPj4g
PiA+ICsgICAgICAgICAgICBzdGltZXJfZXhwaXJlKHZzKTsKPj4gPgo+PiA+IEFyZW4ndCB5b3Ug
aW50cm9kdWNpbmcgYSByaXNrIGZvciByYWNlcyBieSBjYWxsaW5nIHRoZSB0aW1lciBmdW5jdGlv
bgo+PiA+IGRpcmVjdGx5IGZyb20gaGVyZT8gc3RhcnRfdGltZXIoKSwgYWZ0ZXIgYWxsLCBnZXRz
IGNhbGxlZCBmcm9tIHF1aXRlIGEKPj4gPiBmZXcgcGxhY2VzLgo+PiAKPj4gSW4gcHJhY3RpY2Ug
SSBkb24ndCB0aGluayB0aGVyZSBzaG91bGQgYmUgYW55IHByb2JsZW1hdGljIHJhY2UsIGJ1dCBJ
J2xsIGNoZWNrIGFnYWluLgo+IAo+IEkgdGhpbmsgdGhlICdwZXJpb2RpYycgbmFtZSBtaWdodCBi
ZSBjb25mdXNpbmcgdGhpbmdzLi4uIFRoZSBYZW4gdGltZXJzIGFyZSAKPiBhbGwgc2luZ2xlLXNo
b3QsIGl0J3MganVzdCB0aGF0IHN0YXJ0X3N0aW1lcigpIGlzIHJlLWNhbGxlZCBhZnRlciBhIAo+
IHN1Y2Nlc3NmdWwgcG9sbCBpZiB0aGUgdmlyaWRpYW4gdGltZXIgaXMgY29uZmlndXJlZCB0byBi
ZSBwZXJpb2RpYy4gU28gSSAKPiBkb24ndCB0aGluayB0aGVyZSBpcyBjYXNlIHdoZXJlIHRoZSB1
bmRlcmx5aW5nIFhlbiB0aW1lciBjb3VsZCBhY3R1YWxseSBiZSAKPiBydW5uaW5nIHdoZW4gd2Ug
ZW50ZXIgc3RhcnRfc3RpbWVyKCkuCgpPbmUgb2YgdGhlIGNhbGxlcnMgb2YgdGhlIGZ1bmN0aW9u
IGlzIHRoZSBXUk1TUiBoYW5kbGVyLiBXaHkgd291bGQKaXQgYmUgZ3VhcmFudGVlZCB0aGF0IHRo
ZSB0aW1lciBpc24ndCBhY3RpdmUgd2hlbiBzdWNoIGEgV1JNU1IKb2NjdXJzPyBPZiBjb3Vyc2Us
IHRoaXMgYWxvbmUgaXMgbm90IGVub3VnaCBmb3IgdGhlcmUgdG8gYmUgYSBwcm9ibGVtLAphcyB3
ZSdyZSBmaW5lIGFzIGxvbmcgYXMgdGhlIGd1ZXN0IGNhbiBvbmx5IGhhcm0gaXRzZWxmLiBCdXQg
SSBkb24ndAp0aGluayBpdCBnb2VzIHdpdGhvdXQgc2F5aW5nIHRoYXQgdGhlcmUncyBubyBpc3N1
ZSBoZXJlOyBoYXZpbmcgbG9va2VkCmEgMm5kIHRpbWUganVzdCBub3csIEkgdGhpbmsgSSBhZ3Jl
ZSB0aG91Z2ggdGhhdCB0aGVyZSdzIG5vIHJpc2sgZm9yIG91cgpvd24gaGVhbHRoIGhlcmUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
