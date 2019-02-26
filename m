From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 13:33:07 +0200
Message-ID: <237094ca-6ec0-cb4d-9fab-c163909af0e2@gmail.com>
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
 <5C7520E6020000780021A46F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+aJ=RB=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyaz2-0005gA-FL
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 11:33:12 +0000
Received: by mail-lj1-x242.google.com with SMTP id v10so10457322lji.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Feb 2019 03:33:11 -0800 (PST)
In-Reply-To: <5C7520E6020000780021A46F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNi8xOSAxOjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNS4wMi4xOSBh
dCAyMjozNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMi8yNS8xOSA5OjEz
IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBJIHRoaW5rIGl0IGlzIGZpbmUgdG8g
ZXhwbG9pdCBjb21waWxlciBzcGVjaWZpYyBjaGVja3Mgd2hlbiBhdmFpbGFibGUuCj4+PiBIb3dl
dmVyLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBtYWtlIGFueSBkZWNpc2lvbnMgb24gY29kZSBj
b3JyZWN0bmVzcwo+Pj4gYmFzZWQgb24gdGhlIGNvbXBpbGVyIGNoZWNrcyB0aGF0IHdlIGludHJv
ZHVjZS4KPj4+Cj4+PiBJbiBvdGhlciB3b3JkcywgSSB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSB0
byB1c2UgLVdzd2l0Y2gtZW51bSBpZgo+Pj4gcG9zc2libGUsIGJ1dCBpdCBpcyBub3QgYSByZWFz
b24gZm9yIG5vdCBoYXZpbmcgZGVmYXVsdCBsYWJlbHMgaW4gcGxhY2UKPj4+IGFzIHN1Z2dlc3Rl
ZCBieSAxNi40LiBUaGUgY29kZSBzaG91bGQgYmUgYXMgY29ycmVjdCBhbmQgc2FmZSBhcwo+Pj4g
cG9zc2libGUsIHdpdGhvdXQgcmVxdWlyaW5nIGV4dGVybmFsIGNvbXBpbGVyLXNwZWNpZmljIGNo
ZWNrcy4KPj4gQXMgSSBzYWlkIG9uIGFuIGFuc3dlciB0byBPbGVrc2FuZHIsIEkgYW0gbm90IGFn
YWluc3Qgb2YgaGF2aW5nCj4+ICJkZWZhdWx0IiBsYWJlbHMgYXMgbG9uZyBhcyB0aGV5IGNvbnRh
aW4gc2Vuc2libGUgYWN0aW9ucy4KPj4KPj4gQnV0IHRoaXMgZG9lcyBub3QgcmVhbGx5IGFkZHJl
c3MgbXkgcG9pbnQgYWJvdmUgcmVnYXJkaW5nIHdheSB0byBoZWxwCj4+IHRoZSByZXZpZXcuIEph
biBpcyBhZ2FpbnN0IC1Xc3dpdGNoLWVudW0sIGFuZCBJIGNhbiB1bmRlcnN0YW5kIGhpcwo+PiBw
b2ludC4gU28gaG93IGRvIHlvdSBkZWFsIHdpdGggbWlzc2luZyBpdGVtPwo+IEp1c3QgdG8gY2xh
cmlmeSAtIEknbSBub3QgZW50aXJlbHkgYWdhaW5zdCB0aGUgX29wdGlvbmFsXyB1c2Ugb2YKPiAt
V3N3aXRjaC1lbnVtLCBidXQgdGhlIGFkZGVkIGNsdXR0ZXIgbmVlZHMgdG8gZWl0aGVyIGJlIHdl
bGwganVzdGlmaWVkCj4gKHdoaWNoIHNvIGZhciBpdCBpc24ndCksIG9yIGNvbmRpdGlvbmFsbHkg
aGlkZGVuIHRocm91Z2ggc29tZSBtYWNybwo+ICh3aGVyZSB0aGUgbWFpbiBwdXJwb3NlIG9mIHRo
ZSBtYWNybyByZWFsbHkgaXMgdG8gZG9jdW1lbnQgd2h5IHN1Y2gKPiBvdGhlcndpc2UgcG9pbnRs
ZXNzIGRlZmF1bHQgbGFiZWxzIGFyZSB0aGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UpLgpBbHRob3Vn
aCBJIGNhbiBhZ3JlZSB0aGF0IGl0IG1pZ2h0IHNlZW0gdG8gYmUgYSBnb29kIGlkZWEgdG8gaGlk
ZQphbGwgdGhvc2Ugd2l0aCBhIG1hY3JvLCBidXQgSSBhbSBqdXN0IHRoaW5raW5nIGFib3V0IG90
aGVyCmNhc2VzIHdoaWNoIE1JU1JBIGJyaW5ncyBpbi4gRm9yIGV4YW1wbGUgWzFdLApSdWxlIDE1
LjcgQWxsIGlmIC4uLiBlbHNlIGlmIGNvbnN0cnVjdHMgc2hhbGwgYmUgdGVybWluYXRlZCB3aXRo
IGFuIGVsc2UgCnN0YXRlbWVudApTbywgd2UnbGwgZW5kIHVwIGhhdmluZyBsb3RzIG9mIG1hY3Jv
cyB0aGVuIHdoaWNoIGlzIG9idmlvdXNseQpub3QgZ29vZC4gVGhhdCBzYWlkLCBJIGhvcGUgd2Ug
Y2FuIHdvcmsgb3V0IHNvbWUgY29tbW9uIGFwcHJvYWNoCm5vdCBvbmx5IHRvIHRoaXMgaXNzdWUs
IGJ1dCBob3cgd2UgZGVhbCB3aXRoIHN1Y2ggaW4gZ2VuZXJhbC4KPgo+IEphbgo+Cj4KVGhhbmsg
eW91LApPbGVrc2FuZHIKClsxXSBodHRwczovL3J1bGVzLnNvbmFyc291cmNlLmNvbS9jL1JTUEVD
LTEyNgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
