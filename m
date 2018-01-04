From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 69/74] libxl_bitmap_copy_alloc: copy 0,
	NULL as 0, NULL
Date: Thu, 4 Jan 2018 13:06:20 +0000
Message-ID: <20180104130625.28605-70-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5ca-0001MX-Vj
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:31:49 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpXZSBzaG91bGRu
J3QgYWxsb2NhdGUgd2hlbiBpdCdzIGJvdGggdW5uZWNlc3NhcnksIGFuZCBub3QgaW4KYWNjb3Jk
YW5jZSB3aXRoIHRoZSB0aGluZyB3ZSdyZSBjb3B5aW5nLgoKT25lIGVmZmVjdCBpcyB0byBtYWtl
IGEgY29waWVkIGxpYnhsX19kb21haW5fYnVpbGRfaW5mbyBtb3JlIGxpa2UgdGhlCm9yaWdpbmFs
LCB3aGljaCBpcyBnb2luZyB0byBiZSBoZWxwZnVsIGZvciB0aGUgcHYgc2hpbSBtb2RlLgoKU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
dG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGxfdXRpbHMuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMKaW5kZXggNTA3ZWU1NmM3
Yy4uNjNiMWEyY2FjMSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYworKysg
Yi90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCkBAIC02NTksOSArNjU5LDEzIEBAIHZvaWQgbGli
eGxfYml0bWFwX2NvcHlfYWxsb2MobGlieGxfY3R4ICpjdHgsCiB7CiAgICAgR0NfSU5JVChjdHgp
OwogCi0gICAgZHB0ci0+bWFwID0gbGlieGxfX2NhbGxvYyhOT0dDLCBzcHRyLT5zaXplLCBzaXpl
b2YoKnNwdHItPm1hcCkpOwogICAgIGRwdHItPnNpemUgPSBzcHRyLT5zaXplOwotICAgIG1lbWNw
eShkcHRyLT5tYXAsIHNwdHItPm1hcCwgc3B0ci0+c2l6ZSAqIHNpemVvZigqc3B0ci0+bWFwKSk7
CisgICAgaWYgKHNwdHItPm1hcCkgeworICAgICAgICBkcHRyLT5tYXAgPSBsaWJ4bF9fY2FsbG9j
KE5PR0MsIHNwdHItPnNpemUsIHNpemVvZigqc3B0ci0+bWFwKSk7CisgICAgICAgIG1lbWNweShk
cHRyLT5tYXAsIHNwdHItPm1hcCwgc3B0ci0+c2l6ZSAqIHNpemVvZigqc3B0ci0+bWFwKSk7Cisg
ICAgfSBlbHNlIHsKKyAgICAgICAgZHB0ci0+bWFwID0gTlVMTDsKKyAgICB9CiAKICAgICBHQ19G
UkVFOwogfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
