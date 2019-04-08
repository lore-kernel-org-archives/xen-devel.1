From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 19/31] OvmfPkg/XenPlatformPei: Introduce
 XenPvhDetected
Date: Mon, 8 Apr 2019 15:23:56 +0100
Message-ID: <20190408142408.30419-20-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVFt-0002S8-3p
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:28:13 +0000
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

Q29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
LS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggfCAgNSArKysrKwogT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyAgICAgIHwgMTMgKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5oIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCmluZGV4
IGE1MjRjMjNhNDMuLmM1YTEzOWYwMTYgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvUGxhdGZvcm0uaAorKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgKQEAg
LTEwNSw2ICsxMDUsMTEgQEAgWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAogICBWT0lECiAgICk7CiAK
K0JPT0xFQU4KK1hlblB2aERldGVjdGVkICgKKyAgVk9JRAorICApOworCiBWT0lECiBBbWRTZXZJ
bml0aWFsaXplICgKICAgVk9JRApkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Y
ZW4uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggYjM2ZWZmNTI0ZC4uMjNm
ZjMxMDJiNSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9P
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCkBAIC0yMTcsNiArMjE3LDE5IEBAIFhlbkh2bWxv
YWRlckRldGVjdGVkICgKICAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKIH0K
IAorQk9PTEVBTgorWGVuUHZoRGV0ZWN0ZWQgKAorICBWT0lECisgICkKK3sKKyAgLy8KKyAgLy8g
VGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSB1c2VkIGFmdGVyIFhlbkNvbm5lY3QKKyAgLy8K
KyAgQVNTRVJUIChtWGVuSW5mby5WZXJzaW9uTWFqb3IgIT0gMCk7CisKKyAgcmV0dXJuIG1YZW5I
dm1sb2FkZXJJbmZvID09IE5VTEw7Cit9CisKIFZPSUQKIFhlblB1Ymxpc2hSYW1SZWdpb25zICgK
ICAgVk9JRAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
