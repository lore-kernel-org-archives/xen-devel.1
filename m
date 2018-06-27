From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/cpuid: fix generation of auto cpuid
 header
Date: Wed, 27 Jun 2018 16:32:12 +0200
Message-ID: <20180627143214.35751-2-roger.pau@citrix.com>
References: <20180627143214.35751-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zznj=jn=citrix.com=prvs=709ecfd17=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fYBVR-0006BH-RX
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:33:13 +0000
In-Reply-To: <20180627143214.35751-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG1ha2VmaWxlIHJ1bGUgdG8gZ2VuZXJhdGUgdGhlIGNwdWlkLWF1dG9nZW4uaCBoZWFkZXIg
cGFzc2VzIHRoZQp3aG9sZSBsaXN0IG9mIGRlcGVuZGVuY2llcyB0byBnZW4tY3B1aWQucHkgYnV0
IG9ubHkgdGhlIGZpcnN0CmRlcGVuZGVuY3kgaXMgYWN0dWFsbHkgbmVlZGVkLgoKU28gZmFyIHRo
aXMgc2VlbXMgdG8gYmUgaGFybWxlc3MuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRy
aXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
YzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHhlbi9pbmNsdWRlL01ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvTWFr
ZWZpbGUgYi94ZW4vaW5jbHVkZS9NYWtlZmlsZQppbmRleCA4NzYyYWIzMzM0Li43YzUwMzRlNmUw
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9NYWtlZmlsZQorKysgYi94ZW4vaW5jbHVkZS9NYWtl
ZmlsZQpAQCAtMTQzLDcgKzE0Myw3IEBAIGVuZGlmCiBpZmVxICgkKFhFTl9UQVJHRVRfQVJDSCks
eDg2XzY0KQogCiAkKEJBU0VESVIpL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZC1hdXRvZ2VuLmg6ICQo
QkFTRURJUikvaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oICQoQkFTRURJ
UikvdG9vbHMvZ2VuLWNwdWlkLnB5IEZPUkNFCi0JJChQWVRIT04pICQoQkFTRURJUikvdG9vbHMv
Z2VuLWNwdWlkLnB5IC1pICReIC1vICRALm5ldworCSQoUFlUSE9OKSAkKEJBU0VESVIpL3Rvb2xz
L2dlbi1jcHVpZC5weSAtaSAkPCAtbyAkQC5uZXcKIAkkKGNhbGwgbW92ZS1pZi1jaGFuZ2VkLCRA
Lm5ldywkQCkKIAogYWxsOiAkKEJBU0VESVIpL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZC1hdXRvZ2Vu
LmgKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
