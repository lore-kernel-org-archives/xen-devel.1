From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] xen/iommu: fix iommu_ops attribute
Date: Fri, 1 Feb 2019 17:16:10 +0100
Message-ID: <91d40cbe-3399-5e98-acf8-9bb7c603f132@suse.com>
References: <20190201151349.23532-1-jgross@suse.com>
 <5C5469790200007800213345@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpbUE-0003Ne-G1
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 16:16:14 +0000
In-Reply-To: <5C5469790200007800213345@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNjo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDIuMTkg
YXQgMTY6MTMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKPj4gQEAgLTU3MCw3ICs1NzAsNyBAQCBzdGF0aWMg
dm9pZCBhbWRfZHVtcF9wMm1fdGFibGUoc3RydWN0IGRvbWFpbiAqZCkKPj4gICAgICBhbWRfZHVt
cF9wMm1fdGFibGVfbGV2ZWwoaGQtPmFyY2gucm9vdF90YWJsZSwgaGQtPmFyY2gucGFnaW5nX21v
ZGUsIDAsIDApOwo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyBf
X2luaXRjb25zdHJlbCBhbWRfaW9tbXVfb3BzID0gewo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBp
b21tdV9vcHMgYW1kX2lvbW11X29wcyA9IHsKPiAKPiBUaGlzIG9uZSdzIG5vdCBuZWVkZWQgLSB0
aGVyZSdzIG9ubHkgYW4gX19pbml0IGZ1bmN0aW9uIHJlZmVyZW5jaW5nCj4gdGhpcyBzdHJ1Y3R1
cmUuCj4gCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+IEBAIC0yNzA2LDcgKzI3
MDYsNyBAQCBzdGF0aWMgdm9pZCB2dGRfZHVtcF9wMm1fdGFibGUoc3RydWN0IGRvbWFpbiAqZCkK
Pj4gICAgICB2dGRfZHVtcF9wMm1fdGFibGVfbGV2ZWwoaGQtPmFyY2gucGdkX21hZGRyLCBhZ2F3
X3RvX2xldmVsKGhkLT5hcmNoLmFnYXcpLCAwLCAwKTsKPj4gIH0KPj4gIAo+PiAtY29uc3Qgc3Ry
dWN0IGlvbW11X29wcyBfX2luaXRjb25zdHJlbCBpbnRlbF9pb21tdV9vcHMgPSB7Cj4+ICtjb25z
dCBzdHJ1Y3QgaW9tbXVfb3BzIGludGVsX2lvbW11X29wcyA9IHsKPiAKPiBUaGlzIG9uZSdzIGlu
ZGVlZCByZWZlcmVuY2VkIGJ5IGEgbm9uLV9faW5pdCBmdW5jdGlvbiwgYnV0IHRoZQo+IGZpeCBp
cyBpbW8gdG8gYXZvaWQgdGhhdCByZWZlcmVuY2UgZnJvbSBpb21tdV9lbmFibGVfeDJhcGljX0lS
KCk6Cj4gV2Ugc2hvdWxkIG5vdCBvdmVyd3JpdGUgdGhlIHByZXZpb3VzbHkgZXN0YWJsaXNoZWQg
KGFuZAo+IHBvdGVudGlhbGx5IHN1YnNlcXVlbnRseSBhZGp1c3RlZCkgaG9vayBwb2ludGVycy4g
U28gSSB0aGluawo+IHRoZSBhc3NpZ25tZW50IHdhbnRzIHRvIGdvIGluIGEgc3lzdGVtX3N0YXRl
IGRlcGVuZGVudAo+IGNvbmRpdGlvbmFsIChhbmQgdGhlcmUgaXMgb25lIGEgZmV3IGxpbmVzIHVw
LCBzbyBpdCBjb3VsZCBtb3ZlCj4ganVzdCB0aGVyZSkuCgpPa2F5LCBJJ2xsIHRyeSB0aGF0LgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
