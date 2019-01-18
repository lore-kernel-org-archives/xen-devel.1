From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Fri, 18 Jan 2019 15:22:23 +0000
Message-ID: <b5db4517-8ff7-bf90-a315-2ad115acf033@arm.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1901171701380.18561@sstabellini-ThinkPad-X260>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <ca2ed7b7-f0b6-6b06-a306-b7c693e354b1@arm.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <9F511FC70200005E5C475325@prv1-mh.provo.novell.com>
 <5C41B3EE020000780020EFA5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yjae=P2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkVyW-0004eA-73
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 15:22:28 +0000
In-Reply-To: <5C41B3EE020000780020EFA5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTgvMDEvMjAxOSAxMTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDEuMTkgYXQgMTE6NDgsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDE4
LzAxLzIwMTkgMDk6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMDEuMTkgYXQg
MDI6MjQsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+PiBPbiBUaHUsIDE3IEph
biAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMTcuMDEuMTkgYXQgMDE6Mzcs
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+IE9uIFdlZCwgMTYgSmFuIDIw
MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gU3RvcC4gTm8uIFdlIHZlcnkgbXVjaCBjYW4gcHJv
dmUgdGhleSBhcmUgLSBfZW5kIHBvaW50cyBhdAo+Pj4gb25lIHBhc3QgdGhlIGxhc3QgZWxlbWVu
dCBvZiBfc3RhcnRbXS4gSXQgaXMgdGhlIGNvbXBpbGVyIHdoaWNoCj4+PiBjYW4ndCBwcm92ZSB0
aGUgb3Bwb3NpdGUsIGFuZCBoZW5jZSBpdCBjYW4ndCBsZXZlcmFnZQo+Pj4gdW5kZWZpbmVkIGJl
aGF2aW9yIGZvciBvcHRpbWl6YXRpb24gcHVycG9zZXMuCj4+Cj4+IFlvdSBrZWVwIHNheWluZyB0
aGUgY29tcGlsZXIgY2FuJ3QgbGV2ZXJhZ2UgaXQgZm9yIG9wdGltaXphdGlvbiBwdXJwb3NlLCBo
b3dldmVyCj4+IHRoZXJlIGFyZSBjb25maXJtYXRpb25zIHRoYXQgR0NDIG1heSBhY3R1YWxseSBs
ZXZlcmFnZSBpdCAoZS5nIFsxXSkuIFlvdQo+PiBhY3R1YWxseSBuZWVkIHRvIHRyaWNrIHRoZSBj
b21waWxlciB0byBhdm9pZCB0aGUgb3B0aW1pemF0aW9uIChlLmcgUkVMT0NfSElERSkuCj4gCj4g
Q29ycmVjdCAtIHRoYXQncyB0aGUgY2FzZSBJJ20gcmVmZXJyaW5nIHRvIHdoZW4gc2F5aW5nIGl0
IGNhbid0IGxldmVyYWdlCj4gdW5kZWZpbmVkIGJlaGF2aW9yIG9wdGltaXphdGlvbnMgYW55bW9y
ZS4gV2l0aG91dCB0aGUgaGlkaW5nIG9mCj4gY291cnNlIGl0IGNhbi4KCkJ1dCB0aGlzIHRyaWNr
IGlzIEdDQyBzcGVjaWZpYywgcmlnaHQ/IFNvIHdlIHdvdWxkIG5lZWQgdG8gaGF2ZSBvbmUgdHJp
Y2sgZm9yIAplYWNoIGNvbXBpbGVyIHdlIHN1cHBvcnQuIE5vdGUgdGhhdCB0aGUgc29sdXRpb24g
b3JpZ2luYWxseSBzdWdnZXN0ZWQgYnkgU3RlZmFubyAKaGFzIHRoZSBzYW1lIGlzc3VlIChpLmUg
cmV0dXJuIHVuc2lnbmVkIGxvbmcpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
