From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 16/31] OvmfPkg/XenPlatformPei: Introduce
 XenHvmloaderDetected
Date: Mon, 8 Apr 2019 15:23:53 +0100
Message-ID: <20190408142408.30419-17-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVFc-00029m-ID
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:27:56 +0000
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
LS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggfCA1ICsrKysrCiBPdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jICAgICAgfCA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxh
dGZvcm0uaCBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAppbmRleCA2Y2NkNWVi
NjZjLi41NTY1ZDQ3ZTM0IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRm
b3JtLmgKKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCkBAIC05NSw2ICs5
NSwxMSBAQCBYZW5EZXRlY3QgKAogICBWT0lECiAgICk7CiAKK0JPT0xFQU4KK1hlbkh2bWxvYWRl
ckRldGVjdGVkICgKKyAgVk9JRAorICApOworCiBWT0lECiBBbWRTZXZJbml0aWFsaXplICgKICAg
Vk9JRApkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggOWQ5ZTlmODAyMC4uODk5MzNlYzNlOSAxMDA2NDQK
LS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1hlbi5jCkBAIC0yMDIsNiArMjAyLDEzIEBAIFhlbkRldGVjdCAoCiAgIHJldHVybiBG
QUxTRTsKIH0KIAorQk9PTEVBTgorWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAorICBWT0lECisgICkK
K3sKKyAgcmV0dXJuIChtWGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKTsKK30KIAogVk9JRAogWGVu
UHVibGlzaFJhbVJlZ2lvbnMgKAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
