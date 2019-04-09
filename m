From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 11/31] OvmfPkg/XenPlatformPei: Use
 mXenHvmloaderInfo to get E820
Date: Tue, 9 Apr 2019 12:08:24 +0100
Message-ID: <20190409110844.14746-12-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDovI-0000oj-AC
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:16 +0000
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VXNlIHRoZSBhbHJlYWR5IGNoZWNrZWQgcG9pbnRlciBtWGVuSHZtbG9hZGVySW5mbyB0byByZXRy
aWV2ZSB0aGUgRTgyMAp0YWJsZSBwcm9kdWNlZCBieSBodm1sb2FkZXIuCgpDb250cmlidXRlZC11
bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNpZ25lZC1vZmYtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIE92bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5k
ZXggYTg2NjY0MWI2Ny4uZGY5MDZiNmJlNSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCkBAIC01OSwxOCAr
NTksMTggQEAgWGVuR2V0RTgyME1hcCAoCiAgIFVJTlQzMiAqQ291bnQKICAgKQogewotICBFRklf
WEVOX09WTUZfSU5GTyAqSW5mbyA9Ci0gICAgKEVGSV9YRU5fT1ZNRl9JTkZPICopKFVJTlROKSBP
Vk1GX0lORk9fUEhZU0lDQUxfQUREUkVTUzsKKyAgLy8KKyAgLy8gR2V0IEU4MjAgcHJvZHVjZWQg
YnkgaHZtbG9hZGVyCisgIC8vCisgIGlmIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKSB7Cisg
ICAgQVNTRVJUIChtWGVuSHZtbG9hZGVySW5mby0+RTgyMCA8IE1BWF9BRERSRVNTKTsKKyAgICAq
RW50cmllcyA9IChFRklfRTgyMF9FTlRSWTY0ICopKFVJTlROKSBtWGVuSHZtbG9hZGVySW5mby0+
RTgyMDsKKyAgICAqQ291bnQgPSBtWGVuSHZtbG9hZGVySW5mby0+RTgyMEVudHJpZXNDb3VudDsK
IAotICBpZiAoQXNjaWlTdHJDbXAgKChDSEFSOCAqKSBJbmZvLT5TaWduYXR1cmUsICJYZW5IVk1P
Vk1GIikpIHsKLSAgICByZXR1cm4gRUZJX05PVF9GT1VORDsKKyAgICByZXR1cm4gRUZJX1NVQ0NF
U1M7CiAgIH0KIAotICBBU1NFUlQgKEluZm8tPkU4MjAgPCBNQVhfQUREUkVTUyk7Ci0gICpFbnRy
aWVzID0gKEVGSV9FODIwX0VOVFJZNjQgKikoVUlOVE4pIEluZm8tPkU4MjA7Ci0gICpDb3VudCA9
IEluZm8tPkU4MjBFbnRyaWVzQ291bnQ7Ci0KLSAgcmV0dXJuIEVGSV9TVUNDRVNTOworICByZXR1
cm4gRUZJX05PVF9GT1VORDsKIH0KIAogLyoqCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
