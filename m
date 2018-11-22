From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 22 Nov 2018 18:08:01 +0100
Message-ID: <20181122170801.pzdoif2g73aamnmu@mac>
References: <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
 <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mihh=ob=citrix.com=prvs=8571d395d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPsTf-0000ap-4c
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 17:09:19 +0000
Content-Disposition: inline
In-Reply-To: <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDY6NTI6MDdQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDExLzIyLzE4IDU6MzcgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
PiBJIGRvbid0IHRoaW5rIHlvdSBhcmUgc3VwcG9zZWQgdG8gdHJ5IHRvIHBhdXNlIG90aGVyIHZj
cHVzIHdoaWxlCj4gPiBob2xkaW5nIGEgbG9jaywgYXMgeW91IGNhbiBzZWUgaXQncyBxdWl0ZSBs
aWtlbHkgdGhhdCB5b3Ugd2lsbCBlbmQgdXAKPiA+IGRlYWRsb2NraW5nIGJlY2F1c2UgdGhlIHZD
UFUgeW91IGFyZSB0cnlpbmcgdG8gcGF1c2UgaXMgc3R1Y2sgd2FpdGluZwo+ID4gb24gdGhlIGxv
Y2sgdGhhdCB5b3UgYXJlIGhvbGRpbmcuCj4gPiAKPiA+IFlvdSBzaG91bGQgZmlndXJlIG91dCB3
aGV0aGVyIHlvdSBjYW4gZ2V0IGludG8gdm14X3N0YXJ0X3JlZXhlY3V0ZQo+ID4gd2l0aG91dCBo
b2xkaW5nIGFueSBsb2Nrcywgb3IgYWx0ZXJuYXRpdmVseSBkcm9wIHRoZSBsb2NrLCBwYXVzZSB0
aGUKPiA+IHZDUFVzIGFuZCBwaWNrIHRoZSBsb2NrIGFnYWluLgo+ID4gCj4gPiBTZWUgZm9yIGV4
YW1wbGUgaG93IGhhcF90cmFja19kaXJ0eV92cmFtIHJlbGVhc2VzIHRoZSBsb2NrIGJlZm9yZQo+
ID4gYXR0ZW1wdGluZyB0byBwYXVzZSB0aGUgZG9tYWluIGZvciB0aGlzIHNhbWUgcmVhc29uLgo+
IAo+IFJpZ2h0LCB0aGlzIHdpbGwgdGFrZSBtb3JlIHRoaW5raW5nLgo+IAo+IEkndmUgdW5sb2Nr
ZWQgdGhlIHAybSBmb3IgdGVzdGluZyBhbmQgdGhlIGluaXRpYWwgaGFuZyBpcyBnb25lLCBob3dl
dmVyCj4gdGhlIHNhbWUgcHJvYmxlbSBub3cgYXBwbGllcyB0byByZXhlY19sb2NrOiBub3RoaW5n
IHByZXZlbnRzIHR3byBvciBtb3JlCj4gVkNQVXMgZnJvbSBhcnJpdmluZyBpbiB2bXhfc3RhcnRf
cmVleGVjdXRlX2luc3RydWN0aW9uKCkgc2ltdWx0YW5lb3VzbHksCj4gYXQgd2hpY2ggcG9pbnQg
b25lIG9mIHRoZW0gbWlnaHQgdGFrZSB0aGUgbG9jayBhbmQgdHJ5IHRvIHBhdXNlIHRoZQo+IG90
aGVyLCB3aGlsZSB0aGUgb3RoZXIgaXMgd2FpdGluZyB0byB0YWtlIHRoZSBsb2NrLCB3aXRoIHBy
ZWRpY3RhYmxlCj4gcmVzdWx0cy4KPiAKPiBPbiB0aGUgb3RoZXIgaGFuZCwgcmVsZWFzaW5nIHJl
eGVjX2xvY2sgYXMgd2VsbCB3aWxsIGFsbG93IHR3byBWQ1BVcyB0bwo+IGVuZCB1cCB0cnlpbmcg
dG8gcGF1c2UgZWFjaCBvdGhlciAoZXNwZWNpYWxseSB1bnBsZWFzYW50IGluIGEgMiBWQ1BVCj4g
Z3Vlc3QpLiBBdCBhbnkgZ2l2ZW4gbW9tZW50LCB0aGVyZSBzaG91bGQgYmUgb25seSBvbmUgVkNQ
VSBhbGl2ZSBhbmQKPiB0cnlpbmcgdG8gcmVleGVjdXRlIGFuIGluc3RydWN0aW9uIC0gYW5kIGF0
IGxlYXN0IG9uZSBWQ1BVIGFsaXZlIG9uIHRoZQo+IGd1ZXN0Lgo+IAo+IFdlJ2xsIGdldCBtb3Jl
IGNvZmZlZSwgYW5kIG9mIGNvdXJzZSBzdWdnZXN0aW9ucyBhcmUgYXBwcmVjaWF0ZWQgKGFzIGhh
cwo+IGJlZW4gYWxsIHlvdXIgaGVscCkuCgpIbSwgSSBkb24ndCB0aGluayBpdCdzIGdlbmVyYWxs
eSBzYWZlIHRvIHRyeSB0byBwYXVzZSBkb21haW4gdkNQVXMKZnJvbSB0aGUgc2FtZSBkb21haW4g
Y29udGV4dCwgYXMgeW91IHNheSBpdCdzIGxpa2VseSB0byBkZWFkbG9jayBzaW5jZQp0d28gdkNQ
VXMgZnJvbSB0aGUgc2FtZSBkb21haW4gbWlnaHQgdHJ5IHRvIHBhdXNlIG9uZSBhbm90aGVyLgoK
TXkga25vd2xlZGdlIG9mIGFsbCB0aGlzIGludHJvc3BlY3Rpb24gbG9naWMgaXMgdmVyeSB2YWd1
ZSwgZG8geW91CnJlYWxseSBuZWVkIHRvIHN0b3AgdGhlIG90aGVyIHZDUFVzIHdoaWxlIHBlcmZv
cm1pbmcgdGhpcyByZWV4ZWN1dGlvbj8KCldoYXQgYXJlIHlvdSB0cnlpbmcgdG8gcHJldmVudCBi
eSBwYXVzaW5nIG90aGVyIHZDUFVzPwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
