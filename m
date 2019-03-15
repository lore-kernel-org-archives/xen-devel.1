From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen-mapcache: use MAP_FIXED flag so the
 mmap address hint is always honored
Date: Fri, 15 Mar 2019 18:27:12 +0000
Message-ID: <20190315182712.GG11621@perard.uk.xensource.com>
References: <20190315085847.31245-1-roger.pau@citrix.com>
 <265b363ebfa34e05af481b2540cb9aeb@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bsd1=RS=citrix.com=prvs=970908fcc=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h4rY7-0002Ac-Bu
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 18:27:19 +0000
Content-Disposition: inline
In-Reply-To: <265b363ebfa34e05af481b2540cb9aeb@AMSPEX02CL02.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>, Roger Pau Monne <roger.pau@citrix.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6NTQ6NDJBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEFGQUlDVCB4ZW5fcmVtYXBfYnVja2V0KCkgaXMgYWx3YXlzIGNhbGxlZCB3aXRoIGEg
TlVMTCB2YWRkciBhcmd1bWVudAo+IGlmIGVudHJ5LT52YWRkcl9iYXNlID09IE5VTEwsIGFuZCBj
YWxsZWQgd2l0aCB2YWRkciA9PQo+IGVudHJ5LT52YWRkcl9iYXNlIGluIHRoZSBvdGhlciBjYXNl
LCBzbyBJJ2Qgc2F5IHRoZSB2YWRkciBhcmd1bWVudCBpcwo+IHN1cGVyZmx1b3VzLgoKSSBkb24n
dCB0aGluayB0aGF0J3MgdHJ1ZS4gVGhlIGNhbGwgYXQgbGluZSAzMTIgWzFdIG1heSBiZSBjYWxs
ZWQgd2l0aAp2YWRkcl9iYXNlICE9IE5VTEwuIFRoZW4sIHhlbl9yZW1hcF9idWNrZXQgd2lsbCB1
bm1hcCB0aGF0IGVudHJ5IGJlZm9yZQpyZXBsYWNpbmcgaXQuCgpXZSBjb3VsZCBtYXliZSBmaWd1
cmUgb3V0IGlmIHZhZGRyX2Jhc2UgbmVlZHMgdG8gYmUgcmVwbGFjZWQgaW4tcGxhY2UKYmFzZWQg
b24gdGhlIGZsYWdzIFhFTl9NQVBDQUNIRV9FTlRSWV9EVU1NWSwgYnV0IHRoYXQgc2VlbXMgbW9y
ZQpjb252b2x1dGVkIHRoYW4gdGhlIGN1cnJlbnQgYXBwcm9jaGUuCgpbMV0gaHR0cHM6Ly9naXQu
cWVtdS5vcmcvP3A9cWVtdS5naXQ7YT1ibG9iO2Y9aHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmM7
aD0zNDlmNzJkMDBjYzJjOWZjMTM0ZGY4Y2ZmN2RkMDUxYjFmYzJmYTQxO2hiPUhFQUQjbDMxMgoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
