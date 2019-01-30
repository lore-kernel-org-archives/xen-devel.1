From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/pv-shim: Avoid a command line parameter
 warning for CONFIG_PV_SHIM_EXCLUSIVE builds
Date: Wed, 30 Jan 2019 15:09:18 +0100
Message-ID: <2d9fe14f-ac49-e0dc-8de1-3c14546221a7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
References: =?UTF-8?B?PDE1NDg3ODg4NzDvv70xODUx77+9Me+/vWdpdO+/vXNlbmTvv71l?=
 =?UTF-8?Q?mail=ef=bf=bdandrew=2ecooper3=40citrix=2ecom=3e_=3c5C51751B020000?=
 =?UTF-8?B?NzgwMDIxMjM1NEBwcnYx77+9bWgucHJvdm8ubm92ZWxsLmNvbT4gPDgwNDQxOGU3?=
 =?UTF-8?Q?-a5c8-b108-dceb-a9ca7c04d312=40citrix=2ecom=3e_=3c5C51773D0200007?=
 =?UTF-8?Q?800212373=40suse=2ecom=3e?=
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
Cc: "Xen-devel <xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMjAxOSAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDEuMTkg
YXQgMTE6MDEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMzAvMDEv
MjAxOSAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyOS4wMS4xOSBhdCAyMDow
NywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9wdi9zaGltLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4+Pj4gQEAg
LTQwLDcgKzQwLDExIEBACj4+Pj4gICN1bmRlZiB2aXJ0X3RvX21mbgo+Pj4+ICAjZGVmaW5lIHZp
cnRfdG9fbWZuKHZhKSBfbWZuKF9fdmlydF90b19tZm4odmEpKQo+Pj4+ICAKPj4+PiAtI2lmbmRl
ZiBDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUKPj4+PiArI2lmZGVmIENPTkZJR19QVl9TSElNX0VY
Q0xVU0lWRQo+Pj4+ICsvKiBUb2xlcmF0ZSAicHYtc2hpbSIgYmVpbmcgcGFzc2VkIHRvIGEgQ09O
RklHX1BWX1NISU1fRVhDTFVTSVZFIGh5cGVydmlzb3IuICovCj4+Pj4gK3N0YXRpYyBib29sIF9k
aXNjYXJkOwo+Pj4+ICtib29sZWFuX3BhcmFtKCJwdi1zaGltIiwgX2Rpc2NhcmQpOwo+Pj4+ICsj
ZWxzZQo+Pj4+ICBib29sIHB2X3NoaW07Cj4+Pj4gIGJvb2xlYW5fcGFyYW0oInB2LXNoaW0iLCBw
dl9zaGltKTsKPj4+PiAgI2VuZGlmCj4+PiBJdCB3b3VsZCBlbmQgdXAgYmVpbmcgbGVzcyBleHRy
YSBjb2RlIGlmIHlvdSBkaWQKPj4+Cj4+PiAjaWZkZWYgQ09ORklHX1BWX1NISU1fRVhDTFVTSVZF
Cj4+PiAvKiBUb2xlcmF0ZSAicHYtc2hpbSIgYmVpbmcgcGFzc2VkIHRvIGEgQ09ORklHX1BWX1NI
SU1fRVhDTFVTSVZFIGh5cGVydmlzb3IuICovCj4+PiBzdGF0aWMgYm9vbCBfX2luaXRkYXRhIHB2
X3NoaW07Cj4+PiAjZWxzZQo+Pj4gYm9vbCBwdl9zaGltOwo+Pj4gI2VuZGlmCj4+PiBib29sZWFu
X3BhcmFtKCJwdi1zaGltIiwgcHZfc2hpbSk7Cj4+Cj4+IFNhZGx5IG5vdC4gIEluIHRoZSBFWENM
VVNJVkUgY2FzZSwgcHZfc2hpbSBpcyBkZWZpbmVkIHRvIGJlIDEsIGFuZCB0aGVuCj4+IHlvdSd2
ZSBnb3QgYW4gb2JqZWN0IG5hbWVkIHdpdGgganVzdCBhIG51bWJlci4gIChJIHRyaWVkIHRoaXMg
YXBwcm9hY2gKPj4gZmlyc3QuKQo+IAo+IE9oLCB0aGF0J3MgdW5mb3J0dW5hdGUgaW4gdGhpcyBw
YXJ0aWN1bGFyIGNhc2UuIEluIHdoaWNoIGNhc2UgSQo+IGRvbid0IGhhdmUgYW55IGJldHRlciBz
dWdnZXN0aW9uIGVpdGhlci4gT25lIHRoYXQgeW91IGFuZCBvdGhlcnMKPiBwZXJoYXBzIHdvdWxk
bid0IGxpa2Ugd291bGQgYmUKPiAKPiBjdXN0b21fcGFyYW0oInB2LXNoaW0iLCBOVUxMKTsKPiAK
PiB3aXRoIHBhcnNlX3BhcmFtcygpIHN1aXRhYmx5IGFkanVzdGVkIHRvIGF2b2lkIHRoZSBjYWxs
IGluIHRoYXQKPiBjYXNlLgoKSSdkIHJhdGhlciBhZGQgc29tZXRoaW5nIGxpa2UgaWdub3JlX3Bh
cmFtKCJwdi1zaGltIikgaW5zdGVhZCAod2l0aCB0aGUKbmV3IHR5cGUgT1BUX0lHTk9SRSkuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
