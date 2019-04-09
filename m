From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH v2 2/3] xen/arm: Add MESON UART driver for
 Amlogic Meson SoCs
Date: Tue, 9 Apr 2019 15:39:02 +0530
Message-ID: <CABHD4K8R7wyA=yGdfdVvsb21Ewyb3buAbhTCsJVuFuLNvGqV6A@mail.gmail.com>
References: <1553163935-12862-1-git-send-email-amittomer25@gmail.com>
 <1553163935-12862-2-git-send-email-amittomer25@gmail.com>
 <5f956c43-6885-3553-2f37-bb9ce48e981b@arm.com>
 <cd327f36-09db-f322-4675-30140839e159@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4LGk=SL=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hDngp-0000lE-KO
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:09:15 +0000
Received: by mail-ot1-x344.google.com with SMTP id o74so15011116ota.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 03:09:14 -0700 (PDT)
In-Reply-To: <cd327f36-09db-f322-4675-30140839e159@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpPbiBUdWUsIEFwciA5LCAyMDE5IGF0IDM6MDkgUE0gSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDAyLzA0LzIwMTkgMjE6MDEs
IEFuZHLDqSBQcnp5d2FyYSB3cm90ZToKPiA+IE9uIDIxLzAzLzIwMTkgMTA6MjUsIEFtaXQgU2lu
Z2ggVG9tYXIgd3JvdGU6Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIGRyaXZlciBmb3IgVUFSVCBjb250
cm9sbGVyIHByZXNlbnQgb24gQW1sb2dpYyBNZXNvbgo+ID4+IFNvQ3MgYW5kIGl0IGhhcyBiZWVu
IHRlc3RlZCBvbiBOYW5vcGkgSzIgYm9hcmQgYmFzZWQgb24gUzkwNSBTb0MuCj4gPj4KPiA+PiBD
b250cm9sbGVyIHJlZ2lzdGVycyBkZWZpbmF0aW9uIGlzIHRha2VuIGZyb20gTGludXggNC4yMC4K
PiA+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92NC4yMC1yYzEvZHJp
dmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQW1p
dCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+ID4KPiA+IFRoYW5rcyBmb3Ig
dGhlIGNoYW5nZXMhCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5w
cnp5d2FyYUBhcm0uY29tPgo+Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpUaGFua3MuCgo+IEkgaGF2ZSBjb21taXR0ZWQgdGhpcyBwYXRjaCBhbmQgdGhl
IGZvbGxvd2luZyBwYXRjaC4gUGxlYXNlIHJlc2VuZCB0aGUgZmlyc3QKPiBwYXRjaCB3aXRoIHRo
ZSBjb21tZW50cyBhZGRyZXNzZWQuCgpJcyBpdCB0aGUgcGF0Y2ggd2l0aCBmb2xsb3dpbmcgc3Vi
amVjdDoKW1BBVENIIHYyIDEvM10geGVuL2FybTogQWRkIEFtbG9naWMgTWVzb24gU29DcyBlYXJs
eXByaW50ayBzdXBwb3J0CgpSZWFsbHksIGNvdWxkbid0IGZpbmQgYW55IGNvbW1lbnRzIG92ZXIg
dGhlcmUuCgotQW1pdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
