From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/13] xen/arm: setup: Check errata for boot
 CPU later on
Date: Tue, 29 May 2018 14:30:41 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805291430130.5563@sstabellini-ThinkPad-X260>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1805231434360.15101@sstabellini-ThinkPad-X260>
 <903bccf0-ceb7-d184-2b6c-c44afbf223a0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g2yr=iq=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fNmCZ-00067y-8x
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 21:30:43 +0000
In-Reply-To: <903bccf0-ceb7-d184-2b6c-c44afbf223a0@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNSBNYXkgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDUvMjMvMjAxOCAxMDozNCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
T24gVHVlLCAyMiBNYXkgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBTb21lIGVycmF0
YSB3aWxsIHJlbHkgb24gdGhlIFNNQ0NDIHZlcnNpb24gd2hpY2ggaXMgZGV0ZWN0ZWQgYnkKPiA+
ID4gcHNjaV9pbml0KCkuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIHBhcnQgb2YgWFNBLTI2My4KPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+Cj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LiBPbiBhbiBpbnRlcm5h
bCByZXZpZXcgQW5kcmUncyBzdWdnZXN0ZWQgdG8gbW92ZQo+IHBzY2lfaW5pdCgpIG91dHNpZGUg
c21wX2luaXRfY3B1cygpLiBTb21ldGhpbmcgbGlrZToKPiAKPiAgICBwcm9jZXNzb3JfaWQoKTsK
PiAKPiAgICAgLyogTmVlZCBQU0NJIHZlcnNpb24gZm9yIGZpcm13YXJlIGJhc2VkIGVycmF0YSB3
b3JrYXJvdW5kcyAqLwo+ICAgICBwc2NpX2luaXQoKTsKPiAKPiAgICAgY2hlY2tfbG9jYWxfY3B1
X2VycmF0YSgpOwo+IAo+ICAgICBzbXBfaW5pdF9jcHVzKCk7Cj4gCj4gSSBhbSB3b25kZXJpbmcg
d2hldGhlciBpdCB3b3VsZCBiZSBjbGVhcmVyIHRvIGhhdmUuIFdoYXQgZG8geW91IHRoaW5rPwoK
VGhhdCBhbHNvIHdvcmtzLiBJIGFtIGZpbmUgZWl0aGVyIHdheSwgdGhleSBib3RoIGxvb2sgT0sg
dG8gbWUuCgoKPiAKPiA+IAo+ID4gPiAtLS0KPiA+ID4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8
IDggKysrKysrLS0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5j
IGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiA+ID4gaW5kZXggMWQ2ZjZiZjM3ZS4uYWM5M2RlNDc4
NiAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiA+ID4gKysrIGIveGVu
L2FyY2gvYXJtL3NldHVwLmMKPiA+ID4gQEAgLTE3MSw4ICsxNzEsNiBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgcHJvY2Vzc29yX2lkKHZvaWQpCj4gPiA+ICAgICAgIH0KPiA+ID4gICAgICAgICBwcm9j
ZXNzb3Jfc2V0dXAoKTsKPiA+ID4gLQo+ID4gPiAtICAgIGNoZWNrX2xvY2FsX2NwdV9lcnJhdGEo
KTsKPiA+ID4gICB9Cj4gPiA+ICAgICB2b2lkIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90
IHMsIHBhZGRyX3QgZSwKPiA+ID4gQEAgLTc3OSw2ICs3NzcsMTIgQEAgdm9pZCBfX2luaXQgc3Rh
cnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKPiA+ID4gICAgICAgcHJpbnRr
KFhFTkxPR19JTkZPICJTTVA6IEFsbG93aW5nICV1IENQVXNcbiIsIGNwdXMpOwo+ID4gPiAgICAg
ICBucl9jcHVfaWRzID0gY3B1czsKPiA+ID4gICArICAgIC8qCj4gPiA+ICsgICAgICogU29tZSBl
cnJhdGEgcmVsaWVzIG9uIFNNQ0NDIHZlcnNpb24gd2hpY2ggaXMgZGV0ZWN0ZWQgYnkKPiA+ID4g
cHNjaV9pbml0KCkKPiA+ID4gKyAgICAgKiAoY2FsbGVkIGZyb20gc21wX2luaXRfY3B1cygpKS4K
PiA+ID4gKyAgICAgKi8KPiA+ID4gKyAgICBjaGVja19sb2NhbF9jcHVfZXJyYXRhKCk7Cj4gPiA+
ICsKPiA+ID4gICAgICAgaW5pdF94ZW5fdGltZSgpOwo+ID4gPiAgICAgICAgIGdpY19pbml0KCk7
Cj4gPiA+IC0tIAo+ID4gPiAyLjExLjAKPiA+ID4gCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
