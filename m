From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: 92a0f81d89 ("x86/cpu_entry_area: Move it out of the
 fixmap"): BUG: kernel hang in boot stage
Date: Sat, 23 Dec 2017 19:40:34 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1712231939070.1853__1749.73552716455$1514054398$gmane$org@nanos>
References: <5a3e8fc0.twXCoyu5pJQz+3SI%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xbeh=dt=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1eSoj5-0003ma-QJ
 for xen-devel@lists.xenproject.org; Sat, 23 Dec 2017 18:40:51 +0000
In-Reply-To: <5a3e8fc0.twXCoyu5pJQz+3SI%fengguang.wu@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: kernel test robot <fengguang.wu@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, wfg@linux.intel.com, xen-devel@lists.xenproject.org, LKP <lkp@01.org>, Ingo Molnar <mingo@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCAyNCBEZWMgMjAxNywga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6Cgo+IEdyZWV0aW5n
cywKPiAKPiAwZGF5IGtlcm5lbCB0ZXN0aW5nIHJvYm90IGdvdCB0aGUgYmVsb3cgZG1lc2cgYW5k
IHRoZSBmaXJzdCBiYWQgY29tbWl0IGlzCj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQgV0lQLng4Ni9wdGkKPiAKPiBjb21taXQg
OTJhMGY4MWQ4OTU3MWUzZTg3NTkzNjZlMDUwZWUwNWNjNTQ1ZWY5OQo+IEF1dGhvcjogICAgIFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IEF1dGhvckRhdGU6IFdlZCBEZWMg
MjAgMTg6NTE6MzEgMjAxNyArMDEwMAo+IENvbW1pdDogICAgIEluZ28gTW9sbmFyIDxtaW5nb0Br
ZXJuZWwub3JnPgo+IENvbW1pdERhdGU6IEZyaSBEZWMgMjIgMjA6MTM6MDUgMjAxNyArMDEwMAo+
IAo+ICAgICB4ODYvY3B1X2VudHJ5X2FyZWE6IE1vdmUgaXQgb3V0IG9mIHRoZSBmaXhtYXAKClll
cywgSSdtIGFuIGlkaW90LgoKICAgICBmb3IgKDsgc3RhcnQgPCBlbmQ7IHN0YXJ0ICs9IFBNRF9T
SVpFKQoKd2hpY2ggd29ya3MgZmluZSB3aGVuIHN0YXJ0ICsgUE1EX1NJWkUgZG9lcyBub3Qgd3Jh
cCBhcm91bmQgdG8gMCAuLi4uCgpGaXggaXMgb24gdGhlIHdheSB0byBnaXQuCgpUaGFua3MsCgoJ
dGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
