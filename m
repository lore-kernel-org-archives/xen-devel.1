From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/4] firmware/shim: better filtering of
 dependency files during Xen tree setup
Date: Wed, 07 Feb 2018 08:07:40 -0700
Message-ID: <5A7B244C02000078001A6145@prv-mh.provo.novell.com>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejRKA-0000BL-GJ
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 15:07:50 +0000
In-Reply-To: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBoYXZlIG5vIGlkZWEgd2hhdCAqLmQxIGlzIHN1cHBvc2VkIHRvIHJlZmVyIHRvIC0gd2Ugb25s
eSBoYXZlIC4qLmQKYW5kIC4qLmQyIGZpbGVzIChub3RlIGFsc28gdGhlIGxlYWRpbmcgZG90KS4K
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rv
b2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKKysrIGIvdG9vbHMvZmlybXdhcmUveGVuLWRp
ci9NYWtlZmlsZQpAQCAtMjYsNyArMjYsNyBAQCBsaW5rZmFybS5zdGFtcDogJChERVBfRElSUykg
JChERVBfRklMRVMpCiAJJChmb3JlYWNoIGQsICQoTElOS19ESVJTKSwgXAogCQkoY2QgJChYRU5f
Uk9PVCk7IFwKIAkJIGZpbmQgJChkKSAhIC10eXBlIGwgLXR5cGUgZiBcCi0JCSAkKGFkZHByZWZp
eCAhIC1wYXRoICwgJyouW29kYTFdJyAnKi5kWzEyXScpKSBcCisJCSAkKGFkZHByZWZpeCAhIC1w
YXRoICwgJyouW29hMV0nICcuKi5kJyAnLiouZDInKSkgXAogCQkgPj4gbGlua2Zhcm0uc3RhbXAu
dG1wIDsgKSBcCiAJJChmb3JlYWNoIGYsICQoTElOS19GSUxFUyksIFwKIAkJZWNobyAkKGYpID4+
IGxpbmtmYXJtLnN0YW1wLnRtcCA7KQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
