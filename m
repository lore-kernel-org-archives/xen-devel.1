From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxc/x86/PV: don't hand through CPUID leaf
 0x80000008 as is
Date: Fri, 25 May 2018 11:16:02 +0100
Message-ID: <fd715a3a-a4b5-7203-999d-bbf3a004b7fe@citrix.com>
References: <5B04019202000078001C4A53@prv1-mh.provo.novell.com>
 <20180522114150.74ba5djwfaawfmi2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j+m0=im=citrix.com=prvs=676bf93bc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fM9lX-000887-O6
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 10:16:07 +0000
In-Reply-To: <20180522114150.74ba5djwfaawfmi2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMTggMTI6NDEsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjIsIDIwMTgg
YXQgMDU6NDA6MDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEp1c3QgbGlrZSBmb3Ig
SFZNIHRoZSBmZWF0dXJlIHNldCBzaG91bGQgYmUgdXNlZCBmb3IgRUJYIG91dHB1dCwgd2hpbGUK
Pj4gRUFYIHNob3VsZCBiZSByZXN0cmljdGVkIHRvIHRoZSBsb3cgMTYgYml0cyBhbmQgRUNYL0VE
WCBzaG91bGQgYmUgemVyby4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IEkgd2lsbCBsZWF2ZSB0aGlzIHRvIEFuZHJldyBhbmQgeW91LgoKUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
