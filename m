From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 0/2] x86: fix build with gcc9
Date: Fri, 15 Mar 2019 06:33:25 -0600
Message-ID: <5C8B9B95020000780021F406@prv1-mh.provo.novell.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4m1g-0001ug-Bv
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 12:33:28 +0000
In-Reply-To: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Charles Arnold <CARNOLD@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE5IGF0IDExOjIzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFNl
dmVyYWwgYnVpbGQgaXNzdWVzIChuZXcgd2FybmluZ3MsIGNhdXNpbmcgdGhlIGJ1aWxkIHRvIGZh
aWwgZHVlIHRvCj4gLVdlcnJvcikgaGF2ZSBiZWVuIGZvdW5kLiBUaGUgdHdvIGNoYW5nZXMgaGVy
ZSBhZGRyZXNzIHRoZSBvbmVzCj4gSSBjYW4gYWN0dWFsbHkgcmVwcm87IHRoZXJlIGFyZSBhIGZl
dyBtb3JlIHJlbGF0ZWQgdG8KPiAtV2FkZHJlc3Mtb2YtcGFja2VkLW1lbWJlciB3aGljaCBJIGhh
dmVuJ3QgYmVlbiBhYmxlIHRvIHNlZQo+IG15c2VsZiwgYW5kIGhlbmNlIGZvciBub3cgSSdtIHVu
YWJsZSB0byBzb3J0IG91dCBhIHByb3BlciBmaXggLwo+IHdvcmthcm91bmQgZm9yIHRoZW0uCj4g
Cj4gRGVzcGl0ZSB0aGlzIGNvbWluZyBsYXRlLCBJIHRoaW5rIHRoaXMgaXMgYSB3b3J0aHdoaWxl
IGNoYW5nZSBmb3IgNC4xMgo+IHdpdGggcHJldHR5IGxvdyByaXNrLgo+IAo+IDE6IGU4MjA6IGZp
eCBidWlsZCB3aXRoIGdjYzkKPiAyOiBtdHJyOiBmaXggYnVpbGQgd2l0aCBnY2M5Cj4gCj4gSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
