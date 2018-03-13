From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/5] x86/hvm: Handle viridian MSRs via
 the new guest_{rd, wr}msr() infrastructure
Date: Tue, 13 Mar 2018 10:25:55 -0600
Message-ID: <5AA809A302000078001B1226@prv-mh.provo.novell.com>
References: <1520449116-15443-1-git-send-email-andrew.cooper3@citrix.com>
 <1520449116-15443-2-git-send-email-andrew.cooper3@citrix.com>
 <5AA7FA4A02000078001B10D9@prv-mh.provo.novell.com>
 <41c1d046-117c-c9c7-077e-42ae6ef90656@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <41c1d046-117c-c9c7-077e-42ae6ef90656@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE4IGF0IDE2OjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMTggMTU6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNy4w
My4xOCBhdCAxOTo1OCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTE3NSwxMSArMTc3LDI2IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAqdiwg
dWludDMyX3QgbXNyLCAKPiB1aW50NjRfdCAqdmFsKQo+Pj4gICAgICAgICAgICAgICAgIF9NU1Jf
TUlTQ19GRUFUVVJFU19DUFVJRF9GQVVMVElORzsKPj4+ICAgICAgICAgIGJyZWFrOwo+Pj4gIAo+
Pj4gKyAgICBjYXNlIE1TUl9IWVBFUlZJU09SX1NUQVJUIC4uLiBNU1JfSFlQRVJWSVNPUl9TVEFS
VCArIE5SX1ZJUklESUFOX01TUlMgLSAKPiAKPj4+IDE6Cj4+PiArICAgICAgICBpZiAoIGlzX3Zp
cmlkaWFuX2RvbWFpbihkKSApCj4+PiArICAgICAgICB7Cj4+PiArICAgICAgICAgICAgcmV0ID0g
Z3Vlc3RfcmRtc3JfdmlyaWRpYW4odiwgbXNyLCB2YWwpOwo+Pj4gKyAgICAgICAgICAgIGdvdG8g
b3V0Owo+Pj4gKyAgICAgICAgfQo+Pj4gKwo+Pj4gKyAgICAgICAgLyogRmFsbHRocm91Z2guICov
Cj4+PiAgICAgIGRlZmF1bHQ6Cj4+PiAgICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFC
TEU7Cj4+PiAgICAgIH0KPj4+ICAKPj4+IC0gICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPj4+ICsg
b3V0Ogo+PiBJJ3ZlIG5vdGljZWQgdGhpcyBvbmx5IGluIHRoZSBjb250ZXh0IG9mIHBhdGNoIDQs
IGJ1dCB3aHkgaXMgdGhpcyBsYWJlbAo+PiBhbmQgeWV0IGFub3RoZXIgdW5uZWNlc3NhcnkgImdv
dG8iIGhlcmU/IFRoYXQgImdvdG8iIGNvdWxkIHNpbXBseQo+PiBiZSAiYnJlYWsiIGFmYWljcy4K
PiAKPiBBaCAtIHRoYXQgaXMgZm9yIGNoYW5nZXMgd2hpY2ggSSBoYXZlbid0IHBvc3RlZCB5ZXQu
Cj4gCj4gV2hlbiB3ZSBnZXQgb250byBNU1JzIHdoaWNoIG1pZ2h0IGJlIGluIHRoZSBsb2FkL3Nh
dmUgbGlzdHMsIG9yIG1heSBiZQo+IHN0YXNoZWQgaW4gdGhlIFZNQ0IvVk1DUyByYXRoZXIgdGhh
biBpbiByZWFsIGhhcmR3YXJlLCB3ZSBuZWVkIHRvIGNhbGwKPiBiYWNrIGludG8gYXJjaCBzcGVj
aWZpYyBjb2RlIHdoZW4gYW4gdXBkYXRlIGlzIGNvbXBsZXRlZC4KCkJ1dCBJIGRvbid0IHRoaW5r
IHRoaXMgcmVxdWlyZXMgYSBnb3RvIGhlcmUsIGRvZXMgaXQ/IElmIHRoYXQgZnV0dXJlCmNvZGUg
c3RydWN0dXJlIHJlYWxseSBjYW4ndCBnZXQgYXdheSB3aXRob3V0LCBzbyBiZSBpdCAodGhlbiku
IEJ1dApwbGVhc2UgbGV0J3MgZXZhbHVhdGUgdGhhdCBhdCB0aGUgdGltZSB5b3UgaGF2ZSB0aGF0
IGNvZGUgcmVhZHkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
