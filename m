From: Joe Jin <joe.jin@oracle.com>
Subject: Re: [PATCH UPSTREAM] xen-swiotlb: fix the check
 condition for xen_swiotlb_free_coherent
Date: Thu, 17 May 2018 12:32:37 -0700
Message-ID: <d9a6cc08-3d9e-978c-e6c3-cbcb4fb92900__6447.8874126964$1526585495$gmane$org@oracle.com>
References: <25d8a709-9f2f-fe09-f66c-2a0704ddbbb0@oracle.com>
 <20180517191003.GD504@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4h00=ie=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1fJOdn-0007Ny-Pe
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 19:32:43 +0000
In-Reply-To: <20180517191003.GD504@kroah.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: John Sobecki <john.sobecki@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, ASHISH_B_SRIVASTAVA <ashish.b.srivastava@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xNy8xOCAxMjoxMCBQTSwgR3JlZyBLSCB3cm90ZToKPiBPbiBUaHUsIE1heSAxNywgMjAx
OCBhdCAxMTo0NTo1N0FNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+PiBXaGVuIHJ1biByYWlkY29u
ZmlnIGZyb20gRG9tMCB3ZSBmb3VuZCB0aGF0IHRoZSBYZW4gRE1BIGhlYXAgaXMgcmVkdWNlZCwK
Pj4gYnV0IERvbSBIZWFwIGlzIGluY3JlYXNlZCBieSB0aGUgc2FtZSBzaXplLiBUcmFjaW5nIHJh
aWRjb25maWcgd2UgZm91bmQKPj4gdGhhdCB0aGUgcmVsYXRlZCBpb2N0bCgpIGluIG1lZ2FyYWlk
X3NhcyB3aWxsIGNhbGwgZG1hX2FsbG9jX2NvaGVyZW50KCkKPj4gdG8gYXBwbHkgbWVtb3J5LiBJ
ZiB0aGUgbWVtb3J5IGFsbG9jYXRlZCBieSBEb20wIGlzIG5vdCBpbiB0aGUgRE1BIGFyZWEsCj4+
IGl0IHdpbGwgZXhjaGFuZ2UgbWVtb3J5IHdpdGggWGVuIHRvIG1lZXQgdGhlIHJlcXVpbWVudC4g
TGF0ZXIgZHJpdmVycwo+PiBjYWxsIGRtYV9mcmVlX2NvaGVyZW50KCkgdG8gZnJlZSB0aGUgbWVt
b3J5LCBvbiB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KCkKPj4gdGhlIGNoZWNrIGNvbmRpdGlv
biAoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykgaXMgYWx3YXlzIGZhbHNlLAo+PiBp
dCBwcmV2ZW50cyBjYWxsaW5nIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkgdG8gcmV0
dXJuIHRoZSBtZW1vcnkKPj4gdG8gdGhlIFhlbiBETUEgaGVhcC4KPj4KPj4gVGhpcyBpc3N1ZSBp
bnRyb2R1Y2VkIGJ5IGNvbW1pdCA2ODEwZGY4OGRjZmMyICJ4ZW4tc3dpb3RsYjogV2hlbiBkb2lu
Zwo+PiBjb2hlcmVudCBhbGxvYy9kZWFsbG9jIGNoZWNrIGJlZm9yZSBzd2l6emxpbmcgdGhlIE1G
TnMuIi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgo+
PiBUZXN0ZWQtYnk6IEpvaG4gU29iZWNraSA8am9obi5zb2JlY2tpQG9yYWNsZS5jb20+IAo+PiBS
ZXZpZXdlZC1ieTogUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IC0tLQo+PiAgZHJpdmVycy94ZW4vc3dpb3RsYi14
ZW4uYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IFdoYXQgZG9lcyAiUEFUQ0ggVVBTVFJFQU0iIG1lYW4/CgpPb3BzIEkgZm9yZ290
IHRvIHJlbW92ZSBVUFNUUkVBTSwgdGhlIHRhZyBmb3IgaW50ZXJuYWwgcmV2aWV3LgoKU29ycnkg
Zm9yIHRoaXMsIHdpbGwgcmVzZW5kIGl0IHdpdGhvdXQgdGhlIHRhZy4KClRoYW5rcywKSm9lCgo+
IAo+IGNvbmZ1c2VkLAo+IAo+IGdyZWcgay1oCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
