From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/vsprintf: Introduce %pd formatter
 for domains
Date: Mon, 1 Oct 2018 14:55:46 +0100
Message-ID: <a4edcbae-4bc1-dc43-2bb9-a7938442dfe0@citrix.com>
References: <1538155327-3194-1-git-send-email-andrew.cooper3@citrix.com>
 <5BB1E42B02000078001ED185@prv1-mh.provo.novell.com>
 <d46618c6-b8e6-aa0a-2f78-5e25947964b0@citrix.com>
 <5BB1F37002000078001ED214@prv1-mh.provo.novell.com>
 <02092f7c-8ac9-2658-fe05-dfc041ac68ce@citrix.com>
 <5BB1F60002000078001ED252@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BB1F60002000078001ED252@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMTggMTE6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAxLjEwLjE4IGF0
IDEyOjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDAxLzEwLzE4
IDExOjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDAxLjEwLjE4IGF0IDEyOjAyLCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gT24gMDEvMTAvMTggMTA6MDgs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyOC4wOS4xOCBhdCAxOToyMiwgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Pj4gK3N0YXRpYyBjaGFyICpwcmludF9k
b21haW4oY2hhciAqc3RyLCBjaGFyICplbmQsIGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4+Pj4+
PiArewo+Pj4+Pj4gKyAgICBjb25zdCBjaGFyICpuYW1lID0gTlVMTDsKPj4+Pj4+ICsKPj4+Pj4+
ICsgICAgLyogU29tZSBkZWJ1Z2dpbmcgbWF5IGhhdmUgYW4gb3B0aW9uYWxseS1OVUxMIHBvaW50
ZXIuICovCj4+Pj4+PiArICAgIGlmICggdW5saWtlbHkoIWQpICkKPj4+Pj4+ICsgICAgICAgIHJl
dHVybiBzdHJpbmcoc3RyLCBlbmQsICJOVUxMIiwgLTEsIC0xLCAwKTsKPj4+Pj4+ICsKPj4+Pj4+
ICsgICAgaWYgKCBzdHIgPCBlbmQgKQo+Pj4+Pj4gKyAgICAgICAgKnN0ciA9ICdkJzsKPj4+Pj4+
ICsKPj4+Pj4+ICsgICAgc3dpdGNoICggZC0+ZG9tYWluX2lkICkKPj4+Pj4+ICsgICAgewo+Pj4+
Pj4gKyAgICBjYXNlIERPTUlEX0lPOiAgIG5hbWUgPSAiW0lPXSI7ICAgYnJlYWs7Cj4+Pj4+PiAr
ICAgIGNhc2UgRE9NSURfWEVOOiAgbmFtZSA9ICJbWEVOXSI7ICBicmVhazsKPj4+Pj4+ICsgICAg
Y2FzZSBET01JRF9DT1c6ICBuYW1lID0gIltDT1ddIjsgIGJyZWFrOwo+Pj4+Pj4gKyAgICBjYXNl
IERPTUlEX0lETEU6IG5hbWUgPSAiW0lETEVdIjsgYnJlYWs7Cj4+Pj4+ICAgICBkZWZhdWx0OiBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsKPj4+Pj4KPj4+Pj4gPwo+Pj4+IE5vIC0gc3BlY2lmaWNhbGx5
IG5vdCBpbiB0aGlzIGNhc2UuCj4+Pj4KPj4+PiBUaGlzIHBhdGggaXMgdXNlZCB3aGVuIHByaW50
aW5nIGNyYXNoIGluZm9ybWF0aW9uLCBhbmQgZmFsbGluZyBiYWNrIHRvIGEKPj4+PiBudW1iZXIg
aXMgYmV0dGVyIGJlaGF2aW91ciB0aGFuIGZhbGxpbmcgaW50byBhbiBpbmZpbml0ZSBsb29wLAo+
Pj4+IG92ZXJmbG93aW5nIHRoZSBwcmltYXJ5IHN0YWNrLCB0aGVuIHRha2luZyBhICNERiAod2hp
Y2ggZXNjYWxhdGVzIHRvCj4+Pj4gdHJpcGxlIGZhdWx0IG9uIEFNRCksIHdpdGhvdXQgcHJpbnRp
bmcgYW55dGhpbmcgdXNlZnVsLgo+Pj4gQWgsIGdvb2QgcG9pbnQuIFBlcmhhcHMgd29ydGggYSBi
cmllZiBjb21tZW50IGluc3RlYWQgb2YgYSAiZGVmYXVsdDoiCj4+PiB0aGVuPwo+PiBUaGlzIGlu
Y3JlbWVudGFsIGRpZmY/Cj4gTEdUTSwgdGhhbmtzLgoKSSd2ZSBjb21taXR0ZWQgdGhpcyBub3cs
IGJ1dCBpdHMganVzdCBvY2N1cnJlZCB0byBtZSB0aGF0IHdlIGNvdWxkbid0CnBvc3NpYmx5IGhh
dmUgaGFkIGEgZGVmYXVsdCBjYXNlLCBiZWNhdXNlIHRoYXQgaXMgdGhlIGNvbW1vbiBjYXNlIGZv
cgptb3N0IGRvbWFpbnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
