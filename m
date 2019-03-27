From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Wed, 27 Mar 2019 17:52:18 +0100
Message-ID: <3067f146-bfc4-1f00-64bf-5750b6486ee1@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9Bmp-000061-Gb
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:52:23 +0000
References: =?UTF-8?B?PDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Ne+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?B?bT4gPGUxMGMxNGNk77+9NTRhY++/vThkOGPvv70yZDVj77+9ZGI0YWRiZDM5ZDA3?=
 =?UTF-8?Q?=40citrix=2ecom=3e_=3caac2efca-8024-485a-4b8f-8565341c305c=40suse?=
 =?UTF-8?Q?=2ecom=3e_=3c5C9BA70E02000078002223A3=40suse=2ecom=3e?=
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNzozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMDMuMTkg
YXQgMTc6MTgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyNy8wMy8yMDE5IDE2OjU1
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTgvMDMvMjAxOSAxMzoxMSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+PiBJbnN0ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBz
dXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0KPj4+PiBhZ2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAg
dGhlbS4gT25seSBmcmVlIGFuIGFyZWEgaW4gY2FzZSBhIGNwdSBkaWRuJ3QKPj4+PiBjb21lIHVw
IGFnYWluIHdoZW4gcmVzdW1pbmcuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gSG1tIC0gdGhpcyBpcyBzbGlnaHRseSBwcm9i
bGVtYXRpYywgZ2l2ZW4gdGhlIGR1YWwgbmF0dXJlIG9mIHRoaXMgY29kZS4KPj4+Cj4+PiBJIGFn
cmVlIHRoYXQgaXQgdGhpcyBjaGFuZ2UgaXMgYmVuZWZpY2lhbCBmb3IgdGhlIHN1c3BlbmQgY2Fz
ZSwgYnV0IGl0Cj4+PiBpcyBhIHByb2JsZW0gd2hlbiB3ZSBhcmUgcGFya2luZyBhbiBpbmRpdmlk
dWFsIENQVSBmb3Igc210PTAgb3IKPj4+IHhlbi1ocHRvb2wgcmVhc29ucy4KPj4+Cj4+PiBEbyB3
ZSBoYXZlIGFueSBoaW50IHdlIGNhbiB1c2Ugd2hlbiB0YWtpbmcgdGhlIENQVSBkb3duIGFzIHRv
IHdoZXRoZXIKPj4+IHdlJ3JlIGV4cGVjdGluZyBpdCB0byBjb21lIHN0cmFpZ2h0IGJhY2sgdXAg
YWdhaW4/Cj4+Cj4+IERpZCB5b3UgbG9vayBpbnRvIHRoZSBwYXRjaD8gSSBkaWQgdGhpcyBieSB0
ZXN0aW5nIHN5c3RlbV9zdGF0ZS4KPiAKPiBJIHRoaW5rIHRoZXJlJ3MgYSB3aWRlciBwcm9ibGVt
IGhlcmU6IGVuYWJsZV9ub25ib290X2NwdXMoKQo+IG9ubHkgYnJpbmdzIGJhY2sgdXAgdGhlIENQ
VXMgdGhhdCB3ZXJlIHByZXZpb3VzbHkgb25saW5lLgo+IFBhcmtlZCBvbmVzIHdvdWxkIGJlIGxl
ZnQgYWxvbmUsIHlldCBhZnRlciByZXN1bWUgdGhleSdkCj4gbmVlZCB0byBiZSBwdXQgYmFjayBp
bnRvIHBhcmtlZCBzdGF0ZS4KCkkgY2FuIGFkZCB0aGF0IGhhbmRsaW5nIGluIHRoZSByZXNwaW4g
b2YgdGhlIHNlcmllcy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
