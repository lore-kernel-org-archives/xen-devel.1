From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 01/13] x86: reduce general stack
 alignment to 8
Date: Mon, 3 Dec 2018 11:29:07 +0000
Message-ID: <20181203112907.ryo47xw52zyeuhmp@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BE45CB602000078001F9C6A@prv1-mh.provo.novell.com>
 <5BE45ED902000078001F9C96@prv1-mh.provo.novell.com>
 <20181129174458.3ovvxhuaruo2bzws@zion.uk.xensource.com>
 <5C00FCE10200007800201772@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xmbd=om=citrix.com=prvs=868792d82=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gTmPc-0002an-7F
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 11:29:16 +0000
Content-Disposition: inline
In-Reply-To: <5C00FCE10200007800201772@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMDI6MDM6MjlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjExLjE4IGF0IDE4OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUaHUsIE5vdiAwOCwgMjAxOCBhdCAwOTowNTo0NUFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvZWZpL01ha2VmaWxlCj4gPj4gKysr
IGIveGVuL2FyY2gveDg2L2VmaS9NYWtlZmlsZQo+ID4+IEBAIC01LDcgKzUsMTEgQEAgQ0ZMQUdT
ICs9IC1mc2hvcnQtd2NoYXIKPiA+PiAgCj4gPj4gIGJvb3QuaW5pdC5vOiBidWlsZGlkLm8KPiA+
PiAgCj4gPj4gK0VGSU9CSiA6PSBib290LmluaXQubyBjb21wYXQubyBydW50aW1lLm8KPiA+PiAr
Cj4gPj4gKyQoRUZJT0JKKTogQ0ZMQUdTLXN0YWNrLWJvdW5kYXJ5IDo9IC1tcHJlZmVycmVkLXN0
YWNrLWJvdW5kYXJ5PTQKPiA+IAo+ID4gRnJvbSBnY2MncyBtYW51YWwgb24gLW1pbmNvbWluZy1z
dGFjay1ib3VuZGFyeToKPiA+IAo+ID4gIlRodXMgY2FsbGluZyBhIGZ1bmN0aW9uIGNvbXBpbGVk
IHdpdGggYSBoaWdoZXIgcHJlZmVycmVkIHN0YWNrIGJvdW5kYXJ5Cj4gPiBmcm9tIGEgZnVuY3Rp
b24gY29tcGlsZWQgd2l0aCBhIGxvd2VyIHByZWZlcnJlZCBzdGFjayBib3VuZGFyeSBtb3N0Cj4g
PiBsaWtlbHkgbWlzYWxpZ25zIHRoZSBzdGFjay4iIAo+ID4gCj4gPiBJIG5vdGljZSBydW50aW1l
Lm8gbm93IGhhcyBzdGFjayBhbGlnbm1lbnQgb2YgMl40IHdoaWxlIHRoZSByZXN0IG9mIHhlbgo+
ID4gaGFzIDJeMy4KPiA+IAo+ID4gVGhlcmUgaXMgYXQgbGVhc3Qgb25lIGV4YW1wbGUgKGVmaV9n
ZXRfdGltZSkgdGhhdCBjb3VsZCBtaXNhbGlnbiB0aGUKPiA+IHN0YWNrLiBJcyB0aGF0IG9rYXk/
Cj4gCj4gSXQgd291bGQgbm90IGJlIG9rYXkgaWYgdGhlIHJ1bnRpbWUgY2FsbCBtYWNoaW5lcnkg
d291bGRuJ3QgZm9yY2UKPiAzMi1ieXRlIGFsaWdubWVudCBvZiB0aGUgc3RhY2suIFNlZSB0aGUg
ZGVjbGFyYXRpb24gb2Ygc3RydWN0Cj4gZWZpX3JzX3N0YXRlLCBhbiBpbnN0YW5jZSBvZiB3aGlj
aCBnZXRzIHB1dCBvbiB0aGUgc3RhY2sgb2YgZXZlcnkKPiBmdW5jdGlvbiBtYWtpbmcgcnVudGlt
ZSBjYWxscy4gQWxzbyBub3RlIGhvdyB0aGlzIGlzIG5vIGRpZmZlcmVudAo+IGZyb20gcHJpb3Ig
dG8gdGhpcyBjaGFuZ2UsIGFzIGV4cGxhaW5lZCBieSB0aGUgY29tbWVudCBpbiB0aGF0Cj4gc3Ry
dWN0dXJlIGRlY2xhcmF0aW9uLCBleGNlcHQgdGhhdCBpbnN0ZWFkIG9mIGFsd2F5cyBydW5uaW5n
IG9uCj4gYSByZWxpYWJseSBtaXMtYWxpZ25lZCBzdGFjayB3ZSB3aWxsIG5vdyBydW4gb24gYSBt
aXh0dXJlIChoZW5jZQo+IHRoZSBjb2RlIFthbmQgc3RhY2tdIHNpemUgc2F2aW5ncyBtZW50aW9u
ZWQgaW4gdGhlIGRlc2NyaXB0aW9uKS4KCk9LLgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
