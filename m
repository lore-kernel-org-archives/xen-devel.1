From: "Huang\, Ying" <ying.huang@intel.com>
Subject: Re: [PATCH] mm: convert totalram_pages,
 totalhigh_pages and managed_pages to atomic.
Date: Tue, 23 Oct 2018 13:37:01 +0800
Message-ID: <874lddxlz6.fsf__18636.6684422412$1540273460$gmane$org@yhuang-dev.intel.com>
References: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nslj=nd=intel.com=ying.huang@srs-us1.protection.inumbo.net>)
 id 1gEpNi-0006HH-Qt
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 05:37:30 +0000
In-Reply-To: <1540229092-25207-1-git-send-email-arunks@codeaurora.org> (Arun
 KS's message of "Mon, 22 Oct 2018 22:53:22 +0530")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: Mike Snitzer <snitzer@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kemi Wang <kemi.wang@intel.com>, dri-devel@lists.freedesktop.org, "J. Bruce Fields" <bfields@fieldses.org>, linux-sctp@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Petr Tesarik <ptesarik@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, ceph-devel@vger.kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com, Marcos Paulo de Souza <marcos.souza.org@gmail.com>, "Steven J. Hill" <steven.hill@cavium.com>, David Rientjes <rientjes@google.com>, Anthony Yznaga <anthony.yznaga@oracle.com>, Daniel Vacek <neelx@redhat.com>, Roman Gushchin <guro@fb.com>, Len Brown <len.>
List-Id: xen-devel@lists.xenproject.org

QXJ1biBLUyA8YXJ1bmtzQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cgo+IFJlbW92ZSBtYW5hZ2Vk
X3BhZ2VfY291bnRfbG9jayBzcGlubG9jayBhbmQgaW5zdGVhZCB1c2UgYXRvbWljCj4gdmFyaWFi
bGVzLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBT
dWdnZXN0ZWQtYnk6IFZsYXN0aW1pbCBCYWJrYSA8dmJhYmthQHN1c2UuY3o+Cj4gU2lnbmVkLW9m
Zi1ieTogQXJ1biBLUyA8YXJ1bmtzQGNvZGVhdXJvcmEub3JnPgo+Cj4gLS0tCj4gQXMgZGlzY3Vz
c2VkIGhlcmUsCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDYyNzUyMS8j
MjIyNjEyNTMKCk15IDIgY2VudHMuICBJIHRoaW5rIHlvdSBzaG91bGQgaW5jbHVkZSBhdCBsZWFz
dCBwYXJ0IG9mIHRoZSBkaXNjdXNzaW9uCmluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbiB0byBtYWtl
IGl0IG1vcmUgcmVhZGFibGUgYnkgaXRzZWxmLgoKQmVzdCBSZWdhcmRzLApIdWFuZywgWWluZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
