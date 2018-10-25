From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/17] x86/amd: put setting
 pv_post_outb_hook under CONFIG_PV
Date: Thu, 25 Oct 2018 03:22:17 -0600
Message-ID: <5BD18B4902000078001F4897@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <f1fafccc6ba352431e3ba72e834fd37e37b9eb9e.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0AC4C02000078001F1097@prv1-mh.provo.novell.com>
 <20181015111924.lkjcwk7oodihz5z4@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=29w0=nf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFbqQ-0005Z2-Vb
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 09:22:23 +0000
In-Reply-To: <20181015111924.lkjcwk7oodihz5z4@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjEwLjE4IGF0IDEzOjE5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgT2N0IDEyLCAyMDE4IGF0IDA4OjE0OjM2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMTAuMTggYXQgMTc6NDMsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4gPiBJdCBpcyB1c2VkIGJ5IFBWIGNvZGUgb25seS4KPj4gCj4+IEFuZCB3cm9uZ2x5
IHNvIC0gdGhlIHNhbWUgaXMgbmVlZGVkIGZvciBhIFBWSCBEb20wIGFmYWljdC4KPiAKPiBZZXMs
IGxvb2tpbmcgYXQgdGhlIG1vZGVscyBhZmZlY3RlZCBieSB0aGlzIGlzc3VlIGFjY29yZGluZyB0
bwo+IGluaXRfYW1kIGl0IHNlZW1zIHRvIGNvdmVyIHRoZSBmdWxsIEFNRCBsaW5lIChmcm9tIGZh
bWlseSAweGYgdG8KPiAweDE3KS4gSSBkb24ndCBzZWVtIHRvIGZpbmQgYSByZWZlcmVuY2UgaW4g
dGhlIGNvZGUgdG8gdGhlIEVycmF0YSwgZG8KPiB5b3Uga25vdyBpZiB0aGVyZSdzIHNvbWUgZm9y
bWFsIGRlc2NyaXB0aW9uIG9mIGl0PwoKSSBkb24ndCByZWNhbGwgdGhpcyBoYXZpbmcgYmVlbiBj
b25zaWRlcmVkIGFuIGVycmF0dW0uCgpDaGVja2luZyBqdXN0IHRoZSBGYW0xMCBhbmQgRmFtMTUg
QktER3MsIEknbSBnZXR0aW5nIHRoZQppbXByZXNzaW9uIHRoYXQgRmFtMTUgZG9lcyBub3QgaGF2
ZSB0aGUgaXNzdWUgd29ya2VkIGFyb3VuZApoZXJlLiBJdCBtaWdodCBmdXJ0aGVyIGJlIHRoYXQg
bm90IGV2ZW4gYWxsIEZhbTEwIHN0ZXBwaW5ncyBhcmUKYWZmZWN0ZWQuIEJyaWFuIC0gYW55IGNo
YW5jZSB5b3UgY291bGQgY2xhcmlmeSB0aGlzIGZvciB1cz8KCkluZGVwZW5kZW50IG9mIHRoZSBy
YW5nZSBvZiBzeXN0ZW1zIGFmZmVjdGVkIEkgc3RpbGwgdGhpbmsgdGhhdApQVkggRG9tMCBiZWhh
dmlvciBoZXJlIG91Z2h0IHRvIGJlIHRoZSBzYW1lIGFzIFBWIERvbTAncy4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
