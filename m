From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a
 few
Date: Fri, 14 Dec 2018 10:22:11 +0000
Message-ID: <20181214102211.GF4265__23499.8118169189$1544782913$gmane$org@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iYk8=OX=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1gXkcX-0008A8-Dl
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 10:23:01 +0000
Content-Disposition: inline
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fam Zheng <famz@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:bochs" <qemu-block@nongnu.org>, Stefan Markovic <smarkovic@wavecomp.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, Ji
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMTE6Mzc6MzdQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBNb3N0IGZpbGVzIHRoYXQgaGF2ZSBUQUJzIG9ubHkgY29udGFpbiBhIGhhbmRmdWwg
b2YgdGhlbS4gIENoYW5nZQo+IHRoZW0gdG8gc3BhY2VzIHNvIHRoYXQgd2UgZG9uJ3QgY29uZnVz
ZSBwZW9wbGUuCj4gCj4gZGlzYXMsIHN0YW5kYXJkLWhlYWRlcnMsIGxpbnV4LWhlYWRlcnMgYW5k
IGxpYmRlY251bWJlciBhcmUgaW1wb3J0ZWQKPiBmcm9tIG90aGVyIHByb2plY3RzIGFuZCBwcm9i
YWJseSBzaG91bGQgYmUgZXhlbXB0ZWQgZnJvbSB0aGUgY2hlY2suCj4gT3V0c2lkZSB0aG9zZSwg
YWZ0ZXIgdGhpcyBwYXRjaCB0aGUgZm9sbG93aW5nIGZpbGVzIHN0aWxsIGNvbnRhaW4gYm90aAo+
IDgtc3BhY2UgYW5kIFRBQiBzZXF1ZW5jZXMgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbGluZS4g
IE1hbnkgb2YgdGhlbQo+IGhhdmUgYSBtYWpvcml0eSBvZiBUQUJzLCBvciB3ZXJlIGluaXRpYWxs
eSBjb21taXR0ZWQgd2l0aCBhbGwgdGFicy4KCj4gICAgIGNyeXB0by9hZXMuYwoKU2luY2UgeW91
IGFscmVhZHkgY2xlYW5lZCBzb21lIHRhYnMgaW4gdGhlIHByZXZpb3VzIHBhdGNoLCBhbmQgdGhl
CnJlc3Qgb2YgY3J5cHRvLyBleGNlcHQgZGVzcmZiLmMgaXMgdGFiLWNsZWFuLCBJJ2QgbGlrZSB0
aGlzIHRvIGJlCmZ1bGx5IGNsZWFuZWQgdG9vLgoKCj4gICAgIHVpL3ZuYy1lbmMtaGV4dGlsZS10
ZW1wbGF0ZS5oCj4gICAgIHVpL3ZuYy1lbmMtenl3cmxlLmgKClRoZSBWTkMgY29kZSB3YXMgaGlz
dG9yaWNhbGx5IGhlYXZpbHkgdGFiLWRhbWFnZWQgYW5kIHdlJ3ZlCnByb2dyZXNzaXZlbHkgY2xl
YW5lZCBpdCB1cCB3aGVuIG1ha2luZyBjaGFuZ2VzLiAKCj4gVGhlIGZvbGxvd2luZyBoYXZlIG9u
bHkgVEFCczoKCj4gICAgIGNyeXB0by9kZXNyZmIuYwoKSSdkIHJhdGhlciBsaWtlIHRoaXMgdG8g
YmUgY2xlYW5lZCB0byBmaW5pc2ggdGhlIGpvYiBmb3IKY3J5cHRvLy4KCgoKPiBTaWduZWQtb2Zm
LWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IC0tLQoKCj4gIHVpL3Zu
Yy1lbmMtenl3cmxlLXRlbXBsYXRlLmMgICAgICAgICAgICAgICB8ICA0ICstCj4gIHVpL3ZuYy5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCgpUaGF0IHlvdSd2ZSBm
aW5pc2hlZCB0YWItY2xlYW5pbmcgb2YgdGhlc2UgZmlsZXMsIHJlaW5mb3JjZXMgdG8KbWUgdGhh
dCB3ZSBzaG91bGQgY2xlYW4gdGhvc2Ugb3RoZXIgdm5jIGZpbGVzIGxpc3RlZCBhYm92ZS4KCk5v
bmUgdGhlIGxlc3MKCiAgUmV2aWV3ZWQtYnk6IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdl
QHJlZGhhdC5jb20+CgpzaW5jZSB0aG9zZSBvbmVzIG1lbnRpb25lZCBhYm92ZSBjYW4gc3RpbGwg
YmUgZG9uZSBhcyBhIHNlcGFyYXRlCmNvbW1pdCB0byB0aGlzLgoKUmVnYXJkcywKRGFuaWVsCi0t
IAp8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3Iu
Y29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1v
LSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cnw6IGh0dHBzOi8v
ZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2Ri
ZXJyYW5nZSA6fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
