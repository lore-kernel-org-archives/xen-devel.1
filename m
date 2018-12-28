From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: take alignment into
 account when populating p2m in PVH mode
Date: Fri, 28 Dec 2018 14:29:24 +0000
Message-ID: <cc6e88dd-04cc-143a-ea3c-34c3fe360916@citrix.com>
References: <20181228111857.49444-1-roger.pau@citrix.com>
 <20181228111857.49444-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NC5F=PF=citrix.com=prvs=8935d23f2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gct8s-0008W4-Ag
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 14:29:38 +0000
In-Reply-To: <20181228111857.49444-2-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMTIvMjAxOCAxMToxOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgY29k
ZSB0aGF0IGFsbG9jYXRlcyBtZW1vcnkgYW5kIHBvcHVsYXRlcyB0aGUgcDJtIGZvciBQVkggRG9t
MAo+IGRvZXNuJ3QgdGFrZSB0aGUgYWRkcmVzcyBhbGlnbm1lbnQgaW50byBhY2NvdW50LCB0aGlz
IGNhbiBsZWFkIHRvIGhpZ2gKPiBvcmRlciBhbGxvY2F0aW9ucyB0aGF0IHN0YXJ0IG9uIGEgbm9u
LWFsaWduZWQgYWRkcmVzcyB0byBiZSBicm9rZW4KPiBkb3duIGludG8gbG93ZXIgb3JkZXIgZW50
cmllcyBvbiB0aGUgcDJtIHBhZ2UgdGFibGVzLgo+Cj4gRml4IHRoaXMgYnkgdGFraW5nIGludG8g
YWNjb3VudCB0aGUgcDJtIHBhZ2Ugc2l6ZXMgYW5kIGFsaWdubWVudAo+IHJlcXVpcmVtZW50cyB3
aGVuIGFsbG9jYXRpbmcgdGhlIG1lbW9yeSBhbmQgcG9wdWxhdGluZyB0aGUgcDJtLgo+Cj4gUmVw
b3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpOaWNl
LsKgIEkgbm93IGdldCBhIGxheW91dCBhcyBmb2xsb3dzOgoKKFhFTikgKioqIEJ1aWxkaW5nIGEg
UFZIIERvbTAgKioqCihYRU4pIHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2UoZDAsIDAsIGEwKQoo
WEVOKSBndWVzdF9waHlzbWFwX2FkZF9wYWdlKGQwLCAwMDAwMCwgMTAwYjAwLCA3ID0gNTEya0Ip
CihYRU4pIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoZDAsIDAwMDgwLCAxMDBiYzAsIDUgPSAxMjhr
QikKKFhFTikgcHZoX3BvcHVsYXRlX21lbW9yeV9yYW5nZShkMCwgMTAwLCAzNjApCihYRU4pIGd1
ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoZDAsIDAwMTAwLCAxMDBhMDAsIDggPSAxMDI0a0IpCihYRU4p
IGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoZDAsIDAwMjAwLCAxMDA4MDAsIDkgPSAyMDQ4a0IpCihY
RU4pIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoZDAsIDAwNDAwLCAxMDBiODAsIDYgPSAyNTZrQikK
KFhFTikgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShkMCwgMDA0NDAsIDEwMDdlMCwgNSA9IDEyOGtC
KQoKd2hpY2ggbG9va3MgdG8gYmUgY29ycmVjdC4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpUZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
