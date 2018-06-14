From: "Besogonov, Aleksei" <cyberax@amazon.com>
Subject: Re: [RFC PATCH 12/12] PM / hibernate: update the resume
 offset on SNAPSHOT_SET_SWAP_AREA
Date: Thu, 14 Jun 2018 19:50:15 +0000
Message-ID: <23092841-89AD-4D68-9790-AF0BD8702F0A__25209.1479990215$1529040638$gmane$org@amazon.com>
References: <20180612205619.28156-1-anchalag@amazon.com>
 <20180612205619.28156-13-anchalag@amazon.com> <20180614194515.GE17808@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dapk=ja=amazon.com=prvs=6967d3c22=cyberax@srs-us1.protection.inumbo.net>)
 id 1fTYGE-0001tF-QG
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 19:50:22 +0000
In-Reply-To: <20180614194515.GE17808@amd>
Content-Language: en-US
Content-ID: <D00608EDB57CB446B588E18069F89FA0@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pavel Machek <pavel@ucw.cz>, "Agarwal, Anchal" <anchalag@amazon.com>
Cc: "jgross@suse.com" <jgross@suse.com>, "len.brown@intel.com" <len.brown@intel.com>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "Valentin,
 Eduardo" <eduval@amazon.com>, "Vaidyeshwara, Vallish" <vallish@amazon.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "van
 der Linden, Frank" <fllinden@amazon.com>, "x86@kernel.org" <x86@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Anbalagane,
 Guru" <guruanb@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KHNvcnJ5IGZvciB0b3AtcG9zdGluZykNCg0KV2VsbCwgbm90IGNvbXBsZXRlbHkgYnJva2VuLiBJ
dCBqdXN0IHJlcXVpcmVkIGEgcmVzdGFydCBmb3IgdGhlIG9mZnNldCBzZXR0aW5nIHRvIHRha2Ug
YW4gZWZmZWN0Lg0KDQrvu79PbiA2LzE0LzE4LCAxMjo0NiwgIlBhdmVsIE1hY2hlayIgPHBhdmVs
QHVjdy5jej4gd3JvdGU6DQoNCiAgICBIaSENCiAgICANCiAgICA+IEZyb206IEFsZWtzZWkgQmVz
b2dvbm92IDxjeWJlcmF4QGFtYXpvbi5jb20+DQogICAgPiANCiAgICA+IFRoZSBTTkFQU0hPVF9T
RVRfU1dBUF9BUkVBIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgdG8gc2V0IHRoZSBoaWJlcm5hdGlv
bg0KICAgID4gb2Zmc2V0IG9uIGEgcnVubmluZyBrZXJuZWwgdG8gZW5hYmxlIGhpYmVybmF0aW5n
IHRvIGEgc3dhcCBmaWxlLg0KICAgID4gSG93ZXZlciwgaXQgZG9lc24ndCBhY3R1YWxseSB1cGRh
dGUgdGhlIHN3c3VzcF9yZXN1bWVfYmxvY2sgdmFyaWFibGUuIEFzDQogICAgPiBhIHJlc3VsdCwg
dGhlIGhpYmVybmF0aW9uIGZhaWxzIGF0IHRoZSBsYXN0IHN0ZXAgKGFmdGVyIGFsbCB0aGUgZGF0
YSBpcw0KICAgID4gd3JpdHRlbiBvdXQpIGluIHRoZSB2YWxpZGF0aW9uIG9mIHRoZSBzd2FwIHNp
Z25hdHVyZSBpbg0KICAgID4gbWFya19zd2FwZmlsZXMoKS4NCiAgICA+IA0KICAgID4gQmVmb3Jl
IHRoaXMgcGF0Y2gsIHRoZSBjb21tYW5kIGxpbmUgcHJvY2Vzc2luZyB3YXMgdGhlIG9ubHkgcGxh
Y2Ugd2hlcmUNCiAgICA+IHN3c3VzcF9yZXN1bWVfYmxvY2sgd2FzIHNldC4NCiAgICANCiAgICBB
cmUgeW91IHNheWluZyB0aGF0IHN1c3BlbmQtdG8tZmlsZSB3YXMgYnJva2VuLCBldmVuIG9uDQog
ICAgbm9uLXZpcnR1YWxpemVkIHN5c3RlbXM/DQogICAgDQogICAgSWYgc28sIHdlIG1heSB0aGlz
IHRvIGdvIGluIGZpcnN0Li4uDQogICAgCQkJCQkJCQlQYXZlbA0KICAgIAkJCQkJCQkJDQogICAg
LS0gDQogICAgKGVuZ2xpc2gpIGh0dHA6Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZlbG1hY2hl
aw0KICAgIChjZXNreSwgcGljdHVyZXMpIGh0dHA6Ly9hdHJleS5rYXJsaW4ubWZmLmN1bmkuY3ov
fnBhdmVsL3BpY3R1cmUvaG9yc2VzL2Jsb2cuaHRtbA0KICAgIA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
