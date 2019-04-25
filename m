From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
Date: Thu, 25 Apr 2019 10:27:22 -0400
Message-ID: <c2993226-ca65-8bb2-dc23-f2a83f3d76db__16954.6725157247$1556202592$gmane$org@oracle.com>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
 <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
 <131ff20e-5f28-40ef-37a0-422f6508c115@oracle.com>
 <20190425100259.f2k7ayzlxctucitg@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=49+I=S3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJfMV-0003YH-ST
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:28:31 +0000
In-Reply-To: <20190425100259.f2k7ayzlxctucitg@Air-de-Roger>
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

T24gNC8yNS8xOSA2OjAyIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFdlZCwgQXBy
IDI0LCAyMDE5IGF0IDExOjQ1OjQzQU0gLTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4g
T24gNC8yNC8xOSAxMTo0NSBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwg
QXByIDI0LCAyMDE5IGF0IDExOjM2OjQxQU0gLTA0MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToK
Pj4+PiBPbiA0LzIzLzE5IDk6MDQgQU0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gVGhp
cyBpbnZvbHZlcyBpbml0aWFsaXppbmcgdGhlIGJvb3QgcGFyYW1zIEVGSSByZWxhdGVkIGZpZWxk
cyBhbmQgdGhlCj4+Pj4+IGVmaSBnbG9iYWwgdmFyaWFibGUuCj4+Pj4+Cj4+Pj4+IFdpdGhvdXQg
dGhpcyBmaXggYSBQVkggZG9tMCBkb2Vzbid0IGRldGVjdCB3aGVuIGJvb3RlZCBmcm9tIEVGSSwg
YW5kCj4+Pj4+IHRodXMgZG9lc24ndCBzdXBwb3J0IGFjY2Vzc2luZyBhbnkgb2YgdGhlIEVGSSBy
ZWxhdGVkIGRhdGEuCj4+Pj4+Cj4+Pj4+IFJlcG9ydGVkLWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRl
dkBnbWFpbC5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+Pj4+IEhtbS4uIFRoaXMgc2VlbXMgdG8gYmUgYnJlYWtpbmcgc2F2
ZS9yZXN0b3JlIGZvciBtZSAoZm9yIGRvbVUpLCBhbmQgSQo+Pj4+IGNhbid0IHNlZSBhbnkgb2J2
aW91cyByZWFzb25zLgo+Pj4+Cj4+Pj4gQ2FuIHlvdSB0cnkgaXQ/Cj4+PiBTdXJlLCB0aGFua3Mg
Zm9yIHRoZSBleHRyYSB0ZXN0aW5nISBJIGhhdmUgdG8gYWRtaXQgSSBoYXZlbid0IHRlc3RlZAo+
Pj4gc2F2ZS9yZXN0b3JlIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCBpdCBkaWRuJ3QgY29tZSB0
byBtaW5kIGl0IG1pZ2h0Cj4+PiBhZmZlY3QgdGhhdCBmdW5jdGlvbmFsaXR5Lgo+Pj4KPj4+IEkg
YXNzdW1lIGl0J3Mgc2F2ZS9yZXN0b3JlIG9mIGEgUFZIIGRvbVUgdGhhdCdzIGJyb2tlbiAoSFZN
IGFuZCBQViBhcmUKPj4+IGZpbmUpPwo+Pj4KPj4KPj4gUFYgaXMgZmluZSwgSSBoYXZlbid0IHRy
aWVkIEhWTS4KPiBJJ3ZlIHRlc3RlZCBsaXZlIG1pZ3JhdGlvbiBhbmQgc2F2ZS9yZXN0b3JlIG9m
IHRoaXMgc2VyaWVzIG9uIHRvcCBvZgo+IDUuMS4wLXJjNSBhbmQgc2VlbXMgdG8gd29yayBmaW5l
IGZvciBtZS4gT24gdG9wIG9mIHdoaWNoIExpbnV4IHZlcnNpb24KPiB3aGVyZSB5b3UgdGVzdGlu
ZywgYW5kIGNhbiB5b3UgcGFzdGUgdGhlIGd1ZXN0IGNvbmZpZyBmaWxlPwo+CgpJdCdzIG5vdCB5
b3VyIGNoYW5nZS4KCkkgd2FzIGJvb3Rpbmcgd2l0aCB0aHJlYWRpcnFzIGJvb3Qgb3B0aW9uIGFu
ZCBodmMgY29uc29sZSBhcHBhcmVudGx5CmRvZXNuJ3QgbGlrZSB0aGF0LiBJdCdzIG5vdCAxMDAl
IHJlcHJvZHVjaWJsZSwgYnV0IEkgd2FzIGFibGUgdG8gZmFpbApzYXZlL3Jlc3RvcmUgd2l0aG91
dCB5b3VyIHBhdGNoZXMgYXMgd2VsbC4KCkkgbWF5IGxvb2sgYXQgdGhpcyBzb21ldGltZSBuZXh0
IHdlZWssIGJ1dCBpbiB0aGUgbWVhbnRpbWUgZm9yIGJvdGggcGF0Y2hlcwoKUmV2aWV3ZWQtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgphbmQgSSB3aWxs
IGFkZCA0LjE5KyBmb3Igc3RhYmxlLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
