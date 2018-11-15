From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V6 3/4] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Thu, 15 Nov 2018 03:56:53 -0700
Message-ID: <5BED50F502000078001FC510@prv1-mh.provo.novell.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wsre=n2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNFKT-00054f-8P
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 10:56:57 +0000
In-Reply-To: <1542228002-21075-4-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDIxOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21t
L3AybS5jCj4gQEAgLTIyODIsNiArMjI4MiwzNCBAQCBib29sX3QgcDJtX2FsdHAybV9sYXp5X2Nv
cHkoc3RydWN0IHZjcHUgKnYsIHBhZGRyX3QgZ3BhLAo+ICAgICAgcmV0dXJuIDE7Cj4gIH0KPiAg
Cj4gK3N0YXRpYyB2b2lkIHAybV9yZXNldF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGlkeCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHJlc2V0X3Jl
bWFwcGVkLCBib29sIGZyZWVfbG9nZGlydHlfcmFuZ2VzKQoKRXNwZWNpYWxseSB0aGUgY2FsbCBz
aXRlcyBhcmUgcXVpdGUgdWdseSB0byByZWFkIHdpdGggdHdvIGJvb2xlYW5zIGxpa2UKdGhlc2Uu
IERpZCB5b3UgY29uc2lkZXIgaW50cm9kdWNpbmcgYW4gdW5zaWduZWQgaW50IGZsYWdzIHBhcmFt
ZXRlcgppbnN0ZWFkLCB3aXRoIHN1aXRhYmxlIHN5bWJvbHMgY29uc3RhbnRzICNkZWZpbmUtZCB0
byBtYWtlIHZpc2libGUKYXQgdGhlIGNhbGwgc2l0ZXMgd2hhdCBiZWhhdmlvciBpcyB3YW50ZWQ/
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
