From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
Date: Wed, 15 May 2019 09:43:16 +0000
Message-ID: <cbedbbc7-48f9-be8d-e99b-aaae65297cf0@bitdefender.com>
References: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Nxe=TP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hQqRV-0001e2-11
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:43:21 +0000
In-Reply-To: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <DDC6968326B60A438C28C9AFA9F5AAF4@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDE1LjA1LjIwMTkgMTE6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGVpciBwcmUt
QVZYNTEyIGluY2FybmF0aW9ucyBoYXZlIGNsZWFybHkgYmVlbiBvdmVybG9va2VkIGR1cmluZyBt
dWNoDQo+IGVhcmxpZXIgd29yay4gVGhlaXIgbWVtb3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGVudGly
ZWx5IHN0YW5kYXJkLCBzbyBubw0KPiBzcGVjaWZpYyB0ZXN0cyBnZXQgYWRkZWQgdG8gdGhlIGhh
cm5lc3MuDQo+IA0KPiBSZXBvcnRlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQoNClRlc3RlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0
ZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jDQo+IEBA
IC02NjI0LDYgKzY2MjQsOCBAQCB4ODZfZW11bGF0ZSgNCj4gICAgICAgY2FzZSBYODZFTVVMX09Q
Q19WRVhfNjYoMHgwZiwgMHhmMyk6IC8qIHZwc2xscSB4bW0vbTEyOCx7eCx5fW1tLHt4LHl9bW0g
Ki8NCj4gICAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGY0KTogICAgIC8qIHBtdWx1
ZHEgeG1tL20xMjgseG1tICovDQo+ICAgICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYs
IDB4ZjQpOiAvKiB2cG11bHVkcSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8NCj4gKyAg
ICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweGY1KTogICAgLyogcG1hZGR3ZCB7LHh9bW0v
bWVtLHsseH1tbSAqLw0KPiArICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjUp
OiAvKiB2cG1hZGR3ZCB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8NCj4gICAgICAgY2Fz
ZSBYODZFTVVMX09QQ182NigweDBmLCAweGY2KTogICAgIC8qIHBzYWRidyB4bW0vbTEyOCx4bW0g
Ki8NCj4gICAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmNik6IC8qIHZwc2Fk
Yncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovDQo+ICAgICAgIENBU0VfU0lNRF9QQUNL
RURfSU5UKDB4MGYsIDB4ZjgpOiAgICAvKiBwc3ViYiB7LHh9bW0vbWVtLHsseH1tbSAqLw0KPiAN
Cj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVsDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
