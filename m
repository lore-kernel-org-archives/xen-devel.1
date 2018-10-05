From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: don't build guest-walk code without HVM
 and SHADOW_PAGING
Date: Fri, 05 Oct 2018 04:20:53 -0600
Message-ID: <5BB73B0502000078001EEBB6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8NE8-00008X-O6
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 10:20:56 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SXQncyBkZWFkIGNvZGUgaW4gdGhhdCBjYXNlLgoKV2UgY291bGQgZ28gZnVydGhlciwgYXMgd2Ug
ZG9uJ3QgcmVhbGx5IG5lZWQgdGhlIDItIGFuZCAzLWxldmVsIHdhbGsKY29kZSBpbiBQViBtb2Rl
LCBidXQgdG8gZHJvcCB0aGVpciBjb21waWxhdGlvbiByZXF1aXJlcyBxdWl0ZSBhIGJpdCBvZgpk
aXNlbnRhbmdsaW5nIG9mIHNoYWRvdyBtb2RlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUK
KysrIGIveGVuL2FyY2gveDg2L21tL01ha2VmaWxlCkBAIC0yLDkgKzIsOCBAQCBzdWJkaXIteSAr
PSBzaGFkb3cKIHN1YmRpci0kKENPTkZJR19IVk0pICs9IGhhcAogCiBvYmotJChDT05GSUdfSFZN
KSArPSBhbHRwMm0ubwotb2JqLXkgKz0gZ3Vlc3Rfd2Fsa18yLm8KLW9iai15ICs9IGd1ZXN0X3dh
bGtfMy5vCi1vYmoteSArPSBndWVzdF93YWxrXzQubworb2JqLSQoQ09ORklHX0hWTSkgKz0gZ3Vl
c3Rfd2Fsa18yLm8gZ3Vlc3Rfd2Fsa18zLm8gZ3Vlc3Rfd2Fsa180Lm8KK29iai0kKENPTkZJR19T
SEFET1dfUEFHSU5HKSArPSBndWVzdF93YWxrXzIubyBndWVzdF93YWxrXzMubyBndWVzdF93YWxr
XzQubwogb2JqLSQoQ09ORklHX01FTV9BQ0NFU1MpICs9IG1lbV9hY2Nlc3Mubwogb2JqLXkgKz0g
bWVtX3BhZ2luZy5vCiBvYmoteSArPSBtZW1fc2hhcmluZy5vCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
