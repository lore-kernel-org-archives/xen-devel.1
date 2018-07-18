From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 2/2] x86/efi: split compiler vs linker
 support
Date: Wed, 18 Jul 2018 11:43:48 +0200
Message-ID: <20180718094348.GK26572@olila.local.net-space.pl>
References: <20180716140724.44509-1-roger.pau@citrix.com>
 <20180716140724.44509-3-roger.pau@citrix.com>
 <5B4F09D802000078001D550A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pqyp=kc=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1ffj05-0004u5-FV
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:44:01 +0000
Content-Disposition: inline
In-Reply-To: <5B4F09D802000078001D550A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: roger.pau@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDM6MzU6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjA3LjE4IGF0IDE2OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvTWFrZWZpbGUKPiA+IEBAIC0xNjMsMTEgKzE2MywxMiBAQCBFRklfTERGTEFHUyArPSAtLW1p
bm9yLWltYWdlLXZlcnNpb249JChYRU5fU1VCVkVSU0lPTikKPiA+ICBFRklfTERGTEFHUyArPSAt
LW1ham9yLW9zLXZlcnNpb249MiAtLW1pbm9yLW9zLXZlcnNpb249MAo+ID4gIEVGSV9MREZMQUdT
ICs9IC0tbWFqb3Itc3Vic3lzdGVtLXZlcnNpb249MiAtLW1pbm9yLXN1YnN5c3RlbS12ZXJzaW9u
PTAKPiA+Cj4gPiAtIyBDaGVjayBpZiB0aGUgYnVpbGQgc3lzdGVtIHN1cHBvcnRzIFBFLgo+ID4g
LVhFTl9CVUlMRF9QRSA6PSAkKHNoZWxsICQoQ0MpICQoZmlsdGVyLW91dCAkKENGTEFHUy15KSAu
JS5kLCQoQ0ZMQUdTKSkgLWMgZWZpL2NoZWNrLmMgLW8gZWZpL2NoZWNrLm8gMj4vZGV2L251bGwg
JiYgZWNobyB5KQo+ID4gLWV4cG9ydCBYRU5fQlVJTERfUEUgOj0gJChpZiAkKFhFTl9CVUlMRF9Q
RSksJChzaGVsbCAkKExEKSAtbWkzODZwZXAgLS1zdWJzeXN0ZW09MTAgLW8gZWZpL2NoZWNrLmVm
aSBlZmkvY2hlY2subyAyPi9kZXYvbnVsbCAmJiBlY2hvIHkpKQo+ID4gLWlmZXEgKCQoWEVOX0JV
SUxEX1BFKSx5KQo+ID4gLUNGTEFHUyArPSAtRFhFTl9CVUlMRF9QRQo+ID4gKyMgQ2hlY2sgaWYg
dGhlIGNvbXBpbGVyIHN1cHBvcnRzIHRoZSBNUyBBQkkuCj4gPiArZXhwb3J0IFhFTl9CVUlMRF9F
RkkgOj0gJChzaGVsbCAkKENDKSAkKGZpbHRlci1vdXQgJChDRkxBR1MteSkgLiUuZCwkKENGTEFH
UykpIC1jIGVmaS9jaGVjay5jIC1vIGVmaS9jaGVjay5vIDI+L2Rldi9udWxsICYmIGVjaG8geSkK
PiA+ICsjIENoZWNrIGlmIHRoZSBsaW5rZXIgc3VwcG9ydHMgUEUuCj4gPiArWEVOX0JVSUxEX1BF
IDo9ICQoaWYgJChYRU5fQlVJTERfRUZJKSwkKHNoZWxsICQoTEQpIC1taTM4NnBlcCAtLXN1YnN5
c3RlbT0xMCAtbyBlZmkvY2hlY2suZWZpIGVmaS9jaGVjay5vIDI+L2Rldi9udWxsICYmIGVjaG8g
eSkpCj4gPiAraWZlcSAoJChYRU5fQlVJTERfRUZJKSx5KQo+ID4gK0NGTEFHUyArPSAtRFhFTl9C
VUlMRF9FRkkKPiA+ICBlbmRpZgo+Cj4gV2l0aCB0aGlzIHN1aXRhYmx5IHJlLWJhc2VkIGFjY29y
ZGluZyB0byB0aGUgY2hhbmdlcyByZXF1ZXN0ZWQgdG8KPiBwYXRjaCAxOgo+IFJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpQYXRjaGVzIExHVE0gKy8tIEphbiBj
b21tZW50cy4gVGhvdWdoIEkgd291bGQgbGlrZSB0byB0ZXN0IHRoZQpmaW5hbCB2ZXJzaW9uIGp1
c3QgdG8gYmUgc3VyZS4gU28sIFJvZ2VyLCBtYXkgSSBhc2sgeW91IHRvIHBvc3QKdGhlIHBhdGNo
ZXMgd2hpY2ggdGFrZXMgaW50byBhY2NvdW50IEphbidzIGNvbW1lbnRzPwoKRGFuaWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
