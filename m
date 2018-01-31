From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 5/7] xen/arm32: Invalidate BTB on guest exit
 for Cortex A17 and 12
Date: Wed, 31 Jan 2018 15:31:27 +0000
Message-ID: <96795592-24af-f0fa-d13c-15fb69c656cb@linaro.org>
References: <20180119134103.3390-1-julien.grall@linaro.org>
 <20180119134103.3390-6-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801241559160.6440@sstabellini-ThinkPad-X260>
 <f30b7ab4-bcbf-26bd-f874-693fd6f2cd67@linaro.org>
 <alpine.DEB.2.10.1801251135170.11958@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1801251135170.11958@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDI1LzAxLzE4IDE5OjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4+IFRoaXMgbWVhbnMgdGhhdCBibmUgd2lsbCBicmFuY2ggb25seSB3aGVuIGJpdCAyIGlzIHNl
dC4gU28gdGhlIG9ubHkgd2F5IHRvIGVuZAo+PiBoZXJlIGlzIGJlY2F1c2UgdGhlIGZpcnN0IDMt
Yml0IGFyZSBlcXVhbCB0byAweDAwWC4gVGhpcyBjb3JyZXNwb25kcyB0bwo+PiBJUlEvRklRIHZl
Y3Rvci4KPiAKPiBJIGdvdCBpdCB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgdGhhbmtzIGZvciB0aGUg
ZXhwbGFuYXRpb24gOi0pCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgoKRGlkIHlvdSBtZWFuIFJldmlld2VkLWJ5IG9yIEFja2Vk
LWJ5PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
