From: Chris Patterson <cjp256@gmail.com>
Subject: Re: [PATCH v2] x86/xen: init %gs very early to avoid
 page faults with stack protector
Date: Fri, 2 Feb 2018 13:34:01 -0500
Message-ID: <CABZSBQeJCCRk6bxzsR=omeJaNM8kCfJ=nhdASahqsxkmx+Sh8w__16183.8370528587$1517596405$gmane$org@mail.gmail.com>
References: <20180201124019.11693-1-jgross@suse.com>
 <b8f04374-97f1-76d5-81b5-3583441833f4@oracle.com>
 <CABZSBQcmKBGZ2-i-YRL=Ux6hcAP0peR1zfaVh4Go9vr=JTRThQ@mail.gmail.com>
 <3a4fa32b-7909-9fa6-4b6c-71d6b51ad35d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ttoa=e4=gmail.com=cjp256@srs-us1.protection.inumbo.net>)
 id 1ehgAL-0005uN-1q
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 18:34:25 +0000
Received: by mail-io0-x242.google.com with SMTP id f34so23896268ioi.13
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2018 10:34:22 -0800 (PST)
In-Reply-To: <3a4fa32b-7909-9fa6-4b6c-71d6b51ad35d@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMiwgMjAxOCBhdCAxMjo1NiBBTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBPbiAwMi8wMi8xOCAwMTozNiwgQ2hyaXMgUGF0dGVyc29uIHdyb3Rl
Ogo+PiBXb3JrcyBncmVhdCwgdGVzdGVkIGl0IGFuZCBpdCBmaXhlcyBib290aW5nIExpbnV4IHY0
LjE1IGtlcm5lbCBmb3IgbWUgOikKPgo+IENhbiBJIGFkZCB5b3VyICJUZXN0ZWQtYnk6IiB0byB0
aGUgcGF0Y2ggd2hlbiBjb21taXR0aW5nIGl0Pwo+Cj4KClN1cmUgdGhpbmcsIGhhdmUgYSBncmVh
dCBkYXkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
