From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC 07/11] Add kernel helper functions
Date: Thu, 18 Jan 2018 18:55:00 +0000
Message-ID: <757dcb74-5976-f5b2-6313-aea908de4335@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-8-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kmc5=en=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ecFL7-0001hB-5c
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 18:55:05 +0000
Received: by mail-wm0-x242.google.com with SMTP id r78so25064323wme.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2018 10:55:03 -0800 (PST)
In-Reply-To: <20180102092809.1841-8-manish.jaggi@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: manish.jaggi@linaro.org, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, manish.jaggi@cavium.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgTWFuaXNoLAoKUGxlYXNlIHVzZSBzY3JpcHRzL2dldF9tYWl0YWluZXJzLnBsIHRvIENDIHJl
bGV2YW50IG1haW50YWluZXJzLgoKT24gMDIvMDEvMTggMDk6MjgsIG1hbmlzaC5qYWdnaUBsaW5h
cm8ub3JnIHdyb3RlOgo+IEZyb206IE1hbmlzaCBKYWdnaSA8bWFuaXNoLmphZ2dpQGxpbmFyby5v
cmc+Cj4gCj4gQWRkIGthbGxvYyBrZnJlZSBmdW5jdGlvbnMgZnJvbSBsaW51eCBrZXJuZWwuCgpU
aGlzIGRvZXMgbm90IGRlc2NyaXB0aW9uIGFsbCB0aGUgZnVuY3Rpb25zIHlvdSBhZGRlZC4gQnV0
IEkgYW0gcmVhbGx5IApub3QgY29udmluY2VkIHRoaXMgaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGRv
IHRoYXQuCgpUaGlzIGZpbGUgaXMgaW5jbHVkZWQgaW4gbWFueSBwbGFjZXMgdGhhdCBzaG91bGQg
bm90IHVzZSBrbWFsbG9jICYgY28gCmJ1dCBpbnN0ZWFkIFhlbiB2ZXJzaW9uLgoKSWYgeW91IHN0
aWxsIHdhbnQgdG8gYWRkIGl0IGluIGFuIGhlYWRlciwgSSB0aGluayBpdCB3b3VsZCBtYWtlIHNl
bnNlIHRvIApjcmVhdGUgYSBoZWFkZXIgdGhhdCB3aWxsIGNvbnRhaW4gbGludXhpc20uIFNvIGl0
IGdldCBpbmNsdWRlZCBvbmx5IAp3aGVyZSBpdCBpcyBuZWVkZWQuCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hbmlzaCBKYWdnaSA8bWFuaXNoLmphZ2dpQGxpbmFyby5vcmc+Cj4gLS0tCj4gICB4ZW4v
aW5jbHVkZS94ZW4va2VybmVsLmggfCAxMCArKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4va2VybmVs
LmggYi94ZW4vaW5jbHVkZS94ZW4va2VybmVsLmgKPiBpbmRleCA1NDhiNjRkYTlmLi43ODUxN2Y2
Y2FhIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9rZXJuZWwuaAo+IEBAIC03LDYgKzcsMTYgQEAKPiAgIAo+ICAgI2luY2x1ZGUg
PHhlbi90eXBlcy5oPgo+ICAgCj4gKy8qIFhlbjogRGVmaW5lIGNvbXBhdGliaWxpdHkgZnVuY3Rp
b25zICovCj4gKyNkZWZpbmUgRldfQlVHICAgICAgICAgIltGaXJtd2FyZSBCdWddOiAiCj4gKyNk
ZWZpbmUgcHJfZXJyKGZtdCwgLi4uKSBwcmludGsoWEVOTE9HX0VSUiBmbXQsICMjIF9fVkFfQVJH
U19fKQo+ICsjZGVmaW5lIHByX3dhcm4oZm10LCAuLi4pIHByaW50ayhYRU5MT0dfV0FSTklORyBm
bXQsICMjIF9fVkFfQVJHU19fKQo+ICsKPiArLyogQWxpYXMgdG8gWGVuIGFsbG9jYXRpb24gaGVs
cGVycyAqLwo+ICsjZGVmaW5lIGtmcmVlIHhmcmVlCj4gKyNkZWZpbmUga21hbGxvYyhzaXplLCBm
bGFncykgICAgICAgICAgICBfeG1hbGxvYyhzaXplLCBzaXplb2Yodm9pZCAqKSkKPiArI2RlZmlu
ZSBremFsbG9jKHNpemUsIGZsYWdzKSAgICAgICAgICAgIF94emFsbG9jKHNpemUsIHNpemVvZih2
b2lkICopKQo+ICsKPiAgIC8qCj4gICAgKiBtaW4oKS9tYXgoKSBtYWNyb3MgdGhhdCBhbHNvIGRv
Cj4gICAgKiBzdHJpY3QgdHlwZS1jaGVja2luZy4uIFNlZSB0aGUKPiAKCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
