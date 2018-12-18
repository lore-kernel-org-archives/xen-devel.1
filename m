From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86emul: avoid triggering assertions
 with VME/PVI early #GP check
Date: Tue, 18 Dec 2018 13:52:11 +0000
Message-ID: <b426b7f9-b269-9694-f738-85e9a9c7a6ac@citrix.com>
References: <5C0F79A90200007800204F52@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=snIL=O3=citrix.com=prvs=883e14dc5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZFnc-0008FL-TS
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 13:52:40 +0000
In-Reply-To: <5C0F79A90200007800204F52@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTIvMjAxOCAwODo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gY29tbWl0IGVmZTlj
YmE2NmMgKCJ4ODZlbXVsOiBWTUUgYW5kIFBWSSBtb2RlcyByZXF1aXJlIGEgI0dQKDApIGNoZWNr
Cj4gZmlyc3QgdGhpbmciKSBJIG5lZ2xlY3RlZCB0aGUgZmFjdCB0aGF0IHRoZSByZXRpcmUgZmxh
Z3MgZ2V0IHphcHBlZCBvbmx5Cj4gaW4geDg2X2RlY29kZSgpLCB3aGljaCBoYXNuJ3QgYmVlbiBp
bnZva2VkIHlldCBhdCB0aGUgcG9pbnQgb2YgdGhlICNHUCgwKQo+IGNoZWNrIGFkZGVkLiBNb3Zl
IG91dHB1dCBzdGF0ZSBpbml0aWFsaXphdGlvbiBpbnRvIGEgaGVscGVyIGZ1bmN0aW9uLAo+IGFu
ZCBpbnZva2UgaXQgZnJvbSB0aGUgY2FsbGVycyBvZiB4ODZfZGVjb2RlKCkgaW5zdGVhZCBvZiBk
b2luZyBpdAo+IChwb3NzaWJseSB0b28gbGF0ZSkgaW4gdGhhdCBmdW5jdGlvbi4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
