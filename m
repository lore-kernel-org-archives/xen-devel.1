From: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a
 few
Date: Fri, 14 Dec 2018 14:16:28 -0600
Message-ID: <9eb33910-7afc-42c8-6e07-713f3fb023c0__37586.5046204582$1544818555$gmane$org@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IEFU=OX=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1gXttI-0005CN-In
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 20:16:56 +0000
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fam Zheng <famz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:bochs" <qemu-block@nongnu.org>, Stefan Markovic <smarkovic@wavecomp.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkos>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTMvMTggNDozNyBQTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBNb3N0IGZpbGVzIHRo
YXQgaGF2ZSBUQUJzIG9ubHkgY29udGFpbiBhIGhhbmRmdWwgb2YgdGhlbS4gIENoYW5nZQo+IHRo
ZW0gdG8gc3BhY2VzIHNvIHRoYXQgd2UgZG9uJ3QgY29uZnVzZSBwZW9wbGUuCj4gCj4gZGlzYXMs
IHN0YW5kYXJkLWhlYWRlcnMsIGxpbnV4LWhlYWRlcnMgYW5kIGxpYmRlY251bWJlciBhcmUgaW1w
b3J0ZWQKPiBmcm9tIG90aGVyIHByb2plY3RzIGFuZCBwcm9iYWJseSBzaG91bGQgYmUgZXhlbXB0
ZWQgZnJvbSB0aGUgY2hlY2suCj4gT3V0c2lkZSB0aG9zZSwgYWZ0ZXIgdGhpcyBwYXRjaCB0aGUg
Zm9sbG93aW5nIGZpbGVzIHN0aWxsIGNvbnRhaW4gYm90aAo+IDgtc3BhY2UgYW5kIFRBQiBzZXF1
ZW5jZXMgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbGluZS4gIE1hbnkgb2YgdGhlbQo+IGhhdmUg
YSBtYWpvcml0eSBvZiBUQUJzLCBvciB3ZXJlIGluaXRpYWxseSBjb21taXR0ZWQgd2l0aCBhbGwg
dGFicy4KPiAKCj4gU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4KPiAtLS0KCj4gICBuYmQvY2xpZW50LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQoKTkJEIHBhcnQ6CkFja2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0
LmNvbT4KCmJ1dCBJIGhhdmUgcGF0Y2hlcyB0aGF0IHJlbW92ZSB0aGUgbGluZSBpbiBxdWVzdGlv
biBlbnRpcmVseSBhcyBwYXJ0IG9mIAphZGRpbmcgJ3FlbXUtbmJkIC0tbGlzdCcuCgotLSAKRXJp
YyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAgICAg
ICAgICsxLTkxOS0zMDEtMzI2NgpWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5v
cmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
