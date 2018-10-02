From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 2 Oct 2018 14:55:49 +0100
Message-ID: <20181002135549.k5nc7cv3mqjahnqq@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ymzk=mo=citrix.com=prvs=806d93179=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7L9U-0002Ft-OC
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 13:55:52 +0000
Content-Disposition: inline
In-Reply-To: <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDIsIDIwMTggYXQgMDQ6MTI6MDhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gYSBudW1iZXIgb2YgY2FzZXMgdGhlIHRhcmdldHMgb2YgaW5kaXJlY3QgY2FsbHMg
Z2V0IGRldGVybWluZWQgb25jZQo+IGF0IGJvb3QgdGltZS4gSW4gc3VjaCBjYXNlcyB3ZSBjYW4g
cmVwbGFjZSB0aG9zZSBjYWxscyB3aXRoIGRpcmVjdCBvbmVzCj4gdmlhIG91ciBhbHRlcm5hdGl2
ZSBpbnN0cnVjdGlvbiBwYXRjaGluZyBtZWNoYW5pc20uCj4gCj4gU29tZSBvZiB0aGUgdGFyZ2V0
cyAoaW4gcGFydGljdWxhciB0aGUgaHZtX2Z1bmNzIG9uZXMpIGdldCBlc3RhYmxpc2hlZAo+IG9u
bHkgaW4gcHJlLVNNUCBpbml0Y2FsbHMsIG1ha2luZyBuZWNlc3NhcnkgYSBzZWNvbmQgcGFzc3Mg
dGhyb3VnaCB0aGUKPiBhbHRlcm5hdGl2ZSBwYXRjaGluZyBjb2RlLiBUaGVyZWZvcmUgc29tZSBh
ZGp1c3RtZW50cyBiZXlvbmQgdGhlCj4gcmVjb2duaXRpb24gb2YgdGhlIG5ldyBzcGVjaWFsIHBh
dHRlcm4gYXJlIG5lY2Vzc2FyeSB0aGVyZS4KPiAKPiBOb3RlIHRoYXQgcGF0Y2hpbmcgc3VjaCBz
aXRlcyBtb3JlIHRoYW4gb25jZSBpcyBub3Qgc3VwcG9ydGVkIChhbmQgdGhlCj4gc3VwcGxpZWQg
bWFjcm9zIGFsc28gZG9uJ3QgcHJvdmlkZSBhbnkgbWVhbnMgdG8gZG8gc28pLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2NDogRXh0
ZW5kIC8gYWRqdXN0IGNvbW1lbnRzLgoKVGhhbmtzLCB0aGlzIG1ha2VzIGl0IG11Y2ggZWFzaWVy
IHRvIHJlYXNvbiBhYm91dCB0aGUgY29kZS4KCkkga25vdyB0aGVyZSBhcmUgY29tbWVudHMgYWJv
dXQgYSBtYWNybywgYnV0IHRoZXkgZG9uJ3QgcmVhbGx5IGFmZmVjdAp0aGUgbWVhdCBvZiB0aGlz
IHBhdGNoLCBzbyB3aGV0aGVyIHRoZSBtYWNybyBpcyBzcGxpdCBvdXQgdG8gYQpwcmVyZXF1aXNp
dGUgcGF0Y2ggb3Igbm90OgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
