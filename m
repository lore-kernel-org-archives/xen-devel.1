From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 3/3] tools: ipxe: Correct download error handling
Date: Mon, 5 Nov 2018 18:42:34 +0000
Message-ID: <20181105184234.31603-3-ian.jackson@eu.citrix.com>
References: <20181105184234.31603-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ylya=nq=citrix.com=prvs=8406b12ba=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gJjpv-0004Ji-4Z
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 18:42:55 +0000
In-Reply-To: <20181105184234.31603-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzaGVsbCBmcmFnbWVudCBsYWNrZWQgc2V0IC1lLiAgU28sIGVnIGlmIHRoZSBkb3dubG9h
ZCBmYWlsZWQgYQpicm9rZW4gaXB4ZS50YXIuZ3ogd291bGQgYmUgbGVmdCBiZWhpbmQuCgpTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgotLS0KIHRvb2xzL2Zpcm13YXJlL2V0aGVyYm9vdC9NYWtlZmlsZSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2V0aGVyYm9vdC9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJl
L2V0aGVyYm9vdC9NYWtlZmlsZQppbmRleCAzODY4Zjg3NmVhLi5mZDhkZmRmNWE3IDEwMDY0NAot
LS0gYS90b29scy9maXJtd2FyZS9ldGhlcmJvb3QvTWFrZWZpbGUKKysrIGIvdG9vbHMvZmlybXdh
cmUvZXRoZXJib290L01ha2VmaWxlCkBAIC0zMyw3ICszMyw3IEBAICQoUk9NKTogJChST01TKQog
CSQoTUFLRSkgLUMgJEQvc3JjIGJpbi8kKCpGKS5yb20KIAogJFQ6Ci0JaWYgISAkKEZFVENIRVIp
IF8kVCAkKElQWEVfVEFSQkFMTF9VUkwpOyB0aGVuIFwKKwlzZXQgLWU7IGlmICEgJChGRVRDSEVS
KSBfJFQgJChJUFhFX1RBUkJBTExfVVJMKTsgdGhlbiBcCiAJCSQoR0lUKSBjbG9uZSAkKElQWEVf
R0lUX1VSTCkgJEQuZ2l0OyBcCiAJCShjZCAkRC5naXQgJiYgJChHSVQpIGFyY2hpdmUgLS1mb3Jt
YXQ9dGFyIC0tcHJlZml4PSRELyBcCiAJCSQoSVBYRV9HSVRfVEFHKSB8IGd6aXAgLW4gPi4uL18k
VCk7IFwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
