From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 1/8] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Thu, 22 Mar 2018 10:07:06 +0000
Message-ID: <20180322100706.e2vg6oct4ji6pj3p@citrix.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB4202000078001B3707@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f68c=gm=citrix.com=prvs=6120e2e14=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyx7l-0003OY-9f
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:07:09 +0000
Content-Disposition: inline
In-Reply-To: <5AAFCB4202000078001B3707@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6Mzc6NTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW50cm9kdWNlIGEgc3ludGhldGljIGZlYXR1cmUgZmxhZyB0byB1c2UgYWx0ZXJuYXRp
dmUgaW5zdHJ1Y3Rpb24KPiBwYXRjaGluZyB0byBOT1Agb3V0IGFsbCBjb2RlIG9uIGVudHJ5L2V4
aXQgcGF0aHMuIEhhdmluZyBOT1BzIGhlcmUgaXMKPiBnZW5lcmFsbHkgYmV0dGVyIHRoYW4gdXNp
bmcgY29uZGl0aW9uYWwgYnJhbmNoZXMuCj4gCj4gQWxzbyBjaGFuZ2UgdGhlIGxpbWl0IG9uIHRo
ZSBudW1iZXIgb2YgYnl0ZXMgd2UgY2FuIHBhdGNoIGluIG9uZSBnbyB0bwo+IHRoYXQgcmVzdWx0
aW5nIGZyb20gdGhlIGVuY29kaW5nIGluIHN0cnVjdCBhbHRfaW5zdHIgLSB0aGVyZSdzIG5vIHBv
aW50Cj4gcmVkdWNpbmcgaXQgYmVsb3cgdGhhdCBsaW1pdCwgYW5kIHdpdGhvdXQgYSBjaGVjayBi
ZWluZyBpbiBwbGFjZSB0aGF0Cj4gdGhlIGxpbWl0IGlzbid0IGFjdHVhbGx5IGV4Y2VlZGVkLCBz
dWNoIGFuIGFydGlmaWNpYWwgYm91bmRhcnkgaXMgYQo+IGxhdGVudCByaXNrLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
