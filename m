From: George Dunlap <george.dunlap@citrix.com>
Subject: [RFC PATCH 0/3] vcpu migration improvements
Date: Wed, 11 Apr 2018 13:25:15 +0100
Message-ID: <20180411122518.26270-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=igzd=ha=citrix.com=prvs=6320b6f89=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f6EoW-0000vB-QV
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 12:25:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

U29tZSBjb21waWxlLXRlc3RlZC1vbmx5IHNrZXRjaGVzIG9mIHdoYXQgSSdtIHRhbGtpbmcgYWJv
dXQuICBMZXQgbWUKa25vdyB3aGF0IHlvdSB0aGluay4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
