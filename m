From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 09/16] os-posix: cleanup:
 Replace fprintfs with error_report in change_process_uid
Date: Tue, 24 Apr 2018 20:09:27 +0100
Message-ID: <CAFEAcA_6+o=r4VPr69iJc7x19NZJR8Tow1QkTuSyyWTDGPuT_Q__14920.8227791407$1524596939$gmane$org@mail.gmail.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-10-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f8zj=hn=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1fB3K1-0002Cu-8w
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 19:09:49 +0000
Received: by mail-ot0-x241.google.com with SMTP id t1-v6so2639053oth.8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 12:09:48 -0700 (PDT)
In-Reply-To: <1524592709-6553-10-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQgQXByaWwgMjAxOCBhdCAxODo1OCwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+IHdyb3RlOgo+IEknbSBnb2luZyB0byBiZSBlZGl0aW5nIHRoaXMgZnVuY3Rpb24g
YW5kIGl0IG1ha2VzIHNlbnNlIHRvIGNsZWFuIHVwCj4gdGhpcyBzdHlsZSBwcm9ibGVtIGluIGFk
dmFuY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0
cml4LmNvbT4KPiBDQzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiBDQzog
TWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgo+IENDOiBEYW5pZWwgUC4gQmVy
cmFuZ2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cj4gQ0M6IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRs
cy5tc2sucnU+Cj4gLS0tCgpSZXZpZXdlZC1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPgoKdGhhbmtzCi0tIFBNTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
