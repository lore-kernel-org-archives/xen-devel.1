From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a
 few
Date: Fri, 14 Dec 2018 14:02:04 +0000
Message-ID: <87imzw1a1v.fsf__18487.6099614941$1544801280$gmane$org@linaro.org>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tMr+=OX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1gXo2a-0006rQ-Qe
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 14:02:08 +0000
Received: by mail-wm1-x344.google.com with SMTP id f81so5872160wmd.4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Dec 2018 06:02:07 -0800 (PST)
In-reply-to: <20181213223737.11793-3-pbonzini@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fam Zheng <famz@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:bochs" <qemu-block@nongnu.org>, Stefan Markovic <smarkovic@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>, =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@>
List-Id: xen-devel@lists.xenproject.org

ClBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gTW9zdCBmaWxl
cyB0aGF0IGhhdmUgVEFCcyBvbmx5IGNvbnRhaW4gYSBoYW5kZnVsIG9mIHRoZW0uICBDaGFuZ2UK
PiB0aGVtIHRvIHNwYWNlcyBzbyB0aGF0IHdlIGRvbid0IGNvbmZ1c2UgcGVvcGxlLgo+Cj4gZGlz
YXMsIHN0YW5kYXJkLWhlYWRlcnMsIGxpbnV4LWhlYWRlcnMgYW5kIGxpYmRlY251bWJlciBhcmUg
aW1wb3J0ZWQKPiBmcm9tIG90aGVyIHByb2plY3RzIGFuZCBwcm9iYWJseSBzaG91bGQgYmUgZXhl
bXB0ZWQgZnJvbSB0aGUgY2hlY2suCj4gT3V0c2lkZSB0aG9zZSwgYWZ0ZXIgdGhpcyBwYXRjaCB0
aGUgZm9sbG93aW5nIGZpbGVzIHN0aWxsIGNvbnRhaW4gYm90aAo+IDgtc3BhY2UgYW5kIFRBQiBz
ZXF1ZW5jZXMgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbGluZS4gIE1hbnkgb2YgdGhlbQo+IGhh
dmUgYSBtYWpvcml0eSBvZiBUQUJzLCBvciB3ZXJlIGluaXRpYWxseSBjb21taXR0ZWQgd2l0aCBh
bGwgdGFicy4KPgoKRm9yIHRoZSBmb2xsb3dpbmc6Cgo8c25pcD4KPiAgICAgdGVzdHMvdGNnL2Ny
aXMvY2hlY2tfYWRkby5jCj4gICAgIHRlc3RzL3RjZy9jcmlzL2NoZWNrX21vdmVxLmMKPiAgICAg
dGVzdHMvdGNnL2NyaXMvY2hlY2tfc3dhcC5jCj4gICAgIHRlc3RzL3RjZy9tdWx0aWFyY2gvdGVz
dC1tbWFwLmMKCj4gICAgIHRlc3RzL3RjZy9jcmlzL2NoZWNrX2Ficy5jCj4gICAgIHRlc3RzL3Rj
Zy9jcmlzL2NoZWNrX2FkZGMuYwo+ICAgICB0ZXN0cy90Y2cvY3Jpcy9jaGVja19hZGRjbS5jCj4g
ICAgIHRlc3RzL3RjZy9jcmlzL2NoZWNrX2FkZG9xLmMKPiAgICAgdGVzdHMvdGNnL2NyaXMvY2hl
Y2tfYm91bmQuYwo+ICAgICB0ZXN0cy90Y2cvY3Jpcy9jaGVja19mdGFnLmMKPiAgICAgdGVzdHMv
dGNnL2NyaXMvY2hlY2tfaW50NjQuYwo+ICAgICB0ZXN0cy90Y2cvY3Jpcy9jaGVja19sei5jCj4g
ICAgIHRlc3RzL3RjZy9jcmlzL2NoZWNrX29wZW5wZjUuYwo+ICAgICB0ZXN0cy90Y2cvY3Jpcy9j
aGVja19zaWdhbHJtLmMKPiAgICAgdGVzdHMvdGNnL2NyaXMvY3Jpc3V0aWxzLmgKPiAgICAgdGVz
dHMvdGNnL2NyaXMvc3lzLmMKPiAgICAgdGVzdHMvdGNnL2kzODYvdGVzdC1pMzg2LXNzc2UzLmMK
PHNuaXA+CgpSZXZpZXdlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
PgoKCi0tCkFsZXggQmVubsOpZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
