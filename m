From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: suppress general register update
 upon AVX gather failures
Date: Mon, 1 Apr 2019 17:11:55 +0100
Message-ID: <fa22536d-d5fe-ccd2-cb85-804414ce3d11@citrix.com>
References: <5C9DE7E40200007800222BA7@prv1-mh.provo.novell.com>
 <6715048e-a509-ec71-dbca-10735f872326@citrix.com>
 <5CA22A4F0200007800223B0F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSOb=SD=citrix.com=prvs=987a6ddbb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hAzeN-0000AT-Pb
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 16:19:07 +0000
In-Reply-To: <5CA22A4F0200007800223B0F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxNjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDQuMTkg
YXQgMTY6MDQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjkvMDMv
MjAxOSAwOTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2
X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRl
L3g4Nl9lbXVsYXRlLmMKPj4+IEBAIC04NTQ3LDYgKzg1NDcsOSBAQCB4ODZfZW11bGF0ZSgKPj4+
ICAgICAgICAgIGludm9rZV9zdHViKCIiLCAiIiwgIittIiAobWFzaykgOiAiYSIgKCZtYXNrKSk7
Cj4+PiAgICAgICAgICBwdXRfc3R1YihzdHViKTsKPj4+ICAKPj4+ICsgICAgICAgIGlmICggcmMg
IT0gWDg2RU1VTF9PS0FZICkKPj4+ICsgICAgICAgICAgICBnb3RvIGRvbmU7Cj4+IFRoaXMgb2J2
aW91c2x5IGlzIG5lZWRlZCB0byBmaXggdGhlIHByb2JsZW0gYXMgaXQgbWFuaWZlc3RlZCBmb3Ig
R2VvcmdlLAo+PiBidXQgaW4gdGhlIGNhc2UgdGhhdCB3ZSB0YWtlIGEgZmF1bHQvcmV0cnkgb24g
aXRlcmF0aW9uIDAsIHNob3VsZG4ndCB3ZQo+PiBza2lwIHRoZSB3cml0ZWJhY2sgYXMgd2VsbD8K
PiBObywgbm90IHJlYWxseSwgb3IgYXQgbGVhc3Qgbm90IGluIGFsbCBjYXNlczoKPgo+ICJJZiB0
aGUgZGF0YSBzaXplIGFuZCBpbmRleCBzaXplIGFyZSBkaWZmZXJlbnQsIHBhcnQgb2YgdGhlIGRl
c3RpbmF0aW9uCj4gIHJlZ2lzdGVyIGFuZCBwYXJ0IG9mIHRoZSBtYXNrIHJlZ2lzdGVyIGRvIG5v
dCBjb3JyZXNwb25kIHRvIGFueQo+ICBlbGVtZW50cyBiZWluZyBnYXRoZXJlZC4gVGhpcyBpbnN0
cnVjdGlvbiBzZXRzIHRob3NlIHBhcnRzIHRvIHplcm8uIEl0Cj4gIG1heSBkbyB0aGlzIHRvIG9u
ZSBvciBib3RoIG9mIHRob3NlIHJlZ2lzdGVycyBldmVuIGlmIHRoZSBpbnN0cnVjdGlvbgo+ICB0
cmlnZ2VycyBhbiBleGNlcHRpb24sIGFuZCBldmVuIGlmIHRoZSBpbnN0cnVjdGlvbiB0cmlnZ2Vy
cyB0aGUKPiAgZXhjZXB0aW9uIGJlZm9yZSBnYXRoZXJpbmcgYW55IGVsZW1lbnRzLiIKPgo+IEkg
cmVhbGl6ZSB0aGlzIGlzIGFsbCAibWF5IiwgYnV0IGlpcmMgSSBoYWQgdHJpZWQgaXQgb3V0IG9u
IHNvbWUgb2YgdGhlCj4gaGFyZHdhcmUgSSBoYXZlLCBhbmQgaXQgaW5kZWVkIGRpZCBzbyB0aGVy
ZS4KClRoYXQgZG9lcyBvbmx5IHRhbGsgYWJvdXQgdGhlIG1pc21hdGNoZWQgcGFydHMgb2YgdGhl
IHJlZ2lzdGVycywgYnV0IHRoZQpmYWN0IHRoYXQgaXQgZG9lcyBjYWxsIG91dCB0aGUgMCBjYXNl
IGRvZXMgZGVtb25zdHJhdGUgdGhhdCBhIHdyaXRlIG9jY3Vycy4KCldoYXQgSSdkIG1pc3NlZCBp
cyB0aGF0IHRoZSB3cml0ZXMgYXJlIG9ubHkgYWN0dWFsbHkgdG8gcmVnaXN0ZXJzLCBub3QKdG8g
bWVtb3J5LCB3aGljaCBjb21lcyB3aXRoIHRoZSBwb3NzaWJpbGl0eSBvZiBhY2N1bXVsYXRpbmcg
YW4gdW5yZWxhdGVkCmZhdWx0LgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
