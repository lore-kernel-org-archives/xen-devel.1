From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v2] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 17:49:38 +0100
Message-ID: <CAK8P3a03_v849mauL5SvX=5n1DGnaii9XeGJJF7Z1rO+n2H+xg__24786.8135151052$1551804670$gmane$org@mail.gmail.com>
References: <20190305133057.3998926-1-arnd@arndb.de>
 <35654e1a-d066-0581-749f-7e3b65023988@oracle.com>
 <9a285a75-b9ea-37a9-b5bd-ba2a068dd944@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mnY=RI=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1h1DGS-0000lf-5X
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 16:50:00 +0000
Received: by mail-qt1-f194.google.com with SMTP id y4so9630015qtc.10
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2019 08:49:56 -0800 (PST)
In-Reply-To: <9a285a75-b9ea-37a9-b5bd-ba2a068dd944@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgNSwgMjAxOSBhdCAzOjU3IFBNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4gT24gMDUvMDMvMjAxOSAxNDo0MywgQm9yaXMgT3N0cm92c2t5IHdyb3Rl
Ogo+ID4gT24gMy81LzE5IDg6MzAgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cgo+ID4+IEBAIC04
MDksMTUgKzc4OSw3IEBAIHN0YXRpYyBsb25nIHByaXZjbWRfaW9jdGxfbW1hcF9yZXNvdXJjZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCBfX3VzZXIgKnVkYXRhKQo+ID4+ICAgICAgICAgICAgICBn
b3RvIG91dDsKPiA+Pgo+ID4+ICAgICAgaWYgKHhlbl9mZWF0dXJlKFhFTkZFQVRfYXV0b190cmFu
c2xhdGVkX3BoeXNtYXApKSB7Cj4gPj4gLSAgICAgICAgICAgIHN0cnVjdCByZW1hcF9wZm4gciA9
IHsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAubW0gPSB2bWEtPnZtX21tLAo+ID4+IC0gICAg
ICAgICAgICAgICAgICAgIC5wYWdlcyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhLAo+ID4+IC0gICAg
ICAgICAgICAgICAgICAgIC5wcm90ID0gdm1hLT52bV9wYWdlX3Byb3QsCj4gPj4gLSAgICAgICAg
ICAgIH07Cj4gPj4gLQo+ID4+IC0gICAgICAgICAgICByYyA9IGFwcGx5X3RvX3BhZ2VfcmFuZ2Uo
ci5tbSwga2RhdGEuYWRkciwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGtkYXRhLm51bSA8PCBQQUdFX1NISUZULAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVtYXBfcGZuX2ZuLCAmcik7Cj4gPj4gKyAgICAgICAgICAgIHJjID0g
eGVuX3JlbWFwX3ZtYV9yYW5nZSh2bWEsIGtkYXRhLmFkZHIsIGtkYXRhLm51bSA8PCBQQUdFX1NI
SUZUKTsKPiA+Cj4gPiBJIHdvbmRlciB3aGV0aGVyIGRyaXZlcnMveGVuL3hsYXRlX21tdS5jIG1p
Z2h0IGJlIGEgZ29vZCBwbGFjZSBmb3IgdGhlc2UKPiA+IHJvdXRpbmVzLgo+Cj4gSG1tLCBwcm9i
YWJseS4gVGhpcyB3b3VsZCByZXF1aXJlIGEgc3R1YiBpbiB0aGUgaGVhZGVyIHRvIGF2b2lkCj4g
cHJvYmxlbXMgaW4gY2FzZSBvZiBDT05GSUdfWEVOX0FVVE9fWExBVEUgbm90IGRlZmluZWQsIHRo
b3VnaAo+ICh0aGUgI2lmZGVmIGlzIGFscmVhZHkgdGhlcmUpLgo+Cj4gSSB0aGluayB0aGlzIGlz
IHRoZSBjbGVhbmVzdCBzb2x1dGlvbi4KClB1dHRpbmcgaXQgaW50byB4bGF0ZV9tbXUuYyB3YXMg
bXkgZmlyc3QgYXR0ZW1wdCwgYnV0IEkgd2FzIG5vdCBzdXJlIGhvdyB0bwpzb2x2ZSB0aGUgZGVw
ZW5kZW5jeSBvbiBDT05GSUdfWEVOX0FVVE9fWExBVEUuIFNvCnhlbl9mZWF0dXJlKFhFTkZFQVRf
YXV0b190cmFuc2xhdGVkX3BoeXNtYXApKSB3b3VsZCBiZSBndWFyYW50ZWVkCnRvIHJldHVybiBm
YWxzZSBpZiBDT05GSUdfWEVOX0FVVE9fWExBVEUgaXMgZGlzYWJsZWQ/CgogICAgICAgQXJuZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
