From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/6] x86/XPTI: reduce .text.entry
Date: Fri, 16 Mar 2018 01:10:00 -0600
Message-ID: <5AAB7BD802000078001B2929@prv-mh.provo.novell.com>
References: <5AA7E24402000078001B0F41@prv-mh.provo.novell.com>
 <5AA7E52402000078001B0F5C@prv-mh.provo.novell.com>
 <e1cf531b-bc9c-6a62-1314-b2713b9536b6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewjV4-0005Fk-NV
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 07:10:02 +0000
In-Reply-To: <e1cf531b-bc9c-6a62-1314-b2713b9536b6@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE4OjEwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMTggMTM6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYveDg2XzY0L2VudHJ5LlMKPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRy
eS5TCj4+IEBAIC0xNCw4ICsxNCw2IEBACj4+ICAjaW5jbHVkZSA8cHVibGljL3hlbi5oPgo+PiAg
I2luY2x1ZGUgPGlycV92ZWN0b3JzLmg+Cj4+ICAKPj4gLSAgICAgICAgLnNlY3Rpb24gLnRleHQu
ZW50cnksICJheCIsIEBwcm9nYml0cwo+PiAtCj4+ICAvKiAlcmJ4OiBzdHJ1Y3QgdmNwdSAqLwo+
PiAgRU5UUlkoc3dpdGNoX3RvX2tlcm5lbCkKPj4gICAgICAgICAgbGVhcSAgVkNQVV90cmFwX2Jv
dW5jZSglcmJ4KSwlcmR4Cj4+IEBAIC0zNCw4ICszMiwxMDcgQEAgRU5UUlkoc3dpdGNoX3RvX2tl
cm5lbCkKPj4gICAgICAgICAgbW92YiAgJWNsLFRSQVBCT1VOQ0VfZmxhZ3MoJXJkeCkKPj4gICAg
ICAgICAgY2FsbCAgY3JlYXRlX2JvdW5jZV9mcmFtZQo+PiAgICAgICAgICBhbmRsICAkflg4Nl9F
RkxBR1NfREYsVVJFR1NfZWZsYWdzKCVyc3ApCj4gCj4gTmV3bGluZSBoZXJlIHBsZWFzZSwgYXMg
dGVzdF9hbGxfZXZlbnRzIGlzIGxvZ2ljYWxseSBhIHNlcGFyYXRlIHRoaW5nLiAKCkkgYWN0dWFs
bHkgZGlzYWdyZWUgaW4gY2FzZXMgd2hlcmUgdGhlIGxhYmVsIHNpdHMgaW4gdGhlIG1pZGRsZSBv
ZgpzdHJhaWdodCBsaW5lIGNvZGUuCgo+IEl0IG1pZ2h0IGJlIHdvcnRoIHVzaW5nIGFuIEFMSUdO
LCBnaXZlbiBob3cgbWFueSBqbXBzIGxhbmQgaGVyZS4KClRoYXQnbGwgYWdhaW4gZ2V0IHVzIGlu
dG8gdGhlIGRpc2N1c3Npb24gb2Ygc3VpdGFibGUgTk9Qcy4gV2UnZApoYXZlIHRvIGV4dGVuZCBB
TElHTiBieSBBTFRFUk5BVElWRV9OT1AgZm9yIHRoZSByZXN1bHQgdG8KYmUgYXMgZGVzaXJlZCBm
b3IgYWxsIGNhc2VzLiBHZW5lcmFsbHkgSSdkIGV4cGVjdCBzdHJhaWdodCBsaW5lCmV4ZWN1dGlv
biBoZXJlIHRvIGJlIChvbmUgb2YpIHRoZSBtb3N0IGNvbW1vbiB3YXlzIHRvIHJlYWNoCnRoYXQg
bGFiZWwuCgpGdXJ0aGVybW9yZSBJIGludGVudGlvbmFsbHkgZGlkbid0IHdhbnQgdG8gYWx0ZXIg
YW55IG9mIHRoZSBtb3ZlZApjb2RlLCBvdGhlciB0aGFuIGl0cyBzcGVsbGluZy9mb3JtYXR0aW5n
LgoKPiBPdGhlcndpc2UsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKSSdsbCB3YWl0IHdpdGggcmVjb3JkaW5nIHRoaXMgdW50aWwgdGhlIGFi
b3ZlIHdhcyBjbGFyaWZpZWQuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
