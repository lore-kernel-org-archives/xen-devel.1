From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] iommu: introduce dom0-iommu option
Date: Thu, 09 Aug 2018 05:46:42 -0600
Message-ID: <5B6C29A202000078001DC882@prv1-mh.provo.novell.com>
References: <20180808100747.19464-1-roger.pau@citrix.com>
 <20180808100747.19464-2-roger.pau@citrix.com>
 <5B6ADDBF02000078001DC05E@prv1-mh.provo.novell.com>
 <20180808155011.ptyhehl42b6vs4sl@mac.bytemobile.com>
 <5B6BE6AB02000078001DC4BA@prv1-mh.provo.novell.com>
 <20180809100130.enks2lqojshvm4l6@mac>
 <5B6C179F02000078001DC78B@prv1-mh.provo.novell.com>
 <20180809105121.uts2ur4m7xpdmucm@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=emy9=ky=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnjOw-0003pu-8V
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 11:46:46 +0000
In-Reply-To: <20180809105121.uts2ur4m7xpdmucm@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA4LjE4IGF0IDEyOjUxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgQXVnIDA5LCAyMDE4IGF0IDA0OjI5OjUxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDkuMDguMTggYXQgMTI6MDEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSW4gZmFjdCBJIHRoaW5rIHRoaXMgd291bGQgYmUgY2xlYXJlciBpZiBzb21l
dGhpbmcgbGlrZToKPj4gPiAKPj4gPiBlbnVtIHsKPj4gPiAgICAgTk9ORSwKPj4gPiAgICAgUkVM
QVhFRCwKPj4gPiAgICAgU1RSSUNULAo+PiA+IH0gaW9tbXVfaHdkb20gPSBSRUxBWEVEOwo+PiA+
IAo+PiA+IFdhcyB1c2VkIGluc3RlYWQgb2YgaW9tbXVfZG9tMF9wYXNzdGhyb3VnaCBhbmQgaW9t
bXVfZG9tMF9zdHJpY3QuCj4+IAo+PiBGaW5lIHdpdGggbWUuCj4gCj4gU3dpdGNoaW5nIHRvIGEg
c2luZ2xlIGVudW0gYWxzbyBtZWFucyB0aGF0IHRoZSBsYXN0IGRvbTAtaW9tbXUgPSBbCj4gbm9u
ZSB8IHN0cmljdCB8IHJlbGF4ZWQgXSB3aWxsIGJlIHRoZSBvbmUgZW5mb3JjZWQsIHNvIEkgY291
bGQga2VlcAo+IHRoZW0gYXMtaXMsIGFuZCBhZGQ6Cj4gCj4gIk5vdGUgdGhhdCBhbGwgdGhlIGFi
b3ZlIG9wdGlvbnMgYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZSBhbmQgdGhlIGxhc3QKPiBvbmUgZm91
bmQgb24gdGhlIGNvbW1hbmQgbGluZSB3aWxsIGJlIHRoZSBvbmUgdG8gdGFrZSBlZmZlY3QuIgoK
UmlnaHQuIEkgZG9uJ3QgdGhpbmsgdGhlIHNlY29uZCBoYWxmIG9mIHRoZSBzZW50ZW5jZSBpcyBu
ZWVkZWQgLQp0aGF0J3Mgd2hhdCBoYXBwZW5zIGZvciBtb3N0IG90aGVyIG9wdGlvbnMgYXMgd2Vs
bC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
