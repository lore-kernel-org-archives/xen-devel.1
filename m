From: Jennifer Herbert <Jennifer.Herbert@citrix.com>
Subject: Re: [PATCH] xen/pv: Add PV specific legacy_pic struct
 to expose legacy IRQs.
Date: Thu, 21 Mar 2019 17:49:43 +0000
Message-ID: <5C93CEB7.9030701__17572.6987466746$1553190653$gmane$org@citrix.com>
References: <1553025739-92245-1-git-send-email-jennifer.herbert@citrix.com>
 <2eb1fdec-6cc0-7f62-3d4f-adc5dba9971e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cie8=RY=citrix.com=prvs=976a6fba1=jennifer.herbert@srs-us1.protection.inumbo.net>)
 id 1h71pC-00044h-FH
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 17:49:54 +0000
In-Reply-To: <2eb1fdec-6cc0-7f62-3d4f-adc5dba9971e@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxOS8wMy8xOSAyMzowNiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDMvMTkvMTkg
NDowMiBQTSwgSmVubmlmZXIgSGVyYmVydCB3cm90ZToKPj4gVGhlIEFDUEkgdGFibGVzIGRvZXNu
J3QgYWx3YXlzIGNvbnRhaW4gYWxsIElSUXMgZm9yIGxlZ2FjeSBkZXZpY2VzCj4+IHN1Y2ggYXMg
UlRDLiAgU2luY2Ugbm8gUElDIGNvbnRyb2xsZXIgaXMgdmlzaWJsZSBmb3IgYSBQViBsaW51eCBn
dWVzdCwKPj4gdW5kZXIgWGVuLCBsZWdhY3lfcGljIGN1cnJlbnRseSBkZWZhdWx0cyB0byB0aGUg
bnVsbF9sZWdhY3lfcGljIC0gd2l0aAo+PiByZXBvcnRzIG5vIGxlZ2FjeSBJUlFzLiAgU2luY2Ug
dGhlIGNvbW1pdCAicnRjOiBjbW9zOiBEbyBub3QgYXNzdW1lCj4+IGlycSA4IGZvciBydGMgd2hl
biB0aGVyZSBhcmUgbm8gbGVnYWN5IGlycXMiIGJ5IEhhbnMgZGUgR29lZGUKPj4gKGNvbW1pdCBp
ZDogYTFlMjNhNDJmMWJkYzAwZTMyZmM0ODY5Y2FlZjEyZTRlNjI3MmYyNiksIHRoZSBydGMgbm93
Cj4+IGluY29ycmVjdGx5IGRlY2lkZXMgaXQgaGFzIG5vIGlycSBpdCBjYW4gdXNlLCBmb3Igc29t
ZSBoYXJkd2FyZS4KPj4KPj4gVGhpcyBwYXRjaCByZWN0aWZpZXMgdGhlIHByb2JsZW0gYnkgcHJv
dmlkaW5nIGEgeGVuIGxlZ2FjeV9waWMKPj4gc3RydWN0LCB3aGljaCBpcyBtdWNoIGxpa2UgdGhl
IG51bGxfbGVnYWN5X3BpYyBleGNlcHQgdGhhdCBpdAo+PiByZXBvcnRzIE5SX0lSUVNfTEVHQUNZ
IGlycXMuCj4gSSBhc3N1bWUgdGhpcyBpcyBmb3IgZG9tMD8KPgo+IENvdWxkIHRoZXJlIGJlIHRo
ZSBzYW1lIHByb2JsZW0gd2l0aCBQVkggZG9tMD8gKGFuZCBpZiB5ZXMgdGhlbiB0aGlzCj4gc2hv
dWxkIHByb2JhYmx5IGdvIGludG8gYXJjaC94ODYveGVuL2VubGlnaHRlbi5jKS4KPgo+IC1ib3Jp
cwo+CgpJIGFtIGRvaW5nIHRoaXMgdG8gZml4IGEgcHJvYmxlbSB3aXRoIGRvbTAuICBEb21VIGRv
ZXNuJ3Qgc2VlbSB0byBoYXZlIAphbiBSVEMsIGFuZCBzbyBpdCBpcyB1bmFmZmVjdGVkLgoKSSdt
IG5vdCBmYW1pbGlhciB3aXRoIFBWSCwgYnV0IGhhdmUgbm93IGRvbmUgc29tZSBleHBlcmltZW50
cy4gIFRoZSBSVEMgCm9uIFBWSCBzZWVtcyBicm9rZW4gLSBidXQgbm90IHF1aXRlIGluIHRoZSBz
YW1lIHdheSBhcyBQVi4gTW9yZSByZXNlYXJjaCAKaXMgbmVlZGVkLCBob3dldmVyIHNpbXBseSBk
b2luZyB0aGUgc2FtZSB0cmljayBJIGRpZCB3aXRoIFBWIHdpbGwgbm90IApmaXggdGhlIGlzc3Vl
LgoKSSdsbCBsb29rIGZ1cnRoZXIgaW50byBpdC4KCkNoZWVyLAoKLWplbm55CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
