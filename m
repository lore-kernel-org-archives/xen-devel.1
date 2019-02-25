From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 13:40:04 +0000
Message-ID: <234d8052-6911-1b55-38c0-2f067aff56c6@arm.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Rhx=RA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gyGUK-0008HN-KH
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 13:40:08 +0000
In-Reply-To: <49ce8567-f65c-cb74-018b-87216dccf132@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNS8wMi8yMDE5IDEzOjMyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
PiBPbiAyLzI1LzE5IDM6MjIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IFdoeT8gSWYgd2Ug
KmZpcnN0KiBkZWFsIHdpdGggQlVHKCkgYW5kICp0aGVuKiBpbnRyb2R1Y2UgImRlZmF1bHRzIiBw
YXRjaAo+Pj4gd2hpY2ggd2lsbCB1c2UgdGhlIGFscmVhZHkgZml4ZWQgY29kZT8KPj4gVGhpcyBp
cyBub3QgaG93IHlvdXIgZS1tYWlsIGNhbWUgb3V0LiBJdCBjYW1lIG91dCBhcyBpdCBpcyBmaW5l
IHRvIGFkZCAKPj4gImRlZmF1bHQiIHdpdGggQlVHKCkgYW5kIHRoZW4gZml4IGl0IGxhdGVyLgo+
IFllcywgeW91IGFyZSBjb3JyZWN0LiBCdXQgSSBoYXZlIGFuIGltcHJlc3Npb24gdGhhdCBjb3Vw
bGUgb2YgbGV0dGVycyBhZ28KPiBJIGFncmVlZCB0aGF0IHRoaXMgKmlzKiBhbiBpc3N1ZSBhbmQg
aXQgKmRvZXMgbmVlZCogYSBwcm9wZXIgZml4LiBBbmQgc3RhdGVkIHRoYXQKPiB3ZSBtaWdodCB3
YW50IHRvIGZpeCB0aGF0IHNlcGFyYXRlbHkuIFNvLCBhZnRlciB0aGF0IHBvaW50IEkgdGhvdWdo
dCB0aGUgc2VxdWVuY2UKPiB3aWxsIGJlOgo+IDEuIEZpeCBCVUcoKQo+IDIuIFVzZSBmaXhlZCBj
b2RlIGFzIGEgYmFzaXMgZm9yICJkZWZhdWx0cyIKPiBIb3BlIHdlIGFyZSBvbiB0aGUgc2FtZSBw
YWdlIG5vdy4KSSBzdGlsbCBkb24ndCB0aGluayAxLiBoYXMgdG8gYmUgZml4ZWQgZmlyc3QuIEJ1
dCBJIGFtIGhhcHB5IHdpdGggYW55dGhpbmcgYXMgCmxvbmcgYXMgd2Uga2VlcCB0aGUgbnVtYmVy
IG9mIEJVRygpIGFkZGVkIGxpbWl0ZWQuCgo+PiBNeSBwb2ludCBpcyBub3QgYWJvdXQgc2VuZGlu
ZyBzdWNoIGNvZGUgb24gdGhlIG1haWxpbmcgbGlzdC4gTXkgcG9pbnQgaXMgeW91IAo+PiBuZWVk
IHRvIHByb3ZpZGUgYXMgbXVjaCBhcyBwb3NzaWJsZSBkZXRhaWxzIGluIHlvdXIgY292ZXIgbGV0
dGVyIHNvIHdlIGNhbiBiZSAKPj4gbW9yZSBlZmZpY2llbnQgd2hlbiByZXZpZXdpbmcuIEZvciBp
bnN0YW5jZSwgbWFueSBvZiB1cyBkb2VzIG5vdCBoYXZlIGFjY2VzcyAKPj4gdG8gTUlTUkEgc3Bl
YyBiZWNhdXNlIGl0IGlzIG5vdCBmcmVlLi4uCj4gV2hpbGUgSSBhZ3JlZSB0aGF0IG9uZSBoYXMg
dG8gcHJvdmlkZSBhcyBtdWNoIHN1cHBvcnRpbmcgaW5mb3JtYXRpb24gYXMgcG9zc2libGUKPiB3
aGlsZSBwcmVzZW50aW5nIHNvbWUgd29yayB0byB0aGUgY29tbXVuaXR5IGl0IGlzIHRoYXQgSSBj
YW5ub3QgZGlzY2xvc2UKPiBNSVNSQSBydWxlcyBoZXJlLiBBcyB5b3Ugc2FpZCwgTUlTUkEgc3Bl
YyBpcyBub3QgZnJlZS4gQW5kIG9mIGNvdXJzZSBJIGNhbm5vdAo+IGV4cGVjdCBhbnlvbmUgdG8g
YnkgaXQgZm9yIHRoZSByZWFzb24gdGhhdCBzb21lb25lIHdhbnRzIHNvbWUgcGF0Y2ggdG8gYmUK
PiAic2VjdXJlbHkiIG9yIGJsaW5kbHkgcmV2aWV3ZWQuIChCVFcsIHRoaXMgaXMgdGhlIHRvcGlj
IHRoYXQgaGFzIGFscmVhZHkgYmVlbgo+IHJhaXNlZCBpbiBvdXIgdGVhbSBpbnRlcm5hbGx5IGFu
ZCBiZWluZyBkaXNjdXNzZWQpCgpJIHVuZGVyc3RhbmQgdGhhdCBNSVNSQSBpcyBub3QgZnJlZSBh
bmQgZG9lcyBub3QgYXNrIHlvdSB0byBjb3B5L3Bhc3RlIHRoZSBQREYuCgpXaGF0IEkgYXNrIGlz
IHByb3ZpZGUgZW5vdWdoIHBvaW50ZXIgZm9yIHVzIHRvIHVuZGVyc3RhbmQgaG93IHRoaXMgZml0
cyBpbiBYZW4gCmNvZGUgYmFzZS4gRm9yIGluc3RhbmNlLCBhIGxvdCBvZiB0aGUgTUlTUkEgcnVs
ZXMgaGF2ZSBleHBsYW5hdGlvbiBvbmxpbmUgKHNlZSAKd2Vic2l0ZSBzdWNoIGFzIFsxXSBhbmQg
WzJdKS4gQW5vdGhlciBhbHRlcm5hdGl2ZSBpcyB0byBzdW1tYXJpemUgdGhlIGlzc3VlcyAKd2l0
aCB5b3VyIG93biBhcmd1bWVudHMuCgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly9ydWxlcy5zb25hcnNv
dXJjZS5jb20vYy9SU1BFQy0xMzEKWzJdIApodHRwczovL3dpa2kuc2VpLmNtdS5lZHUvY29uZmx1
ZW5jZS9kaXNwbGF5L2MvQVJSMzYtQy4rRG8rbm90K3N1YnRyYWN0K29yK2NvbXBhcmUrdHdvK3Bv
aW50ZXJzK3RoYXQrZG8rbm90K3JlZmVyK3RvK3RoZStzYW1lK2FycmF5Cgo+Pgo+PiBDaGVlcnMs
Cj4+Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
