From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/hvm: introduce cr_mask to store
 trapped bits of CR accesses
Date: Mon, 19 Feb 2018 15:04:01 +0000
Message-ID: <20180219150401.uwf7zgxcrgc5xgmt@MacBook-Pro-de-Roger.local>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-2-roger.pau@citrix.com>
 <8f22586d-523f-c3a2-6b9f-c7a6f2514aed@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1enmzO-0004yK-QA
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 15:04:22 +0000
Content-Disposition: inline
In-Reply-To: <8f22586d-523f-c3a2-6b9f-c7a6f2514aed@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMTI6NDk6NTdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNi8wMi8xOCAxMjoxMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL3ZjcHUuaAo+ID4gaW5kZXggZDkzMTY2ZmI5Mi4uODExZDRjMTBhZSAxMDA2NDQK
PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaAo+ID4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCj4gPiBAQCAtMTU2LDYgKzE1Niw5IEBAIHN0cnVjdCBo
dm1fdmNwdSB7Cj4gPiAgICAgICAqLwo+ID4gICAgICB1bnNpZ25lZCBsb25nICAgICAgIGh3X2Ny
WzVdOwo+ID4gIAo+ID4gKyAgICAvKiBDYWNoZWQgY29weSBvZiB0aGUgdHJhcHBlZCBiaXRzIG9m
IENScy4gVXNlZCBmb3IgQ1IwIGFuZCBDUjQuICovCj4gPiArICAgIHVuc2lnbmVkIGxvbmcgICAg
ICAgbWFza19jcls1XTsKPiAKPiBXZSBvbmx5IG5lZWQgbWFza3MgZm9yIGNyMCBhbmQgY3I0LCBh
bmQgSSBkb24ndCBleHBlY3QgdGhpcyB0byBjaGFuZ2UKPiBmb3IgdGhlIGZvcmVzZWVhYmxlIGZ1
dHVyZSAoQ1I0IHN0aWxsIGhhcyBwbGVudHkgb2YgYXZhaWxhYmxlIGJpdHMgaW4KPiBpdCkuwqAg
SSdkIHJlY29tbWVuZDoKPiAKPiB1bnNpZ25lZCBsb25nIGNyMF9ob3N0X21hc2ssIGNyNF9ob3N0
X21hc2s7CgpPSywgSSd2ZSB1c2VkIGFuIGFycmF5IHRvIGtlZXAgY29uc2lzdGVuY3kgd2l0aCB0
aGUgb3RoZXIgQ1IgYXJyYXkKZmllbGRzLCBidXQgSSBndWVzcyBoZXJlIGl0IG1ha2VzIGxlc3Mg
c2Vuc2UgYmVjYXVzZSBvbmx5IHR3byBvZiB0aGVtCmFyZSBnb2luZyB0byBiZSB1c2VkLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
