From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 17:22:01 +0000
Message-ID: <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKo0L-0003eT-LX
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:22:05 +0000
Content-Disposition: inline
In-Reply-To: <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDU6NTY6MDdQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDExLzgvMTggNTo1MyBQTSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwg
Tm92IDA4LCAyMDE4IGF0IDA1OjE5OjQ4UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToK
PiA+PiBPbiAxMS82LzE4IDc6MTYgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4gT24g
TW9uLCBOb3YgNSwgMjAxOCBhdCAyOjU0IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCj4gPj4+
IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gVGhpcyBwYXRj
aCBhZGRzIGEgY291cGxlIG9mIHJlZ3MgdG8gdGhlIHZtX2V2ZW50IHRoYXQgYXJlIHVzZWQgYnkK
PiA+Pj4+IHRoZSBpbnRyb3NwZWN0aW9uLiBUaGUgYmFzZSwgbGltaXQgYW5kIGFyCj4gPj4+PiBi
aXRzIGFyZSBjb21wcmVzc2VkIGludG8gYSB1aW50NjRfdCB1bmlvbiBzbyBhcyBub3QgdG8gZW5s
YXJnZSB0aGUKPiA+Pj4+IHZtX2V2ZW50Lgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+ID4+Pgo+ID4+PiBBY2tl
ZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+ID4+Cj4gPj4gVG8g
dGhlIGJlc3Qgb2YgbXkgYWJpbGl0eSB0byBmaWd1cmUgb3V0IHRoZSBuZWNlc3NhcnkgYWNrcywg
SSBiZWxpZXZlCj4gPj4gdGhhdCB0aGlzIG9uZSBpcyByZWFkeSB0byBnbyBpbi4gOikKPiA+IAo+
ID4gQWxyaWdodC4gSSB3aWxsIHBpY2sgdGhpcyB1cCBpbiBteSBuZXh0IHN3ZWVwLgo+IAo+IFRo
YW5rcyEKCgpVbmZvcnR1bmF0ZWx5IHRoaXMgd2lsbCBicmVhayBzaGltIGJ1aWxkIHdoZW4gSFZN
IGlzIGRpc2FibGVkLiBQbGVhc2UKc3VibWl0IGEgbmV3IHZlcnNpb24uIEkgdGhpbmsgeW91IHdp
bGwgbmVlZCB0byBwdXQKdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyIHVuZGVyIENPTkZJ
R19IVk0uCgpXZWkuCgo+IAo+IFJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
