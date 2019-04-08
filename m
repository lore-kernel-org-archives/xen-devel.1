From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
Date: Mon, 8 Apr 2019 17:10:28 +0100
Message-ID: <7a64cb69-7ba6-de63-67f2-840bab59c356@arm.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
 <5CAB548F020000780022563B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDWqw-0005XM-0J
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 16:10:34 +0000
In-Reply-To: <5CAB548F020000780022563B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gNC84LzE5IDM6MDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4
LjA0LjE5IGF0IDEzOjU4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAzLzUv
MTkgMToyOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtMjk4LDcgKzI5OCw3IEBAIERF
RklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9hZGRfdG9fcGh5c20KPj4+ICAgIAo+Pj4gICAgLyoK
Pj4+ICAgICAqIFVubWFwcyB0aGUgcGFnZSBhcHBlYXJpbmcgYXQgYSBwYXJ0aWN1bGFyIEdQRk4g
ZnJvbSB0aGUgc3BlY2lmaWVkIGd1ZXN0J3MKPj4+IC0gKiBwc2V1ZG9waHlzaWNhbCBhZGRyZXNz
IHNwYWNlLgo+Pj4gKyAqIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgKHRyYW5zbGF0ZWQgZ3Vlc3Rz
IG9ubHkpLgo+Pgo+PiBXaGlsZSB5b3UgbW9kaWZ5IHRoZSBjb21tZW50LCBjYW4geW91IHJlcGxh
Y2UgR1BGTiB3aXRoIEdGTj8KPiAKPiBJIGRpZCBjb25zaWRlciB0aGlzIHdoZW4gd3JpdGluZyB0
aGUgcGF0Y2gsIGJ1dCB0aGVuIHRoaXMgd291bGQKPiBicmluZyBpdCBvdXQgb2Ygc3luYyB3aXRo
IHRoZSBzdHJ1Y3R1cmUgZmllbGQgYW5kIGl0cyBhc3NvY2lhdGVkCj4gY29tbWVudC4gUGx1cyB0
aGUgImFkZCIgc2lkZSBjb21tZW50IHdvdWxkIHRoZW4gd2FudAo+IGNoYW5naW5nIHRvby4gQW5k
IHB1YmxpYy9tZW1vcnkuaCBoYXMgcXVpdGUgYSBmZXcgbW9yZSB1c2VzCj4gb2YgR1BGTiAvIGdw
Zm4uCj4gCj4gVG8gYmUgaG9uZXN0IEknZCBwcmVmZXIgdG8gbGVhdmUgdGhpcyBhcyBpcyByaWdo
dCBoZXJlLCBmb3IgaXQgdG8gZ2V0Cj4gY2xlYW5lZCB1cCBpbiBvbmUgZ28uCgpJIGFtIGZpbmUg
d2l0aCB0aGF0LgoKPiAKPj4gT3RoZXIgdGhhbiB0aGF0Ogo+Pgo+PiBSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBUaGFua3MsIGJ1dCBhcyBwZXIg
YWJvdmUgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdG8gYWN0dWFsbHkgYXBwbHkgPiBpdC4KClllcyBp
dCBhcHBsaWVzLCBmb3IgdGhlIGNvbW1vbiBjb2RlIChhbmQgaW5kaXJlY3RseSBBcm0pLgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
