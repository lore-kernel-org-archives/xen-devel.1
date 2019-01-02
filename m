From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 7/8] viridian: stop directly calling
 viridian_time_ref_count_freeze/thaw()...
Date: Wed, 2 Jan 2019 15:55:34 +0000
Message-ID: <20190102155534.uxbvt3o4kp4jzyhk@zion.uk.xensource.com>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-8-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1geirr-0001Cu-A7
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 15:55:39 +0000
Content-Disposition: inline
In-Reply-To: <20181220163345.10708-8-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDQ6MzM6NDRQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmZyb20gYXJjaF9kb21haW5fc2h1dGRvd24vcGF1c2UvdW5wYXVzZSgpLgo+IAo+
IEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGludHJvZHVjZSBhbiBpbXBsZW1lbnRhaW9uIG9mIHN5
bnRoZXRpYyB0aW1lcnMKPiB3aGljaCB3aWxsIGFsc28gbmVlZCBmcmVlemUvdGhhdyBob29rcywg
c28gbWFrZSB0aGUgZXhwb3J0ZWQgaG9va3MgbW9yZQo+IGdlbmVyaWMgYW5kIGNhbGwgdGhyb3Vn
aCB0byAocmUtbmFtZWQgYW5kIHN0YXRpYykgdGltZV9yZWZfY291bnRfZnJlZXplL3RoYXcKPiBm
dW5jdGlvbnMuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBhbHNvIGludHJvZHVjZXMgYSBuZXcgdGlt
ZV9yZWZfY291bnQoKSBoZWxwZXIgdG8gcmV0dXJuCj4gICAgICAgdGhlIGN1cnJlbnQgY291bnRl
ciB2YWx1ZS4gVGhpcyBpcyBjdXJyZW50bHkgb25seSB1c2VkIGJ5IHRoZSBNU1IKPiAgICAgICBy
ZWFkIGhhbmRsZXIgYnV0IHRoZSBzeW50aGV0aWMgdGltZXIgY29kZSB3aWxsIGFsc28gbmVlZCB0
byB1c2UgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
