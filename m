From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] x86/msr: Fix fallout from mostly c/s
 832c180
Date: Wed, 24 Apr 2019 06:46:48 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9F96AE@SHSMSX104.ccr.corp.intel.com>
References: <1555329809-3248-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0bKC=S2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hJBgG-00005Q-T0
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 06:46:56 +0000
In-Reply-To: <1555329809-3248-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogTW9uZGF5LCBBcHJpbCAxNSwgMjAxOSA4OjAzIFBNDQo+IA0KPiAgKiBGaXggdGhl
IHNoaW0gYnVpbGQgYnkgcHJvdmlkaW5nIGEgIUNPTkZJR19IVk0gZGVjbGFyYXRpb24gZm9yDQo+
ICAgIGh2bV9nZXRfZ3Vlc3RfYm5kY2ZncygpLCBhbmQgcmVtb3ZpbmcgdGhlIGludHJvZHVjZWQN
Cj4gICAgQVNTRVJUKGlzX2h2bV9kb21haW4oZCkpJ3MuICBUaGV5IGFyZSBuZWVkZWQgZm9yIERD
RSB0byBrZWVwIHRoZSBidWlsZA0KPiAgICB3b3JraW5nLiAgRnVydGhlcm1vcmUsIGluIHRoaXMg
d2F5LCB0aGUgcmlzayBvZiBydW50aW1lIHR5cGUgY29uZnVzaW9uIGlzDQo+ICAgIHJlbW92ZWQu
DQo+ICAqIFJldmVydCB0aGUgZGUtY29uc3QnaW5nIG9mIHRoZSB2Y3B1IHBvaW50ZXIgaW4gdm14
X2dldF9ndWVzdF9ibmRjZmdzKCkuDQo+ICAgIHZteF92bWNzX2VudGVyKCkgcmVhbGx5IGRvZXMg
bXV0YXRlIHRoZSB2Y3B1LCBhbmQgbWF5IGNhdXNlIGl0IHRvIHVuZGVyZ28NCj4gYQ0KPiAgICBm
dWxsIGRlL3Jlc2NoZWR1bGUsIHdoaWNoIGlzIGluIHZpb2xhdGlvbiBvZiB0aGUgQUJJIGRlc2Ny
aWJlZCBieQ0KPiAgICBodm1fZ2V0X2d1ZXN0X2JuZGNmZ3MoKS4gIGd1ZXN0X3JkbXNyKCkgd2Fz
IGFsd2F5cyBnb2luZyB0byBuZWVkIHRvIGxvc2UNCj4gICAgaXRzIGNvbnN0IHBhcmFtZXRlciwg
YW5kIHRoaXMgd2FzIHRoZSBjb3JyZWN0IHRpbWUgZm9yIGl0IHRvIGhhcHBlbi4NCj4gICogVGhl
IE1TUnMgaW4gdmNwdV9tc3JzIGFyZSBpbiBudW1lcmljIG9yZGVyLiAgUmUtcG9zaXRpb24gWFNT
IHRvIG1hdGNoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
