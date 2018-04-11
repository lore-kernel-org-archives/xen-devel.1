From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before
 suspend
Date: Wed, 11 Apr 2018 13:53:50 +0200
Message-ID: <20180411115350.lvx5yaevoq6arwg3__2575.93974606625$1523447569$gmane$org@gmail.com>
References: <20180226140818.4849-1-jgross@suse.com>
 <5AA8F00302000078001B15EE@suse.com>
 <6b59ac31-7e90-1c18-2467-d7d294da6e5b@suse.com>
 <5ACDEE5B02000078001BA2DE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zyni=ha=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1f6EK4-0005oQ-J7
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 11:53:56 +0000
Received: by mail-wm0-x236.google.com with SMTP id x4so3233460wmh.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Apr 2018 04:53:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5ACDEE5B02000078001BA2DE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

CiogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKCj4gQWRkaXRpb25hbGx5
LCB4ODYgbWFpbnRhaW5lcnM6IGlzIHRoZXJlIGEgcGFydGljdWxhciByZWFzb24gdGhpcyAob3IK
PiBhbnkgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgcGF0Y2gpIGlzbid0IHVwc3RyZWFtIHlldD8g
QXMgaW5kaWNhdGVkCj4gYmVmb3JlLCBJIGhhZCBub3QgYmVlbiBhYmxlIHRvIGZpbmQgYW55IGRp
c2N1c3Npb24sIGFuZCBoZW5jZSBJCj4gc2VlIG5vIHJlYXNvbiB3aHkgdGhpcyBpcyBhIHBhdGNo
IHdlIGVmZmVjdGl2ZWx5IGNhcnJ5IHByaXZhdGVseSBpbgo+IG91ciBkaXN0cm8gYnJhbmNoZXMg
KGFuZCBsaWtlbHkgb3RoZXIgZGlzdHJvcyBkbyBzbyB0b28pLgoKVGhlIHBhdGNoIHdhcyBtZXJn
ZWQgNiB3ZWVrcyBhZ28gYW5kIGlzIG5vdyB1cHN0cmVhbToKCiAgNzFjMjA4ZGQ1NGFiOiB4ODYv
eGVuOiBaZXJvIE1TUl9JQTMyX1NQRUNfQ1RSTCBiZWZvcmUgc3VzcGVuZAoKVGhhbmtzLAoKCUlu
Z28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
