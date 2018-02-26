From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: fix off-by-one in I/O bitmap limit
 check
Date: Mon, 26 Feb 2018 11:10:02 +0000
Message-ID: <8244efbf-def2-561c-7e8d-4714992f5e01@citrix.com>
References: <5A93C77302000078001AB8CB@prv-mh.provo.novell.com>
 <20180226104414.qjcefuqhbsgcchef@MacBook-Pro-de-Roger.local>
 <5A93F49502000078001ABA75@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7ddw=fu=citrix.com=prvs=588d4b4b4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eqGfb-0000f3-AL
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 11:10:11 +0000
In-Reply-To: <5A93F49502000078001ABA75@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMTggMTA6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjAyLjE4IGF0
IDExOjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEZlYiAyNiwg
MjAxOCBhdCAxMjozODoxMUFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLmFwdUBjaXRyaXguY29tPgo+IFRoYW5rcy4KPgo+PiBJIHdv
dWxkIGhvd2V2ZXIgaW52ZXJ0IHRoZSBjaGVjaywgbXkgYnJhaW4gZmluZHMgaXQgZWFzaWVyIHRv
IHJlYWQKPj4gYXM6Cj4+Cj4+IChwb3J0ICsgYnl0ZXMpIDw9IHYtPmFyY2gucHZfdmNwdS5pb2Jt
cF9saW1pdAo+IE15IGJyYWluIHRvbywgYnV0IEkgZGlkbid0IHdhbnQgdG8gbWFrZSB1bnJlbGF0
ZWQgY2hhbmdlcy4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPi7CoCBJIHRoaW5rIHRoaXMgaXMKYSBzdWZmaWNpZW50bHkgc21hbGwgYW5kIHdl
bGwtZGVzY3JpYmUgY2hhbmdlIHRoYXQgcmVhcnJhbmdpbmcgdGhlCmV4cHJlc3Npb24gZm9yIGNs
YXJpdHkgaXMgZmluZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
