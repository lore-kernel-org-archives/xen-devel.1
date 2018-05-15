From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/ocaml/libs/xc fix gcc-8
 format-truncation warning
Date: Tue, 15 May 2018 14:19:43 +0100
Message-ID: <20180515131942.tbdclricnwolm7rs@citrix.com>
References: <20180515014843.19642-1-git@johnthomson.fastmail.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gfjq=ic=citrix.com=prvs=666122f4f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fIZsD-0000B9-Rq
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 13:20:13 +0000
Content-Disposition: inline
In-Reply-To: <20180515014843.19642-1-git@johnthomson.fastmail.com.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Thomson <git@johnthomson.fastmail.com.au>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, christian.lindig@citrix.com, dave@recoil.org
List-Id: xen-devel@lists.xenproject.org

Q0MgSnVlcmdlbiwgSSB0aGluayB0aGlzIHNob3VsZCBiZSBpbiA0LjExCgpPbiBUdWUsIE1heSAx
NSwgMjAxOCBhdCAxMTo0ODo0M0FNICsxMDAwLCBKb2huIFRob21zb24gd3JvdGU6Cj4gIENDICAg
ICAgIHhlbmN0cmxfc3R1YnMubwo+IHhlbmN0cmxfc3R1YnMuYzogSW4gZnVuY3Rpb24gJ2ZhaWx3
aXRoX3hjJzoKPiB4ZW5jdHJsX3N0dWJzLmM6NjU6MTc6IGVycm9yOiAnc25wcmludGYnIG91dHB1
dCBtYXkgYmUgdHJ1bmNhdGVkIGJlZm9yZSB0aGUgbGFzdCBmb3JtYXQgY2hhcmFjdGVyIFstV2Vy
cm9yPWZvcm1hdC10cnVuY2F0aW9uPV0KPiAgICAgICAiJWQ6ICVzOiAlcyIsIGVycm9yLT5jb2Rl
LAo+ICAgICAgICAgICAgICAgICAgXgo+IHhlbmN0cmxfc3R1YnMuYzo2NDo0OiBub3RlOiAnc25w
cmludGYnIG91dHB1dCA2IG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDEwMjkpIGludG8gYSBkZXN0
aW5hdGlvbiBvZiBzaXplIDEwMjgKPiAgICAgc25wcmludGYoZXJyb3Jfc3RyLCBzaXplb2YoZXJy
b3Jfc3RyKSwKPiAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAg
ICAgICAiJWQ6ICVzOiAlcyIsIGVycm9yLT5jb2RlLAo+ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4gICAgICAgeGNfZXJyb3JfY29kZV90b19kZXNjKGVycm9yLT5jb2RlKSwKPiAg
ICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgIGVycm9yLT5t
ZXNzYWdlKTsKPiAgICAgICB+fn5+fn5+fn5+fn5+fn4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWlu
ZyB0cmVhdGVkIGFzIGVycm9ycwo+IG1ha2VbOF06ICoqKiBbL2J1aWxkL3hlbi1naXQvc3JjL3hl
bi90b29scy9vY2FtbC9saWJzL3hjLy4uLy4uL01ha2VmaWxlLnJ1bGVzOjM3OiB4ZW5jdHJsX3N0
dWJzLm9dIEVycm9yIDEKPiBtCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9obiBUaG9tc29uIDxnaXRA
am9obnRob21zb24uZmFzdG1haWwuY29tLmF1Pgo+IC0tLQo+ICB0b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmxfc3R1YnMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKPiBpbmRl
eCBmOTcwNzBjOGIwLi5kNDMwOWFkOTdlIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybF9zdHVicy5jCj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0
dWJzLmMKPiBAQCAtNTQsNyArNTQsNyBAQAo+ICAKPiAgc3RhdGljIHZvaWQgTm9yZXR1cm4gZmFp
bHdpdGhfeGMoeGNfaW50ZXJmYWNlICp4Y2gpCj4gIHsKPiAtCWNoYXIgZXJyb3Jfc3RyWzEwMjhd
Owo+ICsJY2hhciBlcnJvcl9zdHJbWENfTUFYX0VSUk9SX01TR19MRU4gKyA2XTsKPiAgCWlmICh4
Y2gpIHsKPiAgCQljb25zdCB4Y19lcnJvciAqZXJyb3IgPSB4Y19nZXRfbGFzdF9lcnJvcih4Y2gp
Owo+ICAJCWlmIChlcnJvci0+Y29kZSA9PSBYQ19FUlJPUl9OT05FKQo+IC0tIAo+IDIuMTcuMAo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
WGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
