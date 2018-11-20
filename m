From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 4/4] automation: add qemu smoke test
Date: Tue, 20 Nov 2018 10:41:07 -0600
Message-ID: <20181120164107.lszllwrakxf5kbal@doug-macbook.localdomain>
References: <20181119213102.8939-1-wei.liu2@citrix.com>
 <20181119213102.8939-5-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nzhi=n7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1gP95J-00034Q-QD
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:41:09 +0000
Received: by mail-yb1-xb41.google.com with SMTP id h187-v6so981508ybg.10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 08:41:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20181119213102.8939-5-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDk6MzE6MDJQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgdGVzdCBzdGFnZSBpbnRvIHRoZSBwaXBlbGlu
ZSBhbmQgcHJvdmlkZXMKPiBhIHNpbXBsZSBRRU1VIGJhc2VkIHNtb2tlIHRlc3QuCj4gCj4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAgLmdpdGxh
Yi1jaS55bWwgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysr
Kwo+ICBhdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS14ODYtNjQuc2ggfCAyMyArKysrKysr
KysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNzU1IGF1dG9tYXRpb24vc2NyaXB0cy9xZW11LXNtb2tlLXg4Ni02NC5z
aAo+IAo+IGRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCj4gaW5k
ZXggZDExNDU5YjExNy4uYjljY2JhNmFiMiAxMDA2NDQKPiAtLS0gYS8uZ2l0bGFiLWNpLnltbAo+
ICsrKyBiLy5naXRsYWItY2kueW1sCj4gQEAgLTEsNSArMSw2IEBACj4gIHN0YWdlczoKPiAgICAt
IGJ1aWxkCj4gKyAgLSB0ZXN0Cj4gIAo+ICAuYnVpbGQtdG1wbDogJmJ1aWxkCj4gICAgc3RhZ2U6
IGJ1aWxkCj4gQEAgLTM3OSwzICszODAsMjEgQEAgZGViaWFuLXVuc3RhYmxlLWdjYy1kZWJ1Zy1h
cm02NC1yYW5kY29uZmlnOgo+ICAgIHZhcmlhYmxlczoKPiAgICAgIENPTlRBSU5FUjogZGViaWFu
OnVuc3RhYmxlLWFybTY0djgKPiAgICAgIFJBTkRDT05GSUc6IHkKPiArCj4gKwo+ICsjIFRlc3Qg
am9icwo+ICtxZW11LXNtb2tlLXg4Ni02NDoKPiArICBzdGFnZTogdGVzdAo+ICsgIGltYWdlOiBy
ZWdpc3RyeS5naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8ke0NPTlRBSU5FUn0KPiArICB2YXJp
YWJsZXM6Cj4gKyAgICBDT05UQUlORVI6IGRlYmlhbjpzdHJldGNoCj4gKyAgc2NyaXB0Ogo+ICsg
ICAgLSAuL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11LXNtb2tlLXg4Ni02NC5zaCAyPiYxIHwgdGVl
IHFlbXUtc21va2UteDg2LTY0LmxvZwoKRG8geW91IHdhbnQgdG8gY2FwdHVyZSB0aGlzIGxvZyBp
biB0aGUgYXJ0aWZhY3RzIGJlbG93IHRvbz8KCj4gKyAgYXJ0aWZhY3RzOgo+ICsgICAgcGF0aHM6
Cj4gKyAgICAgIC0gc21va2Uuc2VyaWFsCj4gKyAgICB3aGVuOiBhbHdheXMKPiArICBkZXBlbmRl
bmNpZXM6Cj4gKyAgICAtIGRlYmlhbi1zdHJldGNoLWdjYy1kZWJ1Zwo+ICsgIHRhZ3M6Cj4gKyAg
ICAtIHg4Nl82NAoKSnVzdCBvbmUgcXVpY2sgcXVlc3Rpb24uIElmIHlvdSBkbyB0aGF0IGNhbiBi
ZSBmaXhlZCB1cCBhdCBjb21taXQgdGltZQphcyB3ZWxsIHNvIEkgaGF2ZSBubyBwcm9ibGVtIHNh
eWluZzoKCkFja2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
