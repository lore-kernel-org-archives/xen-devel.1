From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Fri, 26 Jan 2018 18:40:25 +0200
Message-ID: <dcc19801-c03c-3598-a5a0-08426b43f5cc@bitdefender.com>
References: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
 <0052b33d-f0fe-ee91-892d-a63c8001c567@bitdefender.com>
 <CALn24pBf1UGbrqsSD_=abdM1U7X+vMuPd0q4KgYYH_tmd7mkAw@mail.gmail.com>
 <cf9bfa43-6ca5-e260-c509-040b927390fa@bitdefender.com>
 <CALn24pDDFmh9+SkE-gyyK2xzhemX7=JBYzt2SQjFGnp4gy-yyQ@mail.gmail.com>
 <a188f71a-7e0b-47b4-3e07-dee9e87aea83@bitdefender.com>
 <CALn24pC=62oFKNOasbu7n-qMj4B6r5EoBYAHG1Tg-Y+WWyEDwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CALn24pC=62oFKNOasbu7n-qMj4B6r5EoBYAHG1Tg-Y+WWyEDwg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Bitweasil ." <bitweasil@cryptohaze.com>
Cc: andrew.cooper3@citrix.com, tamas@tklengyel.com, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjYvMjAxOCAwNjoxNyBQTSwgQml0d2Vhc2lsIC4gd3JvdGU6Cj4gVGhlIHByb3Bvc2Vk
IGNoYW5nZXMgd291bGQgb25seSBoYXZlIGFuIGltcGFjdCBpZiBDUjMgZXhpdGluZyBpcwo+IGVu
YWJsZWQsIHdoaWNoIGltcGxpZXMgYSBwYWlyIG9mIHdvcmxkIHN3aXRjaGVzIGFuZCBvdGhlciBj
b2RlIGV4ZWN1dGlvbgo+IGluIGEgZGlmZmVyZW50IHJlZ2lvbiBvZiBtZW1vcnkgYW5kIHdpdGgg
ZGlmZmVyZW50IHBhZ2UgdGFibGVzIGFueXdheS4KPiAKPiBVbmRlciBub3JtYWwgb3BlcmF0aW9u
LCBDUjMgZXhpdGluZyBpcyBub3QgdHVybmVkIG9uLCBzbyB0aGlzIHdpbGwgaGF2ZQo+IG5vIGlt
cGFjdCBvbiBvcGVyYXRpb24uCj4gCj4gQXJlIHRoZXJlIGFueSBub24taW50cm9zcGVjdGlvbiBj
YXNlcyBpbiB3aGljaCBDUjMgZXhpdGluZyB3aWxsIGJlCj4gZW5hYmxlZCBmb3IgaGFyZHdhcmUg
dmlydHVhbGl6ZWQgZ3Vlc3RzP8KgIEdpdmVuIHRoZSB0aW1lIGNvc3Qgb2YgYSBwYWlyCj4gb2Yg
d29ybGQgc3dpdGNoZXMgYW5kIGhhbmRsaW5nIHRoZSBhc3NvY2lhdGVkIGNvZGUsIEkgcXVlc3Rp
b24gaWYgb25lCj4gY291bGQgZXZlbiBtZWFzdXJlIHRoZSBkaWZmZXJlbmNlIG9mIHRoZSBUTEIg
Zmx1c2ggb3Igbm90LsKgIFRoZSBDUjMKPiByZXBvcnRpbmcgcGVyZm9ybWFuY2UgaGl0IHVuZGVy
IEtQVEkgaXMgcXVpdGUgY2F0YXN0cm9waGljIGFueXdheSwKPiB0aG91Z2ggSSBleHBlY3Qgb25l
IGNvdWxkIG1pdGlnYXRlIHRoYXQgc29tZXdoYXQgd2l0aCBDUjMtdGFyZ2V0cywgaWYKPiBvbmUg
d2FudGVkIHRvLgoKQ1IzIGV4aXRzIHNlZW0gaW5kZWVkIHRvIGJlIGVuYWJsZWQgdmlhIHtodm0s
dm14fV91cGRhdGVfY3IodiwgMCksCmhvd2V2ZXIgSSBiZWxpZXZlIHRoYXQgdGhleSBjdXJyZW50
bHkgcmVtYWluIGVuYWJsZWQgZXZlbiBhZnRlciB0aGUKdm1fZXZlbnQgY29uc3VtZXIgZGV0YWNo
ZXMgZnJvbSB0aGUgZ3Vlc3QgKEkgZG9udCB0aGluawpDUFVfQkFTRURfQ1IzX0xPQURfRVhJVElO
RyBpcyBiZWluZyBjbGVhcmVkIGZyb20Kdi0+YXJjaC5odm1fdm14LmV4ZWNfY29udHJvbCkuIFRo
aXMgbmVlZHMgdGVzdGluZywgYnV0IEkgYmVsaWV2ZSBpdCB0bwpiZSBjb3JyZWN0LgoKClRoYW5r
cywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
