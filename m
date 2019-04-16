From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5] x86/altp2m: Aggregate get entry and
 populate into common funcs
Date: Tue, 16 Apr 2019 14:51:23 +0100
Message-ID: <55fc24f5-8f6e-08d5-3e9d-946de804d83b@citrix.com>
References: <20190416084531.5084-1-aisaila@bitdefender.com>
 <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=19lK=SS=citrix.com=prvs=002fb28a9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGOVW-0001hr-BV
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:52:18 +0000
In-Reply-To: <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDQvMjAxOSAxNDo0NCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Cj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0u
aAo+PiBpbmRleCAyODAxYThjY2NhLi44ZGM0MzUzNjQ1IDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L3AybS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPj4g
QEAgLTUxNCw2ICs1MTQsMjMgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19n
Zm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuKQo+PiAgICAgICAgICByZXR1cm4gbWZuX3go
bWZuKTsKPj4gIH0KPj4KPj4gK2ludCBhbHRwMm1fZ2V0X2VudHJ5KHN0cnVjdCBwMm1fZG9tYWlu
ICphcDJtLCBnZm5fdCBnZm4sIG1mbl90ICptZm4sCj4+ICsgICAgICAgICAgICAgICAgICAgICBw
Mm1fdHlwZV90ICp0LCBwMm1fYWNjZXNzX3QgKmEsIGJvb2wgcHJlcG9wdWxhdGUpOwo+PiArCj4+
ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fZ2V0X2VudHJ5X2RpcmVjdChzdHJ1Y3QgcDJtX2Rv
bWFpbiAqYXAybSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSkKPj4gK3sKPj4gKyAg
ICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgdCwgYSwgZmFsc2UpOwo+
PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fZ2V0X2VudHJ5X3ByZXBvcHVs
YXRlKHN0cnVjdCBwMm1fZG9tYWluICphcDJtLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBnZm4sIG1mbl90ICptZm4sCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAy
bV9hY2Nlc3NfdCAqYSkKPj4gK3sKPj4gKyAgICByZXR1cm4gYWx0cDJtX2dldF9lbnRyeShhcDJt
LCBnZm4sIG1mbiwgdCwgYSwgdHJ1ZSk7Cj4+ICt9Cj4gQXJlIHRoZXNlIHdyYXBwZXJzIHJlYWxs
eSByZXF1aXJlZD8gSSBkb24ndCB0aGluayB0aGV5IGFkZCBhbnl0aGluZyB0bwo+IHJlYWRhYmls
aXR5LCBpdCdzIGp1c3QgeWV0IGFub3RoZXIgbGF5ZXIgdGhhdCBkb2VzIGFsbW9zdCBub3RoaW5n
LgoKRnJvbSBhIHJlYWRhYmlsaXR5IHBvaW50IG9mIHZpZXcsIGJvb2xlYW4gcGFyYW1ldGVycyBh
cmUgYWJvdXQgYXMgb3BhcXVlCmFzIHRoZXkgY29tZS7CoCBUaGUgc2FtZSBnb2VzIGZvciBhbGwg
b3RoZXIgc2NhbGFyIHBhcmFtZXRlcnMgd2hpY2ggZG9uJ3QKaGF2ZSBhIG1uZW1vbmljLgoKRm9y
IHNvbWVvbmUgd2hvIGlzIG5vdCBhbiBleHBlcnQgb2YgdGhlIGludHJpY2FjaWVzIG9mIHRoZSBz
dWJzeXN0ZW0sCmhhdmluZyB0aGUgb3B0aW9ucyBzcGVsdCBvdXQgaW4gd3JhcHBlcnMgbGlrZSB0
aGlzIGlzIGV4dHJlbWVseSBoZWxwZnVsCnRvIHJlZHVjZSB0aGUgY29nbml0aXZlIGxvYWQgb2Yg
dHJ5aW5nIHRvIGZvbGxvdyB0aGUgY29kZS4KCklmIGl0IHdlcmUgdXAgdG8gbWUsIGFsbCBvZiBv
dXIgY29kZSB3b3VsZCBiZSB3cmFwcGVkIGxpa2UgdGhpcywgYnV0IEkKa25vdyB0aGF0IG90aGVy
cyBoYXZlIGRpZmZlcmluZyBvcGluaW9ucy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
