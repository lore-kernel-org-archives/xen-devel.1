From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxc/x86/PV: don't hand through CPUID leaf
 0x80000008 as is
Date: Fri, 25 May 2018 11:17:01 +0100
Message-ID: <23303.58013.503249.298188@mariner.uk.xensource.com>
References: <5B04019202000078001C4A53@prv1-mh.provo.novell.com>
 <20180522114150.74ba5djwfaawfmi2@citrix.com>
 <fd715a3a-a4b5-7203-999d-bbf3a004b7fe@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=igij=im=citrix.com=prvs=6765940ff=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fM9mU-0008BH-23
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 10:17:06 +0000
In-Reply-To: <fd715a3a-a4b5-7203-999d-bbf3a004b7fe@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4Yy94ODYvUFY6IGRvbid0IGhh
bmQgdGhyb3VnaCBDUFVJRCBsZWFmIDB4ODAwMDAwMDggYXMgaXMiKToKPiBPbiAyMi8wNS8xOCAx
Mjo0MSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDIyLCAyMDE4IGF0IDA1OjQwOjAy
QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IEp1c3QgbGlrZSBmb3IgSFZNIHRoZSBm
ZWF0dXJlIHNldCBzaG91bGQgYmUgdXNlZCBmb3IgRUJYIG91dHB1dCwgd2hpbGUKPiA+PiBFQVgg
c2hvdWxkIGJlIHJlc3RyaWN0ZWQgdG8gdGhlIGxvdyAxNiBiaXRzIGFuZCBFQ1gvRURYIHNob3Vs
ZCBiZSB6ZXJvLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+ID4gSSB3aWxsIGxlYXZlIHRoaXMgdG8gQW5kcmV3IGFuZCB5b3UuCj4gCj4g
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpU
aGFua3MuICBJIGhhdmUgcXVldWVkIHRoaXMgYW5kIHdpbGwgcHVzaCBpdCB3aGVuIHRoZSBjb21t
aXQKbW9yYXRvcml1bSBpcyBvdmVyLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
