From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/grant-table: Fix incorrect
 gnttab_dma_free_pages() pr_debug message
Date: Tue, 6 Nov 2018 10:36:15 +0100
Message-ID: <8ef30c47-ca0f-0a43-e05d-e7360ecbe4af__43320.9738381722$1541496901$gmane$org@suse.com>
References: <1541167463-32024-1-git-send-email-Liam.Merwick@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fm4z=nr=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gJxmT-0007gz-NP
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 09:36:17 +0000
In-Reply-To: <1541167463-32024-1-git-send-email-Liam.Merwick@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Liam Merwick <Liam.Merwick@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMjAxOCAxNTowNCwgTGlhbSBNZXJ3aWNrIHdyb3RlOgo+IElmIGEgY2FsbCB0byB4
ZW5tZW1fcmVzZXJ2YXRpb25faW5jcmVhc2UoKSBpbiBnbnR0YWJfZG1hX2ZyZWVfcGFnZXMoKQo+
IGZhaWxzIGl0IHRyaWdnZXJzIGEgbWVzc2FnZSAiRmFpbGVkIHRvIGRlY3JlYXNlIHJlc2VydmF0
aW9uLi4uIiB3aGljaAo+IHNob3VsZCBiZSAiRmFpbGVkIHRvIGluY3JlYXNlIHJlc2VydmF0aW9u
Li4uIgo+IAo+IEZpeGVzOiA5YmRjNzMwNGY1MzYgKCd4ZW4vZ3JhbnQtdGFibGU6IEFsbG93IGFs
bG9jYXRpbmcgYnVmZmVycyBzdWl0YWJsZSBmb3IgRE1BJykKPiBSZXBvcnRlZC1ieTogUm9zcyBQ
aGlsaXBzb24gPHJvc3MucGhpbGlwc29uQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGlh
bSBNZXJ3aWNrIDxsaWFtLm1lcndpY2tAb3JhY2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogTWFyayBL
YW5kYSA8bWFyay5rYW5kYUBvcmFjbGUuY29tPgoKUHVzaGVkIHRvIHhlbi5naXQgZm9yLWxpbnVz
LTQuMjBhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
