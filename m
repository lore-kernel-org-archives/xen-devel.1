From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 8 Nov 2018 17:59:23 +0100
Message-ID: <20181108165923.nh3iekrspsr7jr2r@mac.citrite.net>
References: <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
 <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
 <5BE4344B02000078001F9A7B@prv1-mh.provo.novell.com>
 <20181108132048.o4bnxvojp6deotwq@mac.citrite.net>
 <791E55F8020000889527FA34@prv1-mh.provo.novell.com>
 <5BE4637602000078001F9D5D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/xu1=nt=citrix.com=prvs=843091f4c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKnoS-0001Vq-0y
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:09:48 +0000
Content-Disposition: inline
In-Reply-To: <5BE4637602000078001F9D5D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDk6MjU6MjZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDE0OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDY6MDQ6MTFBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA4LjExLjE4IGF0IDEzOjQ3LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gTXkgcG9pbnQgd291bGQgYmUgdGhhdCBvbiB4ODYgSSB0
aGluayB0aGUgb25seSB3YXkgdG8gaGF2ZSBwcmVlbXB0aWJsZQo+ID4+ID4gbG9uZy1ydW5uaW5n
IG9wZXJhdGlvbnMgaW5zaWRlIG9mIFhlbiBpcyB0byBibG9jayB0aGUgZ3Vlc3QgdkNQVSBhbmQK
PiA+PiA+IHJ1biB0aGVtIGluIGEgdGFza2xldCwgb3IgYXQgbGVhc3QgdGhpcyBzZWVtcyB0aGUg
bGVzcyBpbnZhc2l2ZSBvbmUuCj4gPj4gPiAKPiA+PiA+IERvIHlvdSBzdGlsbCBoYXZlIG9iamVj
dGlvbnMgdG8gdGhpcyBwYXRjaC9hcHByb2FjaD8KPiA+PiAKPiA+PiBXZWxsLCBJIHN0aWxsIGRv
bid0IHVuZGVyc3RhbmQgd2h5IHlvdSB0aGluayB5b3UgbmVlZCB0byBpbnRyb2R1Y2UKPiA+PiBh
IHRhc2tsZXQgaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGF0J3MgYmVjYXVzZSBJIHN0aWxsIGRvbid0
IHVuZGVyc3RhbmQKPiA+PiB3aGF0IHlvdSB0aGluayBpcyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50
IGFwcHJvYWNoIChsZWF2aW5nIGFzaWRlCj4gPj4gdGhlIGV4YWN0IHBsYWNlbWVudCBvZiB3aGVy
ZSB0aGUgdnBjaSBob29rIG5lZWRzIHRvIGJlIGNhbGxlZCkuCj4gPiAKPiA+IFRoZSBjdXJyZW50
IGFwcHJvYWNoIGRvZXNuJ3QgcHJldmVudCB0aGUgdkNQVSBmcm9tIHJldHVybmluZyB0byBndWVz
dAo+ID4gY29udGV4dCB3aXRoIHBlbmRpbmcgd29yay4KPiA+IAo+ID4gUGxhY2luZyB0aGUgcGVu
ZGluZyB3b3JrIGhvb2sgKHZwY2lfcHJvY2Vzc19wZW5kaW5nKSBpbiBodm1fZG9fcmVzdW1lCj4g
PiBpcyBub3QgZ29pbmcgdG8gc29sdmUgdGhpcyB1bmxlc3Mgd2UgcmFpc2UgYW5kIHByb2Nlc3Mg
YSBzY2hlZHVsZXIKPiA+IHNvZnRpcnEsIGFuZCB0aGVuIHRoaXMgbGVhZHMgdG8gdGhlIHJlY3Vy
c2lvbiBwcm9ibGVtLgo+IAo+IFdoaWNoIHJlY3Vyc2lvbiBwcm9ibGVtPyBJIHN0aWxsIGhhdmVu
J3Qgc2VlbiBhbiBvdXRsaW5lIHRha2luZyBpbnRvCj4gYWNjb3VudCB3aGF0IEkgaGF2ZSB3cml0
dGVuIGluIGVhcmxpZXIgcmVwbGllcy4gSW4gcGFydGljdWxhciBJIGRvbid0Cj4gc2VlIGEgc29m
dGlycSBoYW5kbGVyIGl0c2VsZiBjYWxsaW5nIGRvX3NvZnRpcnEoKSBhbnl3aGVyZS4KCkkgY291
bGQgcGxhY2UgdGhlIHZQQ0kgcGVuZGluZyB3b3JrIGhvb2sgaW4gaHZtX2RvX3Jlc3VtZSBvcgpo
YW5kbGVfaHZtX2lvX2NvbXBsZXRpb24gYW5kIHRoZW4gc2ltcGx5IGRvIGEKcmFpc2Vfc29mdGly
cShTQ0hFRFVMRVJfU09GVElSUSkgYW5kIHJldHVybiBpbiBvcmRlciB0byBwcmVlbXB0LiBUaGUK
ZG9fc29mdGlycSgpIGNhbGwgaW4gdGhlIHN2bS92bXggZ3Vlc3QgZW50cnkgcGF0aCBpcyBjYWxs
ZWQgd2l0aCBhCmNsZWFuIHN0YWNrIHNvIHRoZXJlJ3Mgbm8gc3RhY2sgb3ZlcmZsb3cgaXNzdWUg
dGhlcmUuCgpEbyB5b3UgdGhpbmsgdGhpcyB3b3VsZCBiZSBiZXR0ZXIgdGhhbiBibG9ja2luZyB0
aGUgdkNQVSBhbmQgdXNpbmcgYQp0YXNrbGV0PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
