From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 1/2] firmware/shim: better filtering of
 dependency files during Xen tree setup
Date: Wed, 28 Feb 2018 04:34:58 -0700
Message-ID: <5A96A1F202000078001ACAB2@prv-mh.provo.novell.com>
References: <5A96A0DA02000078001ACA99@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er00k-0001kw-Sh
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:35:02 +0000
In-Reply-To: <5A96A0DA02000078001ACA99@prv-mh.provo.novell.com>
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
eSBoYXZlIC4qLmQKYW5kIC4qLmQyIGZpbGVzIChub3RlIGFsc28gdGhlIGxlYWRpbmcgZG90KS4g
QWxzbyBzd2l0Y2ggdG8gcGFzc2luZwotbmFtZSBpbnN0ZWFkIG9mIC1wYXRoIHRvIGZpbmQgLSB0
aGF0J3MgYSByZXF1aXJlbWVudCBmb3IgLiouZCBldCBhbCB0bwp3b3JrLCBidXQgd291bGQgcHJv
YmFibHkgaGF2ZSBiZWVuIGJldHRlciBmcm9tIHRoZSBiZWdpbm5pbmcuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogVXNlIC1uYW1lIGluc3Rl
YWQgb2YgLXBhdGguCgotLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCisrKyBi
L3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKQEAgLTI2LDcgKzI2LDcgQEAgbGlua2Zh
cm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQX0ZJTEVTKQogCSQoZm9yZWFjaCBkLCAkKExJTktf
RElSUyksIFwKIAkJKGNkICQoWEVOX1JPT1QpOyBcCiAJCSBmaW5kICQoZCkgISAtdHlwZSBsIC10
eXBlIGYgXAotCQkgJChhZGRwcmVmaXggISAtcGF0aCAsICcqLltvZGExXScgJyouZFsxMl0nKSkg
XAorCQkgJChhZGRwcmVmaXggISAtbmFtZSAsICcqLltvYTFdJyAnLiouZCcgJy4qLmQyJykpIFwK
IAkJID4+IGxpbmtmYXJtLnN0YW1wLnRtcCA7ICkgXAogCSQoZm9yZWFjaCBmLCAkKExJTktfRklM
RVMpLCBcCiAJCWVjaG8gJChmKSA+PiBsaW5rZmFybS5zdGFtcC50bXAgOykKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
