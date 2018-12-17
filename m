From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/3] x86/svm: Improve diagnostics when
 svm_get_insn_len() fails
Date: Mon, 17 Dec 2018 09:01:13 -0700
Message-ID: <5C17C8490200007800206DED@prv1-mh.provo.novell.com>
References: <1544732572-29794-1-git-send-email-andrew.cooper3@citrix.com>
 <1544732572-29794-3-git-send-email-andrew.cooper3@citrix.com>
 <5C13831A0200007800206190@prv1-mh.provo.novell.com>
 <023754c3-f2e5-b7ef-9c94-7998524d8d21@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <023754c3-f2e5-b7ef-9c94-7998524d8d21@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjEyLjE4IGF0IDE2OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMTIvMjAxOCAxMDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEz
LjEyLjE4IGF0IDIxOjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vc3ZtL2VtdWxhdGUuYwo+Pj4gQEAgLTE0Myw4ICsxNDMsMTcgQEAgaW50IHN2bV9nZXRf
aW5zbl9sZW4oc3RydWN0IHZjcHUgKnYsIGVudW0gCj4gaW5zdHJ1Y3Rpb25faW5kZXggaW5zbikK
Pj4+ICAgICAgfQo+Pj4gIAo+Pj4gICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywKPj4+IC0g
ICAgICAgICAgICAgIiVzOiBNaXNtYXRjaCBiZXR3ZWVuIGV4cGVjdGVkIGFuZCBhY3R1YWwgaW5z
dHJ1Y3Rpb246ICIKPj4+IC0gICAgICAgICAgICAgImVpcCA9ICVseFxuIiwgIF9fZnVuY19fLCAo
dW5zaWduZWQgbG9uZyl2bWNiLT5yaXApOwo+Pj4gKyAgICAgICAgICAgICAiJXM6IE1pc21hdGNo
IGJldHdlZW4gZXhwZWN0ZWQgYW5kIGFjdHVhbCBpbnN0cnVjdGlvbjpcbiIsCj4+PiArICAgICAg
ICAgICAgIF9fZnVuY19fKTsKPj4gSXMgX19mdW5jX18gcmVhbGx5IHVzZWZ1bCBpbiBhIGdkcHJp
bnRrKCk/Cj4gCj4gV2VsbCAtIHlvdSBhcmUgdGhlIGF1dGhvciBvZiB0aGF0IGNvZGUuLi4KCkkn
dmUgdG91Y2hlZCB0aGUgbmVpZ2hib3JpbmcgbGluZSBhIHdoaWxlIGFnbywgYnV0IEkgZGlkbid0
IGFkZCBfX2Z1bmNfXwooYW5kIEkgaGFyZGx5IGV2ZXIgZG8sIGR1ZSB0byBub3QgZmluZGluZyBp
dCBoZWxwZnVsIGluIHRoZSBjb21tb24gY2FzZSkuCgo+Pj4gKyAgICBnZHByaW50ayhYRU5MT0df
V0FSTklORywKPj4+ICsgICAgICAgICAgICAgIiAgaW5zbl9pbmRleCAlZCwgb3Bjb2RlICUjeCBt
b2RybSAlI3hcbiIsCj4+PiArICAgICAgICAgICAgIGluc24sIG9wY190YWJbaW5zbl0ub3Bjb2Rl
LCAoKG9wY190YWJbaW5zbl0ubW9kcm0ucm0gIDw8IDYpIHwKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAob3BjX3RhYltpbnNuXS5tb2RybS5yZWcgPDwgMykg
fAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChvcGNfdGFi
W2luc25dLm1vZHJtLm1vZCkpKTsKPj4gVGhpcyBpcyBnb2luZyB0byBiZSBtaXNsZWFkaW5nIHdo
ZW4gYml0IDMgb2YgbW9kcm0ucmVnIG9yIG1vZHJtLnJtCj4+IGFyZSBzZXQuCj4gCj4gSSdsbCBz
d2l0Y2ggdG8gMHglMDJ4CgpIb3cncyB0aGF0IGdvaW5nIHRvIGhlbHA/IFlvdSdkIG5lZWQgdG8g
cHJpbnQgdGhlIGZpZWxkcyBpbmRpdmlkdWFsbHkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
