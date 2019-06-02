From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Sat, 1 Jun 2019 18:40:23 -0600
Message-ID: <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uFtn=UB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXEYc-0001b1-IR
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2019 00:41:06 +0000
Received: by mail-lf1-f49.google.com with SMTP id a25so10840453lfg.2
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2019 17:41:00 -0700 (PDT)
In-Reply-To: <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMzozNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gQSBjb3VwbGUgb2YgYWRqdXN0bWVudHMgYXJlIG5lZWRlZCB0byBj
b2RlIGNoZWNraW5nIGZvciBkb21fY293LCBidXQKPiBzaW5jZSB0aGVyZSBhcmUgcHJldHR5IGZl
dyBpdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gYWRqdXN0IHRob3NlIHRoYW4KPiB0byBzZXQgdXAg
YW5kIGtlZXAgYXJvdW5kIGEgbmV2ZXIgdXNlZCBkb21haW4uCj4KPiBUYWtlIHRoZSBvcHBvcnR1
bml0eSBhbmQgdGlnaHRlbiBhIEJVR19PTigpIGluIGVtdWwtcHJpdi1vcC5jOnJlYWRfY3IoKS4K
PiAoQXJndWFibHkgdGhpcyBwZXJoYXBzIHNob3VsZG4ndCBiZSBhIEJVR19PTigpIGluIHRoZSBm
aXJzdCBwbGFjZS4pCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gLS0tCj4gV2hpbGUgZm9yIG5vdyB0aGlzIGF2b2lkcyBjcmVhdGluZyB0aGUgZG9t
YWluIG9uIEFybSBvbmx5LCBUYW1hcydlcwo+IHBhdGNoIHN3aXRjaGluZyB0byBDT05GSUdfTUVN
X1NIQVJJTkcgd2lsbCBtYWtlIHg4NiBsZXZlcmFnZSB0aGlzIHRvby4KCkhpIEphbiwKcGVyaGFw
cyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGlzIHBhdGNoIGJlIGFwcGxpZWQgYWZ0ZXIg
bXkKcGF0Y2g/IFlvdSBhbHJlYWR5IGFja2VkIHRoYXQgb25lIGFuZCBpdCBjb3VsZCBiZSBhcHBs
aWVkIHNlcGFyYXRlbHkKZnJvbSB0aGUgc2VyaWVzIHRoYXQgSSd2ZSBzZW50IGl0IGFzIHBhcnQg
b2YuCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
