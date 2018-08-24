From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Fri, 24 Aug 2018 15:28:33 +0200
Message-ID: <86bd94d5-0ce8-c67f-07a5-ca9ebf399cdd__29170.4159499661$1535117253$gmane$org@gmail.com>
References: <20180824113248.GH29735@dhcp22.suse.cz>
 <b088e382-e90e-df63-a079-19b2ae2b985d@gmail.com>
 <20180824115226.GK29735@dhcp22.suse.cz>
 <a27ad1a3-34bd-6b7d-fd09-7737ec3c888d@gmail.com>
 <20180824120339.GL29735@dhcp22.suse.cz>
 <eb546bcb-9c5f-7d5d-43a7-bfde489f0e7f@amd.com>
 <20180824123341.GN29735@dhcp22.suse.cz>
 <b11df415-baf8-0a41-3c16-60dfe8d32bd3@amd.com>
 <20180824130132.GP29735@dhcp22.suse.cz>
 <23d071d2-82e4-9b78-1000-be44db5f6523@gmail.com>
 <20180824132442.GQ29735@dhcp22.suse.cz>
Reply-To: christian.koenig@amd.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7ql8=lh=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
 id 1ftC8k-0001HX-DS
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 13:28:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id u12-v6so6208947wrr.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 06:28:36 -0700 (PDT)
In-Reply-To: <20180824132442.GQ29735@dhcp22.suse.cz>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>, christian.koenig@amd.com
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Leon Romanovsky <leonro@mellanox.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>, LKML <linux-ker>
List-Id: xen-devel@lists.xenproject.org

QW0gMjQuMDguMjAxOCB1bSAxNToyNCBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPiBPbiBGcmkgMjQt
MDgtMTggMTU6MTA6MDgsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDI0LjA4LjIwMTgg
dW0gMTU6MDEgc2NocmllYiBNaWNoYWwgSG9ja286Cj4+PiBPbiBGcmkgMjQtMDgtMTggMTQ6NTI6
MjYsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gQW0gMjQuMDguMjAxOCB1bSAxNDozMyBz
Y2hyaWViIE1pY2hhbCBIb2NrbzoKPj4+IFsuLi5dCj4+Pj4+IFRoaWtpbmcgYWJvdXQgaXQgc29t
ZSBtb3JlLCBJIGNhbiBpbWFnaW5lIHRoYXQgYSBub3RpZmllciBjYWxsYmFjayB3aGljaAo+Pj4+
PiBwZXJmb3JtcyBhbiBhbGxvY2F0aW9uIG1pZ2h0IHRyaWdnZXIgYSBtZW1vcnkgcmVjbGFpbSBh
bmQgdGhhdCBpbiB0dXJuCj4+Pj4+IG1pZ2h0IHRyaWdnZXIgYSBub3RpZmllciB0byBiZSBpbnZv
a2VkIGFuZCByZWN1cnNlLiBCdXQgbm90aWZpZXIKPj4+Pj4gc2hvdWxkbid0IHJlYWxseSBhbGxv
Y2F0ZSBtZW1vcnkuIFRoZXkgYXJlIGNhbGxlZCBmcm9tIGRlZXAgTU0gY29kZQo+Pj4+PiBwYXRo
cyBhbmQgdGhpcyB3b3VsZCBiZSBleHRyZW1lbHkgZGVhZGxvY2sgcHJvbmUuIE1heWJlIEplcm9t
ZSBjYW4gY29tZQo+Pj4+PiB1cCBzb21lIG1vcmUgcmVhbGlzdGljIHNjZW5hcmlvLiBJZiBub3Qg
dGhlbiBJIHdvdWxkIHByb3Bvc2UgdG8gc2ltcGxpZnkKPj4+Pj4gdGhlIGxvY2tpbmcgaGVyZS4g
V2UgaGF2ZSBsb2NrZGVwIHRvIGNhdGNoIHNlbGYgZGVhZGxvY2tzIGFuZCBpdCBpcwo+Pj4+PiBh
bHdheXMgYmV0dGVyIHRvIGhhbmRsZSBhIHNwZWNpZmljIGlzc3VlIHJhdGhlciB0aGFuIGhhdmlu
ZyBhIGNvZGUKPj4+Pj4gd2l0aG91dCBhIGNsZWFyIGluZGljYXRpb24gaG93IGl0IGNhbiByZWN1
cnNlLgo+Pj4+IFdlbGwgSSBhZ3JlZSB0aGF0IHdlIHNob3VsZCBwcm9iYWJseSBmaXggdGhhdCwg
YnV0IEkgaGF2ZSBzb21lIGNvbmNlcm5zIHRvCj4+Pj4gcmVtb3ZlIHRoZSBleGlzdGluZyB3b3Jr
YXJvdW5kLgo+Pj4+Cj4+Pj4gU2VlIHdlIGFkZGVkIHRoYXQgdG8gZ2V0IHJpZCBvZiBhIHJlYWwg
cHJvYmxlbSBpbiBhIGN1c3RvbWVyIGVudmlyb25tZW50IGFuZAo+Pj4+IEkgZG9uJ3Qgd2FudCB0
byB0aGF0IHRvIHNob3cgdXAgYWdhaW4uCj4+PiBJdCB3b3VsZCByZWFsbHkgaGVscCB0byBrbm93
IG1vcmUgYWJvdXQgdGhhdCBjYXNlIGFuZCBmaXggaXQgcHJvcGVybHkKPj4+IHJhdGhlciB0aGFu
IHdvcmthcm91bmQgaXQgbGlrZSB0aGlzLiBBbnl3YXksIGxldCBtZSB0aGluayBob3cgdG8gaGFu
ZGxlCj4+PiB0aGUgbm9uLWJsb2NraW5nIG5vdGlmaWVyIGludm9jYXRpb24gdGhlbi4gSSB3YXMg
bm90IGFibGUgdG8gY29tZSB1cAo+Pj4gd2l0aCBhbnl0aGluZyByZW1vdGVseSBzYW5lIHlldC4K
Pj4gV2l0aCBhdm9pZGluZyBhbGxvY2F0aW5nIG1lbW9yeSBpbiB0aGUgd3JpdGUgbG9jayBwYXRo
IEkgZG9uJ3Qgc2VlIGFuIGlzc3VlCj4+IGFueSBtb3JlIHdpdGggdGhhdC4KPj4KPj4gQWxsIHdo
YXQgdGhlIHdyaXRlIGxvY2sgcGF0aCBkb2VzIG5vdyBpcyBhZGRpbmcgaXRlbXMgdG8gYSBsaW5r
ZWQgbGlzdHMsCj4+IGFycmF5cyBldGMuLi4uCj4gQ2FuIHdlIGNoYW5nZSBpdCB0byBub24tc2xl
ZXBhYmxlIGxvY2sgdGhlbj8KCk5vLCB0aGUgd3JpdGUgc2lkZSBkb2Vzbid0IHNsZWVwIGFueSBt
b3JlLCBidXQgdGhlIHJlYWQgc2lkZSBkb2VzLgoKU2VlIGFtZGdwdV9tbl9pbnZhbGlkYXRlX25v
ZGUoKSBhbmQgdGhhdCBpcyB3aGVyZSB5b3UgYWN0dWFsbHkgbmVlZCB0byAKaGFuZGxlIHRoZSBu
b24tYmxvY2tpbmcgZmxhZyBjb3JyZWN0bHkuCgpDaHJpc3RpYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
