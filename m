From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Fri, 24 Aug 2018 14:18:44 +0200
Message-ID: <eb546bcb-9c5f-7d5d-43a7-bfde489f0e7f__12971.5594616302$1535113082$gmane$org@amd.com>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <8cbfb09f-0c5a-8d43-1f5e-f3ff7612e289@I-love.SAKURA.ne.jp>
 <20180824113248.GH29735@dhcp22.suse.cz>
 <b088e382-e90e-df63-a079-19b2ae2b985d@gmail.com>
 <20180824115226.GK29735@dhcp22.suse.cz>
 <a27ad1a3-34bd-6b7d-fd09-7737ec3c888d@gmail.com>
 <20180824120339.GL29735@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=phfj=lh=amd.com=christian.koenig@srs-us1.protection.inumbo.net>)
 id 1ftB3Z-0002lG-Kz
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 12:19:14 +0000
In-Reply-To: <20180824120339.GL29735@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jue
List-Id: xen-devel@lists.xenproject.org

QW0gMjQuMDguMjAxOCB1bSAxNDowMyBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPiBPbiBGcmkgMjQt
MDgtMTggMTM6NTc6NTIsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDI0LjA4LjIwMTgg
dW0gMTM6NTIgc2NocmllYiBNaWNoYWwgSG9ja286Cj4+PiBPbiBGcmkgMjQtMDgtMTggMTM6NDM6
MTYsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gWy4uLl0KPj4+PiBUaGF0IHdvbid0IHdvcmsg
bGlrZSB0aGlzIHRoZXJlIG1pZ2h0IGJlIG11bHRpcGxlCj4+Pj4gaW52YWxpZGF0ZV9yYW5nZV9z
dGFydCgpL2ludmFsaWRhdGVfcmFuZ2VfZW5kKCkgcGFpcnMgb3BlbiBhdCB0aGUgc2FtZSB0aW1l
Lgo+Pj4+IEUuZy4gdGhlIGxvY2sgbWlnaHQgYmUgdGFrZW4gcmVjdXJzaXZlbHkgYW5kIHRoYXQg
aXMgaWxsZWdhbCBmb3IgYQo+Pj4+IHJ3X3NlbWFwaG9yZS4KPj4+IEkgYW0gbm90IHN1cmUgSSBm
b2xsb3cuIEFyZSB5b3Ugc2F5aW5nIHRoYXQgb25lIGludmFsaWRhdGVfcmFuZ2UgbWlnaHQKPj4+
IHRyaWdnZXIgYW5vdGhlciBvbmUgZnJvbSB0aGUgc2FtZSBwYXRoPwo+PiBObywgYnV0IHdoYXQg
Y2FuIGhhcHBlbiBpczoKPj4KPj4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydChBLEIpOwo+PiBpbnZh
bGlkYXRlX3JhbmdlX3N0YXJ0KEMsRCk7Cj4+IC4uLgo+PiBpbnZhbGlkYXRlX3JhbmdlX2VuZChD
LEQpOwo+PiBpbnZhbGlkYXRlX3JhbmdlX2VuZChBLEIpOwo+Pgo+PiBHcmFiYmluZyB0aGUgcmVh
ZCBsb2NrIHR3aWNlIHdvdWxkIGJlIGlsbGVnYWwgaW4gdGhpcyBjYXNlLgo+IEkgYW0gc29ycnkg
YnV0IEkgc3RpbGwgZG8gbm90IGZvbGxvdy4gV2hhdCBpcyB0aGUgY29udGV4dCB0aGUgdHdvIGFy
ZQo+IGNhbGxlZCBmcm9tPwoKSSBkb24ndCBoYXZlIHRoZSBzbGlnaHRlc3QgaWRlYS4KCj4gQ2Fu
IHlvdSBnaXZlIG1lIGFuIGV4YW1wbGUuIEkgc2ltcGx5IGRvIG5vdCBzZWUgaXQgaW4gdGhlCj4g
Y29kZSwgbW9zdGx5IGJlY2F1c2UgSSBhbSBub3QgZmFtaWxpYXIgd2l0aCBpdC4KCkknbSBuZWl0
aGVyLgoKV2Ugc3R1bWJsZWQgb3ZlciB0aGF0IGJ5IHB1cmUgb2JzZXJ2YXRpb24gYW5kIGFmdGVy
IGRpc2N1c3NpbmcgdGhlIApwcm9ibGVtIHdpdGggSmVyb21lIGNhbWUgdXAgd2l0aCB0aGlzIHNv
bHV0aW9uLgoKTm8gaWRlYSB3aGVyZSBleGFjdGx5IHRoYXQgY2FzZSBjb21lcyBmcm9tLCBidXQg
SSBjYW4gY29uZmlybSB0aGF0IGl0IAppbmRlZWQgaGFwcGVucy4KClJlZ2FyZHMsCkNocmlzdGlh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
