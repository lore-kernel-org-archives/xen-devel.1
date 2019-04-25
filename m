From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
Date: Thu, 25 Apr 2019 12:02:59 +0200
Message-ID: <20190425100259.f2k7ayzlxctucitg__15797.9016586737$1556186740$gmane$org@Air-de-Roger>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
 <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
 <131ff20e-5f28-40ef-37a0-422f6508c115@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+pYJ=S3=citrix.com=prvs=011b0443a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hJbFF-0005WN-6O
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:04:45 +0000
Content-Disposition: inline
In-Reply-To: <131ff20e-5f28-40ef-37a0-422f6508c115@oracle.com>
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

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTE6NDU6NDNBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDQvMjQvMTkgMTE6NDUgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
PiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAxMTozNjo0MUFNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zz
a3kgd3JvdGU6Cj4gPj4gT24gNC8yMy8xOSA5OjA0IEFNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gPj4+IFRoaXMgaW52b2x2ZXMgaW5pdGlhbGl6aW5nIHRoZSBib290IHBhcmFtcyBFRkkgcmVs
YXRlZCBmaWVsZHMgYW5kIHRoZQo+ID4+PiBlZmkgZ2xvYmFsIHZhcmlhYmxlLgo+ID4+Pgo+ID4+
PiBXaXRob3V0IHRoaXMgZml4IGEgUFZIIGRvbTAgZG9lc24ndCBkZXRlY3Qgd2hlbiBib290ZWQg
ZnJvbSBFRkksIGFuZAo+ID4+PiB0aHVzIGRvZXNuJ3Qgc3VwcG9ydCBhY2Nlc3NpbmcgYW55IG9m
IHRoZSBFRkkgcmVsYXRlZCBkYXRhLgo+ID4+Pgo+ID4+PiBSZXBvcnRlZC1ieTogUEdOZXQgRGV2
IDxwZ25ldC5kZXZAZ21haWwuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+PiBIbW0uLiBUaGlzIHNlZW1zIHRvIGJlIGJy
ZWFraW5nIHNhdmUvcmVzdG9yZSBmb3IgbWUgKGZvciBkb21VKSwgYW5kIEkKPiA+PiBjYW4ndCBz
ZWUgYW55IG9idmlvdXMgcmVhc29ucy4KPiA+Pgo+ID4+IENhbiB5b3UgdHJ5IGl0Pwo+ID4gU3Vy
ZSwgdGhhbmtzIGZvciB0aGUgZXh0cmEgdGVzdGluZyEgSSBoYXZlIHRvIGFkbWl0IEkgaGF2ZW4n
dCB0ZXN0ZWQKPiA+IHNhdmUvcmVzdG9yZSB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgaXQgZGlk
bid0IGNvbWUgdG8gbWluZCBpdCBtaWdodAo+ID4gYWZmZWN0IHRoYXQgZnVuY3Rpb25hbGl0eS4K
PiA+Cj4gPiBJIGFzc3VtZSBpdCdzIHNhdmUvcmVzdG9yZSBvZiBhIFBWSCBkb21VIHRoYXQncyBi
cm9rZW4gKEhWTSBhbmQgUFYgYXJlCj4gPiBmaW5lKT8KPiA+Cj4gCj4gCj4gUFYgaXMgZmluZSwg
SSBoYXZlbid0IHRyaWVkIEhWTS4KCkkndmUgdGVzdGVkIGxpdmUgbWlncmF0aW9uIGFuZCBzYXZl
L3Jlc3RvcmUgb2YgdGhpcyBzZXJpZXMgb24gdG9wIG9mCjUuMS4wLXJjNSBhbmQgc2VlbXMgdG8g
d29yayBmaW5lIGZvciBtZS4gT24gdG9wIG9mIHdoaWNoIExpbnV4IHZlcnNpb24Kd2hlcmUgeW91
IHRlc3RpbmcsIGFuZCBjYW4geW91IHBhc3RlIHRoZSBndWVzdCBjb25maWcgZmlsZT8KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
