From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] public/io/blkif.h: make the comments on
 "sectors" self-consistent
Date: Wed, 20 Mar 2019 09:53:25 -0400
Message-ID: <20190320135325.GA6302@char.us.oracle.com>
References: <20190320125228.36440-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xN1U=RX=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1h6bey-0001Vf-BQ
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 13:53:36 +0000
Content-Disposition: inline
In-Reply-To: <20190320125228.36440-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMTI6NTI6MjhQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEN1cnJlbnRseSB0aGUgY29tbWVudCBhdCBsaW5lICMyNjcgY2xhaW1zIHRoYXQgdGhl
IHZhbHVlIHNob3VsZCBiZQo+IGV4cHJlc3NlZCBpbiBudW1iZXIgbG9naWNhbCBzZWN0b3JzLCB3
aGVyZWFzIHRoZSBjb21tZW50IGF0IGxpbmUgIzYxMwo+IHN0YXRlcyB0aGF0IHRoZSB2YWx1ZSBz
aG91bGQgYmUgZXhwcmVzc2VkIHN0cmljdGx5IGluIHVuaXRzIG9mIDUxMiBieXRlcy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IC0t
LQo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4g
Cj4gTG9va2luZyBhdCB4ZW4tYmxrZnJvbnQgaW4gTGludXgsIEknbSBhbHNvIG5vdCBjb252aW5j
ZWQgdGhhdCBpdCB3b3VsZAo+IGZ1bmN0aW9uIGNvcnJlY3RseSBpcyBzZWN0b3Itc2l6ZSAhPSA1
MTIgYW55d2F5IHNvIEkgd29uZGVyIHdoZXRoZXIgdGhpcwo+IHBhdGNoIHNob3VsZCBnbyBmdXJ0
aGVyIGFuZCBkZWZpbmUgdGhhdCBzZWN0b3Itc2l6ZSBpcyBzdHJpY3RseSA1MTIuCgpJIHRob3Vn
aHQgaXQgYWN0dWFsbHkgZGlkIHdvcmsgd2l0aCBhIENELVJPTSBiYWNrZWQgSVNPIHVzaW5nIGJs
a2Zyb250PwoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvcHVibGljL2lvL2Jsa2lmLmggfCAzICstLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9ibGtpZi5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL2lvL2Jsa2lmLmgKPiBpbmRleCAxNWE3MWUzZmVhLi5kN2M5MDRkOWRjIDEwMDY0NAo+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9ibGtpZi5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2lvL2Jsa2lmLmgKPiBAQCAtMjY0LDggKzI2NCw3IEBACj4gICAqIHNlY3RvcnMKPiAgICog
ICAgICBWYWx1ZXM6ICAgICAgICAgPHVpbnQ2NF90Pgo+ICAgKgo+IC0gKiAgICAgIFRoZSBzaXpl
IG9mIHRoZSBiYWNrZW5kIGRldmljZSwgZXhwcmVzc2VkIGluIHVuaXRzIG9mIGl0cyBsb2dpY2Fs
Cj4gLSAqICAgICAgc2VjdG9yIHNpemUgKCJzZWN0b3Itc2l6ZSIpLgo+ICsgKiAgICAgIFRoZSBz
aXplIG9mIHRoZSBiYWNrZW5kIGRldmljZSwgZXhwcmVzc2VkIGluIHVuaXRzIG9mIDUxMiBieXRl
cy4KPiAgICoKPiAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gICAqICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEZyb250ZW5kIFhlbkJ1cyBOb2Rlcwo+IC0tIAo+IDIuMjAuMS4yLmdiMjFlYmI2
NzEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
