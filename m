From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xtf: fix cdefs.h conflict with __section
Date: Thu, 22 Feb 2018 05:24:21 -0700
Message-ID: <5A8EC48502000078001AA5E0@prv-mh.provo.novell.com>
References: <20180222120348.46267-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=x7kc=fq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eopvJ-0005hd-Qx
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 12:24:29 +0000
In-Reply-To: <20180222120348.46267-1-roger.pau@citrix.com>
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

Pj4+IE9uIDIyLjAyLjE4IGF0IDEzOjAzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyZWVCU0QgdGhlIGJ1aWxkIGZhaWxzIHdpdGg6Cj4gCj4gL3Jvb3Qvc3JjL3h0Zi9pbmNs
dWRlL3h0Zi9jb21waWxlci5oOjEzOjk6IGVycm9yOiAnX19zZWN0aW9uJyBtYWNybyAKPiByZWRl
ZmluZWQKPiAgICAgICBbLVdlcnJvciwtV21hY3JvLXJlZGVmaW5lZF0KPiAjZGVmaW5lIF9fc2Vj
dGlvbihzKSAgICAgICAgICBfX2F0dHJpYnV0ZV9fKChfX3NlY3Rpb25fXyhzKSkpCj4gICAgICAg
ICBeCj4gL3Vzci9pbmNsdWRlL3N5cy9jZGVmcy5oOjIyOTo5OiBub3RlOiBwcmV2aW91cyBkZWZp
bml0aW9uIGlzIGhlcmUKPiAjZGVmaW5lIF9fc2VjdGlvbih4KSAgICBfX2F0dHJpYnV0ZV9fKChf
X3NlY3Rpb25fXyh4KSkpCj4gICAgICAgICBeCj4gMSBlcnJvciBnZW5lcmF0ZWQuCj4gCj4gT25s
eSBkZWZpbmUgX19zZWN0aW9uIGlmIGl0J3MgdW5kZWZpbmVkIGluIG9yZGVyIHRvIHByZXZlbnQg
Y29uZmxpY3RzLgoKQnV0IHRoZSBhY3R1YWwgYnVnIGlzIHRoYXQgL3Vzci9pbmNsdWRlL3N5cy9j
ZGVmcy5oIGlzIChtYWdpY2FsbHk/KQpiZWluZyBpbmNsdWRlZC4gSnVzdCBsaWtlIHRoZSBoeXBl
cnZpc29yIGJ1aWxkLCB0aGUgeHRmIG9uZSBzaG91bGRuJ3QKcHVsbCBpbiBfYW55XyBleHRlcm5h
bCBoZWFkZXJzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
