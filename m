From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 21:34:33 +0000
Message-ID: <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
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
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
 <eeec5cb2-5242-5331-21cb-e84317b85351@arm.com>
 <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Rhx=RA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gyNu0-0001j3-T9
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 21:35:08 +0000
In-Reply-To: <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyLzI1LzE5IDk6MTMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBJIHRo
aW5rIGl0IGlzIGZpbmUgdG8gZXhwbG9pdCBjb21waWxlciBzcGVjaWZpYyBjaGVja3Mgd2hlbiBh
dmFpbGFibGUuCj4gSG93ZXZlciwgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgbWFrZSBhbnkgZGVj
aXNpb25zIG9uIGNvZGUgY29ycmVjdG5lc3MKPiBiYXNlZCBvbiB0aGUgY29tcGlsZXIgY2hlY2tz
IHRoYXQgd2UgaW50cm9kdWNlLgo+IAo+IEluIG90aGVyIHdvcmRzLCBJIHRoaW5rIGl0IGlzIGEg
Z29vZCBpZGVhIHRvIHVzZSAtV3N3aXRjaC1lbnVtIGlmCj4gcG9zc2libGUsIGJ1dCBpdCBpcyBu
b3QgYSByZWFzb24gZm9yIG5vdCBoYXZpbmcgZGVmYXVsdCBsYWJlbHMgaW4gcGxhY2UKPiBhcyBz
dWdnZXN0ZWQgYnkgMTYuNC4gVGhlIGNvZGUgc2hvdWxkIGJlIGFzIGNvcnJlY3QgYW5kIHNhZmUg
YXMKPiBwb3NzaWJsZSwgd2l0aG91dCByZXF1aXJpbmcgZXh0ZXJuYWwgY29tcGlsZXItc3BlY2lm
aWMgY2hlY2tzLgoKQXMgSSBzYWlkIG9uIGFuIGFuc3dlciB0byBPbGVrc2FuZHIsIEkgYW0gbm90
IGFnYWluc3Qgb2YgaGF2aW5nIAoiZGVmYXVsdCIgbGFiZWxzIGFzIGxvbmcgYXMgdGhleSBjb250
YWluIHNlbnNpYmxlIGFjdGlvbnMuCgpCdXQgdGhpcyBkb2VzIG5vdCByZWFsbHkgYWRkcmVzcyBt
eSBwb2ludCBhYm92ZSByZWdhcmRpbmcgd2F5IHRvIGhlbHAgCnRoZSByZXZpZXcuIEphbiBpcyBh
Z2FpbnN0IC1Xc3dpdGNoLWVudW0sIGFuZCBJIGNhbiB1bmRlcnN0YW5kIGhpcyAKcG9pbnQuIFNv
IGhvdyBkbyB5b3UgZGVhbCB3aXRoIG1pc3NpbmcgaXRlbT8KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
