From: Andre Przywara <andre.przywara@linaro.org>
Subject: [FIXUP] replace LOG_2 with ilog2
Date: Mon,  5 Mar 2018 16:56:34 +0000
Message-ID: <20180305165634.4178-1-andre.przywara@linaro.org>
References: <20180305160415.16760-35-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oang=f3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1estPo-0002Th-Nh
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:56:44 +0000
Received: by mail-wm0-x241.google.com with SMTP id t74so17371330wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 08:56:42 -0800 (PST)
In-Reply-To: <20180305160415.16760-35-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIG1hY3JvIGZvcm1lcmx5IG5hbWVkIExPR18yIGhhcyBiZWVuIHJlY2VudGx5IHJlbmFtZWQg
dG8gaWxvZzIsCnNvIGFkanVzdCB0aGUgbmFtZSBpbiB2Z2ljLW1taW8uaC4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KSGksCgpJ
IHNvbWVob3cgcmViYXNlZCB3aXRob3V0IGFjdHVhbGx5IHRyeWluZyB0byByZS1jb21waWxlIChz
aW5jZSB0aGUgcmViYXNlCml0c2VsZiB3ZW50IHRocm91Z2ggc21vb3RobHkpLiBTbyBJIG1pc3Nl
ZCB0aGlzIHN1YnRsZSByZW5hbWluZyBpbiB0aGUgdHJlZS4KUGxlYXNlIGFwcGx5IHRoaXMgcGF0
Y2ggKG9yIG1lcmdlIGl0IGludG8KIltQQVRDSCAzNC81N10gQVJNOiBuZXcgVkdJQzogQWRkIE1N
SU8gaGFuZGxpbmcgZnJhbWV3b3JrIikgdG8gZ2V0IGFjdHVhbGx5CnNvbWV0aGluZyB0aGF0IGNv
bXBpbGVzLgpBcG9sb2dpZXMgZm9yIHRoYXQgbWlzaGFwIQoKQ2hlZXJzLApBbmRyZQoKIHhlbi9h
cmNoL2FybS92Z2ljL3ZnaWMtbW1pby5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdp
Yy1tbWlvLmggYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLW1taW8uaAppbmRleCBiYmYwZDE4MWFl
Li41ZTZjZmY5ZWIyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLW1taW8uaAor
KysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLW1taW8uaApAQCAtNDksNyArNDksNyBAQCBleHRl
cm4gc3RydWN0IG1taW9faGFuZGxlcl9vcHMgdmdpY19pb19vcHM7CiAgKiBUaGlzIGFzc3VtZXMg
dGhhdCA8Yml0cz4gaXMgYSBwb3dlciBvZiB0d28uCiAgKi8KICNkZWZpbmUgVkdJQ19BRERSX1RP
X0lOVElEKGFkZHIsIGJpdHMpICAoKChhZGRyKSAmIFZHSUNfQUREUl9JUlFfTUFTSyhiaXRzKSkg
KiBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDggPj4gTE9HXzIo
Yml0cykpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDggPj4gaWxv
ZzIoYml0cykpCiAKIC8qCiAgKiBTb21lIFZHSUMgcmVnaXN0ZXJzIHN0b3JlIHBlci1JUlEgaW5m
b3JtYXRpb24sIHdpdGggYSBkaWZmZXJlbnQgbnVtYmVyCi0tIAoyLjE0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
