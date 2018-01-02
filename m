From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
 xen_init_time_ops()
Date: Tue, 2 Jan 2018 08:55:15 +0100
Message-ID: <00b48d2c-1691-53f8-1367-2c4e23e093dd__37052.5046404966$1514879680$gmane$org@suse.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dfvk=d5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eWHPx-00049r-2R
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 07:55:25 +0000
In-Reply-To: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMTIvMTcgMDM6NTAsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gVGhlIGhlYWRlciBk
ZWNsYXJlcyB0aGlzIGZ1bmN0aW9uIGFzIF9faW5pdCBidXQgaXMgZGVmaW5lZCBpbiBfX3JlZgo+
IHNlY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8bmljay5kZXNh
dWxuaWVyc0BnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
