From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 17/31] OvmfPkg/XenPlatformPei: Reserve
 hvmloader's memory only when it as runned
Date: Tue, 9 Apr 2019 12:08:30 +0100
Message-ID: <20190409110844.14746-18-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDouq-0000Hs-Oa
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:27:48 +0000
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

Q29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
LS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Y
ZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXgg
ODk5MzNlYzNlOS4uMjJjN2EyMmM4OCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCkBAIC0yNzUsNyArMjc1
LDkgQEAgSW5pdGlhbGl6ZVhlbiAoCiAgIC8vIFJlc2VydmUgYXdheSBIVk1MT0FERVIgcmVzZXJ2
ZWQgbWVtb3J5IFsweEZDMDAwMDAwLDB4RkQwMDAwMDApLgogICAvLyBUaGlzIG5lZWRzIHRvIG1h
dGNoIEhWTUxPQURFUiBSRVNFUlZFRF9NRU1CQVNFL1JFU0VSVkVEX01FTVNJWkUuCiAgIC8vCi0g
IEFkZFJlc2VydmVkTWVtb3J5QmFzZVNpemVIb2IgKDB4RkMwMDAwMDAsIDB4MTAwMDAwMCwgRkFM
U0UpOworICBpZiAoWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKCkpIHsKKyAgICBBZGRSZXNlcnZlZE1l
bW9yeUJhc2VTaXplSG9iICgweEZDMDAwMDAwLCAweDEwMDAwMDAsIEZBTFNFKTsKKyAgfQogCiAg
IFBjZFN0YXR1cyA9IFBjZFNldEJvb2xTIChQY2RQY2lEaXNhYmxlQnVzRW51bWVyYXRpb24sIFRS
VUUpOwogICBBU1NFUlRfUkVUVVJOX0VSUk9SIChQY2RTdGF0dXMpOwotLSAKQW50aG9ueSBQRVJB
UkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
