From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 04/17] x86: introduce is_pv_64bit_{vcpu,
 domain}
Date: Fri, 12 Oct 2018 07:48:35 -0600
Message-ID: <5BC0A63302000078001F1043@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <0d1888be57c5dc0d98c7e0313608e7d9842ba3a5.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAxo1-0001gy-2U
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 13:48:41 +0000
In-Reply-To: <0d1888be57c5dc0d98c7e0313608e7d9842ba3a5.1538667753.git-series.wei.liu2@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhpcyBpcyB1c2VmdWwgdG8gcmV3cml0ZSB0aGUgZm9sbG93aW5nIHBhdHRlcm4gKHYgaXMgUFYg
dmNwdSkKPiAKPiAgICBpZiAoIGlzX3B2XzMyYml0X3ZjcHUodikgKQo+ICAgICAgICBkb19mb287
Cj4gICAgZWxzZQo+ICAgICAgICBkb19iYXI7Cj4gCj4gdG8KPiAKPiAgICBpZiAoIGlzX3B2XzMy
Yml0X3ZjcHUodikgKQo+ICAgICAgICBkb19mb287Cj4gICAgZWxzZSBpZiAoIGlzX3B2XzY0Yml0
X3ZjcHUodikgKQo+ICAgICAgICBkb19iYXI7Cj4gICAgZWxzZQo+ICAgICAgICBBU1NFUlRfVU5S
RUFDSEFCTEU7Cj4gLgo+IAo+IFByZXZpb3VzbHkgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHJlbHkg
b24gRENFIHRvIGVsaW1pbmF0ZSB0aGUgZG9fYmFyCj4gcGFydC4gSXQgYmVjb21lcyBwb3NzaWJs
ZSB3aXRoIHRoZSBuZXcgY29kZSBzdHJ1Y3R1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClByb3ZpZGVkIHRoZSBhZGRpdGlvbnMgZ28gaW5zaWRl
IHRoZSAjaWZkZWYtcyBtZW50aW9uZWQgZm9yIHBhdGNoIDMKQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
