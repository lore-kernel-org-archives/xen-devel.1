From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.12] libxl: correctly dispose of
 dominfo list in libxl_name_to_domid
Date: Tue, 5 Feb 2019 12:00:12 +0000
Message-ID: <23641.31436.626509.952869@mariner.uk.xensource.com>
References: <20190129113759.24272-1-wei.liu2@citrix.com>
 <23632.22191.716464.795441@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v8BU=QM=citrix.com=prvs=93254badd=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gqzOz-0000Rl-US
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 12:00:33 +0000
In-Reply-To: <23632.22191.716464.795441@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCBmb3ItNC4xMl0gbGlieGw6IGNvcnJlY3Rs
eSBkaXNwb3NlIG9mIGRvbWluZm8gbGlzdCBpbiBsaWJ4bF9uYW1lX3RvX2RvbWlkIik6Cj4gV2Vp
IExpdSB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTJdIGxpYnhsOiBjb3JyZWN0bHkgZGlzcG9zZSBv
ZiBkb21pbmZvIGxpc3QgaW4gbGlieGxfbmFtZV90b19kb21pZCIpOgo+ID4gVGFtYXMgcmVwb3J0
ZWQgc3NpZF9sYWJlbCB3YXMgbGVha2VkLiBVc2UgdGhlIGRlc2lnbmF0ZWQgZnVuY3Rpb24gdG8K
PiA+IGZyZWUgZG9taW5mbyBsaXN0IHRvIGZpeCB0aGUgbGVha2FnZS4KPiA+IAo+ID4gUmVwb3J0
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiBUZXN0ZWQtYnk6IFRhbWFz
IEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiAKPiBBY2tlZC1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCj4gPiBCYWNrcG9ydCBjYW5kaWRhdGUu
Cj4gCj4gTm90ZWQuCgpGb3IgcmVmZXJlbmNlOgoKVGhpcyBidWcgd2FzIGZpcnN0IGludHJvZHVj
ZWQgaW4KCiAgMzVjMTQ5ODUwMzIxNjUxMDA5NTc0NWQwNmQwOWYwZjAxZGRmODAwZQogIGxpYnhl
bmxpZ2h0OiBmaXggbmFtZSB0byBkb21pZCBjb252ZXJzaW9uCgp3aGVyZSB0aGUgY2FsbCB0byBs
aWJ4bF9kb21haW5fbGlzdCB3YXMgaW50cm9kdWNlZC4gIEEgZml4IHdhcwphdHRlbXB0ZWQgaW4K
CiAgY2JjOTdkNTcwYzA5ZmY5YTFkYjVhZjE4ZjVlNWRiNTU2NWFiMzUwNgogIGxpYnhlbmxpZ2h0
OiBmaXggbWVtb3J5IGxlYWtzCgp3aGljaCBpcyB3aGVyZSB0aGUgYGZyZWUoZG9taW5mbyknIGNh
bGwgd2FzIGludHJvZHVjZWQsIGJ1dCB0aGF0IHdhcwpub3QgcmlnaHQuICBUaGF0IGxhdHRlciBj
b21taXQgaXMgaW4gc3RhZ2luZy0zLjQuICBTbyBhbGwgc3VwcG9ydGVkCihhbmQgc2VjdXJpdHkt
c3VwcG9ydGVkKSB2ZXJzaW9ucyBhcmUgYWZmZWN0ZWQuICBJIGhhdmUgYmFja3BvcnRlZAp0aGlz
IHRvIDQuMTAgYW5kIDQuMTEuICAoQXMgaXQgZG9lc24ndCBzZWVtIHRvIG1lIHRvIGJlIGEgc2Vj
dXJpdHkKaXNzdWUgSSBoYXZlIG5vdCBmaXhlZCBpdCBvbiBlYXJsaWVyIGJyYW5jaGVzLikKClRo
YW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
