From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] xen: events: free irqs in error
	condition
Date: Tue, 27 Feb 2018 17:07:40 +0000
Message-ID: <20180227170740.jcaxsvpepsn6eot2__977.854329585348$1519751349$gmane$org@MacBook-Pro-de-Roger.local>
References: <1519746958-52077-1-git-send-email-aams@amazon.com>
 <1519746958-52077-3-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wvqs=fv=citrix.com=prvs=589048569=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqilc-0008L3-EU
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 17:10:16 +0000
Content-Disposition: inline
In-Reply-To: <1519746958-52077-3-git-send-email-aams@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Shah <aams@amazon.com>
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Liu Shuo <shuo.a.liu@intel.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDM6NTU6NThQTSArMDAwMCwgQW1pdCBTaGFoIHdyb3Rl
Ogo+IEluIGNhc2Ugb2YgZXJyb3JzIGluIGlycSBzZXR1cCBmb3IgTVNJLCBmcmVlIHVwIHRoZSBh
bGxvY2F0ZWQgaXJxcy4KPiAKPiBGaXhlczogNDg5MmM5YjRhZGE5ZjkgKCJ4ZW46IGFkZCBzdXBw
b3J0IGZvciBNU0kgbWVzc2FnZSBncm91cHMiKQo+IFJlcG9ydGVkLWJ5OiBIb29tYW4gTWlyaGFk
aSA8bWlyaGFkaWhAYW1hem9uLmNvbT4KPiBDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4g
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBFZHVhcmRvIFZhbGVu
dGluIDxlZHV2YWxAYW1hem9uLmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+IENDOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDQzogIksu
IFkuIFNyaW5pdmFzYW4iIDxreXNAbWljcm9zb2Z0LmNvbT4KPiBDQzogTGl1IFNodW8gPHNodW8u
YS5saXVAaW50ZWwuY29tPgo+IENDOiBBbm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRz
X2Jhc2UuYwo+IGluZGV4IGM4NmQxMGUuLmEyOTk1ODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94
ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiArKysgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRz
X2Jhc2UuYwo+IEBAIC03NTAsMTEgKzc1MCwxNCBAQCBpbnQgeGVuX2JpbmRfcGlycV9tc2lfdG9f
aXJxKHN0cnVjdCBwY2lfZGV2ICpkZXYsIHN0cnVjdCBtc2lfZGVzYyAqbXNpZGVzYywKPiAgCj4g
IAlyZXQgPSBpcnFfc2V0X21zaV9kZXNjKGlycSwgbXNpZGVzYyk7Cj4gIAlpZiAocmV0IDwgMCkK
PiAtCQlnb3RvIGVycm9yX2lycTsKPiArCQlnb3RvIGVycm9yX2Rlc2M7Cj4gIG91dDoKPiAgCW11
dGV4X3VubG9jaygmaXJxX21hcHBpbmdfdXBkYXRlX2xvY2spOwo+ICAJcmV0dXJuIGlycTsKPiAg
ZXJyb3JfaXJxOgo+ICsJd2hpbGUgKC0tbnZlYyA+PSBpKQo+ICsJCXhlbl9mcmVlX2lycShpcnEg
KyBudmVjKTsKPiArZXJyb3JfZGVzYzoKPiAgCXdoaWxlIChpID4gMCkgewo+ICAJCWktLTsKPiAg
CQlfX3VuYmluZF9mcm9tX2lycShpcnEgKyBpKTsKCkl0IHNlZW1zIHBvaW50bGVzcyB0byBpbnRy
b2R1Y2UgYW5vdGhlciBsYWJlbCBhbmQgYW5vdGhlciBsb29wIHRvIGZpeApzb21ldGhpbmcgdGhh
dCBjYW4gYmUgZml4ZWQgd2l0aCBhIHNpbmdsZSBsYWJlbCBhbmQgYSBzaW5nbGUgbG9vcCwKdGhp
cyBqdXN0IG1ha2VzIHRoZSBjb2RlIG1vcmUgY29tcGxleCBmb3Igbm8gcmVhc29uLgoKSU1ITyB0
aGUgd2F5IHRvIHNvbHZlIHRoaXMgaXNzdWUgaXM6Cgp3aGlsZSAobnZlYy0tKSB7CglpZiAobnZl
YyA+PSBpKQoJCXhlbl9mcmVlX2lycShpcnEgKyBudmVjKTsKCWVsc2UKCQlfX3VuYmluZF9mcm9t
X2lycShpcnEgKyBudmVjKTsKfQoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
