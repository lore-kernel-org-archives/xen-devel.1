From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Thu, 28 Mar 2019 11:03:45 -0600
Message-ID: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9YRQ-00060O-Aq
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 17:03:48 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVwb3J0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KVGhpcyBpcyBz
dXJlbHkgYSBzdGFibGUgdHJlZSBjYW5kaWRhdGUsIHVubGVzcyBpdCBjb3VsZCBzdGlsbCBtYWtl
IGl0CmludG8gNC4xMiBiZWZvcmUgdGhlIHJlbGVhc2UuCgotLS0gYS94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2
X2VtdWxhdGUuYwpAQCAtMzUxMSw3ICszNTExLDcgQEAgeDg2X2VtdWxhdGUoCiAgICAgfQogCiAg
ICAgLyogV2l0aCBhIG1lbW9yeSBvcGVyYW5kLCBmZXRjaCB0aGUgbWFzayByZWdpc3RlciBpbiB1
c2UgKGlmIGFueSkuICovCi0gICAgaWYgKCBlYS50eXBlID09IE9QX01FTSAmJiBldmV4Lm9wbXNr
ICkKKyAgICBpZiAoIGVhLnR5cGUgPT0gT1BfTUVNICYmIGNwdV9oYXNfYXZ4NTEyZiAmJiBldmV4
Lm9wbXNrICkKICAgICB7CiAgICAgICAgIHVpbnQ4X3QgKnN0YiA9IGdldF9zdHViKHN0dWIpOwog
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
