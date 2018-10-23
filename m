From: Arun Sudhilal <getarunks@gmail.com>
Subject: Re: [PATCH] mm: convert totalram_pages,
 totalhigh_pages and managed_pages to atomic.
Date: Tue, 23 Oct 2018 10:16:51 +0530
Message-ID: <CABOM9Zpq41Ox8wQvsNjgfCtwuqh6CnyeW1B09DWa1TQN+JKf0w__41045.4714358368$1540270367$gmane$org@mail.gmail.com>
References: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
 <20181022181122.GK18839@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xvhh=nd=gmail.com=getarunks@srs-us1.protection.inumbo.net>)
 id 1gEoav-0001if-QF
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 04:47:05 +0000
Received: by mail-yb1-xb44.google.com with SMTP id v92-v6so24743ybi.5
 for <xen-devel@lists.xenproject.org>; Mon, 22 Oct 2018 21:47:04 -0700 (PDT)
In-Reply-To: <20181022181122.GK18839@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mhocko@kernel.org
Cc: snitzer@redhat.com, benh@kernel.crashing.org, kemi.wang@intel.com, dri-devel@lists.freedesktop.org, bfields@fieldses.org, linux-sctp@vger.kernel.org, paulus@samba.org, pavel@ucw.cz, cl@linux.com, kys@microsoft.com, sumit.semwal@linaro.org, David1.Zhou@amd.com, ptesarik@suse.com, mpe@ellerman.id.au, ceph-devel@vger.kernel.org, jejb@parisc-linux.org, kasan-dev@googlegroups.com, marcos.souza.org@gmail.com, steven.hill@cavium.com, rientjes@google.com, anthony.yznaga@oracle.com, neelx@redhat.com, guro@fb.com, len.brown@intel.com, linux-pm@vger.kernel.org, vbabka@suse.cz, linux-um@lists.infradead.org, rppt@linux.vnet.ibm.com, viro@zeniv.linux.org.uk, tglx@linutronix.de, trond.myklebust@hammerspace.com, anton@tuxera.com, linux-parisc@vger.kernel.org, malat@debian.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, cyrilbur@gma
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjIsIDIwMTggYXQgMTE6NDEgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24gMjItMTAtMTggMjI6NTM6MjIsIEFydW4gS1Mgd3Jv
dGU6Cj4gPiBSZW1vdmUgbWFuYWdlZF9wYWdlX2NvdW50X2xvY2sgc3BpbmxvY2sgYW5kIGluc3Rl
YWQgdXNlIGF0b21pYwo+ID4gdmFyaWFibGVzLgo+CgpIZWxsbyBNaWNoYWwsCj4gSSBhc3N1bWUg
dGhpcyBoYXMgYmVlbiBhdXRvLWdlbmVyYXRlZC4gSWYgeWVzLCBpdCB3b3VsZCBiZSBiZXR0ZXIg
dG8KPiBtZW50aW9uIHRoZSBzY3JpcHQgc28gdGhhdCBwZW9wbGUgY2FuIHJldmlldyBpdCBhbmQg
cmVnZW5lcmF0ZSBmb3IKPiBjb21wYXJpc2lvbi4gU3VjaCBhIGxhcmdlIGNoYW5nZSBpcyBoYXJk
IHRvIHJldmlldyBtYW51YWxseS4KCkNoYW5nZXMgd2VyZSBtYWRlIHBhcnRpYWxseSB3aXRoIHNj
cmlwdC4gIEZvciB0b3RhbHJhbV9wYWdlcyBhbmQKdG90YWxoaWdoX3BhZ2VzLAoKZmluZCBkaXIg
LXR5cGUgZiAtZXhlYyBzZWQgLWkKJ3MvdG90YWxyYW1fcGFnZXMvYXRvbWljX2xvbmdfcmVhZChc
JnRvdGFscmFtX3BhZ2VzKS9nJyB7fSBcOwpmaW5kIGRpciAtdHlwZSBmIC1leGVjIHNlZCAtaQon
cy90b3RhbGhpZ2hfcGFnZXMvYXRvbWljX2xvbmdfcmVhZChcJnRvdGFsaGlnaF9wYWdlcykvZycg
e30gXDsKCkZvciBtYW5hZ2VkX3BhZ2VzIGl0IHdhcyBtb3N0bHkgbWFudWFsIGVkaXRzIGFmdGVy
IHVzaW5nLApmaW5kIG1tLyAtdHlwZSBmIC1leGVjIHNlZCAtaQoncy96b25lLT5tYW5hZ2VkX3Bh
Z2VzL2F0b21pY19sb25nX3JlYWQoXCZ6b25lLT5tYW5hZ2VkX3BhZ2VzKS9nJyB7fQpcOwoKUmVn
YXJkcywKQXJ1bgoKPiAtLQo+IE1pY2hhbCBIb2Nrbwo+IFNVU0UgTGFicwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
