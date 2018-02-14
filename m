From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 13/16] Save/Restore Support: Add
 suspend/restore support for Grant Tables.
Date: Wed, 14 Feb 2018 13:42:21 +0100
Message-ID: <ef8246dc-3025-ee2a-e95d-a43ebebcbf46@suse.com>
References: <1518575259-71141-1-git-send-email-bruno.alvisio@gmail.com>
 <1518575259-71141-14-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ov5/=fi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1elwOM-0002cH-6h
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 12:42:30 +0000
In-Reply-To: <1518575259-71141-14-git-send-email-bruno.alvisio@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>, minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMTggMDM6MjcsIEJydW5vIEFsdmlzaW8gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
QnJ1bm8gQWx2aXNpbyA8YnJ1bm8uYWx2aXNpb0BnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlZCBz
aW5jZSB2MToKPiAgICAgLSBNb3ZlZCBzdXNwZW5kL3Jlc3VtZSBfZ250dGFiIHRvIGFyY2ggc3Bl
Y2lmaWMgZmlsZXMKPiAtLS0KPiAgYXJjaC94ODYvbW0uYyAgICB8IDM0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgZ250dGFiLmMgICAgICAgICB8IDEwICsrKysrKysrKysK
PiAgaW5jbHVkZS9nbnR0YWIuaCB8ICA0ICsrKysKPiAga2VybmVsLmMgICAgICAgICB8ICA0ICsr
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L21tLmMgYi9hcmNoL3g4Ni9tbS5jCj4gaW5kZXggMWIxNjNhYy4uMjU5N2M1YiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9tbS5jCj4gKysrIGIvYXJjaC94ODYvbW0uYwo+IEBAIC05
MTcsNiArOTE3LDQwIEBAIGdyYW50X2VudHJ5X3YxX3QgKmFyY2hfaW5pdF9nbnR0YWIoaW50IG5y
X2dyYW50X2ZyYW1lcykKPiAgICAgIHJldHVybiBtYXBfZnJhbWVzKGZyYW1lcywgbnJfZ3JhbnRf
ZnJhbWVzKTsKPiAgfQo+ICAKPiArdm9pZCBhcmNoX3N1c3BlbmRfZ250dGFiKGdyYW50X2VudHJ5
X3YxX3QgKmdudHRhYl90YWJsZSwgaW50IG5yX2dyYW50X2ZyYW1lcykKPiArewo+ICsjaWZkZWYg
Q09ORklHX1BBUkFWSVJUCj4gKyAgICBpbnQgaTsKPiArCj4gKyAgICBmb3IgKGkgPSAwOyBpIDwg
bnJfZ3JhbnRfZnJhbWVzOyBpKyspIHsKPiArICAgICAgICBIWVBFUlZJU09SX3VwZGF0ZV92YV9t
YXBwaW5nKCh1bnNpZ25lZCBsb25nKSgoKGNoYXIgKilnbnR0YWJfdGFibGUpICsgUEFHRV9TSVpF
KmkpLAo+ICsgICAgICAgICAgICAgICAgKHB0ZV90KXsweDA8PFBBR0VfU0hJRlR9LCBVVk1GX0lO
VkxQRyk7CgpDb2Rpbmcgc3R5bGUgKGJsYW5rcyBhcm91bmQgb3BlcmF0b3JzLCBvbmNlIGFnYWlu
IGJlbG93KS4KCgpPdGhlciB0aGFuIHRoYXQ6CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
