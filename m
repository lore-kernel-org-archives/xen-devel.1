From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2] x86: fix build with gcc9
Date: Thu, 07 Mar 2019 03:23:44 -0700
Message-ID: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1qBn-0008GW-If
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:23:47 +0000
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
Cc: Charles Arnold <CARNOLD@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2V2ZXJhbCBidWlsZCBpc3N1ZXMgKG5ldyB3YXJuaW5ncywgY2F1c2luZyB0aGUgYnVpbGQgdG8g
ZmFpbCBkdWUgdG8KLVdlcnJvcikgaGF2ZSBiZWVuIGZvdW5kLiBUaGUgdHdvIGNoYW5nZXMgaGVy
ZSBhZGRyZXNzIHRoZSBvbmVzCkkgY2FuIGFjdHVhbGx5IHJlcHJvOyB0aGVyZSBhcmUgYSBmZXcg
bW9yZSByZWxhdGVkIHRvCi1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyIHdoaWNoIEkgaGF2ZW4n
dCBiZWVuIGFibGUgdG8gc2VlCm15c2VsZiwgYW5kIGhlbmNlIGZvciBub3cgSSdtIHVuYWJsZSB0
byBzb3J0IG91dCBhIHByb3BlciBmaXggLwp3b3JrYXJvdW5kIGZvciB0aGVtLgoKRGVzcGl0ZSB0
aGlzIGNvbWluZyBsYXRlLCBJIHRoaW5rIHRoaXMgaXMgYSB3b3J0aHdoaWxlIGNoYW5nZSBmb3Ig
NC4xMgp3aXRoIHByZXR0eSBsb3cgcmlzay4KCjE6IGU4MjA6IGZpeCBidWlsZCB3aXRoIGdjYzkK
MjogbXRycjogZml4IGJ1aWxkIHdpdGggZ2NjOQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
