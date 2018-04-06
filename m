From: Julien Grall <julien.grall@arm.com>
Subject: Re: [for-4.11][PATCH v7 16/16] xen: Convert page_to_mfn
 and mfn_to_page to use typesafe MFN
Date: Fri, 6 Apr 2018 09:37:37 +0100
Message-ID: <361ac2f5-56a2-a8e1-ac37-a74252adff0f@arm.com>
References: <20180403153251.19595-1-julien.grall@arm.com>
 <20180403153251.19595-17-julien.grall@arm.com>
 <801482b0-519c-44b3-6601-c7e73aecf4f9@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <801482b0-519c-44b3-6601-c7e73aecf4f9@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Gang Wei <gang.wei@intel.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNC8wNi8yMDE4IDA5OjE5IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4g
T24gMDQvMDMvMjAxOCAwNDozMiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAgICB4ZW4vYXJj
aC94ODYvaHZtL2lvcmVxLmMgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gCj4gVGhlcmUgaXMg
YSBzbWFsbCBjbGFzaCB3aXRoIFBhdWwncyBHRk4gdHlwZXNhZmUgZm9yIGlvcmVxLgo+IFBhdWws
IGRvIHlvdSB3YW50IG1lIHRvIHJlc2VuZCBhIHBhdGNoIGZvciB0aGF0PwoKRllJLCB0aGlzIGlz
IHdoYXQgbG9va3MgbGlrZSB0aGUgbmV3IHBhdGNoIGZvciBpb3JlcS5jOgoKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKaW5k
ZXggMjI3NTI3ODMwNS4uM2EyMDFmNTU2MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9p
b3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtNDAxLDcgKzQwMSw3IEBA
IHN0YXRpYyB2b2lkIGh2bV9yZW1vdmVfaW9yZXFfZ2ZuKHN0cnVjdCBodm1faW9yZXFfc2VydmVy
ICpzLCBib29sIGJ1ZikKICAgICAgICAgcmV0dXJuOwogCiAgICAgaWYgKCBndWVzdF9waHlzbWFw
X3JlbW92ZV9wYWdlKGQsIGlvcnAtPmdmbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgX21mbihwYWdlX3RvX21mbihpb3JwLT5wYWdlKSksIDApICkKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFnZV90b19tZm4oaW9ycC0+cGFnZSksIDApICkKICAgICAg
ICAgZG9tYWluX2NyYXNoKGQpOwogICAgIGNsZWFyX3BhZ2UoaW9ycC0+dmEpOwogfQpAQCAtNDE4
LDcgKzQxOCw3IEBAIHN0YXRpYyBpbnQgaHZtX2FkZF9pb3JlcV9nZm4oc3RydWN0IGh2bV9pb3Jl
cV9zZXJ2ZXIgKnMsIGJvb2wgYnVmKQogICAgIGNsZWFyX3BhZ2UoaW9ycC0+dmEpOwogCiAgICAg
cmMgPSBndWVzdF9waHlzbWFwX2FkZF9wYWdlKGQsIGlvcnAtPmdmbiwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX21mbihwYWdlX3RvX21mbihpb3JwLT5wYWdlKSksIDApOworICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3RvX21mbihpb3JwLT5wYWdlKSwgMCk7
CiAgICAgaWYgKCByYyA9PSAwICkKICAgICAgICAgcGFnaW5nX21hcmtfcGZuX2RpcnR5KGQsIF9w
Zm4oZ2ZuX3goaW9ycC0+Z2ZuKSkpOwogCgoKPiAKPiBDaGVlcnMsCj4gCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
