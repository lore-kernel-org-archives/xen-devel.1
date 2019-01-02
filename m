From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/8] viridian: separately allocate domain
 and vcpu structures
Date: Wed, 2 Jan 2019 15:55:00 +0000
Message-ID: <20190102155500.5ge3tqfkggalco36@zion.uk.xensource.com>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1geirW-00017E-Lk
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 15:55:18 +0000
Content-Disposition: inline
In-Reply-To: <20181220163345.10708-3-paul.durrant@citrix.com>
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

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDQ6MzM6MzlQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ICAKPiAgdm9pZCB2aXJpZGlhbl92Y3B1X2RlaW5pdChzdHJ1Y3QgdmNwdSAqdikKPiAg
ewo+IC0gICAgdmlyaWRpYW5fc3luaWNfd3Jtc3IodiwgSFZfWDY0X01TUl9WUF9BU1NJU1RfUEFH
RSwgMCk7Cj4gKyAgICBpZiAoICF2LT5hcmNoLmh2bS52aXJpZGlhbiApCj4gKyAgICAgICAgcmV0
dXJuOwo+ICsKPiArICAgIGlmICggaXNfdmlyaWRpYW5fdmNwdSh2KSApCj4gKyAgICAgICAgdmly
aWRpYW5fc3luaWNfd3Jtc3IodiwgSFZfWDY0X01TUl9WUF9BU1NJU1RfUEFHRSwgMCk7Cj4gKwo+
ICsgICAgeGZyZWUodi0+YXJjaC5odm0udmlyaWRpYW4pOwo+ICsgICAgdi0+YXJjaC5odm0udmly
aWRpYW4gPSBOVUxMOwoKUGxlYXNlIHVzZSBYRlJFRSgpIGhlcmUgYW5kIGJlbG93LgoKV2l0aCBp
dCBmaXhlZDoKClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
