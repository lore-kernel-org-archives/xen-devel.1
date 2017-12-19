From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] sched/null: skip vCPUs on the waitqueue
 that are blocked
Date: Tue, 19 Dec 2017 07:25:51 -0700
Message-ID: <5A392F7F020000780019876E@prv-mh.provo.novell.com>
References: <20171219141655.80982-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8j54=dp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eRIq5-0006gb-4B
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 14:25:49 +0000
In-Reply-To: <20171219141655.80982-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Dario Faggioli <raistlin@linux.it>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEyLjE3IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZF9u
dWxsLmMKPiBAQCAtNzgxLDYgKzc4MSwxMCBAQCBzdGF0aWMgc3RydWN0IHRhc2tfc2xpY2UgbnVs
bF9zY2hlZHVsZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCj4gICAgICAgICAgewo+ICAg
ICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KCB3dmMsICZwcnYtPndhaXRxLCB3YWl0cV9l
bGVtICkKPiAgICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgaWYgKCB0ZXN0X2JpdChf
VlBGX2Rvd24sICZ3dmMtPnZjcHUtPnBhdXNlX2ZsYWdzKSApCj4gKyAgICAgICAgICAgICAgICAg
ICAgLyogU2tpcCB2Q1BVcyB0aGF0IGFyZSBkb3duLiAqLwo+ICsgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwoKSWYgc3VjaCBhIGN1c3RvbSBjaGVjayBpcyBpbmRlZWQgbmVjZXNzYXJ5IGhl
cmUgKGxvb2tzIHRvIHJhdGhlciBiZQpzb21ldGhpbmcgZ2VuZXJpYyBzY2hlZHVsaW5nIGNvZGUg
c2hvdWxkIGJlIGRlYWxpbmcgd2l0aCksIHdoeQp3b3VsZCB5b3UgdGFrZSBpbnRvIGNvbnNpZGVy
YXRpb24gb25seSB0aGlzIG9uZSBWUEYgYml0PwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
