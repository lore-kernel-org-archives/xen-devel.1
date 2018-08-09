From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v1 4/4] xen/arm: Reuse R-Car Gen2 platform
 code for Stout board
Date: Thu, 9 Aug 2018 21:18:25 +0300
Message-ID: <CAPD2p-nc1j72j1AkKFNQCoH0kHE_6fuZys9ECT7_iJ0O16xNxQ@mail.gmail.com>
References: <1533580552-938-1-git-send-email-olekstysh@gmail.com>
 <1533580552-938-5-git-send-email-olekstysh@gmail.com>
 <fd405643-3ae8-de5d-ed4f-7acd6e3b70b3@arm.com>
 <CAPD2p-m_K4CQzWbVuFp0FWh=kFjrHkLpwZagx0+UO4n0kV-egw@mail.gmail.com>
 <adfc68b1-f061-5c70-9083-3ef7d51d6457@arm.com>
 <CAPD2p-=pJmEqRzShLzudpLh2Ymd0KuDMBgyKfM+gSRyPcR2apA@mail.gmail.com>
 <ac28cd7b-71c4-b1c5-5b2c-7fe0aaf93b54@arm.com>
 <CAPD2p-kwLaF_wMtPSyMT8iYRFHf=dLELBbc0cZbenH1v89BrEA@mail.gmail.com>
 <dc8d828c-eef0-7c30-6766-865d80e465e8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cdvs=ky=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1fnpW1-0000IT-44
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 18:18:29 +0000
Received: by mail-io0-x244.google.com with SMTP id q4-v6so5534114iob.8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Aug 2018 11:18:27 -0700 (PDT)
In-Reply-To: <dc8d828c-eef0-7c30-6766-865d80e465e8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLgoKT24gVGh1LCBBdWcgOSwgMjAxOCBhdCA3OjIwIFBNLCBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPgo+Cj4gT24gMDgvMDkvMjAxOCAwNToxOCBQ
TSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgQXVnIDksIDIwMTgg
YXQgNzoxMCBQTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4gU29tZWhvdyBJIHRob3VnaHQgdGhlIHBsYXRmb3JtIHdhcyA2NC1iaXQgYW5kIGZvdW5k
IGEgU09DIG5hbWUgdmVyeQo+Pj4gc2ltaWxhcgo+Pj4gdG8gaXQuIFNvcnJ5IGZvciB0aGUgY29u
ZnVzaW9uLiBQU0NJIHNlZW1zIGluZGVlZCBub3Qgc3VwcG9ydGVkIGZvciB0aGF0Cj4+PiBwbGF0
Zm9ybS4KPj4KPj4gUi1DYXIgR2VuMyBpcyBBUk02NCAoSDIgU29DIC0+IHI4YTc3OTApIGFuZCBk
b2VzIHN1cHBvcnQgUFNDSS4KPj4gQnV0IFItQ2FyIEdlbjIgaXMgQVJNMzIgKEgyIFNvQyAtPiBy
OGE3NzkwKQo+Pgo+Pj4KPj4+IEhvd2V2ZXIsIHRoZSBjb2RlIGxvb2tzIGZhaXJseSBkaWZmZXJl
bnQgdGhhbiB3aGF0IHdlIGhhdmUgaW4gWGVuLiBGb3IKPj4+IGluc3RhbmNlIHNlY29uZGFyeSBD
UFUgc2VlbXMgdG8gcmVxdWlyZSB0byBpbml0aWFsaXplIENOVFZPRkYsIHRoZQo+Pj4gZnVuY3Rp
b24KPj4+IHRvIHBvd2VyIG9uIGEgQ1BVIGFsc28gbG9va3MgZGlmZmVyZW50Lgo+Pgo+PiBTb3Jy
eSwgd2hpY2ggY29kZSB5b3UgYXJlIHRha2luZyBhYm91dCwgVS1Cb290IG9yIExpbnV4Pwo+Cj4K
PiBUaGUgU01QIGNvZGUgaW4gTGludXggdnMgdGhlIFNNUCBjb2RlIGluIFhlbiBmb3IgdGhlIFIt
Q2FyLiBJbiBtb3N0IG9mIHRoZQo+IGNhc2VzLCBYZW4gc2hvdWxkIHJlcGxpY2F0ZSB3aGF0IExp
bnV4IGRvZXMuCj4KPiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoeSBzdWNoIGRpZmZlcmVu
Y2VzIGF0IHRoZSBtb21lbnQuCgpBcyBJIHVuZGVyc3RhbmQsIHRoZSBTTVAgY29kZSBmb3IgTGlu
dXggY2FuJ3QgYmUgdXNlZCBpbiBYZW4sIHNpbmNlCnRoZSByZXF1aXJlbWVudCBpcyB0byBib290
IGludG8gWGVuIHdpdGggY29yZXMgYWxyZWFkeSBiZWluZyBpbgpIeXBlcnZpc29yIG1vZGUuCkJ1
dCwgYWxsIGNvcmVzIHNlZW1zIHRvIHN0YXJ0IGluIE1vbml0b3IgbW9kZSBhZnRlciBwb3dlcmlu
ZyB0aGVtIHVwLgpTbywgdGhleSBtdXN0IGJlIHN3aXRjaGVkIGludG8gSHlwZXJ2aXNvciBtb2Rl
IGJlZm9yZWhhbmQsIGNvcnJlY3Q/CgpVLUJvb3QgYnJpbmdzIG5vbi1ib290IGNvcmVzIHVwICh1
c2luZyBwb3J0ZWQgZnJvbSBMaW51eCdzCnBsYXRzbXAtYXBtdSBjb2RlIGZ1bmN0aW9ucykuIFRo
ZW4gVS1Cb290IHN3aXRjaGVzIGFsbCBjb3JlcyB0byBIWVAKbW9kZS4KV2hpbGUganVtcCBpbnRv
IFhlbiBvbiBhIGJvb3QgY29yZSwgYWxsIG5vbi1ib290IGNvcmVzIGFyZSBsZWZ0IGluClUtQm9v
dCB0byB3YWl0IHRvIGJlICJ3b2tlbiB1cCBieSBYZW4iIChhY3R1YWxseSByY2FyMl9zbXBfaW5p
dCgpIGlzCnVzZWQgZm9yKS4KUGxhdGZvcm0gUi1DYXIyIGNvZGUgaW4gWGVuIGRvZXNuJ3QgcG93
ZXIgb24gY29yZXMsIGl0IGp1c3QgImJyaW5ncwp0aGVtIHRvIFhlbiIuCgpQbGVhc2UgY29ycmVj
dCBtZSBpZiBJIGFtIHdyb25nLgoKQWxzbywgVS1Cb290IHNlZW1zIHRvIHJlc2V0IHRvIHplcm8g
Q05UVk9GRiBvbiBhbGwgY29yZXMgYmVmb3JlCmxlYXZpbmcgTW9uaXRvciBtb2RlLgoKPgo+IENo
ZWVycywKPgo+IC0tCj4gSnVsaWVuIEdyYWxsCgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5
c2hjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
