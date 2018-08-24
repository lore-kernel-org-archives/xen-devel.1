From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Fri, 24 Aug 2018 14:03:39 +0200
Message-ID: <20180824120339.GL29735__36204.9051946544$1535112153$gmane$org@dhcp22.suse.cz>
References: <20180716115058.5559-1-mhocko@kernel.org>
 <8cbfb09f-0c5a-8d43-1f5e-f3ff7612e289@I-love.SAKURA.ne.jp>
 <20180824113248.GH29735@dhcp22.suse.cz>
 <b088e382-e90e-df63-a079-19b2ae2b985d@gmail.com>
 <20180824115226.GK29735@dhcp22.suse.cz>
 <a27ad1a3-34bd-6b7d-fd09-7737ec3c888d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qojz=lh=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1ftAob-0001Z8-5R
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 12:03:45 +0000
Content-Disposition: inline
In-Reply-To: <a27ad1a3-34bd-6b7d-fd09-7737ec3c888d@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: christian.koenig@amd.com
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Leon Romanovsky <leonro@mellanox.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juerg
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDI0LTA4LTE4IDEzOjU3OjUyLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI0
LjA4LjIwMTggdW0gMTM6NTIgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gPiBPbiBGcmkgMjQtMDgt
MTggMTM6NDM6MTYsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6ClsuLi5dCj4gPiA+IFRoYXQgd29u
J3Qgd29yayBsaWtlIHRoaXMgdGhlcmUgbWlnaHQgYmUgbXVsdGlwbGUKPiA+ID4gaW52YWxpZGF0
ZV9yYW5nZV9zdGFydCgpL2ludmFsaWRhdGVfcmFuZ2VfZW5kKCkgcGFpcnMgb3BlbiBhdCB0aGUg
c2FtZSB0aW1lLgo+ID4gPiBFLmcuIHRoZSBsb2NrIG1pZ2h0IGJlIHRha2VuIHJlY3Vyc2l2ZWx5
IGFuZCB0aGF0IGlzIGlsbGVnYWwgZm9yIGEKPiA+ID4gcndfc2VtYXBob3JlLgo+ID4gSSBhbSBu
b3Qgc3VyZSBJIGZvbGxvdy4gQXJlIHlvdSBzYXlpbmcgdGhhdCBvbmUgaW52YWxpZGF0ZV9yYW5n
ZSBtaWdodAo+ID4gdHJpZ2dlciBhbm90aGVyIG9uZSBmcm9tIHRoZSBzYW1lIHBhdGg/Cj4gCj4g
Tm8sIGJ1dCB3aGF0IGNhbiBoYXBwZW4gaXM6Cj4gCj4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydChB
LEIpOwo+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoQyxEKTsKPiAuLi4KPiBpbnZhbGlkYXRlX3Jh
bmdlX2VuZChDLEQpOwo+IGludmFsaWRhdGVfcmFuZ2VfZW5kKEEsQik7Cj4gCj4gR3JhYmJpbmcg
dGhlIHJlYWQgbG9jayB0d2ljZSB3b3VsZCBiZSBpbGxlZ2FsIGluIHRoaXMgY2FzZS4KCkkgYW0g
c29ycnkgYnV0IEkgc3RpbGwgZG8gbm90IGZvbGxvdy4gV2hhdCBpcyB0aGUgY29udGV4dCB0aGUg
dHdvIGFyZQpjYWxsZWQgZnJvbT8gQ2FuIHlvdSBnaXZlIG1lIGFuIGV4YW1wbGUuIEkgc2ltcGx5
IGRvIG5vdCBzZWUgaXQgaW4gdGhlCmNvZGUsIG1vc3RseSBiZWNhdXNlIEkgYW0gbm90IGZhbWls
aWFyIHdpdGggaXQuCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
