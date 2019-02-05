From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Tue, 05 Feb 2019 00:53:05 -0700
Message-ID: <5C5940E10200007800213D3E@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <CAFLBxZYdzV43SxpMiF7X=zcNnxfkJDQq5zkUnuThzE-rBuS=yA@mail.gmail.com>
 <27086E4A0200006A88BF86FB@prv1-mh.provo.novell.com>
 <5C3C63E0020000780020D22C@prv1-mh.provo.novell.com>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <5A96F2FD0200008D00417A66@prv1-mh.provo.novell.com>
 <5C4595E6020000780020F93D@prv1-mh.provo.novell.com>
 <42A2C4FA0200009000417A66@prv1-mh.provo.novell.com>
 <5C46DF880200007800210061@prv1-mh.provo.novell.com>
 <95DC675902000028AB59E961@prv1-mh.provo.novell.com>
 <5C5807DE020000780021390F@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902041057130.22962@sstabellini-ThinkPad-X260>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <5A96F2FD0200008D00417A66@prv1-mh.provo.novell.com>
 <5C4595E6020000780020F93D@prv1-mh.provo.novell.com>
 <42A2C4FA0200009000417A66@prv1-mh.provo.novell.com>
 <5C46DF880200007800210061@prv1-mh.provo.novell.com>
 <95DC675902000028AB59E961@prv1-mh.provo.novell.com>
 <5C5807DE020000780021390F@prv1-mh.provo.novell.com>
 <2E9DDEFD0200007B00417A66@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqvXZ-00013P-Ik
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 07:53:09 +0000
In-Reply-To: <2E9DDEFD0200007B00417A66@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAyLjE5IGF0IDIwOjA4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gTW9uLCA0IEZlYiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQW5kIGJ0dyAtIEkg
Y2FuJ3QganVkZ2Ugb24gYi4gYW55d2F5LCBhcyBJIHN0aWxsIGRvbid0IGtub3cgd2hhdAo+PiBl
eGFjdGx5IE1JU1JBIGNvbXBsaWFuY2UgaXMgdG8gbWVhbiwgd2l0aCB0aGUgcnVsZXMgdG8gYWRo
ZXJlIHRvCj4+IHN1aXRhYmx5IGp1c3RpZmllZC4KPiAKPiBJIGNhbid0IHByZXRlbmQgdG8ga25v
dyBleGFjdGx5IHdoYXQgTUlTUkFDIGNvbXBsaWFuY2UgbWVhbnMgZm9yIHRoaXMKPiBzcGVjaWZp
YyBpc3N1ZSwgYnV0IHdlIGRvIGhhdmUgdGhlIHJlY29tbWVuZGVkIHdheSBmb3J3YXJkIGJ5IHRo
ZQo+IGNvbXBsaWFuY2UgZXhwZXJ0cywgd2hpY2ggYWxzbyBtYXRjaGVzIHRoZSByb3VnaCB1bmRl
cnN0YW5kaW5nIG9mIG1vc3QKPiBvZiB0aGUgZW5naW5lZXJzIGludm9sdmVkIGluIHRoaXMgZGlz
Y3Vzc2lvbi4gUGlja2luZyB0aGUgb3B0aW9uCj4gc3VnZ2VzdGVkIGJ5IHRoZSBNSVNSQUMgcGVv
cGxlLCBjb3VsZCBiZSBhIGRlY2VudCB3YXkgdG8gc2V0dGxlIHRoaXMKPiBkZWJhdGU/CgpJdCBj
b3VsZCBiZSwgaWYgdGhlaXIgcmVhc29uaW5nIHdhcyBhY2NlcHRhYmxlLCB3aGljaCB0byBtZSBp
biBwYXJ0aWN1bGFyCm1lYW5zIChhKSBiYWNrZWQgYnkgcmVmZXJlbmNlcyB0byB0aGUgQyBzcGVj
IGFuZCAoYikgbm90IHJlc29ydGluZyB0bwp1c2UgY29tcGlsZXIgYnVncyBhcyBhbiBleGN1c2Ug
Zm9yIChwc2V1ZG8pIHJ1bGVzLiBCdXQgSSdtIGFmcmFpZCBieQpzYXlpbmcgdGhpcyBJJ20gbm90
IHJlYWxseSBvcGVuaW5nIHVwIGFueSBuZXcgYXZlbnVlcy4uLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
