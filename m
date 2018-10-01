From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/vsprintf: Introduce %pd formatter
 for domains
Date: Mon, 01 Oct 2018 04:14:08 -0600
Message-ID: <5BB1F37002000078001ED214@prv1-mh.provo.novell.com>
References: <1538155327-3194-1-git-send-email-andrew.cooper3@citrix.com>
 <5BB1E42B02000078001ED185@prv1-mh.provo.novell.com>
 <d46618c6-b8e6-aa0a-2f78-5e25947964b0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d46618c6-b8e6-aa0a-2f78-5e25947964b0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDEyOjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMTAvMTggMTA6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOC4w
OS4xOCBhdCAxOToyMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gK3N0
YXRpYyBjaGFyICpwcmludF9kb21haW4oY2hhciAqc3RyLCBjaGFyICplbmQsIGNvbnN0IHN0cnVj
dCBkb21haW4gKmQpCj4+PiArewo+Pj4gKyAgICBjb25zdCBjaGFyICpuYW1lID0gTlVMTDsKPj4+
ICsKPj4+ICsgICAgLyogU29tZSBkZWJ1Z2dpbmcgbWF5IGhhdmUgYW4gb3B0aW9uYWxseS1OVUxM
IHBvaW50ZXIuICovCj4+PiArICAgIGlmICggdW5saWtlbHkoIWQpICkKPj4+ICsgICAgICAgIHJl
dHVybiBzdHJpbmcoc3RyLCBlbmQsICJOVUxMIiwgLTEsIC0xLCAwKTsKPj4+ICsKPj4+ICsgICAg
aWYgKCBzdHIgPCBlbmQgKQo+Pj4gKyAgICAgICAgKnN0ciA9ICdkJzsKPj4+ICsKPj4+ICsgICAg
c3dpdGNoICggZC0+ZG9tYWluX2lkICkKPj4+ICsgICAgewo+Pj4gKyAgICBjYXNlIERPTUlEX0lP
OiAgIG5hbWUgPSAiW0lPXSI7ICAgYnJlYWs7Cj4+PiArICAgIGNhc2UgRE9NSURfWEVOOiAgbmFt
ZSA9ICJbWEVOXSI7ICBicmVhazsKPj4+ICsgICAgY2FzZSBET01JRF9DT1c6ICBuYW1lID0gIltD
T1ddIjsgIGJyZWFrOwo+Pj4gKyAgICBjYXNlIERPTUlEX0lETEU6IG5hbWUgPSAiW0lETEVdIjsg
YnJlYWs7Cj4+ICAgICBkZWZhdWx0OiBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPj4KPj4gPwo+IAo+
IE5vIC0gc3BlY2lmaWNhbGx5IG5vdCBpbiB0aGlzIGNhc2UuCj4gCj4gVGhpcyBwYXRoIGlzIHVz
ZWQgd2hlbiBwcmludGluZyBjcmFzaCBpbmZvcm1hdGlvbiwgYW5kIGZhbGxpbmcgYmFjayB0byBh
Cj4gbnVtYmVyIGlzIGJldHRlciBiZWhhdmlvdXIgdGhhbiBmYWxsaW5nIGludG8gYW4gaW5maW5p
dGUgbG9vcCwKPiBvdmVyZmxvd2luZyB0aGUgcHJpbWFyeSBzdGFjaywgdGhlbiB0YWtpbmcgYSAj
REYgKHdoaWNoIGVzY2FsYXRlcyB0bwo+IHRyaXBsZSBmYXVsdCBvbiBBTUQpLCB3aXRob3V0IHBy
aW50aW5nIGFueXRoaW5nIHVzZWZ1bC4KCkFoLCBnb29kIHBvaW50LiBQZXJoYXBzIHdvcnRoIGEg
YnJpZWYgY29tbWVudCBpbnN0ZWFkIG9mIGEgImRlZmF1bHQ6Igp0aGVuPwoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
