From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V3] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Thu, 8 Feb 2018 10:51:36 +0200
Message-ID: <b5d0962a-e9fa-65d8-b90e-fa62058ab37a@bitdefender.com>
References: <1517559257-2846-1-git-send-email-rcojocaru@bitdefender.com>
 <5A7B3EFF02000078001A62B5@prv-mh.provo.novell.com>
 <8d940984-173d-6be8-6e0c-503dbc2c133b@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8d940984-173d-6be8-6e0c-503dbc2c133b@bitdefender.com>
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
Cc: andrew.cooper3@citrix.com, bitweasil@cryptohaze.com, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDcvMjAxOCAwNzo0MiBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDAyLzA3
LzIwMTggMDc6MDEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vaHZtLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5o
Cj4+PiBAQCAtMzQsNiArMzQsOSBAQCBleHRlcm4gYm9vbF90IG9wdF9odm1fZmVwOwo+Pj4gICNk
ZWZpbmUgb3B0X2h2bV9mZXAgMAo+Pj4gICNlbmRpZgo+Pj4gIAo+Pj4gKyNkZWZpbmUgWDg2X0NS
M19OT0ZMVVNIICgxdWxsIDw8IDYzKQo+Pgo+PiBUaGlzIGJlbG9uZ3MgaW4geDg2LWRlZnMuaAoK
U29ycnksIGRvIHlvdSBtZWFuIHhlbi9hcmNoL3g4Ni9ib290L2RlZnMuaD8gT3IgdGhhdCBJIHNo
b3VsZCBhZGQgYSBuZXcKaGVhZGVyIGZvciB0aGlzPwoKJ2ZpbmQgLiAtbmFtZSB4ODYtZGVmcy5o
JyBjb21lcyB1cCBlbXB0eS1oYW5kZWQuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
