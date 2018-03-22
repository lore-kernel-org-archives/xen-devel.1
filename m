From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v11 04/12] pci: split code to size BARs from
 pci_add_device
Date: Thu, 22 Mar 2018 10:31:12 +0000
Message-ID: <20180322103112.d4z3th6ku3sinyw5@MacBook-Pro-de-Roger.local>
References: <20180320151543.84348-1-roger.pau@citrix.com>
 <20180320151543.84348-5-roger.pau@citrix.com>
 <5AB3903A02000078001B4EA0@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fjst=gm=citrix.com=prvs=61285f498=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyxVB-0006TS-NQ
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:31:21 +0000
Content-Disposition: inline
In-Reply-To: <5AB3903A02000078001B4EA0@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDQ6MTU6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjAzLjE4IGF0IDE2OjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTY3MiwxMSArNzIyLDE2IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYgc2Vn
LCB1OCBidXMsIHU4IGRldmZuLAo+ID4gICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpOwo+ID4g
IAo+ID4gICAgICAgICAgICAgIEJVSUxEX0JVR19PTihBUlJBWV9TSVpFKHBkZXYtPnZmX3JsZW4p
ICE9IFBDSV9TUklPVl9OVU1fQkFSUyk7Cj4gPiAtICAgICAgICAgICAgZm9yICggaSA9IDA7IGkg
PCBQQ0lfU1JJT1ZfTlVNX0JBUlM7ICsraSApCj4gPiArICAgICAgICAgICAgZm9yICggaSA9IDA7
IGkgPCBQQ0lfU1JJT1ZfTlVNX0JBUlM7ICkKPiA+ICAgICAgICAgICAgICB7Cj4gPiAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBpZHggPSBwb3MgKyBQQ0lfU1JJT1ZfQkFSICsgaSAqIDQ7
Cj4gPiAgICAgICAgICAgICAgICAgIHUzMiBiYXIgPSBwY2lfY29uZl9yZWFkMzIoc2VnLCBidXMs
IHNsb3QsIGZ1bmMsIGlkeCk7Cj4gPiAtICAgICAgICAgICAgICAgIHUzMiBoaSA9IDA7Cj4gPiAr
ICAgICAgICAgICAgICAgIHBjaV9zYmRmX3Qgc2JkZiA9IHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgIC5zZWcgPSBzZWcsCj4gPiArICAgICAgICAgICAgICAgICAgICAuYnVzID0gYnVzLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgLmRldiA9IHNsb3QsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAuZnVuYyA9IGZ1bmMsCj4gPiArICAgICAgICAgICAgICAgIH07Cj4gCj4gU28gSSd2ZSBoYWQg
ZXZlcnl0aGluZyB1cCB0byBwYXRjaCA5IGFwcGxpZWQgYW5kIHJlYWR5IGZvciBwdXNoaW5nLAo+
IHdoZW4gSSBkaWQgbXkgdXN1YWwgc2Vjb25kYXJ5IGNvbXBpbGUgdGVzdCBvbiBhbiBvbGQgc3lz
dGVtOiBUaGlzCj4gZmFpbHMgdG8gY29tcGlsZSB3aXRoIGdjYyA0LjMgKGR1ZSB0byB0aGVyZSBi
ZWluZyBhIHVubmFtZWQgc3ViLQo+IHN0cnVjdHVyZSkuIEEgc2ltaWxhciBpc3N1ZSBleGlzdHMg
YXQgbGVhc3QgaW4gcGF0Y2ggNy4gU2luY2UgdGhlCj4gc3RydWN0dXJlIGdldHMgaW50cm9kdWNl
ZCBpbiBwYXRjaCAxIChhbmQgaGVuY2UgbWF5IG5lZWQgY2hhbmdpbmcKCnBjaV9zYmRmX3QgaXMg
YWxyZWFkeSBpbiB0aGUgc291cmNlIHRyZWUsIGl0IHdhcyBpbnRyb2R1Y2VkIGJ5CjUxNGY1OGQ0
NDY4YTQwYjVkZDQxOGE1ZWExNzQyNjgxOTMwYzNmMmQgYmFjayBpbiBEZWNlbWJlci4KCj4gdGhl
cmUsIGRlcGVuZGluZyBvbiBob3cgdGhpcyBpcyB0byBiZSBhZGRyZXNzZWQpLCBJJ20gbm90IGdv
aW5nIHRvCj4gcHVzaCBhbnkgcGFydCBvZiB0aGlzIHNlcmllcy4KCk5vIHBhdGNoIGluIHRoZSBz
ZXJpZXMgY2hhbmdlcyBwY2lfc2JkZl90IGF0IGFsbCwgc28gaW4gYW55IGNhc2UgdGhpcwpzaG91
bGQgYmUgYSBwcmUtcGF0Y2ggb3IgYSBwb3N0LXBhdGNoLCBidXQgbm90IHJlYWxseSBwYXJ0IG9m
IHBhdGNoIDEuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
