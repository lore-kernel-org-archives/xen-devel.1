From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
Date: Thu, 18 Apr 2019 20:01:44 +0100
Message-ID: <5414f6ea-b776-3dfa-682a-d6b63bf2374f@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
 <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
 <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
 <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hHCI8-0000La-Eg
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 19:01:48 +0000
In-Reply-To: <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxOC8wNC8yMDE5IDE5OjUyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVGh1
LCAxOCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxOC8wNC8yMDE5IDE5OjIz
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBXZWQsIDE3IEFwciAyMDE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gNC8xNy8xOSA5OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgMjcgTWFyIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSWYgaXQgaXMgY29uc2lkZXJlZCBjb21wbGlhbnQsIHRoZW4gaXQgZG9lcyBub3QgbWFrZSBz
ZW5zZS4KPiAKPiBZZXMsIEkgdGhpbmsgdGhpcyBpcyBub3QgY29tcGxpYW50IHRvby4gQWxzbywg
ZnJvbSB3aGF0IEkgaGF2ZSBiZWVuCj4gdG9sZCwgdGhpcyBleGFtcGxlIGlzIGZhbW91cyBmb3Ig
YmVpbmcgb25lIG9mIHRoZSBtb3N0IGV4dHJlbWUgZXhhbXBsZXMKPiBvZiBNSVNSQS1DIG5vbi1j
b21wbGlhbmNlLiBJIHRoaW5rIHRoZSBjb21wbGlhbnQgdmVyc2lvbiB3b3VsZCBiZToKPiAKPiBi
b29sIGlzX25vbnplcm8oaW50IGIpCj4gewo+ICAgICAgaWYgKGIgIT0gMCkKPiAgICAgICAgcmV0
dXJuIHRydWU7Cj4gICAgICBlbHNlCj4gICAgICAgIHJldHVybiBmYWxzZTsKPiB9Cj4gCj4gVGhp
cyBpcyBhbHNvIGNvbXBsaWFudDoKPiAKPiBib29sIGlzX25vbnplcm8oaW50IGIpCj4gewo+ICAg
ICAgcmV0dXJuIChiICE9IDApOwo+IH0KPiAKCkkgd2lsbCB1c2UgISFiIGhlcmUgYW5kIGluIHRo
ZSBuZXh0IHBhdGNoLiBCdXQgSSBzdGlsbCBkb3VidCB5b3Ugd2lsbCBiZSBhYmxlIHRvIAplbmZv
cmNlIGl0IGluIFhlbi4gaWYgKCBuICkgaXMgcXVpdGUgYSBjb21tb24gcGF0dGVybi4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
