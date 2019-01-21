From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Mon, 21 Jan 2019 10:22:17 +0000
Message-ID: <fe86a082-fb8c-6d38-6671-cf8e0820d330@arm.com>
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
 <5C45923A020000780020F907@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rLzG=P5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1glWij-0006z2-Th
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 10:22:21 +0000
In-Reply-To: <5C45923A020000780020F907@prv1-mh.provo.novell.com>
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

SGkgSmFuLAoKT24gMjEvMDEvMjAxOSAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
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
aGUgY29tcGlsZXIgY2FuJ3QgbGV2ZXJhZ2UgaXQgZm9yIG9wdGltaXphdGlvbiBwdXJwb3NlLAo+
PiBob3dldmVyCj4+IHRoZXJlIGFyZSBjb25maXJtYXRpb25zIHRoYXQgR0NDIG1heSBhY3R1YWxs
eSBsZXZlcmFnZSBpdCAoZS5nIFsxXSkuIFlvdQo+PiBhY3R1YWxseSBuZWVkIHRvIHRyaWNrIHRo
ZSBjb21waWxlciB0byBhdm9pZCB0aGUgb3B0aW1pemF0aW9uIChlLmcKPj4gUkVMT0NfSElERSku
Cj4+Cj4+IFNvIG9idmlvdXNseSwgdGhpcyBpcyBub3Qgb25seSBhIE1JU1JBICJwcm9ibGVtIiBh
cyB5b3Ugc3RhdGUgaGVyZSBhbmQKPj4gYmVsb3cuCj4+Cj4+IEkgYmVsaWV2ZSBTdGVmYW5vLCBT
dGV3YXJ0IGFuZCBJIHByb3ZpZGVkIHBsZW50eSBvZiBkb2N1bWVudGF0aW9uL3RocmVhZCB0bwo+
PiBzdXBwb3J0IG91ciBwb3NpdGlvbnMuIENhbiB5b3UgcHJvdmlkZSB1cyBkb2N1bWVudGF0aW9u
L3RocmVhZCBzaG93aW5nIHRoZQo+PiBjb21waWxlciB3aWxsIG5vdCB0cnkgdG8gbGV2ZXJhZ2Ug
dGhhdCBjYXNlPwo+Pgo+PiBDaGVlcnMsCj4+Cj4+IFsxXQo+PiBodHRwczovL2tyaXN0ZXJ3LmJs
b2dzcG90LmNvbS8yMDE2LzEyL3BvaW50ZXItY29tcGFyaXNvbi1pbnZhbGlkLW9wdGltaXphdGlv
bi5odG1sP209MQo+IAo+IEJ0dy4sIHRoZSBfX3N0YXJ0W10gLyBfX2VuZFtdIGV4YW1wbGUgZ2l2
ZW4gdGhlcmUgZG9lcyBub3QgbWF0Y2gKPiB1cCB3aXRoIHdoYXQgSSBzZWUuCldoYXQgeW91IHNl
ZSBpbiBhIHNwZWNpZmljIHZlcnNpb24gb2YgR0NDLiBUaGlzIGRvZXMgbm90IG1lYW4gdGhpcyBi
ZWhhdmlvciBpcyAKdmFsaWQgYWNyb3NzIGFsbCB0aGUgcmVsZWFzZWQgdmVyc2lvbnMgYW5kIGZ1
dHVyZSBvbmUuCgo+IE9ubHkgc3ltYm9scyBkZWZpbmVkIGluIHRoZSBzYW1lIENVIGFzIHdoZXJl
Cj4gdGhlIGNvbXBhcmlzb24gc2l0cyBnZXQgIm9wdGltaXplZCIgdGhpcyB3YXkuIEV4dGVybnMg
YXMgd2VsbCBhcwo+IHdlYWsgc3ltYm9scyBkZWZpbmVkIGxvY2FsbHkgZG9uJ3QgZ2V0IGRlYWx0
IHdpdGggbGlrZSB0aGlzLiBBbmQgaG93Cj4gY291bGQgdGhleT8gTm90aGluZyB0ZWxscyB0aGUg
Y29tcGlsZXIgdGhhdCB0d28gZGlzdGluY3Qgc3ltYm9scwo+IHJlZmVyIHRvIHR3byBkaXN0aW5j
dCBvYmplY3RzLiBJdCBpcyBlYXN5IHRvIGNyZWF0ZSBvYmplY3RzIHdpdGgKPiBtdWx0aXBsZSBu
YW1lcywgbm90IG9ubHkgaW4gYXNzZW1ibHkgYnV0IGFsc28gaW4gQyAodXNpbmcgdGhlICJhbGlh
cyIKPiBhdHRyaWJ1dGUpLgoKU2ltaWxhcmx5LCBub3RoaW5nIHRlbGxzIHRoZSBjb21waWxlciB0
aGF0IHRoZXkgYXJlIG5vdCB0d28gZGlzdGluY3Qgc3ltYm9scy4gCllvdSBoYXZlbid0IHlldCBw
cm92aWRlZCBldmlkZW5jZSBhIGNvbXBpbGVyIGNhbm5vdCB1c2UgdGhhdCBmb3Igb3B0aW1pemF0
aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
