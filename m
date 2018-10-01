From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/4] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Mon, 01 Oct 2018 06:02:46 -0600
Message-ID: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ngkg=mn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g6wub-0004Mc-NP
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 12:02:53 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG9yaWdpbmFsIHBhdGNoIHVuZGVyIHRoaXMgdGl0bGUgYXMgd2VsbCBhcyB0aGUgaW52b2x2
ZWQgdmFyaWFibGVzCndlcmUgc3BsaXQgdXAgZm9yIHYyLCBob3BlZnVsbHkgYWRkcmVzc2luZyB0
aGUgbWFpbiAoeWV0IHZhZ3VlKQpyZXZpZXcgY29uY2VybnMgb24gdjEuCgoxOiBzcGxpdCBvcHRf
eHB0aQoyOiBzcGxpdCBvcHRfcHZfbDF0ZgozOiBmaXggInhwdGk9IiBhbmQgInB2LWwxdGY9IiB5
ZXQgYWdhaW4KNDogc3VwcG9ydCAicHYtbDF0Zj1kZWZhdWx0IgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
