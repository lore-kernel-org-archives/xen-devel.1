From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Qemu-block] [PATCH 02/18] xen: introduce new
 'XenBus' and 'XenDevice' object hierarchy
Date: Wed, 28 Nov 2018 08:28:08 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811280827330.4577@sstabellini-ThinkPad-X260>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-3-paul.durrant@citrix.com>
 <20181128161917.GE4222@dhcp-200-186.str.redhat.com>
 <48596f1fe100419c8b28ed54bda0117b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wa1=oh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gS2h8-0005pH-UD
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:28:10 +0000
In-Reply-To: <48596f1fe100419c8b28ed54bda0117b@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: 'Kevin Wolf' <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOCBOb3YgMjAxOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEtldmluIFdvbGYgW21haWx0bzprd29sZkByZWRoYXQu
Y29tXQo+ID4gU2VudDogMjggTm92ZW1iZXIgMjAxOCAxNjoxOQo+ID4gVG86IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBDYzogcWVtdS1ibG9ja0Bub25nbnUub3Jn
OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHhlbi0KPiA+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Owo+ID4gRWR1
YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPjsgTWljaGFlbCBTLiBUc2lya2luCj4g
PiA8bXN0QHJlZGhhdC5jb20+OyBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdt
YWlsLmNvbT47IEFudGhvbnkKPiA+IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47
IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Owo+ID4gUmljaGFyZCBIZW5kZXJz
b24gPHJ0aEB0d2lkZGxlLm5ldD4KPiA+IFN1YmplY3Q6IFJlOiBbUWVtdS1ibG9ja10gW1BBVENI
IDAyLzE4XSB4ZW46IGludHJvZHVjZSBuZXcgJ1hlbkJ1cycgYW5kCj4gPiAnWGVuRGV2aWNlJyBv
YmplY3QgaGllcmFyY2h5Cj4gPiAKPiA+IEFtIDIxLjExLjIwMTggdW0gMTY6MTEgaGF0IFBhdWwg
RHVycmFudCBnZXNjaHJpZWJlbjoKPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHRoZSBiYXNpYyBib2ls
ZXJwbGF0ZSBmb3IgYSAnWGVuQnVzJyBvYmplY3QgdGhhdCB3aWxsCj4gPiBhY3QKPiA+ID4gYXMg
YSBwYXJlbnQgdG8gJ1hlbkRldmljZScgUFYgYmFja2VuZHMuCj4gPiA+IEEgbmV3ICdYZW5Ccmlk
Z2UnIG9iamVjdCBpcyBhbHNvIGFkZGVkIHRvIGNvbm5lY3QgWGVuQnVzIHRvIHRoZSBzeXN0ZW0K
PiA+IGJ1cy4KPiA+ID4KPiA+ID4gVGhlIFhlbkJ1cyBvYmplY3QgaXMgaW5zdGFudGlhdGVkIGJ5
IGEgbmV3IHhlbl9idXNfaW5pdCgpIGZ1bmN0aW9uCj4gPiBjYWxsZWQKPiA+ID4gZnJvbSB0aGUg
c2FtZSBzaXRlcyBhcyB0aGUgbGVnYWN5IHhlbl9iZV9pbml0KCkgZnVuY3Rpb24uCj4gPiA+Cj4g
PiA+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGZsZXNoLW91dCB0aGUgZnVuY3Rpb25hbGl0eSBv
ZiB0aGVzZSBvYmplY3RzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9ody94ZW4v
eGVuLWJ1cy5jIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gPiBpbmRleCAwMDAwMDAwMDAwLi5kZWRlMmQ5MTRhCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+
ID4gKysrIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gPiBAQCAtMCwwICsxLDEyNSBAQAo+ID4gPiAr
LyoKPiA+ID4gKyAqIENvcHlyaWdodCAoYykgQ2l0cml4IFN5c3RlbXMgSW5jLgo+ID4gPiArICog
QWxsIHJpZ2h0cyByZXNlcnZlZC4KPiA+ID4gKyAqLwo+ID4gCj4gPiBUaGlzIGRvZXNuJ3QgbG9v
ayB2ZXJ5IGNvbXBhdGlibGUgd2l0aCB0aGUgR1BMLiBJbiBmYWN0IGl0IG1pZ2h0IGV2ZW4KPiA+
IG1ha2UgaXQgaWxsZWdhbCBmb3IgdGhlIFFFTVUgcHJvamVjdCB0byBkaXN0cmlidXRlIHRoaXMg
Y29kZS4gOi0pCj4gPiAKPiA+IE90aGVyIGZpbGVzIHlvdSBhZGQgdGhyb3VnaG91dCB0aGUgc2Vy
aWVzIHNlZW0gdG8gaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLgo+ID4gCj4gCj4gSSB3YXMgd29ya2lu
ZyBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IGEgbGFjayBvZiBleHBsaWNpdCBsaWNlbnNlIG1lYW50
IHRoYXQgdGhlIG92ZXJhbGwgcHJvamVjdCBsaWNlbnNlIGFzIGRlc2NyaWJlZCBpbiBpdGVtIDIg
aW4gTElDRU5TRS4gRGlkIEkgbWlzaW50ZXJwcmV0IHRoYXQgdGV4dD8KCkl0J3MgIkFsbCByaWdo
dHMgcmVzZXJ2ZWQuIiB0aGUgcHJvYmxlbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
