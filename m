From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH] tools/ocaml/libs/xc fix gcc-8
 format-truncation warning
Date: Tue, 15 May 2018 13:08:35 +0000
Message-ID: <9DD59EF0-8EF7-4E81-8586-1246CFECE5B7@citrix.com>
References: <20180515014843.19642-1-git@johnthomson.fastmail.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=12uc=ic=citrix.com=prvs=666ec97b1=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1fIZht-0007Ku-LD
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 13:09:33 +0000
In-Reply-To: <20180515014843.19642-1-git@johnthomson.fastmail.com.au>
Content-Language: en-US
Content-ID: <B49A8DE3AD44AF4286F0B2D491688FCC@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Thomson <git@johnthomson.fastmail.com.au>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE1IE1heSAyMDE4LCBhdCAwMjo0OCwgSm9obiBUaG9tc29uIDxnaXRAam9obnRob21z
b24uZmFzdG1haWwuY29tLmF1PiB3cm90ZToKPiAKPiBDQyAgICAgICB4ZW5jdHJsX3N0dWJzLm8K
PiB4ZW5jdHJsX3N0dWJzLmM6IEluIGZ1bmN0aW9uICdmYWlsd2l0aF94Yyc6Cj4geGVuY3RybF9z
dHVicy5jOjY1OjE3OiBlcnJvcjogJ3NucHJpbnRmJyBvdXRwdXQgbWF5IGJlIHRydW5jYXRlZCBi
ZWZvcmUgdGhlIGxhc3QgZm9ybWF0IGNoYXJhY3RlciBbLVdlcnJvcj1mb3JtYXQtdHJ1bmNhdGlv
bj1dCj4gICAgICAiJWQ6ICVzOiAlcyIsIGVycm9yLT5jb2RlLAo+ICAgICAgICAgICAgICAgICBe
Cj4geGVuY3RybF9zdHVicy5jOjY0OjQ6IG5vdGU6ICdzbnByaW50Zicgb3V0cHV0IDYgb3IgbW9y
ZSBieXRlcyAoYXNzdW1pbmcgMTAyOSkgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgMTAyOAo+
ICAgIHNucHJpbnRmKGVycm9yX3N0ciwgc2l6ZW9mKGVycm9yX3N0ciksCj4gICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICIlZDogJXM6ICVzIiwgZXJyb3It
PmNvZGUsCj4gICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgeGNfZXJyb3Jf
Y29kZV90b19kZXNjKGVycm9yLT5jb2RlKSwKPiAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4gICAgICBlcnJvci0+bWVzc2FnZSk7Cj4gICAgICB+fn5+fn5+fn5+fn5+
fn4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IG1ha2VbOF06
ICoqKiBbL2J1aWxkL3hlbi1naXQvc3JjL3hlbi90b29scy9vY2FtbC9saWJzL3hjLy4uLy4uL01h
a2VmaWxlLnJ1bGVzOjM3OiB4ZW5jdHJsX3N0dWJzLm9dIEVycm9yIDEKPiBtCj4gCj4gU2lnbmVk
LW9mZi1ieTogSm9obiBUaG9tc29uIDxnaXRAam9obnRob21zb24uZmFzdG1haWwuY29tLmF1Pgo+
IC0tLQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIHwgMiArLQo+IDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybF9zdHVicy5jCj4gaW5kZXggZjk3MDcwYzhiMC4uZDQzMDlhZDk3ZSAxMDA2NDQK
PiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYwo+ICsrKyBiL3Rvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCj4gQEAgLTU0LDcgKzU0LDcgQEAKPiAKPiBz
dGF0aWMgdm9pZCBOb3JldHVybiBmYWlsd2l0aF94Yyh4Y19pbnRlcmZhY2UgKnhjaCkKPiB7Cj4g
LQljaGFyIGVycm9yX3N0clsxMDI4XTsKPiArCWNoYXIgZXJyb3Jfc3RyW1hDX01BWF9FUlJPUl9N
U0dfTEVOICsgNl07Cj4gCWlmICh4Y2gpIHsKPiAJCWNvbnN0IHhjX2Vycm9yICplcnJvciA9IHhj
X2dldF9sYXN0X2Vycm9yKHhjaCk7Cj4gCQlpZiAoZXJyb3ItPmNvZGUgPT0gWENfRVJST1JfTk9O
RSkKPiAtLSAKPiAyLjE3LjAKPiAKCgpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
