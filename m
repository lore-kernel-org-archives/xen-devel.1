From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [BUG] docs: our man page generation uses
 http://man.he.net/ by default which causes broken links. It should be
 changed to point to a relative path
Date: Thu, 2 Aug 2018 11:25:56 +0000
Message-ID: <91DDCA13-DF93-46CB-9CEB-7F2A000FFFF8@citrix.com>
References: <24902838-BA23-4032-8FCC-384CA51C0A4E@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2lmd=kr=citrix.com=prvs=7459f703a=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1flBjz-0004XG-Fs
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 11:25:59 +0000
In-Reply-To: <24902838-BA23-4032-8FCC-384CA51C0A4E@citrix.com>
Content-Language: en-US
Content-ID: <CD098CDE14D6BA46A5CE30AE106D7E35@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDAyLzA4LzIwMTgsIDEyOjI0LCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0
cml4LmNvbT4gd3JvdGU6DQoNCiAgICBIaSBhbGwsDQogICAgDQogICAgbW9zdCBvZiBvdXIgbWFu
IHBhZ2VzIG9uIHByZXR0eSBtdWNoIGFsbCByZWxlYXNlcyBmcm9tIDQuMiBjb250YWluIGJyb2tl
biBsaW5rcy4gDQogICAgDQogICAgRm9yIGV4YW1wbGU6DQogICAgSW4gaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZG9jcy91bnN0YWJsZS9tYW4veGwuY2ZnLjUuaHRtbCB0aGUgc291cmNlIGNvbnRh
aW5zOg0KICAgIA0KICAgICJGb3IgbW9yZSBkZXRhaWxzLCBzZWUgTDx4bC1udW1hLXBsYWNlbWVu
dCg3KT4uIiANCiAgICBNYXBzIG9udG8gaHR0cDovL21hbi5oZS5uZXQvbWFuNy94bC1udW1hLXBs
YWNlbWVudCAgKGRvZXMgbm90IGV4aXN0KQ0KICAgIA0KICAgIOKAnFNlZSBMPGh0dHA6Ly9tYW4u
aGUubmV0L21hbjUveGwtZGlzay1jb25maWd1cmF0aW9uPiBmb3IgbW9yZSBkZXRhaWxzLuKAnSAN
Cg0KVGhhdCBzaG91bGQgcmVhZCAtIGNvcHkgYW5kIHBhc3RlDQrigJxTZWUgTDx4bC1kaXNrLWNv
bmZpZ3VyYXRpb24oNSk+IGZvciBtb3JlIGRldGFpbHMu4oCdDQoNCiAgICBNYXBzIG9udG8gaHR0
cDovL21hbi5oZS5uZXQvbWFuNS94bC1kaXNrLWNvbmZpZ3VyYXRpb24gKGRvZXMgbm90IGV4aXN0
KQ0KICAgIA0KICAgIEV0Yy4NCiAgICANCiAgICBUaGVyZSBzZWVtIHRvIGJlIHR3byBpc3N1ZXM6
DQogICAgKiBUaGUgcm9vdCBwYXRoIGh0dHA6Ly9tYW4uaGUubmV0LCB3aGljaCBpcyBpbmNvcnJl
Y3QNCiAgICAqIFRoZSByZXNvbHV0aW9uIG9mIGZpbGVuYW1lcyB0byBtYW48eD4vPG5hbWU+OiBz
aG91bGQgYmUgbWFuLzxuYW1lPi48eD4uaHRtbA0KICAgIA0KICAgIFByb2JhYmx5IHdlIG5lZWQg
dG8gZmVlZCBzb21lIGFyZ3VtZW50cyB0byBwcm9iYWJseSB3ZSBuZWVkIHRvIGZlZWQgc29tZSBh
cmd1bWVudHMgDQogICAgdG8gcG9kMmh0bWwgaW4gb3JkZXIgdG8gZ2VuZXJhdGUgdGhlIGNvcnJl
Y3QgdXJscy4gU2VlICBodHRwczovL3Blcmxkb2MucGVybC5vcmcvcG9kMmh0bWwuaHRtbCANCiAg
ICAobWF5YmUgd2UgbmVlZCB3ZSBuZWVkIOKAk2h0bWxkaXIpLiBGb3Igb3VyIGRvY3MgYnVpbGQs
IHRoaXMgc2hvdWxkIHByb2JhYmx5IGdvIHRvIA0KICAgIGh0dHBzOi8veGVuYml0cy54ZW4ub3Jn
L2RvY3MvdW5zdGFibGUvbWFuLyB3aGlsZSBmb3IgbG9jYWwgaW5zdGFsbHMgdG8gDQogICAgJHtw
cmVmaXh9L3NoYXJlL2RvYy94ZW4vaHRtbC9tYW4gb3Igc29tZXRoaW5nIGxpa2UgaXQuDQogICAg
DQogICAgSSBoYWQgYSBsb29rIHRvIHNlZSB3aGV0aGVyIEkgY2FuIGZpeCB0aGlzLCBidXQgdGhh
dCBzZWVtcyBhIGxpdHRsZSB0b28gY29tcGxleCBmb3IgbWUNCiAgICANCiAgICBSZWdhcmRzDQog
ICAgTGFycw0KICAgIA0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
