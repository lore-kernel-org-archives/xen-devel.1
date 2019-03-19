From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 01/14] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Tue, 19 Mar 2019 07:02:44 -0600
Message-ID: <5C90E874020000780022042D@prv1-mh.provo.novell.com>
References: <cover.1550647742.git.puwen@hygon.cn>
 <026111a83e9d83902bc2acee243858a21ecec304.1550647742.git.puwen@hygon.cn>
 <5C8A8B20020000780021ED49@prv1-mh.provo.novell.com>
 <586d7224-ed81-b623-35c8-4280bcbcfc5f@hygon.cn>
 <5C8B89E7020000780021F38A@prv1-mh.provo.novell.com>
 <f723e493-e986-432e-0b4a-e175f0df41c7@hygon.cn>
 <5C8F5CD4020000780021FB77@prv1-mh.provo.novell.com>
 <a50e99fa-af43-1c2b-3c31-59d8ede22d3b@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6EOI-0007SB-6m
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:02:50 +0000
In-Reply-To: <a50e99fa-af43-1c2b-3c31-59d8ede22d3b@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE5IGF0IDEzOjMzLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8xOCAxNjo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE2LjAzLjE5IGF0IDEwOjU3
LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gT24gMjAxOS8zLzE1IDE5OjE4LCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+PiBPbiAxNS4wMy4xOSBhdCAxMToxNywgPHB1d2VuQGh5Z29uLmNuPiB3
cm90ZToKPj4+Pj4gT24gMjAxOS8zLzE1IDE6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4g
VGhpcyBpcyBhIGxvdCBvZiBkdXBsaWNhdGVkIGNvZGUgd2l0aCBvbmx5IG1pbm9yIGRpZmZlcmVu
Y2VzLiBJIHRoaW5rCj4+Pj4+PiB5b3Ugd291bGQgYmUgYmV0dGVyIG9mZiBjYWxsaW5nIGludG8g
dGhlIEFNRCBvcmlnaW5hbCBmdW5jdGlvbnMuCj4+Pj4+IFRoZXNlIGZ1bmN0aW9ucyBhbmQgQU1E
IG9yaWdpbmFsIG9uZXMgYXJlIHN0YXRpYy4gU28gSHlnb24gY2Fubm90IGRpcmVjdGx5Cj4+Pj4+
IGNhbGwgaW50byB0aGVtLiBPciB3ZSBjYW4gcHV0IHRoZW0gaW50byB0aGUgY29tbW9uIGNwdSBj
b2RlLCBidXQgSSB0aGluawo+Pj4+PiBpdCdzIG5vdCBnb29kIGZvciBmdXR1cmUgbWFpbnRlbmFu
Y2UuCj4+Pj4gSnVzdCBtYWtlIG5vbi1zdGF0aWMgd2hhdCBuZWVkcyB0byBiZSwgYWRkIGFuIGFt
ZF8gcHJlZml4LCBhbmQKPj4+PiBjYWxsIGl0IGZyb20geW91ciBjb2RlLgo+Pj4gVGhhdCdzIE9L
LiBXaXRoIHRoaXMgbWV0aG9kIG9ubHkgaW5pdF9sZXZlbGxpbmcgaW4gYW1kLmMgc2hvdWxkIGJl
IGFkZGVkCj4+PiBhbiBhbWRfIHByZWZpeCBhbmQgY2FsbGVkIGJ5IGh5Z29uLmMuCj4+PiBCdXQg
SSdtIGFmcmFpZCBIeWdvbiBzaG91bGQgaGF2ZSBpdHMgb3duIGluaXQgZnVuY3Rpb25zIGFuZCBu
b3QgY2FsbCB0aGUKPj4+IEFNRCBvbmVzLiBUaGUgY3VycmVudCBIeWdvbiBpbml0IGZ1bmN0aW9u
cyBoYXZlIGJlZW4gaGVhdmlseSBzdHJpcHBlZAo+Pj4gZnJvbSB0aGUgb3JpZ2luYWwgQU1EJ3Mu
Cj4+IExldCBtZSBnaXZlIHlvdSB0aGlzIHJ1bGUgb2YgdGh1bWIgKHN1YmplY3QgdG8gZGlzY3Vz
c2lvbik6IElmIHlvdSBjYW4KPj4gc2FmZWx5IHJlLXVzZSBhbnkgbm9uLXRyaXZpYWwgY3VycmVu
dCBBTUQgZnVuY3Rpb24gd2l0aCBhdCBtb3N0IG1pbm9yCj4+IGFkanVzdG1lbnRzIChhbmQgaXJy
ZXNwZWN0aXZlIG9mIGNlcnRhaW4gY29kZSB0aGVyZSBiZWluZyB1bnJlYWNoYWJsZQo+PiBvbiBI
eWdvbiksIHRoZW4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcmUtdXNlIGl0IHRoYW4g
dG8gZHVwbGljYXRlCj4+IGl0Lgo+IAo+IEkgdHJpZWQsIGJ1dCBpdCB3aWxsIGFkZCAweDE4IHRv
IGluaXRfYW1kKCkuIEl0J3Mgc3RyYW5nZSBiZWNhdXNlIEFNRAo+IGRvZXMgbm90IGhhdmUgZmFt
aWx5IDE4aCBub3cuIFNvIGl0IGJlY29tZXMgdW53aWVsZHkgdG8gbWFpbnRhaW4KPiBpbml0X2Ft
ZCgpIGp1c3QgYXQgdGhpcyB0aW1lLiBUaGUgc2FtZSBzaXR1YXRpb24gZm9yIGFtZF9nZXRfdG9w
b2xvZ3koKS4KPiAKPiBTbyBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGNhcnZlIG91dCBpbml0X2h5
Z29uKCkgYW5kIGh5Z29uX2dldF90b3BvbG9neSgpCj4gKHdoaWNoIGFsc28gbmVlZCBIeWdvbidz
IG93biBhZGp1c3RtZW50IGZvciBjb21wdXRpbmcgcGh5c19wcm9jX2lkKS4KCkp1c3QgdG8gYmUg
Y2xlYXI6IEkndmUgbmV2ZXIgb2JqZWN0ZWQgdG8gYSBzZXBhcmF0ZSBpbml0X2h5Z29uKCkuCkZv
ciBhbWRfZ2V0X3RvcG9sb2d5KCkgaXQncyBsZXNzIGNsZWFyOiBJdCBsb29rcyB0byBtZSBhcyBp
ZiB5b3UKd291bGRuJ3QgbmVlZCB0byBhZGQgYW55IEh5Z29uIGNvbmRpdGlvbmFscyB0byB0aGUg
ZnVuY3Rpb24sIGFzCmxvbmcgYXMgY3B1X2hhcyhjLCBYODZfRkVBVFVSRV9UT1BPRVhUKSBpcyB0
cnVlIGluIHlvdXIgY2FzZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
