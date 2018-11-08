From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 19:56:29 +0200
Message-ID: <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6g0g=nt=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gKoXx-0006nW-Qr
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:56:49 +0000
In-Reply-To: <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
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

T24gMTEvOC8xOCA3OjIyIFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFRodSwgTm92IDA4LCAyMDE4
IGF0IDA1OjU2OjA3UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gMTEvOC8x
OCA1OjUzIFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDU6
MTk6NDhQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+Pj4+IE9uIDExLzYvMTggNzox
NiBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+PiBPbiBNb24sIE5vdiA1LCAyMDE4IGF0
IDI6NTQgQU0gQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEKPj4+Pj4gPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgYSBjb3VwbGUgb2Yg
cmVncyB0byB0aGUgdm1fZXZlbnQgdGhhdCBhcmUgdXNlZCBieQo+Pj4+Pj4gdGhlIGludHJvc3Bl
Y3Rpb24uIFRoZSBiYXNlLCBsaW1pdCBhbmQgYXIKPj4+Pj4+IGJpdHMgYXJlIGNvbXByZXNzZWQg
aW50byBhIHVpbnQ2NF90IHVuaW9uIHNvIGFzIG5vdCB0byBlbmxhcmdlIHRoZQo+Pj4+Pj4gdm1f
ZXZlbnQuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+Pj4+Cj4+Pj4+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+Pj4KPj4+PiBUbyB0aGUgYmVzdCBvZiBteSBhYmls
aXR5IHRvIGZpZ3VyZSBvdXQgdGhlIG5lY2Vzc2FyeSBhY2tzLCBJIGJlbGlldmUKPj4+PiB0aGF0
IHRoaXMgb25lIGlzIHJlYWR5IHRvIGdvIGluLiA6KQo+Pj4KPj4+IEFscmlnaHQuIEkgd2lsbCBw
aWNrIHRoaXMgdXAgaW4gbXkgbmV4dCBzd2VlcC4KPj4KPj4gVGhhbmtzIQo+IAo+IAo+IFVuZm9y
dHVuYXRlbHkgdGhpcyB3aWxsIGJyZWFrIHNoaW0gYnVpbGQgd2hlbiBIVk0gaXMgZGlzYWJsZWQu
IFBsZWFzZQo+IHN1Ym1pdCBhIG5ldyB2ZXJzaW9uLiBJIHRoaW5rIHlvdSB3aWxsIG5lZWQgdG8g
cHV0Cj4gdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyIHVuZGVyIENPTkZJR19IVk0uCgpW
ZXJ5IHNvcnJ5IGFib3V0IHRoYXQuIFdlJ2xsIHJlc3VibWl0LgoKClRoYW5rcywKUmF6dmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
