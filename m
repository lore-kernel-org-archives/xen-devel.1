From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/vsprintf: Introduce %pd formatter
 for domains
Date: Mon, 01 Oct 2018 08:04:17 -0600
Message-ID: <5BB2296102000078001ED4C6@prv1-mh.provo.novell.com>
References: <1538155327-3194-1-git-send-email-andrew.cooper3@citrix.com>
 <5BB1E42B02000078001ED185@prv1-mh.provo.novell.com>
 <d46618c6-b8e6-aa0a-2f78-5e25947964b0@citrix.com>
 <5BB1F37002000078001ED214@prv1-mh.provo.novell.com>
 <02092f7c-8ac9-2658-fe05-dfc041ac68ce@citrix.com>
 <5BB1F60002000078001ED252@prv1-mh.provo.novell.com>
 <a4edcbae-4bc1-dc43-2bb9-a7938442dfe0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a4edcbae-4bc1-dc43-2bb9-a7938442dfe0@citrix.com>
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

Pj4+IE9uIDAxLjEwLjE4IGF0IDE1OjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMTAvMTggMTE6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMS4x
MC4xOCBhdCAxMjoyMywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MDEvMTAvMTggMTE6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDAxLjEwLjE4IGF0
IDEyOjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDAxLzEw
LzE4IDEwOjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4+IE9uIDI4LjA5LjE4IGF0IDE5
OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gK3N0YXRpYyBj
aGFyICpwcmludF9kb21haW4oY2hhciAqc3RyLCBjaGFyICplbmQsIGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBOVUxMOwo+
Pj4+Pj4+ICsKPj4+Pj4+PiArICAgIC8qIFNvbWUgZGVidWdnaW5nIG1heSBoYXZlIGFuIG9wdGlv
bmFsbHktTlVMTCBwb2ludGVyLiAqLwo+Pj4+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSghZCkgKQo+
Pj4+Pj4+ICsgICAgICAgIHJldHVybiBzdHJpbmcoc3RyLCBlbmQsICJOVUxMIiwgLTEsIC0xLCAw
KTsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICBpZiAoIHN0ciA8IGVuZCApCj4+Pj4+Pj4gKyAgICAg
ICAgKnN0ciA9ICdkJzsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICBzd2l0Y2ggKCBkLT5kb21haW5f
aWQgKQo+Pj4+Pj4+ICsgICAgewo+Pj4+Pj4+ICsgICAgY2FzZSBET01JRF9JTzogICBuYW1lID0g
IltJT10iOyAgIGJyZWFrOwo+Pj4+Pj4+ICsgICAgY2FzZSBET01JRF9YRU46ICBuYW1lID0gIltY
RU5dIjsgIGJyZWFrOwo+Pj4+Pj4+ICsgICAgY2FzZSBET01JRF9DT1c6ICBuYW1lID0gIltDT1dd
IjsgIGJyZWFrOwo+Pj4+Pj4+ICsgICAgY2FzZSBET01JRF9JRExFOiBuYW1lID0gIltJRExFXSI7
IGJyZWFrOwo+Pj4+Pj4gICAgIGRlZmF1bHQ6IEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+Pj4+Pj4K
Pj4+Pj4+ID8KPj4+Pj4gTm8gLSBzcGVjaWZpY2FsbHkgbm90IGluIHRoaXMgY2FzZS4KPj4+Pj4K
Pj4+Pj4gVGhpcyBwYXRoIGlzIHVzZWQgd2hlbiBwcmludGluZyBjcmFzaCBpbmZvcm1hdGlvbiwg
YW5kIGZhbGxpbmcgYmFjayB0byBhCj4+Pj4+IG51bWJlciBpcyBiZXR0ZXIgYmVoYXZpb3VyIHRo
YW4gZmFsbGluZyBpbnRvIGFuIGluZmluaXRlIGxvb3AsCj4+Pj4+IG92ZXJmbG93aW5nIHRoZSBw
cmltYXJ5IHN0YWNrLCB0aGVuIHRha2luZyBhICNERiAod2hpY2ggZXNjYWxhdGVzIHRvCj4+Pj4+
IHRyaXBsZSBmYXVsdCBvbiBBTUQpLCB3aXRob3V0IHByaW50aW5nIGFueXRoaW5nIHVzZWZ1bC4K
Pj4+PiBBaCwgZ29vZCBwb2ludC4gUGVyaGFwcyB3b3J0aCBhIGJyaWVmIGNvbW1lbnQgaW5zdGVh
ZCBvZiBhICJkZWZhdWx0OiIKPj4+PiB0aGVuPwo+Pj4gVGhpcyBpbmNyZW1lbnRhbCBkaWZmPwo+
PiBMR1RNLCB0aGFua3MuCj4gCj4gSSd2ZSBjb21taXR0ZWQgdGhpcyBub3csIGJ1dCBpdHMganVz
dCBvY2N1cnJlZCB0byBtZSB0aGF0IHdlIGNvdWxkbid0Cj4gcG9zc2libHkgaGF2ZSBoYWQgYSBk
ZWZhdWx0IGNhc2UsIGJlY2F1c2UgdGhhdCBpcyB0aGUgY29tbW9uIGNhc2UgZm9yCj4gbW9zdCBk
b21haW5zLgoKT2gsIGluZGVlZCwgYnV0IHN0aWxsLCB3aGlsZSB0aGUgInVucmVhY2hhYmxlIiBw
YXJ0IG9mIG15IHN1Z2dlc3Rpb24Kd2FzIGluZGVlZCB3cm9uZywgYnV0IGl0IHN0aWxsIGNvdWxk
IGhhdmUgYmVlbgpBU1NFUlQoZC0+ZG9tYWluX2lkIDwgRE9NSURfRklSU1RfUkVTRVJWRUQpLiBC
dXQgSSBhZ3JlZSB0aGlzCndvdWxkbid0IGhhdmUgYmVlbiBvdmVybHkgaGVscGZ1bC4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
