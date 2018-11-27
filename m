From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] mm: make opt_bootscrub non-init
Date: Tue, 27 Nov 2018 15:25:29 +0100
Message-ID: <20181127142529.5x5qfx244gqekq6x@mac>
References: <20181126175548.9977-1-roger.pau@citrix.com>
 <5BFD18C70200007800200459@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nllm=og=citrix.com=prvs=8628b2c55=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gReJ2-00021b-TO
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 14:25:40 +0000
Content-Disposition: inline
In-Reply-To: <5BFD18C70200007800200459@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDM6MTM6MjdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjExLjE4IGF0IDE4OjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiA+ICsrKyBiL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jCj4gPiBAQCAtMTY2LDcgKzE2NiwxNCBAQCBlbnVtIGJvb3RzY3J1Yl9t
b2RlIHsKPiA+ICAgICAgQk9PVFNDUlVCX09OLAo+ID4gICAgICBCT09UU0NSVUJfSURMRSwKPiA+
ICB9Owo+ID4gLXN0YXRpYyBlbnVtIGJvb3RzY3J1Yl9tb2RlIF9faW5pdGRhdGEgb3B0X2Jvb3Rz
Y3J1YiA9IEJPT1RTQ1JVQl9JRExFOwo+ID4gKy8qCj4gPiArICogb3B0X2Jvb3RzY3J1YiBzaG91
bGQgbGl2ZSBpbiB0aGUgaW5pdCBzZWN0aW9uLCBzaW5jZSBpdCdzIG5vdCBhY2Nlc3NlZAo+ID4g
KyAqIGFmdGVyd2FyZHMuIEhvd2V2ZXIgYXQgbGVhc3QgTExWTSBhc3N1bWVzIHRoZXJlIGFyZSBu
byBzaWRlIGVmZmVjdHMgb2YKPiA+ICsgKiBhY2Nlc3NpbmcgdGhlIHZhcmlhYmxlLCBhbmQgb3B0
aW1pemVzIHRoZSBjb25kaXRpb24gc28gb3B0X2Jvb3RzY3J1YiBpcwo+IAo+IC4uLiB0aGUgY29u
ZGl0aW9uIGluIGluaXRfaGVhcF9wYWdlcygpIC4uLgo+IAo+ICh3aGljaCBJIGd1ZXNzIGNhbiBi
ZSBmb2xkZWQgaW4gd2hpbGUgY29tbWl0dGluZykuCgpZZXMgcGxlYXNlLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
