From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 01/49] tools: ARM: vGICv3: avoid inserting
	optional DT properties
Date: Fri,  9 Feb 2018 14:38:49 +0000
Message-ID: <20180209143937.28866-2-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9q8-0007xL-L3
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:39:48 +0000
Received: by mail-wm0-x244.google.com with SMTP id g1so15780079wmg.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:39:47 -0800 (PST)
In-Reply-To: <20180209143937.28866-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiBjcmVhdGluZyBhIEdJQ3YzIGRldmljZXRyZWUgbm9kZSwgd2UgY3VycmVudGx5IGluc2Vy
dCB0aGUKcmVkaXN0cmlidXRvci1zdHJpZGUgYW5kICNyZWRpc3RyaWJ1dG9yLXJlZ2lvbnMgcHJv
cGVydGllcywgd2l0aCBmaXhlZAp2YWx1ZXMgd2hpY2ggYXJlIGFjdHVhbGx5IHRoZSBhcmNoaXRl
Y3RlZCBvbmVzLiBCdXQgdGhvc2UgcHJvcGVydGllcyBhcmUKb3B0aW9uYWwgYW5kIG9ubHkgbmVl
ZGVkIHRvIGNvdmVyIGZvciBicm9rZW4gcGxhdGZvcm1zLCB3aGVyZSB0aGUgdmFsdWVzCmRpZmZl
ciBmcm9tIHRoZSBhcmNoaXRlY3RlZCBvbmUuIFRoaXMgd2lsbCBuZXZlciBiZSB0aGUgY2FzZSBm
b3IgdGhlCmNvbnN0cnVjdGVkIERvbVUgbWVtb3J5IG1hcC4KU28gd2UgZHJvcCB0aG9zZSBwcm9w
ZXJ0aWVzIGFsdG9nZXRoZXIgYW5kIHByb3ZpZGUgYSBjbGVhbiBhbmQgYXJjaGl0ZWN0ZWQKR0lD
djMgRFQgbm9kZSBmb3IgRG9tVXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5k
cmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9hcm0uYyB8IDgg
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2FybS5jIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMKaW5kZXggM2U0
NjU1NDMwMS4uYjViYmEzY2QzMyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMK
KysrIGIvdG9vbHMvbGlieGwvbGlieGxfYXJtLmMKQEAgLTUyNCwxNCArNTI0LDYgQEAgc3RhdGlj
IGludCBtYWtlX2dpY3YzX25vZGUobGlieGxfX2djICpnYywgdm9pZCAqZmR0KQogICAgIHJlcyA9
IGZkdF9wcm9wZXJ0eShmZHQsICJpbnRlcnJ1cHQtY29udHJvbGxlciIsIE5VTEwsIDApOwogICAg
IGlmIChyZXMpIHJldHVybiByZXM7CiAKLSAgICByZXMgPSBmZHRfcHJvcGVydHlfY2VsbChmZHQs
ICJyZWRpc3RyaWJ1dG9yLXN0cmlkZSIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgR1VF
U1RfR0lDVjNfUkRJU1RfU1RSSURFKTsKLSAgICBpZiAocmVzKSByZXR1cm4gcmVzOwotCi0gICAg
cmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0LCAiI3JlZGlzdHJpYnV0b3ItcmVnaW9ucyIsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgR1VFU1RfR0lDVjNfUkRJU1RfUkVHSU9OUyk7Ci0g
ICAgaWYgKHJlcykgcmV0dXJuIHJlczsKLQogICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9yZWdzKGdj
LCBmZHQsIFJPT1RfQUREUkVTU19DRUxMUywgUk9PVF9TSVpFX0NFTExTLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ljZF9iYXNl
LCBnaWNkX3NpemUsCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
