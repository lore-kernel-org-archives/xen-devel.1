From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-devel] [PATCH v2 16/31]
 OvmfPkg/XenPlatformPei: Introduce XenHvmloaderDetected
Date: Fri, 12 Apr 2019 11:08:13 +0200
Message-ID: <c0beadf1-7909-e0db-48fb-99402887a4ff@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-17-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsB1-00024D-Po
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:08:51 +0000
In-Reply-To: <20190409110844.14746-17-anthony.perard@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgNSArKysrKwo+ICBPdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jICAgICAgfCA3ICsrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxh
dGZvcm0uaCBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAo+IGluZGV4IDZjY2Q1
ZWI2NmMuLjU1NjVkNDdlMzQgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Q
bGF0Zm9ybS5oCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gQEAg
LTk1LDYgKzk1LDExIEBAIFhlbkRldGVjdCAoCj4gICAgVk9JRAo+ICAgICk7Cj4gIAo+ICtCT09M
RUFOCj4gK1hlbkh2bWxvYWRlckRldGVjdGVkICgKPiArICBWT0lECj4gKyAgKTsKPiArCj4gIFZP
SUQKPiAgQW1kU2V2SW5pdGlhbGl6ZSAoCj4gICAgVk9JRAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IGlu
ZGV4IDlkOWU5ZjgwMjAuLjg5OTMzZWMzZTkgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKPiBAQCAt
MjAyLDYgKzIwMiwxMyBAQCBYZW5EZXRlY3QgKAo+ICAgIHJldHVybiBGQUxTRTsKPiAgfQo+ICAK
PiArQk9PTEVBTgo+ICtYZW5Idm1sb2FkZXJEZXRlY3RlZCAoCj4gKyAgVk9JRAo+ICsgICkKPiAr
ewo+ICsgIHJldHVybiAobVhlbkh2bWxvYWRlckluZm8gIT0gTlVMTCk7Cj4gK30KPiAgCj4gIFZP
SUQKPiAgWGVuUHVibGlzaFJhbVJlZ2lvbnMgKAo+IAoKKDEpIFBsZWFzZSBhZGQgbGVhc3Qgb25l
IHNlbnRlbmNlIHRvIHRoZSBjb21taXQgbWVzc2FnZSBib2R5LgoKV2l0aCB0aGF0OgoKQWNrZWQt
Ynk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
