From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 08/18] xen: duplicate xen_disk.c as basis of
 dataplane/xen-qdisk.c
Date: Mon, 3 Dec 2018 16:35:39 +0000
Message-ID: <20181203163539.GN14786@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hldm=om=citrix.com=prvs=86815d540=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gTrCC-0006ve-8y
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 16:35:44 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-9-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTI6MDFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBuZXcgeGVuLXFkaXNrIFhlbkRldmljZSBpbXBsZW1lbnRhdGlvbiByZXF1aXJl
cyB0aGUgc2FtZSBjb3JlIGRhdGFwbGFuZQo+IGFzIHRoZSBsZWdhY3kgeGVuX2Rpc2sgaW1wbGVt
ZW50YXRpb24gaXQgd2lsbCBldmVudHVhbGx5IHJlcGxhY2UuIFRoaXMKPiBwYXRjaCB0aGVyZWZv
cmUgY29waWVzIHRoZSBsZWdhY3kgeGVuX2Rpc2suYyBzb3VyY2UgbW9kdWxlIGludG8gYSBuZXcK
PiBkYXRhcGxhbmUveGVuLXFkaXNrLmMgc291cmNlIG1vZHVsZSBhcyB0aGUgYmFzaXMgZm9yIHRo
ZSBuZXcgZGF0YXBsYW5lIGFuZAo+IGFkanVzdHMgdGhlIE1BSU5UQUlORVJTIGZpbGUgYWNjb3Jk
aW5nbHkuCj4gCj4gTk9URTogVGhlIGR1cGxpY2F0ZWQgY29kZSBpcyBub3QgeWV0IGJ1aWx0LiBJ
dCBpcyBzaW1wbHkgcHV0IGludG8gcGxhY2UgYnkKPiAgICAgICB0aGlzIHBhdGNoIChqdXN0IGZp
eGluZyBzdHlsZSB2aW9sYXRpb25zKSBzdWNoIHRoYXQgdGhlCj4gICAgICAgbW9kaWZpY2F0aW9u
cyB0aGF0IHdpbGwgbmVlZCB0byBiZSBtYWRlIHRvIHRoZSBjb2RlIGFyZSBub3QKPiAgICAgICBj
b25mbGF0ZWQgd2l0aCBjb2RlIG1vdmVtZW50LCB0aHVzIG1ha2luZyByZXZpZXcgaGFyZGVyLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
CgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cgot
LSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
