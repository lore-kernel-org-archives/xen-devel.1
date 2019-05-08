From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/4] x86: EOI timer corrections / improvements
Date: Wed, 08 May 2019 06:39:08 -0600
Message-ID: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLqt-0003Fv-Gs
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:39:15 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZpcnN0IHBhdGNoIHdhcyBzZW50IG9uIGl0cyBvd24gYmVmb3JlOyB0aGlzIGlzIGEgcGxh
aW4gcmVzZW5kLiBUaGUKb3RoZXJzIGhhdmUgYmVlbiBhZGRlZCB0byBhZGRyZXNzIGF0IGxlYXN0
IHRoZSBtYWpvcml0eSBvZiB0aGUKcXVlc3Rpb25zIHJhaXNlZCBpbgpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDQvbXNnMDA4ODMuaHRt
bAoKMTogZG9uJ3Qga2VlcCBFT0kgdGltZXIgcnVubmluZyB3aXRob3V0IG5lZWQKMjogYmFpbCBl
YXJseSBmcm9tIGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKSB3aGVuIG5vdGhpbmcgaXMgaW4gZmxp
Z2h0CjM6IHJlbGF4IGxvY2tpbmcgaW4gaXJxX2d1ZXN0X2VvaV90aW1lcl9mbigpCjQ6IEFDS1RZ
UEVfTk9ORSBjYW5ub3QgbWFrZSBpdCBpbnRvIGlycV9ndWVzdF9lb2lfdGltZXJfZm4oKQoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
