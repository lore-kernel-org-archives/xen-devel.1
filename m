From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Fri, 20 Apr 2018 09:03:38 -0600
Message-ID: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9XZX-0001nO-JY
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 15:03:35 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

aHZtX2RvbWFpbl9pbml0aWFsaXNlKCkgbWF5IGNhbGwgdGhpcyB3aXRoIG5yIGJlaW5nIHplcm8s
IHdoaWNoIHRyaWdnZXJzCnRoZSAiZG9lcyBub3QgY3Jvc3MgTDMgYm91bmRhcnkiIGNoZWNrLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTU0NzUsNyArNTQ3NSw3
IEBAIHZvaWQgZGVzdHJveV9wZXJkb21haW5fbWFwcGluZyhzdHJ1Y3QgZG8KIAogICAgIEFTU0VS
VCh2YSA+PSBQRVJET01BSU5fVklSVF9TVEFSVCAmJgogICAgICAgICAgICB2YSA8IFBFUkRPTUFJ
Tl9WSVJUX1NMT1QoUEVSRE9NQUlOX1NMT1RTKSk7Ci0gICAgQVNTRVJUKCFsM190YWJsZV9vZmZz
ZXQodmEgXiAodmEgKyBuciAqIFBBR0VfU0laRSAtIDEpKSk7CisgICAgQVNTRVJUKCFuciB8fCAh
bDNfdGFibGVfb2Zmc2V0KHZhIF4gKHZhICsgbnIgKiBQQUdFX1NJWkUgLSAxKSkpOwogCiAgICAg
aWYgKCAhZC0+YXJjaC5wZXJkb21haW5fbDNfcGcgKQogICAgICAgICByZXR1cm47CgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
