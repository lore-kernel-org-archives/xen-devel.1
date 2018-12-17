From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: fix test harness and fuzzer build
 dependencies
Date: Mon, 17 Dec 2018 15:57:49 +0000
Message-ID: <30038565-7260-02bc-8c6d-b7cdea320fb7@citrix.com>
References: <5C136E9202000078002060C0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kJdr=O2=citrix.com=prvs=882bfab70=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gYvHF-000289-RO
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 15:57:53 +0000
In-Reply-To: <5C136E9202000078002060C0@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTIvMjAxOCAwODo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQ29tbWl0IGZkMzVmMzJi
NGIgKCJ0b29scy94ODZlbXVsOiBVc2Ugc3RydWN0IGNwdWlkX3BvbGljeSBpbiB0aGUKPiB1c2Vy
c3BhY2UgdGVzdCBoYXJuZXNzZXMiKSBkaWRuJ3QgYWNjb3VudCBmb3IgdGhlIGRlcGVuZGVuY2ll
cyBvZgo+IGNwdWlkLWF1dG9nZW4uaCB0byBwb3RlbnRpYWxseSBjaGFuZ2UgYmV0d2VlbiBpbmNy
ZW1lbnRhbCBidWlsZHMuCj4gUHV0dGluZyB0aGUgbWFrZSBpbnZvY2F0aW9uIHRvIHByb2R1Y2Ug
dGhlIGhlYWRlciB0b2dldGhlciB3aXRoIHRoZQo+IGRpcmVjdG9yeSB0cmVlIGNyZWF0aW9uIHRo
ZXJlZm9yZSBkb2VzIG5vdCB3b3JrLiBJbnRyb2R1Y2UgYSBzZXBhcmF0ZQo+IGdvYWwuCj4KPiBG
dXJ0aGVybW9yZSB0aGUgaGFybmVzcyBoYXMgYSAicnVuIiBnb2FsIHdoaWNoIGlzIHN1cHBvc2Vk
IHRvIGJlIHVzYWJsZQo+IGluZGVwZW5kZW50bHkgb2YgdGhlIHJlc3Qgb2YgdGhlIHRvb2xzIHN1
Yi10cmVlIGJ1aWxkaW5nLCBhbmQgYm90aCB0aGUKPiBoYXJuZXNzIGFuZCB0aGUgZnV6emVyIGNv
ZGUgYXJlIGFsc28gc3VwcG9zZWQgdG8gYmUgYnVpbGRhYmxlCj4gaW5kZXBlbmRlbnRseS4gVGhl
cmVmb3JlIHRoZXkgbmVlZCB0byByZWN1cnNpdmxleSBpbnZva2UgbWFrZSB0byByZS0KPiBidWls
ZCB0aGUgZ2VuZXJhdGVkIGhlYWRlciBpZiBuZWVkZWQuCj4KPiBGaW5hbGx5IGNwdWlkLm8gZGlk
IG5vdCBoYXZlIGFueSBkZXBlbmRlbmNpZXMgYWRkZWQgZm9yIGl0Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
