From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH net-next] xen-netback: mark expected switch
 fall-through
Date: Mon, 11 Feb 2019 02:50:24 -0700
Message-ID: <5C6145600200007800215864__6130.52633577667$1549878683$gmane$org@prv1-mh.provo.novell.com>
References: <20190208195838.GA11878@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gt8ET-0004Kr-91
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 09:50:33 +0000
In-Reply-To: <20190208195838.GA11878@embeddedor>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A.R.Silva" <gustavo@embeddedor.com>
Cc: Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, davem@davemloft.net
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE5IGF0IDIwOjU4LCA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4gd3JvdGU6
Cj4gSW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFy
ayBzd2l0Y2gKPiBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4K
PiAKPiBXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9Mwo+
IAo+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsaW5n
Cj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEu
IFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC94
ZW4tbmV0YmFjay94ZW5idXMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL3hlbmJ1cy5jIAo+IGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMKPiBpbmRl
eCAyNjI1NzQwYmRjNGEuLjMzMGRkYjY0OTMwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay94ZW5idXMuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1
cy5jCj4gQEAgLTY1NSw3ICs2NTUsNyBAQCBzdGF0aWMgdm9pZCBmcm9udGVuZF9jaGFuZ2VkKHN0
cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCj4gIAkJc2V0X2JhY2tlbmRfc3RhdGUoYmUsIFhlbmJ1
c1N0YXRlQ2xvc2VkKTsKPiAgCQlpZiAoeGVuYnVzX2Rldl9pc19vbmxpbmUoZGV2KSkKPiAgCQkJ
YnJlYWs7Cj4gLQkJLyogZmFsbCB0aHJvdWdoIGlmIG5vdCBvbmxpbmUgKi8KPiArCQkvKiBmYWxs
IHRocm91Z2ggLSBpZiBub3Qgb25saW5lICovCj4gIAljYXNlIFhlbmJ1c1N0YXRlVW5rbm93bjoK
CkNvbnNpZGVyaW5nIHRoZSBmYWxsLXRocm91Z2ggd2FzIGFscmVhZHkgYW5ub3RhdGVkLCBJIGRv
bid0IHRoaW5rCnRpdGxlIGFuZCBkZXNjcmlwdGlvbiByZWFsbHkganVzdGlmeSB0aGUgY2hhbmdl
LiBJcyB0aGUgY29tcGlsZXIgYWZ0ZXIKYSBwYXJ0aWN1bGFyIHdvcmRpbmcgaGVyZT8KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
