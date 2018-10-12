From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 03/12] gdbsx: Honour LDFLAGS when linking
Date: Fri, 12 Oct 2018 16:38:14 +0100
Message-ID: <20181012153814.pcx2bnhinxmxwobg@zion.uk.xensource.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
 <20181012151215.32455-4-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAzWA-0005l7-A5
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:38:22 +0000
Content-Disposition: inline
In-Reply-To: <20181012151215.32455-4-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDQ6MTI6MDZQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4gCj4gVGhp
cyBjb21tYW5kIGRvZXMgdGhlIGxpbmssIHNvIGl0IG5lZWRzIExERkxBR1MuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkkgdGhpbmsgdGhpcyBuZWVkcyBhbiBhY2sg
ZnJvbSBFbGVuYSBhcyB3ZWxsLgoKPiAtLS0KPiAgdG9vbHMvZGVidWdnZXIvZ2Ric3gvTWFrZWZp
bGUgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9kZWJ1Z2dlci9nZGJzeC9NYWtlZmlsZSBiL3Rvb2xz
L2RlYnVnZ2VyL2dkYnN4L01ha2VmaWxlCj4gaW5kZXggNzIzYTI3NDNjYy4uOGQ3Y2Q5NGEzMSAx
MDA2NDQKPiAtLS0gYS90b29scy9kZWJ1Z2dlci9nZGJzeC9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xz
L2RlYnVnZ2VyL2dkYnN4L01ha2VmaWxlCj4gQEAgLTI2LDcgKzI2LDcgQEAgdW5pbnN0YWxsOgo+
ICAJcm0gLWYgJChERVNURElSKSQoc2JpbmRpcikvZ2Ric3gKPiAgCj4gIGdkYnN4OiBneC9neF9h
bGwuYSB4Zy94Z19hbGwuYSAKPiAtCSQoQ0MpIC1vICRAICReCj4gKwkkKENDKSAkKExERkxBR1Mp
IC1vICRAICReCj4gIAo+ICB4Zy94Z19hbGwuYToKPiAgCSQoTUFLRSkgLUMgeGcKPiAtLSAKPiAy
LjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
