From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/gntdev: Check and release imported
 dma-bufs on close
Date: Sun, 17 Feb 2019 11:40:06 +0100
Message-ID: <24e0b031-1ae1-ad6f-c5e1-73a326e7a515__36937.1584545419$1550400056$gmane$org@suse.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
 <20190214142321.1138-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=myTo=QY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gvJrl-0000EE-5s
 for xen-devel@lists.xenproject.org; Sun, 17 Feb 2019 10:40:09 +0000
In-Reply-To: <20190214142321.1138-2-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMjAxOSAxNToyMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+IAo+IENoZWNrIGlmIHRoZXJlIGFyZSBhbnkgaW1wb3J0ZWQgZG1hLWJ1ZnMgbGVmdCBu
b3QgcmVsZWFzZWQgYnkKPiB1c2VyLXNwYWNlIHdoZW4gZ3JhbnQgZGV2aWNlJ3MgcmVsZWFzZSBj
YWxsYmFjayBpcyBjYWxsZWQgYW5kCj4gZnJlZSB0aG9zZSBpZiB0aGlzIGlzIHRoZSBjYXNlLiBU
aGlzIGNhbiBoYXBwZW4gaWYgdXNlci1zcGFjZQo+IGxlYWtzIHRoZSBidWZmZXJzIGJlY2F1c2Ug
b2YgYSBidWcgb3IgYXBwbGljYXRpb24gaGFzIGJlZW4KPiB0ZXJtaW5hdGVkIGZvciBhbnkgcmVh
c29uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KCkFwcGxpZWQtdG86IHhlbi90aXAuZ2l0IGZvci1s
aW51cy01LjEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
