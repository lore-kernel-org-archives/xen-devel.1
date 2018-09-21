From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Change return error for offline
 vcpus
Date: Fri, 21 Sep 2018 09:43:22 +0100
Message-ID: <20180921084322.57tkffdhwqyemw7w@zion.uk.xensource.com>
References: <20180921073030.32354-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3H27-0002cX-GV
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 08:43:27 +0000
Content-Disposition: inline
In-Reply-To: <20180921073030.32354-1-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMTA6MzA6MzBBTSArMDMwMCwgQWxleGFuZHJ1IElzYWls
YSB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIG5lZWRlZCBpbiBvcmRlciB0byBoYXZlIGEgZGlmZmVy
ZW50IHJldHVybiBlcnJvciBmb3IgaW52YWxpZCB2Y3B1Cj4gYW5kIG9mZmxpbmUgdmNwdSBvbiB0
aGUgcGVyIHZjcHUga2luZy4KClNvcnJ5LCBJIGNhbid0IHBhcnNlIHRoaXMgc2VudGVuY2UuIFdo
YXQgaXMgInBlciB2Y3B1IGtpbmciPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNh
aWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiAKPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIFYx
Ogo+IAktIEFkZCBjb25kaXRpb25hbCBzdGF0ZW1lbnQgaW4gb3JkZXIgdG8gaGF2ZSBhIGRpZmZl
cmVuY2UgYmV0d2Vlbgo+IAlwZXJfdmNwdSBhbmQgcGVyX2RvbSByZXR1cm4gZXJyb3IuCj4gLS0t
Cj4gIHhlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL3NhdmUuYyBiL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCj4gaW5kZXggZDUyMDg5ODg0
My4uMTc2NGZiMDkxOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCj4gQEAgLTE2NSw3ICsxNjUsOCBAQCBpbnQgaHZt
X3NhdmVfb25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB0eXBlY29kZSwgdW5zaWdu
ZWQgaW50IGluc3RhbmNlLAo+ICAgICAgaWYgKCAocnYgPSBodm1fc3JfaGFuZGxlcnNbdHlwZWNv
ZGVdLnNhdmUodiwgJmN0eHQpKSAhPSAwICkKPiAgICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJS
ICJIVk0lZCBzYXZlOiBmYWlsZWQgdG8gc2F2ZSB0eXBlICUiUFJJdTE2IiAoJWQpXG4iLAo+ICAg
ICAgICAgICAgICAgICBkLT5kb21haW5faWQsIHR5cGVjb2RlLCBydik7Cj4gLSAgICBlbHNlIGlm
ICggcnYgPSAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXplb2YoKmRlc2MpICkKPiArICAgIGVsc2Ug
aWYgKCBydiA9IGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0ua2luZCA9PSBIVk1TUl9QRVJfVkNQ
VSA/Cj4gKyAgICAgICAgICAgICAgLUVOT0RBVEEgOiAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXpl
b2YoKmRlc2MpICkKPiAgICAgIHsKPiAgICAgICAgICB1aW50MzJfdCBvZmY7Cj4gIAo+IC0tIAo+
IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
