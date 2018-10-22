From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm: convert totalram_pages,
 totalhigh_pages and managed_pages to atomic.
Date: Mon, 22 Oct 2018 20:11:22 +0200
Message-ID: <20181022181122.GK18839__32179.219046566$1540270228$gmane$org@dhcp22.suse.cz>
References: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5klz=nc=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gEeg1-0003CZ-OO
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 18:11:41 +0000
Content-Disposition: inline
In-Reply-To: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: Mike Snitzer <snitzer@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kemi Wang <kemi.wang@intel.com>, dri-devel@lists.freedesktop.org, "J. Bruce Fields" <bfields@fieldses.org>, linux-sctp@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Petr Tesarik <ptesarik@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, ceph-devel@vger.kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, "Steven J. Hill" <steven.hill@cavium.com>, David Rientjes <rientjes@google.com>, Anthony Yznaga <anthony.yznaga@oracle.com>, Daniel Vacek <neelx@redhat.com>, Roman Gushchin <guro@fb.com>, Len Brown <len.b>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uIDIyLTEwLTE4IDIyOjUzOjIyLCBBcnVuIEtTIHdyb3RlOgo+IFJlbW92ZSBtYW5hZ2Vk
X3BhZ2VfY291bnRfbG9jayBzcGlubG9jayBhbmQgaW5zdGVhZCB1c2UgYXRvbWljCj4gdmFyaWFi
bGVzLgoKSSBhc3N1bWUgdGhpcyBoYXMgYmVlbiBhdXRvLWdlbmVyYXRlZC4gSWYgeWVzLCBpdCB3
b3VsZCBiZSBiZXR0ZXIgdG8KbWVudGlvbiB0aGUgc2NyaXB0IHNvIHRoYXQgcGVvcGxlIGNhbiBy
ZXZpZXcgaXQgYW5kIHJlZ2VuZXJhdGUgZm9yCmNvbXBhcmlzaW9uLiBTdWNoIGEgbGFyZ2UgY2hh
bmdlIGlzIGhhcmQgdG8gcmV2aWV3IG1hbnVhbGx5LgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFi
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
