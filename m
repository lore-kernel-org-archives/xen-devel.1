From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [SVM] Getting the length of the current instruction
 in svm_vmexit_handler()
Date: Wed, 14 Mar 2018 17:06:31 +0000
Message-ID: <bff2affa-8495-8b32-ed18-24bc38034988@citrix.com>
References: <144d97a9-7616-bd21-17f6-6621fa5ad69e@bitdefender.com>
 <5AA9539B02000078001B1A65@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=whqe=ge=citrix.com=prvs=604697e0d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewA5e-00005M-3W
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 17:21:26 +0000
In-Reply-To: <5AA9539B02000078001B1A65@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMTggMTU6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjAzLjE4IGF0
IDE1OjU2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IFdlJ2QgbGlrZSB0
byByZXRyaWV2ZSB0aGUgbGVuZ3RoIG9mIHRoZSBjdXJyZW50IGluc3RydWN0aW9uIGluCj4+IHN2
bV92bWV4aXRfaGFuZGxlcigpLCBzcGVjaWZpY2FsbHkgZm9yIHRoZSBWTUVYSVRfRVhDRVBUSU9O
X0RCIGFuZAo+PiBWTUVYSVRfRVhDRVBUSU9OX0JQIGNhc2VzLgo+Pgo+PiBXZSd2ZSBjb21iZWQg
dGhlIHZtY2IgdG8gbm8gYXZhaWwuIEV2ZXJ5dGhpbmcgd2UndmUgdGhvdWdodCB0byBjaGVjawo+
PiAoZXhpdGluZm8xLCBleGl0aW5mbzIsIGV4aXRpbnRpbmZvKSB0dXJucyBvdXQgdG8gYmUgemVy
byB0aGVyZSB3aGlsZQo+PiB0ZXN0aW5nLgo+Pgo+PiBUaGVyZSdzIF9fZ2V0X2luc3RydWN0aW9u
X2xlbmd0aCh2Y3B1LCBpbnN0ciksIGJ1dCBpdCBleHBlY3RzIHRvIGJlIGZlZAo+PiB0aGUgZXhh
Y3QgaW5zdHJ1Y3Rpb24gd2Ugd2FudCB0aGUgbGVuZ3RoIGZvciwgd2hpY2ggb2J2aW91c2x5IGRl
ZmVhdHMKPj4gdGhlIHB1cnBvc2UgaGVyZS4KPj4KPj4gSXMgdGhlcmUgYSBjbGVhbiB3YXkgdG8g
Z2V0IHRoZSBjdXJyZW50IGluc3RydWN0aW9uIGxlbmd0aCBsaWtlIHdlIGRvIGluCj4+IHRoZSBW
TVggY2FzZSAoX192bXJlYWQoVk1fRVhJVF9JTlNUUlVDVElPTl9MRU4sICZpbnNuX2xlbikpIHRo
YXQgd2UncmUKPj4gb3Zlcmxvb2tpbmc/Cj4gSnVzdCBsaWtlIEludGVsJ3MsIEFNRCdzIGlzIGF2
YWlsYWJsZSBpbiBhIHN1YnNldCBvZiBjYXNlcyBvbmx5Cj4gKGxvb2sgZm9yIHZtY2ItPmd1ZXN0
X2luc19sZW4pLCB3aGljaCBkb24ndCBpbmNsdWRlIHRoZQo+IGV4Y2VwdGlvbiBpbnRlcmNlcHRz
IHlvdSB0YWxrIGFib3V0LiBGb3IgI0RCIEkgdGhpbmsgdGhlcmUncwo+IG5vIGRpZmZlcmVuY2Ug
YmV0d2VlbiBib3RoIGFueXdheS4KCk9uIG5vbi1maXJzdC1nZW4gaGFyZHdhcmUsIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gUklQIGFuZCBOZXh0UklQIHNob3VsZApnaXZlIHlvdSB0aGUgaW5zdHJ1
Y3Rpb24gbGVuZ3RoLsKgIElTVFIgTmV4dFJJUCBpcyB3cml0dGVuIG9uIGFsbCBleGl0cywKYW5k
IGNvbnN1bWVkIG9uIGFsbCBlbnRyaWVzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
