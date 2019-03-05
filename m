From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] [v2] xen: avoid link error on ARM
Date: Tue, 5 Mar 2019 17:56:57 +0100
Message-ID: <97b4025c-8744-2b29-ef5d-bee09f2f39f0__44206.9356374972$1551805080$gmane$org@suse.com>
References: <20190305133057.3998926-1-arnd@arndb.de>
 <35654e1a-d066-0581-749f-7e3b65023988@oracle.com>
 <9a285a75-b9ea-37a9-b5bd-ba2a068dd944@suse.com>
 <CAK8P3a03_v849mauL5SvX=5n1DGnaii9XeGJJF7Z1rO+n2H+xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1DNJ-0001cn-IK
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 16:57:05 +0000
In-Reply-To: <CAK8P3a03_v849mauL5SvX=5n1DGnaii9XeGJJF7Z1rO+n2H+xg@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNzo0OSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBUdWUsIE1hciA1
LCAyMDE5IGF0IDM6NTcgUE0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
Pj4gT24gMDUvMDMvMjAxOSAxNDo0MywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gMy81
LzE5IDg6MzAgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gCj4+Pj4gQEAgLTgwOSwxNSArNzg5
LDcgQEAgc3RhdGljIGxvbmcgcHJpdmNtZF9pb2N0bF9tbWFwX3Jlc291cmNlKHN0cnVjdCBmaWxl
ICpmaWxlLCB2b2lkIF9fdXNlciAqdWRhdGEpCj4+Pj4gICAgICAgICAgICAgIGdvdG8gb3V0Owo+
Pj4+Cj4+Pj4gICAgICBpZiAoeGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5
c21hcCkpIHsKPj4+PiAtICAgICAgICAgICAgc3RydWN0IHJlbWFwX3BmbiByID0gewo+Pj4+IC0g
ICAgICAgICAgICAgICAgICAgIC5tbSA9IHZtYS0+dm1fbW0sCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgLnBhZ2VzID0gdm1hLT52bV9wcml2YXRlX2RhdGEsCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgLnByb3QgPSB2bWEtPnZtX3BhZ2VfcHJvdCwKPj4+PiAtICAgICAgICAgICAgfTsKPj4+
PiAtCj4+Pj4gLSAgICAgICAgICAgIHJjID0gYXBwbHlfdG9fcGFnZV9yYW5nZShyLm1tLCBrZGF0
YS5hZGRyLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2RhdGEu
bnVtIDw8IFBBR0VfU0hJRlQsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZW1hcF9wZm5fZm4sICZyKTsKPj4+PiArICAgICAgICAgICAgcmMgPSB4ZW5fcmVtYXBf
dm1hX3JhbmdlKHZtYSwga2RhdGEuYWRkciwga2RhdGEubnVtIDw8IFBBR0VfU0hJRlQpOwo+Pj4K
Pj4+IEkgd29uZGVyIHdoZXRoZXIgZHJpdmVycy94ZW4veGxhdGVfbW11LmMgbWlnaHQgYmUgYSBn
b29kIHBsYWNlIGZvciB0aGVzZQo+Pj4gcm91dGluZXMuCj4+Cj4+IEhtbSwgcHJvYmFibHkuIFRo
aXMgd291bGQgcmVxdWlyZSBhIHN0dWIgaW4gdGhlIGhlYWRlciB0byBhdm9pZAo+PiBwcm9ibGVt
cyBpbiBjYXNlIG9mIENPTkZJR19YRU5fQVVUT19YTEFURSBub3QgZGVmaW5lZCwgdGhvdWdoCj4+
ICh0aGUgI2lmZGVmIGlzIGFscmVhZHkgdGhlcmUpLgo+Pgo+PiBJIHRoaW5rIHRoaXMgaXMgdGhl
IGNsZWFuZXN0IHNvbHV0aW9uLgo+IAo+IFB1dHRpbmcgaXQgaW50byB4bGF0ZV9tbXUuYyB3YXMg
bXkgZmlyc3QgYXR0ZW1wdCwgYnV0IEkgd2FzIG5vdCBzdXJlIGhvdyB0bwo+IHNvbHZlIHRoZSBk
ZXBlbmRlbmN5IG9uIENPTkZJR19YRU5fQVVUT19YTEFURS4gU28KPiB4ZW5fZmVhdHVyZShYRU5G
RUFUX2F1dG9fdHJhbnNsYXRlZF9waHlzbWFwKSkgd291bGQgYmUgZ3VhcmFudGVlZAo+IHRvIHJl
dHVybiBmYWxzZSBpZiBDT05GSUdfWEVOX0FVVE9fWExBVEUgaXMgZGlzYWJsZWQ/CgpZZXMuCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
