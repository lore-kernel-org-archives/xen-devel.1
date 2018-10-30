From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] arm,
 smmu: backport "Disable stalling faults for all endpoints"
Date: Tue, 30 Oct 2018 10:40:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810301039380.19149@sstabellini-ThinkPad-X260>
References: <1540847646-13676-1-git-send-email-sstabellini@kernel.org>
 <5BD8224E02000078001F628B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz+z=nk=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gHY0I-0007SS-I4
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:40:34 +0000
In-Reply-To: <5BD8224E02000078001F628B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAzMCBPY3QgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDI5LjEwLjE4
IGF0IDIyOjE0LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiAKPiA+IEJhY2twb3J0IGNv
bW1pdCAzNzE0Y2UxZDY2NTUwOThlZTY5ZWRlNjMyODgzZTU4NzRkNjdlNGFiCj4gPiAiaW9tbXUv
YXJtLXNtbXU6IERpc2FibGUgc3RhbGxpbmcgZmF1bHRzIGZvciBhbGwgZW5kcG9pbnRzIiBmcm9t
IHRoZQo+ID4gTGludXgga2VybmVsLiBUaGlzIHdvcmtzLWFyb3VuZCBFcnJhdHVtICM4NDI4Njku
Cj4gCj4gQnR3LCBzZWVpbmcgdGhpcyBoYXZpbmcgZ29uZSBpbiBhIGZldyBob3VycyBhZ28gSSBn
b3QgcmF0aGVyIHB1enpsZWQKPiBieSB0aGVyZSBiZWluZyBhIGJhY2twb3J0IG9uIHRoZSBtYXN0
ZXIgYnJhbmNoLiBJbiB0aGUgZnV0dXJlLCBjYW4KPiBzdWNoIGJlIHRpdGxlZCBqdXN0ICJwb3J0
IC4uLiIgYXMgdGhleSdyZSBub3QgcmVhbGx5IGJhY2twb3J0cyAod2hpY2gKPiB3b3VsZCBpbXBs
eSBhIHZhcmlhbnQgYmVpbmcgYXZhaWxhYmxlIG9uIGEgbmV3ZXIgYnJhbmNoKT8KCkZhaXIgZW5v
dWdoLCB0aGV5IGFyZSBpbmRlZWQganVzdCAicG9ydHMiLiBJJ2xsIHRyeSB0byBiZSBjb25zaXN0
ZW50CndpdGggdGhlIG5hbWluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
