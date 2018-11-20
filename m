From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] x86/msr: Handle MSR_TSC_AUX
 consistently for PV and HVM guests
Date: Tue, 20 Nov 2018 03:58:10 -0700
Message-ID: <5BF3E8C202000078001FDEA2@prv1-mh.provo.novell.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
 <1542318438-20319-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542318438-20319-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjExLjE4IGF0IDIyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTEwNDAsNyArMTA0MCwxMCBAQCBzdGF0aWMgaW50IGh2bV9sb2FkX2NwdV9jdHh0
KHN0cnVjdCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+ICAgICAgaWYgKCBo
dm1fZnVuY3MudHNjX3NjYWxpbmcuc2V0dXAgKQo+ICAgICAgICAgIGh2bV9mdW5jcy50c2Nfc2Nh
bGluZy5zZXR1cCh2KTsKPiAgCj4gLSAgICB2LT5hcmNoLmh2bS5tc3JfdHNjX2F1eCA9IGN0eHQu
bXNyX3RzY19hdXg7Cj4gKyAgICBpZiAoIGN0eHQubXNyX3RzY19hdXggIT0gKHVpbnQzMl90KWN0
eHQubXNyX3RzY19hdXggKQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgIHYt
PmFyY2gubXNycy0+dHNjX2F1eCA9IGN0eHQubXNyX3RzY19hdXg7CgpUaGUgY2hlY2sgKGJ1dCBu
b3QgdGhlIHNldHRpbmcgb2YgdGhlIHZhbHVlKSB3YW50cyB0byBtb3ZlIHVwLApuZXh0IHRvIHRo
ZSBvdGhlciBlcnJvciByZXR1cm5zLiBXZSBzaG91bGQgYXQgbGVhc3QgdHJ5IHRvIGF2b2lkCih3
aGVyZSBwb3NzaWJsZSkgZmFpbHVyZXMgZ2V0dGluZyByZXBvcnRlZCBhZnRlciBwYXJ0IG9mIHRo
ZSBzdGF0ZQp3YXMgYWxyZWFkeSBtb2RpZmllZC4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+IEBAIC01MTIsNyAr
NTEyLDcgQEAgc3RhdGljIHZvaWQgdm14X3Jlc3RvcmVfZ3Vlc3RfbXNycyhzdHJ1Y3QgdmNwdSAq
dikKPiAgICAgIHdybXNybChNU1JfU1lTQ0FMTF9NQVNLLCAgIHYtPmFyY2guaHZtLnZteC5zZm1h
c2spOwo+ICAKPiAgICAgIGlmICggY3B1X2hhc19yZHRzY3AgKQo+IC0gICAgICAgIHdybXNyX3Rz
Y19hdXgoaHZtX21zcl90c2NfYXV4KHYpKTsKPiArICAgICAgICB3cm1zcl90c2NfYXV4KHYtPmFy
Y2gubXNycy0+dHNjX2F1eCk7CgpBbnkgcmVhc29uIHlvdSBkb24ndCBhbHNvIGFkZCBhbiBSRFBJ
RCBmZWF0dXJlIGNoZWNrIGhlcmU/CgpXaXRoIHRoZSBmaXJzdCBpc3N1ZSB0YWtlbiBjYXJlIG9m
IGFuZCB0aGUgc2Vjb25kIGF0IGxlYXN0CmV4cGxhaW5lZCwKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
