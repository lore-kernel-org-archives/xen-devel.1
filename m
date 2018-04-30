From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH for-4.11 v2 0/2] Add Designated Reviewer
 (R:) to MAINTAINERS (plus a test case)
Date: Mon, 30 Apr 2018 13:29:12 +0000
Message-ID: <C9C51551-4B73-436D-93D7-9E5CE99B433A@citrix.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
 <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
 <8A88031C-5A37-43BB-A62D-95495D41AA5C@citrix.com>
 <5AE6D48702000078001BF80C@prv1-mh.provo.novell.com>
 <23271.6343.553058.630893@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3ogq=ht=citrix.com=prvs=651ac8646=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fD8ts-0003wM-2D
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 13:31:28 +0000
In-Reply-To: <23271.6343.553058.630893@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <794C6CF9C08CAC41A8425A27B7096D3A@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, "brian.woods@amd.com" <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDMwLzA0LzIwMTgsIDE0OjIzLCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIEphbiBCZXVsaWNoIHdyaXRlcyAoIlJlOiBbUEFUQ0gg
Zm9yLTQuMTEgdjIgMC8yXSBBZGQgRGVzaWduYXRlZCBSZXZpZXdlciAoUjopIHRvIE1BSU5UQUlO
RVJTIChwbHVzIGEgdGVzdCBjYXNlKSIpOg0KICAgID4gT24gMzAuMDQuMTggYXQgMTA6MjEsIDxs
YXJzLmt1cnRoQGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gPiBPbiAzMC8wNC8yMDE4LCAwODo1
NywgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KICAgIC4uLg0KICAg
ID4gPiBUaGF0IGlzIG15IGZhdWx0OiBJIGdvdCBpbnRvIHRyb3VibGUgd2l0aCBnaXQgYW5kIG11
c3QgaGF2ZSBkb25lIHNvbWV0aGluZyANCiAgICA+ID4gd3JvbmcuIElmIGl0IGhlbHBzLCBJIGNh
biBzd2l0Y2ggdGhlIG9yZGVyIGFuZCByZS1zZW5kLiANCiAgICA+IA0KICAgID4gSSBkb24ndCB0
aGluayB0aGF0J3MgbmVjZXNzYXJ5IC0gd2hvZXZlciBlbmRzIHVwIGNvbW1pdHRpbmcgdGhlbSBj
YW4gZWFzaWx5DQogICAgPiBlbm91Z2ggc3dpdGNoIHRoZW0gYXJvdW5kLg0KICAgIA0KICAgIEkg
d2lsbCBkbyBzbyB3aGVuIGFsbCBpcyBjbGVhci4NCiAgICANCiAgICA+IEkgd291bGQgY29tbWl0
IHRoZW0gcmlnaHQgYXdheSwgaWYgb25seSBJIHdhcw0KICAgID4gcmVhbGx5IGNsZWFyIHdoZXRo
ZXIgd2UndmUgYWxsIHNldHRsZWQgb24gdGhpcy4NCiAgICANCiAgICBJIGhhdmUgYmVlbiBmb2xs
b3dpbmcgdGhpcy4gIEkgdGhpbmsgdGhpcyBpcyBhIGdvb2QgaWRlYS4NCiAgICANCiAgICBCYXNp
Y2FsbHkgaXQgaXMgYSB3YXkgZm9yIHNvbWVvbmUgdG8gZGVjbGFyZSBhbiBpbnRlcmVzdCBpbiBh
biBhcmVhIG9mDQogICAgY29kZSwgYW5kIGdldCBjb3BpZWQgb24gY2hhbmdlcywgd2l0aG91dCBo
YXZpbmcgdG8gZ3JhbnQgdGhhdCBwZXJzb24NCiAgICBhbnkgZm9ybWFsIGRlY2lzaW9ubWFraW5n
IGF1dGhvcml0eS4NCiAgICANCiAgICBJZiB0aGlzIGlzIG5vdCBzdWZmaWNpZW50bHkgY2xlYXIs
IGRvIHlvdSB0aGluayB3ZSBzaG91bGQgZG9jdW1lbnQNCiAgICB0aGlzIG1vcmUgY2xlYXJseSA/
ICBQZXJoYXBzIHdlIGNvdWxkIHdyaXRlOg0KICAgIA0KICAgICAgKwlSOiBEZXNpZ25hdGVkIHJl
dmlld2VyOiBGdWxsTmFtZSA8YWRkcmVzc0Bkb21haW4+DQogICAgICArICAgICAgICBSZXZpZXdl
cnMgc2hvdWxkIGJlIENDZWQgb24gcGF0Y2hlcy4gIEhvd2V2ZXIsIHRoZXkgZG8gbm90DQogICAg
ICArICAgICAgICBoYXZlIGEgZm9ybWFsIGdvdmVybmFuY2Ugcm9sZSwgYW5kIGFyZSBsaXN0ZWQg
aGVyZQ0KICAgICAgKyAgICAgICAgc2ltcGx5IGJlY2F1c2Ugb2YgdGhlaXIgb3duIHJlcXVlc3Qu
DQogICAgDQogICAgb3Igc29tZXRoaW5nID8NCg0KVGhhdCBpcyBjbGVhcmVyOiBJIGNvcGllZCB0
aGUgdGV4dCBmcm9tIHRoZSBMaW51eCBtYWludGFpbmVycyBmaWxlLiANCkBKYW46IGxldCBtZSBr
bm93IHdoZXRoZXIgeW91IHdhbnQgbWUgdG8gcmUtcm9sbCB0aGUgc2VyaWVzIHdpdGggdGhlIHRl
eHQgY2hhbmdlLg0KDQpMYXJzDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
