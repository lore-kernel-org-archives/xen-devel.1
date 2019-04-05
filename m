From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/3] libxl: Constify src of device_compare_fn_t
Date: Fri, 5 Apr 2019 18:58:10 +0100
Message-ID: <20190405175811.7446-3-anthony.perard@citrix.com>
References: <20190405175811.7446-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8q43=SH=citrix.com=prvs=991ec766c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hCT6c-0000eY-GT
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 17:58:22 +0000
In-Reply-To: <20190405175811.7446-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxsIGZ1bmN0aW9ucyBsaWJ4bF9kZXZpY2VfKl9jb3B5IHdoaWNoIGltcGxlbWVudHMgZGV2aWNl
X2NvbXBhcmVfZm5fdAphbHJlYWR5IGhhdmUgdGhlIGBzcmMnIHBhcmFtZXRlciBkZWZpbmVkIHdp
dGggY29uc3QuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKaW5kZXggYzc1Yzk4MTU2YS4uMzRkYzg4NjUwNSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0z
NzI2LDcgKzM3MjYsNyBAQCB0eXBlZGVmIGludCAoKmRldmljZV9zZXRfZGVmYXVsdF9mbl90KShs
aWJ4bF9fZ2MgKiwgdWludDMyX3QsIHZvaWQgKiwgYm9vbCk7CiB0eXBlZGVmIGludCAoKmRldmlj
ZV90b19kZXZpY2VfZm5fdCkobGlieGxfX2djICosIHVpbnQzMl90LCB2b2lkICosCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2RldmljZSAqKTsKIHR5cGVkZWYg
dm9pZCAoKmRldmljZV9pbml0X2ZuX3QpKHZvaWQgKik7Ci10eXBlZGVmIHZvaWQgKCpkZXZpY2Vf
Y29weV9mbl90KShsaWJ4bF9jdHggKiwgdm9pZCAqLCB2b2lkICopOwordHlwZWRlZiB2b2lkICgq
ZGV2aWNlX2NvcHlfZm5fdCkobGlieGxfY3R4ICosIHZvaWQgKmRzdCwgY29uc3Qgdm9pZCAqc3Jj
KTsKIHR5cGVkZWYgdm9pZCAoKmRldmljZV9kaXNwb3NlX2ZuX3QpKHZvaWQgKik7CiB0eXBlZGVm
IGludCAoKmRldmljZV9jb21wYXJlX2ZuX3QpKGNvbnN0IHZvaWQgKiwgY29uc3Qgdm9pZCAqKTsK
IHR5cGVkZWYgdm9pZCAoKmRldmljZV9tZXJnZV9mbl90KShsaWJ4bF9jdHggKiwgdm9pZCAqLCB2
b2lkICopOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
