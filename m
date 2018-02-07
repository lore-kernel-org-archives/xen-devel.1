From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/emul: Fix the decoding of segment
 overrides in 64bit mode
Date: Wed, 07 Feb 2018 08:21:48 -0700
Message-ID: <5A7B279C02000078001A61A0@prv-mh.provo.novell.com>
References: <1518014461-16289-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518014461-16289-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE4IGF0IDE1OjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRXhwbGljaXQgc2VnbWVudCBvdmVyaWRlcyBvdGhlciB0aGFuICVmcyBhbmQgJWdzIGFy
ZSBkb2N1bWVudGVkIGFzIGlnbm9yZWQgYnkKPiBib3RoIEludGVsIGFuZCBBTUQuCj4gCj4gSW4g
cHJhY3RpY2UsIHRoaXMgbWVhbnMgdGhhdDoKPiAKPiAgKiBFeHBsaWNpdCB1c2VzIG9mICVzcyBk
b24ndCBhY3R1YWxseSB5aWVsZCAjU1NbMF0gZm9yIG5vbi1jYW5vbmljYWwKPiAgICBtZW1vcnkg
cmVmZXJlbmNlcy4KPiAgKiBFeHBsaWNpdCB1c2VzIG9mICV7ZSxjLGR9cyBkb24ndCBvdmVycmlk
ZSAlcmJwLyVyc3AtYmFzZWQgbWVtb3J5IHJlZmVyZW5jZXMKPiAgICB0byB5aWVsZCAjR1BbMF0g
Zm9yIG5vbi1jYW5vbmljYWwgbWVtb3J5IHJlZmVyZW5jZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
