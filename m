From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Race condition on device add hanling in xl devd
Date: Mon, 17 Dec 2018 13:18:55 +0100
Message-ID: <20181217121855.zsrn6fvliz4f5yul@mac>
References: <20181216014743.GA5040@mail-itl>
 <20181217094059.rvoptuzp6im52jyp@mac>
 <20181217120001.GB23474@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aESs=O2=citrix.com=prvs=882325300=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gYrrU-00069L-LN
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 12:19:04 +0000
Content-Disposition: inline
In-Reply-To: <20181217120001.GB23474@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTcsIDIwMTggYXQgMDE6MDA6MDFQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIE1vbiwgRGVjIDE3LCAyMDE4IGF0IDEwOjQwOjU5QU0g
KzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBTdW4sIERlYyAxNiwgMjAxOCBh
dCAwMjo0Nzo0M0FNICswMTAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
PiA+IEEgd29ya2Fyb3VuZCBjb3VsZCBiZSBpbXBsZW1lbnRlZCBpbiBob3RwbHVnIHNjcmlwdCBp
dHNlbGYgLSB3YWl0IGZvcgo+ID4gPiB0aGUgZGV2aWNlIHRoZXJlLiBJJ20gbm90IHN1cmUgaG93
IHByb3BlciBzb2x1dGlvbiBjb3VsZCBsb29rIGxpa2UuIFNvbWUKPiA+ID4gc3luY2hyb25pemF0
aW9uIGJldHdlZW4geGwgZGV2ZCBhbmQgdGhlIGtlcm5lbCAobGlrZSB4bCBkZXZkIG1vbml0b3Jp
bmcKPiA+ID4gdWV2ZW50cyk/Cj4gPiAKPiA+IFRoZXJlJ3MgYWxyZWFkeSBhIHN5bmNocm9uaXph
dGlvbiBtZWNoYW5pc20sIGxpYnhsIHdhaXRzIGZvciB0aGUKPiA+IGJhY2tlbmQgdG8gc3dpdGNo
IHRvIHN0YXRlIDIgKFhlbmJ1c1N0YXRlSW5pdFdhaXQpIGJlZm9yZSBydW5uaW5nIHRoZQo+ID4g
aG90cGx1ZyBzY3JpcHRzIFswXS4KPiA+IAo+ID4gTWF5YmUgbmV0YmFjayBzZXRzIHN0YXRlIDIg
YmVmb3JlIGNyZWF0aW5nIHRoZSBiYWNrZW5kIGRldmljZT8KPiA+IAo+ID4gSXQgbG9va3MgdG8g
bWUgbGlrZSB0aGUgYmFja2VuZCBuZWVkcyB0byBiZSBzdXJlIGV2ZXJ5dGhpbmcgbmVlZGVkIGJ5
Cj4gPiB0aGUgaG90cGx1ZyBzY3JpcHQgaXMgaW4gcGxhY2UgYmVmb3JlIHN3aXRjaGluZyB0byBz
dGF0ZSAyLgo+IAo+IEkndmUgZG9uZSBzb21lIG1vcmUgdGVzdHMgYW5kIEkgdGhpbmsgdGhhdCdz
IHNvbWV0aGluZyBlbHNlLiBJJ3ZlIGFkZGVkCj4gYSBsb29wIHdhaXRpbmcgZm9yIC9zeXMvY2xh
c3MvbmV0LyR2aWYgdG8gYSBob3RwbHVnIHNjcmlwdCwgYnV0IGl0IHRpbWVkCj4gb3V0ICg1cyku
IEkgZG9uJ3Qgc2VlIF9hbnlfIGtlcm5lbCBtZXNzYWdlcyByZWxhdGVkIHRvIHRoZSBkZXZpY2Uu
Cj4gCj4gSXQgbWF5IGJlIHNvbWUgYnVnIGluIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBpbiBLVk0u
Li4KCkluIHlvdXIgbWVzc2FnZSB5b3Ugc2FpZCB5b3UgaGF2ZSBhbHNvIG9ic2VydmVkIHRoaXMg
YmVoYXZpb3Igd2hlbgpydW5uaW5nIG9uIGJhcmUgbWV0YWwsIHNvIGl0J3MgbGlrZWx5IG5vdCBy
ZWxhdGVkIHRvIG5lc3RlZAp2aXJ0dWFsaXphdGlvbj8KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
