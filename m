From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
Date: Fri, 03 May 2019 02:18:43 -0600
Message-ID: <5CCBF963020000780022B865@prv1-mh.provo.novell.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <20190502221345.18459-4-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTP7-0005No-33
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:18:49 +0000
In-Reply-To: <20190502221345.18459-4-tamas@tklengyel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA1LjE5IGF0IDAwOjEzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC0z
NjgsNyArMzY4LDkgQEAgdm9pZCBfX2luaXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQo+ICAKPiAg
ICAgIGVmaV9pbml0X21lbW9yeSgpOwo+ICAKPiArI2lmZGVmIENPTkZJR19NRU1fU0hBUklORwo+
ICAgICAgbWVtX3NoYXJpbmdfaW5pdCgpOwo+ICsjZW5kaWYKCldoaWxlIGZvciBkb21jdGwgY29k
ZSBhbmQgYWxpa2UgdXNpbmcgI2lmZGVmIG1heSBpbmRlZWQgYmUgdGhlCmJldHRlciBjaG9pY2Us
IEkgdGhpbmsgaGVyZSBhbiBpbmxpbmUgc3R1YiB0byBhdm9pZCB0aGUgI2lmZGVmCndvdWxkIGJl
IHByZWZlcmFibGUuIFRoZW4gYWdhaW4gLSByZWNhbGwgeW91J3ZlIGFscmVhZHkgYWNrLWVkCm15
IHBhdGNoIHRvIGRyb3AgdGhlIGZ1bmN0aW9uIGFsdG9nZXRoZXI/IFBlcmhhcHMgeW91IHNob3Vs
ZApiYXNlIHlvdXIgcGF0Y2ggb24gbWluZSAob3IgQW5kcmV3IGNvdWxkIHB1bGwgdGhhdCBvdGhl
ciBwYXRjaAppbnRvIHg4Ni1uZXh0KT8gSW4gdGhhdCBjYXNlICh3aXRoIHRoZSBodW5rIGFib3Zl
IHNpbXBseQpkcm9wcGVkKQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
