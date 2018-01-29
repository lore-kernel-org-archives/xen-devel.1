From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/5] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Mon, 29 Jan 2018 09:45:35 -0700
Message-ID: <5A6F5DBF02000078001A37C5@prv-mh.provo.novell.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=763w=ey=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1egCYv-00086m-2C
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 16:45:41 +0000
In-Reply-To: <20180129122643.13008-4-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE4IGF0IDEzOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2FzbV9kZWZucy5oCj4gQEAgLTE0LDYgKzE0LDkgQEAKPiAgI2luY2x1ZGUgPGFz
bS9hbHRlcm5hdGl2ZS5oPgo+ICAKPiAgI2lmZGVmIF9fQVNTRU1CTFlfXwo+ICsjIGlmbmRlZiBD
T05GSUdfSU5ESVJFQ1RfVEhVTksKPiArIyAgZGVmaW5lIENPTkZJR19JTkRJUkVDVF9USFVOSyAw
Cj4gKyMgZW5kaWYKCldoeSBub3QgYW4gYXNzZW1ibGVyIGVxdWF0ZT8gSXQgaXMgY29tbW9uIHRv
IHVzZSAiI2lmZGVmIENPTkZJR18uLi4iCmlmIHdhbnRpbmcgdG8gdGVzdCBmb3IgYW4gZW5hYmxl
ZCBjb25maWcgb3B0aW9uLCBhbmQgc3VjaCBhIGNoZWNrCndpbGwgZ28gd3Jvbmcgd2l0aCBhIEMg
bGV2ZWwgZGVmaW5lLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
