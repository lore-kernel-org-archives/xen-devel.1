From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v3 4/8] xen/arm: Make
 get_page_from_gfn working with DOMID_XEN
Date: Fri, 21 Dec 2018 17:27:32 +0000
Message-ID: <da986b89-a13d-cc91-d12d-9d90d8adc5b5@arm.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-5-julien.grall@arm.com>
 <a96fbf44-77e6-fd15-740e-8d1ede2b8694@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaOaG-0005o2-2l
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 17:27:36 +0000
In-Reply-To: <a96fbf44-77e6-fd15-740e-8d1ede2b8694@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMjEvMTIvMjAxOCAxNzoyNiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAyMS4xMi4xOCAxODoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBET01JRF9YRU4g
aXMgdXNlZCB0byBzaGFyZSBwYWdlcyBiZWxvZ2luZyB0byB0aGUgaHlwZXJ2aXNvcgo+PiAoZS5n
IHRyYWNlIGJ1ZmZlcnMpLiBVbmxpa2Ugb3RoZXIgZG9tYWlucywgRE9NSURfWEVOIGlzIGEgbm9u
LWF1dG8KPj4gdHJhbnNsYXRlZCBkb21haW4gYW5kIHRoZXJlZm9yZSBkb2VzIG5vdCBoYXZlIGEg
UDJNLgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgYSBzcGVjaWFsIGNhc2UgZm9yIERPTUlEX1hFTiBp
biBnZXRfcGFnZV9mcm9tX2dmbi4gV2UKPj4gbWF5IHdhbnQgdG8gcHJvdmlkZSAibm9uLWF1dG8g
dHJhbnNsYXRlZCBoZWxwZXJzIiBpbiB0aGUgZnV0dXJlIGlmIHdlCj4+IHNlZSBtb3JlIGNhc2Uu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4gCj4gQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCklzIGl0IGEgd2ls
ZGNhcmQgdGFnPyA6KQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
