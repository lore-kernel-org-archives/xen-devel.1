From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 5/9] xen: Convert hotplug page
 function to use typesafe MFN
Date: Wed, 13 Mar 2019 16:26:02 +0000
Message-ID: <9a12ef09-0058-f082-48f5-df89c4e15866@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-6-julien.grall@arm.com>
 <5C891A56020000780021E327@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h46hj-00037E-Vk
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 16:26:08 +0000
In-Reply-To: <5C891A56020000780021E327@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMy8wMy8yMDE5IDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOC4w
Mi4xOSBhdCAxMjozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gQ29udmVydCBv
bmxpbmVfcGFnZSwgb2ZmbGluZV9wYWdlIGFuZCBxdWVyeV9wYWdlX29mZmxpbmUgdG8gdXNlCj4+
IHR5cGVzYWZlIE1GTi4KPj4KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQnV0IC4uLgo+IAo+PiAtLS0gYS94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+
PiBAQCAtMTU2OCwyMyArMTU2OCwyMyBAQCBzdGF0aWMgaW50IHJlc2VydmVfaGVhcF9wYWdlKHN0
cnVjdCBwYWdlX2luZm8gKnBnKQo+PiAgIAo+PiAgIH0KPj4gICAKPj4gLWludCBvZmZsaW5lX3Bh
Z2UodW5zaWduZWQgbG9uZyBtZm4sIGludCBicm9rZW4sIHVpbnQzMl90ICpzdGF0dXMpCj4+ICtp
bnQgb2ZmbGluZV9wYWdlKG1mbl90IG1mbiwgaW50IGJyb2tlbiwgdWludDMyX3QgKnN0YXR1cykK
Pj4gICB7Cj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgb2xkX2luZm8gPSAwOwo+PiAgICAgICBzdHJ1
Y3QgZG9tYWluICpvd25lcjsKPj4gICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4+ICAgCj4+
IC0gICAgaWYgKCAhbWZuX3ZhbGlkKF9tZm4obWZuKSkgKQo+PiArICAgIGlmICggIW1mbl92YWxp
ZChtZm4pICkKPj4gICAgICAgewo+PiAgICAgICAgICAgZHByaW50ayhYRU5MT0dfV0FSTklORywK
Pj4gLSAgICAgICAgICAgICAgICAidHJ5IHRvIG9mZmxpbmUgcGFnZSBvdXQgb2YgcmFuZ2UgJWx4
XG4iLCBtZm4pOwo+PiArICAgICAgICAgICAgICAgICJ0cnkgdG8gb2ZmbGluZSBwYWdlIG91dCBv
ZiByYW5nZSAlIlBSSV9tZm4iXG4iLCBtZm5feChtZm4pKTsKPiAKPiAuLi4gd291bGQgeW91IG1p
bmQgYWRqdXN0aW5nIHRoZSB3b3JkaW5nIGhlcmUgYXMgd2VsbDoKPiAiYXR0ZW1wdCB0byBvZmZs
aW5lIG91dCBvZiByYW5nZSBwYWdlICUiUFJJX21mbiJcbiIgb3IgPiBzb21lIHN1Y2g/CgpTdXJl
LgoKPiAKPiBPZiBjb3Vyc2UgdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlIG1lc3NhZ2UgYXMgYSB3aG9s
ZSBpcwo+IHF1ZXN0aW9uYWJsZSwgc28gSSdkIGFsc28gYmUgaGFwcHkgdG8gc2VlIGl0IGRlbGV0
ZWQgYWx0b2dldGhlci4KCldoaWxlIEkgYW0gaGFwcHkgdG8gZG8gZm9ybWF0dGluZywgSSB3b3Vs
ZCByYXRoZXIgbGVhdmUgY29kZSByZW1vdmFsIGluIHNlcGFyYXRlIApwYXRjaC4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
