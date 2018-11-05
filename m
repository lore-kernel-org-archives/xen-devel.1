From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: put x86emul_{read,
 write}_dr under CONFIG_PV
Date: Mon, 5 Nov 2018 17:44:39 +0000
Message-ID: <5bdf0868-8cce-0fe1-662d-6f58ebb215c8@citrix.com>
References: <20181105173858.30786-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y45x=nq=citrix.com=prvs=8403a2554=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gJivb-00073f-LM
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 17:44:43 +0000
In-Reply-To: <20181105173858.30786-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTEvMTggMTc6MzgsIFdlaSBMaXUgd3JvdGU6Cj4gQSBidWlsZCBicmVha2FnZSBpcyBk
aXNjb3ZlcmVkIGJ5IGEgbm9uLWRlYnVnIGJ1aWxkLiBEZWJ1ZyBidWlsZAo+IHdvcmtlZCBiZWNh
dXNlIHRoZSBBU1NFUlQgbWFkZSB0aGUgY29tcGlsZXIgZWxpbWluYXRlIHRoZSByZXN0IG9mIHRo
ZQo+IGZ1bmN0aW9ucy4KPgo+IEN1cnJlbnRseSB0aGV5IGFyZSBQViBvbmx5LiBUaGVyZSBhcmUg
Y29tbWVudHMgYWxsdWRpbmcgdG8gcG9zc2libGUKPiBmdXR1cmUgSFZNIHN1cHBvcnQgYnV0IHdl
IGNhbiBjcm9zcyB0aGUgYnJpZGUgd2hlbiB3ZSBnZXQgdGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKSG1tIC0gdGhpcyBpcyBkaXNhcHBvaW50
aW5nLCBidXQgcHJvYmFibHkgdGhlIGxlYXN0IGJhZCBjb3Vyc2Ugb2YgYWN0aW9uLgoKTG9uZ3Rl
cm0gSSB3YW50IHRvIG1lcmdlIHRoZSBQViBhbmQgSFZNIENSJ3MgaW50byBhcmNoX3ZjcHUgd2hp
Y2ggYXZvaWRzCm9uZSBvZiB0aGUgdHdvIGJ1aWxkIGJyZWFrYWdlcywgYnV0IHRoZSBkcjcgcGF0
aCB3aWxsIGFsd2F5cyBoYXZlIGEgUFYKY29uZGl0aW9uYWwgcGFydC4KCkFja2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
