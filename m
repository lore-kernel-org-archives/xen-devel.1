From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Tue, 14 May 2019 17:20:37 +0300
Message-ID: <dd92291e-b5b6-e0d8-ab84-1915f1a23ec0@bitdefender.com>
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
 <20181122170801.pzdoif2g73aamnmu@mac>
 <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <5BF7C36F02000078001FF3E1@prv1-mh.provo.novell.com>
 <cb265527-4a69-01d9-9089-60b4b4fab22a@bitdefender.com>
 <bdd2240b-f1e9-3671-d3a1-996accdbacea@bitdefender.com>
 <5CD97A01020000780022E283@prv1-mh.provo.novell.com>
 <afef10b4-a7e8-acf3-49f6-363cbaf52047@bitdefender.com>
 <345e5e15-6a0a-c1f7-d22f-fe9eb06ed476@bitdefender.com>
 <5CDACDB5020000780022EC35@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TJPZ=TO=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQYIN-000869-D2
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:20:43 +0000
In-Reply-To: <5CDACDB5020000780022EC35@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: aisaila@bitdefender.com, Andrew Cooper <andrew.cooper3@citrix.com>, Andrei LUTAS <vlutas@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA1LzE0LzE5IDU6MTYgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE0LjA1LjE5
IGF0IDE1OjQ3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IE1lbSBldmVu
dCBlbXVsYXRpb24gZmFpbGVkICg1KTogZDV2MCAzMmJpdCBAIDAwMWI6NmQ5NmVmZmYgLT4gYzUg
ZjkgZjUKPj4gMDUgYzAgYmUgYWQgNmQgYzUgZTEgZmUgMWQgYTAgMjAgYWYgNmQKPj4KPj4gTG9v
a2luZyBhdCB0aGUgc291cmNlIGNvZGUsIHRoZSBlbXVsYXRvciBkb2VzIGFwcGVhciB0byBzdXBw
b3J0Cj4+IHZwbWFkZHdkLCBob3dldmVyIG9ubHkgZm9yIEVWRVg6Cj4+Cj4+IGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2FyY2gveDg2L3g4Nl9l
bXVsYXRlL3gKPj4gODZfZW11bGF0ZS5jO2g9MDMyOTk1ZWE1ODZhYTdkZDkwYTE5NTNiNmRlZDY1
NjQzNjY1MjA0OTtoYj1yZWZzL2hlYWRzL3N0YWdpbmcKPj4gI2w2Njk2Cj4+Cj4+IHdoZXJlYXMg
b3VyIGZhaWwgY2FzZSB1c2VzIFZFWC4KPj4KPj4gVGhpcyBtYXkgYmUgaW4gdGhlIHdvcmtzIGlu
IHRoZSBhZm9yZW1lbnRpb25lZCBzZXJpZXMsIGJ1dCBpcwo+PiBsZWdpdGltYXRlbHkgdW5zdXBw
b3J0ZWQgaW4gNC4xMyBzdGFnaW5nLgo+IAo+IEhtbSwgaW50ZXJlc3RpbmcuIFRoZSBvcmlnaW4g
b2YgdGhlIGVuY29kaW5nIGlzIGF0IE1NWCB0aW1lcywKPiB3aGljaCBtZWFucyBpdCdzIG1vcmUg
dGhhbiBqdXN0IFZQTUFERFdEIHRoYXQncyBtaXNzaW5nLCBhbmQKPiBpdCdzIGJlZW4gYW4gb21p
c3Npb24gYmFjayBpbiB0aGUgTU1YL1NTRTIgc2VyaWVzIHRoZW4uIFRoYXQncwo+IGEgZ2VudWlu
ZSBvdmVyc2lnaHQsIGFuZCBpbiB0aGUgbGlnaHQgb2YgdGhpcyBJJ2QgbGlrZSB0byBhcG9sb2dp
emUKPiBmb3IgbXkgdW5mcmllbmRseSBpbml0aWFsIHJlYWN0aW9uLiBJJ2xsIHNlZSBhYm91dCBn
ZXR0aW5nIHRoaXMgZml4ZWQuCj4gKEl0IHdvdWxkIGhhdmUgaGVscGVkIGlmIHlvdSBoYWQgc2hh
cmVkIHRoZSBlbmNvZGluZyByaWdodCBhd2F5LAo+IHNpbmNlIHRoZSBtbmVtb25pYyBhbmQgb3Bl
cmFuZHMgYXJlIG5vdyBvZnRlbiBpbnN1ZmZpY2llbnQuKQoKTm8gcHJvYmxlbSBhdCBhbGwuIElu
ZGVlZCwgc2hhcmluZyB0aGUgZW5jb2Rpbmcgd291bGQgaGF2ZSBjbGVhcmVkIAp0aGluZ3MgdXAg
ZmFzdGVyLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
