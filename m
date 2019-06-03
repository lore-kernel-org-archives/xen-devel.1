From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
Date: Mon, 3 Jun 2019 09:48:33 +0800
Message-ID: <49547fa1-b1a9-55d8-68b4-d91ef35ce921@mxnavi.com>
References: <9df204f9ae2cc9c80a6afde5ea82cb27@sslemail.net>
 <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXc5e-0001Nh-Fl
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:48:46 +0000
In-Reply-To: <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDUvMzEvMTkgMTg6NTIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE9uIDUvMzEv
MTkgNDoxOCBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiBUaHVzLCBzaXplb2Yoc3RydWN0IGNw
dXBvb2wpIHdpbGwgc2F2ZSA4IGJ5dGVzIGZvciA2NC1iaXQgc3lzdGVtLgo+Cj4gSSBhbSBoYXBw
eSB3aXRoIHRoZSBjaGFuZ2UsIGFsdGhvdWdoIEFGQUlLIGNwdXBvb2wgaXMgbm90IGluc3RhbnRp
YXRlZCAKPiB0aGF0IG9mdGVuLiBBcmUgeW91IHBsYW5uaW5nIHRvIGhhdmUgbW9yZSBpbnN0YW50
aWF0aW9uIG9mIGl0Pwo+Cj4gQ2hlZXJzLAo+Ck5vLCBJJ20gbm90IHBsYW5uaW5nIHRvIGNyZWF0
ZSBsb3RzIG9mIGNwdXBvb2wgaW5zdGFuY2UuCgpJJ20gc3R1ZHlpbmcgeGVuIGZvciBhIGZldyB3
ZWVrcyBhbmQgbXkgcGxhbiBpczoKCnJ1biB4ZW4gZm9yIGVtYmVkZWQgYXV0b21vdGl2ZSB1c2Ug
Y2FzZSB3aXRoIGRvbTBsZXNzLCBudWxsIHNjaGVkdWxlciwgCnNtYWxsIGNvZGUgYmFzZSBmb3Ig
c2FmZXR5IGNlcnRpZmllZCBtYXliZSBhIHBsdXMobm90IHN1cmUgd2hldGhlciBjYW4gCmRvIHRo
aXMpLgoKCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhu
YXZpLmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMiArLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKPj4gaW5kZXggOTJiYzdhMC4uZjBjZjIxMCAxMDA2NDQKPj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlm
LmgKPj4gQEAgLTIxMyw5ICsyMTMsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZnJlZV9k
b21kYXRhKGNvbnN0IAo+PiBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+PiDCoCBzdHJ1Y3QgY3B1cG9v
bAo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgaW50wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1
cG9vbF9pZDsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoCBuX2RvbTsKPj4gwqDCoMKg
wqDCoCBjcHVtYXNrX3Zhcl90wqDCoMKgIGNwdV92YWxpZDvCoMKgwqDCoMKgIC8qIGFsbCBjcHVz
IGFzc2lnbmVkIHRvIHBvb2wgKi8KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgY3B1cG9vbMKgwqAgKm5l
eHQ7Cj4+IC3CoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgwqAgbl9kb207Cj4+IMKgwqDCoMKgwqAg
c3RydWN0IHNjaGVkdWxlciAqc2NoZWQ7Cj4+IMKgwqDCoMKgwqAgYXRvbWljX3TCoMKgwqDCoMKg
wqDCoMKgIHJlZmNudDsKPj4gwqAgfTsKPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
