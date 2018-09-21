From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 7/9] x86/cpuidle: patch some indirect
 calls to direct ones
Date: Fri, 21 Sep 2018 15:01:09 +0100
Message-ID: <20180921140109.urvjovcktevgbp64@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C4BE02000078001E748E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3M03-0004i2-VW
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 14:01:40 +0000
Content-Disposition: inline
In-Reply-To: <5B97C4BE02000078001E748E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MzU6NThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRm9yIG5vdyBvbmx5IHRoZSBvbmVzIHVzZWQgZHVyaW5nIGVudGVyaW5nL2V4aXRpbmcg
b2YgaWRsZSBzdGF0ZXMgYXJlCj4gY29udmVydGVkLiBBZGRpdGlvbmFsbHkgcG1faWRsZXssX3Nh
dmV9IGFuZCBsYXBpY190aW1lcl97b24sb2ZmfSBjYW4ndAo+IGJlIGNvbnZlcnRlZCwgYXMgdGhl
eSBtYXkgZ2V0IGVzdGFibGlzaGVkIHJhdGhlciBsYXRlICh3aGVuIERvbTAgaXMKPiBhbHJlYWR5
IGFjdGl2ZSkuCj4gCj4gTm90ZSB0aGF0IGZvciBwYXRjaGluZyB0byBiZSBkZWZlcnJlZCB1bnRp
bCBhZnRlciB0aGUgcHJlLVNNUCBpbml0Y2FsbHMKPiAoZnJvbSB3aGVyZSBjcHVpZGxlX2luaXRf
Y3B1KCkgcnVucyB0aGUgZmlyc3QgdGltZSkgdGhlIHBvaW50ZXJzIG5lZWQgdG8KPiBzdGFydCBv
dXQgYXMgTlVMTC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
