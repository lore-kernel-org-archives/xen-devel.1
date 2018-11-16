From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/5] vpci: fix deferral of long operations
Date: Fri, 16 Nov 2018 05:11:39 -0700
Message-ID: <5BEEB3FB02000078001FCBBB@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNcyN-0001kc-DI
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 12:11:43 +0000
In-Reply-To: <20181114115740.1050-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEN1cnJlbnQgbG9naWMgdG8gaGFuZGxlIGxvbmcgcnVubmluZyBvcGVyYXRpb25zIGhhcyB0d28g
Zmxhd3M6Cj4gCj4gIC0gaHZtX2lvX3BlbmRpbmcgaXMgb25seSB1c2VkIGJ5IEludGVsIGNvZGUs
IGZpeCB0aGlzIGJ5IG1vdmluZyB0aGUKPiAgICBjYWxsIHRvIHZwY2lfcHJvY2Vzc19wZW5kaW5n
IGludG8gaGFuZGxlX2h2bV9pb19jb21wbGV0aW9uLgoKQXMgbWVudGlvbmVkIGJlZm9yZSwgdGhl
IHJlZmVyZW5jZSB0byBJbnRlbCBjb2RlIGlzIHdyb25nIGhlcmUuClRoZSBtYWluIGNhbGxlciBp
cyBoYW5kbGVfcGlvKCksIGFuZCB0aGUgSW50ZWwgc3BlY2lmaWMgb25lIHNpdHMgaW4KbmVzdGVk
IFZNWCBjb2RlIGFueXdheSwgc28gaXMgb2YgYmFzaWNhbGx5IG5vIGludGVyZXN0IGZvciB0aGUK
cHVycG9zZXMgaGVyZS4KCj4gQEAgLTE4Niw2ICsxODMsOSBAQCBib29sIGhhbmRsZV9odm1faW9f
Y29tcGxldGlvbihzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIGVudW0gaHZtX2lvX2NvbXBsZXRpb24g
aW9fY29tcGxldGlvbjsKPiAgICAgIHVuc2lnbmVkIGludCBpZDsKPiAgCj4gKyAgICBpZiAoIGhh
c192cGNpKGQpICYmIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHYpICkKPiArICAgICAgICByZXR1cm4g
ZmFsc2U7CgpJIHRoaW5rIHRoaXMgd291bGQgYmUgdGhlIGJldHRlciBwbGFjZSB0byByYWlzZSB0
aGUgc2NoZWR1bGVyIHNvZnRpcnEuCnZwY2lfcHJvY2Vzc19wZW5kaW5nKCkgc2hvdWxkIGluZGlj
YXRlZCB0byBpdHMgY2FsbGVyIGp1c3Qgd2hldGhlcgpwcmVlbXB0aW9uIGlzIG5lZWRlZCwgYnV0
IHNob3VsZCBub3QgY2FyZSBob3cgdGhpcyBpcyBhY3R1YWxseSB0bwpiZSBlZmZlY3RlZC4gVGhp
cyBpcyBiZW5pZ24gbm93LCBidXQgbWlnaHQgY2hhbmdlIGlmIGEgc2Vjb25kCmNhbGxlciB3b3Vs
ZCBuZWVkIGFkZGluZy4KCj4gQEAgLTE4Miw2ICsxODUsNyBAQCBzdGF0aWMgdm9pZCBkZWZlcl9t
YXAoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gICAgICBjdXJyLT52
cGNpLm1lbSA9IG1lbTsKPiAgICAgIGN1cnItPnZwY2kuY21kID0gY21kOwo+ICAgICAgY3Vyci0+
dnBjaS5yb21fb25seSA9IHJvbV9vbmx5Owo+ICsgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9T
T0ZUSVJRKTsKPiAgfQoKV2h5IGlzIHRoaXMgbmVlZGVkPyBUaGUgZGVzY3JpcHRpb24gZG9lc24n
dCBtZW50aW9uIGl0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
