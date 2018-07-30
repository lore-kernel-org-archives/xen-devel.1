From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 19/21] xen/arm: introduce create_domUs
Date: Mon, 30 Jul 2018 11:15:51 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807301051460.20701@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-19-git-send-email-sstabellini@kernel.org>
 <d427865a-6358-544b-f682-17e2b47fa0c3@arm.com>
 <alpine.DEB.2.10.1807271636520.20701@sstabellini-ThinkPad-X260>
 <1b62cb5f-ff15-07fe-27ef-1873d4e51abb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1b62cb5f-ff15-07fe-27ef-1873d4e51abb@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, andrew.cooper3@citrix.com, xen-devel@lists.xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAzMCBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjgvMDcvMTggMDM6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1
ZSwgMjQgSnVsIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICAgICAgICAgIGRvbWFpbl91bnBhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoZCk7Cj4gPiA+IAo+
ID4gPiBJZiBhIGRvbWFpbiBpcyBib3VuZCB0byBDUFUwLCB0aGVuIGl0IHdpbGwgbm90IGJvb3Qg
dW50aWwgQ1BVMCBpcyBkb25lCj4gPiA+IHdpdGgKPiA+ID4gY3JlYXRpbmcgZG9tYWluLiBJcyB0
aGF0IHdoYXQgeW91IHdhbnQ/Cj4gPiAKPiA+IEFyZSB5b3Ugc3VnZ2VzdGluZyB0byBtb3ZlIHRo
ZSBkb21haW5fdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKGQpIHRvCj4gPiBhIHNlY29uZCBs
b29wIGFmdGVyIHRoZSBkb21VIGNyZWF0aW9uIGxvb3A/Cj4gCj4gSSB3YXMgdHJ5aW5nIHRvIHVu
ZGVyc3RhbmQgd2hhdCBhcmUgdGhlIHByby9jb25zIG9mIHVucGF1c2luZyBhIERvbVUgaGVyZS4g
RGlkCj4geW91IGV4cGxvcmUgaXQ/CgpPSywgbGV0J3MgZGlnIGludG8gaXQuCgpkb21haW5fdW5w
YXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyIGRvZXNuJ3QgYWN0dWFsbHkgdHJpZ2dlciBhIERvbVUg
Ym9vdApyaWdodCBhd2F5LiBJdCBvbmx5IG1hcmtzIHRoZSB2Y3B1IGFzIHJlYWR5IHRvIGJlIHN0
YXJ0ZWQuICBUaGVuLCBpdCBpcwp1cCB0byBYZW4gd2FudGluZyB0byBsZWF2ZSBoeXBlcnZpc29y
IG1vZGUgYW5kIHN0YXJ0IHJ1bm5pbmcgYSBndWVzdAp2Y3B1LiBTbyB0aGVyZSBzaG91bGQgYmUg
bm8gaXNzdWVzIGluIHVucGF1c2luZyB0aGUgdmNwdXMgaGVyZSwgaW4gZmFjdCwKaXQgc2hvdWxk
IG1ha2Ugbm8gZGlmZmVyZW5jZSB3aGV0aGVyIGl0IGlzIGRvbmUgaW5zaWRlIHRoaXMgbG9vcCBv
ciBvbiBhCnNlY29uZCBsb29wLgoKSW4gbXkgZXhwZXJpbWVudHMsIGNwdTEgc3RhcnRzIGZpcnN0
LCBydW5uaW5nIGRvbTF2MCwgdGhlbiBjcHUwIChhZnRlcgpjb21wbGV0ZWx5IHN0YXJ0X3hlbikg
cnVubmluZyBkb20wdjAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
