From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 05/16] gic-vgic: Drop an excessive clear_lrs
Date: Wed, 12 Dec 2018 11:55:41 +0000
Message-ID: <3aaafb98-4cb5-13bf-efa4-f3313003c46a@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-6-git-send-email-andrii.anisov@gmail.com>
 <ef5e171c-22a6-84a4-abcb-94eb843a68eb@arm.com>
 <03382897-5729-fce8-4133-d83c2e776f7a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX37B-00068Z-FG
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 11:55:45 +0000
In-Reply-To: <03382897-5729-fce8-4133-d83c2e776f7a@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xMi8yMDE4IDExOjAxLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAxMS4xMi4xOCAxNjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+PiBXaXRo
ICNpZm5kZWYgTkRFQlVHIGFuZCB0aGUgYXBwcm9wcmlhdGUgY29tbWVudDoKPiBXaWxsIGRvLgo+
Pgo+PiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBU
aGFuayB5b3UuCj4gCj4+IEZlZWwgZnJlZSB0byByZXNlbnQgaXQgYWxvbmUgc28gaXQgY2FuIGJl
IG1lcmdlZCB0byBYZW4gNC4xMi4KPiBXaGF0IGFib3V0IGdldHRpbmcgaXQgdG9nZXRoZXIgd2l0
aCAiW1JGQyAxMS8xNl0gaXJxOiBza2lwIGFjdGlvbiBhdmFsYWJpbGl0eSAKPiBjaGVjayBmb3Ig
Z3Vlc3QncyBJUlEiPwoKSSBhbSBmaW5lIHdpdGggdGhhdCA6KS4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
