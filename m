From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] xen/PVH: Use proper CS selector in long
 mode
Date: Wed, 02 May 2018 09:09:15 -0600
Message-ID: <5AE9D49B02000078001C0322__45270.1921844438$1525273684$gmane$org@prv1-mh.provo.novell.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-3-boris.ostrovsky@oracle.com>
 <5AE9713D02000078001C007B@prv1-mh.provo.novell.com>
 <6b7a748d-e289-c370-123a-678c6ad7d9dd@oracle.com>
 <5AE9D27402000078001C02ED@prv1-mh.provo.novell.com>
 <cb819dcb-1597-680e-31b3-b63fecb6d4c1@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=toke=hv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDtNj-0007z6-Nt
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:09:23 +0000
In-Reply-To: <cb819dcb-1597-680e-31b3-b63fecb6d4c1@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE4IGF0IDE3OjA4LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzAyLzIwMTggMTE6MDAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAwMi4wNS4xOCBhdCAxNjo1NywgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IE9uIDA1LzAyLzIwMTggMDQ6MDUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9u
IDMwLjA0LjE4IGF0IDE4OjIzLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+Pj4KPj4+PiBCdXQgdG8gdW5kZXJzdGFuZCB3aHkgdGhpbmdzIGhhdmUgYmVlbiB3b3JraW5n
IG5ldmVydGhlbGVzcyBpdCB3b3VsZAo+Pj4+IGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBjb21taXQg
bWVzc2FnZSB3YXNuJ3QgZW1wdHksIGJ1dCBpbnN0ZWFkIHNhaWQKPj4+PiBzb21ldGhpbmcgbGlr
ZSAiVGhlIHR3byBoYXBwZW4gdG8gYmUgaWRlbnRpY2FsIG9uIDY0LWJpdC4iCj4+Pgo+Pj4gV2h5
IGRvIHlvdSB0aGluayB0aGV5IGFyZSBpZGVudGljYWw/IF9fS0VSTkVMX0NTIHBvaW50cyB0byBl
bnRyeSMxMgo+Pj4gKHdoaWNoIHdlIGRvbid0IHNwZWNpZnkgaW4gUFZIIEdEVCkgd2hpbGUgX19C
T09UX0NTIGlzIHRoZSBzZWNvbmQgZW50cnkKPj4+ICh3aGljaCB3ZSBkbyBjcmVhdGUpLgo+PiBU
aGF0J3MgMzItYml0J3MgX19LRVJORUxfQ1MuIElmIHRoZSB0d28gd2VyZW4ndCBpZGVudGljYWws
IHRoZSBsam1wCj4+IHlvdSBhZGp1c3Qgd291bGQgbmV2ZXIgaGF2ZSB3b3JrZWQgYWZhaWN0Lgo+
IAo+IAo+IE9oLCByaWdodC4gTXkgdGhlb3J5IHdhcyB0aGF0IHdlIHdlcmUgcGlja2luZyB1cCBz
b21ldGhpbmcgZnJvbSB0aGUKPiBzdGFjayAod2hpY2ggaXMgd2hlcmUgMTJ0aCBlbnRyeSB3b3Vs
ZCBiZSBwb2ludGluZykgYW5kIHRoZSBMIGJpdCwgd2hpY2gKPiBJIHRoaW5rIGlzIHRoZSBvbmx5
IG9uZSB3ZSdkIGNhcmUgYWJvdXQsIGhhcHBlbmVkIHRvIGFsd2F5cyBiZSBzZXQgdGhlcmUuCgpJ
IGRvbid0IHRoaW5rIHRoZSBMIGJpdCBpcyB0aGUgb25seSBvbmUgd2UgY2FyZSBhYm91dCwgYXMg
SSBkb24ndCB0aGluayB5b3UKY2FuIGxvYWQgYSBub24tY29kZSBzZWxlY3RvciBpbnRvIENTIChl
dmVuIGlmIG5vbmUgb2YgdGhlIGF0dHJpYnV0ZXMgYXJlCmxhdGVyIHVzZWQgZm9yIGFueXRoaW5n
KS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
