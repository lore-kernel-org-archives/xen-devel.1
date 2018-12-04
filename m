From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 12/18] xen: remove 'ioreq'
 struct/varable/field names from dataplane/xen-qdisk.c
Date: Tue, 4 Dec 2018 11:34:02 +0000
Message-ID: <20181204113402.GS14786__5176.01281540028$1543923165$gmane$org@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-13-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=27b+=on=citrix.com=prvs=869086d29=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gU8xq-0004i5-KK
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:34:06 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-13-paul.durrant@citrix.com>
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

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTI6MDVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgaXMgYSBwdXJlbHkgY29zbWV0aWMgcGF0Y2ggdGhhdCBwdXJnZXMgdGhlIG5h
bWUgJ2lvcmVxJyBmcm9tIHN0cnVjdCwKPiB2YXJpYWJsZSBhbmQgZmllbGQgbmFtZXMuIChUaGlz
IG5hbWUgaGFzIGJlZW4gcHJvYmxlbWF0aWMgZm9yIGEgbG9uZyB0aW1lCj4gYXMgJ2lvcmVxJyBp
cyB0aGUgbmFtZSB1c2VkIGZvciBnZW5lcmljIEkvTyByZXF1ZXN0cyBjb21pbmcgZnJvbSBYZW4p
Lgo+IFRoZSBwYXRjaCByZXBsYWNlcyAnc3RydWN0IGlvcmVxJyB3aXRoIGEgbmV3ICdYZW5RZGlz
a1JlcXVlc3QnIHR5cGUgYW5kCj4gJ2lvcmVxJyBmaWVsZC92YXJpYWJsZSBuYW1lcyB3aXRoICdy
ZXF1ZXN0JywgYW5kIHRoZW4gZG9lcyBuZWNlc3NhcnkKPiBmaXgtdXAgdG8gYWRoZXJlIHRvIGNv
ZGluZyBzdHlsZS4KPiAKPiBGdW5jdGlvbiBuYW1lcyBhcmUgbm90IG1vZGlmaWVkIGJ5IHRoaXMg
cGF0Y2guIFloZXkgd2lsbCBiZSBkZWFsdCB3aXRoIGluCgpzL1loZXkvVGhleS8KCj4gYSBzdWJz
ZXF1ZW50IHBhdGNoLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
