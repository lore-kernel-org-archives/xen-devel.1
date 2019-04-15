From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/msr: Definitions for
 MSR_INTEL_CORE_THREAD_COUNT
Date: Mon, 15 Apr 2019 09:18:54 -0600
Message-ID: <5CB4A0DE0200007800155514@prv1-mh.provo.novell.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
 <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
 <5CB43C2E02000078001553EC@prv1-mh.provo.novell.com>
 <1d3c66a8-d964-0e92-ba68-9cf5cb1fb384@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hG3KJ-0001HV-5O
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:15:19 +0000
In-Reply-To: <1d3c66a8-d964-0e92-ba68-9cf5cb1fb384@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzE1LzE5IDEw
OjMwIEFNID4+Pgo+T24gMTUvMDQvMjAxOSAwOTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gMDQvMTMvMTkgNjoyMiBQ
TSAKCj4+Pi0tLSBhL3hlbi9hcmNoL3g4Ni9tc3IuYysrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwo+
Pj4gQEAgLTEzMSw2ICsxMzEsNyBAQCBpbnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHVpbnQzMl90IG1zciwgdWludDY0X3QgKnZhbCkKPj4+IGNhc2UgTVNSX1BSRURfQ01EOgo+
Pj4gY2FzZSBNU1JfRkxVU0hfQ01EOgo+Pj4gLyogV3JpdGUtb25seSAqLwo+Pj4gKyAgICBjYXNl
IE1TUl9JTlRFTF9DT1JFX1RIUkVBRF9DT1VOVDoKPj4+IGNhc2UgTVNSX1RTWF9GT1JDRV9BQk9S
VDoKPj4+IC8qIE5vdCBvZmZlcmVkIHRvIGd1ZXN0cy4gKi8KPj4+IGdvdG8gZ3BfZmF1bHQ7Cj4+
IEluIGEgcHJpdmF0ZSB0YWxrIHdlIGhhZCwgZGlkbid0IHlvdSBtZW50aW9uIHRoZXJlIGlzIGF0
IGxlYXN0IG9uZSBPUyAod2FzIGl0IE9TWCkKPj4gdGhhdCB1bmNvbmRpdGlvbmFsbHkgcmVhZHkg
dGhpcyBNU1I/IERlc3BpdGUgYXNzdW1pbmcgdGhlcmUgYXJlIG90aGVyIGlzc3Vlcwo+PiB3aXRo
IE9TWCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGF2b2lkIGdpdmluZyAjR1AoMCkgYmFjayBo
ZXJlPyBJIHJlYWxpemUgd2UgY2FuJ3QKPj4geWV0IGdpdmUgYmFjayBhIGZ1bGx5IGNvbnNpc3Rl
bnQgdmFsdWUgaGVyZSwgbG9va2luZyBhdCB3aGF0IGNvbmNsdXNpb25zIExpbnV4Cj4+IGRyYXdz
IGZyb20gb3RoZXIgQ1BVSUQgb3V0cHV0LCBjb3VsZG4ndCAweDAwMDEwMDAxIGJlIHVzZWQgYXMg
ImZha2UiIHZhbHVlPwo+Cj5JIGRpZCBjb25zaWRlciB0aGF0IG9wdGlvbiwgYnV0IGZvciBhbnlv
bmUgbG9va2luZyBhdCB0aGlzIE1TUiwgaXQgaXMKPmxpa2VseSB0byBtYWtlIHRoZSBzaXR1YXRp
b24gd29yc2UgcmF0aGVyIHRoYW4gYmV0dGVyLgo+Cj5UaGUgb3RoZXIgb3B0aW9uIHRvIGNvbnNp
ZGVyIGlzIHJldGFpbmluZyB0aGUgY3VycmVudCBsZWFreSBiZWhhdmlvdXIuIAo+VGhlcmUgaGF2
ZW4ndCBiZWVuIG9idmlvdXMgcHJvYmxlbXMgdGh1cyBmYXIsIGFuZCB0aGUgYWNjdXJhdGUgdG9w
b2xvZ3kKPmluZm9ybWF0aW9uIGlzIGdvaW5nIHRvIGJlIGFycml2aW5nIHNob3J0bHkgdG8gbWVz
aCBpbiB3aXRoIHRoZSBjb3JlCj5zY2hlZHVsaW5nIHdvcmsuCgpJbW8gdGhpcyB3b3VsZCBzdGls
bCBiZSBiZXR0ZXIgdGhhbiBkZWxpdmVyaW5nICNHUCgwKS4KCkphbgoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
