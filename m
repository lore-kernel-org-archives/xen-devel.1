From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/pv-shim: Avoid a command line parameter
 warning for CONFIG_PV_SHIM_EXCLUSIVE builds
Date: Wed, 30 Jan 2019 15:16:38 +0100
Message-ID: <56cd0008-d777-fcb8-ce35-6faa7d61bce4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
References: =?UTF-8?B?PDE1NDg3ODg4NzDvv70xODUx77+9Me+/vWdpdO+/vXNlbmTvv71l?=
 =?UTF-8?Q?mail=ef=bf=bdandrew=2ecooper3=40citrix=2ecom=3e_=3c5C51751B020000?=
 =?UTF-8?B?NzgwMDIxMjM1NEBwcnYx77+9bWgucHJvdm8ubm92ZWxsLmNvbT4gPDgwNDQxOGU3?=
 =?UTF-8?Q?-a5c8-b108-dceb-a9ca7c04d312=40citrix=2ecom=3e_=3c5C51773D0200007?=
 =?UTF-8?Q?800212373=40suse=2ecom=3e_=3c2d9fe14f-ac49-e0dc-8de1-3c14546221a7?=
 =?UTF-8?Q?=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Xen-devel <xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMjAxOSAxNTowOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAzMC8wMS8yMDE5
IDExOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMzAuMDEuMTkgYXQgMTE6MDEsIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIDMwLzAxLzIwMTkgMDk6NTcs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDI5LjAxLjE5IGF0IDIwOjA3LCA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9z
aGltLmMKPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwo+Pj4+PiBAQCAtNDAsNyAr
NDAsMTEgQEAKPj4+Pj4gICN1bmRlZiB2aXJ0X3RvX21mbgo+Pj4+PiAgI2RlZmluZSB2aXJ0X3Rv
X21mbih2YSkgX21mbihfX3ZpcnRfdG9fbWZuKHZhKSkKPj4+Pj4gIAo+Pj4+PiAtI2lmbmRlZiBD
T05GSUdfUFZfU0hJTV9FWENMVVNJVkUKPj4+Pj4gKyNpZmRlZiBDT05GSUdfUFZfU0hJTV9FWENM
VVNJVkUKPj4+Pj4gKy8qIFRvbGVyYXRlICJwdi1zaGltIiBiZWluZyBwYXNzZWQgdG8gYSBDT05G
SUdfUFZfU0hJTV9FWENMVVNJVkUgaHlwZXJ2aXNvci4gKi8KPj4+Pj4gK3N0YXRpYyBib29sIF9k
aXNjYXJkOwo+Pj4+PiArYm9vbGVhbl9wYXJhbSgicHYtc2hpbSIsIF9kaXNjYXJkKTsKPj4+Pj4g
KyNlbHNlCj4+Pj4+ICBib29sIHB2X3NoaW07Cj4+Pj4+ICBib29sZWFuX3BhcmFtKCJwdi1zaGlt
IiwgcHZfc2hpbSk7Cj4+Pj4+ICAjZW5kaWYKPj4+PiBJdCB3b3VsZCBlbmQgdXAgYmVpbmcgbGVz
cyBleHRyYSBjb2RlIGlmIHlvdSBkaWQKPj4+Pgo+Pj4+ICNpZmRlZiBDT05GSUdfUFZfU0hJTV9F
WENMVVNJVkUKPj4+PiAvKiBUb2xlcmF0ZSAicHYtc2hpbSIgYmVpbmcgcGFzc2VkIHRvIGEgQ09O
RklHX1BWX1NISU1fRVhDTFVTSVZFIGh5cGVydmlzb3IuICovCj4+Pj4gc3RhdGljIGJvb2wgX19p
bml0ZGF0YSBwdl9zaGltOwo+Pj4+ICNlbHNlCj4+Pj4gYm9vbCBwdl9zaGltOwo+Pj4+ICNlbmRp
Zgo+Pj4+IGJvb2xlYW5fcGFyYW0oInB2LXNoaW0iLCBwdl9zaGltKTsKPj4+Cj4+PiBTYWRseSBu
b3QuICBJbiB0aGUgRVhDTFVTSVZFIGNhc2UsIHB2X3NoaW0gaXMgZGVmaW5lZCB0byBiZSAxLCBh
bmQgdGhlbgo+Pj4geW91J3ZlIGdvdCBhbiBvYmplY3QgbmFtZWQgd2l0aCBqdXN0IGEgbnVtYmVy
LiAgKEkgdHJpZWQgdGhpcyBhcHByb2FjaAo+Pj4gZmlyc3QuKQo+Pgo+PiBPaCwgdGhhdCdzIHVu
Zm9ydHVuYXRlIGluIHRoaXMgcGFydGljdWxhciBjYXNlLiBJbiB3aGljaCBjYXNlIEkKPj4gZG9u
J3QgaGF2ZSBhbnkgYmV0dGVyIHN1Z2dlc3Rpb24gZWl0aGVyLiBPbmUgdGhhdCB5b3UgYW5kIG90
aGVycwo+PiBwZXJoYXBzIHdvdWxkbid0IGxpa2Ugd291bGQgYmUKPj4KPj4gY3VzdG9tX3BhcmFt
KCJwdi1zaGltIiwgTlVMTCk7Cj4+Cj4+IHdpdGggcGFyc2VfcGFyYW1zKCkgc3VpdGFibHkgYWRq
dXN0ZWQgdG8gYXZvaWQgdGhlIGNhbGwgaW4gdGhhdAo+PiBjYXNlLgo+IAo+IEknZCByYXRoZXIg
YWRkIHNvbWV0aGluZyBsaWtlIGlnbm9yZV9wYXJhbSgicHYtc2hpbSIpIGluc3RlYWQgKHdpdGgg
dGhlCj4gbmV3IHR5cGUgT1BUX0lHTk9SRSkuCgpCVFcsIGluIGNhc2UgdGhpcyBpcyB0aGUgc2Vs
ZWN0ZWQgc29sdXRpb24gd2UgbWlnaHQgd2FudCB0byBhZGQKCmlnbm9yZV9wYXJhbSgicGxhY2Vo
b2xkZXIiKTsKCmFzIHdlbGwuIFNvbWUgb2xkIGdydWIgc2NyaXB0cyBzZWVtIHRvIGFkZCAicGxh
Y2Vob2xkZXIiIGFzIHRoZSBmaXJzdApib290IHBhcmFtZXRlciB0byBtaXRpZ2F0ZSBhIGdydWIg
ZXJyb3IgKGVhdGluZyBmaXJzdCBwYXJhbWV0ZXIpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
