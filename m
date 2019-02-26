From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 04:20:06 -0700
Message-ID: <5C7520E6020000780021A46F@prv1-mh.provo.novell.com>
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
 <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyamU-0004Ss-NQ
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 11:20:14 +0000
In-Reply-To: <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDIyOjM0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDIvMjUvMTkgOToxMyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBJIHRoaW5r
IGl0IGlzIGZpbmUgdG8gZXhwbG9pdCBjb21waWxlciBzcGVjaWZpYyBjaGVja3Mgd2hlbiBhdmFp
bGFibGUuCj4+IEhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIG1ha2UgYW55IGRlY2lz
aW9ucyBvbiBjb2RlIGNvcnJlY3RuZXNzCj4+IGJhc2VkIG9uIHRoZSBjb21waWxlciBjaGVja3Mg
dGhhdCB3ZSBpbnRyb2R1Y2UuCj4+IAo+PiBJbiBvdGhlciB3b3JkcywgSSB0aGluayBpdCBpcyBh
IGdvb2QgaWRlYSB0byB1c2UgLVdzd2l0Y2gtZW51bSBpZgo+PiBwb3NzaWJsZSwgYnV0IGl0IGlz
IG5vdCBhIHJlYXNvbiBmb3Igbm90IGhhdmluZyBkZWZhdWx0IGxhYmVscyBpbiBwbGFjZQo+PiBh
cyBzdWdnZXN0ZWQgYnkgMTYuNC4gVGhlIGNvZGUgc2hvdWxkIGJlIGFzIGNvcnJlY3QgYW5kIHNh
ZmUgYXMKPj4gcG9zc2libGUsIHdpdGhvdXQgcmVxdWlyaW5nIGV4dGVybmFsIGNvbXBpbGVyLXNw
ZWNpZmljIGNoZWNrcy4KPiAKPiBBcyBJIHNhaWQgb24gYW4gYW5zd2VyIHRvIE9sZWtzYW5kciwg
SSBhbSBub3QgYWdhaW5zdCBvZiBoYXZpbmcgCj4gImRlZmF1bHQiIGxhYmVscyBhcyBsb25nIGFz
IHRoZXkgY29udGFpbiBzZW5zaWJsZSBhY3Rpb25zLgo+IAo+IEJ1dCB0aGlzIGRvZXMgbm90IHJl
YWxseSBhZGRyZXNzIG15IHBvaW50IGFib3ZlIHJlZ2FyZGluZyB3YXkgdG8gaGVscCAKPiB0aGUg
cmV2aWV3LiBKYW4gaXMgYWdhaW5zdCAtV3N3aXRjaC1lbnVtLCBhbmQgSSBjYW4gdW5kZXJzdGFu
ZCBoaXMgCj4gcG9pbnQuIFNvIGhvdyBkbyB5b3UgZGVhbCB3aXRoIG1pc3NpbmcgaXRlbT8KCkp1
c3QgdG8gY2xhcmlmeSAtIEknbSBub3QgZW50aXJlbHkgYWdhaW5zdCB0aGUgX29wdGlvbmFsXyB1
c2Ugb2YKLVdzd2l0Y2gtZW51bSwgYnV0IHRoZSBhZGRlZCBjbHV0dGVyIG5lZWRzIHRvIGVpdGhl
ciBiZSB3ZWxsIGp1c3RpZmllZAood2hpY2ggc28gZmFyIGl0IGlzbid0KSwgb3IgY29uZGl0aW9u
YWxseSBoaWRkZW4gdGhyb3VnaCBzb21lIG1hY3JvCih3aGVyZSB0aGUgbWFpbiBwdXJwb3NlIG9m
IHRoZSBtYWNybyByZWFsbHkgaXMgdG8gZG9jdW1lbnQgd2h5IHN1Y2gKb3RoZXJ3aXNlIHBvaW50
bGVzcyBkZWZhdWx0IGxhYmVscyBhcmUgdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlKS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
