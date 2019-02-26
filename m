From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 21:31:25 +0000
Message-ID: <16524327-f68d-7f82-4bc3-b107d68961d1@arm.com>
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
 <alpine.DEB.2.10.1902261310310.20689@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MJkL=RB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gykK2-0002VI-Bs
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 21:31:30 +0000
In-Reply-To: <alpine.DEB.2.10.1902261310310.20689@sstabellini-ThinkPad-X260>
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

SGksCgpPbiAyLzI2LzE5IDk6MTAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDI1IEZlYiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyLzI1
LzE5IDk6MTMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IEkgdGhpbmsgaXQgaXMg
ZmluZSB0byBleHBsb2l0IGNvbXBpbGVyIHNwZWNpZmljIGNoZWNrcyB3aGVuIGF2YWlsYWJsZS4K
Pj4+IEhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIG1ha2UgYW55IGRlY2lzaW9ucyBv
biBjb2RlIGNvcnJlY3RuZXNzCj4+PiBiYXNlZCBvbiB0aGUgY29tcGlsZXIgY2hlY2tzIHRoYXQg
d2UgaW50cm9kdWNlLgo+Pj4KPj4+IEluIG90aGVyIHdvcmRzLCBJIHRoaW5rIGl0IGlzIGEgZ29v
ZCBpZGVhIHRvIHVzZSAtV3N3aXRjaC1lbnVtIGlmCj4+PiBwb3NzaWJsZSwgYnV0IGl0IGlzIG5v
dCBhIHJlYXNvbiBmb3Igbm90IGhhdmluZyBkZWZhdWx0IGxhYmVscyBpbiBwbGFjZQo+Pj4gYXMg
c3VnZ2VzdGVkIGJ5IDE2LjQuIFRoZSBjb2RlIHNob3VsZCBiZSBhcyBjb3JyZWN0IGFuZCBzYWZl
IGFzCj4+PiBwb3NzaWJsZSwgd2l0aG91dCByZXF1aXJpbmcgZXh0ZXJuYWwgY29tcGlsZXItc3Bl
Y2lmaWMgY2hlY2tzLgo+Pgo+PiBBcyBJIHNhaWQgb24gYW4gYW5zd2VyIHRvIE9sZWtzYW5kciwg
SSBhbSBub3QgYWdhaW5zdCBvZiBoYXZpbmcgImRlZmF1bHQiCj4+IGxhYmVscyBhcyBsb25nIGFz
IHRoZXkgY29udGFpbiBzZW5zaWJsZSBhY3Rpb25zLgo+IAo+IEdvb2QhCj4gCj4gCj4+IEJ1dCB0
aGlzIGRvZXMgbm90IHJlYWxseSBhZGRyZXNzIG15IHBvaW50IGFib3ZlIHJlZ2FyZGluZyB3YXkg
dG8gaGVscCB0aGUKPj4gcmV2aWV3LiBKYW4gaXMgYWdhaW5zdCAtV3N3aXRjaC1lbnVtLCBhbmQg
SSBjYW4gdW5kZXJzdGFuZCBoaXMgcG9pbnQuIFNvIGhvdwo+PiBkbyB5b3UgZGVhbCB3aXRoIG1p
c3NpbmcgaXRlbT8KPiAKPiBJIHdvbmRlciBpZiBDb3Zlcml0eSBvciBQUlFBIGNhbiBoZWxwIHdp
dGggdGhhdC4KCkkgd291bGQgYmUgcmVhbGx5IHN1cnByaXNlZCBpZiBDb3Zlcml0eSBvciBQUlFB
IHdlcmUgYWJsZSB0byBkZXRlY3QgYSAKbWlzc2luZyBpdGVtIGluIHRoZSBlbnVtZXJhdGlvbiBp
ZiB5b3UgaGF2ZSB0aGUgJ2RlZmF1bHQnIGxhYmVsLgoKT24gYSBzaW1pbGFyIHRvcGljLCB3ZSBu
ZXZlciByZWFjaGVkIHRvIHRoZSBwb2ludCB3aGVyZSBYZW4gQXJtIGlzIAphdXRvbWF0aWNhbGx5
IGNvdmVyZWQgYnkgQ292ZXJpdHkuIEF0IHRoZSBtb21lbnQsIHdlIHJlbHkgb24gRVBBTSB0byAK
cHVzaCB0aW1lIHRvIHRpbWUuIEFzIHdlIGFyZ3VlIG9uIGdldHRpbmcgdGhlIGNvZGUgc2FmZXIs
IEkgdGhpbmsgaXQgaXMgCnRpbWUgdG8gZ2V0IHRoaXMgZmluYWxseSBydW4gYnkgb3NzdGVzdC4K
Ckkgc3VzcGVjdCB0aGlzIHNob3VsZCBiZSBvbmUgb2YgdGhlIHN0ZXAgdGhlIGxlc3MgY29udHJv
dmVyc2lhbCBmb3IgWGVuIApjb21tdW5pdHkgOikuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
