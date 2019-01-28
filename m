From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Mon, 28 Jan 2019 18:32:24 +0200
Message-ID: <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9ZJ=QE=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1go9pl-0007EH-El
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 16:32:29 +0000
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so14757011ljh.13
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 08:32:28 -0800 (PST)
In-Reply-To: <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKQWN0dWFsbHkgSSB3YXMgZ29pbmcgdG8gc2VuZCB0aGlzIHBhdGNoIGFz
IFJGQywgYnV0IGRyb3BwZWQgaXQgYXQgdGhlIGxhc3QgbW9tZW50LgoKT24gMjguMDEuMTkgMTc6
NTUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBUaGlzIHdhcyBtaXNzZWQgb24gcHVycG9zZS4gTGV0
IG1lIGV4cGxhaW4gd2h5LiBUaGUgY2FsbCB0byBwMm1faW52YWxpZGF0ZV9yb290KCkgYXJjaF9k
b21haW5fY3JlYXRpb25fZmluaXNoZWQgaXMgY2FsbGVkIGJ5ICphbGwqIHRoZSBkb21haW4gYXQg
Ym9vdCB0byB0cnkgdG8gb3B0aW1pemUgdGhlIHNldC93YXkgY2FzZS4KPiAKPiBUaGUgY2hlY2sg
aW9tbXVfdXNlX2hhcF9wdCBpbiB0aGF0IGNvbnRleHQgaXMgdG8gcHJldmVudCBndWVzdCBub3Qg
dXNpbmcgU2V0L1dheSB0byBiZWNvbWUgdW51c2FibGUgdW5kZXIgdGhlIElPTU1VIHVzZS1jYXNl
Lgo+IAo+IEluIHlvdXIgY2FzZSwgeW91IHNlZW0gdG8gaGF2ZSBhIGd1ZXN0IE9TIHVzaW5nIHNl
dC93YXkgYW5kIHlldCBzaGFyaW5nIHRoZSBQMk0gd2l0aCB0aGUgSU9NTVUuIFlvdSBoYXZlIHRo
ZSBjaG9pY2UgYmV0d2VlbjoKPiAgwqDCoMKgwqAxKSBDcmFzaGluZyBvbiBJT01NVSBmYXVsdAo+
ICDCoMKgwqDCoDIpIEJlY29tZSB2ZXJ5IHNsb3cgYW5kIHBvdGVudGlhbGx5IHVudXNhYmxlIGJl
Y2F1c2UgeW91IG5vdyBoYXZlIHRvIGdvIHRocm91Z2ggdGhlIGZ1bGwgUDJNIGV2ZXJ5IHRpbWUg
eW91IGRvIGEgU2V0L1dheS4KPiAKPiAxKSB3YXMgbXkgZmF2b3JlZCBvcHRpb24gYmVjYXVzZSBT
ZXQvV2F5IHNob3VsZCByZWFsbHkgbm90IGJlIHVzZWQgYnkgdGhlIGd1ZXN0LiBJdCB3YXMgaW1w
bGVtZW50ZWQgYnkgY291cnRlc3kgdG8gdGhlIGd1ZXN0IE9TIGFuZCBJIHdvdWxkIG5vdCByZWx5
IG9uIGV2ZXJ5dGhpbmcgd29ya2luZy4KPiAKPiBDYW4geW91IGV4cGxhaW4gd2hhdCBpcyB5b3Vy
IHVzZS1jYXNlIChPUyB1c2VkLCBJT01NVSwgcGxhdGZvcm0uLi4pClllcCwgSSdtIG5lYXJseSBm
aW5pc2hlZCBtb3Zpbmcgb3VyIGRldmVsb3BtZW50IHNldHVwIHRvIFhFTiA0LjEyLXJjLgpUaGUg
cGxhdGZvcm0gaXMgUi1DYXIgR2VuMyAoQ0E1NytDQTUzKSwgUmVuZXNhcydlcyBJT01NVSBuYW1l
ZCBJUE1NVSBpcyB1dGlsaXplZCBmb3IgYWxsIHBlcmlwaGVyYWxzIGFzc2lnbmVkIHRvIERvbUQg
YW5kIEdQVSBzaGFyZWQgYmV0d2VlbiBEb21EIGFuZCBEb21BLgpUaHJlZSBPUydlcyBhcmUgcnVu
bmluZyBvbiB0aGUgSFc6IEhXLWxlc3MgRG9tMCwgZHJpdmVyIGRvbWFpbiBEb21EIHdpdGggR1BV
IHNoYXJpbmcsIEFuZHJvaWQgcnVubmluZyBvbiBQViBkcml2ZXJzIGFuZCBHUFUgc2hhcmluZy4K
U28gb24gc3lzdGVtIHN0YXJ0IChEb21EIGJvb3RpbmcpIEkgc2VlIGZldyB0cmFuc2xhdGlvbiBm
YXVsdHMgZnJvbSBEb21EIG9ubHkgYXNzaWduZWQgcGVyaXBoZXJhbHMuIEJ1dCB0aGVuIEFuZHJv
aWQgc3RhcnRzIGFuZCB0aGVyZSBhcmUgbG90IG9mIHRyYW5zbGF0aW9uIGZhdWx0cyBmcm9tIEdQ
VSB0cnlpbmcgYWNjZXNzIERvbUEgbWVtb3J5LiBUaGVuIEdQVSBGVyBkaWVzLgoKLS0gClNpbmNl
cmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
