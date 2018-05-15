From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v3 0/3] xen-hvm: use new resource mapping API
Date: Tue, 15 May 2018 17:40:50 +0100
Message-ID: <20180515164053.14604-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egkv=ic=citrix.com=prvs=6664e1dc0=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fId0V-0000Zp-Or
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 16:40:59 +0000
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
dm0uYyAgICAgICB8IDExMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLQogaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oIHwgIDE2ICsrKysrKysKIHNjcmlwdHMv
Y2hlY2twYXRjaC5wbCAgICAgICB8ICAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0
aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCi0tLQpDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+CkNjOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhh
dC5jb20+CkNjOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KQ2M6IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
