From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 0/2] xen-hvm: use new resource mapping API
Date: Thu, 10 May 2018 10:15:15 +0100
Message-ID: <20180510091518.28199-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t9kk=h5=citrix.com=prvs=66179fe3f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fGhfZ-0007TV-9r
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 09:15:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Daniel P . Berrange" <berrange@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgbW9kaWZpZXMgUUVNVSB0byB1c2UgdGhlIG5ldyBndWVzdCByZXNvdXJjZSBt
YXBwaW5nIEFQSQooYXZhaWxhYmxlIGluIFhlbiA0LjExKykgdG8gbWFwIGlvcmVxIHBhZ2VzLgoK
djI6CiAtIEFkZCBhIHBhdGNoIHRvIGNoZWNrcGF0Y2ggdG8gYXZvaWQgbWlzcGFyc2luZyBvZiBY
ZW4gc3RhYmxlIEFQSSBoYW5kbGVzCgpQYXVsIER1cnJhbnQgKDMpOgogIHhlbi1odm06IGNyZWF0
ZSBzZXBhcmF0ZSBmdW5jdGlvbiBmb3IgaW9yZXEgc2VydmVyIGluaXRpYWxpemF0aW9uCiAgY2hl
Y2twYXRjaDogZ2VuZXJhbGl6ZSB4ZW4gaGFuZGxlIG1hdGNoaW5nIGluIHRoZSBsaXN0IG9mIHR5
cGVzCiAgeGVuLWh2bTogdHJ5IHRvIHVzZSB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSgp
IHRvIG1hcCBpb3JlcSBwYWdlcwoKIGNvbmZpZ3VyZSAgICAgICAgICAgICAgICAgICB8ICAgNSAr
KwogaHcvaTM4Ni94ZW4vdHJhY2UtZXZlbnRzICAgIHwgICAxICsKIGh3L2kzODYveGVuL3hlbi1o
dm0uYyAgICAgICB8IDExNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLQogaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oIHwgIDE0ICsrKysrKwogc2NyaXB0cy9j
aGVja3BhdGNoLnBsICAgICAgIHwgICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRp
b25zKCspLCAzMSBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KQ2M6IERhbmllbCBQLiBCZXJyYW5nZSA8YmVycmFuZ2VAcmVkaGF0
LmNvbT4KQ2M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgpDYzogUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
