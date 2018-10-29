From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/20] Trivial patches patches
Date: Mon, 29 Oct 2018 11:54:06 +0000
Message-ID: <CAFEAcA-8sN2MGK6OcK5uMbMuw33MMOAgsdr9y4Uj2qmpbTkeig__25774.2062247873$1540813991$gmane$org@mail.gmail.com>
References: <20181026153125.24738-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9xkx=nj=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gH67p-0000fk-ID
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 11:54:29 +0000
Received: by mail-oi1-x244.google.com with SMTP id i10-v6so6754754oik.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?
List-Id: xen-devel@lists.xenproject.org

T24gMjYgT2N0b2JlciAyMDE4IGF0IDE2OjMxLCBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZp
ZXIuZXU+IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODA4ZWJk
NjZlNDY3Zjc3YzBkMWY4YzYzNDYyMzVmODFlOWM5OWNmMjoKPgo+ICAgTWVyZ2UgcmVtb3RlLXRy
YWNraW5nIGJyYW5jaCAncmVtb3Rlcy9yaXNjdi90YWdzL3Jpc2N2LWZvci1tYXN0ZXItMy4xLXNm
MCcgaW50byBzdGFnaW5nICgyMDE4LTEwLTI1IDE3OjQxOjAzICswMTAwKQo+Cj4gYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2dpdGh1Yi5jb20vdml2
aWVyL3FlbXUuZ2l0IHRhZ3MvdHJpdmlhbC1wYXRjaGVzLXB1bGwtcmVxdWVzdAo+Cj4gZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDRiMDNkYTZlODdjMzQ3OTMxMzdhMjMxYjU1ODIzMWZk
NDA2YzA1ZTg6Cj4KPiAgIHBwYzogbW92ZSBhdDI0YyB0byBpdHMgb3duIENPTkZJR18gc3ltYm9s
ICgyMDE4LTEwLTI2IDE3OjE3OjMyICswMjAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFFFTVUgdHJpdmlhbCBw
YXRjaGVzIGNvbGxlY3RlZCBiZXR3ZWVuIEp1bmUgYW5kIE9jdG9iZXIgMjAxOAo+IChUaGFuayB5
b3UgdG8gVGhvbWFzIEh1dGgpCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpIaTsgSSBnZXQgYSBjb21waWxlIGVycm9y
IGR1ZSB0byBhIGZvcm1hdCBzdHJpbmcgaXNzdWU6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20KL2hv
bWUvcGV0bWF5MDEvcWVtdS1mb3ItbWVyZ2VzL2h3L25ldC9taWxreW1pc3QtbWluaW1hYzIuYzoz
MzowOgovaG9tZS9wZXRtYXkwMS9xZW11LWZvci1tZXJnZXMvaHcvbmV0L21pbGt5bWlzdC1taW5p
bWFjMi5jOiBJbgpmdW5jdGlvbiAnbWluaW1hYzJfd3JpdGUnOgovaG9tZS9wZXRtYXkwMS9xZW11
LWZvci1tZXJnZXMvaHcvbmV0L21pbGt5bWlzdC1taW5pbWFjMi5jOjQyMDoyMzoKZXJyb3I6IGZv
cm1hdCAnJWx4JyBleHBlY3RzCiBhcmd1bWVudCBvZiB0eXBlICdsb25nIHVuc2lnbmVkIGludCcs
IGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlCid1aW50NjRfdCB7YWthIGxvbmcgbG9uZyB1bnNpZ24K
ZWQgaW50fScgWy1XZXJyb3I9Zm9ybWF0PV0KICAgICAgICAgICAgICAgICAgICAgICAibWlsa3lt
aXN0X21pbmltYWMyX3dyJWQ6IDB4JSIgSFdBRERSX1BSSXggIiA9IDB4JWx4XG4iLAogICAgICAg
ICAgICAgICAgICAgICAgIF4KL2hvbWUvcGV0bWF5MDEvcWVtdS1mb3ItbWVyZ2VzL2luY2x1ZGUv
cWVtdS9sb2cuaDo4NToyMjogbm90ZTogaW4KZGVmaW5pdGlvbiBvZiBtYWNybyAncWVtdV9sbwpn
X21hc2snCiAgICAgICAgICAgICBxZW11X2xvZyhGTVQsICMjIF9fVkFfQVJHU19fKTsgICAgICAg
ICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgIF4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcg
dHJlYXRlZCBhcyBlcnJvcnMKCihhZmZlY3RzIHdpbmRvd3MgY3Jvc3NidWlsZHMsIE9TWCBhbmQg
MzItYml0IGhvc3RzKS4KCnRoYW5rcwotLSBQTU0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
