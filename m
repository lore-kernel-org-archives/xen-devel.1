From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v5 02/16] xen/arm: setup: use maddr_to_mfn
 rather than _mfn(paddr_to_pfn(...))
Date: Thu, 15 Mar 2018 16:10:56 +0000
Message-ID: <CAFLBxZbRTG6WrZOYMrQp_U+sDkcR0G8K5ixt3uSWer_T-cRe5w@mail.gmail.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-3-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgNjoxOSBQTSwgIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g
d3JvdGU6Cj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPgo+IFRo
ZSBjb25zdHJ1Y3Rpb24gX21mbihwYWRkcl90b19wZm4oLi4uKSkgY2FuIGJlIHNpbXBsaWZpZWQg
YnkgdXNpbmcKPiBtYWRkcl90b19tZm4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
