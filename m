From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Wed, 17 Jan 2018 17:58:43 +0000
Message-ID: <75449e60-6e31-b1ba-8224-52400d9810d2@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
 <20180117173205.h2etk5yh3se4e5hj@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=e+bs=em=citrix.com=prvs=548010f8d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ebs5d-0008Hm-3A
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 18:05:33 +0000
In-Reply-To: <20180117173205.h2etk5yh3se4e5hj@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDEvMTggMTc6MzIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MTcsIDIwMTggYXQgMDQ6MjQ6MjdQTSArMDAwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IFJvZ2Vy
IFBhdSBNb25uZSB3cml0ZXMgKCJbUEFUQ0ggNi82XSBmaXJtd2FyZS9zaGltOiBmaXggYnVpbGQg
cHJvY2VzcyB0byB1c2UgUE9TSVggZmluZCBvcHRpb25zIik6Cj4+PiBUaGUgLXByaW50ZiBmaW5k
IG9wdGlvbiBpcyBub3QgUE9TSVggY29tcGF0aWJsZSwgc28gcmVwbGFjZSBpdCB3aXRoCj4+PiBh
bm90aGVyIHJ1bmUuCj4+IC4uLgo+Pj4gIAkJICBjZCAkKEQpLyQoZCk7IFwKPj4+IC0JCSAgZmlu
ZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlwZSBkIC1wcmludGYgIi4vJVBcbiIgfCAgeGFyZ3MgbWtk
aXIgLXApOykKPj4+ICsJCSAgZmluZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlwZSBkIC1leGVjIHNo
IC1jIFwKPj4+ICsJCSAgICAgICJlY2hvIHt9IHwgc2VkICdzLF4kKFhFTl9ST09UKS8kKGQpLyws
ZycgfCB4YXJncyBta2RpciAtcCIgXDspOykKPj4gVGhpcyBpcyBub3cgYSBwcmV0dHkgbmFzdHkg
c2hlbGwgY29uc3RydWN0Lgo+Pgo+PiBJZiB5b3UncmUgZ29pbmcgdG8gdXNlIHNlZCwgeW91IGNv
dWxkIGp1c3QKPj4gICAgZmluZCAuLi4gLXByaW50IHwgc2VkIC4uLiB8IHhhcmdzIG1rZGlyIC1w
Cj4gSSB0aGluayBJIHdpbGwgZ28gd2l0aCB0aGlzIG9uZS4uLgo+Cj4+IFN1YnN0aXR1dGluZyB7
fSBpbnRvIHRoZSBtaWRkbGUgb2YgdGhlIHNoZWxsIHJ1bmUgaXMgYmFkIHByYWN0aWNlIGluCj4+
IGdlbmVyYWwgYmVjYXVzZSBpdCBtaWdodCBjb250YWluIG1ldGFjaGFyYWN0ZXJzIG9yIHNwYWNl
cy4gIEluIG91cgo+PiBidWlsZCBzeXN0ZW0gdGhpcyBkb2Vzbid0IG1hdHRlciBiZWNhdXNlIHRo
YXQgYnJlYWtzIGFueXdheSwgYnV0IGl0J3MKPj4gdmVyeSBwb29yIHN0eWxlIChhbmQgYWxzbyBp
dCBidXJpZXMgdGhlIGFjdHVhbCBkYXRhIGZsb3cgcGF0aCBpbnRvIHRoZQo+PiBtaWRkbGUgb2Yg
YSBjb21wbGljYXRlZCBtYW5nbGVtZW50KS4KPj4KPj4gSWYgeW91IHdhbnRlZCB0byB1c2UgLWV4
ZWMgYW5kIHNoLCB5b3UgY291bGQgZG8gc29tZXRoaW5nIGxpa2UgdGhpcwo+PiAgICAtZXhlYyBz
aCAtYyAnZXhlYyBta2RpciAiJHsxIyQoWEVOX1JPT1R9LyQoZCkvfSInIHgge30KPj4gbWF5YmUu
Cj4gLi4uIGJlY2F1c2UgSSBjYW5ub3QgcmVhbGx5IG1ha2UgIzIgd29yaywgYW5kIEknbSBub3Qg
c3VyZSBJIGZ1bGx5Cj4gdW5kZXJzdGFuZCBpdC4KClByb2JhYmx5IGJlY2F1c2UgaXQgbmVlZHMg
dG8gYmUgJ2V4ZWMgbWtkaXIgIiQkezEgLi4uLiBzbyBzaGVsbCBzZWVzICR7MQp3aGVuIGl0cyBw
YXNzZWQgdGhyb3VnaCBNYWtlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
