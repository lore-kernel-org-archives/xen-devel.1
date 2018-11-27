From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CODING_STYLE: explicitly call out label
 indentation
Date: Tue, 27 Nov 2018 16:48:59 +0000
Message-ID: <35a60c3a-8b80-c5e8-48e9-f65fb9828364@citrix.com>
References: <5BFBB70502000078001FFBDC@prv1-mh.provo.novell.com>
 <20181127152313.aicyygwdipch3fbf@zion.uk.xensource.com>
 <5BFD656A02000078002006EA@prv1-mh.provo.novell.com>
 <23549.28476.853916.355490@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=curg=og=citrix.com=prvs=86220cbda=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gRgXo-0006kx-J9
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 16:49:04 +0000
In-Reply-To: <23549.28476.853916.355490@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxNjoyMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU2luY2UgdGhlcmUgd2Fz
IHNvbWUgY29uZnVzaW9uIGFib3V0IHdoYXQgd2UgYXJlIHRhbGtpbmcgYWJvdXQsIHNlZQo+IGJl
bG93LiAgT2J2aW91c2x5IHRoZSBkaWZmIG91dHB1dCBpbiBteSBgMScgdGVzdCBjYXNlcyBpcwo+
IHByZWZlcmVhYmxlLiAgIE5vdGUgdGhhdCBgZ2l0IGRpZmYnIGRvZXMgdGhlIHNhbWUgdGhpbmcg
YXMgZGlmZiAtcAo+IChhbmQgaXQgZG9lc24ndCBldmVuIG5lZWQgYSAtcCBvcHRpb24gdG8gZG8g
aXQpLgoKQWZ0ZXIgc29tZSBpbnZlc3RpZ2F0aW9uLCBnaXQgZG9lcyB0aGUgY29ycmVjdCB0aGlu
ZyB3aGVuIHlvdSBhc2sgdG8KdHJlYXQgYyBmaWxlcyBhcyBjIGZpbGVzLgoKYW5kcmV3Y29vcEBh
bmRyZXdjb29wOn4kIGNhdCAuY29uZmlnL2dpdC9hdHRyaWJ1dGVzCiouW2hjXSBkaWZmPWNwcAoK
VGhpcyBoYXMgdGhlIGFkZGl0aW9uYWwgc2lkZSBlZmZlY3Qgb2YgbWFraW5nIGBnaXQgZGlmZiAt
LWNvbG9yLXdvcmRzYAphbmQgZnJpZW5kcyBmYXIgbW9yZSBsZWdpYmxlIGFuZCBuaWNlIHRvIHVz
ZS7CoCBJdHMgYSBzaGFtZSB0aGlzIGlzbid0CnRoZSBkZWZhdWx0LgoKPiBJIGFsc28gb2JzZXJ2
ZSB0aGF0IGJ5IGRlZmF1bHQsIGVtYWNzIHdhbnRzIHRvIGluZGVudCB0aGUgbGFiZWwgYnkgMQo+
IGNoYXJhY3RlciAtIGV2ZW4gdGhvdWdoIHVzdWFsbHkgaXQgbGlrZXMgdG8gYWxpZ24gbGFiZWxz
IHRvIHRoZSBMSFMgb2YKPiB0aGUgZW5jbG9zaW5nIGJsb2NrLiAgUHJlc3VtYWJseSBmb3IgdGhp
cyByZWFzb24uCgpBbmQgYWZ0ZXIgc29tZSBpbnZlc3RpZ2F0aW9uLCBlbWFjcyBkb2VzIHRoZSB3
cm9uZyB0aGluZyBpbiB0aGUgWGVuIHRyZWUKYmVjYXVzZSB3ZSBleHBsaWNpdGx5IGFzayBmb3Ig
QlNEIHN0eWxlIGluIHRoZSBsb2NhbCBibG9jay4KCldlIHNob3VsZCBtYWtlIGEgY2hvaWNlLCB0
aGVuIGZpeCBvdXIgYXV0b21hdGljIHRvb2xpbmcgdG8gbm90IGZvcmNlCmNvZGUgdG8gYmUgbm9u
LWNvbXBsaWFudC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
