From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v2] vvmx: fixes after CR4 trapping
	optimizations
Date: Mon, 5 Mar 2018 08:27:54 +0000
Message-ID: <1520238472.2878.0.camel@citrix.com>
References: <20180302161929.31883-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wvgu=f3=citrix.com=prvs=595d5ae50=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1eslTR-0006vt-Ub
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 08:27:57 +0000
In-Reply-To: <20180302161929.31883-1-roger.pau@citrix.com>
Content-Language: en-US
Content-ID: <EC7FD0C8549A114792A4511F1E55DE8F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMDE4LTAzLTAyIGF0IDE2OjE5ICswMDAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
DQo+IENvbW1pdCA0MDY4MTcgZG9lc24ndCB1cGRhdGUgbmVzdGVkIFZNWCBjb2RlIGluIG9yZGVy
IHRvIHRha2UgaW50bw0KPiBhY2NvdW50IEwxIENSNCBob3N0IG1hc2sgd2hlbiBuZXN0ZWQgZ3Vl
c3QgKEwyKSB3cml0ZXMgdG8gQ1I0LCBhbmQNCj4gdGh1cyB0aGUgbWFzayB3cml0dGVuIHRvIENS
NF9HVUVTVF9IT1NUX01BU0sgaXMgbGlrZWx5IG5vdCBhcw0KPiByZXN0cmljdGl2ZSBhcyBpdCBz
aG91bGQgYmUuDQo+IA0KPiBBbHNvIHRoZSBWVk1DUyBHVUVTVF9DUjQgdmFsdWUgc2hvdWxkIGJl
IHVwZGF0ZWQgdG8gbWF0Y2ggdGhlDQo+IHVuZGVybHlpbmcgdmFsdWUgd2hlbiBzeW5jaW5nIHRo
ZSBWVk1DUyBzdGF0ZS4NCj4gDQo+IEZpeGVzOiA0MDY4MTcgKCJ2bXgvaGFwOiBvcHRpbWl6ZSBD
UjQgdHJhcHBpbmciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBp
bnRlbC5jb20+DQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlh
c2xpQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBJJ3ZlIG1hbnVhbGx5IHRlc3RlZCBhbmQgQUZBSUNU
IHRoaXMgZml4ZXMgdGhlIG9zc3Rlc3QgZmFpbHVyZQ0KPiBkZXRlY3RlZCBpbiAxMjAwNzYgKCJ0
ZXN0LWFtZDY0LWFtZDY0LXFlbXV1LW5lc3RlZC1pbnRlbCIpLg0KPiAtLS0NCj4gQ2hhbmdlcyBz
aW5jZSB2MToNCj4gIC0gVXNlIGd1ZXN0X2NyWzRdIGluIG9yZGVyIHRvIHVwZGF0ZSB0aGUgbmVz
dGVkIFZNQ1MgR1VFU1RfQ1I0Lg0KDQpSZXZpZXdlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPg0KDQotLSANClRoYW5rcywNClNlcmdleQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
