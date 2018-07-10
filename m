From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 11:56:36 +0100
Message-ID: <6b083fa6-2d6e-846d-a800-02832f158368@citrix.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
 <5B4483F202000078001D28E2@prv1-mh.provo.novell.com>
 <73a5cb1a-a228-11c4-0f1d-da21a16726ad@citrix.com>
 <23364.35661.260888.861745@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxqp=j2=citrix.com=prvs=722797069=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fcqKG-0003tr-DP
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 10:56:56 +0000
In-Reply-To: <23364.35661.260888.861745@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTAvMjAxOCAxMTozMiBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJSZTogW1BBVENIXSBodm0vYWx0cDJtOiBDbGFyaWZ5IHRoZSBwcm9wZXIgd2F5
IHRvIGV4dGVuZCB0aGUgYWx0cDJtIGludGVyZmFjZSIpOgo+PiBPbiAwNy8xMC8yMDE4IDExOjAx
IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT3IgMmE6IEluY2x1ZGUgYSBjb21tZW50IHNheWlu
ZyB0aGUgJ2ludGVybmFsJyBpbnRlcmZhY2UgaGFzbid0IGJlZW4KPj4gZXZhbHVhdGVkIGZvciBz
YWZldHksIGFuZCBkb24ndCBib3RoZXIgYmxhY2tsaXN0aW5nIG5ldyBvcHMgdW50aWwgc3VjaAo+
PiBhbiBldmFsdWF0aW9uIGhhcyBiZWVuIG1hZGUuCj4gCj4gV2Ugc2hvdWxkIGhhdmUgYSB3YXkg
b2YgcmVtZW1iZXJpbmcgdGhlIGRlc2lnbiBpbnRlbnQsIGV2ZW4gaWYgaXQKPiBoYXNuJ3QgYmVl
biBhdWRpdGVkLgo+IAo+IFNVUFBPUlQubWQgY2FuIGRlYWwgd2l0aCB0aGUgcG9zc2libGUgcHJv
YmxlbSBvZiBwZW9wbGUgdGhpbmtpbmcgdGhlCj4gbm9uLWJsYWNrbGlzdGVkIGl0ZW1zIGFyZSBm
dWxseSByZWFkeSBmb3IgdXNlLgoKSSB0aGluayBTVVBQT1JULm1kIHNob3VsZCBwcmltYXJpbHkg
YmUgZm9yIGVuZCB1c2VycyB0byBkZXRlcm1pbmUKd2hldGhlciB0aGV5IHNob3VsZCB1c2UgYW4g
aW50ZXJmYWNlIG9yIG5vdC4gIEEgdGVjaG5pY2FsIGRpc2N1c3Npb24KYWJvdXQgZXhhY3RseSB0
byB3aGF0IGRlZ3JlZSBhbiBpbnRlcmZhY2UgaGFzIChvciBoYXNuJ3QpIGJlZW4gdmV0dGVkIGlz
Cm1vcmUgdG93YXJkcyBhIGRldmVsb3BlciB3aG8gbWF5IGJlIGxvb2tpbmcgdG8gZ2V0IHRoaW5n
cyBpbnRvIGEKc3VwcG9ydGVkIHN0YXRlLCBhbmQgc28gc2hvdWxkIHByb2JhYmx5IGJlIGluIHRo
ZSBjb2RlIHNvbWV3aGVyZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
