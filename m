From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/8] x86/SVM: Add vcpu scheduling support
 for AVIC
Date: Fri, 13 Apr 2018 18:57:49 +0100
Message-ID: <47fc298a-02f5-0f30-61e3-c7fdf038337d@citrix.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <5d6f4ad92f0ef62afedbc0a111ec2d4fe8286c43.1522794651.git.Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5d6f4ad92f0ef62afedbc0a111ec2d4fe8286c43.1522794651.git.Janakarajan.Natarajan@amd.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMTggMDA6MDEsIEphbmFrYXJhamFuIE5hdGFyYWphbiB3cm90ZToKPiBAQCAtNjMs
NiArNjQsNTQgQEAgYXZpY19nZXRfcGh5c2ljYWxfaWRfZW50cnkoc3RydWN0IHN2bV9kb21haW4g
KmQsIHVuc2lnbmVkIGludCBpbmRleCkKPiAgICAgIHJldHVybiAmZC0+YXZpY19waHlzaWNhbF9p
ZF90YWJsZVtpbmRleF07Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIGF2aWNfdmNwdV9sb2FkKHN0
cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBsb25nIHRtcDsKPiArICAgIHN0cnVj
dCBhcmNoX3N2bV9zdHJ1Y3QgKnMgPSAmdi0+YXJjaC5odm1fc3ZtOwo+ICsgICAgaW50IGhfcGh5
X2FwaWNfaWQ7Cj4gKyAgICBzdHJ1Y3QgYXZpY19waHlzaWNhbF9pZF9lbnRyeSAqZW50cnkgPSAo
c3RydWN0IGF2aWNfcGh5c2ljYWxfaWRfZW50cnkgKikmdG1wOwo+ICsKPiArICAgIEFTU0VSVCgh
dGVzdF9iaXQoX1ZQRl9ibG9ja2VkLCAmdi0+cGF1c2VfZmxhZ3MpKTsKPiArCj4gKyAgICAvKgo+
ICsgICAgICogTm90ZTogQVBJQyBJRCA9IDB4ZmYgaXMgdXNlZCBmb3IgYnJvYWRjYXN0Lgo+ICsg
ICAgICogICAgICAgQVBJQyBJRCA+IDB4ZmYgaXMgcmVzZXJ2ZWQuCj4gKyAgICAgKi8KPiArICAg
IGhfcGh5X2FwaWNfaWQgPSBjcHVfZGF0YVt2LT5wcm9jZXNzb3JdLmFwaWNpZDsKPiArICAgIEFT
U0VSVChoX3BoeV9hcGljX2lkIDwgQVZJQ19QSFlfQVBJQ19JRF9NQVgpOwo+ICsKPiArICAgIHRt
cCA9IHJlYWRfYXRvbWljKCh1NjQqKShzLT5hdmljX2xhc3RfcGh5X2lkKSk7Cj4gKyAgICBlbnRy
eS0+aG9zdF9waHlfYXBpY19pZCA9IGhfcGh5X2FwaWNfaWQ7Cj4gKyAgICBlbnRyeS0+aXNfcnVu
bmluZyA9IDE7Cj4gKyAgICB3cml0ZV9hdG9taWMoKHU2NCopKHMtPmF2aWNfbGFzdF9waHlfaWQp
LCB0bXApOwoKV2hhdCBpcyB0aGUgcHVycG9zZSBvZiBzLT5hdmljX2xhc3RfcGh5X2lkID8KCkFz
IGZhciBhcyBJIGNhbiB0ZWxsLCBpdCBpcyBhbHdheXMgYW4gdW5jaGFuZ2luZyBwb2ludGVyIGlu
dG8gdGhlCnBoeXNpY2FsIElEIHRhYmxlLCB3aGljaCBpcyBvbmx5IGV2ZXIgdXBkYXRlZCBzeW5j
aHJvbm91c2x5IGluIGN1cnJlbnQKY29udGV4dC4KCklmIHNvLCBJIGRvbid0IHNlZSB3aHkgaXQg
bmVlZHMgYW55IG9mIHRoZXNlIGhvb3BzIHRvIGJlIGp1bXBlZCB0aG91Z2guCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
