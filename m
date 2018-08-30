From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/7] xen/hvm: Rename d->arch.hvm_domain to
 d->arch.hvm
Date: Thu, 30 Aug 2018 08:39:02 -0600
Message-ID: <5B88018602000078001E38F4@prv1-mh.provo.novell.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-4-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE5OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXNpLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3Ztc2kuYwo+IEBAIC0xNzMsNyArMTczLDcgQEAgc3RhdGljIERFRklORV9SQ1VfUkVBRF9M
T0NLKG1zaXh0YmxfcmN1X2xvY2spOwo+ICAgKi8KPiAgc3RhdGljIGJvb2wgbXNpeHRibF9pbml0
aWFsaXNlZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICB7Cj4gLSAgICByZXR1cm4gISFkLT5h
cmNoLmh2bV9kb21haW4ubXNpeHRibF9saXN0Lm5leHQ7Cj4gKyAgICByZXR1cm4gISFkLT5hcmNo
Lmh2bS5tc2l4dGJsX2xpc3QubmV4dDsKCkhvdyBhYm91dCBkcm9wcGluZyB0aGUgISEgaGVyZSBh
dCB0aGUgc2FtZSB0aW1lPwoKPiBAQCAtMTY0Myw3ICsxNjQzLDcgQEAgdm9pZCB2bXhfdmNwdV9m
bHVzaF9wbWxfYnVmZmVyKHN0cnVjdCB2Y3B1ICp2KQo+ICAKPiAgYm9vbF90IHZteF9kb21haW5f
cG1sX2VuYWJsZWQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPiAgewo+IC0gICAgcmV0dXJuICEh
KGQtPmFyY2guaHZtX2RvbWFpbi52bXguc3RhdHVzICYgVk1YX0RPTUFJTl9QTUxfRU5BQkxFRCk7
Cj4gKyAgICByZXR1cm4gISEoZC0+YXJjaC5odm0udm14LnN0YXR1cyAmIFZNWF9ET01BSU5fUE1M
X0VOQUJMRUQpOwo+ICB9CgpBbmQgaGVyZS4KCj4gQEAgLTExMiw3ICsxMTIsNyBAQCBzdGF0aWMg
dm9pZCB2cGljX3VwZGF0ZV9pbnRfb3V0cHV0KHN0cnVjdCBodm1faHdfdnBpYyAqdnBpYykKPiAg
ICAgICAgICBpZiAoIHZwaWMtPmlzX21hc3RlciApCj4gICAgICAgICAgewo+ICAgICAgICAgICAg
ICAvKiBNYXN0ZXIgSU5UIGxpbmUgaXMgY29ubmVjdGVkIGluIFZpcnR1YWwgV2lyZSBNb2RlLiAq
Lwo+IC0gICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdiA9IHZwaWNfZG9tYWluKHZwaWMpLT5hcmNo
Lmh2bV9kb21haW4uaTgyNTlfdGFyZ2V0Owo+ICsgICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdiA9
IHZwaWNfZG9tYWluKHZwaWMpLT5hcmNoLmh2bS5pODI1OV90YXJnZXQ7Cj4gICAgICAgICAgICAg
IGlmICggdiAhPSBOVUxMICkKCkFuZCBhZGRpbmcgYSBibGFuayBsaW5lIGhlcmU/CgoKSW4gYW55
IGV2ZW50ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
