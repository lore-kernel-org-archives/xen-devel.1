From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 14/16] x86: make entry point code build
 when !CONFIG_PV
Date: Fri, 2 Nov 2018 14:14:23 +0000
Message-ID: <08fd7122-299e-5e72-6f7f-1daf3d919df9@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <af9f79239874ca4257e136b74460646d36363650.1539959287.git-series.wei.liu2@citrix.com>
 <5BD7213602000078001F5DF4@prv1-mh.provo.novell.com>
 <20181102130813.362jdoaaz6ravnym@zion.uk.xensource.com>
 <5BDC54E202000078001F7416@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIaDW-0003sn-JD
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:14:30 +0000
In-Reply-To: <5BDC54E202000078001F7416@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTM6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjExLjE4IGF0
IDE0OjA4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgT2N0IDI5LCAy
MDE4IGF0IDA5OjAzOjE4QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTku
MTAuMTggYXQgMTY6MjgsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBAQCAtNTQ4
LDEwICs1NTAsMTQgQEAgRU5UUlkocmV0X2Zyb21faW50cikKPj4+PiAgICAgICAgICBHRVRfQ1VS
UkVOVChieCkKPj4+PiAgICAgICAgICB0ZXN0YiAkMywgVVJFR1NfY3MoJXJzcCkKPj4+PiAgICAg
ICAgICBqeiAgICByZXN0b3JlX2FsbF94ZW4KPj4+PiArI2lmZGVmIENPTkZJR19QVgo+Pj4+ICAg
ICAgICAgIG1vdnEgIFZDUFVfZG9tYWluKCVyYngpLCAlcmF4Cj4+Pj4gICAgICAgICAgY21wYiAg
JDAsIERPTUFJTl9pc18zMmJpdF9wdiglcmF4KQo+Pj4+ICAgICAgICAgIGplICAgIHRlc3RfYWxs
X2V2ZW50cwo+Pj4+ICAgICAgICAgIGptcCAgIGNvbXBhdF90ZXN0X2FsbF9ldmVudHMKPj4+PiAr
I2Vsc2UKPj4+PiArICAgICAgICBCVUcKPj4+PiArI2VuZGlmCj4+PiBIbW0sIG5vdCBzdXJlIGhl
cmUgKGFuZCBlbHNld2hlcmUpOiBBbm90aGVyIG9wdGlvbiBpcyB0bwo+Pj4gc3RyZWFtbGluZSBl
eGVjdXRpb24gYnkgcmVwbGFjaW5nIHRoZSBjb25kaXRpb25hbCBicmFuY2ggd2l0aCBhbgo+Pj4g
dW5jb25kaXRpb25hbCBvbmUgaW4gdGhlICFQViBjYXNlLiBBbmRyZXcsIGRvIHlvdSBoYXZlIGFu
eQo+Pj4gdGhvdWdodHMgZWl0aGVyIHdheT8KPj4gTXkgb3JpZ2luYWwgdGhvdWdodCB3YXMgdG8g
Y2F0Y2ggcG90ZW50aWFsIGlzc3VlcyBpbiBYZW4gY29kZSB3aGljaAo+PiBtZXNzZXMgdXAgd2l0
aCB0aGUgcGVybWlzc2lvbiBsZXZlbC4gIFVzaW5nIHVuY29uZGl0aW9uYWwganVtcCBpcyBmaW5l
Cj4+IGJ5IG1lLCB0b28uIEJ1dCBpbiB0aGF0IGNhc2UgSSB3aWxsIHNlZWsgdG8gYXQgbGVhc3Qg
YWRkIGFuIGFzc2VydGlvbgo+PiBmb3IgZGVidWcgYnVpbGQuCj4gQXNzZXJ0aW9uIGFkZGl0aW9u
cyBhcmUgZGVmaW5pdGVseSBmaW5lIHdpdGggbWUuCgpZZWFoIC0gSSdkIGFsc28gZXJyIG9uIHRo
ZSBzaWRlIG9mIGFuIGFzc2VydGlvbiBhbmQgYW4gdW5jb25kaXRpb25hbCBqdW1wLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
