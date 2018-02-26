From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen: events: free irqs in error
	condition
Date: Mon, 26 Feb 2018 18:14:39 +0000
Message-ID: <20180226181439.zbdtzbv7wifjst2l__6355.40538137338$1519668898$gmane$org@MacBook-Pro-de-Roger.local>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
 <1519666595-41362-3-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4q6f=fu=citrix.com=prvs=588a07e6a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqNJg-0004EM-5B
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 18:16:00 +0000
Content-Disposition: inline
In-Reply-To: <1519666595-41362-3-git-send-email-aams@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Shah <aams@amazon.com>
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, Liu Shuo <shuo.a.liu@intel.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDU6MzY6MzVQTSArMDAwMCwgQW1pdCBTaGFoIHdyb3Rl
Ogo+IEluIGNhc2Ugb2YgZXJyb3JzIGluIGlycSBzZXR1cCBmb3IgTVNJLCBmcmVlIHVwIHRoZSBh
bGxvY2F0ZWQgaXJxcy4KPiAKPiBGaXhlczogNDg5MmM5YjRhZGE5ZjkgKCJ4ZW46IGFkZCBzdXBw
b3J0IGZvciBNU0kgbWVzc2FnZSBncm91cHMiKQo+IFJlcG9ydGVkLWJ5OiBIb29tYW4gTWlyaGFk
aSA8bWlyaGFkaWhAYW1hem9uLmNvbT4KPiBDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4g
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBEYXZpZCBW
cmFiZWwgPGRhdmlkLnZyYWJlbEBjaXRyaXguY29tPgo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBFZHVhcmRvIFZhbGVudGluIDxlZHV2YWxA
YW1hem9uLmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENDOiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDQzogIksuIFkuIFNyaW5pdmFz
YW4iIDxreXNAbWljcm9zb2Z0LmNvbT4KPiBDQzogTGl1IFNodW8gPHNodW8uYS5saXVAaW50ZWwu
Y29tPgo+IENDOiBBbm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmNvbT4KPiAtLS0KPiAgZHJpdmVycy94ZW4v
ZXZlbnRzL2V2ZW50c19iYXNlLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIv
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBpbmRleCBiNmI4YjI5Li45NmFhNTc1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCj4gKysrIGIv
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBAQCAtNzU4LDYgKzc1OCw3IEBAIGlu
dCB4ZW5fYmluZF9waXJxX21zaV90b19pcnEoc3RydWN0IHBjaV9kZXYgKmRldiwgc3RydWN0IG1z
aV9kZXNjICptc2lkZXNjLAo+ICBlcnJvcl9pcnE6Cj4gIAlmb3IgKDsgaSA+PSAwOyBpLS0pCj4g
IAkJX191bmJpbmRfZnJvbV9pcnEoaXJxICsgaSk7Cj4gKwl4ZW5fZnJlZV9pcnEoaXJxKTsKCkht
LCB4ZW5fZnJlZV9pcnEgY2FsbHMgaXJxX2ZyZWVfZGVzYywgd2hpY2ggaXMgaXJxX2ZyZWVfZGVz
Y3MoaXJxLCAxKSwKSSB0aGluayB5b3Ugd2lsbCBoYXZlIHRvIGludHJvZHVjZSBhIG5ldyBmcmVl
IGZ1bmN0aW9uOgoKeGVuX2ZyZWVfaXJxcyh1bnNpZ25lZCBpcnEsIHVuc2lnbmVkIGludCBucikK
ClRoYXQgY2FsbHMgaXJxX2ZyZWVfZGVzY3MoaXJxLCBucikKClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
