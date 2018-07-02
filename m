From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/Xen: mark xen_setup_gdt() __init
Date: Mon, 2 Jul 2018 15:54:45 +0200
Message-ID: <e46c5c38-fc8e-13a9-1dd7-8e9990196cb7@suse.com>
References: <5B30C51902000078001CD6F5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=37lk=js=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fZzHz-00085l-F1
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 13:54:47 +0000
In-Reply-To: <5B30C51902000078001CD6F5@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDYvMTggMTI6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEl0cyBvbmx5IGNhbGxlciBp
cyBfX2luaXQsIHNvIHRvIGF2b2lkIHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZ3Mgd2hlbiBhCj4g
Y29tcGlsZXIgZGVjaWRlcyB0byBub3QgaW5saW5lIHRoZSBmdW5jdGlvbiBtYXJrZSB0aGlzIGZ1
bmN0aW9uIHNvIGFzCj4gd2VsbC4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gbWFrZSB0
aGUgZnVuY3Rpb24gYWN0dWFsbHkgdXNlIGl0cwo+IGFyZ3VtZW50OiBUaGUgc29sZSBjYWxsZXIg
cGFzc2VzIGluIHplcm8gYW55d2F5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
