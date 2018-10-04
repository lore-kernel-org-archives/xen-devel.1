From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [RFC PATCH 2/2] xen/arm: Add MESON UART driver for
 Amlogic S905 SoC
Date: Thu, 4 Oct 2018 12:41:16 +0530
Message-ID: <CABHD4K-zACRqA2mRNnALY3s5ZrReMYe2g67WLf9rA_U8q=wfNA@mail.gmail.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-3-git-send-email-amittomer25@gmail.com>
 <82dda81f-14e1-612f-fe94-5db78c1bd520@arm.com>
 <CABHD4K8zq_yfX4v130tiZMU-Mm4xhCQsuVEYG47U8kdDJ+jkPg@mail.gmail.com>
 <5f06b4fa-a026-8d46-de17-6887db429ae5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wt9d=mq=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1g7xnG-0002NL-Fp
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 07:11:30 +0000
Received: by mail-ot1-x342.google.com with SMTP id h15-v6so8160475otj.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Oct 2018 00:11:29 -0700 (PDT)
In-Reply-To: <5f06b4fa-a026-8d46-de17-6887db429ae5@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George Dunlap <George.Dunlap@eu.citrix.com>, ian.jackson@eu.citrix.com, tim@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgo+ID4+PiArICAgIHJlZyA9IG1lc29uX3M5MDVfcmVhZCh1YXJ0LCBVQVJUX0NPTlRS
T0wpOwo+ID4+PiArICAgIHJlZyAmPSB+KFVBUlRfUlhfUlNUIHwgVUFSVF9UWF9SU1QgfCBVQVJU
X0NMRUFSX0VSUik7Cj4gPj4KPiA+Pgo+ID4+IEkgYW0gbm90IHN1cmUgd2h5IHlvdSBhcmUgY2xl
YXJpbmcgdGhvc2UgYml0cy4gQUZBSVUsIGluaXRfcHJlaXJxIHdpbGwgcmVzZXQKPiA+PiB0aGUg
c2VyaWFscywgc28geW91IHdhbnQgdG8gc2V0IHRob3NlcyBiaXRzLiBUaGlzIHNlZW1zIHRvIGJl
IGNvbmZpcm1lZCBieQo+ID4+IExpbnV4IGluIG1lc29uX3VhcnRfcmVzZXQuCj4gPgo+ID4gSWRl
YSBoZXJlIGlzIHRvIHNldCB0aGVzZSBiaXRzIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzKHdoaWNo
IGlzIDAgKSBhbmQgaWYgeW91Cj4gPiBsb29rIGF0IG90aGVyIGRyaXZlcnMgaW4gWEVOLCBpdCBz
ZWVtcyB0byBiZSBkb25lIHNhbWUgdGhpbmcoY2xlYXIKPiA+IHRob3NlIGJpdHMpIHdpdGggdGhl
bS4KPgo+IEFyZSB5b3Ugc3VyZSBhYm91dCB0aGlzPyBSWF9SU1QgYW5kIFRYX1JTVCBhcmUgYml0
IHRvIHJlc2V0IHRoZQo+IHRyYW5zbWlzc2lvbiBhbmQgcmVjZWl2ZSBwYXRoLiBMb29raW5nIGF0
IGEgY291cGxlIG9mIGRpZmZlcmVudCBkcml2ZXJzCj4gKGNhY2hlLXVhcnQuYyBhbmQgbXZlYnUt
dWFydC5jKSwgdGhvc2UgMiBiaXRzIGFyZSBzZXQgYW5kIEkgc3VzcGVjdCBiZQo+IGNsZWFyZWQg
YnkgdGhlIGhhcmR3YXJlIG9uY2UgcmVzZXQuCgpJdCdzIGJpdCBjb25mdXNpbmcgdG8gbWUsIGV2
ZW50dWFsbHkgTGludXggZHJpdmVyIHNlZW1zIHRvIGNsZWFyIHRob3NlIGJpdHMKCmh0dHBzOi8v
Z2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL3R0eS9zZXJpYWwv
bWVzb25fdWFydC5jI0wyNjYKClRoYW5rcwotQW1pdAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
