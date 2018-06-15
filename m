From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 0/2] VT-d: make dom0-strict work with buggy
 firmware
Date: Fri, 15 Jun 2018 17:31:03 +0100
Message-ID: <20180615163105.19097-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w32+=jb=citrix.com=prvs=6977ca76d=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fTrd0-00075Z-3e
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 16:31:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBkb20wLXN0cmljdCBtb2RlIGlzIGVuYWJsZWQgdGhlIGlvbW11X2luY2x1c2l2ZV9tYXBw
aW5nIHdvcmthcm91bmQKZm9yIGZpcm13YXJlIHdpdGggdW5kZWNsYXJlZCBSTVJScyBpcyByZW5k
ZXJlZCB1c2VsZXNzLiBUaGlzIHNlcmllcyBmaXhlcwp0aGUgcHJvYmxlbS4KClBhdWwgRHVycmFu
dCAoMik6CiAgVlQtZDogcmUtcGhyYXNlIGxvZ2ljIGluIHZ0ZF9zZXRfaHdkb21fbWFwcGluZygp
IGZvciBjbGFyaXR5CiAgVlQtZDogcmVjb25jaWxlIGlvbW11X2luY2x1c2l2ZV9tYXBwaW5nIGFu
ZCBpb21tdT1kb20wLXN0cmljdAoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3du
ICAgfCAgNiArKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICB8ICAy
ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L3Z0ZC5jIHwgNDIgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAg
ICAgICAgICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
