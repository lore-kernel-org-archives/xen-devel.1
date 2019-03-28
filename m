From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 09:35:43 +0100
Message-ID: <621ec54c-58b2-f10a-4f4b-a8cc59e6a2fb@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9QVp-0005gP-8V
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 08:35:49 +0000
References: =?UTF-8?B?PDIwMTkwMzE4MTMxMTU1LjI5NDUw77+977+977+977+9Me+/vQ==?=
 =?UTF-8?B?77+977+977+9amdyb3NzQHN1c2UuY29tPiA8MjAxOTAzMTgxMzExNTUuMjk0NTA=?=
 =?UTF-8?B?77+977+977+977+9Ne+/ve+/ve+/ve+/vWpncm9zc0BzdXNlLmNvbT4gPGUxMGMx?=
 =?UTF-8?B?NGNk77+977+977+977+9NTRhY++/ve+/ve+/ve+/vThkOGPvv73vv73vv73vv70y?=
 =?UTF-8?B?ZDVj77+977+977+977+9ZGI0YWRiZDM5ZDA3QGNpdHJpeC5jb20+IDxhYWMyZWZj?=
 =?UTF-8?B?Ye+/vTgwMjTvv700ODVh77+9NGI4Zu+/vTg1NjUzNDFjMzA1Y0BzdXNlLmNvbT4g?=
 =?UTF-8?Q?=3c5C9BA70E02000078002223A3=40suse=2ecom=3e_=3c3067f146=ef=bf=bdb?=
 =?UTF-8?B?ZmM077+9MWYwMO+/vTY0Ymbvv701NzUwYjY0ODZlZTFAc3VzZS5jb20+IDwyOWI4?=
 =?UTF-8?Q?365e-2cae-fec6-0bff-46d014800d80=40suse=2ecom=3e_=3c5C9C7FD202000?=
 =?UTF-8?Q?078002225AB=40suse=2ecom=3e?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAwOTowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDMuMTkg
YXQgMDc6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyNy8wMy8yMDE5IDE3OjUy
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMjcvMDMvMjAxOSAxNzozOCwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMjcuMDMuMTkgYXQgMTc6MTgsIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOgo+Pj4+PiBPbiAyNy8wMy8yMDE5IDE2OjU1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
Pj4+Pj4gT24gMTgvMDMvMjAxOSAxMzoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiBJ
bnN0ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0
aW5nIHRoZW0KPj4+Pj4+PiBhZ2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVl
IGFuIGFyZWEgaW4gY2FzZSBhIGNwdSBkaWRuJ3QKPj4+Pj4+PiBjb21lIHVwIGFnYWluIHdoZW4g
cmVzdW1pbmcuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gSG1tIC0gdGhpcyBpcyBzbGlnaHRseSBwcm9i
bGVtYXRpYywgZ2l2ZW4gdGhlIGR1YWwgbmF0dXJlIG9mIHRoaXMgY29kZS4KPj4+Pj4+Cj4+Pj4+
PiBJIGFncmVlIHRoYXQgaXQgdGhpcyBjaGFuZ2UgaXMgYmVuZWZpY2lhbCBmb3IgdGhlIHN1c3Bl
bmQgY2FzZSwgYnV0IGl0Cj4+Pj4+PiBpcyBhIHByb2JsZW0gd2hlbiB3ZSBhcmUgcGFya2luZyBh
biBpbmRpdmlkdWFsIENQVSBmb3Igc210PTAgb3IKPj4+Pj4+IHhlbi1ocHRvb2wgcmVhc29ucy4K
Pj4+Pj4+Cj4+Pj4+PiBEbyB3ZSBoYXZlIGFueSBoaW50IHdlIGNhbiB1c2Ugd2hlbiB0YWtpbmcg
dGhlIENQVSBkb3duIGFzIHRvIHdoZXRoZXIKPj4+Pj4+IHdlJ3JlIGV4cGVjdGluZyBpdCB0byBj
b21lIHN0cmFpZ2h0IGJhY2sgdXAgYWdhaW4/Cj4+Pj4+Cj4+Pj4+IERpZCB5b3UgbG9vayBpbnRv
IHRoZSBwYXRjaD8gSSBkaWQgdGhpcyBieSB0ZXN0aW5nIHN5c3RlbV9zdGF0ZS4KPj4+Pgo+Pj4+
IEkgdGhpbmsgdGhlcmUncyBhIHdpZGVyIHByb2JsZW0gaGVyZTogZW5hYmxlX25vbmJvb3RfY3B1
cygpCj4+Pj4gb25seSBicmluZ3MgYmFjayB1cCB0aGUgQ1BVcyB0aGF0IHdlcmUgcHJldmlvdXNs
eSBvbmxpbmUuCj4+Pj4gUGFya2VkIG9uZXMgd291bGQgYmUgbGVmdCBhbG9uZSwgeWV0IGFmdGVy
IHJlc3VtZSB0aGV5J2QKPj4+PiBuZWVkIHRvIGJlIHB1dCBiYWNrIGludG8gcGFya2VkIHN0YXRl
Lgo+Pj4KPj4+IEkgY2FuIGFkZCB0aGF0IGhhbmRsaW5nIGluIHRoZSByZXNwaW4gb2YgdGhlIHNl
cmllcy4KPj4KPj4gTG9va2luZyBkZWVwZXIgaW50byB0aGF0IG1lc3MgSSBiZWxpZXZlIHRoYXQg
c2hvdWxkIGJlIGEgc2VyaWVzIG9mIGl0cwo+PiBvd24uIENwdSBwYXJraW5nIG5lZWRzIHRvIGJl
IGhhbmRsZWQgZm9yIGNwdSBob3RwbHVnIGFuZCBjb3JlIHBhcmtpbmcKPj4gKFhFTlBGX2NvcmVf
cGFya2luZyksIHRvby4KPiAKPiBXaGF0IGlzc3VlIGRvIHlvdSBzZWUgZm9yIENQVSBob3RwbHVn
PyBjcHVfdXBfaGVscGVyKCkgaGFzCj4gYmVlbiBtb2RpZmllZCBieSB0aGUgcGFya2luZyBzZXJp
ZXMuCgpJIHdhcyB0aGlua2luZyBvZiBob3QgdW5wbHVnLiBjcHVfZG93bigpIHdvbid0IGRvIHRo
ZSBqb2IgZm9yIGEgcGFya2VkCmNwdS4KCj4gRm9yIGNvcmUgcGFya2luZyBJIHdvbmRlciB3aGV0
aGVyIGNvcmVfcGFya2luZ19oZWxwZXIoKQo+IHNob3VsZG4ndCwgZmlyc3Qgb2YgYWxsLCBpbnZv
a2UgY3B1X3t1cCxkb3dufV9oZWxwZXIoKS4gVGhpcwo+IHdvdWxkbid0IGJlIGVub3VnaCwgdGhv
dWdoIC0gdGhlIHBvbGljeSBob29rcyBuZWVkIHRvIGhvbm9yCj4gb3B0X3NtdCBhcyB3ZWxsLgoK
UmlnaHQuCgo+IEFzIHRvIHRoaXMgd2FudGluZyB0byBiZSBhIHBhdGNoIC8gc2VyaWVzIG9mIGl0
cyBvd24gLSBJIGRvbid0Cj4gbWluZCwgYnV0IHByZWZlcmFibHkgaXQgd291bGQgY29tZSBhaGVh
ZCBvZiB5b3VyIGNoYW5nZXMKPiBoZXJlLCBzbyB0aGF0IGl0IGNhbiBiZSBiYWNrcG9ydGVkIGlu
ZGVwZW5kZW50bHkgYW5kCj4gKHN1ZmZpY2llbnRseSkgZWFzaWx5ICh1bmxlc3Mgb2YgY291cnNl
IHRoZXJlJ3MgcmVhbGx5IG5vCj4gY29sbGlzaW9uIGJldHdlZW4gdGhlIHR3bykuCgpJbiBjYXNl
IHRoZXJlIGlzIGEgY29sbGlzaW9uIGl0IHNob3VsZCBiZSBmYWlybHkgbWluaW1hbC4KCkknZCBw
cmVmZXIgbm90IHRvIGJsb2NrIG15IHNlcmllcyBhcyBpdCBpcyBhIHByZXJlcXVpc2l0ZSBmb3Ig
bXkgY29yZQpzY2hlZHVsaW5nIHNlcmllcywgd2hpY2ggSSBiZWxpZXZlIHNob3VsZCBnbyBpbiBy
YXRoZXIgc29vbmVyIHRoYW4gbGF0ZXIKYXMgaXQgcHJvYmFibHkgc2hvdWxkIHNlZSBsb3Qgb2Yg
dGVzdGluZyBiZWZvcmUgdGhlIG5leHQgcmVsZWFzZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
