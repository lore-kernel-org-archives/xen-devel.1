From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 02/10] x86/HVM: Rename
 vlapic_read_aligned() to vlapic_reg_read()
Date: Tue, 8 May 2018 11:12:41 +0100
Message-ID: <20180508101241.6sfxeblr364o2y2e@citrix.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-3-Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180507210753.2280-3-Janakarajan.Natarajan@amd.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMDcsIDIwMTggYXQgMDQ6MDc6NDVQTSAtMDUwMCwgSmFuYWthcmFqYW4gTmF0
YXJhamFuIHdyb3RlOgo+IFJlbmFtZSB2bGFwaWNfcmVhZF9hbGlnbmVkKCkgdG8gdmxhcGljX3Jl
Z19yZWFkKCkgdG8gbWFrZSBpdCBhIHBhaXIgb2YKPiB2bGFwaWNfcmVnX3dyaXRlKCkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuYWthcmFqYW4gTmF0YXJhamFuIDxKYW5ha2FyYWphbi5OYXRhcmFq
YW5AYW1kLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYyB8IDEwICsrKysr
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYyBiL3hlbi9hcmNoL3g4
Ni9odm0vdmxhcGljLmMKPiBpbmRleCAxYjlmMDBhMGU0Li5jOWI2NDYxY2JmIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Zs
YXBpYy5jCj4gQEAgLTU5Miw3ICs1OTIsNyBAQCBzdGF0aWMgdm9pZCB2bGFwaWNfc2V0X3RkY3Io
c3RydWN0IHZsYXBpYyAqdmxhcGljLCB1bnNpZ25lZCBpbnQgdmFsKQo+ICAgICAgICAgICAgICAg
ICAgInRpbWVyX2Rpdmlzb3I6ICVkIiwgdmxhcGljLT5ody50aW1lcl9kaXZpc29yKTsKPiAgfQo+
ICAKPiAtc3RhdGljIHVpbnQzMl90IHZsYXBpY19yZWFkX2FsaWduZWQoY29uc3Qgc3RydWN0IHZs
YXBpYyAqdmxhcGljLAo+ICtzdGF0aWMgdWludDMyX3QgdmxhcGljX3JlZ19yZWFkKGNvbnN0IHN0
cnVjdCB2bGFwaWMgKnZsYXBpYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IG9mZnNldCkKCk1pbm9yIGlzc3VlOiBpbmRlbnRhdGlvbiBuZWVkcyB0
byBiZSBhZGp1c3RlZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
