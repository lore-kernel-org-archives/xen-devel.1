From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 17:07:48 +0100
Message-ID: <20181122160748.lcvry74jirfobb7x@mac>
References: <20181122120327.66403-1-roger.pau@citrix.com>
 <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
 <6fde305e-7f47-2577-d795-0291e2adc137@arm.com>
 <5BF6AEB602000078001FEE5D@prv1-mh.provo.novell.com>
 <9cd10d0c-8c1a-0c1f-39a1-c3a2bbd1d734@citrix.com>
 <5BF6B0F502000078001FEE76@prv1-mh.provo.novell.com>
 <cb727842-018a-0181-9788-e3f1b8dd28b8@arm.com>
 <20181122152002.piljxsuytliraxhk@mac>
 <4775d924-8d59-e9e8-0c76-2937aa9581b0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mIHh=OB=citrix.com=prvs=8571d395d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPrWI-0002df-0f
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 16:07:58 +0000
Content-Disposition: inline
In-Reply-To: <4775d924-8d59-e9e8-0c76-2937aa9581b0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDM6MjM6NDFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMi8xMS8yMDE4IDE1OjIwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDI6MDM6NTVQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ID4+IEhpIEphbiwKPiA+Pgo+ID4+IE9uIDExLzIyLzE4IDE6MzYgUE0sIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4+Pj4+PiBPbiAyMi4xMS4xOCBhdCAxNDozMSwgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+Pj4gSSB0aGluayBKdWxpZW4ncyBwb2ludCBpcyB0aGF0
IHdpdGhvdXQgZXhwbGljaXRseSBiYXJyaWVycywgQ1BVMCdzCj4gPj4+PiB1cGRhdGUgdG8gc3lz
dGVtX3N0YXRlIG1heSBub3QgYmUgdmlzaWJsZSBvbiBDUFUxLCBldmVuIHRob3VnaCB0aGUKPiA+
Pj4+IG1hcHBpbmdzIGhhdmUgYmVlbiBzaG90IGRvd24uCj4gPj4+Pgo+ID4+Pj4gVGhlcmVmb3Jl
LCBmcm9tIHRoZSBwcm9jZXNzb3JzIHBvaW50IG9mIHZpZXcsIGl0IGRpZCBldmVyeXRoaW5nCj4g
Pj4+PiBjb3JyZWN0bHksIGFuZCBoaXQgYSByZWFsIHBhZ2VmYXVsdC4KPiA+Pj4gQm9vdCB0aW1l
IHVwZGF0ZXMgb2Ygc3lzdGVtX3N0YXRlIHNob3VsZCBiZSBvZiBubyBpbnRlcmVzdCBoZXJlLAo+
ID4+PiBhcyBhdCB0aGF0IHRpbWUgdGhlIEFQcyBhcmUgYWxsIGlkbGluZy4KPiA+PiBUaGF0J3Mg
cHJvYmFibHkgdHJ1ZSB0b2RheS4gQnV0IHRoaXMgY29kZSBsb29rcyByYXRoZXIgZnJhZ2lsZSBh
cyB5b3UgZG9uJ3QKPiA+PiBrbm93IGhvdyB0aGlzIGlzIGdvaW5nIHRvIGJlIHVzZWQgaW4gdGhl
IGZ1dHVyZS4KPiA+Pgo+ID4+IElmIHlvdSBkZWNpZGUgdG8gZ2F0ZSBpbml0IGNvZGUgd2l0aCBz
eXN0ZW1fc3RhdGUsIHRoZW4geW91IG5lZWQgYSBiYXJyaWVyCj4gPj4gdG8gZW5zdXJlIHRoZSBj
b2RlIGlzIGZ1dHVyZSBwcm9vZi4KPiA+IFdvdWxkbid0IGl0IGJlIGVub3VnaCB0byBkZWNsYXJl
IHN5c3RlbV9zdGF0ZSBhcyB2b2xhdGlsZT8KPiAKPiBOby7CoCB2b2xhdGlsaXR5IChvciBsYWNr
IHRoZXJlb2YpIGlzIGEgY29tcGlsZXIgbGV2ZWwgY29uc3RydWN0Lgo+IAo+IEFSTSBoYXMgd2Vh
a2VyIGNhY2hlIGNvaGVyZW5jeSB0aGFuIHg4Niwgc28gYSB3cml0ZSB3aGljaCBoYXMgY29tcGxl
dGVkCj4gb24gb25lIENQVTAgaW4gdGhlIHBhc3QgbWF5IGxlZ2l0aW1hdGVseSBub3QgYmUgdmlz
aWJsZSBvbiBDUFUxIHlldC4KPiAKPiBJZiB5b3UgbmVlZCBndWFyYW50ZWVzIGFib3V0IHRoZSB2
aXNpYmlsaXR5IG9mIHVwZGF0ZWQsIHlvdSBtdXN0IHVzZQo+IGFwcHJvcHJpYXRlIGJhcnJpZXJz
LgoKUmlnaHQuIFRoZXJlJ3Mgc29tZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIEFSTSBhbmQgeDg2LCBB
Uk0gc2V0cwpTWVNfU1RBVEVfYWN0aXZlIGFuZCBjb250aW51ZXMgdG8gbWFrZSB1c2Ugb2YgaW5p
dCBmdW5jdGlvbnMuIEluIGFueQpjYXNlIEkgaGF2ZSB0aGUgZm9sbG93aW5nIGRpZmY6CgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRl
eCBlODMyMjFhYjc5Li5jZjUwZDA1NjIwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAu
YworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtOTY2LDYgKzk2Niw3IEBAIHZvaWQgX19p
bml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCiAgICAgc2VyaWFs
X2VuZGJvb3QoKTsKIAogICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3RpdmU7CisgICAg
c21wX3dtYigpOwogCiAgICAgY3JlYXRlX2RvbVVzKCk7CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggOWNiZmYyMmZiMy4uNDEw
NDRjMGI2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gv
eDg2L3NldHVwLmMKQEAgLTU5Myw2ICs1OTMsNyBAQCBzdGF0aWMgdm9pZCBub2lubGluZSBpbml0
X2RvbmUodm9pZCkKICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQ7CiAKICAgICBzeXN0ZW1f
c3RhdGUgPSBTWVNfU1RBVEVfYWN0aXZlOworICAgIHNtcF93bWIoKTsKIAogICAgIGRvbWFpbl91
bnBhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIoZG9tMCk7CiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
