From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] dom0/pvh: change the order of the
 MMCFG initialization
Date: Wed, 08 Aug 2018 06:35:47 -0600
Message-ID: <5B6AE3A302000078001DC0B1@prv1-mh.provo.novell.com>
References: <20180808100747.19464-1-roger.pau@citrix.com>
 <20180808100747.19464-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnNgu-0007KI-0V
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 12:35:52 +0000
In-Reply-To: <20180808100747.19464-4-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA4LjE4IGF0IDEyOjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNvIGl0J3MgZG9uZSBiZWZvcmUgdGhlIGlvbW11IGlzIGluaXRpYWxpemVkLiBUaGlzIGlzIHJl
cXVpcmVkIGluCj4gb3JkZXIgdG8gYmUgYWJsZSB0byBmZXRjaCB0aGUgTU1DRkcgcmVnaW9ucyBm
cm9tIHRoZSBkb21haW4gc3RydWN0LgoKSXMgdGhpcyBhIHVzZWZ1bCBjaGFuZ2UgdG8gbWFrZT8g
UmVnaW9ucyBub3QgcmVwb3J0ZWQgdGhyb3VnaCB0aGUgTUNGRwp0YWJsZSB3aWxsIG5lZWQgcHVu
Y2hpbmcgaG9sZXMgYW55d2F5LCBzbyB3aHkgbm90IHB1bmNoIGhvbGVzIHVuaWZvcm1seQppbiBh
bGwgY2FzZXMsIGFsbG93aW5nIHRoZSBob2xlIHB1bmNoaW5nIGNvZGUgdG8gYmUgdGVzdGVkIGV2
ZW4gb24gc3lzdGVtcwp3aXRob3V0IG5vbi1ib290LXRpbWUtYXZhaWxhYmxlIHJlZ2lvbnM/CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
