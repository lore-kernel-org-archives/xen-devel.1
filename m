From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] VT-d: re-phrase logic in
 vtd_set_hwdom_mapping() for clarity
Date: Wed, 13 Jun 2018 10:07:12 +0200
Message-ID: <20180613080712.3d6tee63ss25ngay@mac>
References: <20180612134734.22132-1-paul.durrant@citrix.com>
 <20180612134734.22132-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v0sd=i7=citrix.com=prvs=695654bf1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fT0oY-0004l6-2R
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 08:07:34 +0000
Content-Disposition: inline
In-Reply-To: <20180612134734.22132-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMTIsIDIwMTggYXQgMDI6NDc6MzNQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEl0IGlzIGhhcmQgdG8gcmVjb25jaWxlIHRoZSBjb21tZW50IGF0IHRoZSB0b3Agb2Yg
dGhlIGxvb3AgaW4KPiB2dGRfc2V0X2h3ZG9tX21hcHBpbmcoKSB3aXRoIHRoZSBpZiBzdGF0ZW1l
bnQgZm9sbG93aW5nIGl0LiBUaGlzIHBhdGNoCj4gcmUtcGhyYXNlcyB0aGUgbG9naWMsIHByZXNl
cnZpbmcgdGhlIHNlbWFudGljcywgYnV0IG1ha2luZyBpdCBlYXNpZXIKPiB0byByZWFkLgo+IAo+
IFRoZSBwYXRjaCBhbHNvIG1vZGlmaWVzIHRoZSBYZW4gY29tbWFuZCBsaW5lIGRvY3VtZW50YXRp
b24gdG8gbWFrZSBpdAo+IGNsZWFyIHRoYXQgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcgb25seSBh
cHBsaWVzIHRvIHBhZ2VzIHVwIHRvIHRoZSA0R0IKPiBib3VuZGFyeS4KPiAKPiBOT1RFOiBUaGlz
IHBhdGNoIGFsc28gY29ycmVjdHMgdGhlIGluZGVudGF0aW9uIG9mIHRoZSBwcmludGsoKSB0b3dh
cmRzCj4gICAgICAgdGhlIGVuZCBvZiB2dGRfc2V0X2h3ZG9tX21hcHBpbmcoKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
