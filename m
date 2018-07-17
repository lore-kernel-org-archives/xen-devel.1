From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/4] xen: move pv irq related functions
 under CONFIG_XEN_PV umbrella
Date: Tue, 17 Jul 2018 15:19:25 -0400
Message-ID: <f2907905-fddd-8397-e460-09e9070fdd16__15060.0510220558$1531855078$gmane$org@oracle.com>
References: <20180717120113.12756-1-jgross@suse.com>
 <20180717120113.12756-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qxwh=kb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ffVV8-0001FV-ML
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 19:19:10 +0000
In-Reply-To: <20180717120113.12756-2-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTcvMjAxOCAwODowMSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYveGVuL01ha2VmaWxlIGIvYXJjaC94ODYveGVuL01ha2VmaWxlCj4gaW5kZXgg
ZDgzY2I1NDc4ZjU0Li5mNzIzYjVhYThmNzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYveGVuL01h
a2VmaWxlCj4gKysrIGIvYXJjaC94ODYveGVuL01ha2VmaWxlCj4gQEAgLTEyLDI1ICsxMiw0NiBA
QCBlbmRpZgoKCj4gIAo+ICBvYmotJChDT05GSUdfU01QKQkJKz0gc21wLm8KPiAgb2JqLSQoQ09O
RklHX1hFTl9QVl9TTVApICAJKz0gc21wX3B2Lm8KPiAgb2JqLSQoQ09ORklHX1hFTl9QVkhWTV9T
TVApICAJKz0gc21wX2h2bS5vCgoKSXMgdGhlcmUgYSByZWFzb24geW91IGRpZCBub3QgYWRkIHNw
YWNlIGhlcmUgYnV0IGRpZCBhZGQgdGhlbSBiZWxvdz8KCgoKPiArCj4gIG9iai0kKENPTkZJR19Q
QVJBVklSVF9TUElOTE9DS1MpKz0gc3BpbmxvY2subwo+ICsKPiAgb2JqLSQoQ09ORklHX1hFTl9E
RUJVR19GUykJKz0gZGVidWdmcy5vCj4gKwo+ICBvYmotJChDT05GSUdfWEVOX0RPTTApCQkrPSB2
Z2Eubwo+ICsKPiAgb2JqLSQoQ09ORklHX1NXSU9UTEJfWEVOKQkrPSBwY2ktc3dpb3RsYi14ZW4u
bwo+ICsKPiAgb2JqLSQoQ09ORklHX1hFTl9FRkkpCQkrPSBlZmkubwo+IC1vYmotJChDT05GSUdf
WEVOX1BWSCkJIAkrPSB4ZW4tcHZoLm8KCgpGb3IgdGhlIHNlcmllczoKClJldmlld2VkLWJ5OiBC
b3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
