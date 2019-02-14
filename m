From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 14 Feb 2019 04:49:21 -0700
Message-ID: <5C6555C10200007800216A6F@prv1-mh.provo.novell.com>
References: <20190214111009.16448-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guFW8-0003mp-3X
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 11:49:24 +0000
In-Reply-To: <20190214111009.16448-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDEyOjEwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBkb20w
X2NvbnN0cnVjdF9wdigpIGhhcyBsb2dpYyB0byB0cmFuc2l0aW9uIGRvbTAgaW50byBhIGNvbXBh
dCBkb21haW4gd2hlbgo+IGJvb3RpbmcgYW4gRUxGMzIgaW1hZ2UuCj4gCj4gT25lIGFzcGVjdCB3
aGljaCBpcyBtaXNzaW5nIGlzIHRoZSBDUFVJRCBwb2xpY3kgcmVjYWxjdWxhdGlvbiwgbWVhbmlu
ZyB0aGF0IGEKPiAzMmJpdCBkb20wIHNlZXMgYSA2NGJpdCBwb2xpY3ksIHdoaWNoIGRpZmZlciBi
eSB0aGUgTG9uZyBNb2RlIGZlYXR1cmUgZmxhZyBpbgo+IHBhcnRpY3VsYXIuICBBbm90aGVyIG1p
c3NpbmcgaXRlbSBpcyB0aGUgeDg3X2ZpcF93aWR0aCBpbml0aWFsaXNhdGlvbi4KPiAKPiBVcGRh
dGUgZG9tMF9jb25zdHJ1Y3RfcHYoKSB0byB1c2Ugc3dpdGNoX2NvbXBhdCgpLCByYXRoZXIgdGhh
biByZXRhaW5pbmcgdGhlCj4gb3BlbmNvZGluZy4gIFBvc2l0aW9uIHRoZSBjYWxsIHRvIHN3aXRj
aF9jb21wYXQoKSBzdWNoIHRoYXQgdGhlIGNvbXBhdDMyIGxvY2FsCj4gdmFyaWFibGUgY2FuIGRp
c2FwcGVhciBlbnRpcmVseS4KPiAKPiBUaGUgMzJiaXQgbW9uaXRvciB0YWJsZSBpcyBub3cgY3Jl
YXRlZCBieSBzZXR1cF9jb21wYXRfbDQoKSwgYXZvaWRpbmcgdGhlIG5lZWQKPiB0byBmb3IgbWFu
dWFsIGNyZWF0aW9uIGxhdGVyLiAgRnVydGhlcm1vcmUsIHRoZSBMMyB0YWJsZSBjcmVhdGlvbiBp
cyByZWR1bmRhbnQKPiB3aXRoIHRoZSBsb2dpYyBpbnNpZGUgdGhlIG1haW4gbWFwcGluZyBsb29w
LCBzbyBjYW4gYmUgZHJvcHBlZCBhcyB3ZWxsLgoKVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vIGxv
bmdlciBhcHBsaWNhYmxlIGFmYWljdC4KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKV2l0aCB0aGF0IGxpbmUgZHJvcHBlZApSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
