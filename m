From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 02/39] ARM: GIC: add GIC_INVALID to enum
 gic_version
Date: Wed, 21 Mar 2018 16:31:58 +0000
Message-ID: <20180321163235.12529-3-andre.przywara@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p7ro=gl=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eygfU-0001yT-Ps
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:32:52 +0000
Received: by mail-wm0-x242.google.com with SMTP id l9so10908707wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 09:32:51 -0700 (PDT)
In-Reply-To: <20180321163235.12529-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGVudW0gZ2ljX3ZlcnNpb24gYXQgdGhlIG1vbWVudCBqdXN0IGNvbnRhaW5zIEdJQ19WMiBh
bmQgR0lDX1YzLAp3aGVyZSBHSUNfVjIgaGFwcGVucyB0byBtYXAgdG8gMC4gU28gd2l0aG91dCBo
YXZpbmcgaW5pdGlhbGlzZWQgYQp2YXJpYWJsZSBvZiB0aGF0IHR5cGUsIHdlIHdpbGwgcmVhZCBi
YWNrIEdJQ19WMiAod2hlbiBhbGxvY2F0ZWQgd2l0aCB6ZXJvaW5nCnRoZSBtZW1vcnkpLgpUbyBw
cmV2ZW50IGFtYmlndWl0aWVzIGFuZCB0byBnaXZlIGFuIGV4cGxpY2l0bHkgdW5pbml0aWFsaXNl
ZCBzdGF0ZSwgYWRkCmEgbmV3IGZpcnN0IG1lbWJlcjogR0lDX0lOVkFMSUQuIEFsc28gbWFrZSBp
dCBvYnZpb3VzIHRoYXQgdGhpcyBoYXMgYQoiMCIgZW5jb2RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KLS0tCiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL2dpYy5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9naWMuaAppbmRleCA1NjViMDg3NWNhLi4zMDc5Mzg3ZTA2IDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL2dpYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKQEAgLTIy
Nyw2ICsyMjcsNyBAQCBzdHJ1Y3QgZ2ljX2xyIHsKIH07CiAKIGVudW0gZ2ljX3ZlcnNpb24gewor
ICAgIEdJQ19JTlZBTElEID0gMCwgICAgLyogdGhlIGRlZmF1bHQgdW50aWwgZXhwbGljaXRseSBz
ZXQgdXAgKi8KICAgICBHSUNfVjIsCiAgICAgR0lDX1YzLAogfTsKLS0gCjIuMTQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
