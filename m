From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Fri, 16 Nov 2018 11:05:44 +0200
Message-ID: <CAC1Wxdg7DPtoHszfQWsJy+vMCTM8Lpm1m7x-XKq_2BWQ9NPqHQ@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
 <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
 <CAC1Wxdhy1Dnh3_rLFSX0Uj8e4+BLsfWqCQc__U8+bSwd+pCSHg@mail.gmail.com>
 <f9d4248e-485d-e3a8-88bd-6fab6cabe313@arm.com>
 <CAC1Wxdib6qQk=iH9ODr9XuJo39bvY+4RJUXFHsurW77AqekHDg@mail.gmail.com>
 <0ce5b01c-eb4b-348d-6311-271ba1ca7947@arm.com>
 <alpine.DEB.2.10.1811151031440.22115@sstabellini-ThinkPad-X260>
 <f04158f5-42e4-ec97-aa53-d316da61f911@arm.com>
 <alpine.DEB.2.10.1811151143500.22115@sstabellini-ThinkPad-X260>
 <6d853e3b-1a5e-abc8-9b8a-3c40b080b0b4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oba2=n3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNa4b-00022u-P8
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 09:05:57 +0000
Received: by mail-oi1-x242.google.com with SMTP id y23so9974870oia.4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Nov 2018 01:05:56 -0800 (PST)
In-Reply-To: <6d853e3b-1a5e-abc8-9b8a-3c40b080b0b4@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>, lars.kurth@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoK0YfRgiwgMTUg0LvQuNGB0YIuIDIwMTgg0L4gMjI6MjAgSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g0L/QuNGI0LU6Cgo+IFdlbGwgdGhlIGNvZGUgc3Vn
Z2VzdGVkIGlzIGRpZmZlcmVudCBmcm9tIHdoYXQgSSBpbnRlbmRlZCA6KS4gdCBzaG91bGQKPiBi
ZSBzZXQgdG8gaW52YWxpZCBiZWZvcmUgdGhlIGNoZWNrIG1mbl92YWxpZC9nZXRfcGFnZS4gU28g
dGhpcyBuZWVkcyBhdAo+IGxlYXN0IDIgY2hlY2tzLiAyIHBsYWNlcyB3ZXJlIHQgIT0gTlVMTCBu
ZWVkcyB0byBiZSBleHBsYWluZWQuCgpXZWxsLCBJIGd1ZXNzIGNoZWNraW5nIGEgcG9pbnRlciBp
biBvcmRlciB0byBhdm9pZCBudWxsIHBvaW50ZXIKZGVyZWZlcmVuY2UgaXMgcHJldHR5IHNlbGYt
ZXhwbGFpbmluZy4gRXZlbiBpZiBpdCBpcyBkb25lIHR3aWNlLgpBbmQgdGhlIGNvZGUgaXRzZWxm
IHdvdWxkIGdpdmUgYSBjbGVhciBpZGVhIHRoYXQgd2UgZG8gY2FsY3VsYXRlIChhbmQKYXNzaWdu
KSB0eXBlIHZhbHVlIG9ubHkgaW4gY2FzZSBhIGNhbGxlciBwcm92aWRlZCB1cyBhIHZhbGlkIHBv
aW50ZXIuCgpGb3Igc3VyZSwgSSBkbyBub3QgaW5zaXN0IG9uIGEgdGVybmFyeSBvcGVyYXRvciB1
c2FnZS4KClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
