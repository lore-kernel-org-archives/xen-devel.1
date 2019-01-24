From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH for-4.12] amd/iommu: fix present bit
 checking when clearing PTE
Date: Thu, 24 Jan 2019 23:18:22 +0000
Message-ID: <8232fceb-de3b-3423-450c-1e1474d4627c@amd.com>
References: <20190123094755.72146-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9G7=QA=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gmoGT-0006Fs-KW
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 23:18:29 +0000
In-Reply-To: <20190123094755.72146-1-roger.pau@citrix.com>
Content-Language: en-US
Content-ID: <58CD007361476F41B2C8B4A7B5DD23F4@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul.durrant@citrix.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yMy8xOSAzOjQ3IEFNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+IFRoZSBjdXJyZW50
IGNoZWNrIGZvciB0aGUgcHJlc2VudCBiaXQgaXMgd3JvbmcsIHNpbmNlIHRoZSBwcmVzZW50IGJp
dA0KPiBpcyBsb2NhdGVkIGluIHRoZSBsb3cgcGFydCBvZiB0aGUgZW50cnkuDQo+IA0KPiBGaXhl
czogZThhZmUxMTI0Y2MxICgiaW9tbXU6IGVsaWRlIGZsdXNoaW5nIGZvciBoaWdoZXIgb3JkZXIg
bWFwL3VubWFwIG9wZXJhdGlvbnMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlh
bi53b29kc0BhbWQuY29tPg0KDQo+IC0tLQ0KPiBDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxz
dXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4NCj4gQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53
b29kc0BhbWQuY29tPg0KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiBD
YzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jIHwgNCArLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYw0KPiBpbmRleCA5OWFjMGE2ODYyLi42NzMyOWIw
Yzk1IDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFw
LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jDQo+IEBA
IC0zOSwxNSArMzksMTMgQEAgc3RhdGljIHVuc2lnbmVkIGludCBjbGVhcl9pb21tdV9wdGVfcHJl
c2VudCh1bnNpZ25lZCBsb25nIGwxX21mbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZGZuKQ0KPiAgIHsNCj4gICAgICAgdWlu
dDY0X3QgKnRhYmxlLCAqcHRlOw0KPiAtICAgIHVpbnQzMl90IGVudHJ5Ow0KPiAgICAgICB1bnNp
Z25lZCBpbnQgZmx1c2hfZmxhZ3M7DQo+ICAgDQo+ICAgICAgIHRhYmxlID0gbWFwX2RvbWFpbl9w
YWdlKF9tZm4obDFfbWZuKSk7DQo+ICAgDQo+ICAgICAgIHB0ZSA9ICh0YWJsZSArIHBmbl90b19w
ZGVfaWR4KGRmbiwgMSkpOw0KPiAtICAgIGVudHJ5ID0gKnB0ZSA+PiAzMjsNCj4gICANCj4gLSAg
ICBmbHVzaF9mbGFncyA9IGdldF9maWVsZF9mcm9tX3JlZ191MzIoZW50cnksIElPTU1VX1BURV9Q
UkVTRU5UX01BU0ssDQo+ICsgICAgZmx1c2hfZmxhZ3MgPSBnZXRfZmllbGRfZnJvbV9yZWdfdTMy
KCpwdGUsIElPTU1VX1BURV9QUkVTRU5UX01BU0ssDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJT01NVV9QVEVfUFJFU0VOVF9TSElGVCkgPw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfRkxVU0hGX21vZGlmaWVk
IDogMDsNCj4gICANCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
