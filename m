From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/7] xen/hvm: Rename d->arch.hvm_domain to
 d->arch.hvm
Date: Wed, 29 Aug 2018 08:56:03 +0100
Message-ID: <20180829075603.4cqkjlklo5v67mtr@citrix.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1535477946-17892-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDY6Mzk6MDJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgdHJhaWxpbmcgX2RvbWFpbiBzdWZmaXggaXMgcmVkdW5kYW50LCBidXQgYWRk
cyB0byBjb2RlIHZvbHVtZS4gIERyb3AgaXQuCj4gCj4gUmVmbG93IGxpbmVzIGFzIGFwcHJvcHJp
YXRlLCBhbmQgc3dpdGNoIHRvIHVzaW5nIHRoZSBuZXcgWEZSRUUvZXRjIHdyYXBwZXJzCj4gd2hl
cmUgYXBwbGljYWJsZS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBpbmRleCA0Y2RjZDVkLi4z
ZGNkN2Y5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9kb21haW4uYwo+IEBAIC01MDUsNyArNTA1LDcgQEAgaW50IGFyY2hfZG9tYWluX2Ny
ZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAKPiAgICAgIC8qIE5lZWQgdG8gZGV0ZXJtaW5lIGlm
IEhBUCBpcyBlbmFibGVkIGJlZm9yZSBpbml0aWFsaXNpbmcgcGFnaW5nICovCj4gICAgICBpZiAo
IGlzX2h2bV9kb21haW4oZCkgKQo+IC0gICAgICAgIGQtPmFyY2guaHZtX2RvbWFpbi5oYXBfZW5h
YmxlZCA9Cj4gKyAgICAgICAgZC0+YXJjaC5odm0uaGFwX2VuYWJsZWQgPQo+ICAgICAgICAgICAg
ICBodm1faGFwX3N1cHBvcnRlZCgpICYmIChjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZf
aGFwKTsKPiAgCj4gICAgICBpZiAoIChyYyA9IHBhZ2luZ19kb21haW5faW5pdChkLCBjb25maWct
PmZsYWdzKSkgIT0gMCApCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hl
bi9hcmNoL3g4Ni9kb21jdGwuYwo+IGluZGV4IGZkYmNjZTAuLmYzMDY2MTQgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4g
QEAgLTc0NSw3ICs3NDUsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAgICAgICAgIHVuc2ln
bmVkIGludCBmbXAgPSBkb21jdGwtPnUuaW9wb3J0X21hcHBpbmcuZmlyc3RfbXBvcnQ7Cj4gICAg
ICAgICAgdW5zaWduZWQgaW50IG5wID0gZG9tY3RsLT51LmlvcG9ydF9tYXBwaW5nLm5yX3BvcnRz
Owo+ICAgICAgICAgIHVuc2lnbmVkIGludCBhZGQgPSBkb21jdGwtPnUuaW9wb3J0X21hcHBpbmcu
YWRkX21hcHBpbmc7Cj4gLSAgICAgICAgc3RydWN0IGh2bV9kb21haW4gKmh2bV9kb21haW47Cj4g
KyAgICAgICAgc3RydWN0IGh2bV9kb21haW4gKmh2bTsKCllldCBJIHRoaW5rIHRoaXMgaHZtIGlz
IGNsZWFyZXIgaWYgaXQgc3RheXMgaHZtX2RvbWFpbi4gSSBkb24ndCBmZWVsIHRvbwpzdHJvbmcg
Zm9yIHRoaXMgdGhvdWdoLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
