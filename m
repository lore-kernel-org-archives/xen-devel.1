From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/shadow: don't pass wrong L4 MFN to
 guest_walk_tables()
Date: Tue, 19 Feb 2019 14:15:14 +0000
Message-ID: <31f2dcc6-7baf-8b61-8863-be76b496d55e@citrix.com>
References: <5C6BF02B0200007800217F32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Om4d=Q2=citrix.com=prvs=946c9af64=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gw6B4-0004wz-OK
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 14:15:18 +0000
In-Reply-To: <5C6BF02B0200007800217F32@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xOS8xOSAxMjowMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gNjQtYml0IFBWIGd1ZXN0
IHVzZXIgbW9kZSBydW5zIG9uIGEgZGlmZmVyZW50IEw0IHRhYmxlLiBNYWtlIHN1cmUKPiAtIHRo
ZSBhY2Nlc3NlZCBiaXQgZ2V0cyBzZXQgaW4gdGhlIGNvcnJlY3QgdGFibGUgKGFuZCBpbiBsb2ct
ZGlydHkKPiAgIG1vZGUgdGhlIGNvcnJlY3QgcGFnZSBnZXRzIG1hcmtlZCBkaXJ0eSkgZHVyaW5n
IGd1ZXN0IHdhbGtzLAo+IC0gdGhlIGNvcnJlY3QgdGFibGUgZ2V0cyBhdWRpdGVkIGJ5IHNoX2F1
ZGl0X2d3KCksCj4gLSBjb3JyZWN0IGluZm8gZ2V0cyBsb2dnZWQgYnkgcHJpbnRfZ3coKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
