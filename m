From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xl/libxl: add pvcalls support
Date: Tue, 13 Mar 2018 10:29:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803131028050.13098@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1802271323350.4239@sstabellini-ThinkPad-X260>
 <20180313141326.vfzb6z44xln5ccdj@citrix.com>
 <CAFLBxZYZHm1KBRCyusU-pPE7DPA6hTt_SvmhaQnQs-wDWU5e-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i99s=gd=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1evnkH-0005gq-Su
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 17:29:53 +0000
In-Reply-To: <CAFLBxZYZHm1KBRCyusU-pPE7DPA6hTt_SvmhaQnQs-wDWU5e-A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxMyBNYXIgMjAxOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiBUdWUsIE1hciAx
MywgMjAxOCBhdCAyOjEzIFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToK
PiA+IE9uIFR1ZSwgRmViIDI3LCAyMDE4IGF0IDAxOjI4OjA4UE0gLTA4MDAsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToKPiA+PiBBZGQgcHZjYWxscyBzdXBwb3J0IHRvIGxpYnhsIGFuZCB4bC4g
Q3JlYXRlIHRoZSBhcHByb3ByaWF0ZSBwdmNhbGxzCj4gPj4gZW50cmllcyBpbiB4ZW5zdG9yZS4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub0BhcG9y
ZXRvLmNvbT4KPiA+Cj4gPiBUaGUgY29kZSBsb29rcyBmaW5lLgo+ID4KPiA+IEkgb25seSB3YW50
IHRvIGhhdmUgYSBzZWNvbmQgb3BpbmlvbiBvbgo+ID4KPiA+PiBAQCAtODI5LDYgKzgzNSw3IEBA
IGxpYnhsX2RvbWFpbl9jb25maWcgPSBTdHJ1Y3QoImRvbWFpbl9jb25maWciLCBbCj4gPj4gICAg
ICAoInZrYnMiLCBBcnJheShsaWJ4bF9kZXZpY2VfdmtiLCAibnVtX3ZrYnMiKSksCj4gPj4gICAg
ICAoInZ0cG1zIiwgQXJyYXkobGlieGxfZGV2aWNlX3Z0cG0sICJudW1fdnRwbXMiKSksCj4gPj4g
ICAgICAoInA5cyIsIEFycmF5KGxpYnhsX2RldmljZV9wOSwgIm51bV9wOXMiKSksCj4gPj4gKyAg
ICAoInB2Y2FsbHNzIiwgQXJyYXkobGlieGxfZGV2aWNlX3B2Y2FsbHMsICJudW1fcHZjYWxsc3Mi
KSksCj4gPgo+ID4gdGhpcy4uLgo+ID4KPiA+IEkgdGhpbmsgdGhlIHR3byBzJ2VzIGxvb2sgYSBi
aXQgc3RyYW5nZS4gQnV0IEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBpZGVhLgo+IAo+IFRoYXQgZG9l
cyBsb29rIGEgYml0IEdvbGx1bS1saWtlLCBteSBwcmVjaW91c3Nzcy4gIENhbGwgaW5kaXZpZHVh
bAo+IGNvbm5lY3Rpb25zIGEgInB2Y2FsbGRldiIsIGFuZCB0aGVuIGhhdmUgaXQgInB2Y2FsbGRl
dnMiIGFuZAo+ICJudW1fcHZjYWxsZGV2cyI/Cj4gCj4gQWx0ZXJuYXRlbHksIG9ubHkgYWxsb3cg
YSBzaW5nbGUgcHZjYWxsIGNvbm5lY3Rpb24/CgpVbmZvcnR1bmF0ZWx5IG5laXRoZXIgY2FuIGJl
IGRvbmUgd2l0aG91dCByZWFyY2hpdGVjdGluZy9jaGFuZ2luZyB0aGUKaWRsIGFuZCBsaWJ4bCAo
SSB0cmllZCkuIEdpdmVuIHRoYXQgcHZjYWxsc3MgcmVtYWlucyBvbmx5ICJpbnRlcm5hbCIsIEkK
b3B0ZWQgZm9yIHRoZSBlYXN5IHJvdXRlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
