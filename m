From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 09/14] x86emul: also handle shifts
 through ->rmw()
Date: Thu, 15 Mar 2018 14:23:33 +0000
Message-ID: <e844d111-f01a-5d2b-60c7-5c6c2ae2bb78@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7E8B02000078001B228E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewTs9-0004a8-AE
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 14:28:49 +0000
In-Reply-To: <5AAA7E8B02000078001B228E@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTM6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZXNlIGRvbid0IGFsbG93
IExPQ0ssIGJ1dCBzdGlsbCBhcmUgcmVhZC1tb2RpZnktd3JpdGUgb3BlcmF0aW9ucywgc28KPiBh
cmUgYmV0dGVyIGhhbmRsZWQgdGhhdCB3YXkgdG9vLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
