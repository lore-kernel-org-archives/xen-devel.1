From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/5] pci: use function generation macros for
 pci_config_{write, read}<size>
Date: Mon, 27 May 2019 18:08:37 +0200
Message-ID: <20190527160837.ilyt76lgcxtqqhgg@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-3-roger.pau@citrix.com>
 <cdc13026-212f-65a0-0fdf-a6bcb919de0e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVIBA-0002E8-Pz
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 16:08:52 +0000
Content-Disposition: inline
In-Reply-To: <cdc13026-212f-65a0-0fdf-a6bcb919de0e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTA6Mjk6MjZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMC8wNS8yMDE5IDE3OjEwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBU
aGlzIGF2b2lkcyBjb2RlIGR1cGxpY2F0aW9uIGJldHdlZW4gdGhlIGhlbHBlcnMuCj4gPgo+ID4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gLTEuwqAgSSBzZWUgdGhp
cyBhcyBhY3RpdmVseSBtYWtpbmcgdGhlIGNvZGUgd29yc2UsIG5vdCBhbiBpbXByb3ZlbWVudC4K
ClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJJ20gbm90IHNwZWNpYWxseSB0aHJpbGxlZCBlaXRo
ZXIgd2F5IChzZWVpbmcKSmFuIHByb3ZpZGVkIGhpcyBSQiksIHRoZSBtYWluIG1vdGl2YXRpb24g
YmVoaW5kIHRoZSBjaGFuZ2Ugd2FzIHRvCmF2b2lkIGhhdmluZyB0byBjaGFuZ2UgdGhlIGxpc3Qg
b2YgcGFyYW1ldGVycyB0byBhIHBjaV9zYmRmX3QgaW4gZWFjaApoZWxwZXIsIEkgZmluZCB0aGlz
IGVycm9yIHByb25lIHdoZW4gdGhlIGNvZGUgaXMgdGhlIHNhbWUgaW4gYWxsIDMKZGlmZmVyZW50
IGhlbHBlcnMgZXhjZXB0IGZvciB0aGUgc2l6ZSBkaWZmZXJlbmNlLgoKR2l2ZW4gQW5kcmV3J3Mg
b3BpbmlvbiBkbyB5b3Ugc3RpbGwgY29uc2lkZXIgdGhpcyB1c2VmdWwgSmFuPwoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
