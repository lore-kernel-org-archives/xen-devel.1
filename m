From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] README: require Python 2.6 or newer
Date: Fri, 23 Feb 2018 15:47:11 +0000
Message-ID: <50d211f9-7333-b185-72eb-4742bc790890@citrix.com>
References: <20180222193458.17118-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=a0jm=fr=citrix.com=prvs=58510dbfb=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1epFZ7-000521-65
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:47:17 +0000
In-Reply-To: <20180222193458.17118-1-cardoe@cardoe.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjIvMjAxOCAwNzozNCBQTSwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4gSW5jcmVhc2Ug
dGhlIG1pbmltdW0gcmVxdWlyZWQgUHl0aG9uIHRvIDIuNiBvciBuZXdlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4gLS0tCj4gQ0M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ0M6IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDQzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+
IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IFRp
bSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IC0tLQo+IFB5dGhvbiAyLjYgc2hpcHBlZCBPY3QgMXN0IDIwMDguIEl0IHdhcyBpbmNsdWRl
ZCBhcyB0aGUKPiBkZWZhdWx0IFB5dGhvbiBpbiBkaXN0cm9zIGxpa2UgUkhFTDYsIHdoaWNoIGl0
c2VsZiBzaGlwcGVkCj4gTm92IDEwdGggMjAxMC4KCkJ1dCBvZiBjb3Vyc2UsIHdhcyBub3QgaW5j
bHVkZWQgaW4gUkhFTCA1LgoKRldJVyBJIHRhbGtlZCB0byBvbmUgZ3V5IEkga25vdyB0aGF0J3Mg
c3RpbGwgdXNpbmcgWGVuIG9uIFJIRUwgNTsgaGUncwp1c2luZyB0aGUgdmVyc2lvbiBvZiBYZW4g
dGhhdCBjYW1lIHdpdGggaXQgKDMuMSBvciBzb21ldGhpbmcgY3JhenkgbGlrZQp0aGF0KS4gIEFz
a2VkIGFib3V0IHJ1bm5pbmcgYSBuZXdlciB2ZXJzaW9uIG9mIFhlbiwgaGUgc2FpZDoKCiJpIGRv
bid0IHNlZSBhbnkgdmFsdWUgdXBkYXRpbmcgdG8geGVuIDQgYW5kIHN0aWxsIHJ1bm5pbmcgZWw1
CnRvb2xzdGFjay4uIGFzIGZvciBzYW1lIHRyb3VibGUgeW91IGNhbiBqdXN0IHVwZ3JhZGUgdG8g
ZWw2IGFuZCB4ZW40Y2VudG9zIgoKU28gSSdtIGEgIkknbSBoYXBweSB3aXRoIHRoaXMgY2hhbmdl
IGJ1dCB3b3VsZG4ndCBhcmd1ZSBmb3IgaXQiICgrMSBvbiBhCi0yIHRvICsyIHNjYWxlKS4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
