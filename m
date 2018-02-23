From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Fri, 23 Feb 2018 17:25:11 +0000
Message-ID: <20180223172511.yifvuflrpjfwgpzs@MacBook-Pro-de-Roger.local>
References: <20180123150735.74779-1-roger.pau@citrix.com>
 <20180123150735.74779-2-roger.pau@citrix.com>
 <5A90476802000078001AAFF1@prv-mh.provo.novell.com>
 <88293102-cebe-1ad6-5335-741fd0c97051@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nm5i=fr=citrix.com=prvs=5854f5d22=roger.pau@srs-us1.protection.inumbo.net>)
 id 1epH6T-00016c-7M
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 17:25:49 +0000
Content-Disposition: inline
In-Reply-To: <88293102-cebe-1ad6-5335-741fd0c97051@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDQ6MDI6MTdQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIzLzAyLzE4IDE1OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiA+IE9uIDIzLjAxLjE4IGF0IDE2OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMKPiA+ID4gaW5kZXggYzliOTU0NjQzNS4uOThiODI2ODBjNiAxMDA2NDQKPiA+
ID4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+ID4gPiArKysgYi94ZW4vYXJjaC9hcm0v
eGVuLmxkcy5TCj4gPiA+IEBAIC02NSw2ICs2NSwxMyBAQCBTRUNUSU9OUwo+ID4gPiAgICAgICAg
ICBfX3BhcmFtX3N0YXJ0ID0gLjsKPiA+ID4gICAgICAgICAgKiguZGF0YS5wYXJhbSkKPiA+ID4g
ICAgICAgICAgX19wYXJhbV9lbmQgPSAuOwo+ID4gPiArCj4gPiA+ICsjaWYgZGVmaW5lZChDT05G
SUdfSEFTX1BDSSkgJiYgZGVmaW5lZChDT05GSUdfTEFURV9IV0RPTSkKPiAKPiBXaHkgdGhpcyBp
cyBjb25kaXRpb25hbCB0byBDT05GSUdfTEFURV9IV0RPTT8KCkN1cnJlbnRseSBQQ0kgY29uZmln
IHNwYWNlIGVtdWxhdGlvbiBpcyBsaW1pdGVkIHRvIERvbTAgdXNhZ2UsIGhlbmNlCnRoZSBzZXR1
cCBwYXJ0IG9mIGl0IGNhbiBsaXZlIGluIHRoZSBpbml0IHNlY3Rpb24gaWYgbm90IHVzaW5nIGEg
bGF0ZQpoYXJkd2FyZSBkb21haW4uCgo+IAo+IEFsc28sIGFueSByZWFzb24gdG8gaW1wb3NlIFZQ
Q0kgd2hlbiBDT05GSUdfSEFTX1BDSSBpcyBzZXQgYW5kIG5vdCBpbnRyb2R1Y2UKPiBhbm90aGVy
IGNvbmZpZz8gVGhlIG5ldyBjb25maWcgd291bGQgaGVscCB0byBhZGQgc3VwcG9ydCBmb3IgUENJ
IGluIHN0ZXBzIGluCj4gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KCkkgY291bGQgZG8gdGhhdCBJIGd1
ZXNzLCB1bmxlc3MgYW55b25lIG9iamVjdHMgSSB3aWxsIGFkZCBhCkNPTkZJR19WUENJIG9wdGlv
bi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
