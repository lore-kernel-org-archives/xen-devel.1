From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/cpuid: add missing PCLMULQDQ dependency
Date: Fri, 22 Feb 2019 09:10:24 -0700
Message-ID: <5C701EF0020000780021951E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxDP9-0007P7-4f
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 16:10:27 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2Ugd2UgY2FuJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIHNldHRsZSBvdXIgZGlzY3Vzc2lvbiBm
b3IgdGhlIHdpZGVyCmFkanVzdG1lbnQgcHJldmlvdXNseSBwb3N0ZWQsIGxldCdzIGF0IGxlYXN0
IGFkZCB0aGUgbWlzc2luZyBkZXBlbmRlbmN5CmZvciA0LjEyLiBJJ20gbm90IGNvbnZpbmNlZCB0
aG91Z2ggdGhhdCBhdHRhY2hpbmcgaXQgdG8gU1NFIGlzIGNvcnJlY3QuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vdG9vbHMvZ2VuLWNw
dWlkLnB5CisrKyBiL3hlbi90b29scy9nZW4tY3B1aWQucHkKQEAgLTE5Nyw3ICsxOTcsNyBAQCBk
ZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgogICAgICAgICAjICVYTU0gc3VwcG9ydCwgd2l0aG91
dCBzcGVjaWZpYyBpbnRlci1kZXBlbmRlbmNpZXMuICBBZGRpdGlvbmFsbHkKICAgICAgICAgIyBB
TUQgaGFzIGEgc3BlY2lhbCBtaXMtYWxpZ25tZW50IHN1Yi1tb2RlLgogICAgICAgICBTU0U6IFtT
U0UyLCBTU0UzLCBTU1NFMywgU1NFNEEsIE1JU0FMSUdOU1NFLAotICAgICAgICAgICAgICBBRVNO
SSwgU0hBXSwKKyAgICAgICAgICAgICAgQUVTTkksIFBDTE1VTFFEUSwgU0hBXSwKIAogICAgICAg
ICAjIFNTRTIgd2FzIHJlLXNwZWNpZmllZCBhcyBjb3JlIGluc3RydWN0aW9ucyBmb3IgNjRiaXQu
CiAgICAgICAgIFNTRTI6IFtMTV0sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
