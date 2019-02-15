From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/3] Coverity fixes
Date: Fri, 15 Feb 2019 16:25:30 +0000
Message-ID: <20190215162533.19475-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skQ2=QW=citrix.com=prvs=9420f6528=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gugJO-0006SO-Gb
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 16:26:02 +0000
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

UGF1bCBEdXJyYW50ICgzKToKICBkYXRhcGxhbmUveGVuLWJsb2NrOiByZW1vdmUgZGVhZCBjb2Rl
CiAgeGVuLWJsb2NrOiByZW1vdmUgcmVkdW5kYW50IGFzc2lnbm1lbnQKICB4ZW4tYmxvY2s6IHJl
cG9ydCBlcnJvciBjb25kaXRpb24gZnJvbSB2YmRfbmFtZV90b19kaXNrKCkKCiBody9ibG9jay9k
YXRhcGxhbmUveGVuLWJsb2NrLmMgfCAgNSArLS0tLQogaHcvYmxvY2sveGVuLWJsb2NrLmMgICAg
ICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQotLS0KQ2M6IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNv
bT4KQ2M6IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+CkNjOiBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQHJlZGhhdC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
