From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.12] dt: fix integer check in
 dt_device_is_compatible
Date: Tue, 11 Dec 2018 10:46:06 -0800
Message-ID: <1544553966-30776-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2g57=OU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gWn2n-0000ei-3O
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 18:46:09 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

Y3BsZW4gaXMgdW5zaWduZWQsIHRodXMsIGl0IGNhbiBuZXZlciBiZSA8IDAuIFVzZSBhIHNpZ25l
ZCBpbnRlZ2VyIGxvY2FsCnZhcmlhYmxlIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQogeGVuL2NvbW1vbi9kZXZpY2Vf
dHJlZS5jIHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYyBiL3hlbi9j
b21tb24vZGV2aWNlX3RyZWUuYwppbmRleCA4ZmM0MDFkLi5kZjI3NGNjIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2RldmljZV90cmVlLmMKKysrIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jCkBA
IC0yMTMsMTcgKzIxMywyMCBAQCBib29sX3QgZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUoY29uc3Qg
c3RydWN0IGR0X2RldmljZV9ub2RlICpkZXZpY2UsCiB7CiAgICAgY29uc3QgY2hhciogY3A7CiAg
ICAgdTMyIGNwbGVuLCBsOworICAgIHM2NCBpbGVuOwogCiAgICAgY3AgPSBkdF9nZXRfcHJvcGVy
dHkoZGV2aWNlLCAiY29tcGF0aWJsZSIsICZjcGxlbik7CiAgICAgaWYgKCBjcCA9PSBOVUxMICkK
ICAgICAgICAgcmV0dXJuIDA7Ci0gICAgd2hpbGUgKCBjcGxlbiA+IDAgKQorCisgICAgaWxlbiA9
IGNwbGVuOworICAgIHdoaWxlICggaWxlbiA+IDAgKQogICAgIHsKICAgICAgICAgaWYgKCBkdF9j
b21wYXRfY21wKGNwLCBjb21wYXQpID09IDAgKQogICAgICAgICAgICAgcmV0dXJuIDE7CiAgICAg
ICAgIGwgPSBzdHJsZW4oY3ApICsgMTsKICAgICAgICAgY3AgKz0gbDsKLSAgICAgICAgY3BsZW4g
LT0gbDsKKyAgICAgICAgaWxlbiAtPSBsOwogICAgIH0KIAogICAgIHJldHVybiAwOwotLSAKMS45
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
