From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 01/10] xen/arm64: Added handling of the
 trapped access to OSLSR register
Date: Thu, 31 May 2018 12:17:10 +0100
Message-ID: <c401faf0-1ff7-73fe-102f-cd20365d3c8b@arm.com>
References: <20180515114419.7296-1-mirela.simonovic@aggios.com>
 <20180515114419.7296-2-mirela.simonovic@aggios.com>
 <4d7e72a3-5b40-f073-4aa4-d8143f1ba71c@arm.com>
 <CAKPH-NhSXE8=hAqROOC84J2WKBDYjmUQqziLNWkEbvoZyKZGYg@mail.gmail.com>
 <CAKPH-NgEnbpQFjvrKzayt8RzHYvbF2zykoHf+S9U+9NKKpoCUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NgEnbpQFjvrKzayt8RzHYvbF2zykoHf+S9U+9NKKpoCUw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgTWlyZWxhLAoKT24gMzAvMDUvMTggMTA6NTMsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4g
Cj4gCj4gT24gV2VkLCBNYXkgMzAsIDIwMTggYXQgMTE6NDggQU0sIE1pcmVsYSBTaW1vbm92aWMg
Cj4gPG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbSA8bWFpbHRvOm1pcmVsYS5zaW1vbm92aWNA
YWdnaW9zLmNvbT4+IHdyb3RlOgo+IFBsZWFzZSBub3RlIC0gSSdtIG5vdCBzdXJlIGhvdyBzaG91
bGQgd3JpdGUgdG8gdGhpcyByZWdpc3RlciBiZSB0cmVhdGVkLiAKPiBJbiB0aGUgb3JpZ2luYWwg
cGF0Y2ggKGhhbmRsZV9yb19yYXogaW1wbGVtZW50YXRpb24pIHVuZGVmIGV4Y2VwdGlvbiAKPiB3
aWxsIGJlIHJhaXNlZC4gSSByZWFsaXplZCBpbiB3aGF0IEkgcHJvcG9zZWQgdGhhdCB3b3VsZG4n
dCBiZSB0aGUgY2FzZSwgCj4gaXQncyBhIHdyaXRlLWlnbm9yZS4KCkkgdGhpbmsgeW91IHdhbnQg
dG8ga2VlcCB0aGUgaW5qZWN0X3VuZGVmX2V4Y2VwdGlvbiBoZXJlIHRvIHN0YXkgCmNvbnNpc3Rl
bnQgd2l0aCB0aGUgcmVzdCBvZiBSTyByZWdpc3RlciBpbXBsZW1lbnRhdGlvbi4gSSB3b3VsZCBz
dWdnZXN0IAp0byBjcmVhdGUgYSBuZXcgaGVscGVyIGhhbmRsZV9yb19yZWFkX3ZhbCguLi4pIHRo
YXQgd2lsbCB0YWtlIHRoZSB2YWx1ZSAKdG8gcmV0dXJuIGluIHBhcmFtZXRlci4KCmhhbmRsZV9y
b19yYXogY291bGQgdGhlbiBiZSBpbXBsZW1lbnRlZCB1c2luZyB0aGUgbmV3IGhlbHBlci4KCkFs
c28sIEkgd291bGQgcHJlZmVyIGlmIHlvdSB1c2UgMSA8PCAzIGFzIGl0IGlzIGNsZWFyZXIgdGhh
dCBiaXQgMyBpcyBzZXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
