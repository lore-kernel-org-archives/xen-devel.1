From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 07/12] tools/xenstore: Re-introduce (fake)
 xs_restrict call to preserve ABI
Date: Mon, 15 Oct 2018 14:47:12 +0100
Message-ID: <23492.39520.527757.123976@mariner.uk.xensource.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
 <20181012151215.32455-8-ian.jackson@eu.citrix.com>
 <121936fd-5464-b214-646c-3e48486c669e@knorrie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w2gt=m3=citrix.com=prvs=81941a82a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gC3DJ-0007zQ-TF
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 13:47:17 +0000
In-Reply-To: <121936fd-5464-b214-646c-3e48486c669e@knorrie.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hans van Kranenburg <hans@knorrie.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Stefan Bader <stefan.bader@canonical.com>
List-Id: xen-devel@lists.xenproject.org

SGFucyB2YW4gS3JhbmVuYnVyZyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDA3LzEy
XSB0b29scy94ZW5zdG9yZTogUmUtaW50cm9kdWNlIChmYWtlKSB4c19yZXN0cmljdCBjYWxsIHRv
IHByZXNlcnZlIEFCSSIpOgo+IE9uIDEwLzEyLzIwMTggMDU6MTIgUE0sIElhbiBKYWNrc29uIHdy
b3RlOgo+ID4gRnJvbTogSGFucyB2YW4gS3JhbmVuYnVyZyA8aGFuc0Brbm9ycmllLm9yZz4KPiAK
PiBObywgdGhpcyB3YXMgaW4gdGhlIGNoYW5nZXMgdGhhdCBJIGNvcGllZCBiYWNrIGZyb20gVWJ1
bnR1LCBpdCB3YXMKPiB3cml0dGVuIGJ5IFN0ZWZhbiBCYWRlcjoKPiAKPiAtLS0tID44IC0tLS0K
PiAKPiBEZXNjcmlwdGlvbjogUmUtaW50cm9kdWNlIGZha2UgeHNfcmVzdHJpY3QgQVBJIGNhbGwK
PiAgbGlieGVuc3RvcmUgY2Fubm90IHJlbW92ZSBhbiBBUEkgZnVuY3Rpb24gd2l0aG91dCBjaGFu
Z2luZyBpdHMgdmVyc2lvbgo+ICBudW1iZXIuIEFzIGxvbmcgYXMgd2Ugd2FudCB0byByZW1haW4g
d2l0aCAzLjAgd2UgaGF2ZSB0byBrZWVwIGl0IGFyb3VuZC4KPiAgRGViaWFuIG1pZ2h0IGRlY2lk
ZSB0byBpbmNyZW1lbnQgdGhlIHZlcnNpb24gYXQgc29tZSBwb2ludCBidXQgd2UgZG8gbm90Cj4g
IGtub3cgaG93IGFuZCB3aGVuLiBTbyBmb3Igbm93IGtlZXAgdGhlIHZlcnNpb24gc3RhYmxlLgo+
IAo+IEF1dGhvcjogU3RlZmFuIEJhZGVyIDxzdGVmYW4uYmFkZXJAY2Fub25pY2FsLmNvbT4KCkhy
bS4gIFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuICBJIGhhdmUgZml4ZWQgdGhlIGNvbW1p
dCBhdXRob3IgaW4KbXkgdXBzdHJlYW0gYnJhbmNoLiAgSSB0aGluayB0aGlzIGxvc3NhZ2UgaXMg
ZHVlIHRvIGEgYnVnIGluIGdicCBwcQo6LS8uCgpBbmQsIENDaW5nIFN0ZWZhbiBmb3IgZm9ybSdz
IHNha2UuICBTdGVmYW4sIEknbSB1cHN0cmVhbWluZyB0aGlzCnBhdGNoLgoKUmVnYXJkcywKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
