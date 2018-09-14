From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] Remove Xen PV domain creation in QEMU
Date: Fri, 14 Sep 2018 12:18:28 +0100
Message-ID: <20180914111830.28466-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p0oy=l4=citrix.com=prvs=7883262b0=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1g0m7O-0005ez-7W
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 11:18:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

U2VlIGZpcnN0IHBhdGNoIGRlc2NyaXB0aW9uLgoKQW50aG9ueSBQRVJBUkQgKDIpOgogIFJlbW92
ZSBicm9rZW4gWGVuIFBWIGRvbWFpbiBidWlsZGVyCiAgeGVuOiBSZXBsYWNlIGZldyBtZW50aW9u
cyBvZiB4ZW5kIGJ5IGxpYnhsCgogY29uZmlndXJlICAgICAgICAgICAgICAgICAgIHwgIDE3IC0t
CiBody94ZW5wdi9NYWtlZmlsZS5vYmpzICAgICAgfCAgIDIgLQogaHcveGVucHYveGVuX2RvbWFp
bmJ1aWxkLmMgIHwgMjk5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaHcv
eGVucHYveGVuX2RvbWFpbmJ1aWxkLmggIHwgIDEzIC0tCiBody94ZW5wdi94ZW5fbWFjaGluZV9w
di5jICAgfCAgMTYgKy0KIGluY2x1ZGUvaHcveGVuL3hlbi5oICAgICAgICB8ICAgMyArLQogaW5j
bHVkZS9ody94ZW4veGVuX2NvbW1vbi5oIHwgIDE4IC0tLQogcWVtdS1vcHRpb25zLmh4ICAgICAg
ICAgICAgIHwgIDEyICstCiB2bC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgLQogOSBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDM4MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBody94ZW5wdi94ZW5fZG9tYWluYnVpbGQuYwogZGVsZXRlIG1vZGUgMTAwNjQ0
IGh3L3hlbnB2L3hlbl9kb21haW5idWlsZC5oCgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
