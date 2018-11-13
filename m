From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/3] x86/HVM: honor r/o p2m types,
 in particular during emulation
Date: Tue, 13 Nov 2018 03:05:15 -0700
Message-ID: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMVZQ-0000li-0n
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:05:20 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogX19odm1fY29weSgpIHNob3VsZCBub3Qgd3JpdGUgdG8gcDJtX2lvcmVxX3NlcnZlciBwYWdl
cwoyOiBtYWtlIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkgaG9ub3IgcDJtX2lvcmVxX3NlcnZl
cgozOiBodm1lbXVsX2NtcHhjaGcoKSBzaG91bGQgYWxzbyB1c2Uga25vd25fZ2xhKCkKCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
