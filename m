From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2 2/2] x86/altp2m: Fixed domain crash with
 INVALID_ALTP2M EPTP index
Date: Mon, 25 Jun 2018 06:54:02 -0600
Message-ID: <5B30E5EA02000078001CD86D@prv1-mh.provo.novell.com>
References: <1528879939-11570-1-git-send-email-rcojocaru@bitdefender.com>
 <1528879939-11570-2-git-send-email-rcojocaru@bitdefender.com>
 <5B2D159E02000078001CD06C@prv1-mh.provo.novell.com>
 <d129249b-247d-d450-3af1-33c824daae8d@bitdefender.com>
 <8da03feb-53f0-e566-09cc-b311575ac019@bitdefender.com>
 <5B30DFFE02000078001CD81E@prv1-mh.provo.novell.com>
 <c3101989-4c4e-036d-9169-29e28045b7a3@bitdefender.com>
 <105579cf-9018-f211-c869-ca98e0c84c32@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <105579cf-9018-f211-c869-ca98e0c84c32@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA2LjE4IGF0IDE0OjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4+IENyYXNoOgo+PiAKPj4gKFhFTikgWyAxOTI0LjM2NzI3M10gYWx0cDJtX3ZjcHVfaW5p
dGlhbGlzZSgpCj4+IChYRU4pIFsgMTkyNC4zNjcyNzddIGFsdHAybV92Y3B1X3Jlc2V0KCkKPj4g
KFhFTikgWyAxOTI0LjM2NzI3OF0gMSBhbHRwMm1fdmNwdV91cGRhdGVfcDJtKCkKPj4gKFhFTikg
WyAxOTI0LjM2NzI3OV0gdm14X3ZjcHVfdXBkYXRlX2VwdHAoKQo+PiAoWEVOKSBbIDE5MjQuMzY3
MzE4XSBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5Cj4+IChYRU4pIFsgMTkyNC4zNjcz
MjFdIHZteF92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUoMCksCj4+IHYtPmFyY2guaHZtX3ZteC5zZWNv
bmRhcnlfZXhlY19jb250cm9sOiAweDEwNTRlYgo+PiAoWEVOKSBbIDE5MjQuMzY3MzI2XSBleGl0
IHZteF92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUoMCksCj4+IHYtPmFyY2guaHZtX3ZteC5zZWNvbmRh
cnlfZXhlY19jb250cm9sOiAweDE0NzRlYgo+PiAoWEVOKSBbIDE5MjQuMzY3MzQ0XSBYZW4gQlVH
IGF0IHZteC5jOjM0MDcKPiAKPiBBY3R1YWxseSBJIHRoaW5rIHRoaXMgc2hvd3MgdXMgdGhlIHBy
b2JsZW06IDY1NTM1IChJTlZBTElEX0FMVFAyTSkgaXMgYQo+IHN0YWxlIHZhbHVlIGZyb20gYSBw
cmV2aW91cyBnb29kIHJ1bi4gQnV0IHRoZSBFUFRQX0lOREVYIHZhbHVlIGlzCj4gaWdub3JlZCB1
bmxlc3MgU0VDT05EQVJZX0VYRUNfRU5BQkxFX1ZJUlRfRVhDRVBUSU9OUyBpcyBzZXQuIFNvIGF0
IHRoZQo+IGNyYXNoIHBvaW50LCBTRUNPTkRBUllfRVhFQ19FTkFCTEVfVklSVF9FWENFUFRJT05T
IGp1c3QgZ290IHNldCwgdGhlCj4gImxpdmUiIGluZGV4IGlzIDAsIGFuZCB0aGUgc3RhbGUgSU5W
QUxJRF9BTFRQMk0gdmFsdWUgaXMgYmVpbmcgcmVhZCBmcm9tCj4gdGhlIHByZXZpb3VzIHJ1biAo
YW5kIGNvbXBhcmVkIHRvIDAgYW5kIE1BWF9BTFRQMk0pLgoKU28gcGVyaGFwcyB0aGUgd3JpdGlu
ZyBvZiBFUFRQX0lOREVYIHNob3VsZCBiZSBkb25lIGVhcmxpZXI/CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
