From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/nmi: lower initial watchdog frequency
 to avoid boot hangs
Date: Thu, 08 Feb 2018 02:12:29 -0700
Message-ID: <5A7C228D02000078001A649E@prv-mh.provo.novell.com>
References: <1517865522-3248-1-git-send-email-igor.druzhinin@citrix.com>
 <5A79E0CB02000078001A5BBA@prv-mh.provo.novell.com>
 <990db14d-4ee2-bf95-20b4-1a050fc8fc9e@citrix.com>
 <5A79E49A02000078001A5C07@prv-mh.provo.novell.com>
 <b6c539a3-e720-ab09-9feb-8ca91f67379a@citrix.com>
 <5A7AD13D02000078001A5F03@prv-mh.provo.novell.com>
 <c00ada03-04d6-9ed8-55a1-1473cac092d8@citrix.com>
 <5A7B086E02000078001A6095@prv-mh.provo.novell.com>
 <7e4501cd-08ad-2029-d1bf-1ea5517d160c@citrix.com>
 <5A7B23FC02000078001A613F@prv-mh.provo.novell.com>
 <0cd19fe5-02b3-fae9-9b16-2cc44b169f7e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0cd19fe5-02b3-fae9-9b16-2cc44b169f7e@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE4IGF0IDE4OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDIvMTggMTU6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBbHNvIHlvdSBj
b21wbGV0ZWx5IGlnbm9yZSBteSBhcmd1bWVudCBhZ2FpbnN0IHRoZSBzZWVtaW5nbHkKPj4gcmFu
ZG9tIGRpdmlzaW9uIGJ5IDEwLCBpbmNsdWRpbmcgdGhlIHJlc3VsdGluZyBxdWVzdGlvbiBvZiB3
aGF0IHlvdQo+PiBtZWFuIHRvIGRvIG9uY2UgMTBIeiBhbHNvIHR1cm5zIG91dCB0b28gaGlnaCBh
IGZyZXF1ZW5jeS4KPiAKPiBXZSd2ZSBnb3QgdG8gcGljayBhIGZyZXF1ZW5jeS4gIFRoZSBjdXJy
ZW50IDEwMEh6IGlzIGp1c3QgYXMgYXJiaXRyYXJ5Cj4gYXMgdGhlIHByb3Bvc2VkIG5ldyAxMEh6
LgoKTm90IGV4YWN0bHkgLSB0aGUgMTAwSHogaXMgc2ltcGx5IHRoZSBmcmVxdWVuY3kgd2UgcnVu
IHRoZSBtYWluIHRpY2sKYXQsIHNvIHdoaWxlIHJhbmRvbSBpdCBpcyBub3QgYXMgcmFuZG9tIGFz
IGFueSBmdXJ0aGVyIGRlcml2ZWQgdmFsdWUKd2hpY2ggaGFzIG5vIHByb3BlciByZWFzb24gYmVo
aW5kIGl0LgoKVGhlcmUncyBvbmUgbW9yZSBwb2ludCB3cnQgeW91ciBhcmd1bWVudCBvZiBvdmVy
aGVhZDogSWYgc2VydmljaW5nCmFuIE5NSSB0YWtlcyB0aGF0IGxvbmcgb24gdGhvc2UgYm94ZXMs
IHlvdSdyZSBiYXNpY2FsbHkgc2F5aW5nIHlvdQphcmUgaGFwcHkgdG8gd2FzdGUgYXQgbGVhc3Qg
MSUgb2YgYSBjb3JlJ3MgYmFuZHdpZHRoIG9uIGEKZGVidWdnaW5nIGZlYXR1cmUuIElzIHRoYXQg
cmVhc29uYWJsZSBmb3IgYSBwcm9kdWN0aW9uIHNldHVwPyBBbmQKY29uc2lkZXJpbmcgdGhhdCBJ
J2QgZXhwZWN0IHRoZSBwYXRjaCB0byBoYXZlIGNob3NlbiBlLmcuIEhaIC8gNSwKSFogLyA0LCBv
ciBldmVuIEhaIC8gMiBpZiB0aGF0IHdvcmtlZCByZWxpYWJseSwgSSBjb3VsZCBldmVuIGNvbmNs
dWRlCnlvdSdyZSBoYXBweSB0byBzcGVuZCBzb21ld2hlcmUgYmV0d2VlbiA1IGFuZCAxMCUgb2Yg
b25lCmNvcmUncyBiYW5kd2lkdGguIChGQU9EIGFsbCB0aGlzIGlzIGJhc2VkIG9uIHRoZSAxSHog
ZnJlcXVlbmN5IHdlCi0gaWlyYyAtIHJ1biB0aGUgTk1JIGF0IGxhdGVyIG9uLikgVG8gbWUgdGhp
cyBpcyBhbm90aGVyIGNsZWFyIGFyZ3VtZW50CnRvIHR1cm4gb2ZmIHRoZSB3YXRjaGRvZyBvbiB0
aG9zZSBzeXN0ZW1zLCByYXRoZXIgdGhhbiB0cnlpbmcgdG8KImZpeCIgaXRzIHByb2JpbmcuCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
