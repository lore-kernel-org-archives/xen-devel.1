From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/4] block/xen_disk: remove use of grant
 map/unmap
Date: Mon, 30 Apr 2018 15:16:52 +0000
Message-ID: <dfeffd8d0d9f46fbbed1abb2bdaccd27@AMSPEX02CL03.citrite.net>
References: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
 <1525089699-13411-3-git-send-email-paul.durrant@citrix.com>
 <20180430151145.iyou5pisaclvvn3v@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdck=ht=citrix.com=prvs=65150b487=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fDAYD-0004gT-5z
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 15:17:13 +0000
In-Reply-To: <20180430151145.iyou5pisaclvvn3v@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDMwIEFwcmlsIDIwMTggMTY6MTIKPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBxZW11LWJs
b2NrQG5vbmdudS5vcmc7IHFlbXUtCj4gZGV2ZWxAbm9uZ251Lm9yZzsgQW50aG9ueSBQZXJhcmQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBLZXZpbgo+IFdvbGYgPGt3b2xmQHJlZGhhdC5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBNYXgKPiBS
ZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCAyLzRdIGJsb2NrL3hlbl9kaXNrOiByZW1vdmUgdXNlIG9mIGdyYW50Cj4gbWFwL3VubWFwCj4g
Cj4gT24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDE6MDE6MzdQTSArMDEwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4gVGhlIGdyYW50IGNvcHkgb3BlcmF0aW9uIHdhcyBhZGRlZCB0byBsaWJ4ZW5n
bnR0YWIgaW4gWGVuIDQuOC4wLiBJZiBncmFudAo+ID4gY29weSBpcyBhdmFpbGFibGUgdGhlbiBk
YXRhIGZyb20gdGhlIGd1ZXN0IHdpbGwgYmUgY29waWVkIHJhdGhlciB0aGFuCj4gPiBtYXBwZWQu
Cj4gPiBUaGUgeGVuX2Rpc2sgc291cmNlIGNhbiBiZSBzaWduaWZpY2FudGx5IHNpbXBsaWZpZWQg
YnkgcmVtb3ZpbmcgdGhpcyBub3cKPiA+IHJlZHVuZGFudCBjb2RlLgo+IAo+IEhtLCBJIGtub3cg
dGhpcyBpcyBhIFBJVEEsIGJ1dCBGcmVlQlNEIGdudGRldiBoYXNuJ3QgaW1wbGVtZW50ZWQgdGhl
Cj4gZ3JhbnQtY29weSBvcGVyYXRpb24geWV0Lgo+IAo+IEkgY291bGQgdHJ5IHRvIGltcGxlbWVu
dCBpdCwgYnV0IEkgY2FuJ3QgbWFrZSBhbnkgcHJvbWlzZXMgb24gdGhlIHRpbWUKPiBBVE0sIHNp
bmNlIEknbSBxdWl0ZSBidXN5Lgo+IAoKSSBndWVzcyB3ZSBjb3VsZCBjYXJyeSBhIGNvbXBhdCBw
YXRjaCBpbiBRRU1VIHRoYXQgaW1wbGVtZW50cyBncmFudCBjb3B5IGJ5IGRvaW5nIGEgbWFwL21l
bWNweS91bm1hcCAsIGJ1dCBRRU1VIGZlZWxzIGxpa2UgdGhlIHdyb25nIHBsYWNlIGZvciB0aGF0
LiBJIGNvdWxkIHRyeSBwdXR0aW5nIHRvZ2V0aGVyIGEgc2ltaWxhciBwYXRjaCBmb3IgdGhlIGZy
ZWVic2QuYyBjb21wb25lbnQgb2YgbGlieGVuZ250dGFiIGluIHRoZSB4ZW4gc291cmNlIHJhdGhl
ciB0aGFuIGl0IHNpbXBseSBmYWlsaW5nIHdpdGggRU5PU1lTIGFzIGl0IGRvZXMgbm93LiBXb3Vs
ZCBlaXRoZXIgb2YgdGhvc2UgaGVscD8KCiAgQ2hlZXJzLAoKICAgIFBhdWwKCj4gVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
