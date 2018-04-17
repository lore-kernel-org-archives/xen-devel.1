From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/7] introduce time managment in xtf
Date: Tue, 17 Apr 2018 08:45:47 +0100
Message-ID: <20180417074547.h427ygrzgazlofb4@MacBook-Pro-de-Roger.local>
References: <20180410191701.17203-1-semelpaul@gmail.com>
 <20180413120515.nc5ukqnmyj232xcr@MacBook-Pro-de-Roger.local>
 <455a1cc0-1e74-0e72-aaa3-d6df2ec027d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/k2m=hg=citrix.com=prvs=63841d76d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f8LJL-0003nU-W9
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 07:45:56 +0000
Content-Disposition: inline
In-Reply-To: <455a1cc0-1e74-0e72-aaa3-d6df2ec027d6@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMTI6NDg6NDlQTSArMDIwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiBPbiAwNC8xMy8yMDE4IDAyOjA1IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
PiArc3RhdGljIGlubGluZSB1aW50NjRfdCBzY2FsZV9kZWx0YSh1aW50NjRfdCBkZWx0YSwgdWlu
dDMyX3QgbXVsX2ZyYWMsIGludCBzaGlmdCkKPiA+ID4gK3sKPiA+ID4gKyAgICB1aW50NjRfdCBw
cm9kdWN0Owo+ID4gPiArI2lmZGVmIF9faTM4Nl9fCj4gPiA+ICsgICAgdWludDMyX3QgdG1wMSwg
dG1wMjsKPiA+ID4gKyNlbmRpZgo+ID4gPiArCj4gPiA+ICsgICAgaWYgKCBzaGlmdCA8IDAgKQo+
ID4gPiArICAgICAgICBkZWx0YSA+Pj0gLXNoaWZ0Owo+ID4gPiArICAgIGVsc2UKPiA+ID4gKyAg
ICAgICAgZGVsdGEgPDw9IHNoaWZ0Owo+ID4gPiArCj4gPiA+ICsjaWZkZWYgX19pMzg2X18KPiA+
ID4gKyAgICBfX2FzbV9fICgKPiA+ID4gKyAgICAgICAgICAgICJtdWwgICU1ICAgICAgIDsgIgo+
ID4gPiArICAgICAgICAgICAgIm1vdiAgJTQsJSVlYXggOyAiCj4gPiA+ICsgICAgICAgICAgICAi
bW92ICAlJWVkeCwlNCA7ICIKPiA+ID4gKyAgICAgICAgICAgICJtdWwgICU1ICAgICAgIDsgIgo+
ID4gPiArICAgICAgICAgICAgImFkZCAgJTQsJSVlYXggOyAiCj4gPiA+ICsgICAgICAgICAgICAi
eG9yICAlNSwlNSAgICA7ICIKPiA+ID4gKyAgICAgICAgICAgICJhZGMgICU1LCUlZWR4IDsgIgo+
ID4gPiArICAgICAgICAgICAgOiAiPUEiIChwcm9kdWN0KSwgIj1yIiAodG1wMSksICI9ciIgKHRt
cDIpCj4gPiA+ICsgICAgICAgICAgICA6ICJhIiAoKHVpbnQzMl90KWRlbHRhKSwgIjEiICgodWlu
dDMyX3QpKGRlbHRhID4+IDMyKSksICIyIiAobXVsX2ZyYWMpICk7Cj4gPiAKPiA+IFRoaXMgbGlu
ZSBpcyB0b28gbG9uZy4KPiA+IAo+ID4gPiArI2Vsc2UKPiA+ID4gKyAgICBfX2FzbV9fICgKPiA+
ID4gKyAgICAgICAgICAgICJtdWwgJSVyZHggOyBzaHJkICQzMiwlJXJkeCwlJXJheCIKPiA+ID4g
KyAgICAgICAgICAgIDogIj1hIiAocHJvZHVjdCkgOiAiMCIgKGRlbHRhKSwgImQiICgodWludDY0
X3QpbXVsX2ZyYWMpICk7Cj4gPiAKPiA+IE5vdCBzdXJlIHdoZXRoZXIgeW91IG5lZWQgdG8gYWRk
IGEgJzogImQiJyBjbG9iYmVyIGhlcmUsIHNpbmNlIHRoZSBkCj4gPiByZWdpc3RlciBpcyB1c2Vk
IGJ1dCBpdCdzIG5vdCBpbiB0aGUgbGlzdCBvZiBvdXRwdXQgb3BlcmFuZHMuCj4gPiAKPiA+ID4g
KyNlbmRpZgo+ID4gPiArCj4gPiA+ICsgICAgcmV0dXJuIHByb2R1Y3Q7Cj4gPiA+ICt9Cj4gPiA+
ICsKPiAKPiBBY3R1YWxseSwgSSdtIG5vdCBzdXJlIHRoYXQgSSBoYXZlIHRvIG1ha2UgdGhhdCBt
dWNoIGNoYW5nZXMgdG8gdGhpcwo+IGZ1bmN0aW9uLCBhcyBAQW5kcmV3IHdhbnRlZCB0byB1c2Ug
YW5vdGhlciB2ZXJzaW9uIG9mIGl0IGFzIGZhciBhcyBJIHJlY2FsbC4KCklNTyBpZiB0aGVyZSBh
cmUga25vd24gaXNzdWVzIHdpdGggdGhpcyBmdW5jdGlvbiB0aGV5IG5lZWQgdG8gYmUKc29ydGVk
IG91dCBiZWZvcmUgY29tbWl0dGluZy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
