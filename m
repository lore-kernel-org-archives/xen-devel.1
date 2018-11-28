From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [Qemu-block] [PATCH 02/18] xen: introduce new
 'XenBus' and 'XenDevice' object hierarchy
Date: Wed, 28 Nov 2018 16:26:32 +0000
Message-ID: <48596f1fe100419c8b28ed54bda0117b@AMSPEX02CL03.citrite.net>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-3-paul.durrant@citrix.com>
 <20181128161917.GE4222@dhcp-200-186.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4qx1=oh=citrix.com=prvs=863a5f629=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gS2gz-0005oT-S0
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:28:01 +0000
In-Reply-To: <20181128161917.GE4222@dhcp-200-186.str.redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Kevin Wolf' <kwolf@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEtldmluIFdvbGYgW21haWx0bzpr
d29sZkByZWRoYXQuY29tXQo+IFNlbnQ6IDI4IE5vdmVtYmVyIDIwMTggMTY6MTkKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogcWVtdS1ibG9ja0Bub25n
bnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsKPiBF
ZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0QHJlZGhhdC5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4K
PiA8bXN0QHJlZGhhdC5jb20+OyBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdt
YWlsLmNvbT47IEFudGhvbnkKPiBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsKPiBSaWNoYXJkIEhlbmRlcnNvbiA8
cnRoQHR3aWRkbGUubmV0Pgo+IFN1YmplY3Q6IFJlOiBbUWVtdS1ibG9ja10gW1BBVENIIDAyLzE4
XSB4ZW46IGludHJvZHVjZSBuZXcgJ1hlbkJ1cycgYW5kCj4gJ1hlbkRldmljZScgb2JqZWN0IGhp
ZXJhcmNoeQo+IAo+IEFtIDIxLjExLjIwMTggdW0gMTY6MTEgaGF0IFBhdWwgRHVycmFudCBnZXNj
aHJpZWJlbjoKPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgYmFzaWMgYm9pbGVycGxhdGUgZm9yIGEg
J1hlbkJ1cycgb2JqZWN0IHRoYXQgd2lsbAo+IGFjdAo+ID4gYXMgYSBwYXJlbnQgdG8gJ1hlbkRl
dmljZScgUFYgYmFja2VuZHMuCj4gPiBBIG5ldyAnWGVuQnJpZGdlJyBvYmplY3QgaXMgYWxzbyBh
ZGRlZCB0byBjb25uZWN0IFhlbkJ1cyB0byB0aGUgc3lzdGVtCj4gYnVzLgo+ID4KPiA+IFRoZSBY
ZW5CdXMgb2JqZWN0IGlzIGluc3RhbnRpYXRlZCBieSBhIG5ldyB4ZW5fYnVzX2luaXQoKSBmdW5j
dGlvbgo+IGNhbGxlZAo+ID4gZnJvbSB0aGUgc2FtZSBzaXRlcyBhcyB0aGUgbGVnYWN5IHhlbl9i
ZV9pbml0KCkgZnVuY3Rpb24uCj4gPgo+ID4gU3Vic2VxdWVudCBwYXRjaGVzIHdpbGwgZmxlc2gt
b3V0IHRoZSBmdW5jdGlvbmFsaXR5IG9mIHRoZXNlIG9iamVjdHMuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAKPiA+IGRpZmYg
LS1naXQgYS9ody94ZW4veGVuLWJ1cy5jIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmRlZGUyZDkxNGEKPiA+IC0tLSAvZGV2
L251bGwKPiA+ICsrKyBiL2h3L3hlbi94ZW4tYnVzLmMKPiA+IEBAIC0wLDAgKzEsMTI1IEBACj4g
PiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIENpdHJpeCBTeXN0ZW1zIEluYy4KPiA+ICsgKiBB
bGwgcmlnaHRzIHJlc2VydmVkLgo+ID4gKyAqLwo+IAo+IFRoaXMgZG9lc24ndCBsb29rIHZlcnkg
Y29tcGF0aWJsZSB3aXRoIHRoZSBHUEwuIEluIGZhY3QgaXQgbWlnaHQgZXZlbgo+IG1ha2UgaXQg
aWxsZWdhbCBmb3IgdGhlIFFFTVUgcHJvamVjdCB0byBkaXN0cmlidXRlIHRoaXMgY29kZS4gOi0p
Cj4gCj4gT3RoZXIgZmlsZXMgeW91IGFkZCB0aHJvdWdob3V0IHRoZSBzZXJpZXMgc2VlbSB0byBo
YXZlIHRoZSBzYW1lIHByb2JsZW0uCj4gCgpJIHdhcyB3b3JraW5nIG9uIHRoZSBhc3N1bXB0aW9u
IHRoYXQgYSBsYWNrIG9mIGV4cGxpY2l0IGxpY2Vuc2UgbWVhbnQgdGhhdCB0aGUgb3ZlcmFsbCBw
cm9qZWN0IGxpY2Vuc2UgYXMgZGVzY3JpYmVkIGluIGl0ZW0gMiBpbiBMSUNFTlNFLiBEaWQgSSBt
aXNpbnRlcnByZXQgdGhhdCB0ZXh0PwoKICBQYXVsCgo+IEtldmluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
