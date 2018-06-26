From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: correctly set nonlazy_xstate_used when
 loading full state
Date: Tue, 26 Jun 2018 08:57:01 +0100
Message-ID: <20180626075701.ekl3sifuwvre7mib@citrix.com>
References: <5B31EF8002000078001CDD83@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=auxb=jm=citrix.com=prvs=708bdb1b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fXiqX-0007Zh-Cz
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 07:57:05 +0000
Content-Disposition: inline
In-Reply-To: <5B31EF8002000078001CDD83@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDE6NDc6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gdGhpcyBjYXNlLCBqdXN0IGxpa2UgeGNyMF9hY2N1bSwgbm9ubGF6eV94c3RhdGVf
dXNlZCBzaG91bGQgYWx3YXlzIGJlCj4gc2V0IHRvIHRoZSBpbnRlbmRlZCBuZXcgdmFsdWUsIHJh
dGhlciB0aGFuIHBvc3NpYmx5IGxlYXZpbmcgdGhlIGZsYWcgc2V0Cj4gZnJvbSBhIHByaW9yIHN0
YXRlIGxvYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKV2h5PyBMb29raW5nIGF0IHRoZSBjb2RlIGl0IGlzIGluIGZhY3QgdXNlZCBhcyBhIGJv
b2xlYW4uCgpBbHNvIHlvdSBzZWVtIHRvIGhhdmUgbWlzc2VkIGh2bS9zdm0vc3ZtLmMgYW5kIHhz
dGF0ZS5jPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
