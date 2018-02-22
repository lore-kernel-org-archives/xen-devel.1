From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] build: Rename as-insn-check to as-insn-add
Date: Thu, 22 Feb 2018 12:39:15 +0000
Message-ID: <511bbc13-b5c5-73a1-9f8c-47df50705d69@citrix.com>
References: <1519296673-19470-1-git-send-email-andrew.cooper3@citrix.com>
 <5A8EB8A402000078001AA56C@prv-mh.provo.novell.com>
 <3ce4604a-1f4c-1ee3-cff1-884fd2c1226c@citrix.com>
 <5A8EC40A02000078001AA5CD@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A8EC40A02000078001AA5CD@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, IanJackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjIvMjAxOCAxMjoyMiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDIu
MTggYXQgMTI6NDEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjIv
MDIvMTggMTE6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjIuMDIuMTggYXQgMTE6
NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+PiBhcy1pbnNuLWNoZWNr
IG11dGF0ZXMgdGhlIHBhc3NlZC1pbiBmbGFncy4gIFJlbmFtZSBpdCB0byBhcy1pbnNuLWFkZCwg
aW4gbGluZQo+Pj4+IHdpdGggY2Mtb3B0aW9uLWFkZC4gIFVwZGF0ZSBhbGwgY2FsbGVycy4KPj4+
IEknbSBub3QgY29udmluY2VkIC0gY2Mtb3B0aW9uLWFkZCBtYWtlcyByZWxhdGl2ZWx5IGNsZWFy
IHRoYXQKPj4+IHNvbWV0aGluZyBpcyBiZWluZyBhZGRlZCB0byB0aGUgb3B0aW9ucyBwYXNzZWQg
dG8gQ0MuIElmIEkKPj4+IHRha2UgYXMtaW5zbi1hZGQgdGhpcyB3YXksIHRoZSBtYWNybyB3b3Vs
ZCBuZWVkIHRvIGFkZCBhbgo+Pj4gaW5zbiB0byB0aGUgQVMgaW52b2NhdGlvbi4gV2hpbGUgSSBh
Z3JlZSBhcy1pbnNuLWNoZWNrIGRvZXNuJ3QKPj4+IG1ha2UgY2xlYXIgdGhhdCBpdCBhZGRzIGFu
eSBvcHRpb25zLCBJIHN0aWxsIGZpbmQgdGhpcyBsZXNzCj4+PiBtaXNsZWFkaW5nIHRoYW4gdGhl
IHN1Z2dlc3RlZCBuZXcgbmFtZS4gTGV0J3Mgc2VlIHdoYXQKPj4+IG90aGVycyB0aGluay4KPj4K
Pj4gSSdtIG9wZW4gdG8gYmV0dGVyIG5hbWUgc3VnZ2VzdGlvbnMuCj4gCj4gVGhlIGJlc3QgSSBj
YW4gY29tZSB1cCB3aXRoIGlzLCB3ZWxsLCBhcy1pbnNuLWNoZWNrLCBhcyB0aGF0Cj4gcmVhc29u
YWJseSBkZXNjcmliZXMgYXQgbGVhc3QgcGFydCBvZiB3aGF0IHRoZSBjb25zdHJ1Y3QgZG9lcy4K
PiBhcy1pbnNuLWNoZWNrLWFuZC1hZGQtb3B0aW9uLCBiZXNpZGVzIGJlaW5nIHRvbyBsb25nLCBp
c24ndAo+IG1lYW5pbmdmdWxseSBiZXR0ZXIuCgpXZSdyZSBkZWZpbml0ZWx5IGdldHRpbmcgaW50
byBiaWtlc2hlZCB0ZXJyaXRvcnkgaGVyZS4gIEkgYWdyZWUgd2l0aApBbmR5IHRoYXQgJ2NoZWNr
JyBkb2Vzbid0IHJlYWxseSBjb252ZXkgdGhhdCBzb21ldGhpbmcgY2hhbmdlZC4gIElzIHRoZQpj
aGVjay1hbmQtYWRkICJhZGQgaXQgaWYgaXQgZG9lc24ndCBleGlzdCBhbHJlYWR5Ij8gIE9yIGFk
ZCBpdCBpZiBzb21lCm90aGVyIGNoZWNrIHBhc3NlcyAvIGZhaWxzPwoKIC1HZW9yZ2UKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
