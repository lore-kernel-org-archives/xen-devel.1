From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] SVM: make nested page-fault tracing and
 logging consistent
Date: Wed, 6 Feb 2019 11:49:19 -0500
Message-ID: <d4d89996-2772-1fba-e491-5f4efba4aafd@oracle.com>
References: <5C5AC36202000078002143D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=maq7=QN=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1grQOB-0004mZ-TX
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 16:49:31 +0000
In-Reply-To: <5C5AC36202000078002143D7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi82LzE5IDY6MjIgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IERvbid0IGNhbGwgX19nZXRf
Z2ZuX3R5cGVfYWNjZXNzKCkgbW9yZSB0aGFuIG9uY2UsIHRvIG1ha2Ugc3VyZSBkYXRhCj4gcmVj
b3JkZWQgZm9yIHhlbnRyYWNlIG1hdGNoZXMgdXAgd2l0aCB3aGF0IGdldHMgbG9nZ2VkIGluIGNh
c2Ugb2YgdGhlCj4gZG9tYWluIGdldHRpbmcgY3Jhc2hlZC4KPgo+IEFzIGEgc2lkZSBlZmZlY3Qg
dGhpcyBhbHNvIGVsaW1pbmF0ZXMgYSB0eXBlIG1pc21hdGNoIHJlcG9ydGVkIGJ5Cj4gTm9yYmVy
dCBNYW50aGV5LCBhcyB0aGUgZmlyc3QgY2FsbCBub3cgYWxzbyBuZWVkcyB0byB1cGRhdGUgdGhl
IGxvY2FsCj4gdmFyaWFibGUgInAybXQiLgo+Cj4gRG8gYSBmZXcgY29zbWV0aWNzIGF0IHRoZSBz
YW1lIHRpbWU6IE1vdmUgYSBjb21tZW50IHVwIGEgbGl0dGxlLCBkcm9wCj4gdGhlIHBvaW50bGVz
cyAiY2FzZSAwIiAoc2VlaW5nIGluIHBhcnRpY3VsYXIgdGhlIGNvbW1lbnQncyB3b3JkaW5nKSwK
PiBhbmQgY29ycmVjdCBmb3JtYXR0aW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
