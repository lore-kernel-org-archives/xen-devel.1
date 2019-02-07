From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] xen/arm: gic-v2: deactivate
 interrupts during initialization
Date: Thu, 7 Feb 2019 09:29:29 +0000
Message-ID: <a035d645-753d-4a92-2323-56e2bce858ca@arm.com>
References: <1549402733-20441-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z5oE=QO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1grfzy-0006gP-Qi
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 09:29:34 +0000
In-Reply-To: <1549402733-20441-1-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Stefano Stabellini <stefanos@xilinx.com>, peng.fan@nxp.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzUvMTkgOTozOCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEludGVycnVw
dHMgY291bGQgYmUgQUNUSVZFIGF0IGJvb3QuIE1ha2Ugc3VyZSB0byBkZWFjdGl2YXRlIHRoZW0g
ZHVyaW5nCj4gaW5pdGlhbGl6YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IENDOiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQo+
IENDOiBwZW5nLmZhbkBueHAuY29tCj4gQ0M6IGpncm9zc0BzdXNlLmNvbQoKUmV2aWV3ZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgo+IC0tLQo+ICAgeGVuL2FyY2gv
YXJtL2dpYy12Mi5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjIuYyBiL3hlbi9hcmNoL2FybS9n
aWMtdjIuYwo+IGluZGV4IGU5ZmI4YTAuLjI1Njk4OGMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
YXJtL2dpYy12Mi5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCj4gQEAgLTM3OSw3ICsz
NzksMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IGdpY3YyX2Rpc3RfaW5pdCh2b2lkKQo+ICAgCj4g
ICAgICAgLyogRGlzYWJsZSBhbGwgZ2xvYmFsIGludGVycnVwdHMgKi8KPiAgICAgICBmb3IgKCBp
ID0gMzI7IGkgPCBucl9saW5lczsgaSArPSAzMiApCj4gKyAgICB7Cj4gICAgICAgICAgIHdyaXRl
bF9naWNkKH4weDAsIEdJQ0RfSUNFTkFCTEVSICsgKGkgLyAzMikgKiA0KTsKPiArICAgICAgICB3
cml0ZWxfZ2ljZCh+MHgwLCBHSUNEX0lDQUNUSVZFUiArIChpIC8gMzIpICogNCk7Cj4gKyAgICB9
Cj4gICAKPiAgICAgICAvKiBUdXJuIG9uIHRoZSBkaXN0cmlidXRvciAqLwo+ICAgICAgIHdyaXRl
bF9naWNkKEdJQ0RfQ1RMX0VOQUJMRSwgR0lDRF9DVExSKTsKPiBAQCAtMzk0LDYgKzM5Nyw3IEBA
IHN0YXRpYyB2b2lkIGdpY3YyX2NwdV9pbml0KHZvaWQpCj4gICAgICAgLyogVGhlIGZpcnN0IDMy
IGludGVycnVwdHMgKFBQSSBhbmQgU0dJKSBhcmUgYmFua2VkIHBlci1jcHUsIHNvCj4gICAgICAg
ICogZXZlbiB0aG91Z2ggdGhleSBhcmUgY29udHJvbGxlZCB3aXRoIEdJQ0QgcmVnaXN0ZXJzLCB0
aGV5IG11c3QKPiAgICAgICAgKiBiZSBzZXQgdXAgaGVyZSB3aXRoIHRoZSBvdGhlciBwZXItY3B1
IHN0YXRlLiAqLwo+ICsgICAgd3JpdGVsX2dpY2QoMHhmZmZmZmZmZiwgR0lDRF9JQ0FDVElWRVIp
OyAvKiBEaWFjdGl2YXRlIFBQSXMgYW5kIFNHSXMgKi8KPiAgICAgICB3cml0ZWxfZ2ljZCgweGZm
ZmYwMDAwLCBHSUNEX0lDRU5BQkxFUik7IC8qIERpc2FibGUgYWxsIFBQSSAqLwo+ICAgICAgIHdy
aXRlbF9naWNkKDB4MDAwMGZmZmYsIEdJQ0RfSVNFTkFCTEVSKTsgLyogRW5hYmxlIGFsbCBTR0kg
Ki8KPiAgIAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
