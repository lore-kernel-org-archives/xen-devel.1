From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/4] xen/arm: gic: Relax barrier when
 sending an SGI
Date: Wed, 24 Oct 2018 16:44:41 +0100
Message-ID: <d2ea9722-100e-af1b-dd98-402016f844a8@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-5-julien.grall@arm.com>
 <0851d7c5-3da0-2749-648e-88a42b82449e@epam.com>
 <09283c74-c4a9-9d79-fc07-8e9dffef6dfd@arm.com>
 <31fd2410-2a12-a086-e159-06512e5122f0@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <31fd2410-2a12-a086-e159-06512e5122f0@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8yNC8xOCA0OjQwIFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IE9uIDI0LjEw
LjE4IDE3OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IHBhdGNoICMxIGFuZCAjMiBzaG91bGQg
YmUgYmFja3BvcnRlZC4gVGhpcyBwYXRjaCBpcyB0ZWNobmljYWxseSBub3QgYQo+PiBidWcgZml4
IGJ1dCBhIHJlbGF4YXRpb24uIFNvIEkgYW0gbm90IGNvbWZvcnRhYmxlIHRvIHN1Z2dlc3QKPj4g
YmFja3BvcnRpbmcgaXQgdXAgdG8gWGVuIDQuOS4gSGVuY2UgdGhlIG9yZGVyaW5nIG9mIHRoZSBz
ZXJpZXMuCj4gT0ssIEkgdW5kZXJzdGFuZCB0aGUgbW90aXZhdGlvbiwgYnV0IHN0aWxsIGZlZWwg
c29tZSBvZGRuZXNzIGluIHRoYXQuCgpXZSBkb24ndCB1c3VhbGx5IGJhY2twb3J0IHBhdGNoIHRo
YXQgYXJlIG5vdCBidWcgZml4LiBTbyBwZW9wbGUgY2FuIAp1cGdyYWRlIHRvIHBvaW50IHJlbGVh
c2Ugd2l0aG91dCBiZWVuIHdvcnJ5aW5nIG9mIGJlaGF2aW9yIGNoYW5nZS4KClllcyBpdCBpcyBv
ZGQgdG8gd3JpdGUgY29tbWVudHMgYW5kIHRoZW4gcmVtb3ZlIHRoZW0gaW4gYSBvbGQgcGF0Y2gu
IEJ1dCAKSSBmZWx0IGNvbW1lbnRzIHdlcmUgdXNlZnVsIGZvciBiYWNrcG9ydGluZy4KCj4gCj4g
QW55d2F5LAo+IAo+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVw
YW0uY29tPgoKVGhhbmsgeW91IQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
