From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] x86/HVM: don't give the wrong impression
 of WRMSR succeeding
Date: Sat, 24 Feb 2018 03:20:20 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1910185E4@SHSMSX101.ccr.corp.intel.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2b0b=fs=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1epQNu-0004FV-5V
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2018 03:20:26 +0000
In-Reply-To: <5A8FE09E02000078001AABC6@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IEZy
aWRheSwgRmVicnVhcnkgMjMsIDIwMTggNDozNyBQTQo+IAo+IC4uLiBmb3Igbm9uLWV4aXN0ZW50
IE1TUnM6IHdybXNyX2h5cGVydmlzb3JfcmVncygpJ3MgY29tbWVudCBjbGVhcmx5Cj4gc2F5cyB0
aGF0IHRoZSBmdW5jdGlvbiByZXR1cm5zIDAgZm9yIHVucmVjb2duaXplZCBNU1JzLCBzbwo+IHtz
dm0sdm14fV9tc3Jfd3JpdGVfaW50ZXJjZXB0KCkgc2hvdWxkIG5vdCBjb252ZXJ0IHRoaXMgaW50
byBzdWNjZXNzLiBXZQo+IGRvbid0IHdhbnQgdG8gdW5jb25kaXRpb25hbGx5IGZhaWwgdGhlIGFj
Y2VzcyB0aG91Z2gsIGFzIHdlIGNhbid0IGJlCj4gY2VydGFpbiB0aGUgbGlzdCBvZiBoYW5kbGVk
IE1TUnMgaXMgY29tcGxldGUgZW5vdWdoIGZvciB0aGUgZ3Vlc3QgdHlwZXMKPiB3ZSBjYXJlIGFi
b3V0LCBzbyBpbnN0ZWFkIG1pcnJvciB3aGF0IHdlIGRvIG9uIHRoZSByZWFkIHBhdGhzIGFuZCBw
cm9iZQo+IHRoZSBNU1IgdG8gZGVjaWRlIHdoZXRoZXIgdG8gcmFpc2UgI0dQLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
