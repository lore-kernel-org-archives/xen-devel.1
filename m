From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/3] Support IOThread polling for PV shared rings
Date: Mon, 8 Apr 2019 16:16:14 +0100
Message-ID: <20190408151617.13025-1-paul.durrant__40094.6554773086$1554736672$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p7a1=SK=citrix.com=prvs=9940f4835=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hDW0q-0008GF-At
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 15:16:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, xen-devel@lists.xenproject.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IHhlbi1ibG9jayB1c2VzIGFuIElPVGhyZWFkIHRvIGhhbmRsZSBBSU8gYnV0IHRo
ZSBldmVudCBjaGFubmVscwphcmUgZGVhbHQgd2l0aCBvbiBRRU1VJ3MgbWFpbiB0aHJlYWQuIFRo
aXMgc2VyaWVzIGFsbG93cyB0aGVtIHRvIGJlCmRlYWx0IHdpdGggaW4gdGhlIHNhbWUgY29udGV4
dC4KClBhdWwgRHVycmFudCAoMyk6CiAgeGVuLWJ1czogdXNlIGEgc2VwYXJhdGUgZmQgZm9yIGVh
Y2ggZXZlbnQgY2hhbm5lbAogIHhlbi1idXM6IGFsbG93IEFpb0NvbnRleHQgdG8gYmUgc3BlY2lm
aWVkIGZvciBlYWNoIGV2ZW50IGNoYW5uZWwKICB4ZW4tYnVzIC8geGVuLWJsb2NrOiBhZGQgc3Vw
cG9ydCBmb3IgZXZlbnQgY2hhbm5lbCBwb2xsaW5nCgogaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1i
bG9jay5jIHwgMTkgKysrLS0tLQogaHcveGVuL3hlbi1idXMuYyAgICAgICAgICAgICAgIHwgOTIg
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9ody94ZW4veGVuLWJ1
cy5oICAgICAgIHwgIDkgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA1
NCBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KQ2M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+CkNjOiBNYXggUmVpdHog
PG1yZWl0ekByZWRoYXQuY29tPgpDYzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQu
Y29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLQoy
LjIwLjEuMi5nYjIxZWJiNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
