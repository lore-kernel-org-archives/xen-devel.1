From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] EFI: add EFI_LOAD_OPTION support
Date: Thu, 5 Jul 2018 13:57:25 +0100
Message-ID: <2de546e1-3a12-6194-1923-2d4f8ec0dd71@citrix.com>
References: <5B31E90F02000078001CDCE1@prv1-mh.provo.novell.com>
 <20180705095918.zklzzjraybeowhh3@citrix.com>
 <5B3E084E02000078001D17B9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ses3=jv=citrix.com=prvs=7171960be=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fb3qE-0004dC-6P
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 12:58:34 +0000
In-Reply-To: <5B3E084E02000078001D17B9@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDcvMTggMTM6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjA3LjE4IGF0
IDExOjU5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIFR1ZSwgSnVuIDI2LCAy
MDE4IGF0IDAxOjE5OjQzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gV2hlbiBib290
aW5nIFhlbiB2aWEgVUVGSSB0aGUgWGVuIGNvbmZpZyBmaWxlIGNhbiBjb250YWluIG11bHRpcGxl
Cj4+PiBzZWN0aW9ucyBlYWNoIGRlc2NyaWJpbmcgZGlmZmVyZW50IGJvb3Qgb3B0aW9ucy4gSXQg
aXMgY3VycmVudGx5IG9ubHkKPj4+IHBvc3NpYmxlIHRvIGNob29zZSB3aGljaCBzZWN0aW9uIHRv
IGJvb3Qgd2l0aCBpZiB0aGUgYnVmZmVyIGNvbnRhaW5zIGEKPj4+IHN0cmluZy4gVUVGSSBwcm92
aWRlcyBhIGRpZmZlcmVudCBzdGFuZGFyZCB0byBwYXNzIG9wdGlvbmFsIGFyZ3VtZW50cwo+Pj4g
dG8gYW4gYXBwbGljYXRpb24sIGFuZCBpbiB0aGlzIHBhdGNoIHdlIG1ha2UgWGVuIHByb3Blcmx5
IHBhcnNlIHRoaXMKPj4+IGJ1ZmZlciwgdGh1cyBtYWtpbmcgaXQgcG9zc2libGUgdG8gaGF2ZSBz
ZXBhcmF0ZSBFRkkgYm9vdCBvcHRpb25zCj4+PiBwcmVzZW50IGZvciB0aGUgZGlmZmVyZW50IGNv
bmZpZyBzZWN0aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+IE5vdCBzdXJlIHdoeSBJJ20gQ0MnZWQgb24gdGhpcyBwYXRjaC4gU2lu
Y2UgeW91J3JlIHRoZSBFRkkgbWFpbnRhaW5lciwgSQo+PiBkb24ndCB0aGluayBhIHRhZyBpcyBu
ZWVkZWQgZm9yIHlvdSB0byBjb21taXQgdGhpcyBjaGFuZ2UuCj4gSG1tLCBzbyBmYXIgSSB3YXMg
dW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgbGFjayBvZiBhIDJuZAo+IG1haW50YWluZXIg
bWVhbnQgYW4gYWNrIGZyb20gVEhFIFJFU1Qgd291bGQgYXQgdGhlIHZlcnkgbGVhc3QKPiBiZSBk
ZXNpcmFibGUuCgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCklkZWFsbHksIGlmIFRhbWFzIGNhbiBjb25maXJtIHRoYXQgdGhpcyBwYXRjaCB3b3Jr
cyBmb3IgaGltLCB0aGF0IHdvdWxkCmJlIGJldHRlci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
