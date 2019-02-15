From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.12 v3 3/8] amd/npt/shadow: replace
 assert that prevents creating 2M/1G MMIO entries
Date: Fri, 15 Feb 2019 15:27:46 +0000
Message-ID: <58863B11-CE68-43D9-A413-D4450AF6CE40@citrix.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o/cr=QW=citrix.com=prvs=942b6a84d=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gufP3-0008VV-5J
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:27:49 +0000
In-Reply-To: <20190215141837.1420-4-roger.pau@citrix.com>
Content-Language: en-US
Content-ID: <B0A6CBD1F6B39549A7AE1580D26820D8@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gRmViIDE1LCAyMDE5LCBhdCAyOjE4IFBNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoZSBhc3NlcnQgd2FzIG9yaWdpbmFsbHkg
YWRkZWQgdG8gbWFrZSBzdXJlIHRoYXQgaGlnaGVyIG9yZGVyDQo+IHJlZ2lvbnMgKD4gUEFHRV9P
UkRFUl80SykgY291bGQgbm90IGJlIHVzZWQgdG8gYnlwYXNzIHRoZQ0KPiBtbWlvX3JvX3Jhbmdl
cyBjaGVjayBwZXJmb3JtZWQgYnkgcDJtX3R5cGVfdG9fZmxhZ3MuDQo+IA0KPiBUaGlzIGhvd2V2
ZXIgaXMgYWxyZWFkeSBjaGVja2VkIGluIHNldF9tbWlvX3AybV9lbnRyeSwgd2hpY2ggbWFrZXMN
Cj4gc3VyZSB0aGF0IGhpZ2hlciBvcmRlciBtYXBwaW5ncyBkb24ndCBvdmVybGFwIHdpdGggbW1p
b19yb19yYW5nZXMsDQo+IHRodXMgYWxsb3dpbmcgdGhlIGNyZWF0aW9uIG9mIGhpZ2ggb3JkZXIg
TU1JTyBtYXBwaW5ncyBzYWZlbHkuDQo+IA0KPiBSZXBsYWNlIHRoZSBhc3NlcnQgdG8gYWxsb3cg
Mk0vMUcgZW50cmllcyB0byBiZSBjcmVhdGVkIGZvciBNTUlPDQo+IHJlZ2lvbnMgYW5kIGFkZCBz
b21lIGV4dHJhIGFzc2VydHMgYXMgYSByZXBsYWNlbWVudCB0byBtYWtlIHN1cmUNCj4gdGhlcmUn
cyBubyBvdmVybGFwcGluZyB3aXRoIE1NSU8gcmVhZC1vbmx5IHJhbmdlcy4NCj4gDQo+IE5vdGUg
dGhhdCAxRyBNTUlPIGVudHJpZXMgd2lsbCBub3QgYmUgY3JlYXRlZCB1bmxlc3MgbW1pb19vcmRl
ciBpcw0KPiBjaGFuZ2VkIHRvIGFsbG93IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
