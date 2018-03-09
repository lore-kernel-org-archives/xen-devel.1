From: julien.grall@arm.com
Subject: [PATCH 1/6] xen/arm: gic: Fix indentation in
	gic_update_one_lr
Date: Fri,  9 Mar 2018 16:35:06 +0000
Message-ID: <20180309163511.18808-2-julien.grall@arm.com>
References: <20180309163511.18808-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=opao=f7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1euKzN-0000gB-Q2
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 16:35:25 +0000
In-Reply-To: <20180309163511.18808-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2dp
Yy12Z2ljLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJj
aC9hcm0vZ2ljLXZnaWMuYwppbmRleCA2MWYwOTNkYjUwLi5lM2NiNDdlODBlIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwpA
QCAtMTk3LDggKzE5Nyw4IEBAIHN0YXRpYyB2b2lkIGdpY191cGRhdGVfb25lX2xyKHN0cnVjdCB2
Y3B1ICp2LCBpbnQgaSkKICAgICAgICAgewogICAgICAgICAgICAgaWYgKCBwLT5kZXNjID09IE5V
TEwgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgICBscl92YWwuc3RhdGUgfD0gR0lD
SF9MUl9QRU5ESU5HOwotICAgICAgICAgICAgICAgICBnaWNfaHdfb3BzLT53cml0ZV9scihpLCAm
bHJfdmFsKTsKKyAgICAgICAgICAgICAgICBscl92YWwuc3RhdGUgfD0gR0lDSF9MUl9QRU5ESU5H
OworICAgICAgICAgICAgICAgIGdpY19od19vcHMtPndyaXRlX2xyKGksICZscl92YWwpOwogICAg
ICAgICAgICAgfQogICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19XQVJOSU5HLCAidW5hYmxlIHRvIGluamVjdCBodyBpcnE9JWQgaW50byBkJWR2JWQ6IGFs
cmVhZHkgYWN0aXZlIGluIExSJWRcbiIsCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
