From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Tue, 17 Apr 2018 14:53:38 +0100
Message-ID: <64b1a75f-a95c-1a72-e4aa-39c2e005f730@citrix.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
 <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
 <efaa504e-bc4f-243d-f558-cab3dc31b472@citrix.com>
 <de3ffdd5-a3ba-d89a-5ebc-6f17006ae75b@bitdefender.com>
 <CAFLBxZbjif+AeMPrc1CkbyjEiSGHJEW3tGNmMqZtCvp+3pOGeg@mail.gmail.com>
 <00b52489-51e5-6bc8-ccc2-7b44d2dec107@bitdefender.com>
 <359f9be1-b425-7569-d507-97beee8ec69d@bitdefender.com>
 <ea415dac-d9f3-eaa4-a8b2-c8a85a7b1809@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p8o+=hg=citrix.com=prvs=638215151=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f8R3H-0007rS-Ll
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 13:53:43 +0000
In-Reply-To: <ea415dac-d9f3-eaa4-a8b2-c8a85a7b1809@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <dunlapg@umich.edu>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTcvMjAxOCAxMTo1MCBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+ICB2b2lkIHAy
bV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGkpCj4gIHsK
PiAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baV07Cj4g
KyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPiAg
ICAgIHN0cnVjdCBlcHRfZGF0YSAqZXB0Owo+ICAKPiArICAgIHAybS0+bWF4X21hcHBlZF9wZm4g
PSBob3N0cDJtLT5tYXhfbWFwcGVkX3BmbjsKPiArICAgIHAybS0+ZGVmYXVsdF9hY2Nlc3MgPSBo
b3N0cDJtLT5kZWZhdWx0X2FjY2VzczsKPiArICAgIHAybS0+ZG9tYWluID0gaG9zdHAybS0+ZG9t
YWluOwo+ICsgICAgcDJtLT5sb2dkaXJ0eV9yYW5nZXMgPSBob3N0cDJtLT5sb2dkaXJ0eV9yYW5n
ZXM7Cj4gKyAgICBwMm0tPmdsb2JhbF9sb2dkaXJ0eSA9IGhvc3RwMm0tPmdsb2JhbF9sb2dkaXJ0
eTsKClRoaXMgd291bGQgY2VydGFpbmx5IGJlIG9uZSBhcHByb2FjaC4gIEJ1dCB0aGVuIHdlJ2Qg
bmVlZCB0byBrZWVwIGEgbG90Cm1vcmUgb2YgdGhlc2UgdGhpbmdzIGluIHN5bmMgLS0gZm9yIGlu
c3RhbmNlLCB3ZSdkIGhhdmUgdG8gaGF2ZSBzaW1pbGFyCmNvZGUgdG8gZW5hYmxlIGFuZCBkaXNh
YmxlIGdsb2JhbF9sb2dkaXJ0eSBvbiBhbGwgYWN0aXZlIGFsdHAybSBlbnRyaWVzLgoKSSBhbHNv
IGRvbid0IHRoaW5rIHRoZSBtYXhfbWFwcGVkX3BmbiBzaG91bGQgYmUgY29waWVkIGhlcmU7IHRo
ZSBmYWN0CnRoYXQgdXBkYXRlcyBnb3QgZmlsdGVyZWQgb3V0IGJlZm9yZSB3YXMgYSByZWQgaGVy
cmluZyBJIHRoaW5rLgoKQW5vdGhlciBhcHByb2FjaCB3b3VsZCBiZSB0byBtYWludGFpbiB0aGUg
bG9nZGlydHlfcmFuZ2VzIGFuZApnbG9iYWxfbG9nZGlydHkgb25seSBmb3IgdGhlIGhvc3QgcDJt
LCBidXQgdG8gbWlzY29uZmlndXJlIGVudHJpZXMgZm9yCmFsbCB0aGUgcDJtczsgYW5kIHRoZW4g
b24gYSBtaXNjb25maWd1cmF0aW9uLCBoYW5kbGUgdGhlCm1pc2NvbmZpZ3VyYXRpb24gZm9yIHRo
ZSBob3N0cDJtIGFuZCB0aGVuIGRvIGEgbGF6eSBwcm9wYWdhdGUgZm9yIHRoZQphbHRwMm0uICBP
biB0aGUgd2hvbGUgdGhhdCdzIHByb2JhYmx5IG1vcmUgZXJyb3ItcHJvbmUgdGhhbiBqdXN0IGRv
aW5nIGEKZm9yKCkgbG9vcCwgdGhvdWdoLCBhbmQgbm90IHRoYXQgbXVjaCBmYXN0ZXIuIDotKQoK
VGhlIG90aGVyIHRoaW5nIHRoYXQgc2VlbXMgdG8gYmUgbWlzc2luZyBmcm9tIHN5bmNocm9uaXph
dGlvbiBpcyB0aGF0IGluCnAybS1lcHQuYzplcHRfZW5hYmxlX3BtbCgpIHNldHMgdGhlIHAybS0+
ZXB0LmFkIGJpdCAod2hpY2ggZW5kcyB1cCBiZWluZwpwYXJ0IG9mIHRoZSBlcHRwKS4gIFRoZSBj
b2RlIHNlZW1zIHRvIGluZGljYXRlIHRoYXQgdGhpcyBpcyByZXF1aXJlZCBmb3IKUE1MIChoYXJk
d2FyZS1hc3Npc3RlZCBsb2dkaXJ0eSksIGJ1dCBJIGRvbid0IHNlZSBhbnl3aGVyZSB0aGlzIGlz
IHNldApvciBjb3BpZWQgZnJvbSB0aGUgaG9zdCBwMm0uCgpJdCBtaWdodCBiZSBuaWNlIHRvIGhh
dmUgYSBtb3JlIHN0cnVjdHVyZWQgd2F5IG9mIGtlZXBpbmcgYWxsIHRoZXNlCmNoYW5nZXMgaW4g
c3luYywgcmF0aGVyIHRoYW4gcmVseWluZyBvbiB0aGlzIG9wZW4tY29kaW5nIGV2ZXJ5d2hlcmUu
CgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
