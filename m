From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/8] viridian: add missing context save
 helpers into synic and time modules
Date: Wed, 2 Jan 2019 15:55:21 +0000
Message-ID: <20190102155521.ozhohdihj34vzj4u@zion.uk.xensource.com>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1geird-000187-Bf
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 15:55:25 +0000
Content-Disposition: inline
In-Reply-To: <20181220163345.10708-5-paul.durrant@citrix.com>
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

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDQ6MzM6NDFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEN1cnJlbnRseSB0aGUgdGltZSBtb2R1bGUgbGFja3MgdmNwdSBjb250ZXh0IHNhdmUg
aGVscGVycyBhbmQgdGhlIHN5bmljCj4gbW9kdWxlIGxhY2tzIGRvbWFpbiBjb250ZXh0IHNhdmUg
aGVscGVycy4gVGhlc2UgaGVscGVycyBhcmUgbm90IHlldAo+IHJlcXVpcmVkIGJ1dCBzdWJzZXF1
ZW50IHBhdGNoZXMgd2lsbCByZXF1aXJlIGF0IGxlYXN0IHNvbWUgb2YgdGhlbSBzbyB0aGlzCj4g
cGF0Y2ggY29tcGxldGVzIHRoZSBzZXQgdG8gYXZvaWQgaW50cm9kdWNpbmcgdGhlbSBpbiBhbiBh
ZC1ob2Mgd2F5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
Ckkgd291bGQgaGF2ZSBob29rZWQgdXAgdGhlIGhlbHBlcnMgdG8gdGhlaXIgcmVzcGVjdGl2ZSBj
YWxsc2l0ZXMgaW4gdGhpcwpwYXRjaCBpbnN0ZWFkIG9mIGxhdGVyIG9uZXMsIGJ1dCBJIHRoaW5r
IHRoaXMgaXMganVzdCBhIG1hdHRlciBvZgpwZXJzb25hbCB0YXN0ZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
