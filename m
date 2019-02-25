From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 09:42:09 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902250938530.4000@sstabellini-ThinkPad-X260>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <f0266920-d8fc-a215-25a1-0a3da777b0a0@gmail.com>
 <ecc8d855-e3f7-9e19-b8d6-ee9a2685ade0@arm.com>
 <9398ea9e-d49f-7595-7b15-5f4524e43a72@gmail.com>
 <69ef3086-dda3-8c66-e3b6-20124e2d97cc@arm.com>
 <f502b83f-a9c6-76e8-b3ca-d11bfce348d6@gmail.com>
 <3a355069-854f-1283-e115-c6deeb6e701d@arm.com>
 <ee393536-d825-bf0d-1224-ac6f88daeda6@gmail.com>
 <e414749f-980d-168f-b276-fafd5ac92b92@arm.com>
 <49ce8567-f65c-cb74-018b-87216dccf132@gmail.com>
 <234d8052-6911-1b55-38c0-2f067aff56c6@arm.com>
 <6d85ae68-943d-9611-53e0-5b48081514d9@gmail.com>
 <2992D841-035D-4256-81D7-31B684FEB451@xenproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyKGZ-0004bU-Uj
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 17:42:11 +0000
In-Reply-To: <2992D841-035D-4256-81D7-31B684FEB451@xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNSBGZWIgMjAxOSwgTGFycyBLdXJ0aCB3cm90ZToKPiAgICAgICBPbiAyNSBGZWIg
MjAxOSwgYXQgMTM6NDcsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxhbmRyMjAwMEBnbWFpbC5j
b20+IHdyb3RlOgo+IAo+IE9uIDIvMjUvMTkgMzo0MCBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
IAo+ICAgICAgICAgICAgICAgICAgIE15IHBvaW50IGlzIG5vdCBhYm91dCBzZW5kaW5nIHN1Y2gg
Y29kZSBvbiB0aGUgbWFpbGluZyBsaXN0LiBNeSBwb2ludCBpcyB5b3UgbmVlZCB0bwo+ICAgICAg
ICAgICAgICAgICAgIHByb3ZpZGUgYXMgbXVjaCBhcyBwb3NzaWJsZSBkZXRhaWxzIGluIHlvdXIg
Y292ZXIgbGV0dGVyIHNvIHdlIGNhbiBiZSBtb3JlIGVmZmljaWVudAo+ICAgICAgICAgICAgICAg
ICAgIHdoZW4gcmV2aWV3aW5nLiBGb3IgaW5zdGFuY2UsIG1hbnkgb2YgdXMgZG9lcyBub3QgaGF2
ZSBhY2Nlc3MgdG8gTUlTUkEgc3BlYyBiZWNhdXNlIGl0Cj4gICAgICAgICAgICAgICAgICAgaXMg
bm90IGZyZWUuLi4KPiAKPiAgICAgICAgICAgICBXaGlsZSBJIGFncmVlIHRoYXQgb25lIGhhcyB0
byBwcm92aWRlIGFzIG11Y2ggc3VwcG9ydGluZyBpbmZvcm1hdGlvbiBhcyBwb3NzaWJsZQo+ICAg
ICAgICAgICAgIHdoaWxlIHByZXNlbnRpbmcgc29tZSB3b3JrIHRvIHRoZSBjb21tdW5pdHkgaXQg
aXMgdGhhdCBJIGNhbm5vdCBkaXNjbG9zZQo+ICAgICAgICAgICAgIE1JU1JBIHJ1bGVzIGhlcmUu
IEFzIHlvdSBzYWlkLCBNSVNSQSBzcGVjIGlzIG5vdCBmcmVlLiBBbmQgb2YgY291cnNlIEkgY2Fu
bm90Cj4gICAgICAgICAgICAgZXhwZWN0IGFueW9uZSB0byBieSBpdCBmb3IgdGhlIHJlYXNvbiB0
aGF0IHNvbWVvbmUgd2FudHMgc29tZSBwYXRjaCB0byBiZQo+ICAgICAgICAgICAgICJzZWN1cmVs
eSIgb3IgYmxpbmRseSByZXZpZXdlZC4gKEJUVywgdGhpcyBpcyB0aGUgdG9waWMgdGhhdCBoYXMg
YWxyZWFkeSBiZWVuCj4gICAgICAgICAgICAgcmFpc2VkIGluIG91ciB0ZWFtIGludGVybmFsbHkg
YW5kIGJlaW5nIGRpc2N1c3NlZCkKPiAKPiAKPiAgICAgICBJIHVuZGVyc3RhbmQgdGhhdCBNSVNS
QSBpcyBub3QgZnJlZSBhbmQgZG9lcyBub3QgYXNrIHlvdSB0byBjb3B5L3Bhc3RlIHRoZSBQREYu
Cj4gCj4gICAgICAgV2hhdCBJIGFzayBpcyBwcm92aWRlIGVub3VnaCBwb2ludGVyIGZvciB1cyB0
byB1bmRlcnN0YW5kIGhvdyB0aGlzIGZpdHMgaW4gWGVuIGNvZGUgYmFzZS4gRm9yIGluc3RhbmNl
LCBhIGxvdAo+ICAgICAgIG9mIHRoZSBNSVNSQSBydWxlcyBoYXZlIGV4cGxhbmF0aW9uIG9ubGlu
ZSAoc2VlIHdlYnNpdGUgc3VjaCBhcyBbMV0gYW5kIFsyXSkuIEFub3RoZXIgYWx0ZXJuYXRpdmUg
aXMgdG8KPiAgICAgICBzdW1tYXJpemUgdGhlIGlzc3VlcyB3aXRoIHlvdXIgb3duIGFyZ3VtZW50
cy4KPiAKPiBUb3RhbGx5IGFncmVlLCBJJ2xsIHRyeSBoYXJkZXIgbmV4dCB0aW1lIGluIGZpbmRp
bmcgb3BlbiBzb3VyY2VzIHdpdGggcnVsZSdzCj4gZGVzY3JpcHRpb25zCj4gCj4gCj4gSSBhbSB3
b25kZXJpbmcsIHdoZXRoZXIgaXQgd291bGQgbWFrZSBzZW5zZSB0byBidXkgYSBzZXQgb2YgTUlT
UkEgQyBvbmxpbmUgY29waWVzIGZvciBwZW9wbGUgd2hvIHJlZ3VsYXJseSByZXZpZXcgb3RoZXIg
cGVvcGxlJ3MKPiBjb2RlIChlZy4gb25lIHBlciBhY3RpdmUgY29tbWl0dGVyKS4gVGhlIGNvc3Qg
aXMgbm90IHRoYXQgaGlnaCBwZXIgbGljZW5zZVRoZSBwcm9ibGVtIGlzIHRoYXQgaXQgd291bGQg
ZXhjbHVkZSBhIHBhcnQgb2YgdGhlCj4gY29tbXVuaXR5Cj4gVGhlcmUgd291bGQgYWxzbyBiZSBh
IG1pbmltYWwgbWFuYWdlbWVudCBvdmVyaGVhZAoKRXhjZWxsZW50IGlkZWEuIEluIGZhY3QsIEkg
d2FzIGRpc2N1c3NpbmcgdGhpcyB3aXRoIEp1bGllbiBsYXN0IHdlZWs6IEkKdGhpbmsgd2UgbmVl
ZCBhbGwgdGhlIGh5cGVydmlzb3IgY29tbWl0dGVycyB0byBoYXZlIGFjY2VzcyB0byB0aGUgTUlT
UkFDCnNwZWMuICBKdWxpZW4gYW5kIEkgYWxyZWFkeSBoYXZlIGEgY29weSB0aGFua3MgdG8gb3Vy
IGVtcGxveWVycy4gV2UgbmVlZApKYW4sIEFuZHJldywgYW5kIEdlb3JnZSB0byBoYXZlIG9uZSBj
b3B5IHRvby4KCklkZWFsbHksIHdlIHNob3VsZCBiZSBhYmxlIHRvIGRvIHRoaXMgaW4gYWR2YW5j
ZSBvbiB0aGUgbWVldGluZyBuZXh0Cm1vbnRoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
