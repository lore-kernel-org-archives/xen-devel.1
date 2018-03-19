From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: fix null sched build with debug=n
Date: Mon, 19 Mar 2018 03:40:04 -0600
Message-ID: <5AAF938402000078001B34E9@prv-mh.provo.novell.com>
References: <20180319022038.30100-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180319022038.30100-1-cardoe@cardoe.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE4IGF0IDAzOjIwLCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+IFRo
ZSBudWxsX2RvbSgpIHN0YXRpYyBpbmxpbmUgaXMganVzdCB1c2VkIHdoZW4gZGVidWc9eSBzbyBp
dCByZXN1bHRzIGluCj4gYSBlcnJvciB3aXRoIHRoZSBkZWZhdWx0IENGTEFHUyBhbmQgZGVidWc9
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+
Cj4gLS0tCj4gc2NoZWRfbnVsbC5jOjEyMzozMjogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnbnVs
bF9kb20nIAo+IFstV2Vycm9yLC1XdW51c2VkLWZ1bmN0aW9uXQoKU2luY2UgZ2VuZXJhbGx5IG9u
bHkgbm9uLWlubGluZSBmdW5jdGlvbnMgZ2V0IHdhcm5lZCBhYm91dCBieSBnY2MKKGFmYWlrKSwg
SSdtIHdvbmRlcmluZzogSXMgdGhpcyB3aXRoIGNsYW5nPyBPciB3aXRoIHNvbWUgc3BlY2lmaWMs
Cm5vbi1zdGFuZGFyZCB2ZXJzaW9uIG9mIGdjYz8gQWRkaW5nIHN1Y2ggc3BlY2lmaWNzIHRvIHRo
ZSBjb21taXQKbWVzc2FnZSB3b3VsZCBnZW5lcmFsbHkgYmUgYWR2aXNhYmxlIChhbmQgaW5kZWVk
IEknbSBub3QgcmVhbGx5CmhhcHB5IHRvIHNlZSBzdWNoIGFuICNpZmRlZiBhZGRlZCwgYnV0IHRo
ZW4gYWdhaW4gSSdtIG5vdCB0aGUKbWFpbnRhaW5lciBvZiB0aGF0IGNvZGUpLgoKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
