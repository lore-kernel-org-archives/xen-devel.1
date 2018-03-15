From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 2/3] sndif: Add explicit back and front
 synchronization
Date: Thu, 15 Mar 2018 16:17:24 -0400
Message-ID: <20180315201724.GN10870__38891.26312356$1521144994$gmane$org@char.us.oracle.com>
References: <1521043365-26813-1-git-send-email-andr2000@gmail.com>
 <1521043365-26813-3-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wlzb=gf=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1ewZJr-0000bn-Eu
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:17:47 +0000
Content-Disposition: inline
In-Reply-To: <1521043365-26813-3-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, tiwai@suse.de, Clemens Ladisch <clemens@ladisch.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

PiArICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKgo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIEJh
Y2sgdG8gZnJvbnQgZXZlbnRzIGRlbGl2ZXJ5Cj4gKyAqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAr
ICogSW4gb3JkZXIgdG8gZGVsaXZlciBhc3luY2hyb25vdXMgZXZlbnRzIGZyb20gYmFjayB0byBm
cm9udCBhIHNoYXJlZCBwYWdlIGlzCj4gKyAqIGFsbG9jYXRlZCBieSBmcm9udCBhbmQgaXRzIGdy
YW50ZWQgcmVmZXJlbmNlIHByb3BhZ2F0ZWQgdG8gYmFjayB2aWEKPiArICogWGVuU3RvcmUgZW50
cmllcyAoZXZ0LXJpbmctcmVmL2V2dC1ldmVudC1jaGFubmVsKS4KPiArICogVGhpcyBwYWdlIGhh
cyBhIGNvbW1vbiBoZWFkZXIgdXNlZCBieSBib3RoIGZyb250IGFuZCBiYWNrIHRvIHN5bmNocm9u
aXplCj4gKyAqIGFjY2VzcyBhbmQgY29udHJvbCBldmVudCdzIHJpbmcgYnVmZmVyLCB3aGlsZSBi
YWNrIGJlaW5nIGEgcHJvZHVjZXIgb2YgdGhlCj4gKyAqIGV2ZW50cyBhbmQgZnJvbnQgYmVpbmcg
YSBjb25zdW1lci4gVGhlIHJlc3Qgb2YgdGhlIHBhZ2UgYWZ0ZXIgdGhlIGhlYWRlcgo+ICsgKiBp
cyB1c2VkIGZvciBldmVudCBwYWNrZXRzLgo+ICsgKgo+ICsgKiBVcG9uIHJlY2VwdGlvbiBvZiBh
biBldmVudChzKSBmcm9udCBtYXkgY29uZmlybSBpdHMgcmVjZXB0aW9uCj4gKyAqIGZvciBlaXRo
ZXIgZWFjaCBldmVudCwgZ3JvdXAgb2YgZXZlbnRzIG9yIG5vbmUuCj4gKyAqLwo+ICsKPiArc3Ry
dWN0IHhlbnNuZF9ldmVudF9wYWdlIHsKPiArICAgIHVpbnQzMl90IGluX2NvbnM7Cj4gKyAgICB1
aW50MzJfdCBpbl9wcm9kOwo+ICsgICAgdWludDhfdCByZXNlcnZlZFsyNF07CgpDb3VsZCB0aGlz
IGJlIGFsaWduZWQgYXQgNjQgYnl0ZXM/Cj4gK307Cj4gKwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
