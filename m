From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2.1 1/2] tools: fix build dependency upon
 generated header(s)
Date: Fri, 25 Jan 2019 00:33:49 -0700
Message-ID: <5C4ABBDD0200007800211036@prv1-mh.provo.novell.com>
References: <5C4ABA9A020000780021102A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmvzs-0008PC-BI
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 07:33:52 +0000
In-Reply-To: <5C4ABA9A020000780021102A@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IGZkMzVmMzJiNGIgKCJ0b29scy94ODZlbXVsOiBVc2Ugc3RydWN0IGNwdWlkX3BvbGlj
eSBpbiB0aGUKdXNlcnNwYWNlIHRlc3QgaGFybmVzc2VzIikgZGlkbid0IGFjY291bnQgZm9yIHRo
ZSBkZXBlbmRlbmNpZXMgb2YKY3B1aWQtYXV0b2dlbi5oIHRvIHBvdGVudGlhbGx5IGNoYW5nZSBi
ZXR3ZWVuIGluY3JlbWVudGFsIGJ1aWxkcy4KUHV0dGluZyB0aGUgbWFrZSBpbnZvY2F0aW9uIHRv
IHByb2R1Y2UgdGhlIGhlYWRlciB0b2dldGhlciB3aXRoIHRoZQpkaXJlY3RvcnkgdHJlZSBjcmVh
dGlvbiB0aGVyZWZvcmUgZG9lcyBub3Qgd29yay4gSW50cm9kdWNlIGEgc2VwYXJhdGUKZ29hbC4K
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyLjE6
IFNwbGl0IGNvbnRyb3ZlcnNpYWwgcGFydHMgZnJvbSAoaG9wZWZ1bGx5KSBub24tY29udHJvdmVy
c2lhbCBvbmVzLgoKLS0tIGEvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZQorKysgYi90b29scy9pbmNs
dWRlL01ha2VmaWxlCkBAIC00LDggKzQsOSBAQCBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1
bGVzLm1rCiAjIFJlbGF0aXZlIHRvICQoWEVOX1JPT1QpL3hlbi94c20vZmxhc2sKIEZMQVNLX0hf
REVQRU5EIDo9IHBvbGljeS9pbml0aWFsX3NpZHMKIAotLlBIT05ZOiBhbGwgYnVpbGQKLWFsbCBi
dWlsZDogeGVuLWZvcmVpZ24geGVuLy5kaXIgeGVuLXhzbS8uZGlyCisuUEhPTlk6IGFsbCBhbGwt
eSBidWlsZAorYWxsIGJ1aWxkOiBhbGwteSB4ZW4tZm9yZWlnbiB4ZW4vLmRpciB4ZW4teHNtLy5k
aXIKK2FsbC15OgogCiAuUEhPTlk6IHhlbi1mb3JlaWduCiB4ZW4tZm9yZWlnbjoKQEAgLTI3LDEw
ICsyOCwxMiBAQCBpZmVxICgkKENPTkZJR19YODYpLHkpCiAJZm9yIGYgaW4gJChmaWx0ZXItb3V0
ICVhdXRvZ2VuLmgsJChwYXRzdWJzdCAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS94ZW4vbGliL3g4
Ni8lLCUsTWFrZWZpbGUgJCh3aWxkY2FyZCAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS94ZW4vbGli
L3g4Ni8qLmgpKSk7IGRvIFwKIAkJbG4gLXNmICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi9s
aWIveDg2LyQkZiB4ZW4vbGliL3g4Ni8kJGY7IFwKIAlkb25lCi0JJChNQUtFKSAtQyB4ZW4vbGli
L3g4NiBhbGwgWEVOX1JPT1Q9JChYRU5fUk9PVCkKIGVuZGlmCiAJdG91Y2ggJEAKIAorYWxsLSQo
Q09ORklHX1g4Nik6IHhlbi8uZGlyCisJJChNQUtFKSAtQyB4ZW4vbGliL3g4NiBhbGwgWEVOX1JP
T1Q9JChYRU5fUk9PVCkKKwogIyBOb3QgeGVuL3hzbSBhcyB0aGF0IGNsYXNoZXMgd2l0aCBsaW5r
IHRvCiAjICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3B1YmxpYy94c20gYWJvdmUuCiB4ZW4teHNt
Ly5kaXI6ICQoWEVOX1JPT1QpL3hlbi94c20vZmxhc2svcG9saWN5L21rZmxhc2suc2ggXAoKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
