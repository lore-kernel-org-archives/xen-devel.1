From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [OSSTEST PATCH 3/3] ts-livepatch-run: Fix erroneous
 $$ in double-check
Date: Wed, 16 Jan 2019 11:37:11 -0500
Message-ID: <20190116163711.GF7892@char.us.oracle.com>
References: <20190116113637.10819-1-ian.jackson@eu.citrix.com>
 <20190116113637.10819-3-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5X0w=PY=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1gjoBv-0000cQ-Dj
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 16:37:23 +0000
Content-Disposition: inline
In-Reply-To: <20190116113637.10819-3-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMTE6MzY6MzdBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhlIGRvdWJsZWQgJHMgaGVyZSBhcmUgc2ltcGx5IGEgbWlzdGFrZS4gIFRoZSByZXN1
bHQgaXMgdG8gbWFrZSB0aGlzCj4gdGVzdCBpbmVmZmVjdGl2ZSwgc2luY2UgYCQkZmlsZScgbWVh
bnMgYHRoZSB2YWx1ZSBvZiB0aGUgdmFyaWFibGUKPiB3aG9zZSBuYW1lIGlzIGluIHRoZSB2YXJp
YWJsZSAkZmlsZScsIHdoaWNoIGhlcmUgd2lsbCBuZXZlciBleGlzdC4KPiBUaGlzIHByb2R1Y2Vz
IGEgYFVzZSBvZiB1bmluaXRpYWxpemVkIHZhbHVlJyB3YXJuaW5nIGFuZCBzdWJzdGl0dXRlcwo+
IHRoZSBlbXB0eSBzdHJpbmcsIHNvIG92ZXJhbGwgd2UgdGVzdCB0aGUgZXhpc3RlbmNlIG9mIHRo
ZSBkaXJlY3RvcnkuCj4gCj4gVGhlIG1pc3NpbmcgY2hlY2sgaXMgbm90IG9mIG11Y2ggY29uc2Vx
dWVuY2Ugc2luY2UgdGhpcyBjaGVjayBpcyBub3QKPiByZWFsbHkgZXhwZWN0ZWQgZXZlciB0byBm
YWlsLCBhbmQgaWYgaXQgZG9lcywgc29tZSBhY3R1YWwgdGVzdAo+IGV4ZWN1dGlvbiB3b3VsZCBm
YWlsIGR1ZSB0byB0aGUgbWlzc2luZyBmaWxlLgo+IAo+IFNvIG92ZXJhbGwgSSB0aGluayB0aGUg
b25seSBjaGFuZ2UgaXMgdG8gbG9nIG91dHB1dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpSZXZpZXdlZC1ieTogS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgoKVGhhbmsgeW91IQo+IC0tLQo+ICB0cy1s
aXZlcGF0Y2gtcnVuIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdHMtbGl2ZXBhdGNoLXJ1biBiL3RzLWxpdmVw
YXRjaC1ydW4KPiBpbmRleCBmMDExZTY0ZS4uODZhNzk3OTEgMTAwNzU1Cj4gLS0tIGEvdHMtbGl2
ZXBhdGNoLXJ1bgo+ICsrKyBiL3RzLWxpdmVwYXRjaC1ydW4KPiBAQCAtMTYxLDcgKzE2MSw3IEBA
IHN1YiBsaXZlcGF0Y2hfdGVzdCAoKSB7Cj4gIAo+ICBzdWIgbGl2ZXBhdGNoX2NoZWNrICgpIHsK
PiAgICAgIGZvcmVhY2ggbXkgJGZpbGUgKEBsaXZlcGF0Y2hfZmlsZXMpIHsKPiAtICAgICAgICBp
ZiAoIXRhcmdldF9maWxlX2V4aXN0cygkaG8sICIvdXNyL2xpYi9kZWJ1Zy94ZW4tbGl2ZXBhdGNo
LyQkZmlsZSIpKSB7Cj4gKyAgICAgICAgaWYgKCF0YXJnZXRfZmlsZV9leGlzdHMoJGhvLCAiL3Vz
ci9saWIvZGVidWcveGVuLWxpdmVwYXRjaC8kZmlsZSIpKSB7Cj4gICAgICAgICAgICAgIGRpZSAi
JGZpbGUgaXMgbWlzc2luZyFcbiI7Cj4gICAgICAgICAgfQo+ICAgICAgfQo+IC0tIAo+IDIuMTEu
MAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
