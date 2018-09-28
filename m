From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] x86: make sure module array is large
 enough in pvh-boot.c
Date: Fri, 28 Sep 2018 16:13:00 +0100
Message-ID: <20180928151300.s7cfyarz2auqmwiq@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-2-wei.liu2@citrix.com>
 <5BAE437102000078001ECF05@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5uS6-00081s-9X
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:13:10 +0000
Content-Disposition: inline
In-Reply-To: <5BAE437102000078001ECF05@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDk6MDY6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA5LjE4IGF0IDEwOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGUgcmVsb2NhdGlvbiBjb2RlIGluIF9fc3RhcnRfeGVuIHJlcXVpcmVzIG9uZSBl
eHRyYSBlbGVtZW50IGluIHRoZQo+ID4gbW9kdWxlIGFycmF5LiBCeSB0aGUgbG9va3Mgb2YgaXQg
dGhlIHRlbXBvcmFyeSBhcnJheSBpcyBhbHJlYWR5IGxhcmdlCj4gPiBlbm91Z2guIEFkZCBhIEJV
R19PTiB0byBjYXRjaCBhbnkgaXNzdWUgaW4gdGhlIGZ1dHVyZS4KPiA+IAo+ID4gV2hpbGUgYXQg
aXQsIHR1cm4gYW5vdGhlciBBU1NFUlQgdG8gQlVHX09OIGFzIHdlbGwuCj4gCj4gSG1tLCBhIGxp
dHRsZSBzdHJhbmdlIC0gSSB0aG91Z2h0IHdlIGhhZCBhZ3JlZWQgb24gcGFuaWMoKSBiZWZvcmUu
Cj4gVGhlIGV4dHJhIG91dHB1dCBCVUdfT04oKSBwcm9kdWNlcyBpcyB1bmxpa2VseSB0byBiZSBo
ZWxwZnVsIGhlcmUuCj4gV2l0aCB0aGlzIHN3aXRjaGVkIHRvIHBhbmljKCkgaXQgY2VydGFpbmx5
IGNhbiBoYXZlIG15IGFjay4KCk9vcHMsIEkgaGF2ZSBubyBpZGVhIHdoeSBJIGFncmVlZCB0byB1
c2UgcGFuaWMgYnV0IHdyb3RlIEJVR19PTiBpbnN0ZWFkLgpNeSBtZW1vcnkgaGFzIGZhaWxlZCBt
ZS4KCkkgd2lsbCByZXNlbmQgdGhpcyBwYXRjaC4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
