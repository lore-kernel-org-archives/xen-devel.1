From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/vm_event: add gdtr_base to the
 vm_event structure
Date: Fri, 3 May 2019 00:42:41 +0100
Message-ID: <66dcc034-7f8b-fc00-86e5-40778892a9cb@citrix.com>
References: <20190502214203.17279-1-tamas@tklengyel.com>
 <CABfawhkCizO=8Y2gsF=X1ppgGeaV0Trb7108awRsKOOYAYQjLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hMLLh-0007Eb-Vx
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 23:42:46 +0000
In-Reply-To: <CABfawhkCizO=8Y2gsF=X1ppgGeaV0Trb7108awRsKOOYAYQjLA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMjAxOSAyMzo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+PiBAQCAtMjExLDEz
ICsyMTIsMTQgQEAgc3RydWN0IHZtX2V2ZW50X3JlZ3NfeDg2IHsKPj4gICAgICBzdHJ1Y3Qgdm1f
ZXZlbnRfeDg2X3NlbGVjdG9yX3JlZyBmczsKPj4gICAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2X3Nl
bGVjdG9yX3JlZyBnczsKPj4gICAgICB1aW50NjRfdCBzaGFkb3dfZ3M7Cj4+ICsgICAgdWludDE2
X3QgZ2R0cl9saW1pdDsKPiBXaG9vcHMsIGp1c3Qgbm90aWNlZCB0aGF0IGxpbWl0IGFjdHVhbGx5
IG5lZWRzIDIwLWJpdHMuIEknbGwganVzdCBncm93Cj4gdGhpcyB0byAzMiBhbmQgZHJvcCB0aGUg
cGFkIGF0IHRoZSBlbmQuCgpUaGVyZSBpcyBubyBzdWNoIHRoaW5nIGFzIGEgR0RUIG9yIGFuIElE
VCB3aXRoIGEgbGltaXQgYmV5b25kIDE2IGJpdHMuwqAKKEZ1cnRoZXJtb3JlLCBhbiBJRFQgd2l0
aCBhIGxpbWl0IGJleW9uZCAxMiBiaXRzIGlzIGp1c3QgYSB3YXN0ZSBvZiBtZW1vcnkpLgoKVlQt
eCBwZXJmb3JtcyBhIGNvbnNpc3RlbmN5IGNoZWNrIG9uIGV2ZXJ5IHZtZW50cnkgdGhhdCB0aGUK
Vk1DU197RyxJfURUUl9MSU1JVCBmaWVsZHMgYXJlIHdpdGhpbiAxNiBiaXRzLCBkZXNwaXRlIGJl
aW5nIGVuY29kZWQgYXMKMzJiaXQgZmllbGRzLsKgIFNWTSBzcGVjaWZpZXMgdGhlIGhpZ2hlciAx
NiBiaXRzIGFzIGlnbm9yZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
