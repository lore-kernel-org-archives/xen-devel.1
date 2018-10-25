From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [v3 04/12] x86/fsgsbase/64: Enable FSGSBASE
 instructions in the helper functions
Date: Thu, 25 Oct 2018 16:16:26 -0700
Message-ID: <CALCETrW1KJYL6mHGS8__ApTUGg7+o2nx_jCbDe6EzQ7gGurykQ__30984.8219891594$1540509328$gmane$org@mail.gmail.com>
References: <20181023184234.14025-1-chang.seok.bae@intel.com>
 <20181023184234.14025-5-chang.seok.bae@intel.com>
 <CALCETrVcJ08c6yf6y3ruOA_Hx_7srkHw5iYfx1c2p8_ySiL2WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q57w=nf=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1gForp-0002ez-BJ
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 23:16:41 +0000
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D6AF20873
 for <xen-devel@lists.xenproject.org>; Thu, 25 Oct 2018 23:16:39 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b14-v6so3063916wmj.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Oct 2018 16:16:38 -0700 (PDT)
In-Reply-To: <CALCETrVcJ08c6yf6y3ruOA_Hx_7srkHw5iYfx1c2p8_ySiL2WA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Lutomirski <luto@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, "Bae, Chang Seok" <chang.seok.bae@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, "Metzger, Markus T" <markus.t.metzger@intel.com>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMTI6MTYgUE0gQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMjMsIDIwMTggYXQgMTE6NDMgQU0gQ2hh
bmcgUy4gQmFlIDxjaGFuZy5zZW9rLmJhZUBpbnRlbC5jb20+IHdyb3RlOgoKPiA+ICsvKgo+ID4g
KyAqIEludGVycnVwdHMgYXJlIGRpc2FibGVkIGhlcmUuIE91dCBvZiBsaW5lIHRvIGJlIHByb3Rl
Y3RlZCBmcm9tIGtwcm9iZXMuCj4gPiArICovCj4gPiArc3RhdGljIG5vaW5saW5lIF9fa3Byb2Jl
cyB1bnNpZ25lZCBsb25nIHJkX2luYWN0aXZlX2dzYmFzZSh2b2lkKQo+ID4gK3sKPiA+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBnc2Jhc2UsIGZsYWdzOwo+ID4gKwo+ID4gKyAgICAgICBsb2NhbF9p
cnFfc2F2ZShmbGFncyk7Cj4gPiArICAgICAgIG5hdGl2ZV9zd2FwZ3MoKTsKPiA+ICsgICAgICAg
Z3NiYXNlID0gcmRnc2Jhc2UoKTsKPiA+ICsgICAgICAgbmF0aXZlX3N3YXBncygpOwo+ID4gKyAg
ICAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7Cj4gPiArCj4gPiArICAgICAgIHJldHVybiBn
c2Jhc2U7Cj4gPiArfQo+Cj4gUGxlYXNlIGZvbGQgdGhpcyBpbnRvIGl0cyBvbmx5IGNhbGxlciBh
bmQgbWFrZSAqdGhhdCogbm9pbmxpbmUuCj4KCk9uIGZ1cnRoZXIgcmVhZGluZyBvZiB0aGUgd2hv
bGUgc2VyaWVzLCBJIHJldHJhY3QgdGhpcyBwYXJ0aWN1bGFyCmNvbW1lbnQuICBCdXQgSSBkbyB0
aGluayB0aGF0IF9fcmRnc2Jhc2VfaW5hY3RpdmUoKSB3b3VsZCBiZSBhIGJldHRlcgpuYW1lLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
