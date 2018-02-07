From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/4] firmware/shim: fix Xen tree setup
Date: Wed, 07 Feb 2018 07:57:38 -0700
Message-ID: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejRAL-0007fa-4o
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 14:57:41 +0000
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

VGhpcyBpcyBhIHNwbGl0IG9mIHRoZSBSRkMgd2l0aCB0aGUgbWtkaXIgZml4IGFkZGVkLCBidXQg
d2l0aCB0aGUgc3ltbGluawpoYW5kbGluZyBsZWZ0IG9mZiBmb3Igbm93IChJJ2xsIG5lZWQgc29t
ZSBtb3JlIHRpbWUgdG8gcHJvcGVybHkgZGVhbCB3aXRoCnRoYXQgd2l0aG91dCB1c2luZyAteHR5
cGUsIGlkZWFsbHkgdHJlYXRpbmcgYWJzb2x1dGUgYW5kIHJlbGF0aXZlIG9uZXMKZGlmZmVyZW50
bHkpLgoKMTogY29ycmVjdGx5IGhhbmRsZSBlcnJvcnMgZHVyaW5nIFhlbiB0cmVlIHNldHVwCjI6
IGJldHRlciBmaWx0ZXJpbmcgb2YgZGVwZW5kZW5jeSBmaWxlcyBkdXJpbmcgWGVuIHRyZWUgc2V0
dXAKMzogYmV0dGVyIGZpbHRlcmluZyBvZiBpbnRlcm1lZGlhdGUgZmlsZXMgZHVyaW5nIFhlbiB0
cmVlIHNldHVwCjQ6IGF2b2lkIG1rZGlyIGVycm9yIGR1cmluZyBYZW4gdHJlZSBzZXR1cAoKU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
