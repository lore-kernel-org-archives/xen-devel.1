From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Fri, 24 Aug 2018 15:10:08 +0200
Message-ID: <23d071d2-82e4-9b78-1000-be44db5f6523__11163.1916407079$1535116145$gmane$org@gmail.com>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <8cbfb09f-0c5a-8d43-1f5e-f3ff7612e289@I-love.SAKURA.ne.jp>
 <20180824113248.GH29735@dhcp22.suse.cz>
 <b088e382-e90e-df63-a079-19b2ae2b985d@gmail.com>
 <20180824115226.GK29735@dhcp22.suse.cz>
 <a27ad1a3-34bd-6b7d-fd09-7737ec3c888d@gmail.com>
 <20180824120339.GL29735@dhcp22.suse.cz>
 <eb546bcb-9c5f-7d5d-43a7-bfde489f0e7f@amd.com>
 <20180824123341.GN29735@dhcp22.suse.cz>
 <b11df415-baf8-0a41-3c16-60dfe8d32bd3@amd.com>
 <20180824130132.GP29735@dhcp22.suse.cz>
Reply-To: christian.koenig@amd.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7ql8=lh=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
 id 1ftBqw-0008DO-1a
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 13:10:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id m27-v6so7449316wrf.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 06:10:12 -0700 (PDT)
In-Reply-To: <20180824130132.GP29735@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jue
List-Id: xen-devel@lists.xenproject.org

QW0gMjQuMDguMjAxOCB1bSAxNTowMSBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPiBPbiBGcmkgMjQt
MDgtMTggMTQ6NTI6MjYsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDI0LjA4LjIwMTgg
dW0gMTQ6MzMgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gWy4uLl0KPj4+IFRoaWtpbmcgYWJvdXQg
aXQgc29tZSBtb3JlLCBJIGNhbiBpbWFnaW5lIHRoYXQgYSBub3RpZmllciBjYWxsYmFjayB3aGlj
aAo+Pj4gcGVyZm9ybXMgYW4gYWxsb2NhdGlvbiBtaWdodCB0cmlnZ2VyIGEgbWVtb3J5IHJlY2xh
aW0gYW5kIHRoYXQgaW4gdHVybgo+Pj4gbWlnaHQgdHJpZ2dlciBhIG5vdGlmaWVyIHRvIGJlIGlu
dm9rZWQgYW5kIHJlY3Vyc2UuIEJ1dCBub3RpZmllcgo+Pj4gc2hvdWxkbid0IHJlYWxseSBhbGxv
Y2F0ZSBtZW1vcnkuIFRoZXkgYXJlIGNhbGxlZCBmcm9tIGRlZXAgTU0gY29kZQo+Pj4gcGF0aHMg
YW5kIHRoaXMgd291bGQgYmUgZXh0cmVtZWx5IGRlYWRsb2NrIHByb25lLiBNYXliZSBKZXJvbWUg
Y2FuIGNvbWUKPj4+IHVwIHNvbWUgbW9yZSByZWFsaXN0aWMgc2NlbmFyaW8uIElmIG5vdCB0aGVu
IEkgd291bGQgcHJvcG9zZSB0byBzaW1wbGlmeQo+Pj4gdGhlIGxvY2tpbmcgaGVyZS4gV2UgaGF2
ZSBsb2NrZGVwIHRvIGNhdGNoIHNlbGYgZGVhZGxvY2tzIGFuZCBpdCBpcwo+Pj4gYWx3YXlzIGJl
dHRlciB0byBoYW5kbGUgYSBzcGVjaWZpYyBpc3N1ZSByYXRoZXIgdGhhbiBoYXZpbmcgYSBjb2Rl
Cj4+PiB3aXRob3V0IGEgY2xlYXIgaW5kaWNhdGlvbiBob3cgaXQgY2FuIHJlY3Vyc2UuCj4+IFdl
bGwgSSBhZ3JlZSB0aGF0IHdlIHNob3VsZCBwcm9iYWJseSBmaXggdGhhdCwgYnV0IEkgaGF2ZSBz
b21lIGNvbmNlcm5zIHRvCj4+IHJlbW92ZSB0aGUgZXhpc3Rpbmcgd29ya2Fyb3VuZC4KPj4KPj4g
U2VlIHdlIGFkZGVkIHRoYXQgdG8gZ2V0IHJpZCBvZiBhIHJlYWwgcHJvYmxlbSBpbiBhIGN1c3Rv
bWVyIGVudmlyb25tZW50IGFuZAo+PiBJIGRvbid0IHdhbnQgdG8gdGhhdCB0byBzaG93IHVwIGFn
YWluLgo+IEl0IHdvdWxkIHJlYWxseSBoZWxwIHRvIGtub3cgbW9yZSBhYm91dCB0aGF0IGNhc2Ug
YW5kIGZpeCBpdCBwcm9wZXJseQo+IHJhdGhlciB0aGFuIHdvcmthcm91bmQgaXQgbGlrZSB0aGlz
LiBBbnl3YXksIGxldCBtZSB0aGluayBob3cgdG8gaGFuZGxlCj4gdGhlIG5vbi1ibG9ja2luZyBu
b3RpZmllciBpbnZvY2F0aW9uIHRoZW4uIEkgd2FzIG5vdCBhYmxlIHRvIGNvbWUgdXAKPiB3aXRo
IGFueXRoaW5nIHJlbW90ZWx5IHNhbmUgeWV0LgoKV2l0aCBhdm9pZGluZyBhbGxvY2F0aW5nIG1l
bW9yeSBpbiB0aGUgd3JpdGUgbG9jayBwYXRoIEkgZG9uJ3Qgc2VlIGFuIAppc3N1ZSBhbnkgbW9y
ZSB3aXRoIHRoYXQuCgpBbGwgd2hhdCB0aGUgd3JpdGUgbG9jayBwYXRoIGRvZXMgbm93IGlzIGFk
ZGluZyBpdGVtcyB0byBhIGxpbmtlZCBsaXN0cywgCmFycmF5cyBldGMuLi4uCgpTbyB0aGVyZSBp
cyBubyBtb3JlIGJsb2NraW5nIGludm9sdmVkIGhlcmUgYW5kIHRoZSByZWFkIGxvY2sgc2lkZSBz
aG91bGQgCmJlIGFibGUgdG8gZ3JhYiB0aGUgbG9jayBpbW1lZGlhdGVseS4KCkNocmlzdGlhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
