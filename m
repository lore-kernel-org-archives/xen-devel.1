From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
Date: Tue, 21 May 2019 03:29:56 -0600
Message-ID: <5CE3C5140200007800230E11@prv1-mh.provo.novell.com>
References: <20190520171315.12026-1-alistair.francis@wdc.com>
 <8d3413cd-1440-b18a-7d3f-fd8ad283de06@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT160-0000C6-Ii
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 09:30:08 +0000
In-Reply-To: <8d3413cd-1440-b18a-7d3f-fd8ad283de06@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA1LjE5IGF0IDE5OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+PiArKysgYi94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYwo+PiBAQCAtMzYsNyArMzYsNyBAQAo+PiAgICNpZmRlZiBDT05GSUdfWDg2
Cj4+ICAgI2luY2x1ZGUgPHhlbi9jb25zb2xlZC5oPgo+PiAgICNpbmNsdWRlIDxhc20vZ3Vlc3Qu
aD4KPj4gLSNlbHNlCj4+ICsjZWxpZiBDT05GSUdfU0JTQV9WVUFSVF9DT05TT0xFCj4+ICAgI2lu
Y2x1ZGUgPGFzbS92cGwwMTEuaD4KPj4gICAjZW5kaWYKPiAKPiBUaGlzIGlzIGEgYml0IG9kZHMg
dG8gcmVxdWlyZSAhQ09ORklHX1g4NiAmJiBDT05GSUdfU0JTQV9WVUFSVF9DT05TT0xFIGJ1dCB0
aGUgCj4gCj4gY29kZSBpcyBvbmx5IHByb3RlY3RlZCB3aXRoIHRoZSBzZWNvbmQgcGFydC4KPiAK
PiBIb3cgYWJvdXQ6Cj4gCj4gI2VuZGlmCj4gI2lmZGVmIENPTkZJR19TQlNBX1ZVQVJUX0NPTlNP
TEUKPiAuLi4KPiAjZW5kaWYKPiAKPiA/CgorMSAtIGRvaW5nIHNvIHdpbGwgYWxzbyBzYXZlIG1l
IGZyb20gY29tcGxhaW5pbmcgYWJvdXQgdGhlIG1pc3NpbmcKZGVmaW5lZCgpLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
