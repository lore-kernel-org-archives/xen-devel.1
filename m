From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vcpu: Remove struct vcpu allocation
 restriction for !CONFIG_SHADOW_PAGING
Date: Mon, 05 Nov 2018 01:50:56 -0700
Message-ID: <5BE0047002000078001F7D25@prv1-mh.provo.novell.com>
References: <1541181240-30757-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541181240-30757-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjExLjE4IGF0IDE4OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2Rv
bWFpbi5jCj4gQEAgLTMxMSw4ICszMTEsMTEgQEAgc3RydWN0IHZjcHUgKmFsbG9jX3ZjcHVfc3Ry
dWN0KHZvaWQpCj4gICAgICAgKiBtYXkgcmVxdWlyZSB0aGF0IHRoZSBzaGFkb3cgQ1IzIHBvaW50
cyBiZWxvdyA0R0IsIGFuZCBoZW5jZSB0aGUgd2hvbGUKPiAgICAgICAqIHN0cnVjdHVyZSBtdXN0
IHNhdGlzZnkgdGhpcyByZXN0cmljdGlvbi4gVGh1cyB3ZSBzcGVjaWZ5IE1FTUZfYml0cygzMiku
Cj4gICAgICAgKi8KPiArICAgIHVuc2lnbmVkIGludCBtZW1mbGFncyA9Cj4gKyAgICAgICAgSVNf
RU5BQkxFRChDT05GSUdfU0hBRE9XX1BBR0lORykgPyBNRU1GX2JpdHMoMzIpIDogMDsKCkFjY29y
ZGluZyB0byB0aGUgY29tbWVudCwgQ09ORklHX0hWTSAob3IgcGVyaGFwcyBldmVuCmlzX2h2bV9k
b21haW4oKSwgaWYgb25seSB0aGUgY29ycmVzcG9uZGluZyBzdHJ1Y3QgZG9tYWluIHdhcwphdmFp
bGFibGUgaGVyZSkgY291bGQgYmUgdGFrZW4gaW50byBjb25zaWRlcmF0aW9uIGF0IHRoZSBzYW1l
CnRpbWUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
