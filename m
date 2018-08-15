From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] qemu-trad: stop using the default IOREQ
 server
Date: Wed, 15 Aug 2018 12:00:44 +0100
Message-ID: <23412.2012.28701.881984@mariner.uk.xensource.com>
References: <20180803132029.33536-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifg0=k6=citrix.com=prvs=7582f73c5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fptXk-00013B-3d
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 11:00:48 +0000
In-Reply-To: <20180803132029.33536-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0gcWVtdS10cmFkOiBzdG9wIHVzaW5nIHRoZSBk
ZWZhdWx0IElPUkVRIHNlcnZlciIpOgo+IEJlY2F1c2UgcWVtdS10cmFkIGlzIHVzaW5nIHRoZSBs
ZWdhY3kgSFZNIHBhcmFtIG1lY2hhbmlzbSBvZiBob29raW5nIGludG8KPiBYZW4sIGl0IG1lYW5z
IHRoYXQgWGVuIGhhcyB0byBtYWludGFpbiB0aGUgbm90aW9uIG9mIGEgJ2RlZmF1bHQnIElPUkVR
Cj4gc2VydmVyIHdoaWNoIGlzIHdoZXJlIGFsbCBJL08gZ29lcyBpZiBubyBvdGhlciBkZXZpY2Ug
bW9kZWwgY2xhaW1zIGl0Lgo+IE1haW50YWluaW5nIHRoaXMgY29kZSBpbiBYZW4gaGFzIGEgY29z
dCBhbmQgaXQgd291bGQgYmUgZ29vZCBpZiB0aGUgcHJvamVjdAo+IG5vIGxvbmdlciBoYWQgdG8g
cGF5IGl0Lgo+IAo+IFRoaXMgcGF0Y2ggbWFrZXMgdGhlIG5lY2Vzc2FyeSBtaW5pbWFsIGNoYW5n
ZXMgdG8gdGhlIHFlbXUtdHJhZCB0byB1c2UgdGhlCj4gSU9SRVEgc2VydmVyIEFQSSB0byBob29r
IGludG8gWGVuLiBUaGlzIG1lYW5zIHRoZSBkZWZhdWx0IElPUkVRIHNlcnZlcgo+IHdpbGwgbm8g
bG9uZ2VyIGJlIGluIHVzZSBhbmQgdGh1cyBpdCBubyBsb25nZXIgbmVlZHMgdG8gYmUgbWFpbnRh
aW5lZC4KClRoYXQgaXMgYSBnb29kIHRoaW5nLgoKSSBsb29rZWQgb3ZlcnIgdGhlIHBhdGNoLiAg
TW9zdCBvZiBpdCBpcyBhYm91dCB3aGF0IEkgd291bGQgaGF2ZQpleHBlY3RlZC4KCkJ1dCBJIGRp
ZCB3YW50IHRvIHF1ZXJ5IHRoaXM6Cgo+ICsgICAgY2FzZSBJT1JFUV9UWVBFX1BDSV9DT05GSUc6
IHsKPiArICAgICAgICB1aW50MzJfdCBzYmRmID0gcmVxLT5hZGRyID4+IDMyOwo+ICsgICAgICAg
IHVpbnQzMl90IHZhbDsKPiArCj4gKyAgICAgICAgLyogRmFrZSBvdXQgdG8gMHhjZjggKi8KPiAr
ICAgICAgICB2YWwgPSAoMXUgPDwgMzEpIHwKPiArICAgICAgICAgICAgKChyZXEtPmFkZHIgJiAw
eDBmMDApIDw8IDE2KSB8Cj4gKyAgICAgICAgICAgICgoc2JkZiAmIDB4ZmZmZikgPDwgOCkgfAo+
ICsgICAgICAgICAgICAocmVxLT5hZGRyICYgMHhmYyk7Cj4gKyAgICAgICAgZG9fb3V0cChlbnYs
IDB4Y2Y4LCA0LCB2YWwpOwo+ICsKPiArICAgICAgICAvKiBOb3cgZmFrZSBJL08gdG8gMHhjZmMg
Ki8KPiArICAgICAgICByZXEtPmFkZHIgPSAweGNmYyB8IChyZXEtPmFkZHIgJiAweDAzKTsKPiAr
ICAgICAgICBjcHVfaW9yZXFfcGlvKGVudiwgcmVxKTsKPiArICAgICAgICBicmVhazsKPiArICAg
IH0KClRoaXMgbG9va3MgbWVzc3kuICBDYW4gc29tZW9uZSBwbGVhc2UgZXhwbGFpbiB3aHkgdGhp
cyBpcyBuZWVkZWQgYW5kCndoeSBpdCBpcyBiZXN0IHRvIGRvIGl0IHRoaXMgd2F5ID8KCihJJ20g
ZG9uJ3Qga25vdyBtdWNoIGFib3V0IFBDSSwgd2hpY2ggaXMgcHJvYmFibHkgYSBjb250cmlidXRv
cnkKZmFjdG9yIGluIG15IHF1ZXJ5aW5nIHRoaXMuICBTb3JyeSBhYm91dCB0aGF0LikKClJlZ2Fy
ZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
