From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/8] x86/AMD: distinguish compute units from
 hyper-threads
Date: Thu, 12 Jul 2018 14:02:57 +0100
Message-ID: <49c30338-2bbb-bc45-df29-40668305405a@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F30E02000078001D3139@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+/yn=j4=citrix.com=prvs=7248936b7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdbGH-00018m-An
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 13:03:57 +0000
In-Reply-To: <5B45F30E02000078001D3139@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTM6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZhbTE3IHJlcGxhY2VzIENV
cyBieSBIVHMsIHdoaWNoIHdlIHNob3VsZCByZWZsZWN0IGFjY29yZGluZ2x5LCBldmVuIGlmCj4g
dGhlIGRpZmZlcmVuY2UgaXMgbm90IHZlcnkgYmlnLiBUaGUgbW9zdCByZWxldmFudCBjaGFuZ2Ug
KHJlcXVpcmluZyBzb21lCj4gY29kZSByZXN0cnVjdHVyaW5nKSBpcyB0aGF0IHRoZSB0b3BvZXh0
IGZlYXR1cmUgbm8gbG9uZ2VyIG1lYW5zIHRoZXJlIGlzCj4gYSB2YWxpZCBDVSBJRC4KPgo+IFRh
a2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjb252ZXJ0IHdyb25nbHkgcGxhaW4gaW50IHZhcmlhYmxl
cyBpbgo+IHNldF9jcHVfc2libGluZ19tYXAoKSB0byB1bnNpZ25lZCBpbnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L2FtZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+IEBAIC01MDQs
MTcgKzUwNCwyMyBAQCBzdGF0aWMgdm9pZCBhbWRfZ2V0X3RvcG9sb2d5KHN0cnVjdCBjcHVpCj4g
ICAgICAgICAgICAgICAgICB1MzIgZWF4LCBlYngsIGVjeCwgZWR4Owo+ICAKPiAgICAgICAgICAg
ICAgICAgIGNwdWlkKDB4ODAwMDAwMWUsICZlYXgsICZlYngsICZlY3gsICZlZHgpOwo+IC0gICAg
ICAgICAgICAgICAgYy0+Y29tcHV0ZV91bml0X2lkID0gZWJ4ICYgMHhGRjsKPiAgICAgICAgICAg
ICAgICAgIGMtPng4Nl9udW1fc2libGluZ3MgPSAoKGVieCA+PiA4KSAmIDB4MykgKyAxOwo+ICsK
PiArCQlpZiAoYy0+eDg2IDwgMHgxNykKPiArCSAgICAgICAgICAgICAgICBjLT5jb21wdXRlX3Vu
aXRfaWQgPSBlYnggJiAweEZGOwo+ICsJCWVsc2Ugewo+ICsJICAgICAgICAgICAgICAgIGMtPmNw
dV9jb3JlX2lkID0gZWJ4ICYgMHhGRjsKPiArCQkJYy0+eDg2X21heF9jb3JlcyAvPSBjLT54ODZf
bnVtX3NpYmxpbmdzOwo+ICsJCX0KClRoZSBpbmRlbnRhdGlvbiBoZXJlIGlzIG9kZC7CoCBJdCB0
dXJucyBvdXQgdGhlIGZ1bmN0aW9uIHVzZXMgZW50aXJlbHkKOC1zcGFjZXMgcmF0aGVyIHRoYW4g
dGFicywgbGlrZSB0aGUgcmVzdCBvZiB0aGUgZmlsZS4KCldvdWxkIHlvdSBtaW5kIGVpdGhlciBy
ZXRhaW5pbmcgc3BhY2VzLCBvciBmaXhpbmcgdXAgdGhlIGVudGlyZSBmdW5jdGlvbgoocHJvYmFi
bHkgZWFzaWVzdCBhcyBhIHByZXJlcSBwYXRjaCkgPwoKT3RoZXJ3aXNlIExHVE0uCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
