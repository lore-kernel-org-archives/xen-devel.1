From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 5/7] xen/arm32: Invalidate BTB on guest exit
 for Cortex A17 and 12
Date: Wed, 31 Jan 2018 08:40:47 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801310840340.11958@sstabellini-ThinkPad-X260>
References: <20180119134103.3390-1-julien.grall@linaro.org>
 <20180119134103.3390-6-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801241559160.6440@sstabellini-ThinkPad-X260>
 <f30b7ab4-bcbf-26bd-f874-693fd6f2cd67@linaro.org>
 <alpine.DEB.2.10.1801251135170.11958@sstabellini-ThinkPad-X260>
 <96795592-24af-f0fa-d13c-15fb69c656cb@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <96795592-24af-f0fa-d13c-15fb69c656cb@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAzMSBKYW4gMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjUvMDEvMTggMTk6MzUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gVGhp
cyBtZWFucyB0aGF0IGJuZSB3aWxsIGJyYW5jaCBvbmx5IHdoZW4gYml0IDIgaXMgc2V0LiBTbyB0
aGUgb25seSB3YXkgdG8KPiA+ID4gZW5kCj4gPiA+IGhlcmUgaXMgYmVjYXVzZSB0aGUgZmlyc3Qg
My1iaXQgYXJlIGVxdWFsIHRvIDB4MDBYLiBUaGlzIGNvcnJlc3BvbmRzIHRvCj4gPiA+IElSUS9G
SVEgdmVjdG9yLgo+ID4gCj4gPiBJIGdvdCBpdCB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgdGhhbmtz
IGZvciB0aGUgZXhwbGFuYXRpb24gOi0pCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiBEaWQgeW91IG1lYW4gUmV2
aWV3ZWQtYnkgb3IgQWNrZWQtYnk/CgpMT0whICBJIG1lYW50IFJldmlld2VkLWJ5LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
