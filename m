From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Thu, 15 Nov 2018 20:26:18 +0000
Message-ID: <AD4830D4-4C9B-49FF-A33B-51BE88A5B6B7@citrix.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=onct=n2=citrix.com=prvs=8509d627e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gNODW-0001fZ-AQ
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 20:26:22 +0000
In-Reply-To: <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
Content-ID: <4C4C6C71EE3A624F80366530DB7E6157@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDE0LCAyMDE4LCBhdCA4OjQwIFBNLCBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPiANCj4gV2hlbiBhbiBuZXcgYWx0cDJtIHZp
ZXcgaXMgY3JlYXRlZCB2ZXJ5IGVhcmx5IG9uIGd1ZXN0IGJvb3QsIHRoZQ0KPiBkaXNwbGF5IHdp
bGwgZnJlZXplIChhbHRob3VnaCB0aGUgZ3Vlc3Qgd2lsbCBydW4gbm9ybWFsbHkpLiBUaGlzDQo+
IG1heSBhbHNvIGhhcHBlbiBvbiByZXNpemluZyB0aGUgZGlzcGxheS4gVGhlIHJlYXNvbiBpcyB0
aGUgd2F5DQo+IFhlbiBjdXJyZW50bHkgKG1pcyloYW5kbGVzIGxvZ2RpcnR5IFZHQTogaXQgaW50
ZW50aW9uYWxseQ0KPiBtaXNjb25maWd1cmVzIFZHQSBwYWdlcyBzbyB0aGF0IHRoZXkgd2lsbCBm
YXVsdC4NCj4gDQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQgb25seSBkb2VzIHRoaXMgaW4gdGhl
IGhvc3QgcDJtLiBPbmNlIHdlDQo+IHN3aXRjaCB0byBhIG5ldyBhbHRwMm0sIHRoZSBtaXNjb25m
aWd1cmVkIGVudHJpZXMgd2lsbCBubyBsb25nZXINCj4gZmF1bHQsIHNvIHRoZSBkaXNwbGF5IHdp
bGwgbm90IGJlIHVwZGF0ZWQuDQo+IA0KPiBUaGlzIHBhdGNoOg0KPiAqIHVwZGF0ZXMgZXB0X2hh
bmRsZV9taXNjb25maWcoKSB0byB1c2UgdGhlIGFjdGl2ZSBhbHRwMm0gaW5zdGVhZA0KPiAgb2Yg
dGhlIGhvc3RwMm07DQo+ICogbW9kaWZpZXMgcDJtX2NoYW5nZV9lbnRyeV90eXBlX2dsb2JhbCgp
LCBwMm1fbWVtb3J5X3R5cGVfY2hhbmdlZA0KPiAgYW5kIHAybV9jaGFuZ2VfdHlwZV9yYW5nZSgp
IHRvIHByb3BhZ2F0ZSB0aGVpciBjaGFuZ2VzIHRvIGFsbA0KPiAgdmFsaWQgYWx0cDJtcy4NCj4g
DQo+IFdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBhbHRwMm0gZmllbGRzIGluIHAybV9tZW1vcnlf
dHlwZV9jaGFuZ2VkKCkNCj4gdGhlIHdob2xlIGZ1bmN0aW9uIGhhcyBiZWVuIHB1dCB1bmRlciBD
T05GSUdfSFZNLg0KDQpTb3JyeSDigJQgYWN0dWFsbHksIEkgdGhpbmsgdGhlcmXigJlzIHlldCBh
bm90aGVyIGlzc3VlIGx1cmtpbmcgaGVyZTogIHAybV9maW5pc2hfdHlwZV9jaGFuZ2UoKS4gSeKA
mWxsIHBva2UgYXJvdW5kIGEgYml0IG1vcmUgdG9tb3Jyb3cuDQoNCiAtR2VvcmdlDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
