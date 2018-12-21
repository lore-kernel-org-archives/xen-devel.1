From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Fri, 21 Dec 2018 11:16:44 +0200
Message-ID: <83a4be07-a06f-5585-66f6-4973f80dbfba__12472.5166279406$1545383729$gmane$org@gmail.com>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
 <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
 <20181220173950.GA19641@infradead.org>
 <CAKMK7uF8hmO=z4jy+1b1z5ELLWpjcZpqmLoRiP2BJvwnNpOFeg@mail.gmail.com>
 <20181220183311.GA30801@infradead.org>
 <CAKMK7uFxU9Q5u9TxxHqAgFZuQFCFDvxWHDtRLiQf+3hu_4jPcQ@mail.gmail.com>
 <20181220183851.GA27025@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtuV=O6=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gaGvI-0001rq-G0
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 09:16:48 +0000
Received: by mail-lj1-x242.google.com with SMTP id q2-v6so4071482lji.10
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 01:16:47 -0800 (PST)
In-Reply-To: <20181220183851.GA27025@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjAvMTggODozOCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBE
ZWMgMjAsIDIwMTggYXQgMDc6MzU6MTVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+
IEVyciwgd2l0aCBzdHJlYW1pbmcgRE1BIGJ1ZmZlciBzaGFyaW5nIGlzIHRyaXZpYWwuICBUaGUg
Y29oZXJlbnQgRE1BCj4+PiBhbGxvY2F0b3IgaXMgd2hhdCBjYXVzZXMgYWxsIGtpbmRzIG9mIGhv
cnJpYmxlIGhhY2tzIHRoYXQgY2FuJ3QgYWN0dWFsbHkKPj4+IHdvcmsgb24gdmFyaW91cyBwbGF0
Zm9ybXMuCj4+IEhtLCBJIHRob3VnaHQgdGhlIHN0cmVhbWluZyBkbWEgYXBpIGlzIHRoZSBvbmUg
dGhhdCBjYXVzZXMgYm91bmNlCj4+IGJ1ZmZlcnMgYW5kIGFsbCB0aGF0IGZ1bi4gSWYgeW91J3Jl
IHVubHVja3kgYXQgbGVhc3QuCj4gWWVzIGl0IG1heS4gIEJ1dCBldmVuIGlmIHRoYXQgaGFwcGVu
cyBldmVyeXRoaW5nIHdpbGwgYWN0dWFsbHkgd29yaywKPiBqdXN0IHNsb3dlci4gIFdoaWxlIHRo
ZSBkbWEgY29oZXJlbnQgQVBJIGlzIHNpbXBseSBicm9rZW4uCj4KPiBCdXQgaWYgeW91IGRvbid0
IHdhbnQgYm91bmNlIGJ1ZmZlcmluZyB5b3UgbmVlZCB0byB1c2UgdGhlIGRtYQo+IG5vbmNvaGVy
ZW50IGFsbG9jYXRvciBhcyBwcm9wb3NlZCBoZXJlOgo+Cj4gCWh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9waXBlcm1haWwvaW9tbXUvMjAxOC1EZWNlbWJlci8wMzE5ODIuaHRtbAo+
Cj4gd2hpY2ggY29tYmluZXMgYWxsb2NhdGluZyBtZW1vcnkgdGhhdCBkb2Vzbid0IG5lZWQgdG8g
YmUgYm91bmNlCj4gYnVmZmVyZWQgd2l0aCBhIHNoYXJpbmcgc2NoZW1lIHRoYXQgY2FuIGFjdHVh
bGx5IHdvcmsuClNvLCB0aGUgYm90dG9tIGxpbmUgd2lsbCBiZTogSSBjYW4gdXNlIERNQSBBUEkg
Zm9yIHdoYXQgSSBuZWVkLCBidXQ6CjEuIEkgbmVlZCB0byByZW1vdmUgR0ZQX1VTRVIKMi4gTm8g
bmVlZCBmb3IgRE1BMzIgKHNvIG5vIGNoYW5jZSBmb3IgYm91bmNpbmcgdG8gc3RlcCBpbikKMy4g
SSBtYXkgbmVlZCB0byBjaGVjayBpZiBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgb2YgdGhlIGJ1ZmZl
cgphdCBvbmNlIHdpbGwgYWxzbyBoZWxwLCBlLmcuIG5vIG5lZWQgdG8gaGF2ZSB0aGUgYnVmZmVy
IG1hcHBlZCB1bnRpbAppdCBpcyBkZXN0cm95ZWQKRGlkIEkgZ2V0IGl0IGFsbCByaWdodD8KClRo
YW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
