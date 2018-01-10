From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 34/74] x86/guest: add PV console code
Date: Wed, 10 Jan 2018 08:55:13 -0700
Message-ID: <5A564571020000780019D4A7@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-35-wei.liu2@citrix.com>
 <5A4FA656020000780019B721@prv-mh.provo.novell.com>
 <20180110153348.pkngh2lcgaxd2bdh@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2bb6=ef=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eZIij-0003Lm-M5
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 15:55:17 +0000
In-Reply-To: <20180110153348.pkngh2lcgaxd2bdh@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, Xen-devel <xen-devel@lists.xenproject.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjAxLjE4IGF0IDE2OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkndmUgc3Bva2VuIHRvIFNlcmdleSBhbmQgaGUgYWdyZWVzIHRoYXQgdGhpcyBzaG91bGQgYmUg
c29sdmVkIGFuZAo+IHRoYXQgdXNpbmcgdWFydF9kcml2ZXIgc2VlbXMgbGlrZSB0aGUgcmlnaHQg
YXBwcm9hY2guCj4gCj4gSG93ZXZlciBnaXZlbiB0aGF0IHdlIHdvdWxkIGxpa2UgdG8gbWVyZ2Ug
dGhpcyBBU0FQLCBkbyB5b3UgY29uc2lkZXIKPiB0aGlzIGEgYmxvY2tlcj8KCk5vLgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
