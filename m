From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/9] vm_event: Define VM_EVENT type
Date: Mon, 3 Jun 2019 16:26:28 -0600
Message-ID: <CABfawhmhdgks1k77EwY_h4-biFmvFuE-uO_1LtZ082mUVDDxnA@mail.gmail.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
 <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
 <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXvQ7-0005sV-9o
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:27:11 +0000
Received: by mail-wr1-f47.google.com with SMTP id b18so13699602wrq.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 15:27:05 -0700 (PDT)
In-Reply-To: <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMywgMjAxOSBhdCA0OjIyIFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gIC8qIFhFTl9ET01DVExfbWVtX3NoYXJpbmdfb3Au
Cj4gPiA+IC0gKiBUaGUgQ09OVFJPTCBzdWItZG9tY3RsIGlzIHVzZWQgZm9yIGJyaW5ndXAvdGVh
cmRvd24uICovCj4gPiA+ICsgKiBUaGUgQ09OVFJPTCBzdWItZG9tY3RsIGlzIHVzZWQgZm9yIGJy
aW5ndXAvdGVhcmRvd24uCj4gPiA+ICsgKiBQbGVhc2Ugbm90ZSB0aGF0IG1lbSBzaGFyaW5nIGNh
biBiZSB0dXJuZWQgb24gKndpdGhvdXQqIHNldHRpbmctdXAgdGhlCj4gPiA+ICsgKiBjb3JyZXNw
b25kaW4gcmluZwo+ID4gPiArICovCj4gPgo+ID4gQXMgYSB0YW5nZW50LCBpdCBjYW4/IGhvdz8g
IChJJ20gZW50aXJlbHkgcHJlcGFyZWQgdG8gYmVsaWV2ZSB0aGF0IHRoaXMKPiA+IGlzIGhvdyB0
aGUgY29kZSBjdXJyZW50bHkgd29ya3MsIGJ1dCBJIGNhbid0IHNlZSBob3cgc3VjaCBhIHNldHVw
IHdvdWxkCj4gPiBwbGF1c2libHkgd29yay4pCj4KPiBUaGUgdm1fZXZlbnQgcmluZyBmb3IgbWVt
X3NoYXJpbmcgaXMgb25seSB1c2VkIHRvIGNvbW11bmljYXRlCj4gb3V0LW9mLW1lbW9yeSBjb25k
aXRpb24gdG8gYW4gZXh0ZXJuYWwgbGlzdGVuZXIuIEkgdGhpbmsgaXQncyBvbmx5Cj4gdXNlZnVs
IGZvciBsb2dnaW5nIHNpbmNlIHRoZSBsaXN0ZW5lciB3b3VsZG4ndCByZWFsbHkgYmUgaW4gYSBw
b3NpdGlvbgo+IHRvIHRyeSB0byAibWFrZSBzcGFjZSIgZm9yIHRoZSBmYXVsdGluZyBkb21haW4g
YW5kIGl0IHdvdWxkIGdldAo+IGRlc3Ryb3llZCBhZnRlciB0aGUgbWVzc2FnZSBpcyBzZW50LiBJ
biBhbnkgY2FzZSwgdGhlcmUgaXNuJ3QgYW55Cj4gZG9jdW1lbnRhdGlvbiBmb3IgaG93IGl0IHdh
cyBpbnRlbmRlZCB0byBiZSB1c2VkIHNvIHRoaXMgaXMganVzdCBteQo+IGd1ZXNzLgoKQWN0dWFs
bHksIGl0IHNlZW1zIHRoZSBsaXN0ZW5lciB3YXMgaW50ZW5kZWQgdG8gYmUgYWJsZSB0byB0cnkg
dG8KIm1ha2Ugc3BhY2UiIGZvciB0aGUgZG9tYWluLiBIb3cgZXhhY3RseSBpcyBub3QgY2xlYXIg
YnV0IGFueXdheSwgdGhlCmRvbWFpbiB3b3VsZCBnZXQgcGF1c2VkIGlmIHRoZXJlIGlzIGEgbGlz
dGVuZXIgaW5zdGVhZCBvZiBqdXN0IGJlaW5nCmRlc3Ryb3llZCB3aGVuIHRoZXJlIGlzIGFuIEVO
T01FTSBlcnJvciB3aGlsZSB0cnlpbmcgdG8gZGVkdXBsaWNhdGUKc2hhcmVkIHBhZ2VzLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
