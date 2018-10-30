From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/20] Qemu trivial for 3.1 patches
Date: Tue, 30 Oct 2018 17:31:08 +0000
Message-ID: <CAFEAcA9wOKFxRQDqaxtz5krfskGnxrDjTApE8BZxDH--0bWLew@mail.gmail.com>
References: <20181030112337.17973-1-laurent@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a6dr=nk=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gHXrW-00064Y-TL
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:31:30 +0000
Received: by mail-ot1-x342.google.com with SMTP id f24so6159383otl.5
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 10:31:29 -0700 (PDT)
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, Michael Walle <michael@walle.cc>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
List-Id: xen-devel@lists.xenproject.org

T24gMzAgT2N0b2JlciAyMDE4IGF0IDExOjIzLCBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZp
ZXIuZXU+IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODA4ZWJk
NjZlNDY3Zjc3YzBkMWY4YzYzNDYyMzVmODFlOWM5OWNmMjoKPgo+ICAgTWVyZ2UgcmVtb3RlLXRy
YWNraW5nIGJyYW5jaCAncmVtb3Rlcy9yaXNjdi90YWdzL3Jpc2N2LWZvci1tYXN0ZXItMy4xLXNm
MCcgaW50byBzdGFnaW5nICgyMDE4LTEwLTI1IDE3OjQxOjAzICswMTAwKQo+Cj4gYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2dpdGh1Yi5jb20vdml2
aWVyL3FlbXUuZ2l0IHRhZ3MvcWVtdS10cml2aWFsLWZvci0zLjEtcHVsbC1yZXF1ZXN0Cj4KPiBm
b3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gN2IyYjc5N2NmMGFkZGFjNzg5YmE4NThmZGJk
OTVjNTUxMjhkNzJkNToKPgo+ICAgbWlsa3ltaXN0LW1pbmltYWMyOiBVc2UgcWVtdV9sb2dfbWFz
ayhHVUVTVF9FUlJPUikgaW5zdGVhZCBvZiBlcnJvcl9yZXBvcnQgKDIwMTgtMTAtMzAgMDk6MTM6
MzEgKzAxMDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gUUVNVSB0cml2aWFsIHBhdGNoZXMgY29sbGVjdGVkIGJl
dHdlZW4gSnVuZSBhbmQgT2N0b2JlciAyMDE4Cj4gKFRoYW5rIHlvdSB0byBUaG9tYXMgSHV0aCkK
Pgo+IHYyOiBmaXggMzJiaXQgYnVpbGQgd2l0aCB1cGRhdGVkIHBhdGNoICh2MykgZnJvbSBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqQo+ICAgICBidWlsdCBpbiBhIDMyYml0IGRlYmlhbiBzaWQgY2hy
b290Cj4KCkFwcGxpZWQsIHRoYW5rcy4KCi0tIFBNTQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
