From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
Date: Wed, 15 May 2019 12:59:11 +0100
Message-ID: <dc1c824e-2503-5e1b-f178-ff3ce9dada36@citrix.com>
References: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
 <ecde9471-17e5-61b8-1c61-67cac1d54fc4@citrix.com>
 <5CDBFD12020000780022F37C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQsZ3-0005fR-UI
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 11:59:17 +0000
In-Reply-To: <5CDBFD12020000780022F37C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDUvMjAxOSAxMjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMDUuMTkg
YXQgMTI6MTcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDUv
MjAxOSAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRl
L3g4Nl9lbXVsYXRlLmMKPj4+IEBAIC02NjI0LDYgKzY2MjQsOCBAQCB4ODZfZW11bGF0ZSgKPj4+
ICAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmMyk6IC8qIHZwc2xscSB4bW0v
bTEyOCx7eCx5fW1tLHt4LHl9bW0gKi8KPj4+ICAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBm
LCAweGY0KTogICAgIC8qIHBtdWx1ZHEgeG1tL20xMjgseG1tICovCj4+PiAgICAgIGNhc2UgWDg2
RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjQpOiAvKiB2cG11bHVkcSB7eCx5fW1tL21lbSx7eCx5
fW1tLHt4LHl9bW0gKi8KPj4+ICsgICAgQ0FTRV9TSU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhmNSk6
ICAgIC8qIHBtYWRkd2Qgeyx4fW1tL21lbSx7LHh9bW0gKi8KPj4+ICsgICAgY2FzZSBYODZFTVVM
X09QQ19WRVhfNjYoMHgwZiwgMHhmNSk6IC8qIHZwbWFkZHdkIHt4LHl9bW0vbWVtLHt4LHl9bW0s
e3gseX1tbSAqLwo+PiBOb3RoaW5nIG9uIHRoaXMgcGF0aCBjaGVja3MgZm9yIFNTU0UzLCBBRkFJ
Q1QuCj4gT2YgY291cnNlIG5vdCAtIHRoZSBpbnNuIGZpcnN0IGdvdCBpbnRyb2R1Y2VkIHdpdGgg
TU1YLCB0aGVuCj4gcHJvbW90ZWQgd2l0aCBTU0UyIGFuZCBhZ2FpbiB3aXRoIEFWWCBhbmQgQVZY
Mi4KCk9oIC0gdGVycmlibHkgc29ycnkgLSBJIHdhcyByZWFkaW5nIHRoZSBhZGphY2VudCBpbnN0
cnVjdGlvbiBpbiB0aGUgbWFudWFsLgoKU29ycnkgZm9yIHRoZSBub2lzZS4KClJldmlld2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
