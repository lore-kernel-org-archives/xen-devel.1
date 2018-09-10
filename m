From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v19 13/13] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Mon, 10 Sep 2018 16:29:55 +0300
Message-ID: <5bba404a350b88914ad27d5da0c3fe8464955928.camel@bitdefender.com>
References: <20180910123640.496-1-aisaila@bitdefender.com>
 <20180910123640.496-14-aisaila@bitdefender.com>
 <5B9670CF02000078001E6C56@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B9670CF02000078001E6C56@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE4LTA5LTEwIGF0IDA3OjI1IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiBPbiAxMC4wOS4xOCBhdCAxNDozNiwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90
ZToKPiA+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc2F2ZS5jCj4gPiBAQCAtMTU1LDYgKzE1NSwxMSBAQCBpbnQgaHZtX3NhdmVf
b25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkCj4gPiBpbnQgdHlwZWNvZGUsIHVuc2lnbmVk
IGludCBpbnN0YW5jZSwKPiA+ICAgICAgaWYgKCAhY3R4dC5kYXRhICkKPiA+ICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+ID4gIAo+ID4gKyAgICBpZiAoIGh2bV9zcl9oYW5kbGVyc1t0eXBlY29k
ZV0ua2luZCA9PSBIVk1TUl9QRVJfVkNQVSApCj4gPiArICAgICAgICB2Y3B1X3BhdXNlKGQtPnZj
cHVbaW5zdGFuY2VdKTsKPiAKPiBJcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB5b3UgZG9uJ3QgdXNl
IHYgaGVyZSBhbmQgLi4uCgpUaGVyZSBpcyBub3QgcmVhc29uIGJ1dCBJIGRpZCBub3Qgd2FudCB0
byBtb2RpZnkgdGhlIHJldmlld2VkIHBhdGNoCmZ1cnRoZXIKCkFsZXgKPiA+ICsgICAgZWxzZQo+
ID4gKyAgICAgICAgZG9tYWluX3BhdXNlKGQpOwo+ID4gKwo+ID4gICAgICBpZiAoIChydiA9IGh2
bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0uc2F2ZSh2LCAmY3R4dCkpICE9IDAgKQo+ID4gICAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiSFZNJWQgc2F2ZTogZmFpbGVkIHRvIHNhdmUgdHlwZQo+
ID4gJSJQUkl1MTYiICglZClcbiIsCj4gPiAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCB0
eXBlY29kZSwgcnYpOwo+ID4gQEAgLTE4Niw2ICsxOTEsMTEgQEAgaW50IGh2bV9zYXZlX29uZShz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZAo+ID4gaW50IHR5cGVjb2RlLCB1bnNpZ25lZCBpbnQg
aW5zdGFuY2UsCj4gPiAgICAgICAgICB9Cj4gPiAgICAgIH0KPiA+ICAKPiA+ICsgICAgaWYgKCBo
dm1fc3JfaGFuZGxlcnNbdHlwZWNvZGVdLmtpbmQgPT0gSFZNU1JfUEVSX1ZDUFUgKQo+ID4gKyAg
ICAgICAgdmNwdV91bnBhdXNlKGQtPnZjcHVbaW5zdGFuY2VdKTsKPiAKPiAuLi4gaGVyZT8KPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
