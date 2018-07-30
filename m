From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v2 13/13] x86/domctl: Implement
 XEN_DOMCTL_get_cpu_policy
Date: Mon, 30 Jul 2018 10:14:54 +0800
Message-ID: <20180730021333.GA14133@skl-4s-chao.sh.intel.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-14-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1531512194-6865-14-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMTMsIDIwMTggYXQgMDk6MDM6MTRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPkZyb206IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPgo+
VGhpcyBmaW5hbGx5IChhZnRlciBsaXRlcmFsbHkgeWVhcnMgb2Ygd29yayEpIG1hcmtzIHRoZSBw
b2ludCB3aGVyZSB0aGUKPnRvb2xzdGFjayBjYW4gYXNrIHRoZSBoeXBlcnZpc29yIGZvciB0aGUg
Y3VycmVudCBDUFVJRCBjb25maWd1cmF0aW9uIG9mIGEKPnNwZWNpZmljIGRvbWFpbi4KPgo+QWxz
byBleHRlbmQgeGVuLWNwdWlkJ3MgLS1wb2xpY3kgbW9kZSB0byBiZSBhYmxlIHRvIHRha2UgYSBk
b21pZCBhbmQgZHVtcCBhCj5zcGVjaWZpYyBkb21haW5zIENQVUlEIGFuZCBNU1IgcG9saWN5Lgo+
Cj5TaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+U2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29t
Pgo+LS0tCj4rCj4rLyoKPisgKiBYRU5fU1lTQ1RMX3tnZXQsc2V0fV9jcHVfcG9saWN5ICh4ODYg
c3BlY2lmaWMpCj4rICoKPisgKiBRdWVyeSBvciBzZXQgdGhlIENQVUlEIGFuZCBNU1IgcG9saWNp
ZXMgZm9yIGEgc3BlY2lmaWMgZG9tYWluLgoKU2V0dGluZyBwb2xpY2llcyBpc24ndCBpbnRyb2R1
Y2VkIGluIHRoaXMgc2VyaWVzLiBUaGUgY29tbWVudHMgaGVyZQpzaG91bGQgYmUgYWxpZ25lZCB3
aXRoIHdoYXQgaGF2ZSBiZWVuIGltcGxlbWVudGVkLgoKVGhhbmtzCkNoYW8KCj4rICovCj4rc3Ry
dWN0IHhlbl9kb21jdGxfY3B1X3BvbGljeSB7Cj4rICAgIHVpbnQzMl90IG5yX2xlYXZlczsgLyog
SU4vT1VUOiBOdW1iZXIgb2YgbGVhdmVzIGluL3dyaXR0ZW4gdG8KPisgICAgICAgICAgICAgICAg
ICAgICAgICAgKiAnY3B1aWRfcG9saWN5Jy4gKi8KPisgICAgdWludDMyX3QgbnJfbXNyczsgICAv
KiBJTi9PVVQ6IE51bWJlciBvZiBNU1JzIGluL3dyaXR0ZW4gdG8KPisgICAgICAgICAgICAgICAg
ICAgICAgICAgKiAnbXNyX2RvbWFpbl9wb2xpY3knICovCj4rICAgIFhFTl9HVUVTVF9IQU5ETEVf
NjQoeGVuX2NwdWlkX2xlYWZfdCkgY3B1aWRfcG9saWN5OyAvKiBJTi9PVVQ6ICovCj4rICAgIFhF
Tl9HVUVTVF9IQU5ETEVfNjQoeGVuX21zcl9lbnRyeV90KSBtc3JfcG9saWN5OyAgICAvKiBJTi9P
VVQ6ICovCj4rfTsKPit0eXBlZGVmIHN0cnVjdCB4ZW5fZG9tY3RsX2NwdV9wb2xpY3kgeGVuX2Rv
bWN0bF9jcHVfcG9saWN5X3Q7Cj4rREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2RvbWN0bF9j
cHVfcG9saWN5X3QpOwo+ICNlbmRpZgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
