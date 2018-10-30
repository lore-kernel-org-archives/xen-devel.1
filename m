From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] use consistent values when consuming
 runtime-changeable parameters
Date: Tue, 30 Oct 2018 16:23:01 +0000
Message-ID: <20181030162301.j2wwajxtl36pw6uq@zion.uk.xensource.com>
References: <5BD86E4402000078001F6571@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHWnM-0002xy-1y
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:23:08 +0000
Content-Disposition: inline
In-Reply-To: <5BD86E4402000078001F6571@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMDg6NDQ6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBubyBndWFyYW50ZWUgdGhhdCBlLmcuIGEgc3dpdGNoKCkgY29udHJvbCBl
eHByZXNzaW9uJ3MgbWVtb3J5Cj4gb3BlcmFuZChzKSBnZXQocykgcmVhZCBqdXN0IG9uY2UuIEd1
YXJkIGFnYWluc3QgdGhlIGNvbXBpbGVyIHByb2R1Y2luZwo+ICJ1bmV4cGVjdGVkIiBjb2RlIGJ5
IHNwcmlua2xpbmcgYXJvdW5kIHNvbWUgQUNDRVNTX09OQ0UoKS4KPiAKPiBJJ20gbGVhdmluZyBh
bG9uZSBvcHRfY29uc3dpdGNoW106IEl0IGdldHMgYWNjZXNzZWQgaW4gcXVpdGUgYSBmZXcKPiBw
bGFjZXMgYW55d2F5LCBhbmQgYW4gaW50ZXJtZWRpYXRlIGNoYW5nZSB3b24ndCBoYXZlIGFueSBz
ZXZlcmUgZWZmZWN0Cj4gYWZhaWN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkknbSBjdXJpb3VzIGhvdyB5b3UgY2FtZSB1cCB3aXRoIHRoZSBs
aXN0IG9mIHBhcmFtZXRlcnMgdGhhdCBuZWVkCmZpeGluZy4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
