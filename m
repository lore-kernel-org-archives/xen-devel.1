From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] xen/pvcalls: remove set but not used
 variable 'intf'
Date: Fri, 4 Jan 2019 06:03:40 +0000
Message-ID: <1546581820-123466-1-git-send-email-yuehaibing__29382.9600479969$1546581381$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fKie=PM=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1gfITm-0000Lh-4c
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 05:57:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy94
ZW4vcHZjYWxscy1iYWNrLmM6IEluIGZ1bmN0aW9uICdwdmNhbGxzX3NrX3N0YXRlX2NoYW5nZSc6
CmRyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jOjI4NjoyODogd2FybmluZzoKIHZhcmlhYmxlICdp
bnRmJyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgbm90
IHVzZWQgc2luY2UgZTY1ODdjZGJkNzMyICgicHZjYWxscy1iYWNrOiBzZXQgLUVOT1RDT05OIGlu
CnB2Y2FsbHNfY29ubl9iYWNrX3JlYWQiKQoKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVl
aGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94
ZW4vcHZjYWxscy1iYWNrLmMgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYwppbmRleCA3MWI2
Mjg3Li43YWE2NGQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYworKysg
Yi9kcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYwpAQCAtMjgzLDEyICsyODMsMTAgQEAgc3RhdGlj
IGludCBwdmNhbGxzX2JhY2tfc29ja2V0KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCiBzdGF0
aWMgdm9pZCBwdmNhbGxzX3NrX3N0YXRlX2NoYW5nZShzdHJ1Y3Qgc29jayAqc29jaykKIHsKIAlz
dHJ1Y3Qgc29ja19tYXBwaW5nICptYXAgPSBzb2NrLT5za191c2VyX2RhdGE7Ci0Jc3RydWN0IHB2
Y2FsbHNfZGF0YV9pbnRmICppbnRmOwogCiAJaWYgKG1hcCA9PSBOVUxMKQogCQlyZXR1cm47CiAK
LQlpbnRmID0gbWFwLT5yaW5nOwogCWF0b21pY19pbmMoJm1hcC0+cmVhZCk7CiAJbm90aWZ5X3Jl
bW90ZV92aWFfaXJxKG1hcC0+aXJxKTsKIH0KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
