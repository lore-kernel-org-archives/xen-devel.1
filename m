From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 12/15] xen/arm: p2m: Rename ret to mfn in
 p2m_lookup
Date: Mon, 16 Jul 2018 18:27:09 +0100
Message-ID: <20180716172712.20294-13-julien.grall@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j3cc=ka=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ff7HZ-0006XN-A4
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 17:27:33 +0000
In-Reply-To: <20180716172712.20294-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

Q29tZXN0aWMgY2hhbmdlIHRvIG1ha2UgY2xlYXJlciB3aGF0IGlzIHRoZSByZXR1cm4gKCdyZXQn
IGlzIGEgYml0CnRvbyBnZW5lcmljKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGxpbmFyby5vcmc+Ci0tLQogeGVuL2FyY2gvYXJtL3AybS5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCmluZGV4IDA3OTI1
YTFiZTQuLjY2ZDU4ZmFiZDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYworKysgYi94
ZW4vYXJjaC9hcm0vcDJtLmMKQEAgLTM4MywxNCArMzgzLDE0IEBAIG91dDoKIAogbWZuX3QgcDJt
X2xvb2t1cChzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIHAybV90eXBlX3QgKnQpCiB7Ci0g
ICAgbWZuX3QgcmV0OworICAgIG1mbl90IG1mbjsKICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
ID0gcDJtX2dldF9ob3N0cDJtKGQpOwogCiAgICAgcDJtX3JlYWRfbG9jayhwMm0pOwotICAgIHJl
dCA9IHAybV9nZXRfZW50cnkocDJtLCBnZm4sIHQsIE5VTEwsIE5VTEwpOworICAgIG1mbiA9IHAy
bV9nZXRfZW50cnkocDJtLCBnZm4sIHQsIE5VTEwsIE5VTEwpOwogICAgIHAybV9yZWFkX3VubG9j
ayhwMm0pOwogCi0gICAgcmV0dXJuIHJldDsKKyAgICByZXR1cm4gbWZuOwogfQogCiBpbnQgZ3Vl
c3RfcGh5c21hcF9tYXJrX3BvcHVsYXRlX29uX2RlbWFuZChzdHJ1Y3QgZG9tYWluICpkLAotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
