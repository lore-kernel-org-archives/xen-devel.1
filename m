From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/2] x86/HVM: attempts to emulate FPU insns need
 to set fpu_initialised
Date: Fri, 15 Jun 2018 02:58:43 -0600
Message-ID: <5B237FC302000078001CB84E@prv1-mh.provo.novell.com>
References: <5B237D0B02000078001CB837@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9pmr=jb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTkZD-0000DX-5J
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 08:58:47 +0000
In-Reply-To: <5B237D0B02000078001CB837@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TXkgb3JpZ2luYWwgd2F5IG9mIHRoaW5raW5nIGhlcmUgd2FzIHRoYXQgdGhpcyB3b3VsZCBiZSBz
ZXQgYW55d2F5IGF0CnRoZSBwb2ludCBzdGF0ZSBnZXRzIHJlbG9hZGVkIGFmdGVyIHRoZSBhZGp1
c3RtZW50cyBodm1lbXVsX3B1dF9mcHUoKQpkb2VzLCBidXQgdGhlIGZsYWcgc2hvdWxkIGFscmVh
ZHkgYmUgc2V0IGJlZm9yZSB0aGF0IC0gYWZ0ZXIgYWxsIHRoZQpndWVzdCBtYXkgbmV2ZXIgYWdh
aW4gdG91Y2ggdGhlIEZQVSBiZWZvcmUgZS5nLiBnZXR0aW5nIG1pZ3JhdGVkL3NhdmVkLgoKU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKQEAg
LTIwNTMsNiArMjA1Myw3IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9nZXRfZnB1KAogICAgICAgICAg
KiBtYXNraW5nIG9mIGFsbCBleGNlcHRpb25zIGJ5IEZOU1RFTlYuKQogICAgICAgICAgKi8KICAg
ICAgICAgc2F2ZV9mcHVfZW5hYmxlKCk7CisgICAgICAgIGN1cnItPmZwdV9pbml0aWFsaXNlZCA9
IHRydWU7CiAgICAgICAgIGN1cnItPmZwdV9kaXJ0aWVkID0gdHJ1ZTsKICAgICAgICAgaWYgKCAo
ZnB1X2N0eHQtPmZjdyAmIDB4M2YpICE9IDB4M2YgKQogICAgICAgICB7CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
