From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 17:56:07 +0200
Message-ID: <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6g0g=nt=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gKmfF-0000kh-Fh
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:56:13 +0000
In-Reply-To: <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOC8xOCA1OjUzIFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFRodSwgTm92IDA4LCAyMDE4
IGF0IDA1OjE5OjQ4UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gMTEvNi8x
OCA3OjE2IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+PiBPbiBNb24sIE5vdiA1LCAyMDE4
IGF0IDI6NTQgQU0gQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEKPj4+IDxhaXNhaWxhQGJpdGRlZmVu
ZGVyLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGFkZHMgYSBjb3VwbGUgb2YgcmVn
cyB0byB0aGUgdm1fZXZlbnQgdGhhdCBhcmUgdXNlZCBieQo+Pj4+IHRoZSBpbnRyb3NwZWN0aW9u
LiBUaGUgYmFzZSwgbGltaXQgYW5kIGFyCj4+Pj4gYml0cyBhcmUgY29tcHJlc3NlZCBpbnRvIGEg
dWludDY0X3QgdW5pb24gc28gYXMgbm90IHRvIGVubGFyZ2UgdGhlCj4+Pj4gdm1fZXZlbnQuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVu
ZGVyLmNvbT4KPj4+Cj4+PiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPgo+Pgo+PiBUbyB0aGUgYmVzdCBvZiBteSBhYmlsaXR5IHRvIGZpZ3VyZSBvdXQgdGhl
IG5lY2Vzc2FyeSBhY2tzLCBJIGJlbGlldmUKPj4gdGhhdCB0aGlzIG9uZSBpcyByZWFkeSB0byBn
byBpbi4gOikKPiAKPiBBbHJpZ2h0LiBJIHdpbGwgcGljayB0aGlzIHVwIGluIG15IG5leHQgc3dl
ZXAuCgpUaGFua3MhCgpSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
