From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] xen: set cpu capabilities from
 xen_start_kernel()
Date: Wed, 11 Jul 2018 11:46:28 +0200
Message-ID: <b1933a71-360e-c046-a6aa-42e4b047bcbd__18867.9520659663$1531302321$gmane$org@suse.com>
References: <20180530110958.19413-1-jgross@suse.com>
 <20180530110958.19413-3-jgross@suse.com>
 <1531300502.8759.24.camel@amazon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nw1x=j3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fdBhg-0005s7-QM
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 09:46:32 +0000
In-Reply-To: <1531300502.8759.24.camel@amazon.co.uk>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Woodhouse, David" <dwmw@amazon.co.uk>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "Veith,
 Simon" <sveith@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTE6MTUsIFdvb2Rob3VzZSwgRGF2aWQgd3JvdGU6Cj4gT24gV2VkLCAyMDE4
LTA1LTMwIGF0IDEzOjA5ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBUaGVyZSBpcyBu
byBuZWVkIHRvIHNldCB0aGUgc2FtZSBjYXBhYmlsaXRpZXMgZm9yIGVhY2ggY3B1Cj4+IGluZGl2
aWR1YWxseS4gVGhpcyBjYW4gZWFzaWx5IGJlIGRvbmUgZm9yIGFsbCBjcHVzIHdoZW4gc3RhcnRp
bmcgdGhlCj4+IGtlcm5lbC4KPj4KPj4gVXBzdHJlYW0gY29tbWl0OiAwODA4ZTgwY2I3NjBkZTI3
MzNjMDUyN2QyMDkwZWQyMjA1YTFlZWY4ICgieGVuOiBzZXQKPj4gY3B1IGNhcGFiaWxpdGllcyBm
cm9tIHhlbl9zdGFydF9rZXJuZWwoKSIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gCj4gVGhhdCBicmVha3MgUFYgZ3Vlc3RzIGJlY2F1
c2UgdGhleSBnZXQgS0FJU0VSIGVuYWJsZWQg4oCUIHdoZW4KPiBrYWlzZXJfY2hlY2tfYm9vdHRp
bWVfZGlzYWJsZSgpIHJ1bnMsIFg4Nl9GRUFUVVJFX1hFTlBWIGlzbid0IHNldC4KCldoaWNoIGtl
cm5lbCB2ZXJzaW9uIGFyZSB5b3UgdGFsa2luZyBhYm91dD8KCldpdGggdXBzdHJlYW0gY29tbWl0
IDYwZDM0NTAxNjc0MzNmMmQwOTljZTI4NjlkYzUyZGQ5ZTdkYzliMjkgd2hpY2ggd2lsbApiZSBw
YXJ0IG9mIG5leHQgc3RhYmxlLTQuOSBldmVyeXRoaW5nIGlzIGZpbmUuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
