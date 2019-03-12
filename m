From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86: don't allow clearing of
 TF_kernel_mode for other than 64-bit PV
Date: Tue, 12 Mar 2019 12:49:24 +0000
Message-ID: <20190312124924.m5tvt526wekegguw@zion.uk.xensource.com>
References: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7hwM=RP=citrix.com=prvs=967af9503=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h3gqi-0006ai-2r
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 12:49:40 +0000
Content-Disposition: inline
In-Reply-To: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMTA6Mzc6NDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGZsYWcgaXMgcmVhbGx5IG9ubHkgbWVhbnQgZm9yIHRob3NlLCBib3RoIEhWTSBh
bmQgMzItYml0IFBWIHRlbGwKPiBrZXJuZWwgZnJvbSB1c2VyIG1vZGUgYmFzZWQgb24gQ1BML1JQ
TC4gUmVtb3ZlIHRoZSBhbGwtcXVlc3Rpb24tbWFya3MKPiBjb21tZW50IGFuZCBsZXQncyBiZSBv
biB0aGUgc2FmZSBzaWRlIGhlcmUgYW5kIGFsc28gc3VwcHJlc3MgY2xlYXJpbmcKPiBmb3IgMzIt
Yml0IFBWICh0aGlzIGlzbid0IGEgZmFzdCBwYXRoIGFmdGVyIGFsbCkuCj4gCj4gUmVtb3ZlIG5v
IGxvbmdlciBuZWNlc3NhcnkgaXNfcHZfMzJiaXRfKigpIGZyb20gc2hfdXBkYXRlX2NyMygpIGFu
ZAo+IHNoX3dhbGtfZ3Vlc3RfdGFibGVzKCkuIE5vdGUgdGhhdCBzaGFkb3dfb25lX2JpdF9kaXNh
YmxlKCkgYWxyZWFkeQo+IGFzc3VtZXMgdGhlIG5ldyBiZWhhdmlvci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
