From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 01/22] xen/arm: traps: Constify
 show_registers parameters
Date: Wed, 24 Oct 2018 15:12:07 +0100
Message-ID: <911af77d-ef68-e480-7d42-7618236eb519@arm.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
 <20181018132109.31192-2-julien.grall@arm.com>
 <d94b4ecf-4894-b7d6-10de-200fbc04f22e@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d94b4ecf-4894-b7d6-10de-200fbc04f22e@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8yNC8xOCAzOjAzIFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiAKPiAKPiBPbiAxOC4xMC4xOCAxNjoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
PiBzaG93X3JlZ2lzdGVycyBoZWxwZXJzIGFyZSBub3QgbWVhbnQgdG8gbW9kaWZ5IGFueSBwYXJh
bWV0ZXJzLgo+PiBTbyBjb25zdGlmeSB0aGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiAtLS0KPj4gICAgeGVuL2FyY2gvYXJtL3Ry
YXBzLmMgICAgICAgICAgICB8IDE0ICsrKysrKystLS0tLS0tCj4+ICAgIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vcHJvY2Vzc29yLmggfCAgMiArLQo+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiBUaGUgZmlsZSB4ZW4vYXJjaC9hcm0vdHJhcHMuYyBo
YXMgYSBidW5jaCBvZiBzaG93IGZ1bmN0aW9ucyBleGNlcHQgZm9yCj4gcmVnaXN0ZXJzLiBGb3Ig
c3RhY2ssIHRyYWNlLCBldGMuIFNvIG1heWJlIGNvbnN0aWZ5IHRoZWlyIHBhcmFtZXRlcnMKPiBy
aWdodCBhd2F5PwoKR29vZCBpZGVhLiBJIHdpbGwgdXBkYXRlIHRoZSBzZXJpZXMuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
