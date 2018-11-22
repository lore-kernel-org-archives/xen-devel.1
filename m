From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 22 Nov 2018 18:52:07 +0200
Message-ID: <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
References: <20181116100624.21977-1-aisaila@bitdefender.com>
 <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QveS=OB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPsD9-0007gH-DL
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 16:52:15 +0000
In-Reply-To: <20181122153756.au3ntxgfqjjhd6sb@mac>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjIvMTggNTozNyBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBJIGRvbid0IHRo
aW5rIHlvdSBhcmUgc3VwcG9zZWQgdG8gdHJ5IHRvIHBhdXNlIG90aGVyIHZjcHVzIHdoaWxlCj4g
aG9sZGluZyBhIGxvY2ssIGFzIHlvdSBjYW4gc2VlIGl0J3MgcXVpdGUgbGlrZWx5IHRoYXQgeW91
IHdpbGwgZW5kIHVwCj4gZGVhZGxvY2tpbmcgYmVjYXVzZSB0aGUgdkNQVSB5b3UgYXJlIHRyeWlu
ZyB0byBwYXVzZSBpcyBzdHVjayB3YWl0aW5nCj4gb24gdGhlIGxvY2sgdGhhdCB5b3UgYXJlIGhv
bGRpbmcuCj4gCj4gWW91IHNob3VsZCBmaWd1cmUgb3V0IHdoZXRoZXIgeW91IGNhbiBnZXQgaW50
byB2bXhfc3RhcnRfcmVleGVjdXRlCj4gd2l0aG91dCBob2xkaW5nIGFueSBsb2Nrcywgb3IgYWx0
ZXJuYXRpdmVseSBkcm9wIHRoZSBsb2NrLCBwYXVzZSB0aGUKPiB2Q1BVcyBhbmQgcGljayB0aGUg
bG9jayBhZ2Fpbi4KPiAKPiBTZWUgZm9yIGV4YW1wbGUgaG93IGhhcF90cmFja19kaXJ0eV92cmFt
IHJlbGVhc2VzIHRoZSBsb2NrIGJlZm9yZQo+IGF0dGVtcHRpbmcgdG8gcGF1c2UgdGhlIGRvbWFp
biBmb3IgdGhpcyBzYW1lIHJlYXNvbi4KClJpZ2h0LCB0aGlzIHdpbGwgdGFrZSBtb3JlIHRoaW5r
aW5nLgoKSSd2ZSB1bmxvY2tlZCB0aGUgcDJtIGZvciB0ZXN0aW5nIGFuZCB0aGUgaW5pdGlhbCBo
YW5nIGlzIGdvbmUsIGhvd2V2ZXIKdGhlIHNhbWUgcHJvYmxlbSBub3cgYXBwbGllcyB0byByZXhl
Y19sb2NrOiBub3RoaW5nIHByZXZlbnRzIHR3byBvciBtb3JlClZDUFVzIGZyb20gYXJyaXZpbmcg
aW4gdm14X3N0YXJ0X3JlZXhlY3V0ZV9pbnN0cnVjdGlvbigpIHNpbXVsdGFuZW91c2x5LAphdCB3
aGljaCBwb2ludCBvbmUgb2YgdGhlbSBtaWdodCB0YWtlIHRoZSBsb2NrIGFuZCB0cnkgdG8gcGF1
c2UgdGhlCm90aGVyLCB3aGlsZSB0aGUgb3RoZXIgaXMgd2FpdGluZyB0byB0YWtlIHRoZSBsb2Nr
LCB3aXRoIHByZWRpY3RhYmxlCnJlc3VsdHMuCgpPbiB0aGUgb3RoZXIgaGFuZCwgcmVsZWFzaW5n
IHJleGVjX2xvY2sgYXMgd2VsbCB3aWxsIGFsbG93IHR3byBWQ1BVcyB0bwplbmQgdXAgdHJ5aW5n
IHRvIHBhdXNlIGVhY2ggb3RoZXIgKGVzcGVjaWFsbHkgdW5wbGVhc2FudCBpbiBhIDIgVkNQVQpn
dWVzdCkuIEF0IGFueSBnaXZlbiBtb21lbnQsIHRoZXJlIHNob3VsZCBiZSBvbmx5IG9uZSBWQ1BV
IGFsaXZlIGFuZAp0cnlpbmcgdG8gcmVleGVjdXRlIGFuIGluc3RydWN0aW9uIC0gYW5kIGF0IGxl
YXN0IG9uZSBWQ1BVIGFsaXZlIG9uIHRoZQpndWVzdC4KCldlJ2xsIGdldCBtb3JlIGNvZmZlZSwg
YW5kIG9mIGNvdXJzZSBzdWdnZXN0aW9ucyBhcmUgYXBwcmVjaWF0ZWQgKGFzIGhhcwpiZWVuIGFs
bCB5b3VyIGhlbHApLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
