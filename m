From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
Date: Wed, 24 Apr 2019 17:45:04 +0200
Message-ID: <20190424154504.vzkkobxsesc3oval__33832.8758998372$1556120775$gmane$org@Air-de-Roger>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rs1d=S2=citrix.com=prvs=010ed0f85=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJK5A-0001K2-9S
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:45:12 +0000
Content-Disposition: inline
In-Reply-To: <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTE6MzY6NDFBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDQvMjMvMTkgOTowNCBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4g
VGhpcyBpbnZvbHZlcyBpbml0aWFsaXppbmcgdGhlIGJvb3QgcGFyYW1zIEVGSSByZWxhdGVkIGZp
ZWxkcyBhbmQgdGhlCj4gPiBlZmkgZ2xvYmFsIHZhcmlhYmxlLgo+ID4KPiA+IFdpdGhvdXQgdGhp
cyBmaXggYSBQVkggZG9tMCBkb2Vzbid0IGRldGVjdCB3aGVuIGJvb3RlZCBmcm9tIEVGSSwgYW5k
Cj4gPiB0aHVzIGRvZXNuJ3Qgc3VwcG9ydCBhY2Nlc3NpbmcgYW55IG9mIHRoZSBFRkkgcmVsYXRl
ZCBkYXRhLgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRldkBnbWFpbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiAKPiBIbW0uLiBUaGlzIHNlZW1zIHRvIGJlIGJyZWFraW5nIHNhdmUvcmVzdG9yZSBm
b3IgbWUgKGZvciBkb21VKSwgYW5kIEkKPiBjYW4ndCBzZWUgYW55IG9idmlvdXMgcmVhc29ucy4K
PiAKPiBDYW4geW91IHRyeSBpdD8KClN1cmUsIHRoYW5rcyBmb3IgdGhlIGV4dHJhIHRlc3Rpbmch
IEkgaGF2ZSB0byBhZG1pdCBJIGhhdmVuJ3QgdGVzdGVkCnNhdmUvcmVzdG9yZSB3aXRoIHRoaXMg
cGF0Y2ggYXBwbGllZCwgaXQgZGlkbid0IGNvbWUgdG8gbWluZCBpdCBtaWdodAphZmZlY3QgdGhh
dCBmdW5jdGlvbmFsaXR5LgoKSSBhc3N1bWUgaXQncyBzYXZlL3Jlc3RvcmUgb2YgYSBQVkggZG9t
VSB0aGF0J3MgYnJva2VuIChIVk0gYW5kIFBWIGFyZQpmaW5lKT8KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
