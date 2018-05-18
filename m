From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 3/3] xen-hvm: try to use
 xenforeignmemory_map_resource() to map ioreq pages
Date: Fri, 18 May 2018 11:17:03 +0100
Message-ID: <20180518101703.GQ2057@perard.uk.xensource.com>
References: <20180515164053.14604-1-paul.durrant@citrix.com>
 <20180515164053.14604-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ktro=if=citrix.com=prvs=6693598a1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJcRh-0007SL-2M
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 10:17:09 +0000
Content-Disposition: inline
In-Reply-To: <20180515164053.14604-4-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMTUsIDIwMTggYXQgMDU6NDA6NTNQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFhlbiA0LjExIGhhcyBhIG5ldyBBUEkgdG8gZGlyZWN0bHkgbWFwIGd1ZXN0IHJlc291
cmNlcy4gQW1vbmcgdGhlIHJlc291cmNlcwo+IHRoYXQgY2FuIGJlIG1hcHBlZCB1c2luZyB0aGlz
IEFQSSBhcmUgaW9yZXEgcGFnZXMuCj4gCj4gVGhpcyBwYXRjaCBtb2RpZmllcyBRRU1VIHRvIGF0
dGVtcHQgdG8gdXNlIHRoZSBuZXcgQVBJIHNob3VsZCBpdCBleGlzdCwKPiBmYWxsaW5nIGJhY2sg
dG8gdGhlIHByZXZpb3VzIG1lY2hhbmlzbSBpZiBpdCBpcyB1bmF2YWlsYWJsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
