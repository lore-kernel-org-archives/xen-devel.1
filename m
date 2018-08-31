From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] tools/tests: allow depriv-fd-checker to build
 with really old Linux headers
Date: Fri, 31 Aug 2018 01:02:42 -0600
Message-ID: <5B88E81202000078001E3BEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ynna=lo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvdS9-00011N-U4
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 07:02:45 +0000
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

QXNzdW1pbmcgaXQgd2FzIGludGVudGlvbmFsIGZvciB0aGlzIHRlc3QgdXRpbGl0eSwgb3RoZXIg
dGhhbiBtb3N0IG90aGVyCm9uZXMsIHRvIGFsd2F5cyBiZSBidWlsdCwgSSB0aGluayBpdCB3b3Vs
ZCBiZSBuaWNlIGlmIGl0IGRpZG4ndCBmYWlsIHRvCmJ1aWxkIG9uIHJlYWxseSBvbGQgZGlzdHJv
cyBqdXN0IGJlY2F1c2Ugb2YgdGhlIGxhY2sgb2YgYSBUVU5HRVRJRkYKZGVmaW5pdGlvbi4KClNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rvb2xz
L3Rlc3RzL2RlcHJpdi9kZXByaXYtZmQtY2hlY2tlci5jCisrKyBiL3Rvb2xzL3Rlc3RzL2RlcHJp
di9kZXByaXYtZmQtY2hlY2tlci5jCkBAIC0zMzAsNiArMzMwLDkgQEAgc3RhdGljIHZvaWQgY2hl
Y2tfYXBwZW5kb25seSh2b2lkKSB7CiAjaW5jbHVkZSA8c3lzL3NvY2tldC5oPgogI2luY2x1ZGUg
PGxpbnV4L2lmLmg+CiAjaW5jbHVkZSA8bGludXgvaWZfdHVuLmg+CisjaWZuZGVmIFRVTkdFVElG
RgorI2RlZmluZSBUVU5HRVRJRkYgX0lPUignVCcsIDIxMCwgdW5zaWduZWQgaW50KQorI2VuZGlm
CiAKIC8qIGxpbnV4IHR1biAqLwogCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
