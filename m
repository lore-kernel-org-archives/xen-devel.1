From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 09/18] xen/arm: Add rcu_barrier() before
 enabling non-boot CPUs on resume
Date: Wed, 14 Nov 2018 12:11:48 +0000
Message-ID: <01d74200-63a3-e529-dabf-d393261e7e0c@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-10-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542022244-22977-10-git-send-email-mirela.simonovic@aggios.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: stefano.stabellini@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMi8xMS8yMDE4IDExOjMwLCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+IFRoZSBy
Y3VfYmFycmllcigpIGhhcyB0byBiZSBhZGRlZCB0byBlbnN1cmUgdGhhdCB0aGUgcGVyIGNwdSBh
cmVhIGlzCj4gZnJlZWQgYmVmb3JlIGEgbm9uLWJvb3QgQ1BVIHRyaWVzIHRvIGluaXRpYWxpemUg
aXQgKF9mcmVlX3BlcmNwdV9hcmVhKCkKPiBoYXMgdG8gYmUgY2FsbGVkIGJlZm9yZSB0aGUgaW5p
dF9wZXJjcHVfYXJlYSgpKS4gVGhpcyBzY2VuYXJpbyBvY2N1cnMKPiB3aGVuIG5vbi1ib290IENQ
VXMgYXJlIGhvdC11bnBsdWdnZWQgb24gc3VzcGVuZCBhbmQgaG90cGx1Z2dlZCBvbiByZXN1bWUu
CgogRnJvbSB0aGUgZGVzY3JpcHRpb24sIHRoaXMgaXMgYSBidWcgaW50cm9kdWNlZCBieSB0aGUg
cHJldmlvdXMgcGF0Y2guIFNvIHNob3VsZCAKbWVyZ2VkIGluIGl0LgoKVGhlIGNvbW1pdCBtZXNz
YWdlIHdpbGwgYWxzbyBuZWVkIHRvIGV4cGxhaW4gd2h5IHRoZSByY3VfYmFycmllcigpIGlzIHJl
cXVpcmVkLgoKQ2hlZXJzLAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgU2ltb25vdmljIDxt
aXJlbGEuc2ltb25vdmljQGFnZ2lvcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2FlZWQgTm93c2hh
ZGkgPHNhZWVkLm5vd3NoYWRpQHhpbGlueC5jb20+Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vc3Vz
cGVuZC5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N1c3BlbmQuYyBiL3hlbi9hcmNoL2FybS9zdXNwZW5kLmMK
PiBpbmRleCBkYWUxYjFmN2Q2Li44ZThlNTMxZDYxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9zdXNwZW5kLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc3VzcGVuZC5jCj4gQEAgLTEzMyw2ICsx
MzMsNyBAQCBzdGF0aWMgbG9uZyBzeXN0ZW1fc3VzcGVuZCh2b2lkICpkYXRhKQo+ICAgICAgIHN5
c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9yZXN1bWU7Cj4gICAKPiAgIHJlc3VtZV9ub25ib290X2Nw
dXM6Cj4gKyAgICByY3VfYmFycmllcigpOwo+ICAgICAgIGVuYWJsZV9ub25ib290X2NwdXMoKTsK
PiAgICAgICB0aGF3X2RvbWFpbnMoKTsKPiAgICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVf
YWN0aXZlOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
