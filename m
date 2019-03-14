From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] xen-pt: Round pci regions sizes to
 XEN_PAGE_SIZE
Date: Thu, 14 Mar 2019 19:37:21 +0000
Message-ID: <26befc52-ee18-964a-5ecd-1a61acd8fe75@citrix.com>
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-7-jandryuk@gmail.com>
 <ee0da83d3f054e72ae450437c8834d04@AMSPEX02CL02.citrite.net>
 <CAKf6xpujVs3RPJcb+2vqPZFcYwhdDcjbt=S_+awjPuPFpFHsPw@mail.gmail.com>
 <75347d5f-3b47-3b35-fa96-cd166c240d9e@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4WAP-0000o6-Rc
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 19:37:25 +0000
In-Reply-To: <75347d5f-3b47-3b35-fa96-cd166c240d9e@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxOToyMiwgU2ltb24gR2Fpc2VyIHdyb3RlOgo+IEphc29uIEFuZHJ5dWs6
Cj4+IE9uIFdlZCwgTWFyIDEzLCAyMDE5IGF0IDExOjA5IEFNIFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+Pj4gRnJvbTogSmFzb24gQW5kcnl1ayBbbWFpbHRvOmphbmRyeXVrQGdtYWlsLmNvbV0KPj4+
PiBTZW50OiAxMSBNYXJjaCAyMDE5IDE4OjAyCj4+Pj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zwo+Pj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IG1hcm1hcmVrQGludmlz
aWJsZXRoaW5nc2xhYi5jb207IFNpbW9uIEdhaXNlcgo+Pj4+IDxzaW1vbkBpbnZpc2libGV0aGlu
Z3NsYWIuY29tPjsgSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pCj4+Pj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBBbnRob255IFBlcmFyZCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+Pj4+IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4KPj4+PiBTdWJqZWN0OiBbUEFUQ0ggNi82XSB4ZW4tcHQ6IFJvdW5kIHBj
aSByZWdpb25zIHNpemVzIHRvIFhFTl9QQUdFX1NJWkUKPj4+Pgo+Pj4+IEZyb206IFNpbW9uIEdh
aXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPj4+Pgo+Pj4+IElmIGEgcGNpIG1l
bW9yeSByZWdpb24gaGFzIGEgc2l6ZSA8IFhFTl9QQUdFX1NJWkUgaXQgY2FuIGdldCBsb2NhdGVk
IGF0Cj4+Pj4gYW4gYWRkcmVzcyB3aGljaCBpcyBub3QgcGFnZSBhbGlnbmVkLgo+Pj4gSUlSQyB0
aGUgUENJIHNwZWMgc2F5cyB0aGF0IHRoZSBtaW5pbXVtIG1lbW9yeSByZWdpb24gc2l6ZSBzaG91
bGQgYmUgYXQgbGVhc3QgNGsuIFNob3VsZCB3ZSBldmVuIGJlIHRvbGVyYXRpbmcgQkFScyBzbWFs
bGVyIHRoYW4gdGhhdD8KPj4+Cj4+PiAgIFBhdWwKPj4+Cj4+IEhpLCBQYXVsLgo+Pgo+PiBTaW1v
biBmb3VuZCB0aGlzLCBzbyBpdCBhZmZlY3RzIGEgcmVhbCBkZXZpY2UuICBTaW1vbiwgZG8geW91
IHJlY2FsbAo+PiB3aGljaCBkZXZpY2Ugd2FzIGFmZmVjdGVkPwo+IE5vdCBzdXJlIHdoaWNoIG9u
ZSBpdCB3YXMuIFByb2JhYmx5IHRoZSBVU0IgY29udHJvbGxlciBvciB0aGUgU0QgaG9zdAo+IGNv
bnRyb2xsZXIuIEFzIHlvdXIgZXhhbXBsZSBiZWxvdyBzaG93cyB0aGlzIGlzIG5vdCBzbyB1bmNv
bW1vbi4KClRoZSBtaW5pbXVtIGlzIDEyOCBieXRlcywgbm90IDRrIC0gSSd2ZSBqdXN0IGNoZWNr
ZWQgdGhlIFBDSWUgc3BlYy4KClhlbi9RZW11IGRlZmluaXRlbHkgbmVlZHMgdG8gY29wZSB3aXRo
IHNtYWxsZXIgdGhhbiA0ayBpZiB3ZSB3YW50IHRvIGJlCnNwZWMgY29tcGxpYW50LgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
