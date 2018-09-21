From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 8/9] cpufreq: convert to a single
 post-init driver (hooks) instance
Date: Fri, 21 Sep 2018 15:06:29 +0100
Message-ID: <20180921140629.ppjheckt5vij27gk@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C4FC02000078001E74C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3M57-0004tN-22
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 14:06:53 +0000
Content-Disposition: inline
In-Reply-To: <5B97C4FC02000078001E74C7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6Mzc6MDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyByZWR1Y2VzIHRoZSBwb3N0LWluaXQgbWVtb3J5IGZvb3RwcmludCwgZWxpbWlu
YXRlcyBhIHBvaW50bGVzcwo+IGxldmVsIG9mIGluZGlyZWN0aW9uIGF0IHRoZSB1c2Ugc2l0ZXMs
IGFuZCBhbGxvd3MgZm9yIHN1YnNlcXVlbnQKPiBhbHRlcm5hdGl2ZXMgY2FsbCBwYXRjaGluZy4K
PiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBhZGQgYSBuYW1lIHRvIHRoZSBQb3dl
ck5vdyEgaW5zdGFuY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
