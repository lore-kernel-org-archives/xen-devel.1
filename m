From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] gitlab-ci: use git clean -ffdx in build each
 commit test
Date: Mon, 8 Apr 2019 12:50:31 +0100
Message-ID: <20190408115031.27127-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDSnN-0005BM-Oa
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:50:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGJ1aWxkIHNjcmlwdCBpbnZva2VkIGlzIGRlc2lnbmVkIHRvIHJ1biBpbiBhIHByaXN0aW5l
IGNoZWNrb3V0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
LS0tCiBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoIGIvYXV0b21hdGlvbi9n
aXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gKaW5kZXggMjc1YmM3MTkwMi4uODc5MDI4YjVh
NyAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gK
KysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gKQEAgLTE1LDQg
KzE1LDQgQEAgZmkKIGVjaG8gIkJ1aWxkaW5nICR7Q0lfQ09NTUlUX0JFRk9SRV9TSEF9Li4ke0NJ
X0NPTU1JVF9TSEF9IgogCiBOT05fU1lNQk9MSUNfUkVGPTEgLi9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQtdGVzdC5zaCAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSAke0NJX0NPTU1JVF9TSEF9IFwK
LSAgICBiYXNoIC1jICJtYWtlIC1qNCBkaXN0Y2xlYW4gJiYgLi9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQiCisgICAgYmFzaCAtYyAiZ2l0IGNsZWFuIC1mZmR4ICYmIC4vYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkIgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
