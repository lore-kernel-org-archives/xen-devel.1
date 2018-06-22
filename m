From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2 2/2] x86/altp2m: Fixed domain crash with
 INVALID_ALTP2M EPTP index
Date: Fri, 22 Jun 2018 19:55:42 +0300
Message-ID: <d129249b-247d-d450-3af1-33c824daae8d@bitdefender.com>
References: <1528879939-11570-1-git-send-email-rcojocaru@bitdefender.com>
 <1528879939-11570-2-git-send-email-rcojocaru@bitdefender.com>
 <5B2D159E02000078001CD06C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B2D159E02000078001CD06C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMjIvMjAxOCAwNjoyOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTMuMDYu
MTggYXQgMTA6NTIsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMKPj4gQEAgLTM1OTIsNyArMzU5Miw3IEBAIHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiAgICAgICAgICAgICAgfQo+PiAgICAgICAgICB9
Cj4+ICAKPj4gLSAgICAgICAgaWYgKCBpZHggIT0gdmNwdV9hbHRwMm0odikucDJtaWR4ICkKPj4g
KyAgICAgICAgaWYgKCBpZHggIT0gSU5WQUxJRF9BTFRQMk0gJiYgaWR4ICE9IHZjcHVfYWx0cDJt
KHYpLnAybWlkeCApCj4+ICAgICAgICAgIHsKPj4gICAgICAgICAgICAgIEJVR19PTihpZHggPj0g
TUFYX0FMVFAyTSk7Cj4gCj4gSW4gdGhlIGNvZGUgaW1tZWRpYXRlbHkgYWhlYWQgb2YgdGhpcyB0
aGVyZSBpcyBhbiBJTlZBTElEX0FMVFAyTSBjaGVjawo+IGFscmVhZHkgKGluIHRoZSBlbHNlIGJy
YW5jaCkuIElmIHRoZSBfX3ZtcmVhZCgpIGNhbiBsZWdpdGltYXRlbHkgcHJvZHVjZQo+IHRoaXMg
dmFsdWUsIHdoeSB3b3VsZCB0aGUgZG9tYWluIGJlIGNyYXNoZWQgd2hlbiBnZXR0aW5nIGJhY2sK
PiBJTlZBTElEX0FMVFAyTSBpbiB0aGUgb3RoZXIgY2FzZT8gSSB0aGluayB0aGUgY29ycmVjdG5l
c3Mgb2YgeW91ciBjaGFuZ2UKPiBjYW4gb25seSBiZSBqdWRnZWQgb25jZSBib3RoIGNvZGUgcGF0
aHMgYmVoYXZlIGNvbnNpc3RlbnRseS4KCllvdSdyZSByaWdodCwgSSBoYWQgc29tZWhvdyBjb252
aW5jZWQgbXlzZWxmIHRoYXQgdGhpcyBpcyBhICNWRS1zcGVjaWZpYwpwcm9ibGVtLCBidXQgaXQg
bG9va3MgbGlrZSBhIGdlbmVyaWMgYWx0cDJtIHByb2JsZW0uIEknbGwgc2ltdWxhdGUgdGhlCm90
aGVyIGJyYW5jaCBpbiB0aGUgY29kZSBhbmQgc2VlIHdoYXQgaXQgZG9lcyB3aXRoIG15IHNtYWxs
IHRlc3QKYXBwbGljYXRpb24uCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
