From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 0/2] xen-block: fix sector size confusion
Date: Wed, 27 Mar 2019 17:32:04 +0000
Message-ID: <20190327173206.9065-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Og4D=R6=citrix.com=prvs=982dfca03=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h9CPQ-00049g-2K
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 17:32:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBibGtpZiBwcm90b2NvbCBpcyBjb25mdXNpbmcgYnV0IGRpc2N1c3Npb24gd2l0aCB0
aGUgbWFpbnRhaW5lcgpoYXMgY2xhcmlmaWVkIHRoYXQgc2VjdG9yIGJhc2VkIHF1YW50aXRpZXMg
aW4gcmVxdWVzdHMgYW5kIHRoZSAnc2VjdG9ycycKdmFsdWUgYWR2ZXJ0aXplZCBpbiB4ZW5zdG9y
ZSBzaG91bGQgYWx3YXlzIGJlIGluIHRlcm1zIG9mIDUxMi1ieXRlCnVuaXRzIGFuZCBub3QgdGhl
IGFkdmVydGlzZWQgbG9naWNhbCAnc2VjdG9yLXNpemUnIHZhbHVlLgoKVGhpcyBzZXJpZXMgZml4
ZXMgeGVuLWJsb2NrIHRvIGFkaGVyZSB0byB0aGUgc3BlYy4KClBhdWwgRHVycmFudCAoMik6CiAg
eGVuLWJsb2NrOiBzY2FsZSBzZWN0b3IgYmFzZWQgcXVhbnRpdGllcyBjb3JyZWN0bHkKICB4ZW4t
YmxvY2s6IGFsd2F5cyByZXBvcnQgJ3NlY3RvcnMnIGluIHRlcm1zIG9mIDUxMi1ieXRlIHVuaXRz
CgogaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIHwgMjggKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLQogaHcvYmxvY2sveGVuLWJsb2NrLmMgICAgICAgICAgIHwgIDIgKy0KIGh3L2Js
b2NrL3hlbl9ibGtpZi5oICAgICAgICAgICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQotLS0KdjI6CiAtIFNwbGl0IHVwIHByZXZpb3Vz
IHNpbmdsZSBwYXRjaAoKQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgpDYzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KQ2M6IE1heCBSZWl0eiA8bXJl
aXR6QHJlZGhhdC5jb20+CkNjOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci0tIAoyLjIw
LjEuMi5nYjIxZWJiNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
