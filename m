From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/ocaml/libs/xc fix gcc-8
 format-truncation warning
Date: Tue, 15 May 2018 16:24:14 +0200
Message-ID: <b371280f-6100-cc1c-1a6a-c3de4300057e@suse.com>
References: <20180515014843.19642-1-git@johnthomson.fastmail.com.au>
 <20180515131942.tbdclricnwolm7rs@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ljez=ic=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fIasE-0004ud-I7
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 14:24:18 +0000
In-Reply-To: <20180515131942.tbdclricnwolm7rs@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>
Cc: xen-devel@lists.xenproject.org, christian.lindig@citrix.com, dave@recoil.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDUvMTggMTU6MTksIFdlaSBMaXUgd3JvdGU6Cj4gQ0MgSnVlcmdlbiwgSSB0aGluayB0
aGlzIHNob3VsZCBiZSBpbiA0LjExCj4gCj4gT24gVHVlLCBNYXkgMTUsIDIwMTggYXQgMTE6NDg6
NDNBTSArMTAwMCwgSm9obiBUaG9tc29uIHdyb3RlOgo+PiAgQ0MgICAgICAgeGVuY3RybF9zdHVi
cy5vCj4+IHhlbmN0cmxfc3R1YnMuYzogSW4gZnVuY3Rpb24gJ2ZhaWx3aXRoX3hjJzoKPj4geGVu
Y3RybF9zdHVicy5jOjY1OjE3OiBlcnJvcjogJ3NucHJpbnRmJyBvdXRwdXQgbWF5IGJlIHRydW5j
YXRlZCBiZWZvcmUgdGhlIGxhc3QgZm9ybWF0IGNoYXJhY3RlciBbLVdlcnJvcj1mb3JtYXQtdHJ1
bmNhdGlvbj1dCj4+ICAgICAgICIlZDogJXM6ICVzIiwgZXJyb3ItPmNvZGUsCj4+ICAgICAgICAg
ICAgICAgICAgXgo+PiB4ZW5jdHJsX3N0dWJzLmM6NjQ6NDogbm90ZTogJ3NucHJpbnRmJyBvdXRw
dXQgNiBvciBtb3JlIGJ5dGVzIChhc3N1bWluZyAxMDI5KSBpbnRvIGEgZGVzdGluYXRpb24gb2Yg
c2l6ZSAxMDI4Cj4+ICAgICBzbnByaW50ZihlcnJvcl9zdHIsIHNpemVvZihlcnJvcl9zdHIpLAo+
PiAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gICAgICAgIiVk
OiAlczogJXMiLCBlcnJvci0+Y29kZSwKPj4gICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPj4gICAgICAgeGNfZXJyb3JfY29kZV90b19kZXNjKGVycm9yLT5jb2RlKSwKPj4gICAgICAg
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gICAgICAgZXJyb3ItPm1lc3Nh
Z2UpOwo+PiAgICAgICB+fn5+fn5+fn5+fn5+fn4KPj4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcg
dHJlYXRlZCBhcyBlcnJvcnMKPj4gbWFrZVs4XTogKioqIFsvYnVpbGQveGVuLWdpdC9zcmMveGVu
L3Rvb2xzL29jYW1sL2xpYnMveGMvLi4vLi4vTWFrZWZpbGUucnVsZXM6Mzc6IHhlbmN0cmxfc3R1
YnMub10gRXJyb3IgMQo+PiBtCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gVGhvbXNvbiA8Z2l0
QGpvaG50aG9tc29uLmZhc3RtYWlsLmNvbS5hdT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
