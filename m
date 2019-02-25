From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 15:47:31 +0200
Message-ID: <6d85ae68-943d-9611-53e0-5b48081514d9@gmail.com>
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
 <234d8052-6911-1b55-38c0-2f067aff56c6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyGbf-0000FJ-07
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 13:47:43 +0000
Received: by mail-lf1-x143.google.com with SMTP id n15so6911649lfe.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 05:47:41 -0800 (PST)
In-Reply-To: <234d8052-6911-1b55-38c0-2f067aff56c6@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNS8xOSAzOjQwIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4KPiBPbiAyNS8w
Mi8yMDE5IDEzOjMyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4gT24gMi8yNS8x
OSAzOjIyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gV2h5PyBJZiB3ZSAqZmlyc3QqIGRl
YWwgd2l0aCBCVUcoKSBhbmQgKnRoZW4qIGludHJvZHVjZSAiZGVmYXVsdHMiIAo+Pj4+IHBhdGNo
Cj4+Pj4gd2hpY2ggd2lsbCB1c2UgdGhlIGFscmVhZHkgZml4ZWQgY29kZT8KPj4+IFRoaXMgaXMg
bm90IGhvdyB5b3VyIGUtbWFpbCBjYW1lIG91dC4gSXQgY2FtZSBvdXQgYXMgaXQgaXMgZmluZSB0
byAKPj4+IGFkZCAiZGVmYXVsdCIgd2l0aCBCVUcoKSBhbmQgdGhlbiBmaXggaXQgbGF0ZXIuCj4+
IFllcywgeW91IGFyZSBjb3JyZWN0LiBCdXQgSSBoYXZlIGFuIGltcHJlc3Npb24gdGhhdCBjb3Vw
bGUgb2YgbGV0dGVycyAKPj4gYWdvCj4+IEkgYWdyZWVkIHRoYXQgdGhpcyAqaXMqIGFuIGlzc3Vl
IGFuZCBpdCAqZG9lcyBuZWVkKiBhIHByb3BlciBmaXguIEFuZCAKPj4gc3RhdGVkIHRoYXQKPj4g
d2UgbWlnaHQgd2FudCB0byBmaXggdGhhdCBzZXBhcmF0ZWx5LiBTbywgYWZ0ZXIgdGhhdCBwb2lu
dCBJIHRob3VnaHQgCj4+IHRoZSBzZXF1ZW5jZQo+PiB3aWxsIGJlOgo+PiAxLiBGaXggQlVHKCkK
Pj4gMi4gVXNlIGZpeGVkIGNvZGUgYXMgYSBiYXNpcyBmb3IgImRlZmF1bHRzIgo+PiBIb3BlIHdl
IGFyZSBvbiB0aGUgc2FtZSBwYWdlIG5vdy4KPiBJIHN0aWxsIGRvbid0IHRoaW5rIDEuIGhhcyB0
byBiZSBmaXhlZCBmaXJzdC4gQnV0IEkgYW0gaGFwcHkgd2l0aCAKPiBhbnl0aGluZyBhcyBsb25n
IGFzIHdlIGtlZXAgdGhlIG51bWJlciBvZiBCVUcoKSBhZGRlZCBsaW1pdGVkLgpvaywgSSBzZWUK
Pgo+Cj4+PiBNeSBwb2ludCBpcyBub3QgYWJvdXQgc2VuZGluZyBzdWNoIGNvZGUgb24gdGhlIG1h
aWxpbmcgbGlzdC4gTXkgCj4+PiBwb2ludCBpcyB5b3UgbmVlZCB0byBwcm92aWRlIGFzIG11Y2gg
YXMgcG9zc2libGUgZGV0YWlscyBpbiB5b3VyIAo+Pj4gY292ZXIgbGV0dGVyIHNvIHdlIGNhbiBi
ZSBtb3JlIGVmZmljaWVudCB3aGVuIHJldmlld2luZy4gRm9yIAo+Pj4gaW5zdGFuY2UsIG1hbnkg
b2YgdXMgZG9lcyBub3QgaGF2ZSBhY2Nlc3MgdG8gTUlTUkEgc3BlYyBiZWNhdXNlIGl0IAo+Pj4g
aXMgbm90IGZyZWUuLi4KPj4gV2hpbGUgSSBhZ3JlZSB0aGF0IG9uZSBoYXMgdG8gcHJvdmlkZSBh
cyBtdWNoIHN1cHBvcnRpbmcgaW5mb3JtYXRpb24gCj4+IGFzIHBvc3NpYmxlCj4+IHdoaWxlIHBy
ZXNlbnRpbmcgc29tZSB3b3JrIHRvIHRoZSBjb21tdW5pdHkgaXQgaXMgdGhhdCBJIGNhbm5vdCBk
aXNjbG9zZQo+PiBNSVNSQSBydWxlcyBoZXJlLiBBcyB5b3Ugc2FpZCwgTUlTUkEgc3BlYyBpcyBu
b3QgZnJlZS4gQW5kIG9mIGNvdXJzZSAKPj4gSSBjYW5ub3QKPj4gZXhwZWN0IGFueW9uZSB0byBi
eSBpdCBmb3IgdGhlIHJlYXNvbiB0aGF0IHNvbWVvbmUgd2FudHMgc29tZSBwYXRjaCAKPj4gdG8g
YmUKPj4gInNlY3VyZWx5IiBvciBibGluZGx5IHJldmlld2VkLiAoQlRXLCB0aGlzIGlzIHRoZSB0
b3BpYyB0aGF0IGhhcyAKPj4gYWxyZWFkeSBiZWVuCj4+IHJhaXNlZCBpbiBvdXIgdGVhbSBpbnRl
cm5hbGx5IGFuZCBiZWluZyBkaXNjdXNzZWQpCj4KPiBJIHVuZGVyc3RhbmQgdGhhdCBNSVNSQSBp
cyBub3QgZnJlZSBhbmQgZG9lcyBub3QgYXNrIHlvdSB0byBjb3B5L3Bhc3RlIAo+IHRoZSBQREYu
Cj4KPiBXaGF0IEkgYXNrIGlzIHByb3ZpZGUgZW5vdWdoIHBvaW50ZXIgZm9yIHVzIHRvIHVuZGVy
c3RhbmQgaG93IHRoaXMgCj4gZml0cyBpbiBYZW4gY29kZSBiYXNlLiBGb3IgaW5zdGFuY2UsIGEg
bG90IG9mIHRoZSBNSVNSQSBydWxlcyBoYXZlIAo+IGV4cGxhbmF0aW9uIG9ubGluZSAoc2VlIHdl
YnNpdGUgc3VjaCBhcyBbMV0gYW5kIFsyXSkuIEFub3RoZXIgCj4gYWx0ZXJuYXRpdmUgaXMgdG8g
c3VtbWFyaXplIHRoZSBpc3N1ZXMgd2l0aCB5b3VyIG93biBhcmd1bWVudHMuCj4KVG90YWxseSBh
Z3JlZSwgSSdsbCB0cnkgaGFyZGVyIG5leHQgdGltZSBpbiBmaW5kaW5nIG9wZW4gc291cmNlcyB3
aXRoIHJ1bGUncwpkZXNjcmlwdGlvbnMKPiBDaGVlcnMsCj4KPiBbMV0gaHR0cHM6Ly9ydWxlcy5z
b25hcnNvdXJjZS5jb20vYy9SU1BFQy0xMzEKPiBbMl0gCj4gaHR0cHM6Ly93aWtpLnNlaS5jbXUu
ZWR1L2NvbmZsdWVuY2UvZGlzcGxheS9jL0FSUjM2LUMuK0RvK25vdCtzdWJ0cmFjdCtvcitjb21w
YXJlK3R3bytwb2ludGVycyt0aGF0K2RvK25vdCtyZWZlcit0byt0aGUrc2FtZSthcnJheQo+Cj4+
Pgo+Pj4gQ2hlZXJzLAo+Pj4KPj4KPgpUaGFuayB5b3UsCk9sZWtzYW5kcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
