From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Add EFI_LOAD_OPTION support
Date: Thu, 04 Jan 2018 09:25:55 -0700
Message-ID: <5A4E63A3020000780019B1ED@prv-mh.provo.novell.com>
References: <20180102155628.3007-1-tamas@tklengyel.com>
 <5A4CCA8C020000780019A74B@prv-mh.provo.novell.com>
 <CABfawhkNbLJNbxHxxne=AMPZanGh6V=+o5=WY1jT0POjCTLFoQ@mail.gmail.com>
 <5A4D14AD020000780019A971@prv-mh.provo.novell.com>
 <CABfawhkMKcOECtZcA4wmapUtaFerv4xBAkudeYYCLWoCrMPUxQ@mail.gmail.com>
 <5A4E136F020000780019AE06@prv-mh.provo.novell.com>
 <CABfawhk4CRHwZVj6Sy5WvkzzSTH-AUNxq83DBnYTH4sDbONfXA@mail.gmail.com>
 <5A4E4F85020000780019B1AB@prv-mh.provo.novell.com>
 <CABfawhmf1+97Mgduhs7TZ0hD76xMExnHnkK5sapsgAovQSAfkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=q53i=d7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eX8LF-0002G7-Kz
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 16:26:05 +0000
In-Reply-To: <CABfawhmf1+97Mgduhs7TZ0hD76xMExnHnkK5sapsgAovQSAfkw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, openxt <openxt@googlegroups.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE3OjE2LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKYW4gNCwgMjAxOCBhdCA4OjAwIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAwNC4wMS4xOCBhdCAxNTozOSwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+IHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gNCwgMjAxOCBhdCAzOjQzIEFNLCBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IEp1c3QgbG9va2luZyBhdCB0aGUg
bG93IGJpdCBvZiB0aGUgZmlyc3QKPj4+PiBieXRlIGJlZm9yZSBhc3N1bWluZyB0aGlzIGNvdWxk
IGJlIGEgbG9hZCBvcHRpb24gc3RydWN0dXJlLAo+Pj4+IGhvd2V2ZXIsIGlzIHRvbyB3ZWFrIGEg
Y2hlY2sgZm9yIG15IHRhc3RlLgo+Pj4KPj4+IFRoZXJlIGlzIG1vcmUgZG9uZSBpbiB0aGlzIHBh
dGNoIHRoZW4ganVzdCBjaGVja2luZyB0aGUgbG93IGJpdCBvZiB0aGUKPj4+IEF0dHJpYnV0ZXMg
ZmllbGQ6IGNhbGN1bGF0aW5nIHdoZXJlIHRoZSBPcHRpb25hbERhdGEgc2hvdWxkIGJlIGlmIHRo
aXMKPj4+IGlzIGluZGVlZCBhbiBFRklfTE9BRF9PUFRJT04gYW5kIHRoZW4gc2FuaXR5IGNoZWNr
aW5nIGlmIHRoYXQgYWRkcmVzcwo+Pj4gaXMgc2FuZSBvciBub3QuIFRoaXMgcmVxdWlyZXMgdGhl
IGJ1ZmZlciB0byBoYXZlIGEgbGF5b3V0IHRoYXQgYXQKPj4+IGxlYXN0IHBhcnNlcyBwcm9wZXJs
eSBhcyBhbiBFRklfTE9BRF9PUFRJT04sIGhlbmNlIGl0IGxpa2VseSBpcyBvbmUuLgo+Pgo+PiBC
dXQgdGhhdCBjYWxjdWxhdGlvbiBpcyBub3QgZG9pbmcgYWxsIHRoZSBjaGVja2luZyB0aGF0IHdv
dWxkIGJlCj4+IG5lZWRlZCB0byBiZSByZWFzb25hYmx5IHNhZmUuIEluIHBhcnRpY3VsYXIsIHlv
dSBtdXN0bid0IGNhbGwKPj4gd3N0cmxlbigpIHdoZW4geW91IGRvbid0IGtub3cgd2hldGhlciBh
bGwgb2YgdGhlIHN1cHBvc2VkCj4+IHN0cmluZyBpcyBhY3R1YWxseSBpbnNpZGUgdGhlIGdpdmVu
IG1lbW9yeSBibG9jayBzaXplLiBBbmQgSSdtCj4+IGFsc28gbm90IGVudGlyZWx5IGNlcnRhaW4g
d2hldGhlciBjYXJpbmcgb2Ygb3ZlcmZsb3cgaW4gb25seSBvbmUKPj4gKGxhdGUpIHBsYWNlIGlz
IHN1ZmZpY2llbnQuCj4gCj4gRmFpciBlbm91Z2guIEhvdyBhYm91dCBpZiB3ZSBjaGVjayB3aGV0
aGVyIHRoZSBzdXBwb3NlZCBzdHJpbmcgc3RhcnQKPiBzcG90IGlzIHdpdGhpbiB0aGUgYnVmZmVy
IGFuZCB0aGVuIHVzZSB3c3RybmxlbiBpbiBwbGFjZSBzdWNoIHRoYXQgaXQKPiBjYW4ndCBnbyBw
YXN0IHRoZSBidWZmZXI/IFdvdWxkIHRoYXQgYmUgZW5vdWdoIHNhbml0eSBjaGVja2luZz8KClRo
YXQgc2hvdWxkIGJlIGVub3VnaCwgeWVzLiBEbyB3ZSBoYXZlIHdzdHJubGVuKCkgdGhvdWdoPwpS
YXRoZXIgdGhhbiBpbnRyb2R1Y2luZyBpdCwgb3Blbi1jb2RpbmcgdGhlIHNlYXJjaCBmb3IgdGhl
IG51bAp0ZXJtaW5hdG9yIG1heSBiZSBtb3JlIGFwcHJvcHJpYXRlIGluIGEgY2FzZSBsaWtlIHRo
aXMgb25lLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
