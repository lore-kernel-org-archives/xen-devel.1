From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
Date: Wed, 24 Apr 2019 11:45:43 -0400
Message-ID: <131ff20e-5f28-40ef-37a0-422f6508c115__21782.2940948949$1556120844$gmane$org@oracle.com>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
 <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E0+D=S2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJK6S-0001Pt-5G
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:46:32 +0000
In-Reply-To: <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yNC8xOSAxMTo0NSBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEFw
ciAyNCwgMjAxOSBhdCAxMTozNjo0MUFNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+
IE9uIDQvMjMvMTkgOTowNCBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gVGhpcyBpbnZv
bHZlcyBpbml0aWFsaXppbmcgdGhlIGJvb3QgcGFyYW1zIEVGSSByZWxhdGVkIGZpZWxkcyBhbmQg
dGhlCj4+PiBlZmkgZ2xvYmFsIHZhcmlhYmxlLgo+Pj4KPj4+IFdpdGhvdXQgdGhpcyBmaXggYSBQ
VkggZG9tMCBkb2Vzbid0IGRldGVjdCB3aGVuIGJvb3RlZCBmcm9tIEVGSSwgYW5kCj4+PiB0aHVz
IGRvZXNuJ3Qgc3VwcG9ydCBhY2Nlc3NpbmcgYW55IG9mIHRoZSBFRkkgcmVsYXRlZCBkYXRhLgo+
Pj4KPj4+IFJlcG9ydGVkLWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRldkBnbWFpbC5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4g
SG1tLi4gVGhpcyBzZWVtcyB0byBiZSBicmVha2luZyBzYXZlL3Jlc3RvcmUgZm9yIG1lIChmb3Ig
ZG9tVSksIGFuZCBJCj4+IGNhbid0IHNlZSBhbnkgb2J2aW91cyByZWFzb25zLgo+Pgo+PiBDYW4g
eW91IHRyeSBpdD8KPiBTdXJlLCB0aGFua3MgZm9yIHRoZSBleHRyYSB0ZXN0aW5nISBJIGhhdmUg
dG8gYWRtaXQgSSBoYXZlbid0IHRlc3RlZAo+IHNhdmUvcmVzdG9yZSB3aXRoIHRoaXMgcGF0Y2gg
YXBwbGllZCwgaXQgZGlkbid0IGNvbWUgdG8gbWluZCBpdCBtaWdodAo+IGFmZmVjdCB0aGF0IGZ1
bmN0aW9uYWxpdHkuCj4KPiBJIGFzc3VtZSBpdCdzIHNhdmUvcmVzdG9yZSBvZiBhIFBWSCBkb21V
IHRoYXQncyBicm9rZW4gKEhWTSBhbmQgUFYgYXJlCj4gZmluZSk/Cj4KCgpQViBpcyBmaW5lLCBJ
IGhhdmVuJ3QgdHJpZWQgSFZNLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
