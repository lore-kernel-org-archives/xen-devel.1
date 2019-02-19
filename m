From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V2 1/3] xen/arm: drivers: scif: Add support
 for SCIFA compatible UARTs
Date: Tue, 19 Feb 2019 10:00:56 +0000
Message-ID: <16bbe61b-753f-593d-a5d8-1b6662be9a8a@arm.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-2-git-send-email-olekstysh@gmail.com>
 <d4ba8e5f-00c9-0773-15b3-4a5b4efcc3e6@arm.com>
 <bab8f746-b69e-35ae-a5ab-00dfd53bb737@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=azty=Q2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gw2mw-0002ji-2i
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 10:38:10 +0000
In-Reply-To: <bab8f746-b69e-35ae-a5ab-00dfd53bb737@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMi8xOC8xOSA4OjE0IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4g
T24gMTguMDIuMTkgMTY6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4gCj4gSGkKPiAK
PiAKPj4KPj4gT24gMDEvMDIvMjAxOSAxMjozNywgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6
Cj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBh
bS5jb20+Cj4+Pgo+Pj4gRXh0ZW5kIGV4aXN0aW5nIGRyaXZlciB0byBiZSBhYmxlIHRvIGhhbmRs
ZSBTQ0lGQSBpbnRlcmZhY2UgYXMgd2VsbC4KPj4KPj4gSW4gZ2VuZXJhbCBhIHBhdGNoIHNob3Vs
ZCBkbyBvbmx5IG9uZSB0aGluZy4gSW4gdGhpcyBjYXNlLCB0aGlzIHNob3VsZCAKPj4gaGF2ZSBi
ZWVuIHNwbGl0IGluIDIgcGF0Y2hlczogb25lIHRvIGV4dGVuZCB0aGUgZHJpdmVyLCB0aGUgc2Vj
b25kIHRvIAo+PiBhZGQgc3VwcG9ydCBmb3IgU0NJRkEuCj4+Cj4+IFBsZWFzZSBzcGxpdCB0aGUg
cGF0Y2ggYWNjb3JkaW5nbHkuCj4gCj4gCj4gTm90IGVudGlyZWx5IGNsZWFyIHRvIG1lIGhvdyB0
aGUgY3VycmVudCBwYXRjaCBzaG91bGQgYmUgc3BsaXQuLi4KPiAKPiAtIFRoZSBmaXJzdCBwYXRj
aCB3aWxsIGJlIGp1c3QgYSBjb3B5IG9mIHRoZSBjdXJyZW50IHBhdGNoLCBidXQgd2l0aG91dCAK
PiBuZXcgY29tcGF0aWJsZSBzdHJpbmcgKFNDSUZBKS4KCldpdGhvdXQgYW55dGhpbmcgcmVsYXRl
ZCB0byBTQ0lGQS4gVGhpcyBwYXRjaCB3b3VsZCBvbmx5IGNvbnRhaW4gdGhlIApyZXdvcmsgb2Yg
dGhlIGNvZGUuCgo+IAo+IC0gVGhlIHNlY29uZCBwYXRjaCB3aWxsIGFkZCBuZXcgY29tcGF0aWJs
ZSBzdHJpbmcuCgorIGFueXRoaW5nIHJlbGF0ZWQgdG8gU0NJRkEgKE1hY3JvcyBhbmQgdGhlIFND
SUZBIGVsZW1lbnQgaW4gdGhlIGFycmF5IApwb3J0X3BhcmFtcy4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
