From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 16:58:30 +0000
Message-ID: <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R2E2=RA=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1gyJaV-0000am-JE
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 16:58:43 +0000
Received: by mail-qt1-x844.google.com with SMTP id y4so11272985qtc.10
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 08:58:42 -0800 (PST)
In-Reply-To: <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjUsIDIwMTkgYXQgMTE6NDIgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAyMi4wMi4xOSBhdCAyMjozMywgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gUC5TLiBUaGVyZSBpcyBhIHNvbHV0aW9uIGhlcmUg
d2hpY2ggY291bGQgd29yaywgYnV0IElNTyBhIGJldHRlciB1c2Ugb2YKPiA+IHRpbWUgYW5kIGVu
ZXJneSB3b3VsZCBiZSB0byBnZXQgTUlTUkEgdG8gdXBkYXRlIHRoZWlyIHJ1bGVzIHRvIG1hdGNo
Cj4gPiB0aGlzIGNlbnR1cnksIGFuZCBzdG9wIGdldHRpbmcgaW4gdGhlIHdheSBvZiBjb21waWxl
ciBmZWF0dXJlcyBpbnRlbmRlZAo+ID4gdG8gaGVscCB0aGUgcHJvZ3JhbW1lciBhdm9pZCBidWdz
Lgo+Cj4gQXMgbXVjaCBhcyBJJ20gd2l0aCB5b3UgaW4gZGVzaXJpbmcgdGhlIGNvbXBpbGVyIGFp
ZCBnaXZlbiB0byBub3QgZ2V0Cj4gdW5kZXJtaW5lZCwgSSB0aGluayB0aGlzIE1JU1JBIHJ1bGUg
aXNuJ3QgaW4gbmVlZCBvZiBtb2Rlcm5pemluZzogSXQncwo+IG9uZSB0aGluZyBmb3IgdGhlIGNv
bXBpbGVyIHRvIGhlbHAgd2l0aCBpbi1yYW5nZSBlbnVtZXJhdG9ycywgYW5kIGl0J3MKPiBhbm90
aGVyIHRvIGRlbWFuZCB0aGF0IHVuaW50ZW50aW9uYWwgb3V0LW9mLXJhbmdlIG9uZXMgZG9uJ3Qg
Y2F1c2UKPiBhY3R1YWwgaGFybSAobGlrZSBjcmFzaGluZyB5b3VyIGNhciBpbnRvIHRoZSBuZXh0
IHRyZWUpLiBUaGlzIGlzIGV2ZW4KPiBtb3JlIHNvIHRoYXQgaWlyYyB0aGVyZSdzIG5vIHdhcm5p
bmcgaWYgeW91IHBhc3MgYSBwbGFpbiBpbnRlZ2VyIGludG8gYQo+IGZ1bmN0aW9uIHdob3NlIHBh
cmFtZXRlciBzcGVjaWZpZXMgYW4gZW51bSwgb3IgaWYgeW91IGFzc2lnbiBhIHBsYWluCj4gaW50
ZWdlciB0byBhbiBlbnVtIHR5cGVzIHZhcmlhYmxlLgoKRldJVyBJIHdhcyB0aGlua2luZyB0aGUg
c2FtZSB0aGluZy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
