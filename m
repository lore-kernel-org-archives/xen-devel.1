From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 3/6] x86: move the saved value of
 MSR_IA32_XSS into struct vcpu_msrs
Date: Mon, 28 Jan 2019 02:34:29 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C915020@SHSMSX104.ccr.corp.intel.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eaaH=QE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gnwku-0002HS-9y
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 02:34:36 +0000
In-Reply-To: <20190107120258.17897-4-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogTW9uZGF5LCBKYW51YXJ5IDcsIDIwMTkgODowMyBQTQ0KPiANCj4gQ3VycmVudGx5IHRo
ZSB2YWx1ZSBpcyBzYXZlZCBkaXJlY3RseSBpbiBzdHJ1Y3QgaHZtX3ZjcHUuIFRoaXMgcGF0Y2gg
c2ltcGx5DQo+IGNvLWxvY2F0ZXMgaXQgd2l0aCBvdGhlciBzYXZlZCBNU1IgdmFsdWVzLiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
