From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 09/11] vpci/msi: add MSI handlers
Date: Fri, 16 Mar 2018 14:34:12 +0000
Message-ID: <20180316143412.lkqyavr2vepsdktc@MacBook-Pro-de-Roger.local>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-10-roger.pau@citrix.com>
 <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dokm=gg=citrix.com=prvs=60669260a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewqRd-0001cB-97
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 14:34:57 +0000
Content-Disposition: inline
In-Reply-To: <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMDg6MDQ6NTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjAzLjE4IGF0IDE0OjMwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPiA+ICsrKyBiL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jCj4gPiBAQCAtNDcsNiArNDcsNyBAQCB2b2lkIHZwY2lfcmVtb3ZlX2Rl
dmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+ICAgICAgICAgIHhmcmVlKHIpOwo+ID4gICAg
ICB9Cj4gPiAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsKPiA+ICsgICAgeGZy
ZWUocGRldi0+dnBjaS0+bXNpKTsKPiA+ICAgICAgeGZyZWUocGRldi0+dnBjaSk7Cj4gCj4gT2th
eSwgdGhlICNpZmRlZiBoZXJlIGlzIGdvbmUgYXMgYWdyZWVkLiBCdXQgc29tZXRoaW5nIGlzIHN0
aWxsIGZpc2h5Cj4gaGVyZSBmb3IgdGhlIHRlc3QgdXRpbGl0eTogWW91IGRvbid0IGNoYW5nZSB0
aGUgdGVzdCBjb2RlIGhlcmUgYXQgYWxsLAo+IHdoaWNoIG1hZGUgbWUgZ28gbG9vayB3aHkgdGhh
dCBpcy4gQXMgaXQgbG9va3MgeW91IHVzZSBhIHNpbmdsZQo+IHN0YXRpYyBzdHJ1Y3QgdnBjaSBp
bnN0YW5jZSB0aGVyZS4gVGhhdCdsbCBtYWtlIHRoZSB4ZnJlZSgpIHlvdSBhZGQKPiBoZXJlIGNv
cnJlY3QsIGJ1dCB0aGUgb3RoZXIgb25lIGFib3ZlIHRoZW4gaXMgd3JvbmcgKHlvdSdyZSBmcmVl
aW5nCj4gc3RhdGljIGRhdGEpLiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKdnBjaV9yZW1v
dmVfZGV2aWNlIGlzIG5ldmVyIGNhbGxlZCBmcm9tIHRoZSB1c2VyLXNwYWNlIHRlc3QgaGFybmVz
cywKc28gaXQganVzdCBuZWVkcyB0byBidWlsZCwgYnV0IG5vdCBuZWNlc3NhcmlseSBiZSBjb3Jy
ZWN0IGluIHRoYXQKY29udGV4dC4KClRoZSB0ZXN0IGhhcm5lc3MgZG9lc24ndCB1c2UgdnBjaV9h
ZGRfaGFuZGxlcnMgb3IgdnBjaV9yZW1vdmVfZGV2aWNlLAppdCBqdXN0IGFkZHMgYW5kIHJlbW92
ZXMgaGFuZGxlcnMgdXNpbmcgdnBjaV9hZGRfcmVnaXN0ZXIgYW5kCnZwY2lfcmVtb3ZlX3JlZ2lz
dGVyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
