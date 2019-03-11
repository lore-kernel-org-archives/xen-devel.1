From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/paging: paging_set_allocation() is init-only
Date: Mon, 11 Mar 2019 10:38:54 -0600
Message-ID: <5C868F1E020000780021D5C1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3Nx8-0008Oh-U4
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:39:02 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBuZWVkZWQgZm9yIERvbTAgY3JlYXRpb24gb25seSwgdGhlcmVmb3JlIGl0IGdldHMg
YWRkaXRpb25hbGx5CmZyYW1lZCBieSBhbiAjaWZkZWYuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCkBAIC05NTAsNyArOTUwLDkgQEAgaW50IHBh
Z2luZ193cml0ZV9wMm1fZW50cnkoc3RydWN0IHAybV9kbwogICAgIHJldHVybiByYzsKIH0KIAot
aW50IHBhZ2luZ19zZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQg
cGFnZXMsIGJvb2wgKnByZWVtcHRlZCkKKyNpZmRlZiBDT05GSUdfSFZNCitpbnQgX19pbml0IHBh
Z2luZ19zZXRfYWxsb2NhdGlvbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgcGFnZXMs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sICpwcmVlbXB0ZWQpCiB7CiAg
ICAgaW50IHJjOwogCkBAIC05NjUsNiArOTY3LDcgQEAgaW50IHBhZ2luZ19zZXRfYWxsb2NhdGlv
bihzdHJ1Y3QgZG9tYWluCiAKICAgICByZXR1cm4gcmM7CiB9CisjZW5kaWYKIAogLyoKICAqIExv
Y2FsIHZhcmlhYmxlczoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
