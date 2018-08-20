From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/mm: re-arrange get_page_from_l<N>e() vs
 pv_l1tf_check_l<N>e
Date: Mon, 20 Aug 2018 14:08:47 +0100
Message-ID: <20180820130847.sotikvmbg7uqhrly@citrix.com>
References: <5B766E5702000078001DF307@prv1-mh.provo.novell.com>
 <20180820095936.agibjjgo2qswfmwz@citrix.com>
 <5B7AA7FC02000078001DFFD9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frjvP-0001gO-0E
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 13:08:51 +0000
Content-Disposition: inline
In-Reply-To: <5B7AA7FC02000078001DFFD9@prv1-mh.provo.novell.com>
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

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDU6Mzc6MzJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjA4LjE4IGF0IDExOjU5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIEF1ZyAxNywgMjAxOCBhdCAxMjo0MjozMUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiBSZXN0b3JlIHN5bW1ldHJ5IGJldHdlZW4gZ2V0X3BhZ2VfZnJvbV9s
PE4+ZSgpOiBwdl9sMXRmX2NoZWNrX2w8Tj5lIGlzCj4gPj4gdW5pZm9ybWx5IGludm9rZWQgZnJv
bSBvdXRzaWRlIG9mIHRoZW0uIFRoZXkncmUgbm8gbG9uZ2VyIGdldHRpbmcgY2FsbGVkCj4gPj4g
Zm9yIG5vbi1wcmVzZW50IFBURXMuIFRoaXMgd2F5IHRoZSBzbGlnaHRseSBvZGQgdGhyZWUtd2F5
IHJldHVybiB2YWx1ZQo+ID4+IG1lYW5pbmcgb2YgdGhlIGhpZ2hlciBsZXZlbCBvbmVzIGNhbiBh
bHNvIGJlIGdvdCByaWQgb2YuCj4gPj4gCj4gPj4gSW50cm9kdWNlIGxvY2FsIHZhcmlhYmxlcyBo
b2xkaW5nIHRoZSBwYWdlIHRhYmxlIGVudHJpZXMgcHJvY2Vzc2VkLCBhbmQKPiA+PiB1c2UgdGhl
bSB0aHJvdWdob3V0IHRoZSBsb29wIGJvZGllcyBpbnN0ZWFkIG9mIHJlLXJlYWRpbmcgdGhlbSBm
cm9tIHRoZQo+ID4+IHBhZ2UgdGFibGUgc2V2ZXJhbCB0aW1lcy4KPiA+PiAKPiA+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gCj4gPj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tLmMKPiA+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+ID4+IEBAIC05
MDAsOCArOTAwLDExIEBAIGdldF9wYWdlX2Zyb21fbDFlKAo+ID4+ICAgICAgc3RydWN0IGRvbWFp
biAqcmVhbF9wZ19vd25lcjsKPiA+PiAgICAgIGJvb2wgd3JpdGU7Cj4gPj4gIAo+ID4+IC0gICAg
aWYgKCAhKGwxZiAmIF9QQUdFX1BSRVNFTlQpICkKPiA+PiArICAgIGlmICggdW5saWtlbHkoIShs
MWYgJiBfUEFHRV9QUkVTRU5UKSkgKQo+ID4+ICsgICAgewo+ID4+ICsgICAgICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOwo+ID4+ICAgICAgICAgIHJldHVybiAwOwo+ID4+ICsgICAgfQo+ID4gCj4g
PiBXaHkgaXMgdGhpcyBuZWVkZWQgaGVyZT8gQWNjb3JkaW5nIHRvIGNvbW1pdCBtZXNzYWdlIGdl
dF9wYWdlX2Zyb21fbDFlCj4gPiBzaG91bGRuJ3QgYmUgY2FsbGVkIHdpdGggbm9uLXByZXNlbnQg
bDFlLgo+IAo+IENvcnJlY3QsIGhlbmNlIHRoZSBhc3NlcnRpb24uIE90aGUgdGhhbiBpdHMgaGln
aGVyLWxldmVsIHNpYmxpbmdzLAo+IHRoaXMgZnVuY3Rpb24gaXMgbm9uLXN0YXRpYywgYW5kIGhl
bmNlIEkgZmVsdCBpdCB3YXJyYW50ZWQgdG8gaGF2ZQo+IHN1Y2ggYW4gYXNzZXJ0aW9uLgoKV2l0
aCB0aGUgYWJvdmUgcHV0IGludG8gY29tbWl0IG1lc3NhZ2U6CgpSZXZpZXdlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
