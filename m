From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 07:59:05 +0100
Message-ID: <29b8365e-2cae-fec6-0bff-46d014800d80@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9P0J-0004xU-4T
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 06:59:11 +0000
References: =?UTF-8?B?PDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Ne+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?B?bT4gPGUxMGMxNGNk77+9NTRhY++/vThkOGPvv70yZDVj77+9ZGI0YWRiZDM5ZDA3?=
 =?UTF-8?Q?=40citrix=2ecom=3e_=3caac2efca-8024-485a-4b8f-8565341c305c=40suse?=
 =?UTF-8?Q?=2ecom=3e_=3c5C9BA70E02000078002223A3=40suse=2ecom=3e_=3c3067f146?=
 =?UTF-8?Q?-bfc4-1f00-64bf-5750b6486ee1=40suse=2ecom=3e?=
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

T24gMjcvMDMvMjAxOSAxNzo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNy8wMy8yMDE5
IDE3OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjcuMDMuMTkgYXQgMTc6MTgsIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMjcvMDMvMjAxOSAxNjo1NSwgQW5kcmV3IENv
b3BlciB3cm90ZToKPj4+PiBPbiAxOC8wMy8yMDE5IDEzOjExLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+PiBJbnN0ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFu
ZCBhbGxvY2F0aW5nIHRoZW0KPj4+Pj4gYWdhaW4gd2hlbiByZXN1bWluZyBrZWVwIHRoZW0uIE9u
bHkgZnJlZSBhbiBhcmVhIGluIGNhc2UgYSBjcHUgZGlkbid0Cj4+Pj4+IGNvbWUgdXAgYWdhaW4g
d2hlbiByZXN1bWluZy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+Pj4+Cj4+Pj4gSG1tIC0gdGhpcyBpcyBzbGlnaHRseSBwcm9ibGVt
YXRpYywgZ2l2ZW4gdGhlIGR1YWwgbmF0dXJlIG9mIHRoaXMgY29kZS4KPj4+Pgo+Pj4+IEkgYWdy
ZWUgdGhhdCBpdCB0aGlzIGNoYW5nZSBpcyBiZW5lZmljaWFsIGZvciB0aGUgc3VzcGVuZCBjYXNl
LCBidXQgaXQKPj4+PiBpcyBhIHByb2JsZW0gd2hlbiB3ZSBhcmUgcGFya2luZyBhbiBpbmRpdmlk
dWFsIENQVSBmb3Igc210PTAgb3IKPj4+PiB4ZW4taHB0b29sIHJlYXNvbnMuCj4+Pj4KPj4+PiBE
byB3ZSBoYXZlIGFueSBoaW50IHdlIGNhbiB1c2Ugd2hlbiB0YWtpbmcgdGhlIENQVSBkb3duIGFz
IHRvIHdoZXRoZXIKPj4+PiB3ZSdyZSBleHBlY3RpbmcgaXQgdG8gY29tZSBzdHJhaWdodCBiYWNr
IHVwIGFnYWluPwo+Pj4KPj4+IERpZCB5b3UgbG9vayBpbnRvIHRoZSBwYXRjaD8gSSBkaWQgdGhp
cyBieSB0ZXN0aW5nIHN5c3RlbV9zdGF0ZS4KPj4KPj4gSSB0aGluayB0aGVyZSdzIGEgd2lkZXIg
cHJvYmxlbSBoZXJlOiBlbmFibGVfbm9uYm9vdF9jcHVzKCkKPj4gb25seSBicmluZ3MgYmFjayB1
cCB0aGUgQ1BVcyB0aGF0IHdlcmUgcHJldmlvdXNseSBvbmxpbmUuCj4+IFBhcmtlZCBvbmVzIHdv
dWxkIGJlIGxlZnQgYWxvbmUsIHlldCBhZnRlciByZXN1bWUgdGhleSdkCj4+IG5lZWQgdG8gYmUg
cHV0IGJhY2sgaW50byBwYXJrZWQgc3RhdGUuCj4gCj4gSSBjYW4gYWRkIHRoYXQgaGFuZGxpbmcg
aW4gdGhlIHJlc3BpbiBvZiB0aGUgc2VyaWVzLgoKTG9va2luZyBkZWVwZXIgaW50byB0aGF0IG1l
c3MgSSBiZWxpZXZlIHRoYXQgc2hvdWxkIGJlIGEgc2VyaWVzIG9mIGl0cwpvd24uIENwdSBwYXJr
aW5nIG5lZWRzIHRvIGJlIGhhbmRsZWQgZm9yIGNwdSBob3RwbHVnIGFuZCBjb3JlIHBhcmtpbmcK
KFhFTlBGX2NvcmVfcGFya2luZyksIHRvby4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
