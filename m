From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 0/1] cameraif: add ABI for para-virtual
 camera
Date: Tue, 12 Mar 2019 03:23:30 -0600
Message-ID: <5C877A92020000780021D8F7@prv1-mh.provo.novell.com>
References: <20190312082000.32181-1-andr2000@gmail.com>
 <6803b7e8-4743-15b6-474e-ec7093e9960a@suse.com>
 <5C8776B8020000780021D8B5@prv1-mh.provo.novell.com>
 <13bd71e4-780d-3912-fbf2-553b04147cab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rfzp=RP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3ddH-0005s8-8Z
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 09:23:35 +0000
In-Reply-To: <13bd71e4-780d-3912-fbf2-553b04147cab@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, oleksandr_andrushchenko@epam.com, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE5IGF0IDEwOjEzLCA8YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToKPiBP
biAzLzEyLzE5IDExOjA3IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTIuMDMuMTkg
YXQgMDk6NDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMTIvMDMvMjAxOSAwOTox
OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+Pj4gRnJvbTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+Cj4+Pj4g
SGVsbG8hCj4+Pj4KPj4+PiBBdCB0aGUgbW9tZW50IFhlbiBbMV0gYWxyZWFkeSBzdXBwb3J0cyBz
b21lIHZpcnR1YWwgbXVsdGltZWRpYQo+Pj4+IGZlYXR1cmVzIFsyXSBzdWNoIGFzIHZpcnR1YWwg
ZGlzcGxheSwgc291bmQuIEl0IHN1cHBvcnRzIGtleWJvYXJkcywKPj4+PiBwb2ludGVycyBhbmQg
bXVsdGktdG91Y2ggZGV2aWNlcyBhbGwgYWxsb3dpbmcgWGVuIHRvIGJlIHVzZWQgaW4KPj4+PiBh
dXRvbW90aXZlIGFwcGxpYW5jZXMsIEluLVZlaGljbGUgSW5mb3RhaW5tZW50IChJVkkpIHN5c3Rl
bXMKPj4+PiBhbmQgbWFueSBtb3JlLgo+Pj4+Cj4+Pj4gRnJvbnRlbmQgaW1wbGVtZW50YXRpb24g
aXMgYXZhaWxhYmxlIGF0IFszXSBhbmQgdGhlIGNvcnJlc3BvbmRpbmcKPj4+PiBiYWNrZW5kIGF0
IFs0XS4gVGhlc2UgYXJlIHdvcmsgaW4gcHJvZ3Jlc3MsIGJ1dCBmcm9udGVuZCBhbHJlYWR5Cj4+
Pj4gcGFzc2VzIHY0bDItY29tcGxpYW5jZSB0ZXN0IGZvciBWNEwyIGRyaXZlcnMuIGxpYnhsIHBy
ZWxpbWluYXJ5Cj4+Pj4gY2hhbmdlcyBhcmUgYXZhaWxhYmxlIGF0IFs1XS4KPj4+Pgo+Pj4+IFRo
aXMgd29yayBhZGRzIGEgbmV3IFhlbiBwYXJhLXZpcnR1YWxpemVkIHByb3RvY29sIGZvciBhIHZp
cnR1YWwKPj4+PiBjYW1lcmEgZGV2aWNlIHdoaWNoIGV4dGVuZHMgbXVsdGltZWRpYSBjYXBhYmls
aXRpZXMgb2YgWGVuIGV2ZW4KPj4+PiBmYXJ0aGVyOiB2aWRlbyBjb25mZXJlbmNpbmcsIElWSSwg
aGlnaCBkZWZpbml0aW9uIG1hcHMgZXRjLgo+Pj4+Cj4+Pj4gVGhlIGluaXRpYWwgZ29hbCBpcyB0
byBzdXBwb3J0IG1vc3QgbmVlZGVkIGZ1bmN0aW9uYWxpdHkgd2l0aCB0aGUKPj4+PiBmaW5hbCBp
ZGVhIHRvIG1ha2UgaXQgcG9zc2libGUgdG8gZXh0ZW5kIHRoZSBwcm90b2NvbCBpZiBuZWVkIGJl
Ogo+Pj4+Cj4+Pj4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFzZSB2aXJ0dWFsIGRldmljZSBjb25m
aWd1cmF0aW9uOgo+Pj4+ICAgLSBwaXhlbCBmb3JtYXRzCj4+Pj4gICAtIHJlc29sdXRpb25zCj4+
Pj4gICAtIGZyYW1lIHJhdGVzCj4+Pj4gMi4gU3VwcG9ydCBiYXNpYyBjYW1lcmEgY29udHJvbHM6
Cj4+Pj4gICAtIGNvbnRyYXN0Cj4+Pj4gICAtIGJyaWdodG5lc3MKPj4+PiAgIC0gaHVlCj4+Pj4g
ICAtIHNhdHVyYXRpb24KPj4+PiAzLiBTdXBwb3J0IHN0cmVhbWluZyBjb250cm9sCj4+PiBTbyBz
aW5jZSB0aGUgZmlyc3QgcG9zdCBpbiBKdWx5IDIwMTggdGhlcmUgaGFzIGJlZW4gbm8gcmVhY3Rp
b24gZnJvbQo+Pj4gS29ucmFkIHRvIHRoaXMgaW50ZXJmYWNlLiBJIGd1ZXNzIGhlIGhhcyBwbGVu
dHkgb2Ygb3RoZXIgdGhpbmdzIHRvIGRvLgo+PiBIYXZpbmcgZ29uZSB0aHJvdWdoIGFsbCB0aGUg
dmVyc2lvbnMnIHRocmVhZHMgKGp1c3QgdGhlaXIgdGl0bGVzKQo+IEhtLCBkbyB5b3UgdXN1YWxs
eSBwaW5nIGJ5IGNoYW5naW5nIHRoZSB0aXRsZSBzbyBpdCBoYXMgInBpbmciIHdvcmQgaW4gCj4g
aXQ/IDspCgpZZXMsIEkgaW5kZWVkIGRvLCBhcyBJIGV4cGVjdCB0aGlzIHRvIHJhaXNlIGF3YXJl
bmVzcyB0aGF0IGEgcGF0Y2ggaXMKYXQgYSBwb2ludCB3aGVyZSBhbGwgdGhhdCdzIG5lZWRlZCBp
cyBtYWludGFpbmVyIGZlZWRiYWNrLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
