From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 05/10] xen/arm: Setup virtual paging for
 non-boot CPUs on hotplug/resume
Date: Tue, 29 May 2018 14:27:16 +0100
Message-ID: <987d2bd3-2ebd-d855-16e8-d6d2a6ffe23e@arm.com>
References: <20180515114419.7296-1-mirela.simonovic@aggios.com>
 <20180515114419.7296-6-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180515114419.7296-6-mirela.simonovic@aggios.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, xen-devel@lists.xen.org
Cc: edgar.iglesias@xilinx.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNS8wNS8xOCAxMjo0NCwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gaW5kZXggZDQz
YzNhYTg5Ni4uOTI0MjI2ZjYzYyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBAQCAtOCw2ICs4LDggQEAKPiAgICNpbmNsdWRlIDx4
ZW4vaW9jYXAuaD4KPiAgICNpbmNsdWRlIDx4ZW4vbWVtX2FjY2Vzcy5oPgo+ICAgI2luY2x1ZGUg
PHhlbi94bWFsbG9jLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vY3B1Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4v
bm90aWZpZXIuaD4KPiAgICNpbmNsdWRlIDxwdWJsaWMvdm1fZXZlbnQuaD4KPiAgICNpbmNsdWRl
IDxhc20vZmx1c2h0bGIuaD4KPiAgICNpbmNsdWRlIDxhc20vZXZlbnQuaD4KPiBAQCAtMTQ1MSwx
MCArMTQ1MywxMiBAQCBlcnI6Cj4gICAgICAgcmV0dXJuIHBhZ2U7Cj4gICB9Cj4gICAKPiAtc3Rh
dGljIHZvaWQgX19pbml0IHNldHVwX3ZpcnRfcGFnaW5nX29uZSh2b2lkICpkYXRhKQo+ICsvKiBW
VENSIHZhbHVlIHRvIGJlIGNvbmZpZ3VyZWQgYnkgYWxsIENQVXMuIFNldCBvbmx5IG9uY2UgYnkg
dGhlIGJvb3QgQ1BVICovCj4gK3N0YXRpYyB1aW50NjRfdCBfX3JlYWRfbW9zdGx5IHZ0Y3I7CgpU
aGlzIHNob3VsZCBiZSB1aW50MzJfdCBhcyBWVENSIGlzIGEgMzItYml0IHJlZ2lzdGVyLiBUaGUg
cmVzdCBsb29rcyAKZ29vZCB0byBtZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
