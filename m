From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 7/7] xen/mm: Clean up
	share_xen_page_with_guest() API
Date: Fri, 9 Mar 2018 14:53:35 +0000
Message-ID: <20180309145335.4d4zfq2ehgoldiya@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-8-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1520601522-2886-8-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDE6MTg6NDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgpIGZ1bmN0aW9ucyBhcmUgdXNl
ZCBieSBjb21tb24gY29kZSwgYW5kIGFyZQo+IGltcGxlbWVudGVkIHRoZSBzYW1lIGJ5IGVhY2gg
YXJjaC4gIE1vdmUgdGhlIGRlY2xhcmF0aW9ucyBpbnRvIHRoZSBjb21tb24gbW0uaAo+IHJhdGhl
ciB0aGFuIGR1cGxpY2F0aW5nIHRoZW0gaW4gZWFjaCBhcmNoL21tLmgKPiAKPiBUdXJuIGFuIGlu
dCByZWFkb25seSBpbnRvIGEgYm9vbGVhbiBlbnVtLCB0byByZXRhaW4gcm8vcncgY29udGV4dCBh
dCB0aGUKPiBjYWxsc2l0ZXMsIGJ1dCB1c2Ugc2hvcnRlciBsYWJlbHMgd2hpY2ggYXZvaWRzIGEg
bGFyZ2UgbnVtYmVyIG9mIHNwbGl0IGxpbmVzLgo+IAo+IEltcGxlbWVudCBzaGFyZV94ZW5fcGFn
ZV93aXRoX3ByaXZpbGVnZWRfZ3Vlc3RzKCkgYXMgYSBzdGF0aWMgaW5saW5lIHdyYXBwZXIKPiBh
cm91bmQgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgpIHRvIGF2b2lkIGhhdmluZyBhIGNhbGwg
aW50byBhIHNlcGFyYXRlCj4gdHJhbnNsYXRpb24gdW5pdCB3aG9zZSBvbmx5IHB1cnBvc2UgaXMg
dG8gc2h1ZmZsZSBmdW5jdGlvbiBhcmd1bWVudHMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
