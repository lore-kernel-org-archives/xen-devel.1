From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Fri, 10 Aug 2018 12:08:25 +0000
Message-ID: <d60afbae4e264d6bb6f29c9ae0445133@AMSPEX02CL03.citrite.net>
References: <20180810103714.5112-1-paul.durrant@citrix.com>
 <5B6D7E9C02000078001DCF26@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3eyy=kz=citrix.com=prvs=753083691=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fo6DV-0001GJ-F8
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 12:08:29 +0000
In-Reply-To: <5B6D7E9C02000078001DCF26@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTAgQXVndXN0IDIwMTggMTM6MDIKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsIDx4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQ
QVRDSCAwLzJdIE1NSU8gZW11bGF0aW9uIGZpeGVzCj4gCj4gPj4+IE9uIDEwLjA4LjE4IGF0IDEy
OjM3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gVGhlc2UgYXJlIHByb2Jh
Ymx5IGJvdGggY2FuZGlkYXRlcyBmb3IgYmFjay1wb3J0Lgo+ID4KPiA+IFBhdWwgRHVycmFudCAo
Mik6Cj4gPiAgIHg4Ni9odm0vaW9yZXE6IE1NSU8gcmFuZ2UgY2hlY2tpbmcgY29tcGxldGVseSBp
Z25vcmVzIGRpcmVjdGlvbiBmbGFnCj4gPiAgIHg4Ni9odm0vZW11bGF0ZTogbWFrZSBzdXJlIHJl
cCBJL08gZW11bGF0aW9uIGRvZXMgbm90IGNyb3NzIEdGTgo+ID4gICAgIGJvdW5kYXJpZXMKPiA+
Cj4gPiAgeGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgfCAxNyArKysrKysrKysrKysrKysrLQo+
ID4gIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgIHwgMTUgKysrKysrKysrKy0tLS0tCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IEkg
dGFrZSBpdCB0aGlzIGlzbid0IHlldCB3aGF0IHdlJ3ZlIHRhbGtlZCBhYm91dCB5ZXN0ZXJkYXkg
b24gaXJjPwo+IAoKVGhpcyBpcyB0aGUgYmFuZC1haWQgZml4LiBJIGNhbiBub3cgc2hvdyBjb3Jy
ZWN0IGhhbmRsaW5nIG9mIGEgcmVwIG1vdiB3YWxraW5nIG9mZiBNTUlPIGludG8gUkFNLgoKICBQ
YXVsCgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
