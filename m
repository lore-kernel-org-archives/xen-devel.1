From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/10] Make MEM_ACCESS configurable
Date: Tue, 29 May 2018 05:50:38 -0600
Message-ID: <5B0D3E8E02000078001C6902@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1805221719560.24793@sstabellini-ThinkPad-X260>
 <1527035108-15051-4-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527035108-15051-4-git-send-email-sstabellini@kernel.org>
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA1LjE4IGF0IDAyOjI1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcKPiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
Zwo+IEBAIC0yNiw2ICsyNiw5IEBAIGNvbmZpZyBBUkNIX0RFRkNPTkZJRwo+ICAJZGVmYXVsdCAi
YXJjaC9hcm0vY29uZmlncy9hcm0zMl9kZWZjb25maWciIGlmIEFSTV8zMgo+ICAJZGVmYXVsdCAi
YXJjaC9hcm0vY29uZmlncy9hcm02NF9kZWZjb25maWciIGlmIEFSTV82NAo+ICAKPiArY29uZmln
IEhBU19NRU1fQUNDRVNTCj4gKwlkZWZfYm9vbCB5CgpUaGUgbW9yZSB0aGF0IHlvdSdyZSBub3Qg
ZGVsZXRpbmcgdGhlIHJlc3BlY3RpdmUgc2VsZWN0LXMsIHBsZWFzZQpkb24ndCBpbnRyb2R1Y2Ug
c3VjaCBwZXItYXJjaC4gS2VlcCB0aGUgYXJjaC1uZXV0cmFsIG9uZSwgLi4uCgo+IEBAIC0zMCw2
ICszMSwxMiBAQCBjb25maWcgQVJDSF9ERUZDT05GSUcKPiAgCXN0cmluZwo+ICAJZGVmYXVsdCAi
YXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmlnIgo+ICAKPiArY29uZmlnIEhBU19NRU1f
QUNDRVNTCj4gKwlkZWZfYm9vbCB5Cj4gKwo+ICtjb25maWcgTUVNX0FDQ0VTU19BTFdBWVNfT04K
PiArCWRlZl9ib29sIHkKCi4uLiBtYWtlIHRoaXMgb25lIHNpbWlsYXJseSBhbiBhcmNoLW5ldXRy
YWwgb25lIChzZWxlY3QtZWQgZnVydGhlciB1cAppbiB0aGlzIGZpbGUpLgoKPiAtLS0gYS94ZW4v
Y29tbW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtMjAsOCArMjAs
MTUgQEAgY29uZmlnIEhBU19ERVZJQ0VfVFJFRQo+ICBjb25maWcgSEFTX0VYX1RBQkxFCj4gIAli
b29sCj4gIAo+IC1jb25maWcgSEFTX01FTV9BQ0NFU1MKPiArY29uZmlnIE1FTV9BQ0NFU1MKPiAg
CWJvb2wKPiArCXByb21wdCAiTWVtb3J5IEFjY2VzcyBhbmQgVk0gZXZlbnRzIiBpZiAhTUVNX0FD
Q0VTU19BTFdBWVNfT04KPiArCWRlZmF1bHQgeQoKUGxlYXNlIGNvbWJpbmUgYm9vbCBhbmQgZGVm
YXVsdCB0byBkZWZfYm9vbC4gQWxzbyAtIGRvIHdlIHBlcmhhcHMgd2FudCB0aGUKcHJvbXB0IHRv
IGFkZGl0aW9uYWxseSBoYXZlIGFuIEVYUEVSVCBkZXBlbmRlbmN5PyBXaXRob3V0IHlvdSBzYXlp
bmcgd2h5CnlvdSB3YW50IHRoaXMgY29uZmlndXJhYmxlIEkgY2FuJ3QgdGVsbCB3aGV0aGVyIHRo
aXMgd291bGQgbWFrZSBzZW5zZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
