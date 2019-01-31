From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 6/8] x86/mm: split p2m ioreq server pages
 special handling into helper
Date: Thu, 31 Jan 2019 17:58:03 +0100
Message-ID: <20190131165803.qp6x2jewpjdm5pt5@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-7-roger.pau@citrix.com>
 <21e2580abec14af2877c7d621208fa3b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KPPl=QH=citrix.com=prvs=927f2c6f3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gpFjK-0003zw-Px
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 17:02:22 +0000
Content-Disposition: inline
In-Reply-To: <21e2580abec14af2877c7d621208fa3b@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDM6NTk6NTBQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSBbbWFpbHRvOnJvZ2VyLnBhdUBjaXRyaXguY29tXQo+ID4gU2VudDogMzAgSmFudWFyeSAy
MDE5IDEwOjM3Cj4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiBDYzog
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA+
IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+OyBBbmRyZXcgQ29vcGVyCj4gPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBKdW4gTmFrYWppbWEKPiA+IDxqdW4ubmFrYWppbWFA
aW50ZWwuY29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBQYXVsIER1cnJh
bnQKPiA+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFtQQVRDSCA2Lzhd
IHg4Ni9tbTogc3BsaXQgcDJtIGlvcmVxIHNlcnZlciBwYWdlcyBzcGVjaWFsIGhhbmRsaW5nCj4g
PiBpbnRvIGhlbHBlcgo+ID4gQEAgLTYyNywxOSArNjIwLDYgQEAgcDJtX3B0X3NldF9lbnRyeShz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBnZm5fdCBnZm5fLAo+ID4gbWZuX3QgbWZuLAo+ID4gCj4g
PiAgICAgICAgICBwMm10X29sZCA9IHAybV9mbGFnc190b190eXBlKGwxZV9nZXRfZmxhZ3MoKnAy
bV9lbnRyeSkpOwo+ID4gCj4gPiAtICAgICAgICAvKgo+ID4gLSAgICAgICAgICogcDJtX2lvcmVx
X3NlcnZlciBpcyBvbmx5IHVzZWQgZm9yIDRLIHBhZ2VzLCBzbwo+ID4gLSAgICAgICAgICogdGhl
IGNvdW50IGlzIG9ubHkgZG9uZSBmb3IgbGV2ZWwgMSBlbnRyaWVzLgo+ID4gLSAgICAgICAgICov
Cj4gPiAtICAgICAgICBpZiAoIHAybXQgPT0gcDJtX2lvcmVxX3NlcnZlciApCj4gPiAtICAgICAg
ICAgICAgcDJtLT5pb3JlcS5lbnRyeV9jb3VudCsrOwo+ID4gLQo+ID4gLSAgICAgICAgaWYgKCBw
Mm10X29sZCA9PSBwMm1faW9yZXFfc2VydmVyICkKPiA+IC0gICAgICAgIHsKPiA+IC0gICAgICAg
ICAgICBBU1NFUlQocDJtLT5pb3JlcS5lbnRyeV9jb3VudCA+IDApOwo+ID4gLSAgICAgICAgICAg
IHAybS0+aW9yZXEuZW50cnlfY291bnQtLTsKPiA+IC0gICAgICAgIH0KPiA+IC0KPiAKPiBJcyBw
Mm1fb2xkIHN0aWxsIHVzZWQgb25jZSB0aGlzIGhhcyBnb25lPyBJbiBteSBzbGlnaHRseSBvdXQt
b2YtZGF0ZSBicmFuY2ggaXQgbG9va3MgbGlrZSBpdCBjb3VsZCBiZSByZW1vdmVkLgoKWWVzIGl0
IGNhbiBiZSByZW1vdmVkLCB0aGFua3MgZm9yIG5vdGljaW5nISBXaWxsIGZpeCBpbiB2Mi4KClJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
