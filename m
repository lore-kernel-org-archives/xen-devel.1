From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2] x86/mem-sharing: statically initialize
 audit list head and lock
Date: Thu, 11 Apr 2019 07:14:16 -0600
Message-ID: <CABfawhk3-8RO1m-jMGsMtfDkZQjy14BYj=wG5FzKgJYyuzi2Kw@mail.gmail.com>
References: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O6VX=SN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEZXc-0002Cs-Sm
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:14:56 +0000
Received: by mail-wm1-f48.google.com with SMTP id z24so6691458wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 06:14:54 -0700 (PDT)
In-Reply-To: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMTI6NTEgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBleGVjdXRlIGFueSBpbnN0cnVj
dGlvbnMgZm9yIGRvaW5nIHNvLiBEcm9wIHRoZSB0aGVuCj4gZWZmZWN0aXZlbHkgZW1wdHkgbWVt
X3NoYXJpbmdfaW5pdCgpIGFsdG9nZXRoZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
