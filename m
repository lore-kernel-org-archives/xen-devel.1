From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 01/60] hyper_dmabuf: initial working
 version of hyper_dmabuf drv
Date: Wed, 20 Dec 2017 09:17:07 +0100
Message-ID: <b2e54171-ff9e-6c68-2a39-ec42988a1663__30975.4533730031$1513757768$gmane$org@suse.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
 <20171219232731.GA6497@downor-Z87X-UD5H>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=groa=dq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eRZYu-00048h-3s
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 08:17:12 +0000
In-Reply-To: <20171219232731.GA6497@downor-Z87X-UD5H>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongwon Kim <dongwon.kim@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTIvMTcgMDA6MjcsIERvbmd3b24gS2ltIHdyb3RlOgo+IEkgZm9yZ290IHRvIGluY2x1
ZGUgdGhpcyBicmllZiBpbmZvcm1hdGlvbiBhYm91dCB0aGlzIHBhdGNoIHNlcmllcy4KPiAKPiBU
aGlzIHBhdGNoIHNlcmllcyBjb250YWlucyB0aGUgaW1wbGVtZW50YXRpb24gb2YgYSBuZXcgZGV2
aWNlIGRyaXZlciwKPiBoeXBlcl9kbWFidWYsIHdoaWNoIHByb3ZpZGVzIGEgbWV0aG9kIGZvciBE
TUEtQlVGIHNoYXJpbmcgYWNyb3NzCj4gZGlmZmVyZW50IE9TZXMgcnVubmluZyBvbiB0aGUgc2Ft
ZSB2aXJ0dWFsIE9TIHBsYXRmb3JtIHBvd2VyZWQgYnkKPiBhIGh5cGVydmlzb3IuCgpTb21lIGdl
bmVyYWwgcmVtYXJrcyByZWdhcmRpbmcgdGhpcyBzZXJpZXM6CgpZb3UgYXJlIHN0YXJ0aW5nIHRo
ZSB3aG9sZSBkcml2ZXIgaW4gZHJpdmVycy94ZW4vIGFuZCBpbiB0aGUgbGFzdCBwYXRjaAp5b3Ug
bW92ZSBpdCBvdmVyIHRvIGRyaXZlcnMvZG1hLWJ1Zi8uIFdoeSBkb24ndCB5b3UgdXNlIGRyaXZl
cnMvZG1hLWJ1Zi8KZnJvbSB0aGUgYmVnaW5uaW5nPyBUaGUgc2FtZSBhcHBsaWVzIHRvIGUuZy4g
cGF0Y2ggMjIgY2hhbmdpbmcgdGhlCmxpY2Vuc2UuIFBsZWFzZSBtYWtlIGl0IGVhc2llciBmb3Ig
dGhlIHJldmlld2VycyBieSBub3QgbGV0dGluZyB1cwpyZXZpZXcgdGhlIGRldmVsb3BtZW50IGhp
c3Rvcnkgb2YgeW91ciB3b3JrLgoKUGxlYXNlIHJ1biAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBv
biBlYWNoIHBhdGNoIGFuZCBjb3JyZWN0IHRoZSBpc3N1ZXMKaXQgaXMgcmVwb3J0aW5nLiBBdCB0
aGUgZmlyc3QgZ2xhbmNlIEkndmUgc2VlbiBzZXZlcmFsIHN0eWxlIHByb2JsZW1zCndoaWNoIEkg
d29uJ3QgY29tbWVudCB1bnRpbCB0aGUgbmV4dCByb3VuZC4KClBsZWFzZSBhZGQgdGhlIG1haW50
YWluZXJzIGFzIENjOiwgbm90IG9ubHkgdGhlIHJlbGF0ZWQgbWFpbGluZyBsaXN0cy4KQXMgeW91
IHNlZW0gdG8gYWltIHN1cHBvcnRpbmcgb3RoZXIgaHlwZXJ2aXNvcnMgdGhhbiBYZW4geW91IG1p
Z2h0IHdhbnQKdG8gYWRkIHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
IGFzIHdlbGwuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
