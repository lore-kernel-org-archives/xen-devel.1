From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH qemu-xen-traditional] xen/pt: allow QEMU to
 request MSI unmasking at bind time
Date: Wed, 10 Oct 2018 15:56:59 +0100
Message-ID: <23486.4923.67981.678028@mariner.uk.xensource.com>
References: <1527058885.8186.68.camel@infradead.org>
 <1529314520-79691-1-git-send-email-andraprs@amazon.com>
 <20180618114352.xelerr457ev2e5kj@mac>	<1529570276822.28578@amazon.com>
 <1533032534.16128.19.camel@amazon.co.uk>	<1537173602617.52049@amazon.com>
 <23484.45915.156520.714628@mariner.uk.xensource.com>
 <1539098633397.3404@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ysci=mw=citrix.com=prvs=814707a66=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAFvf-0001Pd-BX
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 14:57:39 +0000
In-Reply-To: <1539098633397.3404@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Paraschiv, Andra-Irina" <andraprs@amazon.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGFyYXNjaGl2LCBBbmRyYS1JcmluYSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIHFl
bXUteGVuLXRyYWRpdGlvbmFsXSB4ZW4vcHQ6IGFsbG93IFFFTVUgdG8gcmVxdWVzdCBNU0kgdW5t
YXNraW5nIGF0IGJpbmQgdGltZSIpOgo+IE9uZSBvZiB0aGUgdXNlIGNhc2VzIHdoZXJlIHRoaXMg
Zml4IGlzIG5lZWRlZCBpczogZ3Vlc3QgT1MgaXMgV2luZG93cyBhbmQgdGhlIGhvc3QgaGFzIHRo
ZSBsYXRlc3Qgc3RhYmxlIHZlcnNpb24gb2YgeGVuIGFuZCBxZW11LXhlbi10cmFkaXRpb25hbC4g
VXNpbmcgdGhpcyBlbnZpcm9ubWVudCwgc2V0dGluZyB1cCBhIFBDSSBkZXZpY2UgKHVzaW5nIE1T
SS9NU0ktWCBpbnRlcnJ1cHRzKSB3aWxsIG5vdCBzdWNjZXNzZnVsbHkgZmluaXNoLgoKT0ssIEkn
bSBzb2xkIG9uIGFwcGx5aW5nIHRoZSBwYXRjaCB0byBxZW11LXRyYWQuICBHcmVhdC4KCj4gVGhh
dCdzIHRoZSBsaW5rIHRvIHRoZSBwYXRjaCBmb3IgcWVtdS14ZW4tdHJhZGl0aW9uYWw6Cj4gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA2
L21zZzAxMjQ4Lmh0bWwKClJpZ2h0LCB0aGFua3MuCgo+IChodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDYvbXNnMDEzNzMuaHRtbCAtIGFk
ZGVkIHlvdSBpbiBDQykKClVuZm9ydHVuYXRlbHkgSSBkb24ndCB3YW50IHRvIGZpc2ggdGhlIHBh
dGNoIG91dCBvZiB0aGUgbWFpbGluZyBsaXN0CmFyY2hpdmVzIChiZWNhdXNlIHRoZSBjb252ZXJz
aW9uIGZyb20gZW1haWwgdG8gaHRtbCBhbmQgYmFjawpldGMuIG1pZ2h0IG1hbmdsZSBpdCkgYW5k
IHRoZSBlbWFpbCB3aXRoIHRoZSBDQyB0byBtZSBkaWRuJ3QgYWN0dWFsbHkKaGF2ZSB0aGUgcGF0
Y2ggaW4gaXQuCgpTbyBjYW4geW91IHBsZWFzZSByZXNlbmQgdGhlIGJhY2twb3J0ZWQgcGF0Y2gg
dG8gbWUgPyAgT3IgcG9pbnQgbWUgYXQKYSBnaXQgdHJlZSB0aGF0IGNvbnRhaW5zIHRoZSBiYWNr
cG9ydGVkIHBhdGNoID8KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
