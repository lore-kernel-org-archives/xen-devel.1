From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] guest/pvh: fixes for idle memory scrubbing
Date: Fri, 9 Nov 2018 18:22:48 +0100
Message-ID: <20181109172250.12894-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxsn=nu=citrix.com=prvs=84405ec53=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gLAUs-0004SQ-79
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 17:23:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgcGF0Y2ggdG8gcGVyZm9ybSBtZW1vcnkgc2NydWJiaW5nIGJ5IHRoZSBpZGxl
IENQVXMgaGFzIHJldmVhbGVkIHR3bwpsYXRlbnQgYnVncyB3aGVuIHJ1bm5pbmcgWGVuIGFzIGEg
UFZIIGd1ZXN0IHdoaWNoIHRoaXMgc2VyaWVzIGF0dGVtcHRzCnRvIGZpeC4KClRoaXMgc2hvdWxk
IGFsbG93IHRoZSBQViBzaGltIHRvIGJlIGZ1bmN0aW9uYWwgYWdhaW4uIFRoZSBzZXJpZXMgY2Fu
IGJlCmZvdW5kIGF0OgoKZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdp
dCBmaXhfbWVtb3J5X3NjcnViX3YxCgpSb2dlciBQYXUgTW9ubmUgKDIpOgogIGd1ZXN0L3B2aDog
Zml4IGhhbmRsaW5nIG9mIG11bHRpYm9vdCBpbmZvIGFuZCBtb2R1bGUgbGlzdAogIGd1ZXN0L3B2
aDogc3BlY2lhbCBjYXNlIHRoZSBsb3cgMU1CCgogeGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290
LmMgICAgICAgIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAg
ICAgICAgICAgICAgICAgICB8IDEzICsrKysrLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5j
ICAgICAgICAgICAgICAgICB8ICA3ICsrKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
cHZoLWJvb3QuaCB8ICA1ICsrLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDI0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
