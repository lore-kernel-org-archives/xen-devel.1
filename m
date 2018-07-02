From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Mon, 2 Jul 2018 14:56:29 +0200
Message-ID: <20180702125629.GR19043__34423.6464160078$1530536140$gmane$org@dhcp22.suse.cz>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <20180627074421.GF32348@dhcp22.suse.cz>
 <71f4184c-21ea-5af1-eeb6-bf7787614e2d@amd.com>
 <20180702115423.GK19043@dhcp22.suse.cz>
 <725cb1ad-01b0-42b5-56f0-c08c29804cb4@amd.com>
 <20180702122003.GN19043@dhcp22.suse.cz>
 <02d1d52c-f534-f899-a18c-a3169123ac7c@amd.com>
 <20180702123521.GO19043@dhcp22.suse.cz>
 <91ad1106-6bd4-7d2c-4d40-7c5be945ba36@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/git=js=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fZyNf-0001Uv-N4
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 12:56:35 +0000
Content-Disposition: inline
In-Reply-To: <91ad1106-6bd4-7d2c-4d40-7c5be945ba36@amd.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Dennis
List-Id: xen-devel@lists.xenproject.org

T24gTW9uIDAyLTA3LTE4IDE0OjM5OjUwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgpbLi4uXQo+
IE5vdCB3YW50aW5nIHRvIGJsb2NrIHNvbWV0aGluZyBhcyBpbXBvcnRhbnQgYXMgdGhpcywgc28g
ZmVlbCBmcmVlIHRvIGFkZCBhbgo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHRvIHRoZSBwYXRjaC4KClRoYW5rcyBhIGxvdCEKCj4gTGV0J3Mg
cmF0aGVyIGZhY2UgdGhlIG5leHQgdG9waWM6IEFueSBpZGVhIGhvdyB0byBydW50aW1lIHRlc3Qg
dGhpcz8KClRoaXMgaXMgYSBnb29kIHF1ZXN0aW9uIGluZGVlZC4gT25lIHdheSB0byBkbyB0aGF0
IHdvdWxkIGJlIHRyaWdnZXJpbmcKdGhlIE9PTSBraWxsZXIgZnJvbSB0aGUgY29udGV4dCB3aGlj
aCB1c2VzIGVhY2ggb2YgdGhlc2UgbW11IG5vdGlmaWVycwoob25lIGF0IHRoZSB0aW1lKSBhbmQg
c2VlIGhvdyB0aGF0IHdvcmtzLiBZb3Ugd291bGQgc2VlIHRoZSBub3RlIGluIHRoZQpsb2cgd2hl
bmV2ZXIgdGhlIG5vdGlmaWVyIHdvdWxkIGJsb2NrLiBUaGUgcHJpbWFyeSB0aGluZyB0byB0ZXN0
IGlzIGhvdwpvZnRlbiB0aGUgb29tIHJlYXBlciByZWFsbHkgaGFkIHRvIGJhY2sgb2ZmIGNvbXBs
ZXRlbHkuCgo+IEkgbWVhbiBJIGNhbiByYXRoZXIgZWFzaWx5IHByb3ZpZGUgYSB0ZXN0IHdoaWNo
IGNyYXNoZXMgYW4gQU1EIEdQVSwgd2hpY2ggaW4KPiB0dXJuIHRoZW4gd291bGQgbWVhbiB0aGF0
IHRoZSBNTVUgbm90aWZpZXIgd291bGQgYmxvY2sgZm9yZXZlciB3aXRob3V0IHRoaXMKPiBwYXRj
aC4KCldlbGwsIHlvdSBkbyBub3QgcmVhbGx5IGhhdmUgdG8gZ28gdGhhdCBmYXIuIEl0IHNob3Vs
ZCBiZSBzdWZmaWNpZW50IHRvCmRvIHRoZSBhYm92ZS4gVGhlIGN1cnJlbnQgY29kZSB3b3VsZCBz
aW1wbHkgYmFjayBvZiB3aXRob3V0IHJlbGVhc2luZwphbnkgbWVtb3J5LiBUaGUgcGF0Y2ggc2hv
dWxkIGhlbHAgdG8gcmVjbGFpbSBzb21lIG1lbW9yeS4KIAo+IEJ1dCBkbyB5b3Uga25vdyBhIHdh
eSB0byBsZXQgdGhlIE9PTSBraWxsZXIga2lsbCBhIHNwZWNpZmljIHByb2Nlc3M/CgpZZXMsIHlv
dSBjYW4gc2V0IGl0cyBvb21fc2NvcmVfYWRqIHRvIDEwMDAgd2hpY2ggbWVhbnMgYWx3YXlzIHNl
bGVjdAp0aGF0IHRhc2suCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
