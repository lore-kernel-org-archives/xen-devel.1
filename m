From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/8] viridian: add init hooks
Date: Wed, 2 Jan 2019 17:36:54 +0000
Message-ID: <bd9e0ba5-4ad7-c98e-0504-c56e13d6f239@citrix.com>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-2-paul.durrant@citrix.com>
 <08055d6c-0c5b-85cc-b7f6-444d5da0a56a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhfW=PK=citrix.com=prvs=898633312=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gekSL-0002R0-Rj
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 17:37:25 +0000
In-Reply-To: <08055d6c-0c5b-85cc-b7f6-444d5da0a56a@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDEvMjAxOSAxNjowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE4
IDE2OjMzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggYWRkcyBkb21haW4gYW5k
IHZjcHUgaW5pdCBob29rcyBmb3IgdmlyaWRpYW4gZmVhdHVyZXMuIFRoZSBpbml0Cj4+IGhvb2tz
IGRvIG5vdCB5ZXQgZG8gYW55dGhpbmc7IHRoZXkgd2lsbCBiZSBhZGRlZCB0byBieSBzdWJzZXF1
ZW50IHBhdGNoZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+Cj4gUGxlYXNlIGNhbiB3ZSBzdGFydCBieSBmaXhpbmcgdGhlIGN1cnJl
bnQsIGJyb2tlbiwgaW5pdGlhbGlzYXRpb24gYW5kCj4gZGVzdHJ1Y3Rpb24gbG9naWMgPwo+Cj4g
VG8gZ2V0IHJpZCBvZiBET01DVExfc2V0bWF4dmNwdXMsIHdlIG5lZWQgdGhlICpfZGVzdHJveSgp
IGxvZ2ljIHRvIGJlCj4gZnVsbHkgaWRlbXBvdGVudC7CoCBBbHNvLCB2aXJpZGlhbl9kb21haW5f
ZGVpbml0KCkgc2hvdWxkIG5vdCBjYWxsIGludG8KPiB2aXJpZGlhbl92Y3B1X2RlaW5pdCgpLCBh
bmQgdmlyaWRpYW5fdmNwdV9kZWluaXQoKSBzaG91bGRuJ3QgYmUgZmFraW5nCj4gdXAgYSB3cml0
ZSB0byB0aGUgYXNzaXN0IHBhZ2UuCj4KPiBBRkFJQ1QsIHRoZSBkZWluaXQgcGF0aCBpcyBhbGwg
ZW50aXJlbHkgcG9pbnRsZXNzIGF0IHRoZSBtb21lbnQgYW5kIGNhbgo+IGJlIGRlbGV0ZWQuCgpH
aXZlbiB0aGF0IHdlIGFyZSBub3cgZ29pbmcgdG8gYmUgYWxsb2NhdGluZyBub24tdHJpdmlhbCBz
dHJ1Y3R1cmVzIGZvcgp2aXJpZGlhbiBkb21haW5zLCBJJ2QgbGlrZSB0byBmbG9hdCB0aGUgaWRl
YSBvZiBjaGFuZ2luZyB2aXJpZGlhbgppbml0aWFsaXNhdGlvbiB0byBiZSBhIGRvbWFpbmNyZWF0
ZSBmbGFnLCByYXRoZXIgdGhhbiBibGluZGx5IGFzc3VtaW5nCnRoYXQgYWxsIEhWTSBndWVzdHMg
d2FudCBpdC4KCkkgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBiZSBuZWNlc3NhcnkgcGFydCBvZiBm
aXhpbmcgQ1BVSUQgcG9saWN5CmRlcml2YXRpb24gaW4gdGhlIGxvbmd0ZXJtLCBiZWNhdXNlIHJl
Z2VuZXJhdGluZyB0aGUgcG9saWN5IHdoZW4KSFZNX1BBUkFNX1ZJUklESUFOIGNoYW5nZXMgaXNu
J3QgdmlhYmxlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
